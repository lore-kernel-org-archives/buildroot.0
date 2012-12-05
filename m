From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 08:12:11 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
 <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <50BEF3CB.1050502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/12 11:40, J?r?my Rosen wrote:
> add a new target to deploy a live filesystem to be used with NFS or as a chroot
>
> Signed-off-by: J?r?my Rosen<jeremy.rosen@openwide.fr>
> ---
> v2 : implement Arnoult's suggestion, update manual entry
> ---
>   docs/manual/beyond-buildroot.txt |   16 +++++++---------
>   fs/Config.in                     |    1 +
>   fs/live/Config.in                |   16 ++++++++++++++++
>   fs/live/live.mk                  |   20 ++++++++++++++++++++
>   4 files changed, 44 insertions(+), 9 deletions(-)
>   create mode 100644 fs/live/Config.in
>   create mode 100644 fs/live/live.mk
>
> diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
> index e7b902d..adf3e83 100644
> --- a/docs/manual/beyond-buildroot.txt
> +++ b/docs/manual/beyond-buildroot.txt
> @@ -9,17 +9,15 @@ Boot the generated images
>   NFS boot
>   ~~~~~~~~
>
> -To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
> -images_ menu.
> +To achieve NFS-boot, enable _live root filesystem_ in the _Filesystem
> +images_ menu and select a _live image location_ to choose where the live
> +filesystem will be deployed. you can use _$(BINARIES_DIR)_ to easily
> +build in +/path/to/output_dir/+

  +/path/to/output_dir/images/+

>
> -After a complete build, just run the following commands to setup the
> -NFS-root directory:
> +You will be asked for a password during the build. This is needed to create
> +device entries in the target filesystem
>
> --------------------
> -sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
> --------------------
> -
> -Then, you can execute a NFS-boot from your target.
> +You will need to add the target path  to +/etc/exports+.

  You will need to add the _live image location_ to +/etc/exports+.

>
>   Chroot
>   ------
> diff --git a/fs/Config.in b/fs/Config.in
> index 94154ea..de2377e 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -11,5 +11,6 @@ source "fs/cpio/Config.in"
>   source "fs/iso9660/Config.in"
>   source "fs/initramfs/Config.in"
>   source "fs/romfs/Config.in"
> +source "fs/live/Config.in"
>
>   endmenu
> diff --git a/fs/live/Config.in b/fs/live/Config.in
> new file mode 100644
> index 0000000..60d03a7
> --- /dev/null
> +++ b/fs/live/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_TARGET_ROOTFS_LIVE
> +	bool "live root filesystem"
> +	help
> +	  uses sudo to create a live image of the filesystem
> +	  this is mainly useful if you want to use your filesystem
> +	  over NFS or a chroot

  Help text:

Create a live image of the root filesystem that is directly
usable as over NFS or chroot.

  Leave an empty line between this and the next config.

> +config BR2_TARGET_ROOTFS_LIVE_DEST
> +	string "live image location"
> +	depends on BR2_TARGET_ROOTFS_LIVE
> +	default "$(BINARIES_DIR)/live"
> +	help
> +	  The directory where the image should be stored.
> +	  this directory will be emptied and recreated, it is given

  this -> This

> +	  relative to the buildroot output/images directory

  The second part of this statement is redundant (it's true for all
paths in the config and is not mentioned anywhere else)

> +
> +

  Don't put empty lines at the end of the file (but do make sure
it ends with a newline).

> diff --git a/fs/live/live.mk b/fs/live/live.mk
> new file mode 100644
> index 0000000..33fe515
> --- /dev/null
> +++ b/fs/live/live.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# Build the live root filesystem directory
> +#
> +#############################################################
> +
> +
> +define ROOTFS_LIVE_CMD
> + sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/ $(BR2_TARGET_ROOTFS_LIVE_DEST)/

  Start commands with a tab - that makes it clearer that it's a
command.

  Split the long line.

> +endef
> +
> +define ROOTFS_LIVE_INIT
> +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be installed on the host system" ; false ; fi ; \

  This really should be checked in support/dependencies/dependencies.sh.

> +  if [ ! -t 0 ] ; then echo "live filesystem must be generated interactively" ; false ; fi ; \
> +  if [ ! -t 2 ] ; then echo "live filesystem must be generated interactively" ; false ; fi ;

  Don't concatenate commands with \ but just start each command on a new
line starting with a tab.  (Of course, when you split the condition
over several lines, then you have to use \).

  This test is not actually correct, because sudo will use the
controlling terminal (/dev/tty) to ask a password, i.e. it still
works when input and output are redirected. It will however not
work when there is no controlling terminal, e.g. when it's invoked
directly from a window manager menu.  In addition, if an askpass
program is specified, sudo doesn't even need a controlling terminal.

  So maybe it's better to drop the check after all. The sudo command
itself will just fail with 'sudo: no tty present and no askpass
program specified', which is clear enough.

  (I realize I asked for this check in the first place - but only
idiots never change their mind :-)


  Regards,
  Arnout

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
