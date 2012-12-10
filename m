From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2012 08:11:59 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
 <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <50C58B3F.4080901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Peter, can you make the call if this has a chance of being accepted?
Otherwise J?r?my is wasting his time...


On 06/12/12 14:36, J?r?my Rosen wrote:
> add a new target to deploy a live filesystem to be used with NFS or as a chroot

  The commit message should be word-wrapped at +- 75 characters IIRC.

>
> Signed-off-by: J?r?my Rosen<jeremy.rosen@openwide.fr>
> ---
> v2 : implement Arnoult's suggestion, update manual entry

  Arnout

> v3 : improve documentation for the chroot case, more suggestions by Arnoult
> ---
[snip]
> diff --git a/fs/Config.in b/fs/Config.in
> index da4c5ff..664d2f6 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
>   source "fs/squashfs/Config.in"
>   source "fs/tar/Config.in"
>   source "fs/ubifs/Config.in"
> +source "fs/live/Config.in"

  Was there a problem with sorting this alphabetically?

>
>   endmenu
> diff --git a/fs/live/Config.in b/fs/live/Config.in
> new file mode 100644
> index 0000000..a79f1dc
> --- /dev/null
> +++ b/fs/live/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_TARGET_ROOTFS_LIVE
> +	bool "live root filesystem"
> +	help
> +	  Create a live image of the root filesystem that is directly
> +	  usable as over NFS or chroot.

  usable over NFS or chroot.

> +
> +config BR2_TARGET_ROOTFS_LIVE_DEST
> +	string "live image location"
> +	depends on BR2_TARGET_ROOTFS_LIVE
> +	default "$(BINARIES_DIR)/live"
> +	help
> +	  The directory where the image should be stored.
> +	  This directory will be emptied and recreated

  How about:

The directory where the live root filesystem will be
installed. Any changes to this tree are lost.

> +

  Redundant empty line.

> diff --git a/fs/live/live.mk b/fs/live/live.mk
> new file mode 100644
> index 0000000..52f7444
> --- /dev/null
> +++ b/fs/live/live.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# Build the live root filesystem directory
> +#
> +#############################################################
> +
> +
> +define ROOTFS_LIVE_CMD
> +	sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/ \
> +		$(BR2_TARGET_ROOTFS_LIVE_DEST)/
> +endef
> +
> +define ROOTFS_LIVE_INIT
> +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be installed on the host system" ; false ; fi
> +endef
> +
> +ROOTFS_LIVE_PRE_GEN_HOOKS += ROOTFS_LIVE_INIT

  Since it's already in dependencies.sh, this piece is redundant.

> +
> +$(eval $(call ROOTFS_TARGET,live))
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 7a02512..ebaabbb 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -158,6 +158,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE>  /dev/null&&  \
>          exit 1 ;
>      fi
>   fi
> +
>   if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
>       for prog in javac jar; do
>   	if ! which $prog>  /dev/null ; then
> @@ -166,3 +167,10 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
>   	fi
>       done
>   fi
> +
> +if grep ^BR2_TARGET_ROOTFS_LIVE=y $CONFIG_FILE>  /dev/null ; then

  We use 'grep -q' rather than redirecting to /dev/null.

> +   if ! which sudo>  /dev/null ; then
> +       /bin/echo -e "\nYou need sudo installed on your build machine to build a live filesystem\n"
> +       exit 1 ;
> +   fi
> +fi

  Maybe, in addition to the mere existence of sudo, you should also
check if it the user is actually in sudoers.  'sudo -l rsync' should
do the trick.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
