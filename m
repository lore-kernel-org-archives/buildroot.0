From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 12 Feb 2021 07:37:06 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/postgis: new package
Message-ID: <20210212043706.7336-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PostGIS is a spatial database extender for PostgreSQL object-relational database.
It adds support for geographic objects allowing location queries to be run in SQL.

https://postgis.net/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3 (after review of Peter Seiderer):

 - Add dependencies description

Changes v1 -> v2 (after review of Peter Seiderer):

 - Bump version to 3.1.1
 - Explicit set cross-compile xml2-config path
 - Fixed check-package warnings
 - Fix POSTGIS_LICENSE


 package/Config.in                             |  1 +
 ...VE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 ++++++++++++++
 ...S_DEBUG_LEVEL-define-to-configure.ac.patch | 29 +++++++++++++
 ...e-forced-static-linking-of-liblwgeom.patch | 31 ++++++++++++++
 ...fig-to-get-PROJ-version-if-available.patch | 42 +++++++++++++++++++
 package/postgis/Config.in                     | 17 ++++++++
 package/postgis/postgis.hash                  |  3 ++
 package/postgis/postgis.mk                    | 35 ++++++++++++++++
 8 files changed, 190 insertions(+)
 create mode 100644 package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
 create mode 100644 package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
 create mode 100644 package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch
 create mode 100644 package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
 create mode 100644 package/postgis/Config.in
 create mode 100644 package/postgis/postgis.hash
 create mode 100644 package/postgis/postgis.mk

diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..cc37f572b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1401,6 +1401,7 @@ menu "Database"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
+	source "package/postgis/Config.in"
 	source "package/redis/Config.in"
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
diff --git a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
new file mode 100644
index 0000000000..3a40afddb2
--- /dev/null
+++ b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
@@ -0,0 +1,32 @@
+From 7bf2fc388df10bc1760cd06594f50da0c78ee3a2 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Tue, 26 Jan 2021 07:33:17 +0300
+Subject: [PATCH] Add HAVE_VASPRINTF HAVE_ASPRINTF templates
+
+It fixes autoreconf error:
+autoheader: warning: missing template: HAVE_ASPRINTF
+autoheader: Use AC_DEFINE([HAVE_ASPRINTF], [], [Description])
+autoheader: warning: missing template: HAVE_VASPRINTF
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/postgis/postgis/commit/d0ac5df49961d1d1a74b894f9941b973c0695c11.patch
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9ac7051bb..dddb3aef7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,6 +11,8 @@ dnl **********************************************************************
+ 
+ AC_INIT()
+ AC_CONFIG_HEADERS([postgis_config.h])
++AH_TEMPLATE([HAVE_VASPRINTF])
++AH_TEMPLATE([HAVE_ASPRINTF])
+ AC_CONFIG_MACRO_DIR([macros])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_PROG_INSTALL
+-- 
+2.30.0
+
diff --git a/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch b/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
new file mode 100644
index 0000000000..71409ca599
--- /dev/null
+++ b/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
@@ -0,0 +1,29 @@
+From 97d0cb4f4a6f3bec50729e3f896d4a84b796c5c6 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Tue, 26 Jan 2021 09:17:17 +0300
+Subject: [PATCH] Add POSTGIS_DEBUG_LEVEL define to configure.ac
+
+In case of using autoreconf "#define POSTGIS_DEBUG_LEVEL 0" is removed from postgis_config.h.in so build failed with undefined POSTGIS_DEBUG_LEVEL.
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/postgis/postgis/commit/2b2c2cb159cfcaacb75a4e74f17bd2834d61acd0.patch
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index dddb3aef7..86e1597ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1131,6 +1131,8 @@ else
+     CPPFLAGS="-DNDEBUG $CPPFLAGS"
+ fi
+ 
++AC_DEFINE([POSTGIS_DEBUG_LEVEL], [0], [Define debug level. Default 0])
++
+ dnl ===========================================================================
+ dnl Allow the developer to disable the automatic updates of postgis_revision.h
+ dnl with --without-phony-revision
+-- 
+2.30.0
+
diff --git a/package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch
new file mode 100644
index 0000000000..4329c9cd80
--- /dev/null
+++ b/package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch
@@ -0,0 +1,31 @@
+From 845c18c1288b7a96592901baadb198f96dd71c46 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Tue, 26 Jan 2021 09:49:19 +0300
+Subject: [PATCH] Disable forced static linking of liblwgeom
+
+In case of shared libs build fails:
+ld: cannot find -lgeos_c
+ld: attempted static link of dynamic object `/usr/lib/libproj.so'
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/postgis/postgis/commit/98070faad220e12fcaed9a583a70a37c510b7c6b.patch
+---
+ loader/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/loader/Makefile.in b/loader/Makefile.in
+index 9aebfe07f..9a0c90d3a 100644
+--- a/loader/Makefile.in
++++ b/loader/Makefile.in
+@@ -44,7 +44,7 @@ ICONV_CFLAGS=@ICONV_CFLAGS@
+ 
+ # liblwgeom
+ LIBLWGEOM=../liblwgeom/liblwgeom.la
+-LDFLAGS += -static $(LIBLWGEOM)
++LDFLAGS += $(LIBLWGEOM)
+ 
+ # GTK includes and libraries
+ GTK_CFLAGS = @GTK_CFLAGS@ @IGE_MAC_CFLAGS@
+-- 
+2.30.0
+
diff --git a/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch b/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
new file mode 100644
index 0000000000..1e65b98d3e
--- /dev/null
+++ b/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
@@ -0,0 +1,42 @@
+From 876a04a795fcb179e0dc802e260353012c4890f9 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <adobegitler@gmail.com>
+Date: Thu, 28 Jan 2021 08:12:57 +0300
+Subject: [PATCH] Use pkg-config to get PROJ version if available
+
+In case of cross-compile AC_PROJ_VERSION([POSTGIS_PROJ_VERSION]) fails.
+So try to get version by pkg-config first
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/postgis/postgis/commit/671a878982550e3c590d642620a6621b52c230c7.patch
+---
+ configure.ac | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86e1597ee..016f81c7d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -866,6 +866,7 @@ elif test ! -z "$PKG_CONFIG"; then
+ 		[
+ 			PROJ_CPPFLAGS="$PROJ_CFLAGS"
+ 			PROJ_LDFLAGS="$PROJ_LIBS"
++			POSTGIS_PROJ_VERSION=`$PKG_CONFIG proj --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\1\2/'`
+ 		],
+ 		[
+ 			PROJ_LDFLAGS="-lproj"
+@@ -887,8 +888,10 @@ AC_CHECK_HEADER([proj_api.h],
+ 		)]
+ 	)
+ 
+-dnl Return the PROJ.4 version number
+-AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
++dnl Return the PROJ.4 version number if not detected by pkg-config
++if test "x$POSTGIS_PROJ_VERSION" = "x"; then
++	AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
++fi
+ AC_DEFINE_UNQUOTED([POSTGIS_PROJ_VERSION], [$POSTGIS_PROJ_VERSION], [PROJ library version])
+ AC_SUBST([POSTGIS_PROJ_VERSION])
+ CPPFLAGS="$CPPFLAGS_SAVE"
+-- 
+2.30.0
+
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
new file mode 100644
index 0000000000..5a68059a51
--- /dev/null
+++ b/package/postgis/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_POSTGIS
+	bool "postgis"
+	depends on BR2_PACKAGE_POSTGRESQL_FULL
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # libgeos, proj
+	select BR2_PACKAGE_LIBGEOS
+	select BR2_PACKAGE_PROJ
+	select BR2_PACKAGE_LIBXML2
+	help
+	  PostGIS is a spatial database extender for PostgreSQL
+	  object-relational database. It adds support for
+	  geographic objects allowing location queries
+	  to be run in SQL.
+
+	  https://postgis.net/
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
new file mode 100644
index 0000000000..2f0d62728f
--- /dev/null
+++ b/package/postgis/postgis.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0e96afef586db6939d48fb22fbfbc9d0de5e6bc1722d6d553d63bb41441a2a7d  postgis-3.1.1.tar.gz
+sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
new file mode 100644
index 0000000000..4ab1590302
--- /dev/null
+++ b/package/postgis/postgis.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# postgis
+#
+################################################################################
+
+POSTGIS_VERSION = 3.1.1
+POSTGIS_SITE = https://download.osgeo.org/postgis/source
+# parallel build issues
+POSTGIS_MAKE = $(MAKE1)
+POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
+POSTGIS_LICENSE_FILES = LICENSE.TXT
+# configure.ac is patched so need to run autoreconf
+POSTGIS_AUTORECONF = YES
+
+POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
+
+POSTGIS_CONF_OPTS += \
+	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
+	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
+	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
+
+ifeq ($(BR2_PACKAGE_LIBGDAL),y)
+POSTGIS_DEPENDENCIES += libgdal
+else
+POSTGIS_CONF_OPTS += --without-raster
+endif
+
+ifeq ($(BR2_PACKAGE_PROTOBUF),y)
+POSTGIS_DEPENDENCIES += protobuf
+else
+POSTGIS_CONF_OPTS += --without-protobuf
+endif
+
+$(eval $(autotools-package))
-- 
2.30.0
