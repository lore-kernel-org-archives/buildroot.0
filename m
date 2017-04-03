From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Apr 2017 07:54:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libva-utils: new package
Message-ID: <20170403055449.10347-1-bernd.kuhls@t-online.de>
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
v2: addressed review by Thomas:
    - added entry in DEVELOPERS
    - moved package to Graphic libraries and applications
    - package depends on libva

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libva-utils/Config.in        | 11 +++++++++++
 package/libva-utils/libva-utils.hash |  4 ++++
 package/libva-utils/libva-utils.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/libva-utils/Config.in
 create mode 100644 package/libva-utils/libva-utils.hash
 create mode 100644 package/libva-utils/libva-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c89468b07..2fc5d90b8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -215,6 +215,7 @@ F:	package/libsquish/
 F:	package/liburiparser/
 F:	package/libva/
 F:	package/libva-intel-driver/
+F:	package/libva-utils/
 F:	package/libvorbis/
 F:	package/libvpx/
 F:	package/libyuv/
diff --git a/package/Config.in b/package/Config.in
index d6d134d0c..51499bc60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,7 @@ comment "Graphic applications"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
+	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
new file mode 100644
index 000000000..6dc78a505
--- /dev/null
+++ b/package/libva-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBVA_UTILS
+	bool "libva-utils"
+	depends on BR2_PACKAGE_LIBVA
+	help
+	  Libva-utils is a collection of tests for VA-API (Video
+	  Acceleration API)
+
+	  https://01.org/linuxmedia/vaapi
+
+comment "libva-utils needs libva"
+	depends on !BR2_PACKAGE_LIBVA
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
