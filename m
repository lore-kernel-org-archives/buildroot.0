From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 19:47:42 +0100
Subject: [Buildroot] [git commit] libecore: Add new package
Message-ID: <20120129222324.B908D90042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc6bf5b173ad439f77c3e5737646d5f5d8420ba6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in fixes, dependencies, build makekeys for host]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in            |    1 +
 package/efl/libecore/Config.in   |   42 ++++++++++++++++++++
 package/efl/libecore/libecore.mk |   77 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 120 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 27d1f95..3007783 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
+source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
 
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
new file mode 100644
index 0000000..6c887f5
--- /dev/null
+++ b/package/efl/libecore/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_LIBECORE
+	bool "libecore"
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Ecore is the event/X abstraction layer that makes doing
+	  selections, Xdnd, general X stuff, event loops, timeouts and
+	  idle handlers fast, optimized, and convenient.
+
+	  http://trac.enlightenment.org/e/wiki/Ecore
+
+if BR2_PACKAGE_LIBECORE
+
+config BR2_PACKAGE_LIBECORE_DIRECTFB
+	bool "libecore DirectFB support"
+	depends on BR2_PACKAGE_DIRECTFB
+	default y
+
+config BR2_PACKAGE_LIBECORE_FB
+	bool "libecore framebuffer support"
+
+config BR2_PACKAGE_LIBECORE_SDL
+	bool "libecore SDL support"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LIBECORE_X
+	bool "libecore X support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+config BR2_PACKAGE_LIBECORE_X_XCB
+	bool "libecore XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XCB_UTIL
+
+config BR2_PACKAGE_LIBECORE_EVAS
+	bool "libecore Evas support"
+	select BR2_PACKAGE_LIBEVAS
+
+endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
new file mode 100644
index 0000000..0088480
--- /dev/null
+++ b/package/efl/libecore/libecore.mk
@@ -0,0 +1,77 @@
+#############################################################
+#
+# libecore
+#
+#############################################################
+
+LIBECORE_VERSION = 1.1.0
+LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
+LIBECORE_SITE = http://download.enlightenment.org/releases/
+LIBECORE_INSTALL_STAGING = YES
+
+LIBECORE_DEPENDENCIES = host-pkg-config libeina
+
+HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina host-libevas
+HOST_LIBECORE_CONF_OPT += --enable-ecore-evas
+
+# default options
+LIBECORE_CONF_OPT = --disable-simple-x11
+
+# libecore
+ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
+LIBECORE_CONF_OPT += --enable-ecore-directfb
+else
+LIBECORE_CONF_OPT += --disable-ecore-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
+LIBECORE_CONF_OPT += --enable-ecore-fb
+LIBECORE_DEPENDENCIES += directfb
+else
+LIBECORE_CONF_OPT += --disable-ecore-fb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
+LIBECORE_CONF_OPT += --enable-ecore-sdl
+LIBECORE_DEPENDENCIES += sdl
+else
+LIBECORE_CONF_OPT += --disable-ecore-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
+LIBECORE_CONF_OPT += --enable-ecore-x
+LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
+else
+LIBECORE_CONF_OPT += --disable-ecore-x
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
+LIBECORE_CONF_OPT += --enable-ecore-x-xcb
+LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util
+
+# src/util/makekeys is executed at build time to generate
+# ecore_xcb_keysym_table.h, so it should get compiled for the host.
+# The ecore makefile unfortunately doesn't know about cross
+# compilation so this doesn't work.  Long term, we should probably
+# teach it about CC_FOR_BUILD, but for now simply build makekeys by
+# hand in advance
+define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		-o makekeys makekeys.c
+endef
+
+LIBECORE_POST_CONFIGURE_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+else
+LIBECORE_CONF_OPT += --disable-ecore-x-xcb
+endif
+
+# libecore-evas
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas
+endif
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
