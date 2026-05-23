Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CECD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 16:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192E5811E5;
	Sat, 23 May 2026 16:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCg82uY1-ary; Sat, 23 May 2026 16:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D97981E20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779552071;
	bh=n3dLcSE0BjC3L3O6CDQ8JWA55aOLC9nArFEKQE79RrE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QDywZFmR+gL+xpj+twaYPEom/kyay4gyeOR7puFB7lt/MNMaJ126mLnazUXkcBPJf
	 gUZVKmmiDzP48nsOErZa+rUpN9zdzNdlLy22km1WXlR7ExbRZtBzZc6dVhoWQzWSBz
	 heDGJhgcGrmkv9gpXbggfs/bV+fytyAikN9Yr3ILYmwsBAFmMb6Q/CQR6WYIYN+/wI
	 t/XLdxHrPkPUlMAXlbsxCGnTkO1u6RLresQK3h3nq7qNsZ9ToGsbRoPMu1IazzvlJA
	 waGC9LPL5er103YU5zg2tLh5Dd8B0rzxC85/rG3Oi9ZAOFeycyFsaj2lhH7izjDqCL
	 3kCradc1jppTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D97981E20;
	Sat, 23 May 2026 16:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2EC263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E687D40F72
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vokoUw7cW0E for <buildroot@buildroot.org>;
 Sat, 23 May 2026 16:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3CDD40F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CDD40F71
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3CDD40F71
 for <buildroot@buildroot.org>; Sat, 23 May 2026 16:01:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F482A4C027E
 for <buildroot@buildroot.org>; Sat, 23 May 2026 18:01:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55566)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQomf-0000000087Q-3XkS
 for buildroot@buildroot.org; Sat, 23 May 2026 16:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 18:01:06 +0200
Message-ID: <20260523160106.1306246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779552066;
 bh=1NQIeWMJTabMgQaSlvJRT9JUPKZO8mFGm4tqNx/oQW4=;
 h=From:To:Subject:Date:From;
 b=nBmF/vnDk2cooPZUm2DQX8WboO4EhbXjQyRq5KPpTWAPsr0ExcLvTgYjX4HREHuoL
 v9GAPUQhCo2gE7O5wab9A742Xixtx3CJdqjUis4w6bkO8QrsVwl61UIhH79Jin/2/b
 TerMtSN1LjzUFIY24yxozJFmmS1AzZ0FsE5QWcU++79wyEViNbFeL6y5ZOCgQ+428H
 2+bGA9Q/zDLtjQyeDHptPvfSlX2JV8cvCDGdHHoxIzip7Z0NPrgLDJQanldEMerb/B
 05xkE7d5vXBpX/p23KZgFG44wl1TfPXLUW6BRr5qWR75rmXcssEPdyXsiQaV8DMS4P
 W/VpcyM1KZLGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nBmF/vnD
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
 linux/{7.0.9 => 7.0.10}                      |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.256 => 5.10.257} |  0
 package/linux-headers/{5.15.207 => 5.15.208} |  0
 package/linux-headers/{6.1.173 => 6.1.174}   |  0
 package/linux-headers/{6.12.90 => 6.12.91}   |  0
 package/linux-headers/{6.18.32 => 6.18.33}   |  0
 package/linux-headers/{6.6.140 => 6.6.141}   |  0
 package/linux-headers/{7.0.9 => 7.0.10}      |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.0.9 => 7.0.10} (100%)
 rename package/linux-headers/{5.10.256 => 5.10.257} (100%)
 rename package/linux-headers/{5.15.207 => 5.15.208} (100%)
 rename package/linux-headers/{6.1.173 => 6.1.174} (100%)
 rename package/linux-headers/{6.12.90 => 6.12.91} (100%)
 rename package/linux-headers/{6.18.32 => 6.18.33} (100%)
 rename package/linux-headers/{6.6.140 => 6.6.141} (100%)
 rename package/linux-headers/{7.0.9 => 7.0.10} (100%)

diff --git a/linux/7.0.9 b/linux/7.0.10
similarity index 100%
rename from linux/7.0.9
rename to linux/7.0.10
diff --git a/linux/Config.in b/linux/Config.in
index 0a0dacb527..8216be435f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 380987601b..cd460fc958 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1f1a1ff057468b8a6284d3ce1d181278259beb5670ea16724c46dbf8820fa2a8  linux-6.12.90.tar.xz
-sha256  d67c9674a2d4307f3747183935a5d434391df0fc5f5bf0e00691e059f664b7db  linux-6.6.140.tar.xz
-sha256  c4f32c6cfbe8c31478f18a4b2a50f89e73f8641ba1d683d80efc16c898876d98  linux-6.1.173.tar.xz
+sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
+sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
+sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  50eb7fa307745f30e5cae4c17e188fc42ce6a72f7d925d5ea7e3c2135de6148e  linux-5.15.207.tar.xz
-sha256  f1e9dac8ec41e5bd7b1811158c7b72269696ce1c37fbdd17a898b293b54d8e5f  linux-5.10.256.tar.xz
+sha256  b53d7036e327a627595f42349cb5c9d55b4db8262ab473e08274bd8d3028b172  linux-5.15.208.tar.xz
+sha256  08b1fde1b563d7f5b0f429b283105b8a0e255463590e50fdce0abbc07a66f0d1  linux-5.10.257.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2d9eadabdb..a5caa90370 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  ac07acdf76cf4621cc5187a2670270a1a699533c8a6b225e4878c416ad83f1c4  linux-7.0.9.tar.xz
+sha256  094977eb62c20e3d1939fe81a92958a1f987f339446e532fa86963b2804e32dc  linux-7.0.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
+sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.256 b/package/linux-headers/5.10.257
similarity index 100%
rename from package/linux-headers/5.10.256
rename to package/linux-headers/5.10.257
diff --git a/package/linux-headers/5.15.207 b/package/linux-headers/5.15.208
similarity index 100%
rename from package/linux-headers/5.15.207
rename to package/linux-headers/5.15.208
diff --git a/package/linux-headers/6.1.173 b/package/linux-headers/6.1.174
similarity index 100%
rename from package/linux-headers/6.1.173
rename to package/linux-headers/6.1.174
diff --git a/package/linux-headers/6.12.90 b/package/linux-headers/6.12.91
similarity index 100%
rename from package/linux-headers/6.12.90
rename to package/linux-headers/6.12.91
diff --git a/package/linux-headers/6.18.32 b/package/linux-headers/6.18.33
similarity index 100%
rename from package/linux-headers/6.18.32
rename to package/linux-headers/6.18.33
diff --git a/package/linux-headers/6.6.140 b/package/linux-headers/6.6.141
similarity index 100%
rename from package/linux-headers/6.6.140
rename to package/linux-headers/6.6.141
diff --git a/package/linux-headers/7.0.9 b/package/linux-headers/7.0.10
similarity index 100%
rename from package/linux-headers/7.0.9
rename to package/linux-headers/7.0.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f935c21f9e..3d9d578f8e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.32"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.9"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.33"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.10"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
