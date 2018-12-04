From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Mon,  3 Dec 2018 21:27:01 -0500
Subject: [Buildroot] [PATCH] igt-gpu-tools: add new package
Message-ID: <20181204022701.28095-1-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/igt-gpu-tools/Config.in          | 27 ++++++++++++++++++++++++
 package/igt-gpu-tools/igt-gpu-tools.hash |  5 +++++
 package/igt-gpu-tools/igt-gpu-tools.mk   | 16 ++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/igt-gpu-tools/Config.in
 create mode 100644 package/igt-gpu-tools/igt-gpu-tools.hash
 create mode 100644 package/igt-gpu-tools/igt-gpu-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da489..c9189bf771 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -846,6 +846,7 @@ F:	package/upx/
 F:	package/zxing-cpp/
 
 N:	Ga?l Portay <gael.portay@savoirfairelinux.com>
+F:	package/igt-gpu-tools/
 F:	package/qt5/qt5virtualkeyboard/
 F:	package/qt5/qt5webengine/
 F:	package/qt5/qt5webkit/
diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..11f7e0c950 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1241,6 +1241,7 @@ menu "Graphics"
 	source "package/gtkmm3/Config.in"
 	source "package/gtksourceview/Config.in"
 	source "package/harfbuzz/Config.in"
+	source "package/igt-gpu-tools/Config.in"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/irrlicht/Config.in"
diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
new file mode 100644
index 0000000000..73e217e93c
--- /dev/null
+++ b/package/igt-gpu-tools/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_IGT_GPU_TOOLS
+	bool "igt-gpu-tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm libunwind
+	depends on !BR2_STATIC_LIBS # kmod libunwind
+	depends on BR2_USE_MMU # procps-ng
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
+	depends on BR2_PACKAGE_HAS_OPENSSL
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_PROCPS_NG
+	select BR2_PACKAGE_ZLIB
+	help
+	  IGT GPU Tools is a collection of tools for development and
+	  testing of the DRM drivers.
+
+	  https://cgit.freedesktop.org/drm/igt-gpu-tools/
+
+comment "igt-gpu-tools needs udev /dev management and openssl library"
+        depends on !BR2_PACKAGE_IGT_GPU_TOOLS
+        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_PACKAGE_HAS_OPENSSL
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
new file mode 100644
index 0000000000..ce27785256
--- /dev/null
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -0,0 +1,5 @@
+# Locally calculated from download
+sha256 df862d0053930f284a28906986f788fb28ee83216d14cf79265e190fcd97d17c  igt-gpu-tools-1.23.tar.gz
+
+# Hash for license file:
+sha256 8aa4d63ef4c018d0dd0e81cef38444eefea9ea11fe7dc488d0e48092bedfaa9a  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
new file mode 100644
index 0000000000..fbd18b2d77
--- /dev/null
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# igt-gpu-tools 
+#
+################################################################################
+
+IGT_GPU_TOOLS_VERSION = 1.23
+IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION)
+IGT_GPU_TOOLS_LICENSE = MIT
+IGT_GPU_TOOLS_LICENSE_FILES = COPYING
+IGT_GPU_TOOLS_INSTALL_STAGING = YES
+IGT_GPU_TOOLS_DEPENDENCIES = host-pkgconf cairo kmod libdrm libopenssl libglib2 libpciaccess libunwind pixman procps-ng zlib
+
+IGT_GPU_TOOLS_CONF_OPTS += -Dbuild_docs=false
+
+$(eval $(meson-package))
-- 
2.19.2
