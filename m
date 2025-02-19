Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0FBC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95EDD81297;
	Wed, 19 Feb 2025 08:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRJNGzkd5_-v; Wed, 19 Feb 2025 08:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED98812B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED98812B5;
	Wed, 19 Feb 2025 08:51:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1E5DC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0DE460071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3G-l29qWPYDg for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF3E8606A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF3E8606A3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF3E8606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-439950a45daso9906115e9.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955047; x=1740559847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yu/Te+HUnibSLEBqE/pt3WA/01oORMaHGUNLNdg+Eww=;
 b=m2AXLQ958JUYqWsWUp2MhGb2MHun21ojrrUSj2YIMEBHXpxmssZpko2x70pUE/xRLo
 kh7aQ7gNiiTrwStDzt+YFsAcACk7fdsR5+GIthjR2fzt/8nGRl5p4pX35FMZ06PuO5VM
 7k/Gaf3kyLh8tgYxRERagrKp+RmW852WakOCD6GftBDQs7ugcnZxjH/+kJ6HjW5Bi4FU
 CsPb4fndyhN9t/J4n4kc5AyGH9mpMRgmqOIHtBkNKSjpCo/hu/P7kZvSXBhRK77/MsHj
 +0HGvSw97CUBWReLgLcPkwwhGBQhpOLvLh/Oz3a5FfHCrs1rgXtWTHTel9IRq/VCOwr6
 QYIw==
X-Gm-Message-State: AOJu0Yz3T4v37ytke2IykL5qX2YPEGTrZ1VxyH/qjsfsMqNjilwU88J4
 5kHBSUWeJppme6HZ0JD0Q/stsIBfZFYXCu88KRUcMDiBPsSjBNUW09GFHw==
X-Gm-Gg: ASbGncvokM6mvCjnUBlR/HRBB0bSu8NmSS6BzZtav5SpK9Ef4kfinguPsUy8yWgwLTy
 kJpzoVsM8HLkm0OApF4OSH9mswvMya2fOhy/eY8ttJhgBYqTudbcWhwZuz8Am3t8f/zQACSkXJF
 rv8Fx6AdVO7ep3kE/LjBCOxn32KWdiIRpj1gIEUhJK5FunYUjQI7tvKyM7EFAz/413I1HGQZSJv
 msi3ka5LjxsC5nCxutrpNd64feeelCnzILN76sLrmKfsK+/02bckVgCA+hUxnJjk9kbOCLj5NHh
 2qm1LDICDePWaCf4YRYmAcRz1w==
X-Google-Smtp-Source: AGHT+IHFMD40GUimlBnk2Jbe96ORgChP72xJyKPmplc59+mKOrShgZ6zH/z1mD8/H3fHmkGrv36W+Q==
X-Received: by 2002:a5d:6d81:0:b0:38d:e584:e944 with SMTP id
 ffacd0b85a97d-38f33f48f37mr15410044f8f.25.1739955046642; 
 Wed, 19 Feb 2025 00:50:46 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:21 +0100
Message-ID: <c1371718b74af00320c222f0a1b1ee657ba2ee3d.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955047; x=1740559847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu/Te+HUnibSLEBqE/pt3WA/01oORMaHGUNLNdg+Eww=;
 b=YmeOtM6MZXwRcx5twEAH0UCpSrEXJpdKrBUD9NE/m/a0njl1RoIfp0+OFkgGqLxxs1
 8G6p01veD1f6HEOnKY9IHg6NHQvEsE5rBMYKIhKbZBpPQJxVO9LLStUDx2eupsYg2E6U
 bmpfDX9zYKvo1bqSalIQ6/Q/iYvagFMO5xVLJf7mqDC8Mod/aBsebassf4BdifnAjD2B
 6l7mPlkG5lMD2A4A8+AgzCUBXhRo1OiDG+OGn+I3DzljioRTm4dzN2U6zWiGYQqdjbvA
 90jQbxF7LcKkQuiLGl49gT/iZldD5mS18JQ746lVAXToR4Lq10gQFkTTAdvTAWwLINfE
 88Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YmeOtM6M
Subject: [Buildroot] [PATCH 06/27] package/pulseview: fix, update,
 and reorganise dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The dependencies for pulseview are not entirely clean:
  - arch deps are not first;
  - second-level inherited deps are listed;
  - deps are not alphabetically ordered (for deps on packages);
  - the comment is hidden even when the arch deps are met, because of an
    incorrect dependency on Qt5;
  - qt5 is a depends-on when it could be a select.

Update the dependencies to fix all the points above.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseview/Config.in | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index f122551b9f..b1f9dc25d7 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -1,40 +1,40 @@
 config BR2_PACKAGE_PULSEVIEW
 	bool "pulseview"
-	depends on BR2_PACKAGE_QT5
-	# libsigrok->libglib2:
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR  # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # qt5
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libsigrok->libzip
-	depends on !BR2_STATIC_LIBS
-	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_STATIC_LIBS # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigrok
+	depends on BR2_HOST_GCC_AT_LEAST_5  # qt5
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
-	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_ENABLE_LOCALE \
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_HOST_GCC_AT_LEAST_5
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
