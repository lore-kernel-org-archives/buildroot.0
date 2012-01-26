From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 26 Jan 2012 21:05:23 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <877h0e2svc.fsf@macbook.be.48ers.dk>
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 <877h0e2svc.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_ktPj9d_YVm2fVAa1TktNxcpKZWc8g5BA=0G3AE8iGdXiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 26, 2012 at 7:58 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "yegorslists" == yegorslists ?<yegorslists@googlemail.com> writes:
>
> ?yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
> ?yegorslists> add infrastructure for closed binary blobs
>
> Committed with minor fixes (see below) - Thanks!
>
> ?yegorslists> new file mode 100644
> ?yegorslists> index 0000000..b4fa645
> ?yegorslists> --- /dev/null
> ?yegorslists> +++ b/package/linux-firmware/Config.in
> ?yegorslists> @@ -0,0 +1,46 @@
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE
> ?yegorslists> + bool "linux-firmware"
> ?yegorslists> + help
> ?yegorslists> + ? This package provides various binary firmware files
> ?yegorslists> + ? (closed binary blobs) for such devices like LAN, WLAN cards etc.
>
> Trailing spaces. We normally add an upstream URL here as well. I've
> added the link to gitweb for it.

ACK Totally forgot about this :-(

> ?yegorslists> +
>
> ?yegorslists> +if BR2_PACKAGE_LINUX_FIRMWARE
> ?yegorslists> +
> ?yegorslists> +menu "Devices"
> ?yegorslists> +
> ?yegorslists> +menu "Ralink"
>
> I don't like too many sub menus, so I've dropped the outer "Devices"
> one.

ACK

> ?yegorslists> +
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
> ?yegorslists> + bool "Ralink rt2501/rt61"
> ?yegorslists> + help
> ?yegorslists> + ? Ralink rt2501/rt61
> ?yegorslists> +
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73
> ?yegorslists> + bool "Ralink rt73"
> ?yegorslists> + help
> ?yegorslists> + ? Ralink rt73
> ?yegorslists> +
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
> ?yegorslists> + bool "Ralink rt27xx/rt28xx/rt30xx"
> ?yegorslists> + help
> ?yegorslists> + ? Ralink rt27xx/rt28xx/rt30xx
> ?yegorslists> +
> ?yegorslists> +endmenu
> ?yegorslists> +
> ?yegorslists> +menu "Texas Instruments"
> ?yegorslists> +
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
> ?yegorslists> + bool "wl127X"
> ?yegorslists> + help
> ?yegorslists> + ? Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
> ?yegorslists> +
> ?yegorslists> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
> ?yegorslists> + bool "wl128X"
> ?yegorslists> + help
> ?yegorslists> + ? Firmware files for WLAN and Bluetooth modules wl128x
> ?yegorslists> +
> ?yegorslists> +endmenu
> ?yegorslists> +
> ?yegorslists> +endmenu
> ?yegorslists> +
> ?yegorslists> +endif
> ?yegorslists> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> ?yegorslists> new file mode 100644
> ?yegorslists> index 0000000..af48d13
> ?yegorslists> --- /dev/null
> ?yegorslists> +++ b/package/linux-firmware/linux-firmware.mk
> ?yegorslists> @@ -0,0 +1,56 @@
> ?yegorslists> +#############################################################
> ?yegorslists> +#
> ?yegorslists> +# linux-firmware
> ?yegorslists> +#
> ?yegorslists> +#############################################################
> ?yegorslists> +LINUX_FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
> ?yegorslists> +LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> ?yegorslists> +LINUX_FIRMWARE_SITE_METHOD = git
> ?yegorslists> +
> ?yegorslists> +# rt2501/rt61
> ?yegorslists> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61) += \
> ?yegorslists> + rt2561.bin rt2561s.bin rt2661.bin LICENCE.ralink-firmware.txt
> ?yegorslists> +
> ?yegorslists> +
> ?yegorslists> +# rt73
> ?yegorslists> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73) += \
> ?yegorslists> + rt73.bin LICENCE.ralink-firmware.txt
> ?yegorslists> +
> ?yegorslists> +# rt2xx
> ?yegorslists> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
> ?yegorslists> + rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin ?\
> ?yegorslists> + LICENCE.ralink-firmware.txt
>
> A number of trailing spaces here as well.
>
> Does it make sense to install the license files? We don't otherwise
> install other license documentation.

I think it belong to these blobs, otherwise you're not allowed to
distribute them. Ubuntu ships the stuff too, but they store them under
/usr/share/..

> ?yegorslists> +
> ?yegorslists> +# wl127x
> ?yegorslists> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
> ?yegorslists> + ti-connectivity/wl1271-fw-2.bin ? ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl1271-fw-ap.bin ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/wl1271-fw.bin ? ? ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl1271-nvs.bin ? ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/wl127x-fw-3.bin ? ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl127x-fw-plt-3.bin ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl127x-nvs.bin ? ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/TIInit_7.2.31.bts ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + LICENCE.ti-connectivity
> ?yegorslists> +
> ?yegorslists> +# wl128x
> ?yegorslists> +LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
> ?yegorslists> + ti-connectivity/wl128x-fw-3.bin ? ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl128x-fw-ap.bin ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/wl128x-fw-plt-3.bin ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl128x-fw.bin ? ? ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + ti-connectivity/wl1271-nvs.bin ? ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/wl128x-nvs.bin ? ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/wl12xx-nvs.bin ? ? ? ? ? ? ? ? ? ? ? ? ?\
> ?yegorslists> + ti-connectivity/TIInit_7.2.31.bts ? ? ? ? ? ? ? ? ? ? ? \
> ?yegorslists> + LICENCE.ti-connectivity
> ?yegorslists> +
> ?yegorslists> +
> ?yegorslists> +define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
> ?yegorslists> + mkdir -p $(TARGET_DIR)/lib/firmware
> ?yegorslists> + for i in $(LINUX_FIRMWARE_FILES_y); do \
> ?yegorslists> + ? ? ? ? cp -af $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i; \
> ?yegorslists> + done
> ?yegorslists> +endef
>
> I've changed this to use 2x tar instead.
>
> ?yegorslists> +
> ?yegorslists> +$(eval $(call GENTARGETS))
> ?yegorslists> --
> ?yegorslists> 1.7.1.1

Thanks.

Yegor
