# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
-include vendor/htc/msm8226-common/BoardConfigVendor.mk

LOCAL_PATH := device/htc/msm8226-common

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_KINGFISHER_OPTIMIZATION := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := caf
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Board
BOARD_VENDOR := htc
TARGET_BOARD_PLATFORM := msm8226

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Camera
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0}, {"persist.camera.", AID_MEDIA, 0},'
USE_DEVICE_SPECIFIC_CAMERA := true

# Flags
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf-new
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# RIL
BOARD_PROVIDES_LIBRIL := true

# RPC
TARGET_NO_RPC := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hci_init.te \
    healthd.te \
    init_shell.te \
    init.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_socket.te \
    wpa.te

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
