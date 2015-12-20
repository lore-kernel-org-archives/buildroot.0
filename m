From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 12:45:39 +0100
Subject: [Buildroot] [git commit] zbar: new package
Message-ID: <20151220114605.87AF481EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3da4704bb2ac52146cda438ad68e9ed097397d76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - replace patch 0001 fixing autoreconf by a simpler patch that simply
   drops the -Wall and -Werror flags passed to automake.
 - reformat the two patches using Git
 - drop the "uclibc || glibc" dependency inherited from libv4l, since
   libv4l has now been fixed to build on musl.
 - drop the hook work arounding a build issue around man pages, and
   replace by a patch that completely disables the build/installation
   of documentation.
 - change license to LGPLv2.1+, as noted in the COPYING file.
 - drop --enable-shared=yes, since it is already passed by the
   autotools-package infrastructure]

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...onf-by-reducing-the-warning-error-checkin.patch | 26 +++++++++++++++++++++
 ...n-protoype-to-be-compatible-with-recent-l.patch | 27 ++++++++++++++++++++++
 .../zbar/0003-Disable-building-documentation.patch | 27 ++++++++++++++++++++++
 package/zbar/Config.in                             | 18 +++++++++++++++
 package/zbar/zbar.hash                             |  2 ++
 package/zbar/zbar.mk                               | 22 ++++++++++++++++++
 7 files changed, 123 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 94898a1..f5f323c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -887,6 +887,7 @@ menu "Graphics"
 	source "package/webkit/Config.in"
 	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
+	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
 
diff --git a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
new file mode 100644
index 0000000..57fbeb1
--- /dev/null
+++ b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
@@ -0,0 +1,26 @@
+From e593d6529cff515d94d80a24b5f3a953fd46004c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 19 Dec 2015 18:56:36 +0100
+Subject: [PATCH] Fix autoreconf by reducing the warning/error checking
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 256aedb..e0b6046 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
+ AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
+ AC_CONFIG_AUX_DIR(config)
+ AC_CONFIG_MACRO_DIR(config)
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
++AM_INIT_AUTOMAKE([1.10 foreign subdir-objects std-options dist-bzip2])
+ AC_CONFIG_HEADERS([include/config.h])
+ AC_CONFIG_SRCDIR(zbar/scanner.c)
+ LT_PREREQ([2.2])
+-- 
+2.6.4
+
diff --git a/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch b/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
new file mode 100644
index 0000000..82dd4e9
--- /dev/null
+++ b/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
@@ -0,0 +1,27 @@
+From 5dc8322b4f9a3de29b3da70b69e16356a2a1764c Mon Sep 17 00:00:00 2001
+From: Viacheslav Volkov <sv99@inbox.ru>
+Date: Sat, 19 Dec 2015 19:07:09 +0100
+Subject: [PATCH] Fix function protoype to be compatible with recent libjpeg
+
+Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ zbar/jpeg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zbar/jpeg.c b/zbar/jpeg.c
+index 972bfea..fdd1619 100644
+--- a/zbar/jpeg.c
++++ b/zbar/jpeg.c
+@@ -68,7 +68,7 @@ void init_source (j_decompress_ptr cinfo)
+     cinfo->src->bytes_in_buffer = img->datalen;
+ }
+ 
+-int fill_input_buffer (j_decompress_ptr cinfo)
++boolean fill_input_buffer (j_decompress_ptr cinfo)
+ {
+     /* buffer underrun error case */
+     cinfo->src->next_input_byte = fake_eoi;
+-- 
+2.6.4
+
diff --git a/package/zbar/0003-Disable-building-documentation.patch b/package/zbar/0003-Disable-building-documentation.patch
new file mode 100644
index 0000000..729f926
--- /dev/null
+++ b/package/zbar/0003-Disable-building-documentation.patch
@@ -0,0 +1,27 @@
+From 58027d5bb0492142a5b72ded772d3a1be9fa8d87 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 20 Dec 2015 12:05:57 +0100
+Subject: [PATCH] Disable building documentation
+
+The documentation requires xmlto, and we don't need it in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e18499a..db4411f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -45,7 +45,6 @@ if HAVE_NPAPI
+ include $(srcdir)/plugin/Makefile.am.inc
+ endif
+ include $(srcdir)/test/Makefile.am.inc
+-include $(srcdir)/doc/Makefile.am.inc
+ 
+ EXTRA_DIST += zbar.ico zbar.nsi
+ 
+-- 
+2.6.4
+
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
new file mode 100644
index 0000000..5097f57
--- /dev/null
+++ b/package/zbar/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ZBAR
+	bool "zbar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
+	depends on BR2_USE_MMU # libv4l
+	depends on !BR2_STATIC_LIBS # libv4l
+	depends on BR2_INSTALL_LIBSTDCPP # libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBV4L
+	help
+	  QR and barcode scanner
+
+	  http://zbar.sourceforge.net/
+
+comment "zbar needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
new file mode 100644
index 0000000..54441a8
--- /dev/null
+++ b/package/zbar/zbar.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 38f8535a3c4c526ecaa968a992efcbf7392623e68db45dc2f181d4c9d3002d69 zbar-854a5d97059e395807091ac4d80c53f7968abb8f.tar.gz
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
new file mode 100644
index 0000000..54e11e3
--- /dev/null
+++ b/package/zbar/zbar.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zbar
+#
+################################################################################
+
+# github have some additional commits for compiling with recent kernel
+ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
+ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
+ZBAR_LICENSE = LGPLv2.1+
+ZBAR_LICENSE_FILES = LICENSE
+ZBAR_INSTALL_STAGING = YES
+ZBAR_AUTORECONF = YES
+ZBAR_DEPENDENCIES = libv4l jpeg
+ZBAR_CONF_OPTS = \
+	--without-imagemagick \
+	--without-qt \
+	--without-gtk \
+	--without-python \
+	--without-x
+
+$(eval $(autotools-package))
