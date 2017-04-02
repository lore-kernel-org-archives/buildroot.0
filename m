From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Apr 2017 10:13:27 +0200
Subject: [Buildroot] [PATCH 3/3] package/libva-utils: new package
In-Reply-To: <20170402081327.2195-1-bernd.kuhls@t-online.de>
References: <20170402081327.2195-1-bernd.kuhls@t-online.de>
Message-ID: <20170402081327.2195-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The utils provided by this package were formerly packaged with libva.
Libva contained a patch not to compile mpeg2vldemo to reduce
dependencies by avoiding C++, this patch is not moved to this package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                    |  1 +
 package/libva-utils/Config.in        | 15 +++++++++++++++
 package/libva-utils/libva-utils.hash |  4 ++++
 package/libva-utils/libva-utils.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libva-utils/Config.in
 create mode 100644 package/libva-utils/libva-utils.hash
 create mode 100644 package/libva-utils/libva-utils.mk

diff --git a/package/Config.in b/package/Config.in
index d6d134d0c..364766e37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,6 +1049,7 @@ menu "Graphics"
 	source "package/libsvgtiny/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
+	source "package/libva-utils/Config.in"
 	source "package/libvdpau/Config.in"
 	source "package/libvips/Config.in"
 	source "package/menu-cache/Config.in"
diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
new file mode 100644
index 000000000..89615cad3
--- /dev/null
+++ b/package/libva-utils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBVA_UTILS
+	bool "libva-utils"
+	select BR2_PACKAGE_LIBVA
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	depends on !BR2_STATIC_LIBS # libva
+	help
+	  Libva-utils is a collection of tests for VA-API (Video
+	  Acceleration API)
+
+	  https://01.org/linuxmedia/vaapi
+
+comment "libva-utils needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
new file mode 100644
index 000000000..5a51e86c8
--- /dev/null
+++ b/package/libva-utils/libva-utils.hash
@@ -0,0 +1,4 @@
+# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000017.html
+sha1 1cdd17ee0cd5ccf0da2ed85512d87bf1931b2bc1 libva-utils-1.8.0.tar.bz2
+# Locally computed
+sha256 ca4574111fd5658d07dcf883fa1a9914b02f77011f51afcc880af1c302afdbcc  libva-utils-1.8.0.tar.bz2
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
new file mode 100644
index 000000000..e8ed31b2b
--- /dev/null
+++ b/package/libva-utils/libva-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libva-utils
+#
+################################################################################
+
+LIBVA_UTILS_VERSION = 1.8.0
+LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
+LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_LICENSE = MIT
+LIBVA_UTILS_LICENSE_FILES = COPYING
+LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
+
+$(eval $(autotools-package))
-- 
2.11.0
