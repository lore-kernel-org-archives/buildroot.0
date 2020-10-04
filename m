From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 23:08:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.3.1
Message-ID: <20201004210807.2084836-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Call gettextsize and add a non upstreamable patch to remove
  po/Makefile.in: https://github.com/Motion-Project/motion/issues/1028
- --with-mysql-{include,lib} and --with-pgsql-{include,lib} have been
  dropped since version 4.3.0 and
  https://github.com/Motion-Project/motion/commit/0dc2ae9372cfd2705110ef25c8c85b246adb2dc6
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../motion/0001-Fix-build-with-GCC-10.patch   | 53 -------------------
 ...1-configure.ac-remove-po-Makefile.in.patch | 29 ++++++++++
 package/motion/motion.hash                    |  4 +-
 package/motion/motion.mk                      | 19 +++----
 4 files changed, 38 insertions(+), 67 deletions(-)
 delete mode 100644 package/motion/0001-Fix-build-with-GCC-10.patch
 create mode 100644 package/motion/0001-configure.ac-remove-po-Makefile.in.patch

diff --git a/package/motion/0001-Fix-build-with-GCC-10.patch b/package/motion/0001-Fix-build-with-GCC-10.patch
deleted file mode 100644
index a5684db965..0000000000
--- a/package/motion/0001-Fix-build-with-GCC-10.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a4a48baf86b18b792fb5e53648b4efd02b3db7b7 Mon Sep 17 00:00:00 2001
-From: Vasiliy Glazov <vascom2@gmail.com>
-Date: Sun, 8 Mar 2020 03:00:21 +0300
-Subject: [PATCH] Fix build with GCC 10.
-
-[Retrieved (and backported) from:
-https://github.com/Motion-Project/motion/commit/a4a48baf86b18b792fb5e53648b4efd02b3db7b7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/netcam.h    | 2 +-
- src/translate.c | 2 ++
- src/translate.h | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/netcam.h b/netcam.h
-index 2951d917..4ee0e1c8 100644
---- a/netcam.h
-+++ b/netcam.h
-@@ -113,7 +113,7 @@ typedef struct netcam_image_buff {
- } netcam_buff;
- typedef netcam_buff *netcam_buff_ptr;
- 
--struct netcam_caps {                    /* netcam capabilities: */
-+extern struct netcam_caps {                    /* netcam capabilities: */
-         unsigned char streaming;        /*  See the NCS_* defines */
-         unsigned char content_length;   /*  0 - unsupported     */
- } caps;
-diff --git a/translate.c b/translate.c
-index 0c9f1105..a212d9de 100644
---- a/translate.c
-+++ b/translate.c
-@@ -10,6 +10,8 @@
- #include "motion.h"
- #include "translate.h"
- 
-+int nls_enabled;
-+
- void translate_locale_chg(const char *langcd){
- #ifdef HAVE_GETTEXT
-     /* This routine is for development testing only.  It is not used for
-diff --git a/translate.h b/translate.h
-index 0832ffd8..eeba3745 100644
---- a/translate.h
-+++ b/translate.h
-@@ -10,7 +10,7 @@
- #ifndef _INCLUDE_TRANSLATE_H_
- #define _INCLUDE_TRANSLATE_H_
- 
--int nls_enabled;
-+extern int nls_enabled;
- 
- #ifdef HAVE_GETTEXT
- #   include <libintl.h>
diff --git a/package/motion/0001-configure.ac-remove-po-Makefile.in.patch b/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
new file mode 100644
index 0000000000..9b514bafcd
--- /dev/null
+++ b/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
@@ -0,0 +1,29 @@
+From 0e05d4116678de3a7d913177a8fc63f10e58ad24 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 18 Jan 2020 00:00:21 +0100
+Subject: [PATCH] configure.ac: remove po/Makefile.in
+
+The file po/Makefile.in is automatically added to AC_OUTPUT while using
+gettexize
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable]
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3876adb..221dacf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -471,7 +471,6 @@ LDFLAGS="$TEMP_LDFLAGS"
+ AC_CONFIG_FILES([
+ 	Makefile
+ 	src/Makefile
+-  po/Makefile.in
+   man/Makefile
+   data/camera1-dist.conf
+   data/camera2-dist.conf
+-- 
+2.24.1
+
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 2b25d0a52c..6e8dd699e1 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c8d40976b41da8eb9f9f7128599403a312fc26b7226bf3787d75f78cb5a6cc6e	motion-4.2.2.tar.gz
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  545712b10fc4a0134e994b7d8a3773c1c22f0bf4bd7afea7d7ffff357aca9ea5  motion-4.3.1.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  doc/COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index ae58c54935..17a48d42ac 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.2.2
+MOTION_VERSION = 4.3.1
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
-MOTION_LICENSE_FILES = COPYING
+MOTION_LICENSE_FILES = doc/COPYING
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
+MOTION_GETTEXTIZE = YES
 
 MOTION_CONF_OPTS += --without-optimizecpu
 
@@ -23,20 +24,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 MOTION_DEPENDENCIES += mysql
-MOTION_CONF_OPTS += \
-	--with-mysql \
-	--with-mysql-include=$(STAGING_DIR)/usr/include/mysql \
-	--with-mysql-lib=$(STAGING_DIR)/usr/lib
+MOTION_CONF_OPTS += --with-mysql
 else
 MOTION_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 MOTION_DEPENDENCIES += postgresql
-MOTION_CONF_OPTS += \
-	--with-pgsql \
-	--with-pgsql-include=$(STAGING_DIR)/usr/include \
-	--with-pgsql-lib=$(STAGING_DIR)/usr/lib
+MOTION_CONF_OPTS += --with-pgsql
 else
 MOTION_CONF_OPTS += --without-pgsql
 endif
@@ -58,9 +53,9 @@ endif
 # Do not use default install target as it installs many unneeded files and
 # directories: docs, examples and init scripts
 define MOTION_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/motion-dist.conf \
+	$(INSTALL) -D -m 0644 $(@D)/data/motion-dist.conf \
 		$(TARGET_DIR)/etc/motion/motion.conf
-	$(INSTALL) -D -m 0755 $(@D)/motion $(TARGET_DIR)/usr/bin/motion
+	$(INSTALL) -D -m 0755 $(@D)/src/motion $(TARGET_DIR)/usr/bin/motion
 endef
 
 define MOTION_INSTALL_INIT_SYSV
-- 
2.28.0
