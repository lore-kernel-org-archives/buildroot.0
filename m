From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 21:09:03 +0200
Subject: [Buildroot] [PATCH 1/4] libfm: bump to version 1.3.0.2
Message-ID: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libfm/0001-modules-fix-cross-compilation.patch | 27 ++++++++++++++++++++++
 package/libfm/libfm.hash                           |  8 +++++--
 package/libfm/libfm.mk                             |  4 +++-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 package/libfm/0001-modules-fix-cross-compilation.patch

diff --git a/package/libfm/0001-modules-fix-cross-compilation.patch b/package/libfm/0001-modules-fix-cross-compilation.patch
new file mode 100644
index 0000000000..8b5f1cff6b
--- /dev/null
+++ b/package/libfm/0001-modules-fix-cross-compilation.patch
@@ -0,0 +1,27 @@
+From 3bc935b732d1ff448727e90340e4be40ef6fc000 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 29 Apr 2018 20:22:29 +0200
+Subject: [PATCH] modules: fix cross-compilation
+
+Do not add -L$(libdir) to AM_LDFLAGS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/modules/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/modules/Makefile.am b/src/modules/Makefile.am
+index e61f4e01..01c15bd4 100644
+--- a/src/modules/Makefile.am
++++ b/src/modules/Makefile.am
+@@ -11,7 +11,6 @@ AM_CPPFLAGS = \
+ # tell libtool we compile module not library
+ AM_LDFLAGS = \
+ 	-no-undefined -module -avoid-version -shared -export-dynamic \
+-	-L$(libdir) \
+ 	$(GIO_LIBS)
+ 
+ # the module should be linked only with libfm, not libfm-gtk or whatever
+-- 
+2.14.1
+
diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
index 69c4c31f6d..71befc355e 100644
--- a/package/libfm/libfm.hash
+++ b/package/libfm/libfm.hash
@@ -1,3 +1,7 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5 a1ba9ae5e920f38b647dd511edd6c807  libfm-1.2.5.tar.xz
-sha1 5887aa4e85ee0964e7da67368136849957afd5d6  libfm-1.2.5.tar.xz
+md5 02a024714d51e0d37afc7bd596a44f3b  libfm-1.3.0.2.tar.xz
+sha1 aa7f73987866e557b74b8a28d0fea339d53899b6  libfm-1.3.0.2.tar.xz
+
+# Hash for license files:
+sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
+sha256 c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e  src/extra/fm-xml-file.c
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index c49cd3e633..292a0ab5d8 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-LIBFM_VERSION = 1.2.5
+LIBFM_VERSION = 1.3.0.2
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
 LIBFM_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
+# We're patching src/modules/Makefile.am
+LIBFM_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
 LIBFM_CONF_OPTS += --enable-exif
-- 
2.14.1
