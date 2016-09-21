From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 15:55:23 +0200
Subject: [Buildroot] [git commit] shapelib: new package
Message-ID: <20160921135559.5860881E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2655d676f0151f6cfd36c42435cf84926c209e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Thomas:
 - adjust the license: it's MIT or LGPLv2, add web/license.html to the
   license files
 - rewrap Config.in help text
 - add entry to the DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/shapelib/Config.in     |  9 +++++++++
 package/shapelib/shapelib.hash |  2 ++
 package/shapelib/shapelib.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 605af96..8205a82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1578,4 +1578,5 @@ F:	package/python-configobj/
 F:	package/python-iniparse/
 F:	package/qjson/
 F:	package/quazip/
+F:	package/shapelib/
 F:	package/tinc/
diff --git a/package/Config.in b/package/Config.in
index a9f6bc7..dd220e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/shapelib/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/shapelib/Config.in b/package/shapelib/Config.in
new file mode 100644
index 0000000..aa2297b
--- /dev/null
+++ b/package/shapelib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SHAPELIB
+	bool "shapelib"
+	help
+	  The Shapefile C Library provides the ability to write simple
+	  C programs for reading, writing and updating (to a limited
+	  extent) ESRI Shapefiles, and the associated attribute file
+	  (.dbf).
+
+	  http://shapelib.maptools.org/
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
new file mode 100644
index 0000000..f3f812e
--- /dev/null
+++ b/package/shapelib/shapelib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 23d474016158ab5077db2f599527631706ba5c0dc7c4178a6a1d685bb014f68f  shapelib-1.3.0.tar.gz
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
new file mode 100644
index 0000000..1e9c16f
--- /dev/null
+++ b/package/shapelib/shapelib.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# shapelib
+#
+################################################################################
+
+SHAPELIB_VERSION = 1.3.0
+SHAPELIB_SITE = http://download.osgeo.org/shapelib
+SHAPELIB_LICENSE = MIT or LGPLv2
+SHAPELIB_LICENSE_FILES = web/license.html LICENSE.LGPL
+SHAPELIB_INSTALL_STAGING = YES
+
+define SHAPELIB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define SHAPELIB_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
+endef
+
+define SHAPELIB_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
+endef
+
+$(eval $(generic-package))
