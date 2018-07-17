From: =?UTF-8?q?I=C3=B1igo=20Huguet?= <inigohuguet@fanamoel.com>
Date: Tue, 17 Jul 2018 15:30:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/sunxi-mali: allow EGL type = X11
Message-ID: <1531834236-23072-1-git-send-email-inigohuguet@fanamoel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allow to use sunxi-mali for OpenGLES acceleration for
apps running on top of X11 with EGL interface.

For example, QT Quick 2 apps have to use GLX or EGL to run in an
X server, but GLX is not always available, specially in OpenGLES
only capable systems, like the ones with GPU Mali.

Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
---
 package/sunxi-mali/Config.in     | 30 ++++++++++++++++++++++++++++++
 package/sunxi-mali/sunxi-mali.mk | 32 +++++++++++++++++++++++++++-----
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 554ee68..aa7a3fb 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_SUNXI_MALI
 	  either the sunxi-kernel with the ARM Mali driver enabled or
 	  the installation of the ARM Mali drivers as an external
 	  module.
+	  
+	  Note: for recent kernels (>4.4) consider using package
+	  sunxi-mali-mainline instead.
 
 	  http://github.com/linux-sunxi/sunxi-mali
 
@@ -36,6 +39,29 @@ config BR2_PACKAGE_SUNXI_MALI_DBG
 	  version.
 
 choice
+	prompt "EGL Type"
+	default BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_FB
+	help
+	  If you are going to run your OpenGLES accelerated programs
+	  directly on the framebuffer, choose framebuffer. If you are
+	  going to run them over X11, choose X11.
+
+config BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_FB
+	bool "framebuffer"
+	
+config BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_X11
+	bool "X11"
+	select BR2_PACKAGE_LIBDRI2
+	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdri2->libdrm
+	
+comment "X11 EGL type needs Xorg and a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
+
+endchoice
+
+choice
 	prompt "Version"
 	default BR2_PACKAGE_SUNXI_MALI_R3P0
 	help
@@ -49,6 +75,10 @@ config BR2_PACKAGE_SUNXI_MALI_R3P0
 
 config BR2_PACKAGE_SUNXI_MALI_R3P1
 	bool "r3p1"
+	depends on BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_FB
+
+comment "r3p1 version only available for framebuffer EGL type"
+	depends on BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_X11
 
 endchoice
 
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index 90b580f..c826fc8 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -28,8 +28,15 @@ SUNXI_MALI_MAKE_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread" \
 	$(TARGET_MAKE_ENV)
 
-SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer \
-	ABI=armhf
+SUNXI_MALI_MAKE_OPTS += ABI=armhf
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_X11),y)
+SUNXI_MALI_MAKE_OPTS += EGL_TYPE=x11
+SUNXI_MALI_DEPENDENCIES += xlib_libX11 libdri2
+endif
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_FB),y)
+SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
+endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
 SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
@@ -38,10 +45,23 @@ ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
 SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
 endif
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_DBG)$(BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_X11),yy)
+SUNXI_MALI_TEST_MAKE_ENV = \
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread -lX11" \
+	$(TARGET_MAKE_ENV)
+endif
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_DBG)$(BR2_PACKAGE_SUNXI_MALI_EGL_TYPE_FB),yy)
+SUNXI_MALI_TEST_MAKE_ENV = $(SUNXI_MALI_MAKE_ENV)
+endif
+
+
 define SUNXI_MALI_BUILD_CMDS
 	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
-		$(@D)/version/version.c
+	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
+		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
+			$(@D)/version/version.c
+	)
 endef
 
 define SUNXI_MALI_INSTALL_STAGING_CMDS
@@ -49,7 +69,9 @@ define SUNXI_MALI_INSTALL_STAGING_CMDS
 		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 	# test must be built after install because it depends on headers that are
 	# generated during the install above.
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
+	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
+		$(SUNXI_MALI_TEST_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
+	)
 	$(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 	$(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc \
-- 
2.7.4
