Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1515EBFD18
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C269A60B73;
	Mon, 13 Apr 2026 08:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBd_7CdtQ8dQ; Mon, 13 Apr 2026 08:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1CB60D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068901;
	bh=VAYrxPA74KYBGs0b5REQBwccLwaTJW4sP95UJlhHDvM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WmOhlJR1ro/OMASul9wEQt1TlcBrZraC79bcCBi5m5CGfdGuef6KCCiOvbs5acQU4
	 nw1wC+WG4KpoOK6q1CbKCptazGaUCJkGhZSBjxEoJ3a+fSeSaNUolOp6HU8/uvBYkb
	 Emh1+4H3xwYwe8P6AX2JkI1EUVgxgiX4DJChnOuyLVrc9EiSO+5EGfRbYY6RsdjJx3
	 9MTXNsN12PACl1PshgghrwIPQrBxJCvQ9pwGV4ly8Hqg0/7Ya7a28bsl1smx8VT7ll
	 +0FjxZdYPtadQqkkygwqvkxq2M7Y2LOp2eXTzXyPa3A9J7SF2ndKmO4dtSaAMcbsH9
	 31F1i0Lc7JLOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1CB60D9F;
	Mon, 13 Apr 2026 08:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB108237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C036B842E3
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPwhDyjx8Tap for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DDA584120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DDA584120
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DDA584120
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A42C3A4C169E;
 Mon, 13 Apr 2026 10:28:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCeW-0000000008w-3IC8;
 Mon, 13 Apr 2026 08:28:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:28:13 +0200
Message-ID: <20260413082817.3553573-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068897;
 bh=3kBYFjk2Wwe0qzt2pX5xCkh70TcvYE9DEUuobsVwoQs=;
 h=From:To:Cc:Subject:Date:From;
 b=q4r1WqlFWnMRWRRxjQ5OLuUpIXsvv5ztZ++7JRC3iXcSsuRyzFxATZntXhLc8zMT/
 FiwVkha/59xRW40QsYOU4Dgj21xsvunBfo0DegJJlxyihGfS8bysKlZjsew3pQiZ6D
 8wRTIT/w6GOlzuaWMGAs3WUFwvrSE4+GCewj6KsjkoHTcwzJtDq4jfz0AOZxrrHOE/
 kS5ynUAtMcj5gflXwUnJrZXEUgm0XrF091j/Abg5zBoU0KANc9qGdoU3WUdvzGY+Kv
 aUB89Wk2RU182EA2nw4tptWyuP4ufxwObLbZnrPCGJFZddT6+qQghopSbcxQ3pw5rx
 fSM3C5DKFNF9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=q4r1WqlF
Subject: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{1, 6, 12, 18,
 19}.x series
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.19.11 => 6.19.12}                 |  0
 linux/Config.in                            |  2 +-
 linux/before-6.17/linux.hash               |  6 +++---
 linux/from-6.17/linux.hash                 |  4 ++--
 package/linux-headers/{6.1.167 => 6.1.168} |  0
 package/linux-headers/{6.12.80 => 6.12.81} |  0
 package/linux-headers/{6.18.21 => 6.18.22} |  0
 package/linux-headers/{6.19.11 => 6.19.12} |  0
 package/linux-headers/{6.6.132 => 6.6.134} |  0
 package/linux-headers/Config.in.host       | 10 +++++-----
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename linux/{6.19.11 => 6.19.12} (100%)
 rename package/linux-headers/{6.1.167 => 6.1.168} (100%)
 rename package/linux-headers/{6.12.80 => 6.12.81} (100%)
 rename package/linux-headers/{6.18.21 => 6.18.22} (100%)
 rename package/linux-headers/{6.19.11 => 6.19.12} (100%)
 rename package/linux-headers/{6.6.132 => 6.6.134} (100%)

diff --git a/linux/6.19.11 b/linux/6.19.12
similarity index 100%
rename from linux/6.19.11
rename to linux/6.19.12
diff --git a/linux/Config.in b/linux/Config.in
index 5a910a3bb7..e846bf6d4c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index b01ade78d0..f6a6e0dfa7 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
-sha256  c5b62bbb104f5fddf6be6f50ebd170146c1995d2cc84e591a914decb4b6b2eb4  linux-6.6.132.tar.xz
-sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
+sha256  c2b09c3643946a7097c5371e1dcb123c66505ea30fafd0b0a22dc1d5f0228847  linux-6.12.81.tar.xz
+sha256  6378697b36376bf4e727a47402fee340ca4e3b146d5b407d3753cbff300f37bf  linux-6.6.134.tar.xz
+sha256  e0856fe51e444986425886533ebb91d8540189e80c3f0365c76e4beb7439776e  linux-6.1.168.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2bb1b7143f..77c1ba866d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  20039d7b6b256c08be2f8fac43c3ff9a620308c703c643cf2f80c3910b9bd59b  linux-6.19.11.tar.xz
-sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
+sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
+sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.1.167 b/package/linux-headers/6.1.168
similarity index 100%
rename from package/linux-headers/6.1.167
rename to package/linux-headers/6.1.168
diff --git a/package/linux-headers/6.12.80 b/package/linux-headers/6.12.81
similarity index 100%
rename from package/linux-headers/6.12.80
rename to package/linux-headers/6.12.81
diff --git a/package/linux-headers/6.18.21 b/package/linux-headers/6.18.22
similarity index 100%
rename from package/linux-headers/6.18.21
rename to package/linux-headers/6.18.22
diff --git a/package/linux-headers/6.19.11 b/package/linux-headers/6.19.12
similarity index 100%
rename from package/linux-headers/6.19.11
rename to package/linux-headers/6.19.12
diff --git a/package/linux-headers/6.6.132 b/package/linux-headers/6.6.134
similarity index 100%
rename from package/linux-headers/6.6.132
rename to package/linux-headers/6.6.134
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c61eef10d0..fd68c29ec4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,11 +466,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.132"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.80"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.21"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.11"	if BR2_KERNEL_HEADERS_6_19
+	default "6.1.168"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.134"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
