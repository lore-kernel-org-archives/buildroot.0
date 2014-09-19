From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:20:24 +0200
Subject: [Buildroot] [PATCH 04/14] package/linux-firmware: add Intel SST
 DSP (Baytrail audio)
In-Reply-To: <f9f90395969b9de0d20ea0cb7b09b0868ba90d6d.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
 <f9f90395969b9de0d20ea0cb7b09b0868ba90d6d.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <20140919212024.GD4155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-09-19 23:14 +0200, Yann E. MORIN spake thusly:
> We introduce the new "Audio" firmware category for the firmware.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Seems I borked that patch during a rebase. Forget the series, I'll
re-push later.

Sorry... :-/

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/Config.in         | 18 ++++++++++++++++--
>  package/linux-firmware/linux-firmware.mk | 18 ++++++++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index b909d2b..21d2d5d 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -8,6 +8,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE
>  
>  if BR2_PACKAGE_LINUX_FIRMWARE
>  
> +menu "Audio firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
> +	bool "Intel SST DSP"
> +	help
> +	  Firmware files for Intel Baytrail SST DSP audio.
> +
> +endmenu # Audio
> +
>  menu "WiFi firmware"
>  
>  config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
> @@ -127,15 +136,20 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
>  	  Realtek 8712/8723/8723be
>  
>  config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
> -	bool "TI wl127X"
> +	bool "TI wl127x"
>  	help
>  	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
>  
>  config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
> -	bool "TI wl128X"
> +	bool "TI wl128x"
>  	help
>  	  Firmware files for WLAN and Bluetooth modules wl128x
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
> +	bool "TI wl18xx"
> +	help
> +	  Firmware files for WLAN and Bluetooth modules wl18xx
> +
>  endmenu
>  
>  menu "Ethernet firmware"
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 32e1609..0f3b150 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -8,6 +8,12 @@ LINUX_FIRMWARE_VERSION = f66291398181d24856fd2d19454d246199abd5ea
>  LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>  LINUX_FIRMWARE_SITE_METHOD = git
>  
> +# Intel SST DSP
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
> +LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
> +endif
> +
>  # rt2501/rt61
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
>  LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
> @@ -133,6 +139,18 @@ LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>  endif
>  
> +# wl18xx
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
> +LINUX_FIRMWARE_FILES += \
> +	ti-connectivity/wl18xx-fw.bin \
> +	ti-connectivity/wl18xx-conf.bin \
> +	ti-connectivity/wl18xx-fw-2.bin \
> +	ti-connectivity/wl18xx-fw-3.bin \
> +	ti-connectivity/wl18xx-fw-4.bin \
> +	ti-connectivity/TIInit_7.2.31.bts
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
>  LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
