From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Apr 2021 23:07:54 +0200
Subject: [Buildroot] [git commit] package/postgis: new package
Message-ID: <20210412204258.5E7208392F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb1034455de299876dfd03c5074d8bb9622f873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PostGIS is a spatial database extender for PostgreSQL object-relational
database. It adds support for geographic objects allowing location
queries to be run in SQL.

On microblazeel with the bootlin toolchain, the build fails with an ICE:

  during RTL pass: reload
  .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp: In static member function ???static std::unique_ptr<std::vector<geos::geom::Coordinate> > geos::geom::util::Densifier::densifyPoints(geos::geom::Coordinate::Vect, double, const geos::geom::PrecisionModel*)???:
  .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp:128:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1155
  128 | }
      | ^

Since it's unlikely that postgis will ever be used on a microblaze,
simply disable it.

https://postgis.net/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout:
 - Move postgresql dependency to package/Config.in, to satisfy
   alphabetical ordering in the menu while keeping it below postgresql.
 - Add dependency on !microblaze.
 - Add comment for dependencies.
 - Add positive version of --with-raster and --with-protobuf to
   _CONF_OPTS.
 - Expand BSD to BSD-2-Clause.
]
---
 package/Config.in                                  |  3 ++
 ...dd-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 +++++++++++++++++
 ...OSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch | 29 +++++++++++++++
 ...isable-forced-static-linking-of-liblwgeom.patch | 31 ++++++++++++++++
 ...g-config-to-get-PROJ-version-if-available.patch | 42 ++++++++++++++++++++++
 package/postgis/Config.in                          | 23 ++++++++++++
 package/postgis/postgis.hash                       |  3 ++
 package/postgis/postgis.mk                         | 37 +++++++++++++++++++
 8 files changed, 200 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1269bc7b51..19f2606b6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1406,6 +1406,9 @@ menu "Database"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
+if BR2_PACKAGE_POSTGRESQL_FULL
+	source "package/postgis/Config.in"
+endif
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
index 0000000000..12d8899a2b
--- /dev/null
+++ b/package/postgis/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_POSTGIS
+	bool "postgis"
+	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # libgeos, proj
+	select BR2_PACKAGE_LIBGEOS
+	select BR2_PACKAGE_PROJ
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  PostGIS is a spatial database extender for PostgreSQL
+	  object-relational database. It adds support for
+	  geographic objects allowing location queries
+	  to be run in SQL.
+
+	  https://postgis.net/
+
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7"
+	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
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
index 0000000000..1661f48ff2
--- /dev/null
+++ b/package/postgis/postgis.mk
@@ -0,0 +1,37 @@
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
+POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
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
+POSTGIS_CONF_OPTS += --with-raster
+else
+POSTGIS_CONF_OPTS += --without-raster
+endif
+
+ifeq ($(BR2_PACKAGE_PROTOBUF),y)
+POSTGIS_DEPENDENCIES += protobuf
+POSTGIS_CONF_OPTS += --with-protobuf
+else
+POSTGIS_CONF_OPTS += --without-protobuf
+endif
+
+$(eval $(autotools-package))
