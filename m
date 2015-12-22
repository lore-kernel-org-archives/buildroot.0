From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 10:52:10 +0100
Subject: [Buildroot] [git commit] openbox: new package
Message-ID: <20151222095949.2CEBC81DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b820f1112e734a1b7a0a48d5c020647b8d2fe528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the Openbox Windows Manager.

[Thomas:
  - don't mention MMU in the Config.in comment.
  - wchar was forgotten in the Config.in comment.
  - the dependency of the comment on thread should be "depends on
    !BR2_TOOLCHAIN_HAS_THREADS" so that the comment is shown when
    thread support is *not* available.
  - add missing select of BR2_PACKAGE_XLIB_LIBXFT and
    BR2_PACKAGE_XLIB_LIBXRENDER which are needed for pango to have xft
    support, otherwise the build fails with "configure: error: Package
    requirements (pango >= 1.8.0 pangoxft >= 1.8.0) were not met:"
  - remove useless empty newline in the hash file
  - add missing dependency on host-pkgconf, which is needed since
    the configure.ac uses PKG_CHECK_MODULES.]

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/openbox/Config.in    | 23 +++++++++++++++++
 package/openbox/openbox.hash |  2 ++
 package/openbox/openbox.mk   | 61 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b57c3ee..7a52f67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ comment "X window managers"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
+	source "package/openbox/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
new file mode 100644
index 0000000..da781a5
--- /dev/null
+++ b/package/openbox/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_OPENBOX
+	bool "openbox"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XLIB_LIBX11
+	# libxft and libxrender are needed to get xft support in pango
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	help
+	  Openbox is a highly configurable, next generation window
+	  manager with extensive standards support.
+
+	  http://openbox.org
+
+comment "openbox needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XORG7
diff --git a/package/openbox/openbox.hash b/package/openbox/openbox.hash
new file mode 100644
index 0000000..a8696b3
--- /dev/null
+++ b/package/openbox/openbox.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  abe75855cc5616554ffd47134ad15291fe37ebbebf1a80b69cbde9d670f0e26d  openbox-3.6.1.tar.xz
diff --git a/package/openbox/openbox.mk b/package/openbox/openbox.mk
new file mode 100644
index 0000000..b5148e0
--- /dev/null
+++ b/package/openbox/openbox.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# openbox
+#
+################################################################################
+
+OPENBOX_VERSION = 3.6.1
+OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.xz
+OPENBOX_SITE = http://openbox.org/dist/openbox
+OPENBOX_LICENSE = GPLv2+
+OPENBOX_LICENSE_FILES = COPYING
+
+OPENBOX_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+
+OPENBOX_DEPENDENCIES = xlib_libX11 libxml2 libglib2 pango host-pkgconf
+
+ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
+OPENBOX_CONF_OPTS += --enable-imlib2
+OPENBOX_DEPENDENCIES += imlib2
+else
+OPENBOX_CONF_OPTS += --disable-imlib2
+endif
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+OPENBOX_CONF_OPTS += --enable-startup-notification
+OPENBOX_DEPENDENCIES += startup-notification
+else
+OPENBOX_CONF_OPTS += --disable-startup-notification
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
+OPENBOX_CONF_OPTS += --enable-session-management
+OPENBOX_DEPENDENCIES += xlib_libSM
+else
+OPENBOX_CONF_OPTS += --disable-session-management
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+OPENBOX_CONF_OPTS += --enable-xinerama
+OPENBOX_DEPENDENCIES += xlib_libXinerama
+else
+OPENBOX_CONF_OPTS += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+OPENBOX_CONF_OPTS += --enable-xrandr
+OPENBOX_DEPENDENCIES += xlib_libXrandr
+else
+OPENBOX_CONF_OPTS += --disable-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+OPENBOX_DEPENDENCIES += xlib_libXcursor
+OPENBOX_CONF_OPTS += --enable-xcursor
+else
+OPENBOX_CONF_OPTS += --disable-xcursor
+endif
+
+$(eval $(autotools-package))
