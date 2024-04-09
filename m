Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0EBCD1284
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 12:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56A4D40B3D;
	Tue,  9 Apr 2024 12:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pDFWyBzYxKF; Tue,  9 Apr 2024 12:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681CD40B61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681CD40B61;
	Tue,  9 Apr 2024 12:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11EF21BF3D2
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25004019D
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIzWHmmB1gWD for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 12:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com; envelope-from=ludovic.desroches@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA8634013A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA8634013A
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA8634013A
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 12:43:24 +0000 (UTC)
X-CSE-ConnectionGUID: urTd5ShrQKihIBdA8Pu1qA==
X-CSE-MsgGUID: yuM8o3nQRnuslyytvWvV+Q==
X-IronPort-AV: E=Sophos;i="6.07,189,1708412400"; d="scan'208";a="20187639"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Apr 2024 05:43:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 05:43:00 -0700
Received: from ibiza.mchp-main.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 9 Apr 2024 05:42:59 -0700
To: <buildroot@buildroot.org>
Date: Tue, 9 Apr 2024 14:22:33 +0200
Message-ID: <20240409122233.2529454-1-ludovic.desroches@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1712666606; x=1744202606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g321ADK76/LpX6t3oyz9465XlLOsP3whpJYBxPxMf3w=;
 b=VKjhNCKsH2YoPeEFybVQrvfl8kDBlAmcY6X8euI1dF+4VyQDO5wjj0i2
 IvtDKQEsyrxc3j72YTs0ur+ESkFrQHnbkygSc3pU2f1jZlez4FR4WZfrd
 lV0imu60bCLJW5dbJNjwMLpKzEgmoaoaQ+m9PO52AuzZRG+0HvzTgsPZF
 XUCjuuEsF6XrNoPvQSAbd970oy05J8zf4MbaGn1ruv9qsfhMYWI5Gx0zX
 8SFggAfEQo+Kvw0eaEuYYw45kUhG+nyYP87PjvLVhVeqIizUnfVHsaE/5
 LUwb7kwrd+nEJn7X87e4d/YK0ScWwdRpBvrDJwyY8MyPW/Qx6utOZS5xF
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=VKjhNCKs
Subject: [Buildroot] [PATCH] package/evemu: add staging installation
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
From: Ludovic Desroches via buildroot <buildroot@buildroot.org>
Reply-To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make the evdev library available for other packages, install it to the
staging directory.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 package/evemu/evemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index b27033afa4..886ceb1142 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -9,6 +9,7 @@ EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
+EVEMU_INSTALL_STAGING = YES
 
 # asciidoc used to generate manpages, which we don't need, and if it's
 # present on the build host, it ends getting called with our host-python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
