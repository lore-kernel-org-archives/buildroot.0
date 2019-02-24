From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Feb 2019 23:12:27 +0100
Subject: [Buildroot] [git commit] package/ibrcommon: fix dos/unix newlines
 in patch
Message-ID: <20190224221234.499AE8D32B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c67d30503bc7dd4758f165cb87c0df822ba583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e88/e881667f388eea4cce2f804b373af4e3038e7b52/

commit fc9f9cd76f (package/ibrcommon: fix static build with openssl) added a
patch to fix static linking.  The source code unfortunately contains a mix
of DOS and UNIX newlines, and the DOS new lines got stripped by the mailing
list, causing the patch to no longer apply.

Fix up the patch manually.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mon-ssl-gcm-fix-static-build-with-openssl.patch | 98 +++++++++++-----------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
index bc3301ab61..c55b227c0c 100644
--- a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
+++ b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
@@ -28,67 +28,67 @@ index 8a5745b4..6097b43e 100644
 --- a/ibrcommon/ssl/gcm/gcm.cpp
 +++ b/ibrcommon/ssl/gcm/gcm.cpp
 @@ -89,7 +89,7 @@ ret_type gcm_init_and_key(                      /* initialise mode and set key
- #elif defined( TABLES_256 )
- #define gf_mul_hh(a, ctx, scr)  gf_mul_256(a, ctx->gf_t256, scr)
- #else
--#define gf_mul_hh(a, ctx, scr)  gf_mul(a, ui8_ptr(ctx->ghash_h))
-+#define gf_mul_hh(a, ctx, scr)  ibrdtn_gf_mul(a, ui8_ptr(ctx->ghash_h))
- #endif
- 
- ret_type gcm_init_message(                      /* initialise a new message     */
+ #elif defined( TABLES_256 )
+ #define gf_mul_hh(a, ctx, scr)  gf_mul_256(a, ctx->gf_t256, scr)
+ #else
+-#define gf_mul_hh(a, ctx, scr)  gf_mul(a, ui8_ptr(ctx->ghash_h))
++#define gf_mul_hh(a, ctx, scr)  ibrdtn_gf_mul(a, ui8_ptr(ctx->ghash_h))
+ #endif
+ 
+ ret_type gcm_init_message(                      /* initialise a new message     */
 @@ -334,9 +334,9 @@ ret_type gcm_compute_tag(                       /* compute authentication tag
-         memcpy(tbuf, ctx->ghash_h, BLOCK_SIZE);
-         for( ; ; )
-         {
--            if(ln & 1) gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
-+            if(ln & 1) ibrdtn_gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
-             if(!(ln >>= 1)) break;
--            gf_mul(tbuf, tbuf);
-+            ibrdtn_gf_mul(tbuf, tbuf);
-         }
-     }
- #else   /* this one seems slower on x86 and x86_64 :-( */
+         memcpy(tbuf, ctx->ghash_h, BLOCK_SIZE);
+         for( ; ; )
+         {
+-            if(ln & 1) gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
++            if(ln & 1) ibrdtn_gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
+             if(!(ln >>= 1)) break;
+-            gf_mul(tbuf, tbuf);
++            ibrdtn_gf_mul(tbuf, tbuf);
+         }
+     }
+ #else   /* this one seems slower on x86 and x86_64 :-( */
 @@ -348,12 +348,12 @@ ret_type gcm_compute_tag(                       /* compute authentication tag
-         tbuf[0] = 0x80;
-         while(i)
-         {
--            gf_mul(tbuf, tbuf);
-+            ibrdtn_gf_mul(tbuf, tbuf);
-             if(i & ln)
-                 gf_mul_hh(tbuf, ctx, scratch);
-             i >>= 1;
-         }
--        gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
-+        ibrdtn_gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
-     }
- #endif
-     i = BLOCK_SIZE; ln = (uint_32t)(ctx->txt_acnt << 3);
+         tbuf[0] = 0x80;
+         while(i)
+         {
+-            gf_mul(tbuf, tbuf);
++            ibrdtn_gf_mul(tbuf, tbuf);
+             if(i & ln)
+                 gf_mul_hh(tbuf, ctx, scratch);
+             i >>= 1;
+         }
+-        gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
++        ibrdtn_gf_mul(ui8_ptr(ctx->hdr_ghv), tbuf);
+     }
+ #endif
+     i = BLOCK_SIZE; ln = (uint_32t)(ctx->txt_acnt << 3);
 diff --git a/ibrcommon/ssl/gcm/gf128mul.cpp b/ibrcommon/ssl/gcm/gf128mul.cpp
 index a553a044..d0c460c3 100644
 --- a/ibrcommon/ssl/gcm/gf128mul.cpp
 +++ b/ibrcommon/ssl/gcm/gf128mul.cpp
 @@ -103,7 +103,7 @@
- 
- const unsigned short gf_tab[256] = gf_dat(xda);
- 
--void gf_mul(void *a, const void* b)
-+void ibrdtn_gf_mul(void *a, const void* b)
- {   uint_32t r[GF_BYTE_LEN >> 2], p[8][GF_BYTE_LEN >> 2];
-     int i;
- 
+ 
+ const unsigned short gf_tab[256] = gf_dat(xda);
+ 
+-void gf_mul(void *a, const void* b)
++void ibrdtn_gf_mul(void *a, const void* b)
+ {   uint_32t r[GF_BYTE_LEN >> 2], p[8][GF_BYTE_LEN >> 2];
+     int i;
+ 
 diff --git a/ibrcommon/ssl/gcm/gf128mul.h b/ibrcommon/ssl/gcm/gf128mul.h
 index 4645c7fe..65fba54b 100644
 --- a/ibrcommon/ssl/gcm/gf128mul.h
 +++ b/ibrcommon/ssl/gcm/gf128mul.h
 @@ -619,7 +619,7 @@ gf_inline void mul_x(void *r, const void *x)
- 
- /*  A slow generic version of gf_mul (a = a * b) */
- 
--void gf_mul(void *a, const void* b);
-+void ibrdtn_gf_mul(void *a, const void* b);
- 
- /*  This version uses 64k bytes of table space on the stack.
-     A 16 byte buffer has to be multiplied by a 16 byte key
+ 
+ /*  A slow generic version of gf_mul (a = a * b) */
+ 
+-void gf_mul(void *a, const void* b);
++void ibrdtn_gf_mul(void *a, const void* b);
+ 
+ /*  This version uses 64k bytes of table space on the stack.
+     A 16 byte buffer has to be multiplied by a 16 byte key
 -- 
 2.14.1
 
