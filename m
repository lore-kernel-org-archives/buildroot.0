From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 27 Jun 2016 19:03:00 +0000
Subject: [Buildroot] [PATCH] Reiserfsprogs
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE8311A1@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hate it when I leave my ruler across the top.

If you want me to resubmit, no problem there.

I really hate using M$ LookOut!

Andy

> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of ANDY KENNEDY
> Sent: Monday, June 27, 2016 1:46 PM
> To: 'buildroot at busybox.net'
> Subject: [Buildroot] [PATCH] Reiserfsprogs
> 
> 1234567890123456789012345678901234567890123456789012345678901234567890
> This patch was attempted earlier by Rod Boyce:
> 
> All,
> 
> Attached is a patch that adds reiserfsprogs to build root.
> 
> Regards,
> Rod Boyce
> Index: package/Config.in
> 
> I have tweaked it to make it fit into the latest git repo.
> 
> This patch adds support for reiserfsprogs.
> 
> Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
> ---
> diff -Naur a/package/Config.in b/package/Config.in
> --- a/package/Config.in	2016-03-01 14:47:30.000000000 -0600
> +++ b/package/Config.in	2016-06-27 13:26:49.889497184 -0500
> @@ -180,6 +180,7 @@
>  	source "package/mtools/Config.in"
>  	source "package/nfs-utils/Config.in"
>  	source "package/ntfs-3g/Config.in"
> +	source "package/reiserfsprogs/Config.in"
>  	source "package/simicsfs/Config.in"
>  	source "package/sp-oops-extract/Config.in"
>  	source "package/squashfs/Config.in"
> diff -Naur a/package/reiserfsprogs/Config.in b/package/reiserfsprogs/Config.in
> --- a/package/reiserfsprogs/Config.in	1969-12-31 18:00:00.000000000 -0600
> +++ b/package/reiserfsprogs/Config.in	2016-06-24 14:03:06.000000000 -0500
> @@ -0,0 +1,36 @@
> +
> +config BR2_PACKAGE_REISERFSPROGS
> +	bool "reiserfsprogs"
> +	select BR2_PACKAGE_ACL
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_E2FSPROGS
> +	help
> +	  The reiserfs file system utilities.
> +
> +	  https://reiser4.wiki.kernel.org/index.php/Main_Page
> +
> +if BR2_PACKAGE_REISERFSPROGS
> +
> +config BR2_PACKAGE_REISERFSPROGS_MKREISERFS
> +	bool "mkreiserfs"
> +	default y
> +
> +config BR2_PACKAGE_REISERFSPROGS_REISERFSCK
> +	bool "reiserfsck"
> +	default y
> +
> +config BR2_PACKAGE_REISERFSPROGS_RESIZE_REISERFS
> +	bool "resize_reiserfs"
> +	default y
> +
> +config BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE
> +	bool "reiserfstune"
> +	default y
> +
> +config BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS
> +	bool "debugreiserfs"
> +	default y
> +
> +endif
> diff -Naur a/package/reiserfsprogs/Config.in.host b/package/reiserfsprogs/Config.in.host
> --- a/package/reiserfsprogs/Config.in.host	1969-12-31 18:00:00.000000000 -0600
> +++ b/package/reiserfsprogs/Config.in.host	2016-06-24 14:04:44.000000000 -0500
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_REISERFSPROGS
> +	bool "host reiserfsprogs"
> +	help
> +	  The reiserfs file system utilities.
> +
> +	  https://reiser4.wiki.kernel.org/index.php/Main_Page
> diff -Naur a/package/reiserfsprogs/reiserfsprogs.mk b/package/reiserfsprogs/reiserfsprogs.mk
> --- a/package/reiserfsprogs/reiserfsprogs.mk	1969-12-31 18:00:00.000000000 -0600
> +++ b/package/reiserfsprogs/reiserfsprogs.mk	2016-06-24 14:04:20.000000000 -0500
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# reiserfsprogs
> +#
> +################################################################################
> +
> +REISERFSPROGS_VERSION = 3.6.25
> +REISERFSPROGS_SITE =
> ftp://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v$(REISERFSPROGS_VERSION)
> +REISERFSPROGS_LICENSE = GPLv2
> +REISERFSPROGS_LICENSE_FILES = COPYING README
> +REISERFSPROGS_CONF_ENV = LIBS='-lcom_err -luuid -lpthread -lrt'
> +REISERFSPROGS_DEPENDENCIES = util-linux e2fsprogs acl
> +
> +# binaries to keep or remove
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_MKREISERFS) += usr/local/sbin/mkreiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_MKREISERFS) += usr/local/sbin/mkfs.reiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSCK) += usr/local/sbin/reiserfsck
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSCK) += usr/local/sbin/fsck.reiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_RESIZE_REISERFS) +=
> usr/local/sbin/resize_reiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE) += usr/local/sbin/reiserfstune
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE) +=
> usr/local/sbin/tunefs.reiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS) += usr/local/sbin/debugreiserfs
> +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS) +=
> usr/local/sbin/debugfs.reiserfs
> +
> +define REISERFSPROGS_TARGET_REMOVE_UNNEEDED
> +	rm -f $(addprefix $(TARGET_DIR)/, $(REISERFSPROGS_BINTARGETS_))
> +endef
> +
> +REISERFSPROGS_POST_INSTALL_TARGET_HOOKS += REISERFSPROGS_TARGET_REMOVE_UNNEEDED
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
