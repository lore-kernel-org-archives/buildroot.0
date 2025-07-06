Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B65C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 18:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F4060DDC;
	Sun,  6 Jul 2025 18:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id layXsC3rMqV3; Sun,  6 Jul 2025 18:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2993960DBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2993960DBD;
	Sun,  6 Jul 2025 18:09:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AAD12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 031934006C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWTnQqolh9xN for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 18:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B4BC4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4BC4004D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B4BC4004D
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so1237801f8f.1
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 11:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751825351; x=1752430151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50hyzW3GEhFF/gi2tuRCpeZ9Y+DBP3zRX1w9D0NPhxE=;
 b=c/zDzORdsB3ki0i807rBTzsAGFCbcEg+idMcHxIzlsMaMgdjbQnoLhvn5YMuq9cLFw
 Q91MUWOsDag573o7KiFKaH1HOcvjty1TBVOz8mj5Jddqqwk93BLDF0/wyqTtv0GH6og0
 0htf+23nTZzOpaFC5zHESgM3GnSbyepsF9cI1scoBLshPznMWZVmVb2de4VxqTO03t8h
 iPtI7UBOyPaLayACIyWGgXDmXSzZJKDRyw/6FlFKSDF/t6JZZ4IwhtavxitpW4fe0EAV
 9tx/+QJsc3/tsVOQClZuQ1SOahN5lMSJlIK0cYX3YpML+11R37m8/r9iwW3upIoK6aA0
 7Kfw==
X-Gm-Message-State: AOJu0YxUwrhQUxu8iA+Tf7wsSCeqF3sJp/aeJqas6Maku0GimE4mI+ci
 S5NjWP5J4f6ga7/mm0HCXSpEw+0XfxQArKSLwUjynR2QKPJsQvUR/c9SGuLAJNx65b+QAXQ3MV9
 oVUCrQhI=
X-Gm-Gg: ASbGncseW6uUuer+QDf5kVUYjeonUDyf5Y1uUC6H4FTa+521RgBE0wpCGAOiZ9u/00l
 4sma1hjPVdULDxCgbm0yR4YL3XKT7NUTFik4vhuqeZ20D3JGkdfsm9U7JZWNnhPgcT/ItZc/Z0W
 5URrIynKFL0Y442VvmeD0zBj2py4VvFtgsUxvF0rSA5QFJRsg7Rw+90OaJVa+rttDGparDboTwz
 Hqtq8dlCLJtOEZrqv1/Pj5eewGc4OHeJsT9H9Le2O/ABKXjqkFGEjwVKHSQiCqKp4d3q1AMH2Ie
 rE695bDiCwacIqgiMjtICtDrGeQNBhb+W6psNn6+cVQEnBJet4nkOSbZXVrJhgvT9TqoYSQtGHj
 7wtgqR/FtNSHmEjqykyow
X-Google-Smtp-Source: AGHT+IE9gwhlmPWCBnS2xTccrK5s2GsgfrxuZJsyxHv9TVyCZCgMZ6WYNmB0ojpdAvik3VMrqCkWrA==
X-Received: by 2002:a05:6000:40c9:b0:3a6:d604:a017 with SMTP id
 ffacd0b85a97d-3b49aa30a36mr4649369f8f.24.1751825350692; 
 Sun, 06 Jul 2025 11:09:10 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285dda7sm8223918f8f.99.2025.07.06.11.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 11:09:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sun,  6 Jul 2025 20:09:08 +0200
Message-ID: <20250706180909.1114945-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751825351; x=1752430151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50hyzW3GEhFF/gi2tuRCpeZ9Y+DBP3zRX1w9D0NPhxE=;
 b=bMWJW+WpCN+PwYRYi5vzboxe2Dsybla7VVWs40y9o++2G2aXv6HVl/1pte6YzbCCXy
 8EosbWxfZP+//tDPW91XY+HPjT4fwVs9MjE6+az4slYqcLsWPtWv1klJvaBxL+OBW/1m
 YVl72MhHqqwQpPsTkMs8Vaqn8/vMlBAIiOEqDcoD46ZO/m6n6+y97CS2FV1/ybV3gw0X
 JZV3jrHDWa7xETXby0/DUO1VaMj1guZ8Bv918cE/EDcnfY0CyCGQfbHFR+qg5T2gZKtZ
 buTGpbLmdnb3IKrZ57bfDnyPfBrUiBxZPGkIa1Fj/HDJXDEQhDp0Mf87xUhG5mZ9p0Wh
 FtYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bMWJW+Wp
Subject: [Buildroot] [PATCH 1/2] package/libuhttpd: fix build w/ mbedtls v3.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the mbedtls bump to v3.6 [1] the libuhttpd fails to build with the
following error:

```
[  8%] Building C object src/ssl/CMakeFiles/xssl.dir/mbedtls.c.o
.../buildroot/output/build/libuhttpd-3.14.1/src/ssl/mbedtls.c:52:10: fatal error: mbedtls/certs.h: No such file or directory
   52 | #include <mbedtls/certs.h>
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_LIBUHTTPD=y
EOF
make olddefconfig
make
```

The compatibility with mbedtls v3 has been addressed upstream in the
zhaojh329/ssl project included as a submodule of libuhttpd [2].

This patch backport this upstream commit to be applied on the submodule
directory. This required adaptation of the line numbers (see [3]) and
renaming a function reference passed as parameter of
'mbedtls_pk_parse_keyfile' caused by the commit [4].

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
[3] https://github.com/zhaojh329/ssl/commit/8092b5a490eedeb042cc1036ebeab6442624cf4c#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7
[4] https://github.com/zhaojh329/ssl/commit/0e7d2f73d769cc4ddb350381cebb5ef6f27ab653#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7R92

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dd-compatibility-with-mbed-tls-3-0-0.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch

diff --git a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
new file mode 100644
index 0000000000..1f45d4634c
--- /dev/null
+++ b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
@@ -0,0 +1,64 @@
+From 28cc9b5d98179d161673d20e79333ae5a4864228 Mon Sep 17 00:00:00 2001
+From: Jianhui Zhao <zhaojh329@gmail.com>
+Date: Sat, 4 May 2024 19:40:07 +0800
+Subject: [PATCH] Add compatibility with Mbed TLS 3.0.0
+
+Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
+Upstream: https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
+[thomas: 
+  - Apply to submodule directory
+  - Rename 'urandom' to '_urandom'
+  - Adapt line numbers
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ssl/mbedtls.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/ssl/mbedtls.c b/src/ssl/mbedtls.c
+index 2e02e1c..cad7e00 100644
+--- a/src/ssl/mbedtls.c
++++ b/src/ssl/mbedtls.c
+@@ -49,7 +49,6 @@
+ #include "ssl.h"
+ 
+ #include <mbedtls/ssl.h>
+-#include <mbedtls/certs.h>
+ #include <mbedtls/x509.h>
+ #include <mbedtls/rsa.h>
+ #include <mbedtls/error.h>
+@@ -136,9 +135,13 @@ static const int default_ciphersuites_client[] =
+     AES_CBC_CIPHERS(ECDHE_ECDSA),
+     AES_CBC_CIPHERS(ECDHE_RSA),
+     AES_CBC_CIPHERS(DHE_RSA),
++#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
+     MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+     AES_CIPHERS(RSA),
++#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
+     MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+     0
+ };
+ 
+@@ -221,7 +224,7 @@ static void ssl_update_own_cert(struct ssl_context *ctx)
+     if (!ctx->cert.version)
+         return;
+ 
+-    if (!ctx->key.pk_info)
++    if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
+         return;
+ 
+     mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
+@@ -258,7 +261,11 @@ int ssl_load_key_file(struct ssl_context *ctx, const char *file)
+ {
+     int ret;
+ 
++#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
++    ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _urandom, NULL);
++#else
+     ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
++#endif
+     if (ret)
+         return -1;
+ 
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
