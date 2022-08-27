Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A220ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF22F40A03;
	Sat, 27 Aug 2022 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF22F40A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLg05C0vB6_H; Sat, 27 Aug 2022 20:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 625DA409F5;
	Sat, 27 Aug 2022 20:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625DA409F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4B71BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236858248F
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236858248F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fz5lAx0ERMEw for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 027C582438
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 027C582438
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:36:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b5so5621536wrr.5
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=BswoyJR3RYknKswy95fPtuepIrEAgKZmZgqEnmnFY4w=;
 b=HA2srAiNyBjBfxbrQZ2P3is8PQiM60k7Ry1fyzq50fO4ajjUZJ337y5Ys+9SPb0jhU
 Cd2m4LdMiK+FwXbiowLvkPpjHhNRuS4NHxDNg+3vFu49FMbQtC1OUB6xeXU+/2roxCZ8
 fch0MFuWSmGVyUy2ObfVGD4Zga+/DBzLqB8bqiV3Ck5FVkBZZXQWlOGyjQqtFsVteVT4
 LwAYgGUWzaVobcfqeeRCBvXeKJ7n+61UcP01YScFBhhP8d7L73BETHDgELRI3LJjDkzN
 cSKk2hD08cfKkTzk4mvpu4CXKJSqGZPUXmT8xLVIfrpvii4H2/bCW9afj2FhZpOcRlwB
 U0vQ==
X-Gm-Message-State: ACgBeo1Ll3hZzYlqFf8ogSMORZckLz+5szgjXg0O4wsc6OSAU0AlDkv5
 0qBXZG2QqmuGkNM1kcccdQ8EV2ZCr10=
X-Google-Smtp-Source: AA6agR5hDTg5J1yNwDMPnde8sTgyKZgjXZg55rZS7xZVuYnou79Yc0iaWnyqUjujEAHlBZO/N9TMEw==
X-Received: by 2002:a05:6000:1563:b0:222:c70e:b2a5 with SMTP id
 3-20020a056000156300b00222c70eb2a5mr2837455wrz.492.1661632559889; 
 Sat, 27 Aug 2022 13:35:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x14-20020adfffce000000b00224f7c1328dsm3020128wrs.67.2022.08.27.13.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:35:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:35:57 +0200
Message-Id: <20220827203557.272100-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=BswoyJR3RYknKswy95fPtuepIrEAgKZmZgqEnmnFY4w=;
 b=doIdJEWB+7y7vHW6eZQy3BtEj0hQr6om+CnGiCcmErumjaWYcrHF6WXCXqYp67289w
 E4PAQd4Qg4NJTsWMxSyUVjFEriFrJdDqebOjwwEoFHN+S1zGOH4fp7WTSoZLkmxWjAEk
 /f9SfEk+qIoNW4oS2E0E0HP5w9r3av10N6XcnTfZDNCDhDijIlnVF7buztgmEejBw8n+
 ZfuKwLcaFtPnDKQWvFDVMQ3/JNsLexOkzJHqIZsTxV0T7o8QMdarXI4j9rBwv2g2UwCF
 +949TaWeDRmDj2bcBo+5LbczYumln2wEQSM4fzJrpQ/3pcTMt7sgJRqGCrmHQl70LFPg
 oQ2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=doIdJEWB
Subject: [Buildroot] [PATCH 1/1] package/libcamera: needs gcc >= 8
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcamera needs gcc >= 8 since bump to
8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98 in commit
64f67ede01699c47ca3c8801ae5dd440295f1874 and
https://git.libcamera.org/libcamera/libcamera.git/commit/?id=a7ab5ef1d2f9b05056db450e631a99a73382d589:

../output-1/build/libcamera-ba6435930f08e802cffc688d90f156a8959a0f86/meson.build:82:8: ERROR: Problem encountered: gcc version is too old, libcamera requires 8.0 or newer

Fixes:
 - http://autobuild.buildroot.org/results/f8eba0e564d03b83fcda4085baec16a4857c7d25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera-apps/Config.in | 6 +++---
 package/libcamera/Config.in      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 492a99cf55..711fd6de05 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	select BR2_PACKAGE_BOOST
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 0febfef4bc..63c06173db 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
@@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
