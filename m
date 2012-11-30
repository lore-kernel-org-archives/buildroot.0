From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 29 Nov 2012 16:04:22 -0800
Subject: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
In-Reply-To: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <CAJJ6jxv6w=wq7taFt4rxXfSmjY7Vkd+m06_U+A9fz4z1eyFM_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't understand why you need this. It is a one line "sudo tar -xf
..." to unpack the tarball into your nfs directory. Either type this
line or add a one line script to your ~/bin directory to do it for
each of your buildroot trees/environments. Don't add clutter to the
buildroot makefile.

Regards, Steve

On Tue, Nov 27, 2012 at 12:12 AM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
> add a new target to deploy a live filesystem to be used by NFS
>
> ---
>
> Hello everybody
>
> this patch is not ready for commit, it's a proposal to help me solve the very common use case of
> a developement FS deployed on NFS. I am not very happy of how it's done at this point but I would
> like to discuss it to see if it has a chance to get merged... What I don't like (and would gladly
> have ideas on how to solve this)
> * no dependency on host-sudo, i'm not sure how to add that
> * using sudo to break out of fakeroot is not clean
> * I am abusing the fs building framework, but I don't know of a cleaner way
> * filesystem can only be under output/images at this point
>
> so this patch is more to start a discussion than anything, i'll gladly take any comments or plain
> 'ol rejection if the project doesn't want it... but if there is some interest i'll work it into
> something mainline worthy
>
> Regards
>
> J?r?my Rosen
> ---
>  fs/Config.in      |    1 +
>  fs/live/Config.in |   16 ++++++++++++++++
>  fs/live/live.mk   |   23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 fs/live/Config.in
>  create mode 100644 fs/live/live.mk
>
> diff --git a/fs/Config.in b/fs/Config.in
> index 94154ea..de2377e 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -11,5 +11,6 @@ source "fs/cpio/Config.in"
>  source "fs/iso9660/Config.in"
>  source "fs/initramfs/Config.in"
>  source "fs/romfs/Config.in"
> +source "fs/live/Config.in"
>
>  endmenu
> diff --git a/fs/live/Config.in b/fs/live/Config.in
> new file mode 100644
> index 0000000..bf24754
> --- /dev/null
> +++ b/fs/live/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_TARGET_ROOTFS_LIVE
> +       bool "live root filesystem"
> +       help
> +         uses sudo to create a live image of the filesystem
> +         this is mainly usefull if you want to use your filesystem
> +         over NFS
> +config BR2_TARGET_ROOTFS_LIVE_DEST
> +       string "directory to put the live image"
> +       depends on BR2_TARGET_ROOTFS_LIVE
> +       default "live"
> +       help
> +         The directory where the image should be stored.
> +         this directory will be emptied and recreated, it is given
> +         relative to the buildroot output/images directory
> +
> +
> diff --git a/fs/live/live.mk b/fs/live/live.mk
> new file mode 100644
> index 0000000..73bcd3e
> --- /dev/null
> +++ b/fs/live/live.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# Build the live root filesystem directory
> +#
> +#############################################################
> +
> +LIVE_OPTS :=
> +
> +
> +ROOTFS_LIVE_DEPENDENCIES = #host-sudo
> +
> +define ROOTFS_LIVE_CMD
> + sudo cp -r $(TARGET_DIR)/* $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)/
> +endef
> +
> +define ROOTFS_LIVE_INIT
> +       sudo rm -rf $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)
> +       sudo mkdir $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)
> +endef
> +
> +ROOTFS_LIVE_PRE_GEN_HOOKS += ROOTFS_LIVE_INIT
> +
> +$(eval $(call ROOTFS_TARGET,live))
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
