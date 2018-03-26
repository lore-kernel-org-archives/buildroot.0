From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Mar 2018 22:46:14 +0300
Subject: [Buildroot] [PATCH] libgpg-error: bump to version 1.28
Message-ID: <01302e920974bda973279d5bad696cfee3aef1b6.1522093574.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing arm/arm64 targets build failure.

Use the smaller bz2 compressed tarball.

Switch _SITE to https for better security and corporate firewall
compatibility.

Add license files hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...gression-on-arm64-due-to-invalid-use-of-v.patch | 59 ++++++++++++++++++++++
 package/libgpg-error/libgpg-error.hash             |  6 ++-
 package/libgpg-error/libgpg-error.mk               |  5 +-
 3 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch

diff --git a/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch b/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
new file mode 100644
index 000000000000..a37337a0902d
--- /dev/null
+++ b/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
@@ -0,0 +1,59 @@
+From 791177de023574223eddf7288eb7c5a0721ac623 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Sun, 18 Mar 2018 17:39:43 +0100
+Subject: [PATCH] core: Fix regression on arm64 due to invalid use of va_list.
+
+* src/logging.c (_gpgrt_log_printhex): Provide a dummy arg instead of
+NULL.
+--
+
+Fix
+Suggested-by: Jakub Wilk <jwilk@jwilk.net>
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 791177de023
+
+ src/logging.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/logging.c b/src/logging.c
+index 1a4f6203d16d..d01f974e4545 100644
+--- a/src/logging.c
++++ b/src/logging.c
+@@ -1090,9 +1090,10 @@ _gpgrt_log_flush (void)
+ 
+ 
+ /* Print a hexdump of (BUFFER,LENGTH).  With FMT passed as NULL print
+- * just the raw dump, with FMT being an empty string, print a trailing
+- * linefeed, otherwise print an entire debug line with the expanded
+- * FMT followed by a possible wrapped hexdump and a final LF.  */
++ * just the raw dump (in this case ARG_PTR is not used), with FMT
++ * being an empty string, print a trailing linefeed, otherwise print
++ * an entire debug line with the expanded FMT followed by a possible
++ * wrapped hexdump and a final LF.  */
+ void
+ _gpgrt_logv_printhex (const void *buffer, size_t length,
+                       const char *fmt, va_list arg_ptr)
+@@ -1150,7 +1151,16 @@ _gpgrt_log_printhex (const void *buffer, size_t length,
+       va_end (arg_ptr);
+     }
+   else
+-    _gpgrt_logv_printhex (buffer, length, NULL, NULL);
++    {
++      /* va_list is not necessary a pointer and thus we can't use NULL
++       * because that would conflict with platforms using a straight
++       * struct for it (e.g. arm64).  We use a dummy variable instead;
++       * the static is a simple way zero it out so to not get
++       * complains about uninitialized use.  */
++      static va_list dummy_argptr;
++
++      _gpgrt_logv_printhex (buffer, length, NULL, dummy_argptr);
++    }
+ }
+ 
+ 
+-- 
+2.16.2
+
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 0541d2311ab5..fd08aa54d898 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256 04bdc7fd12001c797cc689b007fe24909f55aa0ee1d6d6aef967d9eebf5b2461  libgpg-error-1.27.tar.gz
+# https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.28.tar.bz2.sig
+sha256 3edb957744905412f30de3e25da18682cbe509541e18cd3b8f9df695a075da49  libgpg-error-1.28.tar.bz2
+# Locally calculated
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 2140258c6e69..f70420355603 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.27
-LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
+LIBGPG_ERROR_VERSION = 1.28
+LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
+LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
-- 
2.16.2
