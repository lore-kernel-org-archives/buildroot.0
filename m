From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 16:49:12 +0100
Subject: [Buildroot] [PATCH v1 2/5] wpebackend-fdo: new package
In-Reply-To: <20181231154915.32660-1-francois.perrad@gadz.org>
References: <20181231154915.32660-1-francois.perrad@gadz.org>
Message-ID: <20181231154915.32660-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                 |  2 ++
 package/Config.in                          |  1 +
 package/wpebackend-fdo/Config.in           | 19 +++++++++++++++++++
 package/wpebackend-fdo/wpebackend-fdo.hash |  7 +++++++
 package/wpebackend-fdo/wpebackend-fdo.mk   | 15 +++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/wpebackend-fdo/Config.in
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cf7e43450..4c2fabe98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -70,6 +70,7 @@ F:	package/libepoxy/
 F:	package/libwpe/
 F:	package/webkitgtk/
 F:	package/woff2/
+F:	package/wpebackend-fdo/
 
 N:	Adrien Gallou?t <adrien@gallouet.fr>
 F:	package/bird/
@@ -830,6 +831,7 @@ F:	package/qemu/
 F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
+F:	package/wpebackend-fdo/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
 F:	utils/scancpan
diff --git a/package/Config.in b/package/Config.in
index ae5fefb58..e57937d57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1303,6 +1303,7 @@ menu "Graphics"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
 	source "package/woff2/Config.in"
+	source "package/wpebackend-fdo/Config.in"
 	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
new file mode 100644
index 000000000..06392c93f
--- /dev/null
+++ b/package/wpebackend-fdo/Config.in
@@ -0,0 +1,19 @@
+comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_WPEBACKEND_FDO
+	bool "wpebackend-fdo"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBWPE
+	select BR2_PACKAGE_WAYLAND
+	help
+	  WPEBackend interface using freedesktop.org API.
+
+	  https://wpewebkit.org/
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
new file mode 100644
index 000000000..20c89d324
--- /dev/null
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -0,0 +1,7 @@
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.0.tar.xz.sums
+md5 5318728afb3bf7417293af67ce427963 wpebackend-fdo-1.0.0.tar.xz
+sha1 7ee22bc1d585616f4ad2047d8be54ec396486211 wpebackend-fdo-1.0.0.tar.xz
+sha256 7a747f87a1ae46d30144369050e3ce348b58986d04e1a139ba75c198fa636729 wpebackend-fdo-1.0.0.tar.xz
+
+# Hashes for license files:
+sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
new file mode 100644
index 000000000..06c87cb9b
--- /dev/null
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# wpebackend-fdo
+#
+################################################################################
+
+WPEBACKEND_FDO_VERSION = 1.0.0
+WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
+WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
+WPEBACKEND_FDO_INSTALL_STAGING = YES
+WPEBACKEND_FDO_LICENSE = BSD-2-Clause
+WPEBACKEND_FDO_LICENSE_FILES = COPYING
+WPEBACKEND_FDO_DEPENDENCIES = libglib2 libwpe wayland
+
+$(eval $(cmake-package))
-- 
2.17.1
