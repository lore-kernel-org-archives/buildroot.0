From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 00:43:57 +0100
Subject: [Buildroot] [PATCH][RFC] new target: live filesystem
In-Reply-To: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <50B7F33D.7010309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/12 09:12, J?r?my Rosen wrote:
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

  That's impossible. The sudo executable must be setuid root, and to make
it setuid root you have to be root, so sudo must already exist...

  You could instead add a check in live.mk if sudo actually works.  But since
sudo may ask for a password this can get tricky - you should e.g. probably check
if stdin is a terminal as well.

  That said, I don't know if Peter will accept running sudo within buildroot.

> * using sudo to break out of fakeroot is not clean

  I don't see much of a problem there.

> * I am abusing the fs building framework, but I don't know of a cleaner way

  You're not abusing it.

> * filesystem can only be under output/images at this point

  That's not good but easy to solve.

>
> so this patch is more to start a discussion than anything, i'll gladly take any comments or plain
> 'ol rejection if the project doesn't want it... but if there is some interest i'll work it into
> something mainline worthy
>
> Regards
>
> J?r?my Rosen
> ---
>   fs/Config.in      |    1 +
>   fs/live/Config.in |   16 ++++++++++++++++
>   fs/live/live.mk   |   23 +++++++++++++++++++++++
>   3 files changed, 40 insertions(+)
>   create mode 100644 fs/live/Config.in
>   create mode 100644 fs/live/live.mk
>
> diff --git a/fs/Config.in b/fs/Config.in
> index 94154ea..de2377e 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -11,5 +11,6 @@ source "fs/cpio/Config.in"
>   source "fs/iso9660/Config.in"
>   source "fs/initramfs/Config.in"
>   source "fs/romfs/Config.in"
> +source "fs/live/Config.in"

  Sort alphabetically please.

>
>   endmenu
> diff --git a/fs/live/Config.in b/fs/live/Config.in
> new file mode 100644
> index 0000000..bf24754
> --- /dev/null
> +++ b/fs/live/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_TARGET_ROOTFS_LIVE
> +	bool "live root filesystem"
> +	help
> +	  uses sudo to create a live image of the filesystem
> +	  this is mainly usefull if you want to use your filesystem

  useful

> +	  over NFS

  or as a chroot

> +config BR2_TARGET_ROOTFS_LIVE_DEST
> +	string "directory to put the live image"

  "live image location"

> +	depends on BR2_TARGET_ROOTFS_LIVE
> +	default "live"

  Use an empty default, and give an error in live.mk if it's
empty.

> +	help
> +	  The directory where the image should be stored.
> +	  this directory will be emptied and recreated, it is given
> +	  relative to the buildroot output/images directory

  Make it an absolute path instead.

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

  This is unneeded.

> +
> +
> +ROOTFS_LIVE_DEPENDENCIES = #host-sudo

  This as well.

> +
> +define ROOTFS_LIVE_CMD
> + sudo cp -r $(TARGET_DIR)/* $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)/

  That won't work, because device nodes, symlinks etc. are not
copied correctly.  Use cp -a.  Or even better, rsync -a --delete-during
(then you don't need to remove it first).

  For the target, just use $(BR2_TARGET_ROOTFS_LIVE_DEST).


  Regards,
  Arnout


> +endef
> +
> +define ROOTFS_LIVE_INIT
> +	sudo rm -rf $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)
> +	sudo mkdir $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)
> +endef
> +
> +ROOTFS_LIVE_PRE_GEN_HOOKS += ROOTFS_LIVE_INIT
> +
> +$(eval $(call ROOTFS_TARGET,live))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
