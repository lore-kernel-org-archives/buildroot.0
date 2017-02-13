From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Feb 2017 16:49:44 -0200
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
Message-ID: <1487011784-24966-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for kmscube application, which is helpful for testing
kms/drm drivers.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use Rob Clark's tree instead (Gary).

 package/Config.in                    |  1 +
 package/kmscube/0001-addimxdrm.patch | 28 ++++++++++++++++++++++++++++
 package/kmscube/Config.in            |  5 +++++
 package/kmscube/kmscube.hash         |  2 ++
 package/kmscube/kmscube.mk           | 14 ++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/kmscube/0001-addimxdrm.patch
 create mode 100644 package/kmscube/Config.in
 create mode 100644 package/kmscube/kmscube.hash
 create mode 100644 package/kmscube/kmscube.mk

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
index 0000000..85e9a2a
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
index 0000000..b3c3c8d
--- /dev/null
+++ b/package/kmscube/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_KMSCUBE
+	bool "kmscube"
+	depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM
+	help
+	  kmscube is an application to test kms/drm drivers.  
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
index 0000000..267fffa
--- /dev/null
+++ b/package/kmscube/kmscube.mk
@@ -0,0 +1,14 @@
+KMSCUBE_VERSION = 8c6a20901f95e1b465bbca127f9d47fcfb8762e6
+KMSCUBE_SITE = $(call github,robclark,kmscube,$(KMSCUBE_VERSION))
+KMSCUBE_DEPENDENCIES = host-pkgconf libdrm mesa3d
+KMSCUBE_INSTALL_TARGET = YES
+KMSCUBE_AUTORECONF = YES
+KMSCUBE_INSTALL_STAGING = Y
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
