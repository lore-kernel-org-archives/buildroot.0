Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A22E743F2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAAF60B10;
	Fri, 29 Sep 2023 07:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EAAF60B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-vAWW1D3_Kd; Fri, 29 Sep 2023 07:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C8060B19;
	Fri, 29 Sep 2023 07:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C8060B19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D001BF267
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82FA14058F
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FA14058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YI-Ofio7Bhsb for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:59:02 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 758EE40122
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758EE40122
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso110892945e9.3
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 00:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695974340; x=1696579140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMkTxIG+7qIOAzS2xsx4SUGznyZRB9vbCi0bikKGzAM=;
 b=fkiABEUJwljK4kSzT8mgdfrabIu7x1g/E/S7gHUWFkHai1vo49g4Vc1F+DrXXvUuj/
 WAblF/8v3PcPRsuRR8o6De4VtRYhnkStzqpqwgzrJB7DcFDM1oCjG49n/l4Q39rRVbi+
 aQiz6TEXRO7X/dCrvPxHMAhyW76vZKrKdHHBNJMoo43EdFf8dl4xDHyU7KxXKLYVw/SU
 7Qies3kKDWp7yvx3n/SarFoi8PIdwTVdBQEaAhsRI33DBpXKL/bAchT1609Tl4AYWUyC
 ZgI0YjgCm6onw5qKY5O5clNAguTKjGUpsvJhfRJkoW5S7E+J5Ur97RbqRvjpoplcSO8q
 BnXQ==
X-Gm-Message-State: AOJu0YzMvHoUoHdH3IXGhAYrs+8puFX7XJNBU461cMP9k2E0jbDcNeTV
 pPwTVsqstaVKMwKRyhGED/YOoNOUihk9cQWZ
X-Google-Smtp-Source: AGHT+IGDIfTCJ3V9u4RkAeLUugI934i23hcTxdfKldVRUIZSJpe62S+wkP2e4DaCKBK307R163CXEQ==
X-Received: by 2002:a5d:4a89:0:b0:317:5ddd:837b with SMTP id
 o9-20020a5d4a89000000b003175ddd837bmr3066701wrq.7.1695974339739; 
 Fri, 29 Sep 2023 00:58:59 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bt14-20020a056000080e00b003200c918c81sm14576481wrb.112.2023.09.29.00.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:58:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 09:58:24 +0200
Message-ID: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695974340; x=1696579140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BMkTxIG+7qIOAzS2xsx4SUGznyZRB9vbCi0bikKGzAM=;
 b=TUYZTsfXvOQkRSxVuYl/R3mt+mWrExI9uABErUhdycbsZ6+DlSUSxX7HXi2k7qGZMn
 wZbwO2yeKPIrR3m7KW8Uk3xkZQV6WEpyrLOPiovpunmaUIDvFtsoSlW8pddFNMpDfewU
 SU2S1S1hydTbwt6iOq3RxOz4UCiicMe7U2wtJbqTdaYZ0w2wcXkaBoKH2mBcx3/OTq9G
 MZmlVE/cBfcGGcZnepIuhd8e8y94jwe9Q7Vz1MX5Sz81jzNO1YQb+AsdbuLFpuh6x3VR
 agnPLH0w5mPqE8clZeE19SIiI3WYaTe5r8hQE94o/LRvqp8ViNFLZLxam84QLbwVYwoD
 Gm8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TUYZTsfX
Subject: [Buildroot] [PATCH v3 1/4] package/webkitgtk: require GCC 9 for the
 2.40.x series
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raise the minimal GCC version to 9.3, which is required since webkitgtk-2.40.0 [1].
Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
we do check on >= GCC 9, because we can't check on >= GCC 9.3.

[1] https://github.com/WebKit/WebKit/commit/f9c142d9b5b8c48fe310bc6d3620e634901b2930

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3: new patch
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6835467c46..927792b1e4 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 8, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
