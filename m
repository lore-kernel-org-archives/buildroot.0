From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Feb 2017 08:00:28 -0200
Subject: [Buildroot] [PATCH v3] kmscube: Add new package
Message-ID: <1487152829-13115-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for kmscube application, which is helpful for testing
kms/drm drivers.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Removed space at the end of the line
- Provided project URL
- Added usual comment header
- Removed KMSCUBE_INSTALL_TARGET
- Removed KMSCUBE_INSTALL_STAGING
- Added license information
- Added myself to the DEVELOPERS file 
- Fixed dependencies

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/kmscube/0001-addimxdrm.patch | 28 ++++++++++++++++++++++++++++
 package/kmscube/Config.in            |  8 ++++++++
 package/kmscube/kmscube.hash         |  2 ++
 package/kmscube/kmscube.mk           | 19 +++++++++++++++++++
 6 files changed, 59 insertions(+)
 create mode 100644 package/kmscube/0001-addimxdrm.patch
 create mode 100644 package/kmscube/Config.in
 create mode 100644 package/kmscube/kmscube.hash
 create mode 100644 package/kmscube/kmscube.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f65909..21ab935 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -479,6 +479,7 @@ F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
 F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
+F:	package/kmscube/
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
 F:	package/netsurf-buildsystem/
diff --git a/package/Config.in b/package/Config.in
index deff0fe..af52e1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ comment "Graphic applications"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
+	source "package/kmscube/Config.in"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
diff --git a/package/kmscube/0001-addimxdrm.patch b/package/kmscube/0001-addimxdrm.patch
new file mode 100644
index 0000000..0cfcd9a
--- /dev/null
+++ b/package/kmscube/0001-addimxdrm.patch
@@ -0,0 +1,28 @@
+From 23186149100dd9c871f65132edce67db0b1ce3c3 Mon Sep 17 00:00:00 2001
+From: XoD <xoddark@gmail.com>
+Date: Mon, 13 Feb 2017 16:43:35 -0200
+Subject: [PATCH] Add imx-drm management
+
+Add imx-drm in the list of kms modules.
+
+Signed-off-by: XoD <xoddark@gmail.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ kmscube.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kmscube.c b/kmscube.c
+index ca2c266..95bd77f 100644
+--- a/kmscube.c
++++ b/kmscube.c
+@@ -122,6 +122,7 @@ static int init_drm(void)
+ 	static const char *modules[] = {
+ 		"exynos",
+ 		"i915",
++		"imx-drm",
+ 		"msm",
+ 		"nouveau",
+ 		"omapdrm",
+-- 
+2.7.4
+
diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
new file mode 100644
index 0000000..72393e4
--- /dev/null
+++ b/package/kmscube/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KMSCUBE
+	bool "kmscube"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
+	help
+	  kmscube is an application to test kms/drm drivers.
+
+	  https://github.com/robclark/kmscube/  
diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
new file mode 100644
index 0000000..d3e9858
--- /dev/null
+++ b/package/kmscube/kmscube.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 73cf923f915f9f7ee46f9f03bd24254fc04b5f166270c0d37c6f2bc3881186ec kmscube-8c6a20901f95e1b465bbca127f9d47fcfb8762e6.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
new file mode 100644
index 0000000..8c18015
--- /dev/null
+++ b/package/kmscube/kmscube.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# kmscube
+#
+################################################################################
+
+KMSCUBE_VERSION = 8c6a20901f95e1b465bbca127f9d47fcfb8762e6
+KMSCUBE_SITE = $(call github,robclark,kmscube,$(KMSCUBE_VERSION))
+KMSCUBE_LICENSE = MIT
+KMSCUBE_DEPENDENCIES = host-pkgconf
+KMSCUBE_AUTORECONF = YES
+
+# Autoreconf requires an existing m4 directory
+define KMSCUBE_PATCH_M4
+	mkdir -p $(@D)/m4
+endef
+KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_PATCH_M4
+
+$(eval $(autotools-package))
-- 
2.7.4
