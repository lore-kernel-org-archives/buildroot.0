Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D73AC43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 11:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D286D607CD;
	Sun, 28 Jun 2026 11:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvaLcA8lWbPa; Sun, 28 Jun 2026 11:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9429607CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782646801;
	bh=P4csNSIJ6cueYK0KOgR+W/3kK0s9gdVS2zw1usjyeIs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bI0EHtQeJCmwL0YWlX6bh1nsFF7nGhRy/1r4dD14KHhP+bLEOPyZOr8pJd4XKNsDL
	 tck09MrUjZ4u1gQweKoCmd8wOcC9qiLrRHzB3aIx7sARtIyZiyYR1Vyz/UrRg4ywsW
	 HzA5/DOCsKz9UGEau4X1g7B0FBuDPJ9v8SBvPysLTr3clpOxUqQ2ODWX8N+q/S/vsP
	 ZrSne1XdOR+8dnIqJEyPQCee9n+77cYnOhuAlLH77REW8PLyMNaLVSXrZN1A0rpGuZ
	 O10NL93KJOKSoIKTOPjvWu8F5AzEmF6WnNpscS1I7LXz7wBG+dd0DVIcDLJ/LqpnA1
	 pI7brN72osaWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9429607CE;
	Sun, 28 Jun 2026 11:40:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B772F3
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 11:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2128607CE
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 11:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-HTK-yNmSZg for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 11:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B82C607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B82C607C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B82C607C4
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 11:39:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b36f.dip0.t-ipconnect.de [84.161.179.111])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2AA62A4C3826
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:39:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56382)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wdnrR-000000007By-2dsD
 for buildroot@buildroot.org; Sun, 28 Jun 2026 11:39:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jun 2026 13:39:41 +0200
Message-ID: <20260628113941.8068-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260628113941.8068-1-bernd@kuhls.net>
References: <20260628113941.8068-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782646782;
 bh=PSN7+Wh2zTGWeYfZY10YAuncaiqkQ1/VSWNTyiaPp1Y=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MKcSzK85gjL27+v3G/vhAUoOqjap4tPMk6QHqGLlSyJFAnFDeAirZVa4a45t1Z0+U
 bozd3YBpeIk2ij0441WB15mJOqv32ThpyljiJpbIYepTLVpbXd3dXYBS0qdXZbQqiS
 4GrRS3ptGKXyCzc+s9k5YSZ+UAY1hlQs15C5NbEVBiP2N1HwMWkQ2q1UjW6FzAup8k
 d6Oujx9Ou0ntCZ6d9LYlt5dR7okHF7i5WmBTOzRNcSx3tsT2VOA0BWTr0KqjoDHpyq
 /Jlxme1gB/Wf9B+tKszCEfM0S4rOO6T142xv/jWa2HcYtiNwoM7uL56FJI/OmME3tU
 1xcJ3McVMRCsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MKcSzK85
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 7.0.x option
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

The 7.0.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b174887ea602d2920b94cc8deaf3debb87905826

 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.0.14         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 120000 package/linux-headers/7.0.14

diff --git a/Config.in.legacy b/Config.in.legacy
index b8a95fd812..4894fe7065 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_KERNEL_HEADERS_7_0
+	bool "kernel headers version 7.0.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.0.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 	bool "bluez sap plugin removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index e611478e30..2d6ab0f28a 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  37198c93727be247c9fb5309bb86cd5e496c61e5322cd8c4eca9476bb0b5883f  linux-7.1.2.tar.xz
-sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  a83cd200e6646db52866b8309e9137b9e9048b613cbda10ced2b811aae125255  linux-6.18.37.tar.xz
diff --git a/package/linux-headers/7.0.14 b/package/linux-headers/7.0.14
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.0.14
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54fa189217..d1eb93ce1c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_0
-	bool "Linux 7.0.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
-
 config BR2_KERNEL_HEADERS_7_1
 	bool "Linux 7.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
@@ -482,7 +478,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.37"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default "7.1.2"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
