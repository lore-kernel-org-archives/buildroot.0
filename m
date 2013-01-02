From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:38 +0100
Subject: [Buildroot] [PATCH 03/20] pthread-stubs: rename to
	xlib_libpthread-stubs
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ffc9ba7c256488a47ccc36568d71c55a440efc8a.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In upstream X.org releases, pthread-stubs is named libpthread-stubs,
so for consistency reasons, we rename the Buildroot package
accordingly. Also, while we're at it, we add a xlib_ prefix to the
package to match other X.org libraries in Buildroot.

The necessary Config.in.legacy code is added to ensure that users
having .config files using the old configuration option name get a
warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    8 ++++++++
 package/libdrm/libdrm.mk                           |    2 +-
 package/x11r7/Config.in                            |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk       |   14 --------------
 .../Config.in                                      |    4 ++--
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   14 ++++++++++++++
 7 files changed, 27 insertions(+), 19 deletions(-)
 delete mode 100644 package/x11r7/pthread-stubs/pthread-stubs.mk
 rename package/x11r7/{pthread-stubs => xlib_libpthread-stubs}/Config.in (70%)
 create mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7ddc6ea..4770c94 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -70,4 +70,12 @@ config BR2_PACKAGE_INPUT_TOOLS_EVTEST
 	help
 	  The evtest program from input-tools is now a separate package.
 
+config BR2_PACKAGE_PTHREAD_STUBS
+	bool "pthread-stubs option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	help
+	  For consistency reason, the pthread-stubs package has been
+	  renamed to xlib_libpthread-stubs.
+
 endif
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fbfc95e..4ccfa52 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -14,7 +14,7 @@ LIBDRM_DEPENDENCIES = \
 	xlib_libXxf86vm \
 	xlib_libXmu \
 	xproto_dri2proto \
-	pthread-stubs \
+	xlib_libpthread-stubs \
 	host-pkgconf
 
 ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 6881d4e..9e08e3f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -37,7 +37,6 @@ endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
-		source package/x11r7/pthread-stubs/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
 		source package/x11r7/xlib_libFS/Config.in
@@ -79,6 +78,7 @@ endmenu
 		source package/x11r7/xlib_libxkbui/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
 		source package/x11r7/xlib_libpciaccess/Config.in
+		source package/x11r7/xlib_libpthread-stubs/Config.in
 	endmenu
 	menu "X11R7 Applications"
 		source package/x11r7/xapp_appres/Config.in
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index f7b1945..15eeeef 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -10,7 +10,7 @@ LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
-	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
+	host-libxslt xlib_libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
deleted file mode 100644
index e7032de..0000000
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-#############################################################
-#
-# pthread-stubs
-#
-#############################################################
-PTHREAD_STUBS_VERSION = 0.3
-PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
-PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
-
-PTHREAD_STUBS_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
diff --git a/package/x11r7/pthread-stubs/Config.in b/package/x11r7/xlib_libpthread-stubs/Config.in
similarity index 70%
rename from package/x11r7/pthread-stubs/Config.in
rename to package/x11r7/xlib_libpthread-stubs/Config.in
index c17f7da..fb53585 100644
--- a/package/x11r7/pthread-stubs/Config.in
+++ b/package/x11r7/xlib_libpthread-stubs/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_PTHREAD_STUBS
-	bool "pthread-stubs"
+config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	bool "libpthread-stubs"
 	help
 	  This library provides weak aliases for pthread functions not
 	  provided in libc or otherwise available by default.
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
new file mode 100644
index 0000000..909253c
--- /dev/null
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# xlib_libpthread-stubs
+#
+#############################################################
+XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
+XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
+XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+
+XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
1.7.9.5
