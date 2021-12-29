Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789AEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 22:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D602D826C8;
	Wed, 29 Dec 2021 22:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEvAsfcZJo1x; Wed, 29 Dec 2021 22:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DA08269C;
	Wed, 29 Dec 2021 22:25:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 402EE1BF30B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D03E40908
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4KD343FAJWO for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 22:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B681408EE
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 22:25:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id e5so14073784wmq.1
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 14:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pX2z5UybchIWpNT8J0SjrPVyk+F6S9DxGhM48Z8GfSo=;
 b=SoLqxc47DHiv/vMrgvlsdzNVZHPVv0TgNuS+JiBqulTORUv5MrlEXPi++Z5+xMJ79c
 LsMefdWHF2Qj1MoZFN5JTVfZtxCis73jsaAtS1qgisfQt1lkpL63JALRnNvTo1+2Q1fD
 IrSC5kNu0vLN5xYOOYNkhT+INHDJOiCqs8Umc69s/6CGxG5FIxHFSIzV1S+de2qe6xKY
 MsRxZBGfJaDmYVa6x1GnNAa0LKP0tXELxMeMvVfwKhlpl/3C9dieVFcmRheMKnKAIah5
 LLyDVjmjvbfQwnsg7FPiyEqR+oLrrYeMfhtIJgLNFgFYA8cPnKbN3XwGvhBSSZGAYK+v
 ZvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pX2z5UybchIWpNT8J0SjrPVyk+F6S9DxGhM48Z8GfSo=;
 b=YgeYiLFJeBvIYdy4+Q7TnSFK6M4Aj54nh9Vf7HHayf5XsYisla+8qSim2j2BOI0uLa
 5Yd3zrJ6gwOanwIWacyVzOx1rOAp5xbZclYIq8B2TkYv/Iv92xoXjIHTiWEIXjvJsuhg
 CCjJmS6RYbJyMq8RgPC3LU9f2IFQuR6J2KOxJJ/0t6+OGmXzSzxF+4ExwtLQpfAhvHD7
 Nn1MAhalXMl2HfN+WsKzOGbtI5fCH719kbexx0tDyEF+FUqBOWaT+LMqD4zVqjAtxU9U
 WHaozzza5sLpGBTYs9AvwGjaWAhkS3C9yxIY+F4U8UzEPe6ejwUv50QsPUHEl/h86UfH
 VBQw==
X-Gm-Message-State: AOAM530AX90q8502Ars12JKdujNoy0rGywbJc2LvN+a1ZHiFpQ/lmDmy
 bh0XSw4bzYXtxy9xGT81ZaHnIJWL8xM=
X-Google-Smtp-Source: ABdhPJzeOlSviYCW2GlQ9g/MU8BIl9QZwxj/zGRpcuAcTugZkun2PdPIXtV7PK2pScwyXt9Lw68knw==
X-Received: by 2002:a1c:1bd8:: with SMTP id
 b207mr23988858wmb.114.1640816707252; 
 Wed, 29 Dec 2021 14:25:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y11sm25911135wry.70.2021.12.29.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:25:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 23:23:44 +0100
Message-Id: <20211229222344.604311-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qpdf: requires RC4 support in
 openssl
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 10.5.0 in
commit b5352c2177011ca389cbb7c68e78447549cbdaaa:

libqpdf/QPDFCrypto_openssl.cc: In constructor 'QPDFCrypto_openssl::QPDFCrypto_openssl()':
libqpdf/QPDFCrypto_openssl.cc:46:9: error: 'EVP_rc4' was not declared in this scope
   46 |     rc4(EVP_rc4()),
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3b7f19ecb3303c9c9eb89c493c7e0d8a47b4be95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index eadfc5ea92..047c4c8a75 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QPDF
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  QPDF is a command-line program that does structural,
 	  content- preserving transformations on PDF files. It could
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
