Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33233C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 11:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF466812C6;
	Sat, 15 Jun 2024 11:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdPV8NJqOI_u; Sat, 15 Jun 2024 11:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0923E83ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0923E83ADF;
	Sat, 15 Jun 2024 11:31:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2A9C1BF31F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F49F406CC
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SfFlF_Xqjjy for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 11:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 306ED406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306ED406C8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 306ED406C8
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:31:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beb3.dip0.t-ipconnect.de [84.161.190.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A7F4A4C2E06;
 Sat, 15 Jun 2024 13:30:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46656)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sIRcP-000000003xY-3lzO;
 Sat, 15 Jun 2024 11:30:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 13:30:49 +0200
Message-Id: <20240615113049.456274-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240615113049.456274-1-bernd@kuhls.net>
References: <20240615113049.456274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718451050;
 bh=4fZjSSvsXzE9ozd2tzG34LBAal3yqDBv7ebOGeAfZ2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=km5lkXMzRyRVdBJoiB3bxiNtm8bKdtDzO+R+Aod16VAPlJ/tEYYa3mho2CbVfvyCK
 nBmEUqnpAnoejrgzABnrgOrxLu/vXDD6DywX/tyydmOepJO9ANmpidvk8DWkGveC3g
 4hMauV+CVeN94sQKOXF7+tQBdcexvxKSgWLrXvK0q9pIPcvC5CjJJuyTgzSm/5opsm
 Mf429VSQgiq8iiniq5inodwELyzRvGIRuRrB6D8TlF/hq6A1ycP0CjMMxHV0wRFT6G
 lGKltqgzLs284YjQMtNND01CaLSDKv4gMdANDCC1gMGj7mkWJKAWD2RIdZnlIcbdAm
 V5vHhqzIHB4Sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=km5lkXMz
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 6.8.x option
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

The 6.8.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 9 ++++++++-
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f0bff5191f..c1d6fd646e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,14 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2024.05"
+comment "Legacy options removed in 2024.08"
+
+config BR2_KERNEL_HEADERS_6_8
+	bool "kernel headers version 6.8.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.8.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
 
 config BR2_TARGET_AT91BOOTSTRAP
 	bool "at91bootstrap removed"
diff --git a/linux/linux.hash b/linux/linux.hash
index ac7028c535..6ebd708bcb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
-sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
 sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
 sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2664a523e..7b7928549c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_8
-	bool "Linux 6.8.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
-
 config BR2_KERNEL_HEADERS_6_9
 	bool "Linux 6.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
@@ -429,7 +425,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
-	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default "6.9.4"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
