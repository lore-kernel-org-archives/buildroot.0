Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACEBC282EC
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 15:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5277181B01;
	Thu,  6 Mar 2025 15:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaBHhdZeh8EI; Thu,  6 Mar 2025 15:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4972E81B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4972E81B04;
	Thu,  6 Mar 2025 15:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEE595F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 15:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 017A840E32
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 15:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPHYuCtksm6I for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 15:26:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 846B840945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846B840945
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 846B840945
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 15:26:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf01.dip0.t-ipconnect.de [79.214.207.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A590A4C0C95;
 Thu,  6 Mar 2025 16:25:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48122)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tqD6Y-000000003aw-1D9E;
 Thu, 06 Mar 2025 15:25:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  6 Mar 2025 16:25:44 +0100
Message-Id: <20250306152545.47047-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741274746;
 bh=1XEI3euze9DKZWS4l57mXJUczClzSgKc7noBbDb2mDQ=;
 h=From:To:Cc:Subject:Date:From;
 b=hNI7WB7w5rG2CWmg5n4ZPB0mCbGx0TTNjGBNJuiGJJEGRLcK4AAF3WgMFbYa3+geP
 FuMFmRnflA7oa0F1cBcseLbqmgIfXI7E5q712WlMYf1GorD1B/7Ky2Cw0sZKwCCcZk
 2xhFAZTDKJQhRbr7hjSjbP2F6xhNzfys6PsoEZ3zRkYatAI6Z0OzSUYD+UjYUSB7Tx
 7j1y01LEFqeK94ybpJopzRgAbvdDdxdnxmZe2XM/vtCy5jPMCBW9s0u9tCZTwOQAV+
 LJRMQCNVDSXkcNFl0fMhuYKxIY1Flc2dJhHEVzofwKcD7/UIkpliqnhhSvApY07KFr
 rQ/ZcCDmEP04w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=hNI7WB7w
Subject: [Buildroot] [PATCH/next 1/2] {toolchain,
 linux-headers}: add support for 6.13 headers
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

And add (and default to) 6.13 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index a229630aba..3efdb8b531 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  283ecb0784f3fbc16dd822fb1d9642e230ec7515ed33f120e551b839f355e6e2  linux-6.13.5.tar.xz
 sha256  5c205cd34f80974e4973e321cb008f5f6895a8aa8c2577f06a9448cd77de63b3  linux-6.12.17.tar.xz
 sha256  6cf911d01324f45c9dd2f44cf06f55bda0ecf383bc498f132a0c549768531327  linux-6.6.80.tar.xz
 sha256  9d63e3bfde75a44a99e18812b002e5e5c0797b4eb3db408a7a9225c2c719b52b  linux-6.1.129.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54d5720af2..ff56581b03 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_12
+	default BR2_KERNEL_HEADERS_6_13
 	help
 	  Select the kernel version to get headers from.
 
@@ -47,6 +47,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
+config BR2_KERNEL_HEADERS_6_13
+	bool "Linux 6.13.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -125,8 +129,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13
+	bool "6.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12
-	bool "6.12.x or later"
+	bool "6.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
@@ -434,6 +442,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.129"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.80"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.17"	if BR2_KERNEL_HEADERS_6_12
+	default "6.13.5"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 94723da141..2290d13ad0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -645,6 +645,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -658,6 +662,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 2dc04747b3..e1ecf06e4a 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_13
+	bool "6.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_12
-	bool "6.12.x or later"
+	bool "6.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
