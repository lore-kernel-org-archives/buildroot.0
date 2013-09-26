From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:46 -0500
Subject: [Buildroot] [PATCH v3 03/11] libpthread-stubs: move out of x11r7
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                                  |    1 +
 package/libdrm/libdrm.mk                           |    2 +-
 .../Config.in                                      |    2 +-
 package/libpthread-stubs/xlib_libpthread-stubs.mk  |   17 +++++++++++++++++
 package/x11r7/Config.in                            |    1 -
 package/x11r7/libxcb/Config.in                     |    2 +-
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   16 ----------------
 7 files changed, 21 insertions(+), 20 deletions(-)
 rename package/{x11r7/xlib_libpthread-stubs => libpthread-stubs}/Config.in (81%)
 create mode 100644 package/libpthread-stubs/xlib_libpthread-stubs.mk
 delete mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk

diff --git a/package/Config.in b/package/Config.in
index 1dd60d1..ca825f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -668,6 +668,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
+source "package/libpthread-stubs/Config.in"
 source "package/libpthsem/Config.in"
 source "package/libsigc/Config.in"
 source "package/libsigsegv/Config.in"
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 697cd2f..da3a87c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -12,7 +12,7 @@ LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
-	xlib_libpthread-stubs \
+	libpthread-stubs \
 	host-pkgconf
 
 LIBDRM_CONF_OPT = \
diff --git a/package/x11r7/xlib_libpthread-stubs/Config.in b/package/libpthread-stubs/Config.in
similarity index 81%
rename from package/x11r7/xlib_libpthread-stubs/Config.in
rename to package/libpthread-stubs/Config.in
index fb53585..f81d851 100644
--- a/package/x11r7/xlib_libpthread-stubs/Config.in
+++ b/package/libpthread-stubs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+config BR2_PACKAGE_LIBPTHREAD_STUBS
 	bool "libpthread-stubs"
 	help
 	  This library provides weak aliases for pthread functions not
diff --git a/package/libpthread-stubs/xlib_libpthread-stubs.mk b/package/libpthread-stubs/xlib_libpthread-stubs.mk
new file mode 100644
index 0000000..c165183
--- /dev/null
+++ b/package/libpthread-stubs/xlib_libpthread-stubs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libpthread-stubs
+#
+################################################################################
+
+LIBPTHREAD_STUBS_VERSION = 0.3
+LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
+LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+LIBPTHREAD_STUBS_LICENSE = MIT
+LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
+
+LIBPTHREAD_STUBS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 205079c..16cd4b4 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -51,7 +51,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libxkbfile/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
 		source package/x11r7/xlib_libpciaccess/Config.in
-		source package/x11r7/xlib_libpthread-stubs/Config.in
 	endmenu
 	menu "X11R7 Applications"
 		source package/x11r7/xapp_appres/Config.in
diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index 1e1afb4..32569f7 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBXCB
 	bool "libxcb"
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
deleted file mode 100644
index 5ea02e9..0000000
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libpthread-stubs
-#
-################################################################################
-
-XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
-XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
-XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
-XLIB_LIBPTHREAD_STUBS_LICENSE = MIT
-XLIB_LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
-
-XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
1.7.1
