From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 26 Jan 2012 16:16:23 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <4F216E47.4070604@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.01.2012 16:13, schrieb yegorslists at googlemail.com:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> add infrastructure for closed binary blobs
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> v4:
> 	sort menu options (Gustavo Zacarias)
> 	use LINUX_FIRMWARE_FILES to hold all install targets (Gustavo Zacarias)
> v3:
> 	typo fix (Michael S. Zick)
> v2: 
> 	change package name from firmware to linux-firmware (Gustavo Zacarias)
> 	create more granular options (Gustavo Zacarias)
>  package/Config.in                        |    1 +
>  package/linux-firmware/Config.in         |   46 ++++++++++++++++++++++++
>  package/linux-firmware/linux-firmware.mk |   56 ++++++++++++++++++++++++++++++
>  3 files changed, 103 insertions(+), 0 deletions(-)
>  create mode 100644 package/linux-firmware/Config.in
>  create mode 100644 package/linux-firmware/linux-firmware.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f219e37..10f9f79 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -185,6 +185,7 @@ source "package/input-tools/Config.in"
>  source "package/iostat/Config.in"
>  source "package/irda-utils/Config.in"
>  source "package/kbd/Config.in"
> +source "package/linux-firmware/Config.in"
>  source "package/lm-sensors/Config.in"
>  source "package/lsuio/Config.in"
>  source "package/lvm2/Config.in"
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> new file mode 100644
> index 0000000..b4fa645
> --- /dev/null
> +++ b/package/linux-firmware/Config.in
> @@ -0,0 +1,46 @@
> +config BR2_PACKAGE_LINUX_FIRMWARE
> +	bool "linux-firmware"
> +	help
> +	  This package provides various binary firmware files 
> +	  (closed binary blobs) for such devices like LAN, WLAN cards etc.
> +
> +if BR2_PACKAGE_LINUX_FIRMWARE
> +
> +menu "Devices"
> +
> +menu "Ralink"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
> +	bool "Ralink rt2501/rt61"
> +	help
> +	  Ralink rt2501/rt61
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73
> +	bool "Ralink rt73"
> +	help
> +	  Ralink rt73
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
> +	bool "Ralink rt27xx/rt28xx/rt30xx"
> +	help
> +	  Ralink rt27xx/rt28xx/rt30xx
> +
> +endmenu
> +
> +menu "Texas Instruments"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
> +	bool "wl127X"
> +	help
> +	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
> +	bool "wl128X"
> +	help
> +	  Firmware files for WLAN and Bluetooth modules wl128x
> +
> +endmenu
> +
> +endmenu
> +
> +endif
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> new file mode 100644
> index 0000000..af48d13
> --- /dev/null
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -0,0 +1,56 @@
> +#############################################################
> +#
> +# linux-firmware
> +#
> +#############################################################
> +LINUX_FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
> +LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> +LINUX_FIRMWARE_SITE_METHOD = git
> +
> +# rt2501/rt61
> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61) += \
> +	rt2561.bin rt2561s.bin rt2661.bin LICENCE.ralink-firmware.txt 
> +
> +
> +# rt73
> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73) += \
> +	rt73.bin LICENCE.ralink-firmware.txt 
> +
> +# rt2xx
> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
> +	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
> +	LICENCE.ralink-firmware.txt 
> +
> +# wl127x
> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
> +	ti-connectivity/wl1271-fw-2.bin				\
> +	ti-connectivity/wl1271-fw-ap.bin			\
> +	ti-connectivity/wl1271-fw.bin				\
> +	ti-connectivity/wl1271-nvs.bin				\
> +	ti-connectivity/wl127x-fw-3.bin				\
> +	ti-connectivity/wl127x-fw-plt-3.bin			\
> +	ti-connectivity/wl127x-nvs.bin				\
> +	ti-connectivity/TIInit_7.2.31.bts 			\
> +	LICENCE.ti-connectivity
> +
> +# wl128x
> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
> +	ti-connectivity/wl128x-fw-3.bin				\
> +	ti-connectivity/wl128x-fw-ap.bin			\
> +	ti-connectivity/wl128x-fw-plt-3.bin			\
> +	ti-connectivity/wl128x-fw.bin				\
> +	ti-connectivity/wl1271-nvs.bin				\
> +	ti-connectivity/wl128x-nvs.bin				\
> +	ti-connectivity/wl12xx-nvs.bin				\
> +	ti-connectivity/TIInit_7.2.31.bts 			\

So here we have another issue: how can I define if files should be copied to /lib/firmware or /lib/firmware/foo? ti-connectivity firmware files should go direct to /lib/firmware. This is not the case now.

Yegor
