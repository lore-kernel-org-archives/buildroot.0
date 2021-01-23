From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:15:54 +0100
Subject: [Buildroot] [git commit] package/libgcrypt: fix build on ARM
 without NEON
Message-ID: <20210123195626.C02E68135B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc4958b6bfe294b16698ca1ec0c603c73a101ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream-pending patch to fix build on ARM without NEON:

    libtool: link: /home/ymorin/dev/buildroot/O/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fvisibility=hidden -fno-delete-null-pointer-checks -Wall -o mpicalc mpicalc-mpicalc.o  ./.libs/libgcrypt.so -lgpg-error -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/build/libgcrypt-1.9.0/src/.libs
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ./.libs/libgcrypt.so: undefined reference to `_gcry_sha512_transform_armv7_neon'

Fixes:
    http://autobuild.buildroot.org/results/9fe1439811f89917041cfb2d40ad2b8015a6fc28/

Reported-by: montjoie on IRC
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...12-Fix-non-NEON-ARM-assembly-implementati.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch b/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch
new file mode 100644
index 0000000000..b83abcf956
--- /dev/null
+++ b/package/libgcrypt/0002-cipher-sha512-Fix-non-NEON-ARM-assembly-implementati.patch
@@ -0,0 +1,38 @@
+From 187a67e0cd24c210b3b4a60b09db011d295b9877 Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Fri, 22 Jan 2021 22:02:06 +0100
+Subject: [PATCH] cipher/sha512: Fix non-NEON ARM assembly implementation
+
+* cipher/sha512.c (do_transform_generic)
+[USE_ARM_ASM]: Switch to the non-NEON assembly implementation.
+
+--
+
+When building for ARM CPUs that don't support NEON, linking fails
+with an "undefined reference to _gcry_sha512_transform_armv7_neon"
+error.  Switching to the non-NEON assembly function corrects this.
+
+[yann.morin.1998 at free.fr:
+  - grab from the mailing list: https://lists.gnupg.org/pipermail/gcrypt-devel/2021-January/005059.html
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ cipher/sha512.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cipher/sha512.c b/cipher/sha512.c
+index f70cdf42..0f4c304f 100644
+--- a/cipher/sha512.c
++++ b/cipher/sha512.c
+@@ -291,7 +291,7 @@ static unsigned int
+ do_transform_generic (void *context, const unsigned char *data, size_t nblks)
+ {
+   SHA512_CONTEXT *hd = context;
+-  return _gcry_sha512_transform_armv7_neon (&hd->state, data, k, nblks);
++  return _gcry_sha512_transform_arm (&hd->state, data, k, nblks);
+ }
+ #else
+ static unsigned int
+-- 
+2.25.1
+
