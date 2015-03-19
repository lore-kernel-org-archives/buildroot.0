From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2015 01:04:45 +0100
Subject: [Buildroot] [PATCH 1/5] Makefile: add media image generation
In-Reply-To: <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150319000445.GD4578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-03-17 18:51 -0400, Vivien Didelot spake thusly:
> This patch adds an optional and minimalist support for building medium
> images, through a new "target-media-image" step of the build system.

As discussed on IRC, I wonder why you need to add a new target in the
top-level Makefile, rather than re-use the filesystem infra. something
like:

fs/Config.in

    # Existing filesystems, up to:
    source "fs/yaffs2/Config.in"
    commet "Aggregate filesystems"  # Or whatever prompt that has meaning
    source "fs/genimage/Config.in"


fs/genimage/Config.in

    config BR2_TARGET_ROOTFS_GENIMAGE
        bool "genimage"
        select BR2_PACKAGE_HOST_GENIMAGE

    config BR2_TARGET_ROOTFS_GENIMAGE_CFG
        string "path to genimage config files"
        depends on BR2_TARGET_ROOTFS_GENIMAGE


fs/genimge/genimage.mk

    ROOTFS_GENIMAGE_DEPENDENCIES = host-genimage
    ROOTFS_GENIMAGE_DEPENDENCIES += $(if $(BR2_TARGET_ROOTFS_EXT2),rootfs-ext2)
    ROOTFS_GENIMAGE_DEPENDENCIES += $(if $(BR2_TARGET_ROOTFS_SQUASHFS),rootfs-squashfs)
    # And so on...

    define ROOTFS_GENIMAGE_CMD
        $(foreach cfg,$(call qstrip,$(BR2_TARGET_ROOTFS_GENIMAGE_CFG)),\
            TMPDIR="$$(mktemp -d $(BUILD_DIR)/.genimage.XXXXXXXXXX)" || exit 1; \
            $(INSTALL) -d -m 0755 $${TMPDIR}/{root,tmp} || exit 1; \
            $(EXTRA_ENV) $(HOST_DIR)/usr/bin/genimage \
                --rootpath $(TARGET_DIR) \
                --tmppath $${RMPDIR}/tmp \
                --inputpath $(BIANRIES_DIR) \
                --outputpath $(BIANRIES_DIR) \
                --config $(cfg) || exit 1; \
            rm -rf $${TMPDIR} || exit 1$(sep))
    endef


And then there's no need to add another top-level Makefile rule.

[--SNIP--]
> diff --git a/support/media/genimage b/support/media/genimage

As shown above, I don;t think you need a wrapper just to create a temp
dir... ;-)

> new file mode 100755
> index 0000000..11c72ec
> --- /dev/null
> +++ b/support/media/genimage
> @@ -0,0 +1,23 @@
> +#!/usr/bin/env bash
> +
> +# We want to catch any unexpected failure, and exit immediately

Except in this case, you'll get leftovers from the temporary directory.

Catch failures with:

    cleanup() {
        local ret=${?}
        [ -z "${GENIMAGE_DIR}" ] || rm -rf "${GENIMAGE_DIR}"
        exit ${ret}
    }
    trap cleanup ERR

> +set -e
> +
> +# Media image generation helper for genimage
> +#
> +# Call it as:
> +#   .../genimage GENIMAGE_CFG
> +
> +GENIMAGE_CFG="${1}"
> +GENIMAGE_DIR="$(mktemp -d output/.genimage.XXXXXXXXXX)"
> +
> +mkdir -p "${GENIMAGE_DIR}"/{root,tmp}
> +
> +"${HOST_DIR}/usr/bin/genimage" \
> +    --rootpath "${GENIMAGE_DIR}/root" \

Why don't you use $(TARGET_DIR) ?

> +    --tmppath "${GENIMAGE_DIR}/tmp" \
> +    --inputpath "${BINARIES_DIR}" \
> +    --outputpath "${BINARIES_DIR}" \
> +    --config "${GENIMAGE_CFG}"
> +
> +rm -rf "${GENIMAGE_DIR}"
> diff --git a/system/Config.in b/system/Config.in
> index 9973cc2..479ac4a 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -452,4 +452,30 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
>  	  directory / images directory. The arguments in this option will be
>  	  passed *after* those.
>  
> +config BR2_TARGET_MEDIA_GENIMAGE_CFG
> +	string "genimage config files to prepare media images"
> +	default ""
> +	help
> +	  Specify a space-separated list of configuration files for genimage
> +	  to be run after the build has finished and after Buildroot has
> +	  packed the files into selected filesystem images.
> +
> +	  This can for example be used to generate an SD card image with a
> +	  vfat boot partition and a ext4 rootfs, or a flash image with
> +	  bootloader and kernel at specific offsets.
> +
> +	  genimage is executed from the main Buildroot source directory,
> +	  with input and output paths configured to output/images.
> +
> +	  The genimage documentation is located at:
> +	  http://git.pengutronix.de/?p=genimage.git;a=blob_plain;f=README.
> +
> +config BR2_TARGET_MEDIA_GENIMAGE_HOST_DEPENDENCIES
> +	bool "genimage host dependencies"
> +	default y
> +	depends on BR2_TARGET_MEDIA_GENIMAGE_CFG != ""
> +	select BR2_PACKAGE_HOST_GENIMAGE
> +	select BR2_PACKAGE_HOST_DOSFSTOOLS
> +	select BR2_PACKAGE_HOST_MTOOLS

Why do you force-select dosfstools and mtools? What if the generated
image has no fat partition (like probably a lot of embedded devices)?

Just leave it to the user to make an informed selection of the required
tools.

I've had a quick look at the examples you provide in later patches,
especially the RPi ones. You laways only have a single rootfs partition,
and there is no setup where you'd have (Rpi for example):

    /dev/mmcblk0p1  -->  fat       -->  -
    /dev/mmcblk0p2  -->  squashfs  -->  /
    /dev/mmcblk0p3  -->  ext4      -->  /usr/

You always rely on Buildroot to build the filesystems that get mounted,
which means it is not possible to have a multi-parition setup (and I'm
not talking boot partitions, which are not mounted at all).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
