From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 5 Jun 2019 13:51:06 +0000
Subject: [Buildroot] [PATCH v4] package/exiv2: cleanup options and licenses
Message-ID: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exiv2 no longer requires a non commercial option for lens database
integration since version 0.27. See [1] and [2]

The BR2_PACKAGE_EXIV2_LENSDATA option is maintained because the
src/nikonmn_int.cpp file always specifies that the Nikon lens name
database is free to use in non-commercial, GPL or open source software
only.

Legacy handling for the removed option COMMERCIAL is not needed, since
now it's always enabled.

Add the dedicated BSD-3-Clause license file for CMakeLists.txt,
config/FindEXPAT.cmake and config/FindMSGFMT.cmake files.

[1] https://github.com/Exiv2/exiv2/commit/07f63003b7f50dd7d8719585ba54623e0f60c3c4
[2] https://github.com/Exiv2/exiv2/commit/085d8a309aafb8ed5a72cad027a1a0ea974938d9

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

---
Changes v3 -> v4:
  - bring back LENSDATA option with new help message (thanks to Peter and Arnout)
  - fix and update patch message

Changes v2 -> v3:
  - fix EXIV2_LICENSE spacer
  - explain why LENSTADA is removed

Changes v1 -> v2:
  - remove LENSDATA option (suggested by Arnout Vandecappelle)
  - remove commercial license in Config.in help
  - add missing BSD-3-Clause flag
  - add details to the patch message

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/exiv2/Config.in  | 20 +++-----------------
 package/exiv2/exiv2.hash |  1 +
 package/exiv2/exiv2.mk   | 16 +++++-----------
 3 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index acce81c593..3e3e502751 100644
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
@@ -48,11 +34,11 @@ config BR2_PACKAGE_EXIV2_XMP
 
 config BR2_PACKAGE_EXIV2_LENSDATA
 	bool "Nikon lens name database"
-	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
 	help
 	  Integrate Nikon lens name database.
 
-	  This database is integrated but comes from a thirdparty:
-	  http://www.rottmerhusen.com/objektives/lensid/thirdparty.html.
+	  This database comes from a thirdparty and is free to use in
+	  non-commercial, GPL or open source software only.
+	  For more informations src/nikonmn_int.cpp.
 
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
index ba9d9b7303..93af9382db 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -7,6 +7,8 @@
 EXIV2_VERSION = 0.27.1
 EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
+EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
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
