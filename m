From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 20:49:24 +0100
Subject: [Buildroot] [PATCH 5/9] linux: enable initrd/initramfs support
 when cpio rootfs is chosen
In-Reply-To: <1388242600-2580-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131228194924.GJ3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 15:56 +0100, Thomas Petazzoni spake thusly:
> When one enables the generation of a cpio archive of the root
> filesystem, the most likely usage is as an initramfs for the
> kernel. This commit ensures that the kernel has initramfs support when
> the rootfs cpio image format is chosen.
> 
> This will for example ensure that if the user selects the ISO9660
> filesystem format (which uses a cpio initramfs), the kernel will have
> proper support to load and use the initramfs.
> 
> It is worth mentionning that when BR2_TARGET_ROOTFS_INITRAMFS is
> enabled, then BR2_TARGET_ROOTFS_CPIO is always enabled. That's why we
> move the enabling of CONFIG_BLK_DEV_INITRD from the initramfs case to
> the cpio case.

Do we even want to expose cpio in the first place?

The way I see it:
  - if someone wants an archive, then a tarball is a more common archive
    type than cpio is, so we need not expose cpio. If the user wants an
    archive, then he should just use a tarball.
  - thus, as cpio is just a requirement for initramfs, there is no
    reason to expose cpio in the menu, and just merge cpio as a internal
    step of initramfs

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5af167d..fa8aa0c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -169,13 +169,14 @@ define LINUX_CONFIGURE_CMDS
>  	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(if $(BR2_arm)$(BR2_armeb),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> +	$(if $(BR2_TARGET_ROOTFS_CPIO),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
>  	# As the kernel gets compiled before root filesystems are
>  	# built, we create a fake cpio file. It'll be
>  	# replaced later by the real cpio archive, and the kernel will be
>  	# rebuilt using the linux26-rebuild-with-initramfs target.
>  	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
>  		touch $(BINARIES_DIR)/rootfs.cpio
> -		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
>  		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
> -- 
> 1.8.3.2
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
