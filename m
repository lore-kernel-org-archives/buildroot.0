From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 08:06:17 +0100
Subject: [Buildroot] [PATCH 1/1] iso9660: Added support for overlay
	directories
In-Reply-To: <1391549148-31993-1-git-send-email-martin@barkynet.com>
References: <1391549148-31993-1-git-send-email-martin@barkynet.com>
Message-ID: <5301B4E9.60902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 22:25, Martin Bark wrote:
> This patch adds a variable BR2_TARGET_ROOTFS_ISO9660_OVERLAY that
> is similar to BR2_ROOTFS_OVERLAY except the files are placed in the
> iso9660 file system.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I haven't tried it but it looks obviously-correct.

 Jean Sergemoel has a patch in the queue that does a similar thing (in
addition to a few more changes). Jean, could you rebase your patches on
top of this one? And, if possible, also test if this one works for you.
If yes, add your Tested-by to this patch.

 Regards,
 Arnout

> ---
>  fs/iso9660/Config.in  |   16 +++++++++++++++-
>  fs/iso9660/iso9660.mk |    7 +++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 50b4377..f429b4f 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -8,11 +8,25 @@ config BR2_TARGET_ROOTFS_ISO9660
>  	help
>  	  Build a bootable iso9660 image
>  
> +if BR2_TARGET_ROOTFS_ISO9660
> +
>  config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
>  	string "Boot menu.lst file"
> -	depends on BR2_TARGET_ROOTFS_ISO9660
>  	default "fs/iso9660/menu.lst"
>  
> +config BR2_TARGET_ROOTFS_ISO9660_OVERLAY
> +	string "iso9660 filesystem overlay directories"
> +	default ""
> +	help
> +	  Specify a list of directories that are copied over the root of the
> +	  iso filesystem after the build has finished and before it is
> +	  packed into the iso filesystem image.
> +
> +	  They are copied as-is into the iso image, excluding files ending
> +	  with ~ and .git, .svn and .hg directories.
> +
> +endif
> +
>  comment "iso image needs a Linux kernel to be built"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on !BR2_LINUX_KERNEL
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index a6a9c95..1d0e5e0 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -27,6 +27,13 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  else
>  	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
>  endif
> +
> +	@$(foreach d, $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_OVERLAY)), \
> +		$(call MESSAGE,"Copying iso9660 overlay $(d)"); \
> +		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +			--chmod=Du+w --exclude .empty --exclude '*~' \
> +			$(d)/ $(ISO9660_TARGET_DIR)$(sep))
> +
>  	# Use fakeroot to pretend all target binaries are owned by root
>  	rm -f $(FAKEROOT_SCRIPT)
>  	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
