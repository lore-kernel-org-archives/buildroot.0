From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 00:43:25 +0100
Subject: [Buildroot] [PATCH 2/5] package/opengl/libgles: switch to
	package-defined providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <6f83c37294d3a2b4d7b1425408e7148518b3584e.1387495624.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Reported-by: David Corvoysier <david.corvoysier@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  3 +++
 package/opengl/Config.in                         |  4 +---
 package/opengl/libgles/Config.in                 |  6 ++++++
 package/opengl/libgles/libgles.mk                | 17 +----------------
 package/rpi-userland/Config.in                   |  3 +++
 package/sunxi-mali/Config.in                     |  3 +++
 package/ti-gfx/Config.in                         |  3 +++
 7 files changed, 20 insertions(+), 19 deletions(-)
 create mode 100644 package/opengl/libgles/Config.in

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 68380a2..e084568 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -27,6 +27,9 @@ if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "gpu-viv-bin-mx6q"
 
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	default "gpu-viv-bin-mx6q"
+
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
 	bool "install examples"
 	help
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 686543b..3960082 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,7 +1,5 @@
 source "package/opengl/libegl/Config.in"
-
-config BR2_PACKAGE_HAS_OPENGL_ES
-	bool
+source "package/opengl/libgles/Config.in"
 
 config BR2_PACKAGE_HAS_OPENVG
 	bool
diff --git a/package/opengl/libgles/Config.in b/package/opengl/libgles/Config.in
new file mode 100644
index 0000000..75ccfc8
--- /dev/null
+++ b/package/opengl/libgles/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL_ES
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	string
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index ec157ac..f59ac72 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -5,22 +5,7 @@
 ################################################################################
 
 LIBGLES_SOURCE =
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBGLES_DEPENDENCIES += rpi-userland
-endif
-
-ifeq ($(BR2_PACKAGE_TI_GFX),y)
-LIBGLES_DEPENDENCIES += ti-gfx
-endif
-
-ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
-LIBGLES_DEPENDENCIES += sunxi-mali
-endif
-
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
-LIBGLES_DEPENDENCIES += gpu-viv-bin-mx6q
-endif
+LIBGLES_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_OPENGL_ES)
 
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 3c8959e..b8860d6 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -22,6 +22,9 @@ if BR2_PACKAGE_RPI_USERLAND
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "rpi-userland"
 
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	default "rpi-userland"
+
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 7f07647..9f188a3 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -21,6 +21,9 @@ if BR2_PACKAGE_SUNXI_MALI
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "sunxi-mali"
 
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	default "sunxi-mali"
+
 config BR2_PACKAGE_SUNXI_MALI_DBG
 	bool "install malitest and maliver tools"
 	help
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index e89660f..929247b 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -14,6 +14,9 @@ if BR2_PACKAGE_TI_GFX
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "ti-gfx"
 
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	default "ti-gfx"
+
 config BR2_PACKAGE_TI_GFX_DEBUG
 	bool "enable debug support"
 	help
-- 
1.8.1.2
