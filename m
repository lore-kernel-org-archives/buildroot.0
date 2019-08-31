From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 12:35:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libcroco: bump version to
 0.6.13
Message-ID: <20190831103519.5320-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:
https://github.com/GNOME/libcroco/commit/898e3a8c8c0314d2e6b106809a8e3e93cf9d4394
https://github.com/GNOME/libcroco/commit/9ad72875e9f08e4c519ef63d44cdbd94aa9504f7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...k-end-of-input-before-reading-a-byte.patch | 62 -------------------
 ...nzr-support-only-max-long-rgb-values.patch | 46 --------------
 package/libcroco/libcroco.hash                |  4 +-
 package/libcroco/libcroco.mk                  |  2 +-
 4 files changed, 3 insertions(+), 111 deletions(-)
 delete mode 100644 package/libcroco/0001-input-check-end-of-input-before-reading-a-byte.patch
 delete mode 100644 package/libcroco/0002-tknzr-support-only-max-long-rgb-values.patch

diff --git a/package/libcroco/0001-input-check-end-of-input-before-reading-a-byte.patch b/package/libcroco/0001-input-check-end-of-input-before-reading-a-byte.patch
deleted file mode 100644
index 831b1a7454..0000000000
--- a/package/libcroco/0001-input-check-end-of-input-before-reading-a-byte.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 898e3a8c8c0314d2e6b106809a8e3e93cf9d4394 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Sun, 16 Apr 2017 13:13:43 +0200
-Subject: [PATCH] input: check end of input before reading a byte
-
-Fixes CVE-2017-7960
-
-When reading bytes we weren't check that the index wasn't
-out of bound and this could produce an invalid read which
-could deal to a security bug.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/cr-input.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/cr-input.c b/src/cr-input.c
-index 49000b1..3b63a88 100644
---- a/src/cr-input.c
-+++ b/src/cr-input.c
-@@ -256,7 +256,7 @@ cr_input_new_from_uri (const gchar * a_file_uri, enum CREncoding a_enc)
-                  *we should  free buf here because it's own by CRInput.
-                  *(see the last parameter of cr_input_new_from_buf().
-                  */
--                buf = NULL ;
-+                buf = NULL;
-         }
- 
-  cleanup:
-@@ -404,6 +404,8 @@ cr_input_get_nb_bytes_left (CRInput const * a_this)
- enum CRStatus
- cr_input_read_byte (CRInput * a_this, guchar * a_byte)
- {
-+        gulong nb_bytes_left = 0;
-+
-         g_return_val_if_fail (a_this && PRIVATE (a_this)
-                               && a_byte, CR_BAD_PARAM_ERROR);
- 
-@@ -413,6 +415,12 @@ cr_input_read_byte (CRInput * a_this, guchar * a_byte)
-         if (PRIVATE (a_this)->end_of_input == TRUE)
-                 return CR_END_OF_INPUT_ERROR;
- 
-+        nb_bytes_left = cr_input_get_nb_bytes_left (a_this);
-+
-+        if (nb_bytes_left < 1) {
-+                return CR_END_OF_INPUT_ERROR;
-+        }
-+
-         *a_byte = PRIVATE (a_this)->in_buf[PRIVATE (a_this)->next_byte_index];
- 
-         if (PRIVATE (a_this)->nb_bytes -
-@@ -477,7 +485,6 @@ cr_input_read_char (CRInput * a_this, guint32 * a_char)
-                 if (*a_char == '\n') {
-                         PRIVATE (a_this)->end_of_line = TRUE;
-                 }
--
-         }
- 
-         return status;
--- 
-2.11.0
-
diff --git a/package/libcroco/0002-tknzr-support-only-max-long-rgb-values.patch b/package/libcroco/0002-tknzr-support-only-max-long-rgb-values.patch
deleted file mode 100644
index 1a9bcd947a..0000000000
--- a/package/libcroco/0002-tknzr-support-only-max-long-rgb-values.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9ad72875e9f08e4c519ef63d44cdbd94aa9504f7 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Sun, 16 Apr 2017 13:56:09 +0200
-Subject: [PATCH] tknzr: support only max long rgb values
-
-Fixes CVE-2017-7961
-
-This fixes a possible out of bound when reading rgbs which
-are longer than the support MAXLONG
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/cr-tknzr.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
-index 1a7cfeb..1548c35 100644
---- a/src/cr-tknzr.c
-+++ b/src/cr-tknzr.c
-@@ -1279,6 +1279,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
-         status = cr_tknzr_parse_num (a_this, &num);
-         ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
- 
-+        if (num->val > G_MAXLONG) {
-+                status = CR_PARSING_ERROR;
-+                goto error;
-+        }
-+
-         red = num->val;
-         cr_num_destroy (num);
-         num = NULL;
-@@ -1298,6 +1303,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
-                 status = cr_tknzr_parse_num (a_this, &num);
-                 ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
- 
-+                if (num->val > G_MAXLONG) {
-+                        status = CR_PARSING_ERROR;
-+                        goto error;
-+                }
-+
-                 PEEK_BYTE (a_this, 1, &next_bytes[0]);
-                 if (next_bytes[0] == '%') {
-                         SKIP_CHARS (a_this, 1);
--- 
-2.11.0
-
diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
index 809671c5ee..b998206422 100644
--- a/package/libcroco/libcroco.hash
+++ b/package/libcroco/libcroco.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.12.sha256sum
-sha256	ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860	libcroco-0.6.12.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.13.sha256sum
+sha256	767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4	libcroco-0.6.13.tar.xz
 
 # Hash for license file:
 sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING.LIB
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 612fd1f471..c717c9a212 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCROCO_VERSION_MAJOR = 0.6
-LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).12
+LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).13
 LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSION_MAJOR)
 LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
 LIBCROCO_INSTALL_STAGING = YES
-- 
2.20.1
