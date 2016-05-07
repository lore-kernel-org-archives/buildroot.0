From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:38:19 +0200
Subject: [Buildroot] [PATCH 22/34] High availability: add packages
In-Reply-To: <1462002570-14706-22-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-22-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507223819.29dcfd5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:18 +0200, Gilles Chanteperdrix wrote:
> cluster-glue
> corosync
> heartbeat
> libqb
> pacemaker

This should be split in a series of patches, with one package per patch.

>  menu "Javascript"
>  	source "package/angularjs/Config.in"
>  	source "package/bootstrap/Config.in"
> diff --git a/package/cluster-glue/0001-fix-cross-compile.patch b/package/cluster-glue/0001-fix-cross-compile.patch
> new file mode 100644
> index 0000000..2f8bd47
> --- /dev/null
> +++ b/package/cluster-glue/0001-fix-cross-compile.patch
> @@ -0,0 +1,26 @@

All patches need a description and Signed-off-by line.


> diff --git a/package/cluster-glue/Config.in b/package/cluster-glue/Config.in
> new file mode 100644
> index 0000000..8b39152
> --- /dev/null
> +++ b/package/cluster-glue/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_CLUSTER_GLUE
> +	bool "cluster-glue"
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID

This looks wrong, for two reasons:

 (1) Because you are not replicating the dependencies of util-linux
     here.

 (2) Because this package has many more packages in its
     <pkg>_DEPENDENCIES variable than just util-linux. For example,
     libxml2, libglib2, etc. They should all be selected here as well.


> +CLUSTER_GLUE_VERSION = 0a7add1d9996
> +CLUSTER_GLUE_SOURCE = $(CLUSTER_GLUE_VERSION).tar.bz2
> +CLUSTER_GLUE_SITE =  http://hg.linux-ha.org/glue/archive
> +CLUSTER_GLUE_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
> +CLUSTER_GLUE_LICENSE_FILES = COPYING COPYING.LIB
> +CLUSTER_GLUE_DEPENDENCIES += host-pkgconf host-python libtool util-linux bzip2 libglib2 libxml2

The dependency on libtool is useless, it's automatically added by
<pkg>_AUTORECONF = YES.

> +
> +CLUSTER_GLUE_INSTALL_STAGING = YES
> +CLUSTER_GLUE_AUTORECONF = YES

Add a comment above saying why it's needed.

> diff --git a/package/corosync/Config.in b/package/corosync/Config.in
> new file mode 100644
> index 0000000..3855136
> --- /dev/null
> +++ b/package/corosync/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_COROSYNC
> +	bool "corosync"

Same question as usual: no dependency on threads? MMU? Any other
toolchain feature?

Your .mk file has a dependency on libnss, so you must select it.

> +################################################################################
> +#
> +# corosync
> +#
> +################################################################################
> +
> +COROSYNC_VERSION = 1.4.8
> +COROSYNC_SOURCE = corosync-$(COROSYNC_VERSION).tar.gz
> +COROSYNC_SITE = http://build.clusterlabs.org/corosync/releases
> +COROSYNC_LICENSE = BSD-3c except for crypto.[ch], public domain for crypto.[ch]

Should be:

	BSD-3c (except for crypto.[ch]), Public Domain (crypto.[ch])

> +COROSYNC_LICENSE_FILES = LICENSE
> +COROSYNC_INSTALL_STAGING = YES
> +COROSYNC_DEPENDENCIES += host-pkgconf libnss
> +
> +COROSYNC_CONF_OPTS += ac_cv_func_fnmatch_works=yes
> +
> +$(eval $(autotools-package))
> diff --git a/package/heartbeat/0001-fix-cross-compilation.patch b/package/heartbeat/0001-fix-cross-compilation.patch
> new file mode 100644
> index 0000000..4a653f6
> --- /dev/null
> +++ b/package/heartbeat/0001-fix-cross-compilation.patch

Description + SoB and upstream status (ditto for all patches).

> diff --git a/package/heartbeat/Config.in b/package/heartbeat/Config.in
> new file mode 100644
> index 0000000..0f8ee80
> --- /dev/null
> +++ b/package/heartbeat/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HEARTBEAT
> +	bool "heartbeat"
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_IPROUTE2

Replication of dependencies needed here.

> diff --git a/package/heartbeat/heartbeat.mk b/package/heartbeat/heartbeat.mk
> new file mode 100644
> index 0000000..eedf40f
> --- /dev/null
> +++ b/package/heartbeat/heartbeat.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# heartbeat
> +#
> +################################################################################

Nit: missing empty line.

> +HEARTBEAT_VERSION = 958e11be8686
> +HEARTBEAT_SOURCE = $(HEARTBEAT_VERSION).tar.bz2
> +HEARTBEAT_SITE =  http://hg.linux-ha.org/heartbeat-STABLE_3_0/archive
> +HEARTBEAT_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
> +HEARTBEAT_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
> +HEARTBEAT_DEPENDENCIES += host-pkgconf host-python libtool util-linux bzip2 cluster-glue

libtool dependency not needed. Please sync your Config.in with this
dependency line by selecting all relevant packages.

Another question: is Python 2.x absolutely needed on the host, or can
it work with Python 3.x as well ?

[I'm skipping lots of additional code, for which the same comments
appply.]


> +# This program configure script expects the proper -I flags in CFLAGS and not
> +# CPPFLAGS
> +PACEMAKER_CONF_OPTS += \
> +	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/heartbeat" \
> +	ac_cv_path_HTML2TXT="" \
> +	ac_cv_path_HELP2MAN="" \
> +	ac_cv_path_POD2MAN="" \
> +	ac_cv_path_ASCIIDOC="" \
> +	ac_cv_path_PUBLICAN="" \
> +	ac_cv_path_INKSCAPE="" \
> +	ac_cv_path_XSLTPROC="" \
> +	ac_cv_path_XMLCATALOG="" \
> +	ac_cv_path_FOP="" \

We usually just assign to the empty value, and it's normally sufficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
