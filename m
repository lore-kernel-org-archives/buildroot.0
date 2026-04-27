Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE5FF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614C081336;
	Mon, 27 Apr 2026 20:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8x2iJNqP194B; Mon, 27 Apr 2026 20:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACE581339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321766;
	bh=wub3zJabSgeawIXNExEWTbEhhDK5qTpnnwlKxUlq3t0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RSCqTIhoHCQ81O3y43ozQKKfHMwdWaU+YQ827CG2J81JyHwuuubIdPU97tpFCPDG+
	 PByZsxtpVyBoGw/OmDFGUy38D2imW3Uf1wBImz/8/Wd/ASc/95GyFVfBsAsa1yqD6O
	 tOROcaLZ800g1TOTS0Rwie7Wo3cvXtrC9SsRXnwEAViCJwCVHaqr89ZAGvkxj1KNlH
	 eMz3kTXYmyO5mjZ3qWaPlPSWTbVD18bq/2rSamtPLFx6UJurCbjs+8hg0pBZ/TDo6F
	 6rybyhUv3UtXzkeUk4svAVrfk4AHPigp3Zj8oySk2c7XhYUGSte5NsOpPWL/yznAoG
	 sEytFdSfO15HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACE581339;
	Mon, 27 Apr 2026 20:29:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DA91B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7B540085
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR0UQAnEAbdK for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E36FA40074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36FA40074
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E36FA40074
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:29:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13165A4C0DC5
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 22:29:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40462)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHSa1-000000000Hi-1EMx
 for buildroot@buildroot.org; Mon, 27 Apr 2026 20:29:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 22:29:21 +0200
Message-ID: <20260427202921.197348-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777321762;
 bh=kHIwn+R/BzyrI89gsVc3sVgHEJCcIKFCz3eI42Cg1e8=;
 h=From:To:Subject:Date:From;
 b=jmtAlCrwwb81BzRxv5i6vwurlEBKzbivBfxq/NhGPwp8insth4TzO4FkInD48X2Oz
 0AiAxXj1OPA/RwgV9ONj41MSrhuujMO38uTGjBz4XlbciD0QOItZDJTYmINmEqrnW+
 D+Te7FXAi/NJpSlBp/MDWc/RUGAU5ZnLNIyTnK6PDF+qmr+a2q7k8M741Ty2zblnko
 r/O6XjYrGDnAHm4OBSoSIGlemcuO9zNT3nbPA4AnoHDmoq3I2a7f/v2wEvGjekZulm
 3Vtd9zRaCvrrGjURDvANA7nG/MDvFDuqjCCqFNfdB+R/GBbKZ7pbl3j2QsDXVDmkGW
 hXJ5xRp1RmgKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jmtAlCrw
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18}.x / 7.0.x series
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
 linux/{7.0.1 => 7.0.2}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.83 => 6.12.84} | 0
 package/linux-headers/{6.18.24 => 6.18.25} | 0
 package/linux-headers/{6.6.135 => 6.6.136} | 0
 package/linux-headers/{7.0.1 => 7.0.2}     | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{7.0.1 => 7.0.2} (100%)
 rename package/linux-headers/{6.12.83 => 6.12.84} (100%)
 rename package/linux-headers/{6.18.24 => 6.18.25} (100%)
 rename package/linux-headers/{6.6.135 => 6.6.136} (100%)
 rename package/linux-headers/{7.0.1 => 7.0.2} (100%)

diff --git a/linux/7.0.1 b/linux/7.0.2
similarity index 100%
rename from linux/7.0.1
rename to linux/7.0.2
diff --git a/linux/Config.in b/linux/Config.in
index 4ac04ad9a7..381c045d2b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7e14032158..d9f1290f9c 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  39e3172cd1dfa526d353b603e6388db2ab122bbf6a08e05930559a832adcdf31  linux-6.12.83.tar.xz
-sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
+sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a2e1be9d31..c7f378d06c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
+sha256  53591a03294527a48ccb0b9e559e922df8a38554745a1206827ca751d2ca7662  linux-7.0.2.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
+sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.83 b/package/linux-headers/6.12.84
similarity index 100%
rename from package/linux-headers/6.12.83
rename to package/linux-headers/6.12.84
diff --git a/package/linux-headers/6.18.24 b/package/linux-headers/6.18.25
similarity index 100%
rename from package/linux-headers/6.18.24
rename to package/linux-headers/6.18.25
diff --git a/package/linux-headers/6.6.135 b/package/linux-headers/6.6.136
similarity index 100%
rename from package/linux-headers/6.6.135
rename to package/linux-headers/6.6.136
diff --git a/package/linux-headers/7.0.1 b/package/linux-headers/7.0.2
similarity index 100%
rename from package/linux-headers/7.0.1
rename to package/linux-headers/7.0.2
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0c1a90f920..c34dd4a7df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -471,10 +471,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
+	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.2"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
