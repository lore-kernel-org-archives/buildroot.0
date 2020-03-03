From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:28:53 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix symlink support
In-Reply-To: <20200303133356.859800-1-antoine.tenart@bootlin.com>
References: <20200303133356.859800-1-antoine.tenart@bootlin.com>
Message-ID: <20200303212853.GD12449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-03-03 14:33 +0100, Antoine Tenart spake thusly:
> Since Linux-firmware's commit 9cfefbd7fbda ("Remove duplicate symlinks")
> symlinks aren't distributed anymore. They are rather created at
> installation time by a script provided in the project, copy-firmware.sh.
> The description of the symlinks is done in the WHENCE file. Since the
> bump to version 20200122, in commit 48cc1a89ae04, installation for many
> firmwares was broken as Buildroot tried to install missing symlinks from
> Linux-firmware.
> 
> The fix is not only to remove now missing symlinks, but to add logic to
> create those symlinks as kernel modules will depend on them. The
> solution taken by this patch is to create dynamically symlinks based on
> their description in the WHENCE file *and* only if the file they'll
> point to was installed in the target directory.
> 
> Fixes: 48cc1a89ae04 ("package/linux-firmware: bump to version 20200122")
> Cc: james.hilliard1 at gmail.com
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

I did find a problem with some symlinks that is not created.

    Link: cxgb4/t4fw.bin -> t4fw-1.24.11.0.bin

The target is itself in the cxgb4/ directory, so your code does not
catch it as an isntalled blob, and thus does not create the symlink.

I anyway applied, because it at least fixes the build by dropping the
entries tht no longer exist as they are symlinks.

So this patch is just a partial fix.

Care to send an update to also account for the kind of symlinks above?

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 33 ++++++++++++++----------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index f8e95d0648c9..125df74ef68d 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -71,9 +71,7 @@ endif
>  
>  # rt2xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
> -# rt3090.bin is a symlink to rt2860.bin
> -# rt3070.bin is a symlink to rt2870.bin
> -LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin
> +LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3071.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
>  endif
>  
> @@ -214,8 +212,6 @@ endif
>  
>  # sd8688
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
> -LINUX_FIRMWARE_FILES += libertas/sd8688.bin libertas/sd8688_helper.bin
> -# The two files above are but symlinks to those two ones:
>  LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
>  endif
> @@ -320,12 +316,10 @@ endif
>  
>  # wl127x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
> -# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl1271-fw-2.bin \
>  	ti-connectivity/wl1271-fw-ap.bin \
>  	ti-connectivity/wl1271-fw.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl127x-fw-3.bin \
>  	ti-connectivity/wl127x-fw-plt-3.bin \
>  	ti-connectivity/wl127x-nvs.bin \
> @@ -341,15 +335,12 @@ endif
>  
>  # wl128x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
> -# wl1271-nvs.bin and wl12xx-nvs.bin are symlinks to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl128x-fw-3.bin \
>  	ti-connectivity/wl128x-fw-ap.bin \
>  	ti-connectivity/wl128x-fw-plt-3.bin \
>  	ti-connectivity/wl128x-fw.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl128x-nvs.bin \
> -	ti-connectivity/wl12xx-nvs.bin \
>  	ti-connectivity/wl127x-nvs.bin \
>  	ti-connectivity/wl128x-fw-4-mr.bin \
>  	ti-connectivity/wl128x-fw-4-plt.bin \
> @@ -363,13 +354,11 @@ endif
>  
>  # wl18xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
> -# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl18xx-fw.bin \
>  	ti-connectivity/wl18xx-fw-2.bin \
>  	ti-connectivity/wl18xx-fw-3.bin \
>  	ti-connectivity/wl18xx-fw-4.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl127x-nvs.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
> @@ -568,8 +557,7 @@ LINUX_FIRMWARE_FILES += \
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
> -# qat_mmp.bin is a symlink to qat_895xcc_mmp.bin
> -LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin qat_mmp.bin
> +LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
>  endif
>  
> @@ -626,4 +614,21 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
>  	$(LINUX_FIRMWARE_INSTALL_DIRS)
>  endef
>  
> +# Some firmware are distributed as a symlink, for drivers to load them using a
> +# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
> +# symlinks") those symlink aren't distributed in linux-firmware but are created
> +# automatically by its copy-firmware.sh script during the installation, which
> +# parses the WHENCE file where symlinks are described. We follow the same logic
> +# here, adding symlink only for firmwares installed in the target directory.
> +# The grep/sed parsing is taken from the script mentioned before.
> +define LINUX_FIRMWARE_CREATE_SYMLINKS
> +	grep -E '^Link:' $(@D)/WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do \
> +		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
> +			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f ; \
> +		fi ; \
> +	done
> +endef
> +
> +LINUX_FIRMWARE_POST_INSTALL_TARGET_HOOKS += LINUX_FIRMWARE_CREATE_SYMLINKS
> +
>  $(eval $(generic-package))
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
