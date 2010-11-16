From: Malte Starostik <m-starostik@versanet.de>
Date: Tue, 16 Nov 2010 16:27:52 +0100
Subject: [Buildroot] [PATCH] initramfs: fix symlink test
In-Reply-To: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
References: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
Message-ID: <201011161627.52972.m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Dienstag, 16. November 2010, 15:58:46 schrieb Mike Frysinger:
> We want to see if the symlink exists which means -L, not if the target
> of the symlink exists.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  fs/initramfs/initramfs.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
> index dd6aa94..594cc34 100644
> --- a/fs/initramfs/initramfs.mk
> +++ b/fs/initramfs/initramfs.mk
> @@ -7,7 +7,7 @@
>  #############################################################
> 
>  define ROOTFS_INITRAMFS_INIT_SYMLINK
> -	if [ ! -e $(TARGET_DIR)/init ]; then \
> +	if [ ! -L $(TARGET_DIR)/init ]; then \
>  		ln -s sbin/init $(TARGET_DIR)/init; \
>  	fi
>  endef
> @@ -20,4 +20,4 @@ endef
> 
>  ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
> 
> -$(eval $(call ROOTFS_TARGET,initramfs))
> \ No newline at end of file
> +$(eval $(call ROOTFS_TARGET,initramfs))

Ack for not testing if the link target exists, but what if $(TARGET_DIR)/init 
exists but is not a symlink?  My custom skeleton contains an /init shell 
script? or is that considered unsupported?
Maybe something along the lines of
[ ! -e $(TARGET_DIR)/init -a ! -L $(TARGET_DIR)/init ]
?

Regards,
Malte
