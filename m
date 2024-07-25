Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0CBC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C903C60A7B;
	Thu, 25 Jul 2024 19:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x31tmy5GI8qf; Thu, 25 Jul 2024 19:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE97D60A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE97D60A92;
	Thu, 25 Jul 2024 19:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF64F1BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE27D402D0
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOaQacnRHbVE for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 19:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D462A40195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D462A40195
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D462A40195
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:50:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2dc.dip0.t-ipconnect.de [79.214.194.220])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66CDEA4C32A1;
 Thu, 25 Jul 2024 21:50:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX4TQ-000000004NT-2hTA;
 Thu, 25 Jul 2024 19:50:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 21:50:00 +0200
Message-Id: <20240725195000.2965998-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240725195000.2965998-1-bernd@kuhls.net>
References: <20240725195000.2965998-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721937001;
 bh=fRt5y5RPlT5ywbPmxuRNuqSJ+chf/61QbZ80O8OA2WM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YBjNKZoVqQoEkVCPBVNqpN0A82vDyewzJOnemD9484h7TABHA/OhD21GN9DK9S8t6
 lE5nKxjijBR5+HpN53LFYE9oNli5MyFMUw+2kd1BQduNn+GlEkJ5Ai5O9E65UCtaUz
 9HfDSBGfcJr4yIUtSnDSQd8uV1gElB3REq/XwofgiFRFsiw2jVK1ByAfluUv4lQ9+v
 ldWVE2Qqluw8O2s3t9g7vbNcE3nTlROh0p29PGmFvYjyTNLtS0XRxPuDcb56iLzNw2
 +rvvIdBuHz2sSGyEFsKUcUAmdvVLcRipw4ie2wsq3lLydLureyw57GU/pFiOxsn4VQ
 0e3+qKfp3D7NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=YBjNKZoV
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1542edc0e9..9da1db16d1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.9)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.10)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.9.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
