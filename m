From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2018 12:37:13 +0300
Subject: [Buildroot] [PATCH 3/3] libgpg-error: bump to version 1.29
In-Reply-To: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
References: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
Message-ID: <79f53d893ae7a46b9587a2508f0ab01beb4885b5.1523957833.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ion-on-arm64-due-to-invalid-use-of-v.patch | 59 -------------------
 package/libgpg-error/libgpg-error.hash        |  4 +-
 package/libgpg-error/libgpg-error.mk          |  2 +-
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch

diff --git a/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch b/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
deleted file mode 100644
index a37337a0902d..000000000000
--- a/package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 791177de023574223eddf7288eb7c5a0721ac623 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Sun, 18 Mar 2018 17:39:43 +0100
-Subject: [PATCH] core: Fix regression on arm64 due to invalid use of va_list.
-
-* src/logging.c (_gpgrt_log_printhex): Provide a dummy arg instead of
-NULL.
---
-
-Fix
-Suggested-by: Jakub Wilk <jwilk@jwilk.net>
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 791177de023
-
- src/logging.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/logging.c b/src/logging.c
-index 1a4f6203d16d..d01f974e4545 100644
---- a/src/logging.c
-+++ b/src/logging.c
-@@ -1090,9 +1090,10 @@ _gpgrt_log_flush (void)
- 
- 
- /* Print a hexdump of (BUFFER,LENGTH).  With FMT passed as NULL print
-- * just the raw dump, with FMT being an empty string, print a trailing
-- * linefeed, otherwise print an entire debug line with the expanded
-- * FMT followed by a possible wrapped hexdump and a final LF.  */
-+ * just the raw dump (in this case ARG_PTR is not used), with FMT
-+ * being an empty string, print a trailing linefeed, otherwise print
-+ * an entire debug line with the expanded FMT followed by a possible
-+ * wrapped hexdump and a final LF.  */
- void
- _gpgrt_logv_printhex (const void *buffer, size_t length,
-                       const char *fmt, va_list arg_ptr)
-@@ -1150,7 +1151,16 @@ _gpgrt_log_printhex (const void *buffer, size_t length,
-       va_end (arg_ptr);
-     }
-   else
--    _gpgrt_logv_printhex (buffer, length, NULL, NULL);
-+    {
-+      /* va_list is not necessary a pointer and thus we can't use NULL
-+       * because that would conflict with platforms using a straight
-+       * struct for it (e.g. arm64).  We use a dummy variable instead;
-+       * the static is a simple way zero it out so to not get
-+       * complains about uninitialized use.  */
-+      static va_list dummy_argptr;
-+
-+      _gpgrt_logv_printhex (buffer, length, NULL, dummy_argptr);
-+    }
- }
- 
- 
--- 
-2.16.2
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index fd08aa54d898..0e6304de6677 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.28.tar.bz2.sig
-sha256 3edb957744905412f30de3e25da18682cbe509541e18cd3b8f9df695a075da49  libgpg-error-1.28.tar.bz2
+# https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.29.tar.bz2.sig
+sha256 ece926fa5719d17a7ad8da618712cfa2f8a796ab2f2af9d544c5bb093383b1ea  libgpg-error-1.29.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index f70420355603..862cb44eefed 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.28
+LIBGPG_ERROR_VERSION = 1.29
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.17.0
