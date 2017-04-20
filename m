From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 00:35:34 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libva-utils: new package
Message-ID: <20170420223534.23285-1-bernd.kuhls@t-online.de>
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
v3: - bumped version to 1.8.1
    - used "select BR2_PACKAGE_LIBVA" instead of "depends on" (Arnout)
      Imho it makes sense to need only one Kconfig option for libva-
      utils. @Arnout:
      I kept the package in "Graphic libraries and applications" because
      it is not a library and also kept the package name so it stays in
      sync with the upstream name.
    - added comment about c++ dependency (Thomas)
v2: addressed review by Thomas:
    - added entry in DEVELOPERS
    - moved package to Graphic libraries and applications
    - package depends on libva

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libva-utils/Config.in        | 15 +++++++++++++++
 package/libva-utils/libva-utils.hash |  4 ++++
 package/libva-utils/libva-utils.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/libva-utils/Config.in
 create mode 100644 package/libva-utils/libva-utils.hash
 create mode 100644 package/libva-utils/libva-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123a8f928..329a9db28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -217,6 +217,7 @@ F:	package/libsquish/
 F:	package/liburiparser/
 F:	package/libva/
 F:	package/libva-intel-driver/
+F:	package/libva-utils/
 F:	package/libvorbis/
 F:	package/libvpx/
 F:	package/libyuv/
diff --git a/package/Config.in b/package/Config.in
index 4eaa95b1d..031faab85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,6 +246,7 @@ comment "Graphic applications"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
+	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
new file mode 100644
index 000000000..ad299234c
--- /dev/null
+++ b/package/libva-utils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBVA_UTILS
+	bool "libva-utils"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	select BR2_PACKAGE_LIBVA
+	help
+	  Libva-utils is a collection of tests for VA-API (Video
+	  Acceleration API)
+
+	  https://01.org/linuxmedia/vaapi
+
+comment "libva-utils needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
new file mode 100644
index 000000000..e1562a8c8
--- /dev/null
+++ b/package/libva-utils/libva-utils.hash
@@ -0,0 +1,4 @@
+# From https://github.com/01org/libva-utils/releases
+sha1 ae5f8da4638c1ddadc4b9bcdc2d42dd54554fcc8  libva-utils-1.8.1.tar.bz2
+# Locally computed
+sha256 fff17327739b801d9d91dbc79ae385026ae7ddc564d489fa1d12d8d6f9f1e2c9  libva-utils-1.8.1.tar.bz2
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
new file mode 100644
index 000000000..a5bdab882
--- /dev/null
+++ b/package/libva-utils/libva-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libva-utils
+#
+################################################################################
+
+LIBVA_UTILS_VERSION = 1.8.1
+LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
+LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_LICENSE = MIT
+LIBVA_UTILS_LICENSE_FILES = COPYING
+LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
+
+$(eval $(autotools-package))
-- 
2.11.0
