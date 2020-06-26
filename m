From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2020 23:15:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: bad startup
 file names
In-Reply-To: <20200626104116.3412-1-sveyret@gmail.com>
References: <20200626104116.3412-1-sveyret@gmail.com>
Message-ID: <20200626211554.GZ20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2020-06-26 12:41 +0200, St?phane Veyret spake thusly:
> When booting, a Raspberry Pi will load the appropriate start files,
> depending on the provided configuration. For example, if the config.txt
> file contains ?gpu_mem=16? the board will automatically load the
> cut-down startup files (start_cd.elf and fixup_cd.dat on non-Rpi4).
> 
> Unfortunately, even when the appropriate version is selected in the
> configuration menu, if the rpi-firmware makefile takes the good files,
> it renames them to non-qualified, i.e. start.elf and fixup.dat. But as
> these are not the files searched by the Raspberry Pi, the board will not
> start.
> 
> This patch will set the names of the files to load as constant in the
> config.txt file. This guarantees that the rpi firmware blobs do not take
> any other corner-case decision based on any other as-yet unknown
> conditions.
> 
> This eases the maintenance, as only the names of the source files
> matter; the destination filenames are constants, and so are the
> filenames in config.txt.
> 
> Fixes: #13026
> 
> Signed-off-by: St?phane Veyret <sveyret@gmail.com>

I did a few very minor tweaks:

  - very minor fix in commit title
  - drop the non-conditional macro and move its content into
    RPI_FIRMWARE_INSTALL_IMAGES_CMDS

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - factorization of start file copy, rework on code (suggested by
>     Yann E. MORIN).
> Changes v1 -> v2:
>   - update config.txt instead of keeping firmware name (suggested by
>     Yann E. MORIN).
> ---
> ---
>  package/rpi-firmware/Config.in       |  7 ++++---
>  package/rpi-firmware/config.txt      |  5 +++++
>  package/rpi-firmware/rpi-firmware.mk | 17 ++++++++---------
>  3 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index cced53f017..cbd3a6471a 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -62,11 +62,12 @@ endchoice
>  
>  config BR2_PACKAGE_RPI_FIRMWARE_BOOT
>  	string
> -	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
> +	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
> +	default "4"      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
>  	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
> -	default "x"     if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
> +	default "4x"     if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
>  	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
> -	default "cd"    if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
> +	default "4cd"    if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
>  
>  config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>  	bool "Install Device Tree Blobs (DTBs)"
> diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
> index 58cc966a87..4a92a4dd95 100644
> --- a/package/rpi-firmware/config.txt
> +++ b/package/rpi-firmware/config.txt
> @@ -4,6 +4,11 @@
>  # See http://buildroot.org/manual.html#rootfs-custom
>  # and http://elinux.org/RPiconfig for a description of config.txt syntax
>  
> +# We always use the same names, the real used variant is selected by
> +# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
> +start_file=start.elf
> +fixup_file=fixup.dat
> +
>  kernel=zImage
>  
>  # To use an external initramfs file
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 6ad67ab0e5..4179a26b87 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -41,24 +41,23 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
>  endef
>  endif # INSTALL_VCDBG
>  
> -ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
>  # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
> -define RPI_FIRMWARE_INSTALL_BOOT
> -	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
> -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
> -endef
> -else
> -define RPI_FIRMWARE_INSTALL_BOOT
> +define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
>  	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
> +endef
> +endif
> +
> +define RPI_FIRMWARE_INSTALL_START_FILES
>  	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
>  	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
>  endef
> -endif
>  
>  define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
> -	$(RPI_FIRMWARE_INSTALL_BOOT)
> +	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
> +	$(RPI_FIRMWARE_INSTALL_START_FILES)
>  	$(RPI_FIRMWARE_INSTALL_DTB)
>  	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
>  endef
> -- 
> 2.26.2
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
