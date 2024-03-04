Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FDAC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 424C0414A4;
	Mon,  4 Mar 2024 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIa7TBbIGtWN; Mon,  4 Mar 2024 16:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B87414CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1B87414CC;
	Mon,  4 Mar 2024 16:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDB91BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 16:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 277FE60C00
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 16:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGN0dSgEsQyQ for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 16:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3A16605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A16605C9
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3A16605C9
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 16:08:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d228a132acso61094551fa.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 08:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709568480; x=1710173280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dQtJoIGeMl3wtdo8bz5+mDUQUQXjULoZThTvqA3dvI=;
 b=bzFxrFOM9b7suCb0/uw+eMMwgFX28lmsb9J5fobfOYvkbwgGB23dq3axn4xpeoZbMa
 pkks0uXJUKH2YsRaVh7Q3G/nGHCSaShdNfNCi58pZWFJvchvYzob9oUizoOpRpYjMcBJ
 OhluH5B6Eg6x+H7ddF/DL/AkkWNZWEAd3dm/d/oJm5gHGGVoUhmODfW6cFFc6/GoSgvk
 YZ68oFp7j3X/+9stEoav48Gb9fzG9lvTk3BZcIwxskrMmT1YV4hr/3+389V/YtNA4bDR
 wJ2z9YWIDyY5CexGkdnbspb4J2XmCjehk2/m/HMtbNYTSulrVGkDh9uQgwn6lCd4xuQd
 OgAg==
X-Gm-Message-State: AOJu0YzHEb2rreeAexidvdi829+pCoz0FmEceUMZ3RfTxTCgQUAKo8XF
 FxH688FXCKb57IOTekPrzzSC2XBM6cMziqsr6LkriAabd1FBgCba//0B9O+X
X-Google-Smtp-Source: AGHT+IGRqulLaPz3nqEtK/fbQrZU4/itFWgqyMyvSvsKn4uA9804rxN1MLEPpuH6AumFRLWUptyCtg==
X-Received: by 2002:a05:651c:548:b0:2d3:c559:3a33 with SMTP id
 q8-20020a05651c054800b002d3c5593a33mr2352010ljp.14.1709568480396; 
 Mon, 04 Mar 2024 08:08:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b00412db03f182sm7182089wms.11.2024.03.04.08.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:08:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 17:07:57 +0100
Message-ID: <20240304160757.3518501-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709568480; x=1710173280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6dQtJoIGeMl3wtdo8bz5+mDUQUQXjULoZThTvqA3dvI=;
 b=bBbN9lY9PmFaI6z2/E6N6zMprWEnndXfAcCDQZpCahkdSMqz7J+OuajkxKNH5Oy1ER
 tzhuazp/p6U/2dwQzwGpXJwqkaniXGlXWrd917p4RVjovODevVBRnhCQzb/24efFjpVh
 o2PUu8RQ0pY3tTbV2wI7CvqxHIvJINyJc0VCri7h6Itv0WUPkhnS9Buux0liyKJ6LB4m
 BauVk5f1PfSAGozEVsi0JQls6eZUgm8F0l7k18CwkeXEHzuJqnY6yc8MBKJxRP0gn8As
 0hn/Hx/TshGIe5+l2ooM/CbGvaZl16gZh/pMKsQMKiQWBPb1f4IG1zuY200zJV1LUjYZ
 ntDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bBbN9lY9
Subject: [Buildroot] [PATCH 1/1] package/botan: needs C++20
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

C++20 is mandatory since bump to version 3.2.0 in commit
2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813 and
https://github.com/randombit/botan/commit/e2efb744ceda875b193bc5ce589f2c45ceaa3a82
resulting in the following build failure:

powerpc-linux-g++.br_real: error: unrecognized command line option '-std=c++20'; did you mean '-std=c++2a'?

BR2_TOOLCHAIN_HAS_GCC_BUG_64735 dependency can be dropped as gcc > 7 is
not affected by this bug

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/4171515ce33832fb07c8b42cda2575067f9e9859

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/Config.in      | 11 +++--------
 package/strongswan/Config.in | 11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 8f7f3f5c7a..5c3f31726e 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -14,10 +14,9 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
@@ -25,11 +24,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "botan needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-
-comment "botan needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 5231e69ca8..808e42e658 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,19 +35,14 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 4.8"
+comment "botan backend needs a toolchain w/ C++, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
-comment "botan backend needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
