From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Apr 2021 20:26:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgis: add optional protobuf-c
 dependency
Message-ID: <20210422182641.654969-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-cross-compilation-with-protobuf-c.patch | 42 +++++++++++++++++++
 package/postgis/postgis.mk                    | 10 ++++-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch

diff --git a/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch b/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
new file mode 100644
index 0000000000..b415edf0b8
--- /dev/null
+++ b/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
@@ -0,0 +1,42 @@
+From 8b80c4bd848ff3d71b998dc8a4bd42627ed72581 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 17 Apr 2021 11:58:19 +0200
+Subject: [PATCH] configure.ac: fix cross-compilation with protobuf-c
+
+Try to retrieve the version from pkg-config to avoid the following
+error:
+
+checking protobuf-c version... configure: error: in `/home/fabrice/buildroot/output/build/postgis-3.1.1':
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/postgis/postgis/commit/8b80c4bd848ff3d71b998dc8a4bd42627ed72581]
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 48ba070a40..df75fe6601 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1004,6 +1004,7 @@ if test "$CHECK_PROTOBUF" != "no"; then
+ 		PKG_CHECK_MODULES([PROTOBUFC], [libprotobuf-c >= 1.1.0], [
+ 				PROTOBUF_CPPFLAGS="$PROTOBUFC_CFLAGS";
+ 				PROTOBUF_LDFLAGS="$PROTOBUFC_LIBS";
++				PROTOC_VERSION=`$PKG_CONFIG libprotobuf-c --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\100\200\3/'`
+ 			], [
+ 				AC_MSG_RESULT([libprotobuf-c not found in pkg-config])
+ 			])
+@@ -1054,7 +1055,10 @@ if test "$CHECK_PROTOBUF" != "no"; then
+ 		[])
+ 
+ 	AC_MSG_CHECKING([protobuf-c version])
+-	AC_PROTOBUFC_VERSION([PROTOC_VERSION])
++	dnl Return the protobuf-c version number if not detected by pkg-config
++	if test "x$PROTOC_VERSION" = "x"; then
++		AC_PROTOBUFC_VERSION([PROTOC_VERSION])
++	fi
+         if test ! "$PROTOC_VERSION" -ge 1001000; then
+                 AC_MSG_ERROR("Old protobuf-c release found but 1.1.0 is required. You can disable MVT and Geobuf support using --without-protobuf")
+         fi
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index aa370b96ac..df44cf4d7a 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -27,8 +27,7 @@ POSTGIS_CONF_ENV += CFLAGS="$(POSTGIS_CFLAGS)"
 POSTGIS_CONF_OPTS += \
 	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
 	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
-	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config \
-	--without-protobuf
+	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
 
 ifeq ($(BR2_PACKAGE_LIBGDAL),y)
 POSTGIS_DEPENDENCIES += libgdal
@@ -48,4 +47,11 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
 POSTGIS_DEPENDENCIES += pcre
 endif
 
+ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
+POSTGIS_DEPENDENCIES += protobuf-c
+POSTGIS_CONF_OPTS += --with-protobuf
+else
+POSTGIS_CONF_OPTS += --without-protobuf
+endif
+
 $(eval $(autotools-package))
-- 
2.30.2
