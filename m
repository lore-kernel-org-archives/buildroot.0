From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 7 May 2019 10:37:14 +0000
Subject: [Buildroot] [PATCH 1/1] package/exiv2: cleanup options and licenses
Message-ID: <20190507103639.94701-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of exiv2 no longer requires a commercial option for
lens database integration.

Add the dedicated licence file for CMake script.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/exiv2/Config.in  | 19 ++-----------------
 package/exiv2/exiv2.hash |  1 +
 package/exiv2/exiv2.mk   | 16 +++++-----------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index acce81c593..ddfa34261f 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -23,17 +23,6 @@ config BR2_PACKAGE_EXIV2
 
 if BR2_PACKAGE_EXIV2
 
-config BR2_PACKAGE_EXIV2_COMMERCIAL
-	bool "Enable commercial"
-	help
-	  Build the commercial version for closed source project.
-
-	  The Nikon lens name database and the NLS support is disabled
-	  for copyright reasons.
-
-	  A commercial license request is needed.
-	  http://www.exiv2.org/download.html#license
-
 config BR2_PACKAGE_EXIV2_PNG
 	bool "PNG image support"
 	select BR2_PACKAGE_ZLIB
@@ -47,12 +36,8 @@ config BR2_PACKAGE_EXIV2_XMP
 	  Build with XMP support
 
 config BR2_PACKAGE_EXIV2_LENSDATA
-	bool "Nikon lens name database"
-	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
+	bool "Include lens data"
 	help
-	  Integrate Nikon lens name database.
-
-	  This database is integrated but comes from a thirdparty:
-	  http://www.rottmerhusen.com/objektives/lensid/thirdparty.html.
+	  Build with lens data
 
 endif
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index f99cb8cb87..b753c03854 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe exiv2-0.27.1.tar.gz
 sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
+sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index ba9d9b7303..3aa2a9e088 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -7,6 +7,8 @@
 EXIV2_VERSION = 0.27.1
 EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
+EXIV2_LICENSE = GPL-2.0+
+EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
@@ -14,18 +16,10 @@ EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 # test which is not allowed when cross-compiling.
 EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
-ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),)
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
-EXIV2_LICENSE = commercial
-# NLS support is disabled in commercial version due to the copyright
-# of the translated texts.
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_COMMERCIAL=ON -DEXIV2_ENABLE_NLS=OFF
+ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
 else
-EXIV2_LICENSE = GPL-2.0+
-EXIV2_LICENSE_FILES = COPYING
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
-- 
2.21.0
