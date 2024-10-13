Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119DECF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0023402EA;
	Sun, 13 Oct 2024 10:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoCu5iIbtWGE; Sun, 13 Oct 2024 10:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A094090E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A094090E;
	Sun, 13 Oct 2024 10:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE5331BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89BF407B2
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFauw6iUJT82 for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79801406B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79801406B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79801406B3
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:34:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b41f.dip0.t-ipconnect.de [84.161.180.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FB16A4C129D;
 Sun, 13 Oct 2024 12:33:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32836)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1szvuw-000000002DD-1KnM;
 Sun, 13 Oct 2024 10:33:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:33:41 +0200
Message-Id: <20241013103341.78501-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241013103341.78501-1-bernd@kuhls.net>
References: <20241013103341.78501-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728815622;
 bh=kdeLMP+yX6anAN/YmBMPrUNi7K1V4IUxulfXlSrVSKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmOZnyvOf/nRaMCcY0BMO3VIlgFX76YbOOiIQWjHjeZGm5o3xoBFwOgUuvKhpRy9l
 AgdwLsnw0eF1fYUFUWPszreF09CTIlXsBYklAaO3EL6jdbfZelYFFnlvqOWljs3LA8
 EcCuov6j59UIPFmwEji6BvqZtaog4AadfBAyC5Vmw2xDkH8RSgmNVv7mfRGEMd4s8D
 KdrLPRhsVcgxpndrBH6b+F1oswBNE6FnuihRNU7n2O2WwZ0hEf/KUkZ+Hfyck0UAGV
 Ep0H/34BwWenAHlpmtEFjW7vScrRMRhx0DNTI/YxAHQ7oQ8Tu2ytneIsFPSEgbW2gO
 hgVTh5e8H34vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=tmOZnyvO
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 6.10.x option
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

The 6.10.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a1518f439..4a47a2dda1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_KERNEL_HEADERS_6_10
+	bool "kernel headers version 6.10.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.10.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
 	string "IANA PEN registry moved to iana-assignment package"
 	help
diff --git a/linux/linux.hash b/linux/linux.hash
index 32e1be4091..5233de2b0b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
-sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
 sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
 sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a3610d7ecd..7c1611699c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_10
-	bool "Linux 6.10.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
-
 config BR2_KERNEL_HEADERS_6_11
 	bool "Linux 6.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
@@ -438,7 +434,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
 	default "6.11.3"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
