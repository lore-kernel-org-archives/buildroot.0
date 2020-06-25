From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 23:58:28 +0200
Subject: [Buildroot] [PATCH v2] rpi-firmware: do not rename startup files
In-Reply-To: <20200624193531.27761-1-sveyret@gmail.com>
References: <20200624193531.27761-1-sveyret@gmail.com>
Message-ID: <20200625215828.GX20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

So, I said I would apply this patch shortly. I lied... :-/
See below why, now that I have reviewed it in more details...

On 2020-06-24 21:35 +0200, St?phane Veyret spake thusly:
> Bug: 13026

Move that to the end of the commit log, formatted as:

    Fixes: #13026

> When booting, a Raspberry Pi will load the appropriate start files,
> depending on the provided configuration. For example, if the config.txt
> file contains:
> gpu_mem=16
> the board will automatically load the cut-down startup files
> (start_cd.elf and fixup_cd.dat on non-Rpi4).
> 
> Unfortunately, even when the appropriate version is selected in the
> configuration menu (in this example,
> BR2_PACKAGE_RPI_FIRMWARE_BOOT="_cd") if the rpi-firmware makefile takes
> the good files, it renames them to non-qualified, i.e. start.elf and
> fixup.dat. But as these are not the files searched by the Raspberry Pi,
> the board will not start.

The two paragraphs above explain the problem, which is very good, thanks.
(could you try and reformat them so they are more adjusted left-right?)

However, you don't explain how you fixed it. Something like:

    So, we set the names of the files to load as constant in config.txt.
    This guarantees that the rpi firmware blobs do not take any other
    corner-case decision based on any other as-yet unknown conditions.

    This eases the maintenance, as only the names of the source files
    matter; the destinations filenames are constants, and so are the
    filenames in config.txt.

See below for more...

> Signed-off-by: St?phane Veyret <sveyret@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - update config.txt instead of keeping firmware name, as suggested by
>     Yann E. MORIN. Note that this requires to update the name anyway
>     for RPi 4.
> ---
>  package/rpi-firmware/config.txt      | 5 +++++
>  package/rpi-firmware/rpi-firmware.mk | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
> index 58cc966a87..8121624a78 100644
> --- a/package/rpi-firmware/config.txt
> +++ b/package/rpi-firmware/config.txt
> @@ -18,3 +18,8 @@ disable_overscan=1
>  gpu_mem_256=100
>  gpu_mem_512=100
>  gpu_mem_1024=100
> +
> +# We always use the same name, the real used variant is selected by
> +# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD}
> +start_file=start.elf
> +fixup_file=fixup.dat

Since those are the very-early boot files, I would prefer they appear at
the beginning of the file, just above the line that identifies the
kernel to load.

Yes, the gpu_mem options are not nicely located either. And we are
missing gpu_mem (without memory suffix), potentially to replace all
three existing options (but in another patch):

    gpu_mem = 100

https://github.com/raspberrypi/documentation/blob/master/configuration/config-txt/memory.md

> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 6ad67ab0e5..b412b08cff 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -44,8 +44,8 @@ endif # INSTALL_VCDBG
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
>  # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
>  define RPI_FIRMWARE_INSTALL_BOOT
> -	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
> -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
> +	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> +	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
>  endef
>  else
>  define RPI_FIRMWARE_INSTALL_BOOT

So, now, except for the source filenames for start.elf and fixup.dat,
the pi4 only diverges from the other because of the bootcode.bin,
right?

So what about changing BR2_PACKAGE_RPI_FIRMWARE_BOOT in Config.in to:

    config BR2_PACKAGE_RPI_FIRMWARE_BOOT
        string
        default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
        default "4"     if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
        default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
        default "4x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
        default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
        default "4cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4

And then move the copy of start/elf and fixups.dat out of the
conditional, and only keep bootcode.bin in the conditional block:

    define RPI_FIRMWARE_INSTALL_START_FILES
        $(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
        $(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
    endef

    ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
    define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
        $(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
    endef
    endif

    define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
        (existing install of config.txt and cmdline.txt)
        $(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
        $(RPI_FIRMWARE_INSTALL_START_FILES)
        (existing install of DTB)
    endef

This way, we really apply the mantra "only the source filenames matter,
the rest is constant!" ;-)

Care to respin a v3, please?

Regards,
Yann E. MORIN.

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
