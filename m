Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F44CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39F3440527;
	Sun, 13 Oct 2024 10:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAYERvUErYCA; Sun, 13 Oct 2024 10:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF12403D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF12403D6;
	Sun, 13 Oct 2024 10:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0D291BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC7B2407A0
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTZQGS3pWpEj for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68520406B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68520406B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68520406B3
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:33:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b41f.dip0.t-ipconnect.de [84.161.180.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AFCEA4C1190;
 Sun, 13 Oct 2024 12:33:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32836)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1szvuv-000000002DD-47JI;
 Sun, 13 Oct 2024 10:33:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:33:39 +0200
Message-Id: <20241013103341.78501-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241013103341.78501-1-bernd@kuhls.net>
References: <20241013103341.78501-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728815622;
 bh=DGBsHF3wO++4aQMBDFlIcHyYH8538/QZWNbFvnR/wCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UtiVWK4cZrOWBGwRJtbCceZMGtVy0l7YSVIjdYRFnFW/kND6+RW+aOwwkDRc5OUOY
 hSEu/1ZQ38yAORQsO8wOVvNnDiWrGGHEUEy1z2nwH8mVvWnb3Mjk0nI6JS8zmYjRWq
 eGSQJV2rnvxSzVnqNa42KDVTVfGCd2NfTlqjlLhCCo0GBXNXBaa3S3vkalSaI+G4OC
 /5nHX7xF9EpyxxsRSdaNNEOxJd6OT3WLAPslIQwIrdb3Luef0RqIx1zocoEuAXFf6S
 QGhGlDDNrGfDJd06LkVUn4F2fjSSXGiRzGv6QkLnDiKbJJx3qiG50i1WCrWhy/OW9S
 KHaZeNEKNJYRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=UtiVWK4c
Subject: [Buildroot] [PATCH 2/4] {toolchain,
 linux-headers}: add support for 6.11 headers
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

And add (and default to) 6.11 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ea13ab0aeb..32e1be4091 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
 sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
 sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
 sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 39dca346ea..a3610d7ecd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_10
+	default BR2_KERNEL_HEADERS_6_11
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_10
 	bool "Linux 6.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
+config BR2_KERNEL_HEADERS_6_11
+	bool "Linux 6.11.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
+	bool "6.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
-	bool "6.10.x or later"
+	bool "6.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
@@ -431,6 +439,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
+	default "6.11.3"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e91ab756c..c2522aca7f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -656,6 +656,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -669,6 +673,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0daa1e3583..fcffeb6b77 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
+	bool "6.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
-	bool "6.10.x or later"
+	bool "6.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_9
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
