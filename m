Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C691BC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9259542C87;
	Fri,  7 Feb 2025 18:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAbMyVJUW1yu; Fri,  7 Feb 2025 18:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D9342C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D9342C93;
	Fri,  7 Feb 2025 18:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F2AD1B7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3035041865
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90vQH4OVtBTu for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52F4D41855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F4D41855
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F4D41855
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90B96A4C4A05;
 Fri,  7 Feb 2025 19:20:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50538)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgSxt-000000003Dm-3HuU;
 Fri, 07 Feb 2025 18:20:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Feb 2025 19:20:33 +0100
Message-Id: <20250207182033.2746438-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207182033.2746438-1-bernd@kuhls.net>
References: <20250207182033.2746438-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738952434;
 bh=d+aD64ZWnbVq9V3owI8U/VbtldLZU9x+VPMgZXEEJOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kOL36ihBPa+vix6sKnPFwL5K56un0gnictsMBlRHzC8Gf2f+qFAuF6aaeXy1z2who
 uDg3Gk+IFQbX+fBh8p1Xq1zKlbNQGl4J4HLK90w5E7y6fSErsNntpyGNE8R2am/Atv
 /hMepgWiQjl3K21vZxxg98pC1Z6hYbBFLm130Kmlrl7SybWBDtdD3HG4sTI/WwzI8t
 2FyEJm5LCB/hILNRI6oawGIEOXB/1htB9hddjio42ImD1qwe6UEPL67wN4OESxvwG+
 7xykwawhAiD38SoMyjnreZJtwVydHZnrSZdLdIIRQop3q7o+bUKRYzBO94ZBVCkmX2
 uQoyxkg49bvgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=kOL36ihB
Subject: [Buildroot] [PATCH] linux: bump latest version to 6.13
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
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1e6842c44e..319a16eece 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.12)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.13)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
