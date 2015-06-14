From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 17:47:54 +0200
Subject: [Buildroot] [PATCHv2 12/15] fs/iso9660: add isolinux support
In-Reply-To: <1433802108-14351-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614154754.GJ3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> After all the preparation commits, this commit finally adds the
> iso9660 support itself. Besides adding a new Config.in entry, a little
> bit of .mk code and the isolinux.cfg default configuration, not much
> is needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, see a little comment below...

[--SNIP--]
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 6a1b214..588e07b 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -53,6 +53,17 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
>  	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
>  		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
>  endef
> +else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
> +ROOTFS_ISO9660_DEPENDENCIES += syslinux
> +ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
> +	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
> +ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
> +define ROOTFS_ISO9660_INSTALL_BOOTLOADER
> +	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/isolinux.bin \
> +		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.bin
> +	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
> +		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32

In my previous review, I suggested we always install ldlinux.c32 from
the syslinux package, and into $(BINARIES_DIR)/syslinux, to which you
seemed to agree.

However, it looks like you overlooked that part. ;-)

Still, this patch is good as-is, and can be refined with further
patching later on, hence my reviewed-by tag.

Thanks! :-)

Regards,
Yann E. MORIN.

> +endef
>  endif
>  
>  define ROOTFS_ISO9660_PREPARATION
> diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
> new file mode 100644
> index 0000000..28be4fa
> --- /dev/null
> +++ b/fs/iso9660/isolinux.cfg
> @@ -0,0 +1,5 @@
> +default 1
> +label 1
> +      kernel __KERNEL_PATH__
> +      initrd __INITRD_PATH__
> +      append root=/dev/sr0
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
