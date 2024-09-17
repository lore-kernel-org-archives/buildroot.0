Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA87CAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8391F606D3;
	Tue, 17 Sep 2024 18:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lo3kCod67LcJ; Tue, 17 Sep 2024 18:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98759607A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98759607A1;
	Tue, 17 Sep 2024 18:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1CC1BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883CA811AC
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCdqixViUnT2 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D075811A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D075811A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D075811A5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:22:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1059DA4C1FCF;
 Tue, 17 Sep 2024 20:22:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54236)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcqM-000000000sz-0efm;
 Tue, 17 Sep 2024 18:22:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:22:28 +0200
Message-Id: <20240917182229.3009790-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917182229.3009790-1-bernd@kuhls.net>
References: <20240917182229.3009790-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597350;
 bh=p7YykPWkcCXn0oU6oXUgWLG7wV62OVE2LLetMY7HIQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BxKmKinkglB8BIKQiJgviTr9nUGXb6m1feH853+2zZVfXSJaTz8WGfHP3lIV1HsWV
 aenv2EDDDsVtWuTVGnf+TaPEGpid/7oC5U9exVrlY/4lNgQBWsBoBIL1FF1GSkt5ye
 1CPousSO8KK6mJK2Y8W/CHG0/XtOCvifBQqhR6goYCf/ugSP0L6FGCsbCO2DaWhPei
 mUg0oaKlfh2n5rkcDpZfagPBu9QB0j7c144KbcXPrNtxBXLid6ml2p/JN/TbDESua1
 15Bu0skv7AQDgYXjFXa1G6tmnN229REkQaIlZTmmw2eA2jTqpbbENY6Ncb1xYxkDDQ
 jVXSu4BMXtg+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=BxKmKink
Subject: [Buildroot] [PATCH 2/3] {toolchain,
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
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
index 8f369e5f36..20dbf52361 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  55d2c6c025ebc27810c748d66325dd5bc601e8d32f8581d9e77673529bdacb2e  linux-6.11.tar.xz
 sha256  e687e735b5eb9efb6d67b42433c93fc9118106a995514f062652873b5e809bcd  linux-6.10.10.tar.xz
 sha256  1c0c9a14650879c4913efdbac428ba31a540c3d987155ddf34d33e11eca008b3  linux-6.6.51.tar.xz
 sha256  9ebe34b4742f8c9104678f32a6bc20e91299ebac2ae607ff2ed137d928df8f6a  linux-6.1.110.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 067c3b96aa..34c35082eb 100644
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
@@ -128,8 +132,12 @@ choice
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
@@ -430,6 +438,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.110"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.51"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.10"	if BR2_KERNEL_HEADERS_6_10
+	default "6.11"		if BR2_KERNEL_HEADERS_6_11
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
