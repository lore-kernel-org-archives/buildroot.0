From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 8 May 2019 10:32:21 +0000
Subject: [Buildroot] [PATCH v2] package/exiv2: cleanup options and licenses
Message-ID: <20190508103129.100751-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exiv2 no longer requires a commercial option for lens database
integration since version 0.27.

Legacy handling for the removed options _COMMERCIAL and _LENSDATA is
not needed, since now they are always enabled.

Add the dedicated BSD-3-Clause license file for CMakeLists.txt,
config/FindEXPAT.cmake and config/FindMSGFMT.cmake files.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

---
Changes v1 -> v2:
  - remove _LENSDATA option (suggested by Arnout Vandecappelle)
  - remove commercial license in Config.in help
  - add missing BSD-3-Clause flag
  - Add details to the patch message

---
 package/exiv2/Config.in  | 23 -----------------------
 package/exiv2/exiv2.hash |  1 +
 package/exiv2/exiv2.mk   | 17 +++--------------
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index acce81c593..72c2a88040 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -16,24 +16,10 @@ config BR2_PACKAGE_EXIV2
 	  access to the Exif, IPTC and XMP metadata of images in
 	  various formats.
 
-	  Exiv2 is available under the GPLv2+ or under a commercial
-	  license.
-
 	  http://www.exiv2.org/
 
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
@@ -46,13 +32,4 @@ config BR2_PACKAGE_EXIV2_XMP
 	help
 	  Build with XMP support
 
-config BR2_PACKAGE_EXIV2_LENSDATA
-	bool "Nikon lens name database"
-	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
-	help
-	  Integrate Nikon lens name database.
-
-	  This database is integrated but comes from a thirdparty:
-	  http://www.rottmerhusen.com/objektives/lensid/thirdparty.html.
-
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
index ba9d9b7303..c557c08fb8 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -7,27 +7,16 @@
 EXIV2_VERSION = 0.27.1
 EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
+EXIV2_LICENSE = GPL-2.0+ BSD-3-Clause
+EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
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
-else
-EXIV2_LICENSE = GPL-2.0+
-EXIV2_LICENSE_FILES = COPYING
-endif
-
 ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_PNG=ON
 EXIV2_DEPENDENCIES += zlib
-- 
2.21.0
