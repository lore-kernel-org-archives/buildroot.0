From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 20 Jul 2011 11:12:41 -0500
Subject: [Buildroot] [git commit] initramfs: fix boot with dynamic /dev
In-Reply-To: <20110720150418.E95188B391@busybox.osuosl.org>
References: <20110720150418.E95188B391@busybox.osuosl.org>
Message-ID: <201107201112.44209.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed July 20 2011, Peter Korsgaard wrote:
> 
> commit: http://git.buildroot.net/buildroot/commit/?id=424888e47431db738f5f9b3c6392435bfce7a842
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Devtmpfs (which is used by devtmpfs/mdev/udev options) doesn't get
> automounted by the kernel when an initramfs is used, causing boot
> failures when a dynamic /dev is used.
> 
> Fix it by adding a pre-init script to mount devtmpfs before running init.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  fs/initramfs/init         |    4 ++++
>  fs/initramfs/initramfs.mk |   17 +++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>  create mode 100755 fs/initramfs/init
> 
> diff --git a/fs/initramfs/init b/fs/initramfs/init
> new file mode 100755
> index 0000000..751cb27
> --- /dev/null
> +++ b/fs/initramfs/init
> @@ -0,0 +1,4 @@
> +#!/bin/sh
>

Will the various shell aps run a script without /dev/console and /dev/null?

Once upon a time, some did not, but that may no longer be true.

Mike

> +# devtmpfs does not get automounted for initramfs
> +/bin/mount -t devtmpfs devtmpfs /dev
> +exec /sbin/init $*
> diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
> index 73122a8..1cd48b6 100644
> --- a/fs/initramfs/initramfs.mk
> +++ b/fs/initramfs/initramfs.mk
> @@ -6,13 +6,26 @@
>  #
>  #############################################################
>  
> -define ROOTFS_INITRAMFS_INIT_SYMLINK
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> +
> +define ROOTFS_INITRAMFS_ADD_INIT
>  	if [ ! -e $(TARGET_DIR)/init ]; then \
>  		ln -sf sbin/init $(TARGET_DIR)/init; \
>  	fi
>  endef
>  
> -ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_INIT_SYMLINK
> +else
> +# devtmpfs does not get automounted when initramfs is used.
> +# Add a pre-init script to mount it before running init
> +define ROOTFS_INITRAMFS_ADD_INIT
> +	if [ ! -e $(TARGET_DIR)/init ]; then \
> +		$(INSTALL) -m 0755 fs/initramfs/init $(TARGET_DIR)/init; \
> +	fi
> +endef
> +
> +endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
> +
> +ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_ADD_INIT
>  
>  define ROOTFS_INITRAMFS_CMD
>  	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
