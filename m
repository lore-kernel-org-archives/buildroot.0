From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 00:43:24 +0100
Subject: [Buildroot] [PATCH 1/5] package/opengl/libegl: switch to
	package-defined providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <4d126eaa1afa8174bd95e38708a9d4aa9a1afdf2.1387495624.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It seems weird that the libegl package has to know all of the packages
that may provide the EGL implementation.

This also breaks implementation provided by packages in BR2_EXTERNAL,
since we can't easily depend on the order of packages before we can
derive the dependencies of libegl.

So, Arnout and I separately came up to the same conclusion: move the
dependency selection from out of libegl, and into each of the packages
that provides an EGL implementation. Here it is.

Since we no longer depend on the order packages are included, but on
values set at Kconfig-time, we can now have EGL providers in BR2_EXTERNAL.

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Corvoysier <david.corvoysier@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  3 +++
 package/opengl/Config.in                         |  3 +--
 package/opengl/libegl/Config.in                  |  6 ++++++
 package/opengl/libegl/libegl.mk                  | 17 +----------------
 package/rpi-userland/Config.in                   |  7 +++++++
 package/sunxi-mali/Config.in                     |  3 +++
 package/ti-gfx/Config.in                         |  3 +++
 7 files changed, 24 insertions(+), 18 deletions(-)
 create mode 100644 package/opengl/libegl/Config.in

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 64e42ba..68380a2 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -24,6 +24,9 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	default "gpu-viv-bin-mx6q"
+
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
 	bool "install examples"
 	help
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 1636807..686543b 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,5 +1,4 @@
-config BR2_PACKAGE_HAS_OPENGL_EGL
-	bool
+source "package/opengl/libegl/Config.in"
 
 config BR2_PACKAGE_HAS_OPENGL_ES
 	bool
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
new file mode 100644
index 0000000..2d81a20
--- /dev/null
+++ b/package/opengl/libegl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL_EGL
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	string
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index c194b02..55e77a5 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -5,22 +5,7 @@
 ################################################################################
 
 LIBEGL_SOURCE =
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBEGL_DEPENDENCIES += rpi-userland
-endif
-
-ifeq ($(BR2_PACKAGE_TI_GFX),y)
-LIBEGL_DEPENDENCIES += ti-gfx
-endif
-
-ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
-LIBEGL_DEPENDENCIES += sunxi-mali
-endif
-
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
-LIBEGL_DEPENDENCIES += gpu-viv-bin-mx6q
-endif
+LIBEGL_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_OPENGL_EGL)
 
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 8910211..3c8959e 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -17,6 +17,13 @@ config BR2_PACKAGE_RPI_USERLAND
 
 	  https://github.com/raspberrypi/userland/
 
+if BR2_PACKAGE_RPI_USERLAND
+
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	default "rpi-userland"
+
+endif
+
 comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
 	depends on BR2_arm
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 2ca049d..7f07647 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_SUNXI_MALI
 
 if BR2_PACKAGE_SUNXI_MALI
 
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	default "sunxi-mali"
+
 config BR2_PACKAGE_SUNXI_MALI_DBG
 	bool "install malitest and maliver tools"
 	help
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index ec3a54c..e89660f 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -11,6 +11,9 @@ config BR2_PACKAGE_TI_GFX
 
 if BR2_PACKAGE_TI_GFX
 
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	default "ti-gfx"
+
 config BR2_PACKAGE_TI_GFX_DEBUG
 	bool "enable debug support"
 	help
-- 
1.8.1.2
