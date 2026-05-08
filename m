Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6386BCD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3601041F7E;
	Fri,  8 May 2026 19:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7pn1_05fVmi; Fri,  8 May 2026 19:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334CD41F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778268955;
	bh=NZElnhQmUSafFEBoQQnUjcyfuo6aru5/igco7MKRgaY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=alyr+aRfAoEYoJG1ImL+xsf19hjPEMMu3DUVDTPP/A5jDL6iiD3xY+KbA439p8o4Y
	 DRpPmYrlSueFP6FVY5w1vRv6v6I/GSNtazarJQgSX6HNoHNhJNL9rVRoQ4JrhLjBS2
	 80W/npG/3mLnGcJMfcUjOruNNip06R6JNgilHptmk8BcVkNLwnBLF12y6Zi9xBQmtw
	 x7wbr+CS9hbKoHp1TrfyVUCr4QdoF0xDt2uWkupMh5hfPuNiRdZl3u05W4941hqEoT
	 cmtdTMZlRWwSFw4HeKz3beaHllICsiY+g00o5BqmeZ9Ap+l4pj9R57V4M+g2edoa6W
	 OHKOLzWVN+vMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334CD41F7F;
	Fri,  8 May 2026 19:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85821272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77C5441F7E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZkHplCgK_XD for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32DF541F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DF541F7C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32DF541F7C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BCC6A4C2CE2
 for <buildroot@buildroot.org>; Fri,  8 May 2026 21:35:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40604)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLQzG-000000002Fa-0PwP
 for buildroot@buildroot.org; Fri, 08 May 2026 19:35:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  8 May 2026 21:35:48 +0200
Message-ID: <20260508193549.4015030-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778268950;
 bh=e7QlEioQr06EwJ2F+uHLIEme3L1NjfBf6v49TuGdk3E=;
 h=From:To:Subject:Date:From;
 b=IaLAO2GrHMDJKwoO4P3zhVAZ5orSEbYZ3K0UBnAWytf38SROakOCQlis/pkOYEOzw
 IAIsZdggmm9pnCkDq0n4Ljc+sxSKQ7qqt/hqF57bPtwjaNHFK+9gntM2Ct+kAjTOq9
 2ThAbcx0oNf9TO8mOh26qBvMUuwYqAuIg8hN9c7mM004DHz3TA3PUa1XlV3V+iwDga
 7weF1ASh4iP4OihVHJK35mgSt7hF2IfnYBFA8uC+OHy1V9ll2NBnIinQYLlCP0Sn9q
 fNLpm5gvE5AGrry4WK7L2mBMGraZF20SgDwvXXrSyXqiCwA73ZtEsFCLH6dBuSMpmM
 JsqexqP0EVU+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IaLAO2Gr
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 5.{10,
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
 linux/{7.0.4 => 7.0.5}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.254 => 5.10.255} |  0
 package/linux-headers/{5.15.204 => 5.15.206} |  0
 package/linux-headers/{6.1.170 => 6.1.172}   |  0
 package/linux-headers/{6.12.86 => 6.12.87}   |  0
 package/linux-headers/{6.18.27 => 6.18.28}   |  0
 package/linux-headers/{6.6.137 => 6.6.138}   |  0
 package/linux-headers/{7.0.4 => 7.0.5}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.0.4 => 7.0.5} (100%)
 rename package/linux-headers/{5.10.254 => 5.10.255} (100%)
 rename package/linux-headers/{5.15.204 => 5.15.206} (100%)
 rename package/linux-headers/{6.1.170 => 6.1.172} (100%)
 rename package/linux-headers/{6.12.86 => 6.12.87} (100%)
 rename package/linux-headers/{6.18.27 => 6.18.28} (100%)
 rename package/linux-headers/{6.6.137 => 6.6.138} (100%)
 rename package/linux-headers/{7.0.4 => 7.0.5} (100%)

diff --git a/linux/7.0.4 b/linux/7.0.5
similarity index 100%
rename from linux/7.0.4
rename to linux/7.0.5
diff --git a/linux/Config.in b/linux/Config.in
index f742251ac7..a98b4aa186 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7bae7e23ce..f97ab45c2f 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  edef22b327c7cbf39cdbf8d717fffa344f1ca299e513990e21705b3bf26dbb5d  linux-6.12.86.tar.xz
-sha256  92f1e90d8be49f9d7f989e563c97a4f39cd7731025d7b81152814c68b5bd56c4  linux-6.6.137.tar.xz
-sha256  b578912f79a5e8ea1a94ce4364d20a3902d2005be0e16deee9fbd0ad697c4944  linux-6.1.170.tar.xz
+sha256  cc12a7644b4cef9e06627b29de8753e22b3d076703a9b52be84263e05c8b9830  linux-6.12.87.tar.xz
+sha256  add06b5fdb655c7e575fbfa29e7bab23a3c36c5388e77fa759ed4b0d1a55a80f  linux-6.6.138.tar.xz
+sha256  f1672e610dc9e05e33de1803857e26c5abe1d1ab0a2ea74b0d8269267f73b499  linux-6.1.172.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9bfd4c3303ca8e2cf9aa2bc570afa31100a8e2d0132ba16e904cbe06ff76dbcd  linux-5.15.204.tar.xz
-sha256  75473ca597a1cd83a2c29a2857f9b046463672eb225912271676180bad1a869d  linux-5.10.254.tar.xz
+sha256  5fc6ce4f4cfb17977bc6e14c52a0e10846544f1ffc133aac26d6de7e14a5e61f  linux-5.15.206.tar.xz
+sha256  3956b387bfb5133c00f3f7f76a0a436934a349e8a9319a231a1b5b829d7866a7  linux-5.10.255.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 4cbb89bc02..2c97dbab36 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  d92081d84c925adb21a6a709042499e5dcad5dd93a1d9c683f05304fda9257a7  linux-7.0.4.tar.xz
+sha256  965fb0a1c1675399fc60c6063b227c0523041b5f9a662b66462f1212c438ac3c  linux-7.0.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  25017b93946f0ba2cbf71910b59640a29d9167a5b65ccd41b12cd991875ce2ea  linux-6.18.27.tar.xz
+sha256  f360789483586cf8a20b4ab2bffe76ead6b62c0db1eeb0d917294456c4d77b74  linux-6.18.28.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.254 b/package/linux-headers/5.10.255
similarity index 100%
rename from package/linux-headers/5.10.254
rename to package/linux-headers/5.10.255
diff --git a/package/linux-headers/5.15.204 b/package/linux-headers/5.15.206
similarity index 100%
rename from package/linux-headers/5.15.204
rename to package/linux-headers/5.15.206
diff --git a/package/linux-headers/6.1.170 b/package/linux-headers/6.1.172
similarity index 100%
rename from package/linux-headers/6.1.170
rename to package/linux-headers/6.1.172
diff --git a/package/linux-headers/6.12.86 b/package/linux-headers/6.12.87
similarity index 100%
rename from package/linux-headers/6.12.86
rename to package/linux-headers/6.12.87
diff --git a/package/linux-headers/6.18.27 b/package/linux-headers/6.18.28
similarity index 100%
rename from package/linux-headers/6.18.27
rename to package/linux-headers/6.18.28
diff --git a/package/linux-headers/6.6.137 b/package/linux-headers/6.6.138
similarity index 100%
rename from package/linux-headers/6.6.137
rename to package/linux-headers/6.6.138
diff --git a/package/linux-headers/7.0.4 b/package/linux-headers/7.0.5
similarity index 100%
rename from package/linux-headers/7.0.4
rename to package/linux-headers/7.0.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0528d2e5d..a51f7171a5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.254"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.204"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.170"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.137"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.86"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.27"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.4"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.255"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.206"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.172"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.138"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.87"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.28"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.5"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
