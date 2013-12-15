From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Dec 2013 22:50:01 +0100
Subject: [Buildroot] [PATCH 1/1] Do not use an initrd in iso image when
 using initramfs
In-Reply-To: <1387140644-22545-1-git-send-email-thierry.bultel@wanadoo.fr>
References: <1387140644-22545-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <20131215215001.GA3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thierry, All,

On 2013-12-15 21:50 +0100, Thierry Bultel spake thusly:
> When using initramfs, it is useless to put an initrd in the iso image.
> This patch makes the image to only contain the kernel image, and
> also removes the initrd line from menu.lst
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
> ---
>  fs/iso9660/iso9660.mk |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 979a0b2..1f9c62e 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -17,7 +17,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
>  	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
>  	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
>  	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
> +ifneq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)

We prefer positive logic, ie.:

ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
    sed blabla
else
    cp rootfs.cpio blabla
endif

>  	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
> +else
> +	sed -i -e '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +endif
>  	# Use fakeroot to pretend all target binaries are owned by root
>  	rm -f $(FAKEROOT_SCRIPT)
>  	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
