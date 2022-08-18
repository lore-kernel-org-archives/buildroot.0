Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B16C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAAA8404F1;
	Thu, 18 Aug 2022 21:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAAA8404F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKySV707z9KM; Thu, 18 Aug 2022 21:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D9E64013A;
	Thu, 18 Aug 2022 21:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D9E64013A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD1E21BF9B4
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 916044007F
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916044007F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWPXJ6nSOJ5Q for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:39:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCB3418D2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABCB3418D2
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:39:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h5so2336405wru.7
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 14:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Sft7rv4/U4hjKhjrVe3DjDUY7kELFcko7pvROIi4WKM=;
 b=22UKucBFsKJXzTzww+VBgC8Ejre5lYFJYxkqvbiPTdbr4u6QrZBJLPtANfHraZ8NV4
 yXnPYD0mNJUBnbtmdBgyh0IypgWGCyn7XnNXu/UDvbFyzPIauIXgNUZa9OE6yrP87zsj
 sBicApDvT+9tQ4CS4EOOeHLKsF24raFUxADB22+fG/eNbDKPE8OHoiaH13wwi0OBeqYx
 fqz8BguAUeVpwayUNy9hSIxeCbO0zZZ6OzR/TR7tXj2lyQjMw0aTEPEHOSWLkllLKBgW
 /X0Vd8JQWWUHXN7utEUdXCqY/3OlJSlYBiR9WsQij0OyouBD7yNw2/IJ0rcQh6ojKfjx
 pOJA==
X-Gm-Message-State: ACgBeo00LXsmNZoD5Ry3LK9IkbdnrFTqnfEO/ay7aHbuTQaq0MGcK2vs
 PfCeO3+f54kFjpX8Vzf+MzHctTlzLog=
X-Google-Smtp-Source: AA6agR5rJAt669RiXJQz/1I0yd7ffJ5/0Fhls83YfP4XkIB1NgNJ+fAFHLUFB1e/MGMCsyjbOB2woQ==
X-Received: by 2002:a5d:60c1:0:b0:225:3890:290b with SMTP id
 x1-20020a5d60c1000000b002253890290bmr152457wrt.66.1660858780617; 
 Thu, 18 Aug 2022 14:39:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00db1a14b4af656231.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:db1a:14b4:af65:6231])
 by smtp.gmail.com with ESMTPSA id
 m128-20020a1c2686000000b003a5dbdea6a8sm7792925wmm.27.2022.08.18.14.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 14:39:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 23:39:36 +0200
Message-Id: <20220818213936.442912-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Sft7rv4/U4hjKhjrVe3DjDUY7kELFcko7pvROIi4WKM=;
 b=onbMnFFKpQyBNnGg1w0raiyB7AK1I+ZH6UExOaP3Z0FPnTbeV8Ds5jbSfd2I5W3xZA
 ybHEsWcHsbjtDEDHcCAIsP4E+Oadk59cXvZYNzqlAFqw77Vw1F5nKzLN+Ys+SoNkesaK
 kJjJstyUUce5FiopgkE8iubJOk+XV/5aG15MWToSkAEl/y37VaKc0it6m2Dpf5QxsGN0
 hYA2cG3bndQdBGgzGIMX5lBdpQiQZUN74BkhkyDNO4p+e2xhhsuMbwRFpDUWfH5l1Uvi
 i8McpH7uo89bZxXIt+LoUN7ki+vVl4OXY7CQRxfSpEQMYdhwf3GRRjUOzJS2iQO46FyT
 p8ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=onbMnFFK
Subject: [Buildroot] [PATCH 1/1] package/strongswan: fix wolfssl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...gswan-plugins-wolfssl-rename-encrypt.patch | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
