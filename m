Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82377C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 18:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D136FAD5;
	Thu, 16 Jan 2025 18:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pg5zDwFOiVKr; Thu, 16 Jan 2025 18:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CD06FADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CD06FADA;
	Thu, 16 Jan 2025 18:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5BDB89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97ADB6FADA
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o13kncrGshP for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 18:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E5396FAD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E5396FAD1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E5396FAD1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:51:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb70.dip0.t-ipconnect.de [79.214.203.112])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05792A4C456C
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 19:51:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53796)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tYUxp-000000003Tk-2inI
 for buildroot@buildroot.org; Thu, 16 Jan 2025 18:51:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Jan 2025 19:51:33 +0100
Message-Id: <20250116185133.108550-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737053494;
 bh=lsPQxKiEWYIxyRbaP7foutbKA8yut02OufQud10pD+Y=;
 h=From:To:Subject:Date:From;
 b=nFh8dWlRTYkpKjfdTFVFspmzdEsKNAhpoRDCRwlUmeZcEPmXTydPFzdL96OFWGYcw
 G5KtslFrOvJxh+TSC2Bcj3zNXFZTZur/tif+aXh5tlDWqmNhghFrJHR5DMZlrnmmc+
 ScFtZXznPywImziAX0q6Tgk4MRySQeJCh9fjFduIZ56mAZC8QD4Ewi9S2ecq7um2hM
 4cAFZJqSFBW2l029V6AekHN0NSHozVIoXeqYuk6mVzYKtxDzBxA0J+6FOLGA9YT5y8
 gzKxHR5NmFjfl59gSlvHyQW0HPxWY9Jw2m+rW0P01eWXNVZhVg5R7aj+eQVQDPrziX
 b2//9wbDTJm7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=nFh8dWlR
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.6.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 05c7e803d3..fe39528dea 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
-sha256  84d23ee07fb26febbcb6d1295ba15efdc67ac382b4137b2c8853146c10fd2f97  linux-6.6.70.tar.xz
+sha256  219715ba2dcfa6539fba09ad3f9212772f3507189eb60d77f8e89b06c32e724e  linux-6.6.71.tar.xz
 sha256  ff4ef6d5cc626faa81fc6da7b5270de064924c919be460f114e6ad8cb9589827  linux-6.1.124.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b0b0e73e66..c7822d16d0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,7 +432,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.233"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.176"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.124"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.70"	if BR2_KERNEL_HEADERS_6_6
+	default "6.6.71"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.9"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
