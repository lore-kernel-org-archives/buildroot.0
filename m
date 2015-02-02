From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 21:39:24 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
	image
In-Reply-To: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <CAAXf6LX9wcAVKwxHQYg2Ld7J+Ls36A+ZOFwdWwyLSkLsEkR9Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi No?,

On Mon, Jan 19, 2015 at 8:52 PM, No? Rubinstein
<nrubinstein@aldebaran.com> wrote:
> This adds an option to build an ISO image using ISOLINUX as a
> bootloader, as ISOLINUX provides "isohybrid", an utility that enables
> using an ISO image as a bootable disk image.
>
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

Thanks for your contribution! Some comments below...

> ---
>  fs/iso9660/Config.in    | 41 ++++++++++++++++++++++++++++++++++++-----
>  fs/iso9660/iso9660.mk   | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  fs/iso9660/isolinux.cfg |  4 ++++
>  3 files changed, 80 insertions(+), 13 deletions(-)
>  create mode 100644 fs/iso9660/isolinux.cfg
>
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 50b4377..900dc43 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -3,15 +3,46 @@ config BR2_TARGET_ROOTFS_ISO9660
>         depends on (BR2_i386 || BR2_x86_64)
>         depends on BR2_LINUX_KERNEL
>         select BR2_TARGET_ROOTFS_CPIO
> -       select BR2_TARGET_GRUB
> -       select BR2_TARGET_GRUB_FS_ISO9660
>         help
>           Build a bootable iso9660 image
>
> -config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
> -       string "Boot menu.lst file"
> +choice
> +       prompt "bootloader"
> +       default BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +       depends on BR2_TARGET_ROOTFS_ISO9660
> +       help
> +         Select the bootloader used on the ISO image
> +
> +config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +       bool "isolinux"
> +       select BR2_TARGET_SYSLINUX
> +       select BR2_TARGET_SYSLINUX_ISOLINUX
> +       help
> +         Select this if you want a hybrid ISO, flashable from either an optical
> +         disk or a flash drive.
> +
> +config BR2_TARGET_ROOTFS_ISO9660_GRUB
> +       bool "grub"
> +       select BR2_TARGET_GRUB
> +       select BR2_TARGET_GRUB_FS_ISO9660
> +
> +endchoice
> +
> +config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
> +       bool "Use a custom boot config file"
> +       depends on BR2_TARGET_ROOTFS_ISO9660

There should be some help text on this option: what is the format of
the config file, what is the default one, ... ?

> +
> +config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG_PATH
> +       string "Path to custom boot config file"
> +       depends on BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
> +
> +config BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG
> +       string
>         depends on BR2_TARGET_ROOTFS_ISO9660
> -       default "fs/iso9660/menu.lst"
> +       default $(BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG_PATH) \
> +               if BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
> +       default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +       default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
>
>  comment "iso image needs a Linux kernel to be built"
>         depends on BR2_i386 || BR2_x86_64
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 5b44ba4..0c6e526 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -8,41 +8,73 @@
>  ################################################################################
>
>  ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
> -ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
> +ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio
> +$(info BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG: $(BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG))

This $(info) call should be removed.

Best regards,
Thomas
