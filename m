From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:08:16 +0200
Subject: [Buildroot] [git commit branch/next] package/vtun: bump version to
 3.0.4
Message-ID: <20180820210050.EEB538E03C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2074e11ed555770f036eb60a111f38967fe0633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch 0003, upstream fixes configure.in.
Added patch from Fedora to fix OpenSSL 1.1.x. build.
Added upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vtun/0003-fixup-configure.in.patch |  92 ---------
 package/vtun/0003-openssl11.patch          | 294 +++++++++++++++++++++++++++++
 package/vtun/vtun.hash                     |   6 +-
 package/vtun/vtun.mk                       |   2 +-
 4 files changed, 300 insertions(+), 94 deletions(-)

diff --git a/package/vtun/0003-fixup-configure.in.patch b/package/vtun/0003-fixup-configure.in.patch
deleted file mode 100644
index cb2ac67aa2..0000000000
--- a/package/vtun/0003-fixup-configure.in.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-configure.in: minimal syntax fixup for autoreconf
-
-This is the strictly minimal syntax fixups to make autoreconf happy...
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Note: configure.in is still full of incorrect syntax, but fixing it is
-a task for another day, and would have to be upstreamed. But upstream
-looks to be moribund at best, if not dead... :-(
-
-So, keep it for ourselves for now... Too bad, vtun is really helpfull.
-
---- vtun-3.0.3.orig/configure.in	2013-02-16 23:54:52.582451817 +0100
-+++ vtun-3.0.3/configure.in	2013-02-17 00:03:13.640887353 +0100
-@@ -110,10 +110,10 @@
- AC_SEARCH_LIBS(nanosleep, rt posix4)
- 
- dnl Check for setproctitle in libutil
--AC_SEARCH_LIBS(setproctitle, util bsd, AC_DEFINE(HAVE_SETPROC_TITLE) )
-+AC_SEARCH_LIBS(setproctitle, util bsd, AC_DEFINE([HAVE_SETPROC_TITLE],[],[Define to set title in /proc]) )
- 
- if test "$SHAPER" = "yes"; then
--   AC_DEFINE(HAVE_SHAPER)
-+   AC_DEFINE([HAVE_SHAPER],[],[Define to use shapper])
- fi
- 
- if test "$ZLIB" = "yes"; then
-@@ -121,7 +121,7 @@
-    AC_CHECKING( for ZLIB Library and Header files ... )
-    AC_CHECK_LIB(z, deflate,
- 	LIBS="$LIBS -lz"
--	AC_DEFINE(HAVE_ZLIB),
-+	AC_DEFINE([HAVE_ZLIB],[],[Define to use ZLIB]),
- 	AC_MSG_ERROR( Zlib library not found.)
-    )
- fi
-@@ -148,7 +148,7 @@
- 	    AC_CHECK_LIB($I, lzo1x_decompress,
- 	    [
- 	          LIBS="$LIBS -l"$I
--	       AC_DEFINE(HAVE_LZO)
-+	       AC_DEFINE([HAVE_LZO],[],[Define to use LZO])
- 	          havelzo=1
- 	      ]
- 	    )
-@@ -180,8 +180,8 @@
- 	AC_CHECK_LIB(crypto, BF_set_key,
- 	    [
- 	       LIBS="$LIBS -lcrypto"
--	       AC_DEFINE(HAVE_SSL)
--	       AC_DEFINE(HAVE_SSL_BLOWFISH)
-+	       AC_DEFINE([HAVE_SSL],[],[Define to use SSL])
-+	       AC_DEFINE([HAVE_SSL_BLOWFISH],[],[Define to use blowfish])
- 	    ],
- 	    AC_MSG_ERROR( SSL library not found. )
- 	),
-@@ -196,7 +196,7 @@
-     $SSL_HDR_DIR ,
- 	AC_CHECK_LIB(crypto, AES_set_encrypt_key,
- 	    [
--	       AC_DEFINE(HAVE_SSL_AES)
-+	       AC_DEFINE([HAVE_SSL_AES],[],[Define to use AES])
- 	    ],
- 	    AC_MSG_ERROR( AES library not found. )
- 	),
-@@ -211,7 +211,7 @@
-     $SSL_HDR_DIR ,
- 	AC_CHECK_LIB(crypto, EVP_EncryptInit,
- 	    [
--	       AC_DEFINE(HAVE_SSL_EVP)
-+	       AC_DEFINE([HAVE_SSL_EVP],[],Define to use EVP)
- 	    ],
- 	    AC_MSG_ERROR( EVP library not found. )
- 	),
-@@ -220,7 +220,7 @@
- fi
- 
- if test "$NATHACK" = "yes"; then
--   AC_DEFINE(ENABLE_NAT_HACK)
-+   AC_DEFINE([ENABLE_NAT_HACK],[],[Define to use NAT hack])
- fi
- 
- if test "$SOCKS" = "yes"; then
-@@ -274,6 +274,6 @@
- REL=`echo 'BRANCH-3_X' | tr -d '$: \-' | sed 's/^[A-Za-z]*//' | sed 's/\_/\./'`
- changequote([,])
- 
--AC_DEFINE_UNQUOTED(VTUN_VER, "$REL `date '+%m/%d/%Y'`")
-+AC_DEFINE_UNQUOTED([VTUN_VER], ["$REL `date '+%m/%d/%Y'`"], [vtun version])
- 
- AC_OUTPUT(Makefile)
diff --git a/package/vtun/0003-openssl11.patch b/package/vtun/0003-openssl11.patch
new file mode 100644
index 0000000000..2c6bb812fc
--- /dev/null
+++ b/package/vtun/0003-openssl11.patch
@@ -0,0 +1,294 @@
+Fix build with OpenSSL 1.1.x
+
+Extracted vtun-openssl.patch from
+http://dl.fedoraproject.org/pub/fedora/linux/releases/27/Everything/source/tree/Packages/v/vtun-3.0.4-4.fc27.src.rpm
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -NarU5 a/lfd_encrypt.c b/lfd_encrypt.c
+--- a/lfd_encrypt.c	2016-10-01 17:27:51.000000000 -0400
++++ b/lfd_encrypt.c	2017-03-20 08:43:48.013308435 -0400
+@@ -93,15 +93,15 @@
+ static int dec_init_first_time;
+ static unsigned long sequence_num;
+ static char * pkey;
+ static char * iv_buf;
+ 
+-static EVP_CIPHER_CTX ctx_enc;	/* encrypt */
+-static EVP_CIPHER_CTX ctx_dec;	/* decrypt */
++static EVP_CIPHER_CTX *ctx_enc;	/* encrypt */
++static EVP_CIPHER_CTX *ctx_dec;	/* decrypt */
+ 
+-static EVP_CIPHER_CTX ctx_enc_ecb;	/* sideband ecb encrypt */
+-static EVP_CIPHER_CTX ctx_dec_ecb;	/* sideband ecb decrypt */
++static EVP_CIPHER_CTX *ctx_enc_ecb;	/* sideband ecb encrypt */
++static EVP_CIPHER_CTX *ctx_dec_ecb;	/* sideband ecb decrypt */
+ 
+ static int send_msg(int len, char *in, char **out);
+ static int recv_msg(int len, char *in, char **out);
+ static int send_ib_mesg(int *len, char **in);
+ static int recv_ib_mesg(int *len, char **in);
+@@ -180,37 +180,37 @@
+       case VTUN_ENC_AES256CBC:
+          blocksize = 16;
+          keysize = 32;
+          sb_init = 1;
+          cipher_type = EVP_aes_256_ecb();
+-         pctx_enc = &ctx_enc_ecb;
+-         pctx_dec = &ctx_dec_ecb;
++         pctx_enc = ctx_enc_ecb;
++         pctx_dec = ctx_dec_ecb;
+       break;
+       
+       case VTUN_ENC_AES256ECB:
+          blocksize = 16;
+          keysize = 32;
+-         pctx_enc = &ctx_enc;
+-         pctx_dec = &ctx_dec;
++         pctx_enc = ctx_enc;
++         pctx_dec = ctx_dec;
+          cipher_type = EVP_aes_256_ecb();
+          strcpy(cipher_name,"AES-256-ECB");
+       break;      
+       case VTUN_ENC_AES128OFB:
+       case VTUN_ENC_AES128CFB:
+       case VTUN_ENC_AES128CBC:
+          blocksize = 16;
+          keysize = 16;
+          sb_init=1;
+          cipher_type = EVP_aes_128_ecb();
+-         pctx_enc = &ctx_enc_ecb;
+-         pctx_dec = &ctx_dec_ecb;
++         pctx_enc = ctx_enc_ecb;
++         pctx_dec = ctx_dec_ecb;
+       break;
+       case VTUN_ENC_AES128ECB:
+          blocksize = 16;
+          keysize = 16;
+-         pctx_enc = &ctx_enc;
+-         pctx_dec = &ctx_dec;
++         pctx_enc = ctx_enc;
++         pctx_dec = ctx_dec;
+          cipher_type = EVP_aes_128_ecb();
+          strcpy(cipher_name,"AES-128-ECB");
+       break;
+ 
+       case VTUN_ENC_BF256OFB:
+@@ -219,20 +219,20 @@
+          blocksize = 8;
+          keysize = 32;
+          var_key = 1;
+          sb_init = 1;
+          cipher_type = EVP_bf_ecb();
+-         pctx_enc = &ctx_enc_ecb;
+-         pctx_dec = &ctx_dec_ecb;
++         pctx_enc = ctx_enc_ecb;
++         pctx_dec = ctx_dec_ecb;
+       break;
+ 
+       case VTUN_ENC_BF256ECB:
+          blocksize = 8;
+          keysize = 32;
+          var_key = 1;
+-         pctx_enc = &ctx_enc;
+-         pctx_dec = &ctx_dec;
++         pctx_enc = ctx_enc;
++         pctx_dec = ctx_dec;
+          cipher_type = EVP_bf_ecb();
+          strcpy(cipher_name,"Blowfish-256-ECB");
+       break;
+ 
+       case VTUN_ENC_BF128OFB:
+@@ -241,26 +241,28 @@
+          blocksize = 8;
+          keysize = 16;
+          var_key = 1;
+          sb_init = 1;
+          cipher_type = EVP_bf_ecb();
+-         pctx_enc = &ctx_enc_ecb;
+-         pctx_dec = &ctx_dec_ecb;
++         pctx_enc = ctx_enc_ecb;
++         pctx_dec = ctx_dec_ecb;
+       break;
+       case VTUN_ENC_BF128ECB: /* blowfish 128 ecb is the default */
+       default:
+          blocksize = 8;
+          keysize = 16;
+          var_key = 1;
+-         pctx_enc = &ctx_enc;
+-         pctx_dec = &ctx_dec;
++         pctx_enc = ctx_enc;
++         pctx_dec = ctx_dec;
+          cipher_type = EVP_bf_ecb();
+          strcpy(cipher_name,"Blowfish-128-ECB");
+       break;
+    } /* switch(host->cipher) */
+ 
+    if (prep_key(&pkey, keysize, host) != 0) return -1;
++   pctx_enc = EVP_CIPHER_CTX_new();
++   pctx_dec = EVP_CIPHER_CTX_new();
+    EVP_CIPHER_CTX_init(pctx_enc);
+    EVP_CIPHER_CTX_init(pctx_dec);
+    EVP_EncryptInit_ex(pctx_enc, cipher_type, NULL, NULL, NULL);
+    EVP_DecryptInit_ex(pctx_dec, cipher_type, NULL, NULL, NULL);
+    if (var_key)
+@@ -292,14 +294,14 @@
+    free_key(pkey); pkey = NULL;
+ 
+    lfd_free(enc_buf); enc_buf = NULL;
+    lfd_free(dec_buf); dec_buf = NULL;
+ 
+-   EVP_CIPHER_CTX_cleanup(&ctx_enc);
+-   EVP_CIPHER_CTX_cleanup(&ctx_dec);
+-   EVP_CIPHER_CTX_cleanup(&ctx_enc_ecb);
+-   EVP_CIPHER_CTX_cleanup(&ctx_dec_ecb);
++   EVP_CIPHER_CTX_free(ctx_enc);
++   EVP_CIPHER_CTX_free(ctx_dec);
++   EVP_CIPHER_CTX_free(ctx_enc_ecb);
++   EVP_CIPHER_CTX_free(ctx_dec_ecb);
+ 
+    return 0;
+ }
+ 
+ static int encrypt_buf(int len, char *in, char **out)
+@@ -321,11 +323,11 @@
+    
+    memset(in_ptr+len, pad, pad);
+    outlen=len+pad;
+    if (pad == blocksize)
+       RAND_bytes(in_ptr+len, blocksize-1);
+-   EVP_EncryptUpdate(&ctx_enc, out_ptr, &outlen, in_ptr, len+pad);
++   EVP_EncryptUpdate(ctx_enc, out_ptr, &outlen, in_ptr, len+pad);
+    *out = enc_buf;
+ 
+    sequence_num++;
+ 
+    return outlen+msg_len;
+@@ -341,11 +343,11 @@
+    in = *out;
+    in_ptr = in;
+ 
+    outlen=len;
+    if (!len) return 0;
+-   EVP_DecryptUpdate(&ctx_dec, out_ptr, &outlen, in_ptr, len);
++   EVP_DecryptUpdate(ctx_dec, out_ptr, &outlen, in_ptr, len);
+    recv_ib_mesg(&outlen, &out_ptr);
+    if (!outlen) return 0;
+    tmp_ptr = out_ptr + outlen; tmp_ptr--;
+    pad = *tmp_ptr;
+    if (pad < 1 || pad > blocksize) {
+@@ -429,17 +431,18 @@
+       /* if we're here, something weird's going on */
+          return -1;
+       break;
+    } /* switch(cipher) */
+ 
+-   EVP_CIPHER_CTX_init(&ctx_enc);
+-   EVP_EncryptInit_ex(&ctx_enc, cipher_type, NULL, NULL, NULL);
++   ctx_enc = EVP_CIPHER_CTX_new();
++   EVP_CIPHER_CTX_init(ctx_enc);
++   EVP_EncryptInit_ex(ctx_enc, cipher_type, NULL, NULL, NULL);
+    if (var_key)
+-      EVP_CIPHER_CTX_set_key_length(&ctx_enc, keysize);
+-   EVP_EncryptInit_ex(&ctx_enc, NULL, NULL, pkey, NULL);
+-   EVP_EncryptInit_ex(&ctx_enc, NULL, NULL, NULL, iv);
+-   EVP_CIPHER_CTX_set_padding(&ctx_enc, 0);
++      EVP_CIPHER_CTX_set_key_length(ctx_enc, keysize);
++   EVP_EncryptInit_ex(ctx_enc, NULL, NULL, pkey, NULL);
++   EVP_EncryptInit_ex(ctx_enc, NULL, NULL, NULL, iv);
++   EVP_CIPHER_CTX_set_padding(ctx_enc, 0);
+    if (enc_init_first_time)
+    {
+       sprintf(tmpstr,"%s encryption initialized", cipher_name);
+       vtun_syslog(LOG_INFO, tmpstr);
+       enc_init_first_time = 0;
+@@ -519,17 +522,18 @@
+       /* if we're here, something weird's going on */
+          return -1;
+       break;
+    } /* switch(cipher) */
+ 
+-   EVP_CIPHER_CTX_init(&ctx_dec);
+-   EVP_DecryptInit_ex(&ctx_dec, cipher_type, NULL, NULL, NULL);
++   ctx_dec = EVP_CIPHER_CTX_new();
++   EVP_CIPHER_CTX_init(ctx_dec);
++   EVP_DecryptInit_ex(ctx_dec, cipher_type, NULL, NULL, NULL);
+    if (var_key)
+-      EVP_CIPHER_CTX_set_key_length(&ctx_dec, keysize);
+-   EVP_DecryptInit_ex(&ctx_dec, NULL, NULL, pkey, NULL);
+-   EVP_DecryptInit_ex(&ctx_dec, NULL, NULL, NULL, iv);
+-   EVP_CIPHER_CTX_set_padding(&ctx_dec, 0);
++      EVP_CIPHER_CTX_set_key_length(ctx_dec, keysize);
++   EVP_DecryptInit_ex(ctx_dec, NULL, NULL, pkey, NULL);
++   EVP_DecryptInit_ex(ctx_dec, NULL, NULL, NULL, iv);
++   EVP_CIPHER_CTX_set_padding(ctx_dec, 0);
+    if (dec_init_first_time)
+    {
+       sprintf(tmpstr,"%s decryption initialized", cipher_name);
+       vtun_syslog(LOG_INFO, tmpstr);
+       dec_init_first_time = 0;
+@@ -557,11 +561,11 @@
+          memset(iv,0,blocksize); free(iv); iv = NULL;
+          RAND_bytes(in_ptr, in - in_ptr);
+ 
+          in_ptr = in - blocksize*2;
+          outlen = blocksize*2;
+-         EVP_EncryptUpdate(&ctx_enc_ecb, in_ptr, 
++         EVP_EncryptUpdate(ctx_enc_ecb, in_ptr, 
+             &outlen, in_ptr, blocksize*2);
+          *out = in_ptr;
+          len = outlen;
+          cipher_enc_state = CIPHER_SEQUENCE;
+       break;
+@@ -584,11 +588,11 @@
+    {
+       case CIPHER_INIT:
+          in_ptr = in;
+          iv = malloc(blocksize);
+          outlen = blocksize*2;
+-         EVP_DecryptUpdate(&ctx_dec_ecb, in_ptr, &outlen, in_ptr, blocksize*2);
++         EVP_DecryptUpdate(ctx_dec_ecb, in_ptr, &outlen, in_ptr, blocksize*2);
+          
+          if ( !strncmp(in_ptr, "ivec", 4) )
+          {
+             memcpy(iv, in_ptr+4, blocksize);
+             cipher_dec_init(iv);
+@@ -627,11 +631,11 @@
+                   "Max. gibberish threshold reached");
+ #endif
+                if (cipher_enc_state != CIPHER_INIT)
+                {
+                   cipher_enc_state = CIPHER_INIT;
+-                  EVP_CIPHER_CTX_cleanup(&ctx_enc);
++                  EVP_CIPHER_CTX_free(ctx_enc);
+ #ifdef LFD_ENCRYPT_DEBUG
+                   vtun_syslog(LOG_INFO, 
+                      "Forcing local encryptor re-init");
+ #endif
+                }
+@@ -708,11 +712,11 @@
+          *len -= blocksize;
+ 
+          if (cipher_enc_state != CIPHER_INIT)
+          {
+             cipher_enc_state = CIPHER_INIT;
+-            EVP_CIPHER_CTX_cleanup(&ctx_enc);
++            EVP_CIPHER_CTX_free(ctx_enc);
+          }
+ #ifdef LFD_ENCRYPT_DEBUG
+          vtun_syslog(LOG_INFO, "Remote requests encryptor re-init");
+ #endif
+       }
+@@ -722,11 +726,11 @@
+ 
+          if (cipher_dec_state != CIPHER_INIT &&
+              cipher_enc_state != CIPHER_REQ_INIT &&
+              cipher_enc_state != CIPHER_INIT)
+          {
+-            EVP_CIPHER_CTX_cleanup (&ctx_dec);
++            EVP_CIPHER_CTX_free (ctx_dec);
+             cipher_dec_state = CIPHER_INIT;
+             cipher_enc_state = CIPHER_REQ_INIT;
+          }
+ #ifdef LFD_ENCRYPT_DEBUG
+          vtun_syslog(LOG_INFO, "Local decryptor out of sync");
diff --git a/package/vtun/vtun.hash b/package/vtun/vtun.hash
index baa6381f70..363c980987 100644
--- a/package/vtun/vtun.hash
+++ b/package/vtun/vtun.hash
@@ -1,2 +1,6 @@
+# From https://sourceforge.net/projects/vtun/files/vtun/3.0.4/
+md5 f952c5895ae8f40235aaad9a8f41a4bd  vtun-3.0.4.tar.gz
+sha1 2335c21b56fadf9ce851dd7f342fb0ed4f522c47  vtun-3.0.4.tar.gz
 # Locally computed:
-sha256  69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb  vtun-3.0.3.tar.gz
+sha256 abf8df6b15e3febeaaeae2ce24ead7105eb1537ad4ec0d830c83cbb684fd98b9  vtun-3.0.4.tar.gz
+sha256 5692a9a69dc5abc1aa9cbc54899d114b65c4cefbd9d7fcecc304316a2f26ced3  README.OpenSSL
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 9c46559fb8..86d452c0c2 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VTUN_VERSION = 3.0.3
+VTUN_VERSION = 3.0.4
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_LICENSE = GPL-2.0+ with OpenSSL exception
 VTUN_LICENSE_FILES = README.OpenSSL
