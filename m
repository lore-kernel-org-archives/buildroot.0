From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:30:20 +0200
Subject: [Buildroot] [git commit] aircrack-ng: fix build on powerpc64 with
 libgcrypt
Message-ID: <20180602202847.5A8A083888@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf528cd8306c4e12e663fbbbab9b94c457c48a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieved patch from upstream:
https://github.com/aircrack-ng/aircrack-ng/issues/1874

Fixes:
 - http://autobuild.buildroot.net/results/3d92343342b51e710765866d6dd9383d26ba98e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...compilation-with-gcrypt-on-some-platforms.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch b/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch
new file mode 100644
index 0000000000..b32f29f800
--- /dev/null
+++ b/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch
@@ -0,0 +1,53 @@
+From 208c0d4810f24e03b4def637ebe130f8777ef3e1 Mon Sep 17 00:00:00 2001
+From: Mister X <3520734+Mister-X-@users.noreply.github.com>
+Date: Sat, 5 May 2018 00:28:30 +0000
+Subject: [PATCH] Fixed compilation with gcrypt on some platforms.
+
+Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/208c0d4810f24e03b4def637ebe130f8777ef3e1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gcrypt-openssl-wrapper.h | 13 +++++++++++++
+ src/md5.h                    |  6 +++++-
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/src/gcrypt-openssl-wrapper.h b/src/gcrypt-openssl-wrapper.h
+index 79a0376e..db3e0462 100644
+--- a/src/gcrypt-openssl-wrapper.h
++++ b/src/gcrypt-openssl-wrapper.h
+@@ -82,5 +82,18 @@
+                                                                 gcry_md_get_algo_dlen (algo));  \
+                                                             gcry_md_close(mdh); \
+                                                         } while (0)
++// MD5
++#define MD5_CTX                                         gcry_md_hd_t
++#define MD5_Init(ctx)                                   gcry_md_open(ctx, GCRY_MD_MD5, 0)
++#define MD5_Update(ctx, data, len)                      gcry_md_write(*ctx, data, len)
++    // HMAC_Update(ctx, data, len)
++#define MD5_Final(ctx, md)                              do  { \
++                                                            memcpy(   md,  \
++                                                                gcry_md_read(*(gcry_md_hd_t*)ctx, GCRY_MD_MD5), \
++                                                                gcry_md_get_algo_dlen(gcry_md_get_algo(*(gcry_md_hd_t*)ctx)) \
++                                                            ); \
++                                                            gcry_md_close(*(gcry_md_hd_t*)ctx); \
++                                                        } while (0)
++
+ // http://tumblr.spantz.org/post/214737529/the-use-of-do-while-0-in-c-macros
+ #endif // _GCRYPT_OPENSSL_WRAPPER_H
+diff --git a/src/md5.h b/src/md5.h
+index e9edeb81..d8d3d6b3 100644
+--- a/src/md5.h
++++ b/src/md5.h
+@@ -61,7 +61,11 @@ typedef unsigned int MD5_u32plus;
+ 
+ #include "arch.h"
+ #ifdef SIMD_PARA_MD5
+-#include <openssl/md5.h>
++    #ifndef USE_GCRYPT
++        #include <openssl/md5.h>
++    #else
++        #include "gcrypt-openssl-wrapper.h"
++    #endif
+ #endif
+ 
+ #endif /* _MD5_H */
