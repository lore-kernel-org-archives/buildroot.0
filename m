Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9C3CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA2660DE5;
	Tue, 17 Sep 2024 18:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv9jQHSonUvT; Tue, 17 Sep 2024 18:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D59660B59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D59660B59;
	Tue, 17 Sep 2024 18:22:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1464F1BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EEA760B59
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrAfW2V2V8vT for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:22:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E88D60770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E88D60770
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E88D60770
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:22:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B2DDA4C20E9;
 Tue, 17 Sep 2024 20:22:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54236)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcqM-000000000sz-15M3;
 Tue, 17 Sep 2024 18:22:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:22:29 +0200
Message-Id: <20240917182229.3009790-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917182229.3009790-1-bernd@kuhls.net>
References: <20240917182229.3009790-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597350;
 bh=5otMOJbniq58TFElnI2wdd/nN3vc0vDlQo06xBOw9u0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qqHlEtx5v9ipevuUSVl4+Tc25OU/IQGERuN/cRRMEjEKS6sRvtUFQsfdZsE+gyAjN
 6gfdluOH6T5+iSnMblUQKnsEjuioucl/T6tYubowFFwjOjxcwNiTtdxR0eB7OOQCQ/
 nr3mwYX7C1+k6PYi7R44p6zhiY8to5DtutyghL/JrTD8N1MZFT7HhyLgIy7pqmPAlG
 xj8Hho342shw1mBmkv1RHqJhLWt5Q6OdukLMZZAQdroQ57ZeP2BUhDertRAljCJAYl
 S2X+o5RJ2JfE2bnHAvENpYkpSTOYkyHdGPlNMi7Jwdue4ajiqmJ8mbGdCLcv3ISWzV
 RFQ2aVQoll+4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qqHlEtx5
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.11
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
index e8c0722de0..2270fc63f1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.10)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.11)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
