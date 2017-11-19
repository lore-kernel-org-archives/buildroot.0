From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Nov 2017 15:26:41 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1
Message-ID: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove 0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch,
it does not have been sent upstream but issue has been fixed by
https://github.com/Motion-Project/motion/commit/3b7164f7f9c2b123f850f8cd1bc0a860ca51c0fe#diff-67e997bcfdac55191033d57a16d1408a
- 0002-Rename-base64_encode.patch has been integrated into this version
- --without-jpeg-turbo has been deleted from configure.ac
- libsdl dependency has been removed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch |  31 ------
 package/motion/0002-Rename-base64_encode.patch     | 116 ---------------------
 package/motion/motion.hash                         |   3 +-
 package/motion/motion.mk                           |  22 +---
 4 files changed, 5 insertions(+), 167 deletions(-)
 delete mode 100644 package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
 delete mode 100644 package/motion/0002-Rename-base64_encode.patch

diff --git a/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch b/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
deleted file mode 100644
index 4211fe67b..000000000
--- a/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5a1081d36bf2861ffc882354c583a0eb6b0ee3d5 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 25 Oct 2016 21:27:41 +0200
-Subject: [PATCH] configure.ac: use given CFLAGS/LIBS for mysqlclient library
- check
-
-Needed for static linking of mysql with enabled libz.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5782fd6..aa5d9dd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -618,8 +618,8 @@ else
- 		#LDFLAGS="-L$MYSQL_LIBDIR"
- 		saved_CFLAGS=$CFLAGS
- 		saved_LIBS=$LIBS
--		CFLAGS="-I$MYSQL_INCDIR"
--		LIBS="-L$MYSQL_LIBDIR"
-+		CFLAGS="-I$MYSQL_INCDIR $CFLAGS"
-+		LIBS="-L$MYSQL_LIBDIR $LIBS"
- 		AC_CHECK_LIB(mysqlclient,mysql_init,[
- 					TEMP_LIBS="$TEMP_LIBS -L$MYSQL_LIBDIR -lmysqlclient -lz"
- 					TEMP_CFLAGS="$TEMP_CFLAGS -I$MYSQL_INCDIR"
--- 
-2.8.1
-
diff --git a/package/motion/0002-Rename-base64_encode.patch b/package/motion/0002-Rename-base64_encode.patch
deleted file mode 100644
index 8b0630925..000000000
--- a/package/motion/0002-Rename-base64_encode.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 0da5428bdfe67eb17ee03f22f68e66b044abdf70 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Sun, 30 Oct 2016 19:30:46 +0100
-Subject: [PATCH] Rename base64_encode
-
-base64_encode is already defined in gnutls so rename it as
-motion_base64_encode to prevent a definition clash when linking
-statically with gnutls
-
-Fixes:
-  - http://autobuild.buildroot.org/results/592672b8826f4c731c50d29725da964d876573c4
-
-Applied upstream:
-  - https://github.com/Motion-Project/motion/commit/cc3c25527d4bada0fe98a734fa2df29f8d6cf1ad
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- netcam.c      | 4 ++--
- netcam_wget.c | 4 ++--
- netcam_wget.h | 2 +-
- stream.c      | 4 ++--
- webhttpd.c    | 4 ++--
- 5 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/netcam.c b/netcam.c
-index a9df33a..38d4ca3 100644
---- a/netcam.c
-+++ b/netcam.c
-@@ -2019,7 +2019,7 @@ static int netcam_http_build_url(netcam_context_ptr netcam, struct url_t *url)
-     else
-         ptr = url->userpass;
- 
--    /* base64_encode needs up to 3 additional chars. */
-+    /* motion_base64_encode needs up to 3 additional chars. */
-     if (ptr) {
-         userpass = mymalloc(strlen(ptr) + 3);
-         strcpy(userpass, ptr);
-@@ -2045,7 +2045,7 @@ static int netcam_http_build_url(netcam_context_ptr netcam, struct url_t *url)
-         /* Allocate space for the base64-encoded string. */
-         encuserpass = mymalloc(BASE64_LENGTH(strlen(userpass)) + 1);
-         /* Fill in the value. */
--        base64_encode(userpass, encuserpass, strlen(userpass));
-+        motion_base64_encode(userpass, encuserpass, strlen(userpass));
-         /* Now create the last part (authorization) of the request. */
-         request_pass = mymalloc(strlen(connect_auth_req) +
-                                 strlen(encuserpass) + 1);
-diff --git a/netcam_wget.c b/netcam_wget.c
-index 4491760..f5c1dc2 100644
---- a/netcam_wget.c
-+++ b/netcam_wget.c
-@@ -210,13 +210,13 @@ int skip_lws(const char *string)
- 
- 
- /**
-- * base64_encode
-+ * motion_base64_encode
-  *
-  *   Encode the string S of length LENGTH to base64 format and place it
-  *   to STORE.  STORE will be 0-terminated, and must point to a writable
-  *   buffer of at least 1+BASE64_LENGTH(length) bytes.  
-  */
--void base64_encode(const char *s, char *store, int length)
-+void motion_base64_encode(const char *s, char *store, int length)
- {
-     /* Conversion table.  */
-     static const char tbl[64] = {
-diff --git a/netcam_wget.h b/netcam_wget.h
-index 9a091bf..e9b02b5 100644
---- a/netcam_wget.h
-+++ b/netcam_wget.h
-@@ -72,7 +72,7 @@ int rbuf_read_bufferful(netcam_context_ptr);
- /* How many bytes it will take to store LEN bytes in base64.  */
- #define BASE64_LENGTH(len) (4 * (((len) + 2) / 3))
- 
--void base64_encode(const char *, char *, int);
-+void motion_base64_encode(const char *, char *, int);
- char *strdupdelim(const char *, const char *);
- int http_process_type(const char *, void *);
- 
-diff --git a/stream.c b/stream.c
-index 04e67ee..ca201ac 100644
---- a/stream.c
-+++ b/stream.c
-@@ -211,10 +211,10 @@ static void* handle_basic_auth(void* param)
- 
-         authentication = mymalloc(BASE64_LENGTH(auth_size) + 1);
-         userpass = mymalloc(auth_size + 4);
--        /* base64_encode can read 3 bytes after the end of the string, initialize it. */
-+        /* motion_base64_encode can read 3 bytes after the end of the string, initialize it. */
-         memset(userpass, 0, auth_size + 4);
-         strcpy(userpass, p->conf->stream_authentication);
--        base64_encode(userpass, authentication, auth_size);
-+        motion_base64_encode(userpass, authentication, auth_size);
-         free(userpass);
- 
-         if (strcmp(auth, authentication)) {
-diff --git a/webhttpd.c b/webhttpd.c
-index 6df2d11..36e8beb 100644
---- a/webhttpd.c
-+++ b/webhttpd.c
-@@ -2616,10 +2616,10 @@ void httpd_run(struct context **cnt)
- 
-         authentication = mymalloc(BASE64_LENGTH(auth_size) + 1);
-         userpass = mymalloc(auth_size + 4);
--        /* base64_encode can read 3 bytes after the end of the string, initialize it */
-+        /* motion_base64_encode can read 3 bytes after the end of the string, initialize it */
-         memset(userpass, 0, auth_size + 4);
-         strcpy(userpass, cnt[0]->conf.webcontrol_authentication);
--        base64_encode(userpass, authentication, auth_size);
-+        motion_base64_encode(userpass, authentication, auth_size);
-         free(userpass);
-     }
- 
--- 
-2.5.0
-
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index e8591179e..40cb66b7e 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	2f67669a09ce0481ecd987028dae1c5cb135dfdc3c254c06ab7c9ca0c6c183f0	motion-release-4.0.1.tar.gz
+sha256	277029c80df0d37deefbbea6d15c66a9067d9166fe8f76eb5f90aa6e97aa9741	motion-release-4.1.tar.gz
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index ce64a9328..dfbb70d64 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,17 +4,15 @@
 #
 ################################################################################
 
-MOTION_VERSION = release-4.0.1
+MOTION_VERSION = release-4.1
 MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
 MOTION_DEPENDENCIES = host-pkgconf jpeg
-# From git and patched configure.ac
+# From git
 MOTION_AUTORECONF = YES
 
-# motion does not use any specific function of jpeg-turbo, so just relies on
-# jpeg selection
-MOTION_CONF_OPTS += --without-jpeg-turbo --without-optimizecpu
+MOTION_CONF_OPTS += --without-optimizecpu
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
 MOTION_DEPENDENCIES += ffmpeg
@@ -29,10 +27,6 @@ MOTION_CONF_OPTS += \
 	--with-mysql \
 	--with-mysql-include=$(STAGING_DIR)/usr/include/mysql \
 	--with-mysql-lib=$(STAGING_DIR)/usr/lib
-# static link of mysql needs -lz
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_ZLIB),yy)
-MOTION_CONF_ENV += LIBS="-lz"
-endif
 else
 MOTION_CONF_OPTS += --without-mysql
 endif
@@ -47,16 +41,6 @@ else
 MOTION_CONF_OPTS += --without-pgsql
 endif
 
-ifeq ($(BR2_PACKAGE_SDL),y)
-MOTION_DEPENDENCIES += sdl
-MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
-# overwrite ac_cv_path_CONFIG_SDL in case sdl development is
-# installed on the host
-MOTION_CONF_ENV += ac_cv_path_CONFIG_SDL=$(STAGING_DIR)/usr/bin/sdl-config
-else
-MOTION_CONF_OPTS += --without-sdl
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 MOTION_DEPENDENCIES += sqlite
 MOTION_CONF_OPTS += --with-sqlite3
-- 
2.14.1
