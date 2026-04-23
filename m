Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8A1FAD41B
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 06:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE5760B8F;
	Thu, 23 Apr 2026 06:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqSa30emlYPl; Thu, 23 Apr 2026 06:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F56960B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776924850;
	bh=EnfYSwMfgdeYFk4Lx9t9A1ZjSplX1VoYU9hgmD3bf2g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CODigHh9wtG3BMjGQ5LHBpF2mNaPsXec+P0NsVDEeLXjvxhjjSHyoJHoqke6DEpqN
	 586b36GyZIbnriTj94xvfDj9lPyfEvP6X/grC9ATyppvngfgymHghfPmXPrEe5cTaV
	 bEGL5JoV50pGUcc0ICUglSSgB+OCnNGjxvYgc79EbzjtCNEM1IvUncUfxslNBSPQVN
	 3e4UYUuDq5BdwxMg4w69DRWQcJj05eQgcT2NRy5RxjvbrpbEVt9m35xvH54c1FNpqP
	 7+ff4H6V/PZaB7i+cKNfw1fGjv44cn2cqSqm1I4zXvbkwROntexLnJj8V7uxceMnDG
	 c7T6DXC3S3JfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F56960B89;
	Thu, 23 Apr 2026 06:14:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4751D24D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4523F40CDC
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfKPaGIY_ocN for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 06:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 815D840CD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815D840CD8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 815D840CD8
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40883A4C0601
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 08:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52274)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFnK6-000000004Bn-3Sbl
 for buildroot@buildroot.org; Thu, 23 Apr 2026 06:14:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 08:14:01 +0200
Message-ID: <20260423061402.39498-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776924843;
 bh=dDftExkAOEG4N0FELmKarvXhSMxRcSfD8gkLmPOAMCc=;
 h=From:To:Subject:Date:From;
 b=GRBUa/nZOqew9b2DR1vXrh5gu8R7V+ZjwQ9cA0q3Zk9saAt4zOtdBdtL+U56XxUN3
 Vfw3XDCHvSm+H7i1+ugVT6SkOCpJ2U1wMOUl8jOzVhhe6a1Tmll/DCsW8+CCyShdkB
 NvSXH6icZBokw73RU+UDvRGYswpdmvrZL9Bh5jrshP829+wukJJT0mMync0ZI/urxW
 fM7+cg2yp75Mism32pygF1/7Yst11xQPpH5+eljYB2+eDXZYonGRkdLEJtdCy22ETT
 faW2CW7dgF2HcXLORavuWFnhKhGqoJA1j3YEVOVut55SHEPUEvdz+SdbED63O5J2lw
 AB/N4A4N5OUIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GRBUa/nZ
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12, 18,
 19}.x / 7.0.x series
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
 linux/{7.0 => 7.0.1}                       | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 6 +++---
 package/linux-headers/{6.12.82 => 6.12.83} | 0
 package/linux-headers/{6.18.23 => 6.18.24} | 0
 package/linux-headers/{6.19.13 => 6.19.14} | 0
 package/linux-headers/{7.0 => 7.0.1}       | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{7.0 => 7.0.1} (100%)
 rename package/linux-headers/{6.12.82 => 6.12.83} (100%)
 rename package/linux-headers/{6.18.23 => 6.18.24} (100%)
 rename package/linux-headers/{6.19.13 => 6.19.14} (100%)
 rename package/linux-headers/{7.0 => 7.0.1} (100%)

diff --git a/linux/7.0 b/linux/7.0.1
similarity index 100%
rename from linux/7.0
rename to linux/7.0.1
diff --git a/linux/Config.in b/linux/Config.in
index 0a63ed1728..4ac04ad9a7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cd69a9dd05..7e14032158 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
+sha256  39e3172cd1dfa526d353b603e6388db2ab122bbf6a08e05930559a832adcdf31  linux-6.12.83.tar.xz
 sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 66c28f474e..928ae172cd 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
+sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
-sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
+sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
+sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.82 b/package/linux-headers/6.12.83
similarity index 100%
rename from package/linux-headers/6.12.82
rename to package/linux-headers/6.12.83
diff --git a/package/linux-headers/6.18.23 b/package/linux-headers/6.18.24
similarity index 100%
rename from package/linux-headers/6.18.23
rename to package/linux-headers/6.18.24
diff --git a/package/linux-headers/6.19.13 b/package/linux-headers/6.19.14
similarity index 100%
rename from package/linux-headers/6.19.13
rename to package/linux-headers/6.19.14
diff --git a/package/linux-headers/7.0 b/package/linux-headers/7.0.1
similarity index 100%
rename from package/linux-headers/7.0
rename to package/linux-headers/7.0.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c774796377..7e38fc161e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,10 +476,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.23"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.13"	if BR2_KERNEL_HEADERS_6_19
-	default "7.0"		if BR2_KERNEL_HEADERS_7_0
+	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
+	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
