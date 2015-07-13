From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 02:19:41 +0200
Subject: [Buildroot] [PATCH 3/3] nfs-utils: Bump version
In-Reply-To: <1436626101-3598-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1436626101-3598-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <55A3041D.6090602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:48, Maxime Hadjinlian wrote:
>     - Refresh the patches (Thanks to Thomas Petazzoni's work)
>     - Change source of the package to git repository (and remove the
>       hash, sourceforce is clearly not a platform which can be trusted
>       nowadays)
>     - Rework the startup script to accomodate new rpc.statd

 That's a bit strange formatting for the commit log.

> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  .../nfs-utils/0001-Patch-taken-from-Gentoo.patch   |  60 ++++++++++++
>  ...d-AM_CONDITIONAL-in-conditional-execution.patch |  57 ------------

 Could you explicitly mention the new and removed patches in the commit log?
Also, use git format-patch -M so we can see what has actually changed in these
patches.

>  .../nfs-utils/0002-Patch-taken-from-Gentoo.patch   |  84 -----------------
>  ...2-Switch-legacy-index-in-favour-of-strchr.patch |  72 +++++++++++++++
>  ...figure-script-find-getrpcbynumber-in-libt.patch |  46 ++++++++++
>  ...3-Switch-legacy-index-in-favour-of-strchr.patch |  73 ---------------
>  package/nfs-utils/0004-fix-build-with-uClibc.patch |  31 -------
>  ...-of-getrpcbynumber-when-getrpcbynumber_r-.patch |  70 --------------
>  ...figure-script-find-getrpcbynumber-in-libt.patch |  38 --------
>  .../0007-sockaddr-h-needs-stddef-h-for-NULL.patch  |  19 ----
>  package/nfs-utils/0008-tirpc-with-pkgconfig.patch  | 102 ---------------------
>  package/nfs-utils/S60nfs                           |   3 +-
>  package/nfs-utils/nfs-utils.hash                   |   2 -
>  package/nfs-utils/nfs-utils.mk                     |   5 +-
>  14 files changed, 181 insertions(+), 481 deletions(-)
>  create mode 100644 package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
>  delete mode 100644 package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
>  delete mode 100644 package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
>  create mode 100644 package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
>  create mode 100644 package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
>  delete mode 100644 package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
>  delete mode 100644 package/nfs-utils/0004-fix-build-with-uClibc.patch
>  delete mode 100644 package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
>  delete mode 100644 package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
>  delete mode 100644 package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
>  delete mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch
>  delete mode 100644 package/nfs-utils/nfs-utils.hash

[snip]
> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
> index 91410ee..37e68f8 100755
> --- a/package/nfs-utils/S60nfs
> +++ b/package/nfs-utils/S60nfs
> @@ -15,13 +15,12 @@ touch /run/nfs/rmtab
>  start() {
>  	# Start daemons.
>  	echo -n "Starting NFS statd: "
> -	rpc.statd
> +	rpc.statd -F

 Perhaps explain in the commit log what this is doing.

>  	touch /var/lock/subsys/nfslock
>  	echo "done"
>  
>  	echo -n "Starting NFS services: "
>  	/usr/sbin/exportfs -r
> -	rpc.statd
>  	echo "done"
>  
>  	echo -n "Starting NFS daemon: "
> diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
> deleted file mode 100644
> index e36c9d0..0000000
> --- a/package/nfs-utils/nfs-utils.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed:
> -sha256  70267288500408495085b7c54a667c4e8cfde5882f3193da095fc7dad2da0b83  nfs-utils-1.2.6.tar.bz2
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 115a133..09f4aef 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 1.2.6
> -NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
> -NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
> +NFS_UTILS_VERSION = nfs-utils-1-3-2
> +NFS_UTILS_SITE = git://git.linux-nfs.org/projects/steved/nfs-utils.git

 Anything wrong with https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.2/ ?


 Regards,
 Arnout

>  NFS_UTILS_LICENSE = GPLv2+
>  NFS_UTILS_LICENSE_FILES = COPYING
>  NFS_UTILS_AUTORECONF = YES
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
