From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:52:04 +0200
Subject: [Buildroot] [git commit] package/libva-utils: new package
Message-ID: <20170703224922.6A91A81F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05b90f45138f1750f46906c358d021fd0c63bc2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The utils provided by this package were formerly packaged with libva.

Libva contained a patch not to compile mpeg2vldemo to reduce
dependencies by avoiding C++, this patch is not moved to this package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libva-utils/Config.in        | 15 +++++++++++++++
 package/libva-utils/libva-utils.hash |  4 ++++
 package/libva-utils/libva-utils.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b8757fe..7c8d7f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -249,6 +249,7 @@ F:	package/libsquish/
 F:	package/liburiparser/
 F:	package/libva/
 F:	package/libva-intel-driver/
+F:	package/libva-utils/
 F:	package/libvorbis/
 F:	package/libvpx/
 F:	package/libyuv/
diff --git a/package/Config.in b/package/Config.in
index bc5ad0e..a811ff6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -247,6 +247,7 @@ comment "Graphic applications"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
+	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
new file mode 100644
index 0000000..ad29923
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
index 0000000..737b246
--- /dev/null
+++ b/package/libva-utils/libva-utils.hash
@@ -0,0 +1,4 @@
+# From https://github.com/01org/libva-utils/releases
+sha1 8684aa2b28fc08bf62b1fa5acf95d23fab5faf9a libva-utils-1.8.3.tar.bz2
+# Locally computed
+sha256 c59de4fb6f1021c435b3f49e2410760692324ee5bb464c716d674fcb626a7e03  libva-utils-1.8.3.tar.bz2
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
new file mode 100644
index 0000000..80ab529
--- /dev/null
+++ b/package/libva-utils/libva-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libva-utils
+#
+################################################################################
+
+LIBVA_UTILS_VERSION = 1.8.3
+LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
+LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_LICENSE = MIT
+LIBVA_UTILS_LICENSE_FILES = COPYING
+LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
+
+$(eval $(autotools-package))
