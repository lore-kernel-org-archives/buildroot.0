From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:24:10 +0100
Subject: [Buildroot] [git commit] enlightenment: new package
Message-ID: <20121230112959.248589A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=473af436480f08e78377154783276b1c348b2625
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/enlightenment/Config.in                    |   37 ++++++++++++++++++
 .../enlightenment/enlightenment-no-execinfo.patch  |   27 +++++++++++++
 package/enlightenment/enlightenment.mk             |   40 ++++++++++++++++++++
 4 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8cec873..7860f3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -151,6 +151,7 @@ source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 
 comment "X Window managers"
+source "package/enlightenment/Config.in"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 source "package/blackbox/Config.in"
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
new file mode 100644
index 0000000..4978367
--- /dev/null
+++ b/package/enlightenment/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_ENLIGHTENMENT
+	bool "enlightenment"
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBECORE_X
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBEVAS_JPEG
+	select BR2_PACKAGE_LIBEVAS_PNG
+	select BR2_PACKAGE_LIBEVAS_EET
+	select BR2_PACKAGE_LIBECORE_EVAS
+	select BR2_PACKAGE_LIBEDJE
+	select BR2_PACKAGE_LIBEFREET
+	select BR2_PACKAGE_LIBEDBUS
+	select BR2_PACKAGE_LIBEIO
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
+	# libevas-generic-loaders-svg -> librsvg -> glib2
+	depends on BR2_USE_WCHAR
+	# libedbus -> dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# libedbus -> dbus
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	help
+	  Enlightenment, also known simply as E, is a stacking window
+	  manager for the X Window System which can be used alone or
+	  in conjunction with a desktop environment such as GNOME or
+	  KDE. Enlightenment can be used as a substitute for a full
+	  desktop environment.
+
+	  http://www.enlightenment.org/
+
+comment "enlightenment requires WCHAR and thread support in toolchain"
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/enlightenment/enlightenment-no-execinfo.patch b/package/enlightenment/enlightenment-no-execinfo.patch
new file mode 100644
index 0000000..81fbe17
--- /dev/null
+++ b/package/enlightenment/enlightenment-no-execinfo.patch
@@ -0,0 +1,27 @@
+Do not include <execinfo.h> when not available
+
+On uClibc, <execinfo.h> is not necessarily installed, depending on the
+configuration. Enlightenment properly makes <execinfo.h> optional, but
+uses __GLIBC__ to check if it is available or not. Unfortunately,
+uClibc defines __GLIBC__, so it is not the right way to decide if
+<execinfo.h> is available.
+
+Instead, Enlightenment already has a configure.ac check for
+execinfo.h, so we simply use the result of this configure.ac check to
+decide whether execinfo.h is to be included or not.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/bin/e.h
+===================================================================
+--- a/src/bin/e.h
++++ b/src/bin/e.h
+@@ -92,7 +92,7 @@
+ #  include <memcheck.h>
+ # endif
+ 
+-# ifdef __GLIBC__
++# ifdef HAVE_EXECINFO_H
+ #  include <execinfo.h>
+ # endif
+ 
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
new file mode 100644
index 0000000..cd3b21f
--- /dev/null
+++ b/package/enlightenment/enlightenment.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# enlightenment
+#
+#############################################################
+
+ENLIGHTENMENT_VERSION = 0.17.0-omega
+ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases/
+ENLIGHTENMENT_LICENSE = BSD-2c
+ENLIGHTENMENT_LICENSE_FILES = COPYING
+
+ENLIGHTENMENT_DEPENDENCIES = 	\
+	host-pkgconf 		\
+	libecore 		\
+	libeet 			\
+	libeina 		\
+	libevas 		\
+	libevas-generic-loaders \
+	libedje 		\
+	libefreet 		\
+	libedbus 		\
+	libeio 			\
+	host-libedje 		\
+	host-libeet		\
+	xcb-util-keysyms
+
+ENLIGHTENMENT_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+			 --disable-rpath
+
+ifeq ($(BR2_HAVE_DOCUMENTATION),)
+define ENLIGHTENMENT_REMOVE_DOCUMENTATION
+	rm -rf $(TARGET_DIR)/usr/share/enlightenment/doc/
+	rm -f $(TARGET_DIR)/usr/share/enlightenment/COPYING
+	rm -f $(TARGET_DIR)/usr/share/enlightenment/AUTHORS
+endef
+ENLIGHTENMENT_POST_INSTALL_TARGET_HOOKS += ENLIGHTENMENT_REMOVE_DOCUMENTATION
+endif
+
+$(eval $(autotools-package))
