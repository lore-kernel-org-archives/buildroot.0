Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE7C27C77
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 11:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47F2812C6;
	Sat, 15 Jun 2024 11:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHfBiNbaLTt4; Sat, 15 Jun 2024 11:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D96812D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D96812D0;
	Sat, 15 Jun 2024 11:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2F51BF31F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FF940144
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZUMetbsh8v5 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 11:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A33A400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A33A400D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A33A400D6
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:31:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beb3.dip0.t-ipconnect.de [84.161.190.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DE93A4C2E03;
 Sat, 15 Jun 2024 13:30:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46656)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sIRcP-000000003xY-3Kxb;
 Sat, 15 Jun 2024 11:30:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 13:30:48 +0200
Message-Id: <20240615113049.456274-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240615113049.456274-1-bernd@kuhls.net>
References: <20240615113049.456274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718451050;
 bh=l66wOFQa9OXEkPmRDo0pCbNMwhxE+85MLq5dAvwo8pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pwo+r8ksum18MGv3sZFNolCOtKo5ssVI7opbChf0I/4xtjHbK29HSp1lo5RSiJb2p
 j9r3CUGtnS4gHheGNnj9Fv/AbJ0eo/+B87QQW56396DKv1Vc20uFTaNErO9er26Ohs
 1IyR03McJTUnCzo6Hahfgj+oSFQcrJvgZK/F30sjEios3KVte+MqJE7x4llUTnKCYv
 oKGo6jwnPDhQ24cr+cx1txoSqUcxdAJQ3/EtHCpaflCjcMdKlo6dsj3hBETDfdFTV2
 ZRlsZ81KrRNg7GZxDnQ6NysDPcVeY+V9YJ402g4I8Vtgl2KADNYAv7ADoYSLokam9r
 OMGF6lE4SQwcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Pwo+r8ks
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.9
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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
index 194a24f391..865b7fd240 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.8)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.9)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
