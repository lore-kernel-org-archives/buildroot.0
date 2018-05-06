From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 May 2018 00:09:01 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] libkcapi: split BR2_PACKAGE_LIBKCAPI_APPS
Message-ID: <20180506220901.10094-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit https://github.com/smuellerDD/libkcapi/commit/af313accf18887b4f6dbd7306c2389ddf271c9b7,
hasher test application depends on dlfcn.h. To avoid putting all apps
under !BR2_STATIC_LIBS dependency, split BR2_PACKAGE_LIBKCAPI_APPS into
several variables.

Moreover, BR2_USE_MMU is only a dependency of BR2_PACKAGE_LIBKCAPI_TEST
as other applications don't use fork.

Finally, enc or dgst applications could be enabled in a next patch if
needed.

Fixes:
 - http://autobuild.buildroot.net/results/7c57f3025030eff41a5cde52759821249859caf1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update Config.in.legacy

 Config.in.legacy             | 11 +++++++++++
 package/libkcapi/Config.in   | 20 +++++++++++++++-----
 package/libkcapi/libkcapi.mk | 32 +++++++++++++++++++++-----------
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d8b28c5fe..c51984a3b9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_LIBKCAPI_APPS
+	bool "libkcapi test applications removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBKCAPI_HASHER if !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBKCAPI_RNGAPP
+	select BR2_PACKAGE_LIBKCAPI_SPEED
+	select BR2_PACKAGE_LIBKCAPI_TEST
+	help
+	  Test applications (hasher, rng read, speed-test, test) now
+	  have their own configuration options in the libkcapi menu.
+
 config BR2_PACKAGE_IQVLINUX
 	bool "iqvlinux package removed"
 	select BR2_LEGACY
diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 2b981777e6..7397cfe800 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -7,11 +7,21 @@ config BR2_PACKAGE_LIBKCAPI
 
 if BR2_PACKAGE_LIBKCAPI
 
-config BR2_PACKAGE_LIBKCAPI_APPS
-	bool "build test applications"
+config BR2_PACKAGE_LIBKCAPI_HASHER
+	bool "build hasher application"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+
+comment "hasher application needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIBKCAPI_RNGAPP
+	bool "build rng read application"
+
+config BR2_PACKAGE_LIBKCAPI_SPEED
+	bool "build speed-test program"
+
+config BR2_PACKAGE_LIBKCAPI_TEST
+	bool "build test program"
 	depends on BR2_USE_MMU # fork()
-	help
-	  Build additional test applications that can provide
-	  performance or algorithm tests.
 
 endif
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 44469017df..1a45f4f996 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -12,18 +12,28 @@ LIBKCAPI_INSTALL_STAGING = YES
 LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
 LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
 
-ifeq ($(BR2_PACKAGE_LIBKCAPI_APPS),y)
-LIBKCAPI_CONF_OPTS += \
-	--enable-kcapi-speed \
-	--enable-kcapi-test \
-	--enable-kcapi-hasher \
-	--enable-kcapi-rngapp
+ifeq ($(BR2_PACKAGE_LIBKCAPI_HASHER),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-hasher
 else
-LIBKCAPI_CONF_OPTS += \
-	--disable-kcapi-speed \
-	--disable-kcapi-test \
-	--disable-kcapi-hasher \
-	--disable-kcapi-rngapp
+LIBKCAPI_CONF_OPTS += --disable-kcapi-hasher
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKCAPI_RNGAPP),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-rngapp
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-rngapp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKCAPI_SPEED),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-speed
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-speed
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKCAPI_TEST),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-test
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-test
 endif
 
 $(eval $(autotools-package))
-- 
2.14.1
