From: Viacheslav Volkov <sv99@inbox.ru>
Date: Thu, 29 Oct 2015 15:29:40 +0300
Subject: [Buildroot] [PATCH v4 1/2] zbar: new package
Message-ID: <1446121780-9082-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v3 -> v4:
  - correct zbar.mk, Config.in add hash (suggested by Vincent.Riera at imgtec.com)
  - license -> LGPL (suggested by martin at barkynet.com)

Changes v2 -> v3:
  - intendation in the Config.in (suggested by Yegor Yefremov)
  - add license info

Changes v1 -> v2:
  - many changes
---
 package/Config.in                     |  1 +
 package/zbar/0001-zbar-autoconf.patch | 16 ++++++++++++++++
 package/zbar/0002-zbar-jpeg.patch     | 13 +++++++++++++
 package/zbar/Config.in                | 22 ++++++++++++++++++++++
 package/zbar/zbar.hash                |  3 +++
 package/zbar/zbar.mk                  | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 87 insertions(+)
 create mode 100644 package/zbar/0001-zbar-autoconf.patch
 create mode 100644 package/zbar/0002-zbar-jpeg.patch
 create mode 100644 package/zbar/Config.in
 create mode 100644 package/zbar/zbar.hash
 create mode 100644 package/zbar/zbar.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..778b1e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "Graphics"
 	source "package/webkit/Config.in"
 	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
+	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
 
diff --git a/package/zbar/0001-zbar-autoconf.patch b/package/zbar/0001-zbar-autoconf.patch
new file mode 100644
index 0000000..159f75e
--- /dev/null
+++ b/package/zbar/0001-zbar-autoconf.patch
@@ -0,0 +1,16 @@
+diff --git a/configure.ac b/configure.ac
+index 256aedb..5aa5689 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,10 +3,11 @@ AC_PREREQ([2.61])
+ AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
+ AC_CONFIG_AUX_DIR(config)
+ AC_CONFIG_MACRO_DIR(config)
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign subdir-objects std-options dist-bzip2])
+ AC_CONFIG_HEADERS([include/config.h])
+ AC_CONFIG_SRCDIR(zbar/scanner.c)
+ LT_PREREQ([2.2])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ LT_INIT([dlopen win32-dll])
+ LT_LANG([Windows Resource])
diff --git a/package/zbar/0002-zbar-jpeg.patch b/package/zbar/0002-zbar-jpeg.patch
new file mode 100644
index 0000000..1d93a94
--- /dev/null
+++ b/package/zbar/0002-zbar-jpeg.patch
@@ -0,0 +1,13 @@
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
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
new file mode 100644
index 0000000..a5acaa3
--- /dev/null
+++ b/package/zbar/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_ZBAR
+	bool "zbar"
+	# dependencies from lib4l
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lib4l
+	depends on BR2_USE_MMU # lib4l
+	depends on !BR2_STATIC_LIBS # lib4l
+	depends on BR2_INSTALL_LIBSTDCPP # lib4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # lib4l
+	depends on BR2_TOOLCHAIN_USES_GLIBC || \
+		BR2_TOOLCHAIN_USES_UCLIBC # lib4l
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBV4L
+	help
+	  QR and barcode scanner
+
+	  http://zbar.sourceforge.net/
+
+comment "zbar needs an uClibc or (e)glibc toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
new file mode 100644
index 0000000..5c04d9b
--- /dev/null
+++ b/package/zbar/zbar.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 38f8535a3c4c526ecaa968a992efcbf7392623e68db45dc2f181d4c9d3002d69 zbar-854a5d97059e395807091ac4d80c53f7968abb8f.tar.gz
+
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
new file mode 100644
index 0000000..bd3c197
--- /dev/null
+++ b/package/zbar/zbar.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# zbar
+#
+################################################################################
+
+# github have some additional commits for compilling with recent kernel
+ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
+ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
+ZBAR_LICENSE = LGPLv2.1
+ZBAR_LICENSE_FILES = LICENSE
+ZBAR_INSTALL_STAGING = YES
+ZBAR_AUTORECONF = YES
+ZBAR_DEPENDENCIES = libv4l libjpeg
+ZBAR_CONF_OPTS = \
+	--without-imagemagick \
+	--without-qt \
+	--without-gtk \
+	--without-python \
+	--without-x \
+	--enable-shared=yes
+
+# fix /usr/bin/install: cannot stat ?./doc/man/zbarcam.1?: No such file or
+#   directory
+# make[5]: *** [install-man1] Error 1
+define ZBAR_INSTALL_FIXUP
+	touch $(@D)/doc/man/zbarcam.1
+endef
+
+ZBAR_POST_BUILD_HOOKS += ZBAR_INSTALL_FIXUP
+
+$(eval $(autotools-package))
-- 
2.6.1
