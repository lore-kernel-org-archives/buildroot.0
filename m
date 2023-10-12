Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10316CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9BAD81CE1;
	Thu, 12 Oct 2023 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9BAD81CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxHsQeZtov8Y; Thu, 12 Oct 2023 16:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA1081DE7;
	Thu, 12 Oct 2023 16:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA1081DE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A01241BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A10860B55
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A10860B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGYNBy9vKSAt for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:36:30 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60DCB60AE2
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DCB60AE2
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-406618d0991so12173555e9.2
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 09:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697128588; x=1697733388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K98ZBbVP06z+ZbxjNdPfx3w5omE9+T4shqbQyxXJ3DQ=;
 b=WO2N0KGWvr5RXTOEBHc2+VimXffxpY6oL4QqwN8aeuqYnrwusML5bn+gPL+ttOQvWH
 l3jr1Bc+BL7TUCCO17AEOJIFfSOeDHOnkvSXIQiugFmehFXqgYStc1w0O6Lc6YWhsfHu
 4UzzWhI4U9gtB3ZACqm0vP2VBlvx4zzbbeofo9DVctsWadNWzmQ4G6WBWvBUpJ/KsxQ8
 aifnvo29m+gqUOfAGdJtP4j3Q7zL6XrTiWPQjo2JSgNgMZBkn66g4lLqMkqIupdwtgag
 uF+dB8EEQg8+cD0ALEOYXp1vXG5sedMvIg+vtxwAqYOWHvvviiK0JHUuZi7/0pCypW1g
 Hemg==
X-Gm-Message-State: AOJu0YwBOAAX2bvfsIPfIbf9FRGz66uzr7MaGilsHAkhwIDXMrJT22mp
 b3lTBiN5Q36RyxrbFWRPnwRDHw8hw/M=
X-Google-Smtp-Source: AGHT+IEetN2oWIS+S6GgRDqC763p7gneOQTL+G0W16PfIx5eTUEHiKGqGe7vRZl3N7Vw7xp4OoEb3w==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id
 q9-20020a7bce89000000b00402f07c4b48mr20897404wmj.28.1697128587626; 
 Thu, 12 Oct 2023 09:36:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 8-20020a05600c248800b004055858e7d8sm276104wms.7.2023.10.12.09.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:36:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 18:36:22 +0200
Message-ID: <20231012163622.87846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697128588; x=1697733388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K98ZBbVP06z+ZbxjNdPfx3w5omE9+T4shqbQyxXJ3DQ=;
 b=huJ7UCw23nOFB5DXOOhDnuSBlCmRSc4wQdhbyf15tiH98evSJqxO3heuqZld9HznzM
 BlbAh4Z54qUQOVYJ7W88Mi0KZ/8MH0USm1BKRcyLROsj/qtUtfrJum45e9wAb9l1/kvw
 L9nsl+gGPH3bpyJVN73RRV140RC6TVqDcjo1eZIotl5Jg4I7OrycJ7r1bO2Hsf/Wb/7G
 waVR9L7fsniMLOH5xNn/QkvHZmUtGN1cbcL6v1N2ypAIwqTTPbaBKIMPqe8iSfejYIG8
 2Jaarmzilff15z/rf1PDHowjQfjRAX3vDK3d+Tnl3g6rpQq/aZrqmVpsAKvzrd2+IepR
 taKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=huJ7UCw2
Subject: [Buildroot] [PATCH 1/1] package/nmap: fix build with libressl >=
 3.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pto.cc-fix-build-with-libressl-3.5.0.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch

diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..f2bdf5904d
--- /dev/null
+++ b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,39 @@
+From 4ebea5c1d1a10be0d0165da3b9c0e1fa82c3db3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 May 2022 17:51:37 +0200
+Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+Crypto.cc: In static member function 'static int Crypto::aes128_cbc_encrypt(u8*, size_t, u8*, u8*, size_t, u8*)':
+Crypto.cc:139:26: error: aggregate 'EVP_CIPHER_CTX ctx' has incomplete type and cannot be defined
+  139 |           EVP_CIPHER_CTX ctx;
+      |                          ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2e6eebbe2ed8305b88047bc92c19350c1ecada16
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/nmap/nmap/pull/2480
+---
+ nping/Crypto.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/nping/Crypto.cc b/nping/Crypto.cc
+index 850438352..9f7c88686 100644
+--- a/nping/Crypto.cc
++++ b/nping/Crypto.cc
+@@ -70,7 +70,9 @@
+ #include <openssl/evp.h>
+ #include <openssl/err.h>
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && !defined LIBRESSL_VERSION_NUMBER
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
++	((!defined LIBRESSL_VERSION_NUMBER) || \
++	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
+ #define HAVE_OPAQUE_EVP_PKEY 1
+ #define FUNC_EVP_MD_CTX_init EVP_MD_CTX_reset
+ #define FUNC_EVP_MD_CTX_cleanup EVP_MD_CTX_reset
+-- 
+2.35.1
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
