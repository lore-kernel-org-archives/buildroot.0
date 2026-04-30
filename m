Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B69CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 17:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F9E412B8;
	Thu, 30 Apr 2026 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsW0sNVMuw68; Thu, 30 Apr 2026 17:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B22E412B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777569737;
	bh=IJwYecHdcj0KNRfs5o8BW4Yhe7b4vFIaELKAJx6gy00=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j/Ep6cecVpHzIB2ZMSk6x4y7OJ21Jutyr2/Us5YbXUhmXHzRVGA/u+1IZXMjJcgwx
	 ByRhaNQQJqWINxuZyLNgIYxskyLmloYg+EH3ai+nXWj4N/Ds3bdvuFP7FjI7haeY7l
	 JhinVKdGSAtQ11VxuOoGzFySrRKCUZ1nLQRcZ4P/eD42PRUlu5FnECR/LVYpYP70Xc
	 N/eo3yYkZPuzQH8+ef31ywmEhfshfTAm+P0hqlXv5JwfN/WvRCVbiOv045+jzmBLtA
	 Xk61MxyrBwyJJs7xytwj/KSH/89Ev4ta+bLmBF6RWeuRHN25a9PKJzSahrJN0sLdxQ
	 U6Br/+UHeZ6Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B22E412B6;
	Thu, 30 Apr 2026 17:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FAF918F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F2C484ECB
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9l83ONH2d3Z for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 17:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3903384EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3903384EBE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3903384EBE
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:22:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 801F9A4C0672
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:22:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39694)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIV5Y-0000000073R-2I8X
 for buildroot@buildroot.org; Thu, 30 Apr 2026 17:22:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 19:22:12 +0200
Message-ID: <20260430172212.581885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777569732;
 bh=LWDpGjtaSbfueBsraQAucQGkTc5BjXyhbLMidGtwqLA=;
 h=From:To:Subject:Date:From;
 b=NiuDCu+cKEuTxX6SmNG4JEBc/LUldz0BnHxCh2v29KfWeLN0W/CU9ANLmNEcJkNW5
 3NJH1hmVnWvssn6m3ONx+0XBLO3U5LMqmhBGhpCpo6pmlx0BRq02NYEjA0T2wdo8wN
 bxLKe2C39i2pnkiAXb7/k61Br87IB91sCCqVz3u4yKyU7m6bgiJDgp+QkVDJyiSuNS
 7F1EecrKkX/Q8HoUrz7MvNIvkpC2EwYqTOxrgPQvF+A+K5+Q9FFnh9E7XPiTLhlR/J
 dhd4/cC7wideOjLp74slDQ8M3Blws34ZW05fgx445VyZ3MfhFr+rwLTuAvHebSdiad
 p417xp9ACwQ0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NiuDCu+c
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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
 linux/{7.0.2 => 7.0.3}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.253 => 5.10.254} |  0
 package/linux-headers/{5.15.203 => 5.15.204} |  0
 package/linux-headers/{6.1.169 => 6.1.170}   |  0
 package/linux-headers/{6.12.84 => 6.12.85}   |  0
 package/linux-headers/{6.18.25 => 6.18.26}   |  0
 package/linux-headers/{6.6.136 => 6.6.137}   |  0
 package/linux-headers/{7.0.2 => 7.0.3}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.0.2 => 7.0.3} (100%)
 rename package/linux-headers/{5.10.253 => 5.10.254} (100%)
 rename package/linux-headers/{5.15.203 => 5.15.204} (100%)
 rename package/linux-headers/{6.1.169 => 6.1.170} (100%)
 rename package/linux-headers/{6.12.84 => 6.12.85} (100%)
 rename package/linux-headers/{6.18.25 => 6.18.26} (100%)
 rename package/linux-headers/{6.6.136 => 6.6.137} (100%)
 rename package/linux-headers/{7.0.2 => 7.0.3} (100%)

diff --git a/linux/7.0.2 b/linux/7.0.3
similarity index 100%
rename from linux/7.0.2
rename to linux/7.0.3
diff --git a/linux/Config.in b/linux/Config.in
index 381c045d2b..f11b955653 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index d9f1290f9c..ffdbcd8c27 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
-sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
-sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
+sha256  e35ac999f40a6874493d8d60f33f1150d7a89ae5841c428da82257fbcd070aed  linux-6.12.85.tar.xz
+sha256  92f1e90d8be49f9d7f989e563c97a4f39cd7731025d7b81152814c68b5bd56c4  linux-6.6.137.tar.xz
+sha256  b578912f79a5e8ea1a94ce4364d20a3902d2005be0e16deee9fbd0ad697c4944  linux-6.1.170.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
-sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
+sha256  9bfd4c3303ca8e2cf9aa2bc570afa31100a8e2d0132ba16e904cbe06ff76dbcd  linux-5.15.204.tar.xz
+sha256  75473ca597a1cd83a2c29a2857f9b046463672eb225912271676180bad1a869d  linux-5.10.254.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index c7f378d06c..cd0214519d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  53591a03294527a48ccb0b9e559e922df8a38554745a1206827ca751d2ca7662  linux-7.0.2.tar.xz
+sha256  0bedadbf5788693ddebbcc913c893f1a97349af79ddde7144c2a80b401959f1c  linux-7.0.3.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
+sha256  53772f5d3776e043767c8d81a32240d1f3eb64e822a5d7a510b55ca40707b0ec  linux-6.18.26.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.253 b/package/linux-headers/5.10.254
similarity index 100%
rename from package/linux-headers/5.10.253
rename to package/linux-headers/5.10.254
diff --git a/package/linux-headers/5.15.203 b/package/linux-headers/5.15.204
similarity index 100%
rename from package/linux-headers/5.15.203
rename to package/linux-headers/5.15.204
diff --git a/package/linux-headers/6.1.169 b/package/linux-headers/6.1.170
similarity index 100%
rename from package/linux-headers/6.1.169
rename to package/linux-headers/6.1.170
diff --git a/package/linux-headers/6.12.84 b/package/linux-headers/6.12.85
similarity index 100%
rename from package/linux-headers/6.12.84
rename to package/linux-headers/6.12.85
diff --git a/package/linux-headers/6.18.25 b/package/linux-headers/6.18.26
similarity index 100%
rename from package/linux-headers/6.18.25
rename to package/linux-headers/6.18.26
diff --git a/package/linux-headers/6.6.136 b/package/linux-headers/6.6.137
similarity index 100%
rename from package/linux-headers/6.6.136
rename to package/linux-headers/6.6.137
diff --git a/package/linux-headers/7.0.2 b/package/linux-headers/7.0.3
similarity index 100%
rename from package/linux-headers/7.0.2
rename to package/linux-headers/7.0.3
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c34dd4a7df..709028ca8e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.2"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.254"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.204"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.170"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.137"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.85"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.26"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.3"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
