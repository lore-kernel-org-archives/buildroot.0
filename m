Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5FCD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 05:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D726861760;
	Sat, 20 Jun 2026 05:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzEqb2G3RG2Q; Sat, 20 Jun 2026 05:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C006F9FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781933619;
	bh=L0i4rBnyJ38Ax7Nm1DmaBUCYKoTUdSYEzwGSS82wkNM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YxTM28so9ZpIN9McT9BBHctjUhg3hZEZ4lEHUZ4y1/JolTCsWumTnH9wl4lSE2eIU
	 QEUdM+dAKsLnh3oJW+kxLsxsCUHdH9jJeUJtegsVB+F64DAx0KAFo9H43V4Zgao62P
	 09KLLi4PQeu8Ezli+DYhomA7++n8TvmeT6fi52Jht2HN49m8ncvFaG3l46ELkeE8xf
	 BH96SRlZw9ucBnvFMD7+aEcH3S9x0WNH6kz5RZRJqsEnmNhlPZU5ls1n7E4aAqCyGu
	 PcV9b637pHBWK2ObAXGQPl9+MfeLmMzUQsIZLadtMp8m0DC58qN+2+9ZzcGGPLX+Nm
	 TlNP+JMLv4+vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C006F9FA;
	Sat, 20 Jun 2026 05:33:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEBB6367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 05:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFE24EDB0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 05:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7Hs7yfWoiRL for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 05:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 391C74EDA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391C74EDA7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 391C74EDA7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 05:33:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05B7FA4C027C
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:33:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41970)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waoKg-000000005r9-0Yd7
 for buildroot@buildroot.org; Sat, 20 Jun 2026 05:33:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 07:33:30 +0200
Message-ID: <20260620053330.7619-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781933611;
 bh=4ijlEmjHLp8vTHlj21xTN9YFtEtca+WksTu2+DzhrXw=;
 h=From:To:Subject:Date:From;
 b=UG/5xUKGsn0W5Id1E+hbGr4R4Aszgjl8KVAafNpO0tnUuaGRAh2VKzSz4xkKy/lSv
 f8/JeDefpT6bxLogyETXBPdwD/EpvVKgW8MlIyUJKBa+7nzk5hb/McK4YckFLgQOBR
 DD1QG8ItNWgYcrkQaNABfjrWtV6n6pyPKcTy+oR/a89k6mejX3s5mHM2rBmF7t6Atf
 dfBBWIVRnIkm5EFFkW3pGH+Ko3Rd9jVEJqOC2Xt/KjzcPiIx5a0byiPcn+m5YOzaGu
 ObNMvw6wxnWdVGKLbW72XJ5GW03qzPxXkSsJ1llwsKOyraXDNQORMlkPwMWtDNeAfx
 nzMq81N4y7EBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UG/5xUKG
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 7.0.x, 6.18.x series
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

Update the latest kernel releases to:
 - 7.1 -> 7.1.1
 - 7.0.12 -> 7.0.13
 - 6.18.35 -> 6.18.36
 - 6.12.93 -> 6.12.94
 - 6.6.142 -> 6.6.143
 - 6.1.175 -> 6.1.176
 - 5.15.209 -> 5.15.210
 - 5.10.258 -> 5.10.259

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1 => 7.1.1}                         |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  6 +++---
 package/linux-headers/{5.10.258 => 5.10.259} |  0
 package/linux-headers/{5.15.209 => 5.15.210} |  0
 package/linux-headers/{6.1.175 => 6.1.176}   |  0
 package/linux-headers/{6.12.93 => 6.12.94}   |  0
 package/linux-headers/{6.18.35 => 6.18.36}   |  0
 package/linux-headers/{6.6.142 => 6.6.143}   |  0
 package/linux-headers/{7.0.12 => 7.0.13}     |  0
 package/linux-headers/{7.1 => 7.1.1}         |  0
 package/linux-headers/Config.in.host         | 16 ++++++++--------
 13 files changed, 17 insertions(+), 17 deletions(-)
 rename linux/{7.1 => 7.1.1} (100%)
 rename package/linux-headers/{5.10.258 => 5.10.259} (100%)
 rename package/linux-headers/{5.15.209 => 5.15.210} (100%)
 rename package/linux-headers/{6.1.175 => 6.1.176} (100%)
 rename package/linux-headers/{6.12.93 => 6.12.94} (100%)
 rename package/linux-headers/{6.18.35 => 6.18.36} (100%)
 rename package/linux-headers/{6.6.142 => 6.6.143} (100%)
 rename package/linux-headers/{7.0.12 => 7.0.13} (100%)
 rename package/linux-headers/{7.1 => 7.1.1} (100%)

diff --git a/linux/7.1 b/linux/7.1.1
similarity index 100%
rename from linux/7.1
rename to linux/7.1.1
diff --git a/linux/Config.in b/linux/Config.in
index b328d87de1..e79708d6d0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4ebc486eac..688b99ded6 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3  linux-6.12.93.tar.xz
-sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
-sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
+sha256  e998a232b9418db3301cb58468e291a4f41d6ab8306029b30d991f56251dc8d2  linux-6.12.94.tar.xz
+sha256  dace1f8dc9c0dbf5df14f47e3229cd62c298e83049681731ef229f2ba7592932  linux-6.6.143.tar.xz
+sha256  aa19772dba40e9737356c00d0671cdedbe26cc895eff062868f0a1f688ae44f6  linux-6.1.176.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
-sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
+sha256  910ba46ae15e7495a9624f89d7f11b24ccc8bc1ee4b3abdd502e75b055290a01  linux-5.15.210.tar.xz
+sha256  aa5e8e580a555e55176658b78fb6759f9c84654462b735119d4e819b5c46b609  linux-5.10.259.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 9aa69b6e96..33ee9dc232 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  691f44797fbe790dc8a321604c927087526ad27b6d649925d60f8eed0a2564a0  linux-7.1.tar.xz
-sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
+sha256  5215fa3541dc7e7f5bcd51bf7e57f169cec6fce508ca54e3dc85fdee14371d7d  linux-7.1.1.tar.xz
+sha256  3c81edd0f716aca3dd48dff691681827580cc53d35a8eec3be47d346d1f89913  linux-7.0.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f78602932219125e211c5f5bfd84edcfd4ec5ce88fc944f8248413f665bef236  linux-6.18.35.tar.xz
+sha256  fbab86c9f471c81075b280cca30bd85d790c060063a1245859b6344b07c9c44e  linux-6.18.36.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.258 b/package/linux-headers/5.10.259
similarity index 100%
rename from package/linux-headers/5.10.258
rename to package/linux-headers/5.10.259
diff --git a/package/linux-headers/5.15.209 b/package/linux-headers/5.15.210
similarity index 100%
rename from package/linux-headers/5.15.209
rename to package/linux-headers/5.15.210
diff --git a/package/linux-headers/6.1.175 b/package/linux-headers/6.1.176
similarity index 100%
rename from package/linux-headers/6.1.175
rename to package/linux-headers/6.1.176
diff --git a/package/linux-headers/6.12.93 b/package/linux-headers/6.12.94
similarity index 100%
rename from package/linux-headers/6.12.93
rename to package/linux-headers/6.12.94
diff --git a/package/linux-headers/6.18.35 b/package/linux-headers/6.18.36
similarity index 100%
rename from package/linux-headers/6.18.35
rename to package/linux-headers/6.18.36
diff --git a/package/linux-headers/6.6.142 b/package/linux-headers/6.6.143
similarity index 100%
rename from package/linux-headers/6.6.142
rename to package/linux-headers/6.6.143
diff --git a/package/linux-headers/7.0.12 b/package/linux-headers/7.0.13
similarity index 100%
rename from package/linux-headers/7.0.12
rename to package/linux-headers/7.0.13
diff --git a/package/linux-headers/7.1 b/package/linux-headers/7.1.1
similarity index 100%
rename from package/linux-headers/7.1
rename to package/linux-headers/7.1.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0b02c183c1..a890c8f161 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,14 +476,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
-	default "7.1"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.259"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.210"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.36"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.13"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1.1"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
