From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:22:50 +0100
Subject: [Buildroot] [git commit] package/shapelib: bump to version 1.4.1
Message-ID: <20171217093124.0C20A82DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=333f5605958283c58f21a990bb5e36067489b72b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version needs proj as a dependency, and provides an
autotools-based build system.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shapelib/Config.in     |  6 ++++++
 package/shapelib/shapelib.hash |  2 +-
 package/shapelib/shapelib.mk   | 17 +++--------------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/shapelib/Config.in b/package/shapelib/Config.in
index aa2297b..553d348 100644
--- a/package/shapelib/Config.in
+++ b/package/shapelib/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_SHAPELIB
 	bool "shapelib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PROJ
 	help
 	  The Shapefile C Library provides the ability to write simple
 	  C programs for reading, writing and updating (to a limited
@@ -7,3 +10,6 @@ config BR2_PACKAGE_SHAPELIB
 	  (.dbf).
 
 	  http://shapelib.maptools.org/
+
+comment "shapelib needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index f3f812e..4f51392 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 23d474016158ab5077db2f599527631706ba5c0dc7c4178a6a1d685bb014f68f  shapelib-1.3.0.tar.gz
+sha256 a4c94817365761a3a4c21bb3ca1c680a6bdfd3edd61df9fdd291d3e7645923b3  shapelib-1.4.1.tar.gz
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 34b6253..d6217ff 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,22 +4,11 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.3.0
+SHAPELIB_VERSION = 1.4.1
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = web/license.html LICENSE.LGPL
 SHAPELIB_INSTALL_STAGING = YES
+SHAPELIB_DEPENDENCIES = proj
 
-define SHAPELIB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-define SHAPELIB_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
-endef
-
-define SHAPELIB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
