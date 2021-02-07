From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 7 Feb 2021 11:57:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgis: new package
In-Reply-To: <20210126133908.680621-1-fido_max@inbox.ru>
References: <20210126133908.680621-1-fido_max@inbox.ru>
Message-ID: <20210207115757.65aa48fa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

thanks for the patch, did a (compile) test of the package, found one
major problem, fixed by [1]...

And some minor check-package warnings to improve, see below...

On Tue, 26 Jan 2021 16:39:08 +0300, Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> PostGIS is a spatial database extender for PostgreSQL object-relational database.
> It adds support for geographic objects allowing location queries to be run in SQL.
>
> https://postgis.net/
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/Config.in                             |  1 +
>  ...VE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 +++++++++++++++++
>  ...fig-to-get-PROJ-version-if-available.patch | 36 +++++++++++++++++++
>  ...S_DEBUG_LEVEL-define-to-configure.ac.patch | 29 +++++++++++++++
>  ...e-forced-static-linking-of-liblwgeom.patch | 31 ++++++++++++++++
>  package/postgis/Config.in                     | 12 +++++++
>  package/postgis/postgis.hash                  |  3 ++
>  package/postgis/postgis.mk                    | 31 ++++++++++++++++
>  8 files changed, 175 insertions(+)
>  create mode 100644 package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
>  create mode 100644 package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch
>  create mode 100644 package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
>  create mode 100644 package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch
>  create mode 100644 package/postgis/Config.in
>  create mode 100644 package/postgis/postgis.hash
>  create mode 100644 package/postgis/postgis.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 06dfc32cc6..5ed3f5df8f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1401,6 +1401,7 @@ menu "Database"
>  	source "package/mongodb/Config.in"
>  	source "package/mysql/Config.in"
>  	source "package/postgresql/Config.in"
> +	source "package/postgis/Config.in"
>  	source "package/redis/Config.in"
>  	source "package/rocksdb/Config.in"
>  	source "package/sqlcipher/Config.in"
> diff --git a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
> new file mode 100644
> index 0000000000..7c9e46b7af
> --- /dev/null
> +++ b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
> @@ -0,0 +1,32 @@
> +From 1bbc5b921d6b444cbeb505e67e4a4edcc696f592 Mon Sep 17 00:00:00 2001
> +From: fidomax <adobegitler@gmail.com>
> +Date: Tue, 26 Jan 2021 07:33:17 +0300
> +Subject: [PATCH 1/4] Add HAVE_VASPRINTF HAVE_ASPRINTF templates

package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch:4: generate your patches with 'git format-patch -N'

> +
> +It fixes autoreconf error:
> +autoheader: warning: missing template: HAVE_ASPRINTF
> +autoheader: Use AC_DEFINE([HAVE_ASPRINTF], [], [Description])
> +autoheader: warning: missing template: HAVE_VASPRINTF
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://github.com/postgis/postgis/commit/d0ac5df49961d1d1a74b894f9941b973c0695c11.patch
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9ac7051bb..dddb3aef7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -11,6 +11,8 @@ dnl **********************************************************************
> +
> + AC_INIT()
> + AC_CONFIG_HEADERS([postgis_config.h])
> ++AH_TEMPLATE([HAVE_VASPRINTF])
> ++AH_TEMPLATE([HAVE_ASPRINTF])
> + AC_CONFIG_MACRO_DIR([macros])
> + AC_CONFIG_AUX_DIR([build-aux])
> + AC_PROG_INSTALL
> +--
> +2.29.2
> +
> diff --git a/package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch b/package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch
> new file mode 100644
> index 0000000000..cfb58853b5
> --- /dev/null
> +++ b/package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch
> @@ -0,0 +1,36 @@
> +From 6d78c4d09858af136ba7b3b1cbb73f82f4cc1864 Mon Sep 17 00:00:00 2001
> +From: fidomax <adobegitler@gmail.com>
> +Date: Tue, 26 Jan 2021 08:48:17 +0300
> +Subject: [PATCH 2/4] Use pkg-config to get PROJ version if available

package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch:4: generate your patches with 'git format-patch -N'

> +
> +In case of cross-compile AC_PROJ_VERSION([POSTGIS_PROJ_VERSION]) fails.
> +So try to get version by pkg-config first
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://github.com/postgis/postgis/commit/b40c456d51bbd5cb4c15ffd1694a9a7266fe5bcf.patch
> +---
> + configure.ac | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index dddb3aef7..bee78800a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -888,7 +888,13 @@ AC_CHECK_HEADER([proj_api.h],
> + 	)
> +
> + dnl Return the PROJ.4 version number
> +-AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
> ++if test ! -z "$PKG_CONFIG"; then
> ++	PKG_CHECK_MODULES([PROJ], [proj], [
> ++		POSTGIS_PROJ_VERSION=`$PKG_CONFIG proj --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\1\2/'`
> ++	], [])
> ++else
> ++	AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
> ++fi
> + AC_DEFINE_UNQUOTED([POSTGIS_PROJ_VERSION], [$POSTGIS_PROJ_VERSION], [PROJ library version])
> + AC_SUBST([POSTGIS_PROJ_VERSION])
> + CPPFLAGS="$CPPFLAGS_SAVE"
> +--
> +2.29.2
> +
> diff --git a/package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch b/package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
> new file mode 100644
> index 0000000000..b883106609
> --- /dev/null
> +++ b/package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
> @@ -0,0 +1,29 @@
> +From b9a9518c5cf34189524d6b63c069d383c468d2a1 Mon Sep 17 00:00:00 2001
> +From: fidomax <adobegitler@gmail.com>
> +Date: Tue, 26 Jan 2021 09:17:17 +0300
> +Subject: [PATCH 3/4] Add POSTGIS_DEBUG_LEVEL define to configure.ac

package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch:4: generate your patches with 'git format-patch -N'

> +
> +In case of using autoreconf "#define POSTGIS_DEBUG_LEVEL 0" is removed from postgis_config.h.in so build failed with undefined POSTGIS_DEBUG_LEVEL.
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://github.com/postgis/postgis/commit/2b2c2cb159cfcaacb75a4e74f17bd2834d61acd0.patch
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bee78800a..3dbd6f525 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1137,6 +1137,8 @@ else
> +     CPPFLAGS="-DNDEBUG $CPPFLAGS"
> + fi
> +
> ++AC_DEFINE([POSTGIS_DEBUG_LEVEL], [0], [Define debug level. Default 0])
> ++
> + dnl ===========================================================================
> + dnl Allow the developer to disable the automatic updates of postgis_revision.h
> + dnl with --without-phony-revision
> +--
> +2.29.2
> +
> diff --git a/package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch
> new file mode 100644
> index 0000000000..3507f57d31
> --- /dev/null
> +++ b/package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch
> @@ -0,0 +1,31 @@
> +From 50a6dd09d1c6c1911e4c1a7515d71f07effe4a50 Mon Sep 17 00:00:00 2001
> +From: fidomax <adobegitler@gmail.com>
> +Date: Tue, 26 Jan 2021 09:49:19 +0300
> +Subject: [PATCH 4/4] Disable forced static linking of liblwgeom

package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch:4: generate your patches with 'git format-patch -N'

> +
> +In case of shared libs build fails:
> +ld: cannot find -lgeos_c
> +ld: attempted static link of dynamic object `/usr/lib/libproj.so'
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://github.com/postgis/postgis/commit/98070faad220e12fcaed9a583a70a37c510b7c6b.patch
> +---
> + loader/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/loader/Makefile.in b/loader/Makefile.in
> +index 9aebfe07f..9a0c90d3a 100644
> +--- a/loader/Makefile.in
> ++++ b/loader/Makefile.in
> +@@ -44,7 +44,7 @@ ICONV_CFLAGS=@ICONV_CFLAGS@
> +
> + # liblwgeom
> + LIBLWGEOM=../liblwgeom/liblwgeom.la
> +-LDFLAGS += -static $(LIBLWGEOM)
> ++LDFLAGS += $(LIBLWGEOM)
> +
> + # GTK includes and libraries
> + GTK_CFLAGS = @GTK_CFLAGS@ @IGE_MAC_CFLAGS@
> +--
> +2.29.2
> +
> diff --git a/package/postgis/Config.in b/package/postgis/Config.in
> new file mode 100644
> index 0000000000..b04de3f5db
> --- /dev/null
> +++ b/package/postgis/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_POSTGIS
> +	bool "postgis"
> +	depends on BR2_PACKAGE_POSTGRESQL_FULL
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBGEOS
> +	select BR2_PACKAGE_PROJ
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  PostGIS is a spatial database extender for PostgreSQL object-relational database.
> +	  It adds support for geographic objects allowing location queries to be run in SQL.

package/postgis/Config.in:9: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/postgis/Config.in:10: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

> +
> +	  https://postgis.net/
> diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
> new file mode 100644
> index 0000000000..0abf2f7297
> --- /dev/null
> +++ b/package/postgis/postgis.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  da06e2456876cd0c6a9bee0636ff700982e900c597d1e4cb80a99a2623400201  postgis-3.1.0.tar.gz
> +sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> new file mode 100644
> index 0000000000..85102d323a
> --- /dev/null
> +++ b/package/postgis/postgis.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# postgis
> +#
> +################################################################################
> +
> +POSTGIS_VERSION = 3.1.0
> +POSTGIS_SITE = https://download.osgeo.org/postgis/source
> +# parallel build issues
> +POSTGIS_MAKE = $(MAKE1)
> +POSTGIS_LICENSE = GPL
> +POSTGIS_LICENSE_FILES = LICENSE
> +POSTGIS_AUTORECONF = YES
> +
> +POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
> +
> +POSTGIS_CONF_OPTS += --with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config --with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config
> +
> +ifeq ($(BR2_PACKAGE_LIBGDAL),y)
> +POSTGIS_DEPENDENCIES += libgdal
> +else
> +POSTGIS_CONF_OPTS += --without-raster
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PROTOBUF),y)
> +POSTGIS_DEPENDENCIES += protobuf
> +else
> +POSTGIS_CONF_OPTS += --without-protobuf
> +endif
> +
> +$(eval $(autotools-package))

Regards,
Peter

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20210207105028.24251-1-ps.report at gmx.net/
