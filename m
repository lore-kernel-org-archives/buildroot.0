From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 14:56:57 +0100
Subject: [Buildroot] [git commit] xlib_libpthread-stubs: Rename package to
	libpthread-stubs
Message-ID: <20140302135853.EFC439B9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5562be136c4d67be4f12875f01d24e26e069d3e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   14 +++++++++++---
 package/Config.in                                  |    1 +
 package/libdrm/Config.in                           |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 .../Config.in                                      |    2 +-
 package/libpthread-stubs/libpthread-stubs.mk       |   20 ++++++++++++++++++++
 package/x11r7/Config.in                            |    1 -
 package/x11r7/libxcb/Config.in                     |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   20 --------------------
 10 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cfcf5a3..afcd3b1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -172,6 +172,15 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  the 'udev' providers if the dependencies are selected. For
 	  example, selecting 'libglib2' will trigger the build of gudev.
 
+config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	bool "xlib-libpthread-stubs option has been renamed"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
+	help
+	  The pthread stubs neither depend on X11 nor Xlib. Thus the
+	  package has been renamed BR2_PACKAGE_LIBPTHREAD_STUBS
+
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
@@ -642,11 +651,10 @@ config BR2_PACKAGE_XSERVER_tinyx
 config BR2_PACKAGE_PTHREAD_STUBS
 	bool "pthread-stubs option has been renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
-	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	help
 	  For consistency reason, the pthread-stubs package has been
-	  renamed to xlib_libpthread-stubs.
+	  renamed to libpthread-stubs.
 
 ###############################################################################
 comment "Legacy options removed in 2012.08"
diff --git a/package/Config.in b/package/Config.in
index a519b97..e6fe6aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -775,6 +775,7 @@ source "package/liblog4c-localtime/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
 source "package/libplist/Config.in"
+source "package/libpthread-stubs/Config.in"
 source "package/libpthsem/Config.in"
 source "package/libseccomp/Config.in"
 source "package/libsigc/Config.in"
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 205f47c..4d7646b 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
 	help
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a1b0580..b9b7a58 100644
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
similarity index 88%
rename from package/x11r7/xlib_libpthread-stubs/Config.in
rename to package/libpthread-stubs/Config.in
index 6ce1b94..a4ce1cb 100644
--- a/package/x11r7/xlib_libpthread-stubs/Config.in
+++ b/package/libpthread-stubs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+config BR2_PACKAGE_LIBPTHREAD_STUBS
 	bool "libpthread-stubs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
new file mode 100644
index 0000000..b72e5a6
--- /dev/null
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -0,0 +1,20 @@
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
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 5eff2df..5ef118b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -53,7 +53,6 @@ if BR2_PACKAGE_XORG7
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
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index fa8ed6d..9cd8bf9 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -13,7 +13,7 @@ LIBXCB_LICENSE_FILES = COPYING
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
-	host-libxslt xlib_libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
+	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
 
 LIBXCB_CONF_OPT = --disable-build-docs
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
deleted file mode 100644
index 6343691..0000000
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ /dev/null
@@ -1,20 +0,0 @@
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
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-XLIB_LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
