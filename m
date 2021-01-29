From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 29 Jan 2021 13:18:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: security bump version to
 1.9.1
Message-ID: <20210129121831.973764-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was applied upstream.

Release notes:
https://lists.gnupg.org/pipermail/gnupg-announce/2021q1/000456.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...x-non-NEON-ARM-assembly-implementati.patch | 38 -------------------
 package/libgcrypt/libgcrypt.hash              |  6 +--
 package/libgcrypt/libgcrypt.mk                |  2 +-
 3 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch

diff --git a/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch b/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch
deleted file mode 100644
index b83abcf956..0000000000
--- a/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 187a67e0cd24c210b3b4a60b09db011d295b9877 Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Fri, 22 Jan 2021 22:02:06 +0100
-Subject: [PATCH] cipher/sha512: Fix non-NEON ARM assembly implementation
-
-* cipher/sha512.c (do_transform_generic)
-[USE_ARM_ASM]: Switch to the non-NEON assembly implementation.
-
---
-
-When building for ARM CPUs that don't support NEON, linking fails
-with an "undefined reference to _gcry_sha512_transform_armv7_neon"
-error.  Switching to the non-NEON assembly function corrects this.
-
-[yann.morin.1998 at free.fr:
-  - grab from the mailing list: https://lists.gnupg.org/pipermail/gcrypt-devel/2021-January/005059.html
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- cipher/sha512.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cipher/sha512.c b/cipher/sha512.c
-index f70cdf42..0f4c304f 100644
---- a/cipher/sha512.c
-+++ b/cipher/sha512.c
-@@ -291,7 +291,7 @@ static unsigned int
- do_transform_generic (void *context, const unsigned char *data, size_t nblks)
- {
-   SHA512_CONTEXT *hd = context;
--  return _gcry_sha512_transform_armv7_neon (&hd->state, data, k, nblks);
-+  return _gcry_sha512_transform_arm (&hd->state, data, k, nblks);
- }
- #else
- static unsigned int
--- 
-2.25.1
-
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 55d6c29695..c9a8bac9cb 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  459383a8b6200673cfc31f7b265c4961c0850031  libgcrypt-1.9.0.tar.bz2
+sha1  a15ce7355b028f28a33428eaa0147154861b29d4  libgcrypt-1.9.1.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.1.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  4d9ccaa5f99db59ebcb64d73f62825b05ce8a6b7f86d19178559ef84de1381cb  libgcrypt-1.9.0.tar.bz2
+sha256  c5a67a8b9b2bd370fb415ed1ee31c7172e5683076493cf4a3678a0fbdf0265d9  libgcrypt-1.9.1.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index a2dcdb5fee..7c105058a3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.0
+LIBGCRYPT_VERSION = 1.9.1
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.29.2
