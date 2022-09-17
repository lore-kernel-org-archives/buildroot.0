Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E3ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C58584049;
	Sat, 17 Sep 2022 08:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C58584049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuL_PmC3oemZ; Sat, 17 Sep 2022 08:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA80828F2;
	Sat, 17 Sep 2022 08:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FA80828F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3297F1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C1D180F7E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C1D180F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO3xvaVYRNhm for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F6B80F05
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F6B80F05
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D4E6A83FA0; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 08:49:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d8c1598e3c08d7756843d0279516605f344b060e
X-Git-Newrev: 5651a7659847719dfaa140e94205fe6469115c55
X-Patchwork-Hint: ignore
Message-Id: <20220917081344.D4E6A83FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/strongswan: fix
 wolfssl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5651a7659847719dfaa140e94205fe6469115c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with BR2_PACKAGE_WOLFSSL_ALL raised
since bump to version 5.9.0 in commit
da912a3d2abe2eb2b338c03ec56c7e39a4d640f9:

In file included from ../../../../src/libstrongswan/utils/utils.h:59,
                 from ../../../../src/libstrongswan/library.h:101,
                 from wolfssl_common.h:29,
                 from wolfssl_aead.c:23:
wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
   90 | METHOD(aead_t, encrypt, bool,
      |                ^~~~~~~
../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
   99 |         static ret name(union {iface *_public; this;} \
      |                    ^~~~
In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
                 from wolfssl_common.h:64,
                 from wolfssl_aead.c:23:
/home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
  149 | void encrypt(char *, int);
      |      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/02f080c2f6d8272cb8cc1de66e058d66fb7499bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 528155f23a889033a760c43447a084172590c3c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...strongswan-plugins-wolfssl-rename-encrypt.patch | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
new file mode 100644
index 0000000000..7b47b3278b
--- /dev/null
+++ b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
@@ -0,0 +1,150 @@
+From 5900426a710eaa65a27784687775e331bcb0489b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Aug 2022 09:52:19 +0200
+Subject: [PATCH] wolfssl: Rename `encrypt` methods to avoid conflicts with
+ system headers
+
+Rename `encrypt` methods to avoid the following build failure when wolfSSL
+is built with --enable-opensslextra:
+
+In file included from ../../../../src/libstrongswan/utils/utils.h:59,
+                 from ../../../../src/libstrongswan/library.h:101,
+                 from wolfssl_common.h:29,
+                 from wolfssl_aead.c:23:
+wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
+   90 | METHOD(aead_t, encrypt, bool,
+      |                ^~~~~~~
+../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
+   99 |         static ret name(union {iface *_public; this;} \
+      |                    ^~~~
+In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
+                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
+                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
+                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
+                 from wolfssl_common.h:64,
+                 from wolfssl_aead.c:23:
+/home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
+  149 | void encrypt(char *, int);
+      |      ^~~~~~~
+
+Closes strongswan/strongswan#1201
+[Retrieved from:
+https://github.com/strongswan/strongswan/commit/5900426a710eaa65a27784687775e331bcb0489b]
+---
+ src/libstrongswan/plugins/wolfssl/wolfssl_aead.c           | 4 ++--
+ src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c        | 4 ++--
+ src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c  | 4 ++--
+ src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c  | 4 ++--
+ src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c | 4 ++--
+ 5 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
+index 2ea7c94cd65..44f054916cf 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
+@@ -87,7 +87,7 @@ struct private_aead_t {
+ 	encryption_algorithm_t alg;
+ };
+ 
+-METHOD(aead_t, encrypt, bool,
++METHOD(aead_t, encrypt_, bool,
+ 	private_aead_t *this, chunk_t plain, chunk_t assoc, chunk_t iv,
+ 	chunk_t *encrypted)
+ {
+@@ -323,7 +323,7 @@ aead_t *wolfssl_aead_create(encryption_algorithm_t algo,
+ 
+ 	INIT(this,
+ 		.public = {
+-			.encrypt = _encrypt,
++			.encrypt = _encrypt_,
+ 			.decrypt = _decrypt,
+ 			.get_block_size = _get_block_size,
+ 			.get_icv_size = _get_icv_size,
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
+index cffe7ba2375..085a912404c 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
+@@ -230,7 +230,7 @@ METHOD(crypter_t, decrypt, bool,
+ 	return success;
+ }
+ 
+-METHOD(crypter_t, encrypt, bool,
++METHOD(crypter_t, encrypt_, bool,
+ 	private_wolfssl_crypter_t *this, chunk_t data, chunk_t iv, chunk_t *dst)
+ {
+ 	u_char *out;
+@@ -578,7 +578,7 @@ wolfssl_crypter_t *wolfssl_crypter_create(encryption_algorithm_t algo,
+ 	INIT(this,
+ 		.public = {
+ 			.crypter = {
+-				.encrypt = _encrypt,
++				.encrypt = _encrypt_,
+ 				.decrypt = _decrypt,
+ 				.get_block_size = _get_block_size,
+ 				.get_iv_size = _get_iv_size,
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
+index d8a1ededb06..110543762f2 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
+@@ -193,7 +193,7 @@ METHOD(public_key_t, verify, bool,
+ 	}
+ }
+ 
+-METHOD(public_key_t, encrypt, bool,
++METHOD(public_key_t, encrypt_, bool,
+ 	private_wolfssl_ec_public_key_t *this, encryption_scheme_t scheme,
+ 	void *params, chunk_t crypto, chunk_t *plain)
+ {
+@@ -324,7 +324,7 @@ static private_wolfssl_ec_public_key_t *create_empty()
+ 			.key = {
+ 				.get_type = _get_type,
+ 				.verify = _verify,
+-				.encrypt = _encrypt,
++				.encrypt = _encrypt_,
+ 				.get_keysize = _get_keysize,
+ 				.equals = public_key_equals,
+ 				.get_fingerprint = _get_fingerprint,
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
+index f423d8d5691..ea0fb3dfc77 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
+@@ -111,7 +111,7 @@ METHOD(public_key_t, verify, bool,
+ 	return ret == 0 && res == 1;
+ }
+ 
+-METHOD(public_key_t, encrypt, bool,
++METHOD(public_key_t, encrypt_, bool,
+ 	private_public_key_t *this, encryption_scheme_t scheme,
+ 	void *params, chunk_t crypto, chunk_t *plain)
+ {
+@@ -368,7 +368,7 @@ static private_public_key_t *create_empty(key_type_t type)
+ 		.public = {
+ 			.get_type = _get_type,
+ 			.verify = _verify,
+-			.encrypt = _encrypt,
++			.encrypt = _encrypt_,
+ 			.get_keysize = _get_keysize,
+ 			.equals = public_key_equals,
+ 			.get_fingerprint = _get_fingerprint,
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
+index 72df115fe90..da8899c2d8c 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
+@@ -216,7 +216,7 @@ METHOD(public_key_t, verify, bool,
+ 	}
+ }
+ 
+-METHOD(public_key_t, encrypt, bool,
++METHOD(public_key_t, encrypt_, bool,
+ 	private_wolfssl_rsa_public_key_t *this, encryption_scheme_t scheme,
+ 	void *params, chunk_t plain, chunk_t *crypto)
+ {
+@@ -440,7 +440,7 @@ static private_wolfssl_rsa_public_key_t *create_empty()
+ 			.key = {
+ 				.get_type = _get_type,
+ 				.verify = _verify,
+-				.encrypt = _encrypt,
++				.encrypt = _encrypt_,
+ 				.equals = public_key_equals,
+ 				.get_keysize = _get_keysize,
+ 				.get_fingerprint = _get_fingerprint,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
