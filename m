From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:40 +0200
Subject: [Buildroot] [PATCH v2 26/41] libglew: new package
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                        |    1 +
 package/libglew/Config.in                |   19 ++++++++++++++
 package/libglew/libglew-0001-lib64.patch |   14 +++++++++++
 package/libglew/libglew.mk               |   40 ++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 package/libglew/Config.in
 create mode 100644 package/libglew/libglew-0001-lib64.patch
 create mode 100644 package/libglew/libglew.mk

diff --git a/package/Config.in b/package/Config.in
index 3240188..8433020 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ source "package/libexif/Config.in"
 source "package/libgail/Config.in"
 source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
+source "package/libglew/Config.in"
 source "package/libglu/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
diff --git a/package/libglew/Config.in b/package/libglew/Config.in
new file mode 100644
index 0000000..fdb2b91
--- /dev/null
+++ b/package/libglew/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBGLEW
+	bool "libglew"
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_PACKAGE_MESA3D_DRIVER
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  The OpenGL Extension Wrangler Library (GLEW) is a cross-platform C/C++
+	  extension loading library. GLEW provides efficient run-time mechanisms
+	  for determining which OpenGL extensions are supported on the target
+	  platform. OpenGL core and extension functionality is exposed in a
+	  single header file.
+
+	  http://glew.sourceforge.net
+
+comment "libglew depends on X.org server and an activated mesa3d driver"
+	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER || !BR2_PACKAGE_MESA3D_DRIVER
diff --git a/package/libglew/libglew-0001-lib64.patch b/package/libglew/libglew-0001-lib64.patch
new file mode 100644
index 0000000..b961aec
--- /dev/null
+++ b/package/libglew/libglew-0001-lib64.patch
@@ -0,0 +1,14 @@
+diff -uNr glew-1.10.0.org/config/Makefile.linux glew-1.10.0/config/Makefile.linux
+--- glew-1.10.0.org/config/Makefile.linux	2013-07-22 16:11:22.000000000 +0200
++++ glew-1.10.0/config/Makefile.linux	2014-03-30 22:01:04.403574030 +0200
+@@ -10,8 +10,8 @@
+   ARCH64 = true
+ endif
+ ifeq (${ARCH64},true)
+-  LDFLAGS.EXTRA = -L/usr/X11R6/lib64 -L/usr/lib64
+-  LIBDIR = $(GLEW_DEST)/lib64
++  LDFLAGS.EXTRA = -L/usr/X11R6/lib -L/usr/lib
++  LIBDIR = $(GLEW_DEST)/lib
+ else
+   LDFLAGS.EXTRA = -L/usr/X11R6/lib -L/usr/lib
+   LIBDIR = $(GLEW_DEST)/lib
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
new file mode 100644
index 0000000..e9c08d7
--- /dev/null
+++ b/package/libglew/libglew.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libglew
+#
+################################################################################
+
+LIBGLEW_VERSION = 1.10.0
+LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
+LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
+LIBGLEW_LICENSE = MIT
+LIBGLEW_INSTALL_STAGING = YES
+LIBGLEW_DEPENDENCIES = \
+	mesa3d \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXi \
+	xlib_libXmu
+
+define LIBGLEW_BUILD_CMDS
+    $(TARGET_MAKE_ENV) \
+    $(MAKE) -C $(@D) \
+    GLEW_DEST="/usr" CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" LD="$(TARGET_CC)" \
+    POPT="$(TARGET_CFLAGS)" LDFLAGS.EXTRA="$(TARGET_LDFLAGS)"
+endef
+
+define LIBGLEW_INSTALL_STAGING_CMDS
+    $(TARGET_MAKE_ENV) \
+    $(TARGET_CONFIGURE_OPTS) \
+    $(MAKE) -C $(@D) \
+    GLEW_DEST="$(STAGING_DIR)/usr" install
+endef
+
+define LIBGLEW_INSTALL_TARGET_CMDS
+    $(TARGET_MAKE_ENV) \
+    $(TARGET_CONFIGURE_OPTS) \
+    $(MAKE) -C $(@D) \
+    GLEW_DEST="$(TARGET_DIR)/usr" install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
