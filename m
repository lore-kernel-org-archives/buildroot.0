Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D952C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 15:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D4060AC3;
	Sun, 14 Jan 2024 15:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D4060AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buAhU3DrQ-fe; Sun, 14 Jan 2024 15:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB6A60B8A;
	Sun, 14 Jan 2024 15:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB6A60B8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2FAF1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 15:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C5C382438
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 15:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5C382438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpaSuCDvOssF for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 15:56:32 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6493D82437
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 15:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6493D82437
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e67e90d5aso20646075e9.1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 07:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705247789; x=1705852589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1CgVwRLq9lL1X4DgBWcND/ApWyJVC6Q32iKyp/wWeo=;
 b=XlGEKjkgTAZlLKeD3qDZAv6Vqs6vdZE5QalfcIkfsDmA3FzOZijLA1QhF6J/AaUmVA
 Ef4vx0yHnMReNIiDGQw2vUZiGSAeGcDHrgBL69dGDXkNPaABUOKHkuGxP5vXMtQRHyDZ
 IqaPVJPLv3N47w1RywVVUdko6/qixEn+geM9+u3lyse0AaF0tdpJSDRb9tnEatDJBin9
 eo5r0yH7x624lL4RTYJ3q0T5b/w99M/cBxnG3MnSUP92mf1UDEdt4Yxup4Z7ttsOYoJz
 0uIWtsxVLhqee68WYdN3BpEco8nyr97d9KzMlPx39ZqJJ7LOV0wDGqZWEtft+5nmF+DS
 1SXg==
X-Gm-Message-State: AOJu0YzQNZE14y3FRr/F6zWXFhISURNrHKf00Zg+i7lucZVotKHaNBf+
 W0Mu4fXpIZKdtOxjy1zyC9ddZPqKpZ0=
X-Google-Smtp-Source: AGHT+IFE+BbQjOUTWo933ngmtflkyhReH+CsT8y5Tyh5N1WsSXxUYopwf2coPUeP+JzwBq8vJ+VELQ==
X-Received: by 2002:a05:600c:3b06:b0:40e:4a7b:f5df with SMTP id
 m6-20020a05600c3b0600b0040e4a7bf5dfmr2644423wms.127.1705247789216; 
 Sun, 14 Jan 2024 07:56:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l6-20020a7bc346000000b0040d81ca11casm12654065wmj.28.2024.01.14.07.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 07:56:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 16:56:26 +0100
Message-ID: <20240114155626.1563626-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705247789; x=1705852589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+1CgVwRLq9lL1X4DgBWcND/ApWyJVC6Q32iKyp/wWeo=;
 b=O4Ykzk/vlKEGiGnbomN3QemhapOVy0fbc4nkieq30xgR8QMucxwVdfvB8rqboDAGXk
 +yjCB1EiPrK2MNf+nGxSHF6tvQ+2GG5K+/PFYURDg7q/HLCLODB/G5tXGPiaKyMLTRZN
 /t02yH0zFaHPAymBNcclOpu6ffizHIyjI4Zb6Xr4JbzkvWct0MfhEOBdt0GsHKNpc6T1
 odgAyod9h4fIiKHs3ZybeX0UMwopnh5/G35D21e/Dil/Xj1BnG910MkcVgZ2q+FFTHNz
 OCI9+05qm7K1MDtyvZ6WBoX24Ure0kuoeweetnqEoROrvqRkNi/SIvoC8xAJHJTRBvBW
 0RVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O4Ykzk/v
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1567fbd72d4b547f70a7509247bf9abb73ab58e3 didn't fully fix the
wolfssl build failure because the include on wolfssl/options.h was still
missing:

/home/autobuild/autobuild/instance-6/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
   62 |     SSL_CTX *ctx;
      |     ^~~~~~~

While at it, add upstream tag to patches

Fixes:
 - http://autobuild.buildroot.org/results/edc49cce5b1f456d980841f4c315e7cd784b1561

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 ...001-CMakeLists.txt-add-BUILD_EXAMPLE.patch |  2 +-
 .../libuwsc/0002-fix-bad-indentation.patch    |  3 +-
 .../0003-src-ssl.c-fix-wolfssl-build.patch    | 37 +++++++++++++++++++
 4 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 02878eae1c..acc9a596f2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -725,8 +725,6 @@ package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch Upstream
 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch Upstream
-package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch Upstream
-package/libuwsc/0002-fix-bad-indentation.patch Upstream
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch Upstream
 package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch Upstream
 package/libwebsock/0002-fix-ssl.patch Upstream
diff --git a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
index 197dd1de0f..87f343a9d9 100644
--- a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
+++ b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] CMakeLists.txt: add BUILD_EXAMPLE
 Allow the user to disable example
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://github.com/zhaojh329/libuwsc/commit/bb71b21eb9407479ad729b3c858b0fc350fae335
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  CMakeLists.txt | 6 +++++-
diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
index f33f944d06..77cae92cf2 100644
--- a/package/libuwsc/0002-fix-bad-indentation.patch
+++ b/package/libuwsc/0002-fix-bad-indentation.patch
@@ -5,8 +5,7 @@ Subject: [PATCH] fix bad indentation
 
 Fixes error with GCC11.
 
-[Retrieved from:
-https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab]
+Upstream: https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/lua/uwsc_lua.c | 2 +-
diff --git a/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch b/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
new file mode 100644
index 0000000000..4c652a63c2
--- /dev/null
+++ b/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
@@ -0,0 +1,37 @@
+From 1c3579e99163a13d622c3ef44088c23d5eea306d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Jan 2024 16:44:13 +0100
+Subject: [PATCH] src/ssl.c: fix wolfssl build
+
+wolfssl/options.h must also be included by clients to avoid the
+following build failure because OPENSSL_ALL won't be defined:
+
+/home/autobuild/autobuild/instance-6/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
+   62 |     SSL_CTX *ctx;
+      |     ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/edc49cce5b1f456d980841f4c315e7cd784b1561
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: N/A (already fixed by
+https://github.com/zhaojh329/ssl/commit/c40ebcd7b4277321acbbd4b00b4b10fd363c7a97)
+---
+ src/ssl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index 3640022..6a3d250 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -54,6 +54,7 @@ struct uwsc_ssl_ctx {
+ #include <openssl/err.h>
+ #elif UWSC_HAVE_WOLFSSL
+ #define WC_NO_HARDEN
++#include <wolfssl/options.h>
+ #include <wolfssl/openssl/ssl.h>
+ #include <wolfssl/openssl/err.h>
+ #endif
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
