From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 17:39:46 +0200
Subject: [Buildroot] [PATCH] xmlstarlet: fix static linking
Message-ID: <1431790786-17949-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure we take into account libgpg-error when linking against
libgcrypt, by adding a patch against xmlstarlet configure.ac. The
handling of static libraries is clearly horrible in this configure.ac
script, using pkg-config would be a lot better, but it's also a lot
more work.

Fixes:

  http://autobuild.buildroot.org/results/931/931dede013d94f88fcb5185dac494775603063ec/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Fix-static-linking-problem-with-libgcrypt.patch | 46 ++++++++++++++++++++++
 package/xmlstarlet/xmlstarlet.mk                   |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 package/xmlstarlet/0001-Fix-static-linking-problem-with-libgcrypt.patch

diff --git a/package/xmlstarlet/0001-Fix-static-linking-problem-with-libgcrypt.patch b/package/xmlstarlet/0001-Fix-static-linking-problem-with-libgcrypt.patch
new file mode 100644
index 0000000..ea54c98
--- /dev/null
+++ b/package/xmlstarlet/0001-Fix-static-linking-problem-with-libgcrypt.patch
@@ -0,0 +1,46 @@
+From 8cee09b59a8c1ff2ebfc8c46097825d2eafdc4dd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 16 May 2015 17:32:13 +0200
+Subject: [PATCH] Fix static linking problem with libgcrypt
+
+When libgcrypt is used, it is linked with libgpg-error, so we should
+also test that libgpg-error is available, and include -lgpg-error in
+the LIBS variable.
+
+This fixes build issues like:
+
+  CCLD     xml
+/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libexslt.a(crypto.o): In function `_exsltCryptoGcryptInit':
+crypto.c:(.text+0x112): undefined reference to `_gcry_check_version'
+/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libexslt.a(crypto.o): In function `_exsltCryptoRc4DecryptFunction':
+crypto.c:(.text+0x316): undefined reference to `_gcry_cipher_open'
+crypto.c:(.text+0x32a): undefined reference to `_gcry_strerror'
+crypto.c:(.text+0x34c): undefined reference to `_gcry_cipher_setkey'
+
+Which are caused by the AC_SEARCH_LIBS() test for libgcrypt to fail
+due to -lgpg-error not been present in the LIBS variable.
+
+Note that using PKG_CHECK_MODULES() would be a much much better
+replacement than this complicated handling of static libraries, but
+it's a much more significant effort.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4db0129..e378996 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,7 @@ AS_IF([test "x$STATIC_LIBS" != xno],
+     [AC_SEARCH_LIBS([libiconv_open], [iconv], [], [], "$USER_LIBS")], "$USER_LIBS")
+     AC_SEARCH_LIBS([clock_gettime], [rt], [], [], "$USER_LIBS")
+     AC_SEARCH_LIBS([deflate], [z], [], [], "$USER_LIBS")
++    AC_SEARCH_LIBS([gpg_strerror], [gpg-error], [], [], "$USER_LIBS")
+     AC_SEARCH_LIBS([gcry_cipher_encrypt], [gcrypt], [], [], "$USER_LIBS")
+ 
+     # Checks for inet libraries:
+-- 
+2.1.0
+
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index bc2b377..992bb8f 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -8,6 +8,8 @@ XMLSTARLET_VERSION = 1.5.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
+# We're patching configure.ac
+XMLSTARLET_AUTORECONF = YES
 
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.1.0
