Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22D1CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D94A419B6;
	Mon, 15 Jun 2026 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaZi9HSjtLeb; Mon, 15 Jun 2026 20:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92C79419A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555175;
	bh=f38Gw244Uw3md64zVn9CREN9ByOeI3VU9hPea95kozk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SQW75OvEtnjgMFZV+TfuS0vdeknRyJZD3cpOAlJFYacnHP2Ip5JzvwApLTEySsBio
	 kVdZByT6ZbjO5wL7BbKrhe0EPizrekBOMMfO71Hk7mqFrxybpWGtpgU2Ah8DWmv/h9
	 HjS2myodegPH+/R10YlweyXwBKwnLAnX0N1CfRrtgKuh5n70bgipZqR51Ff1GkPA1A
	 x0N+9+1haa2w6d5vWfaw3uPkHe2YzBP6BIM5/am/fTQp5reNWOoyzfgzWcBTZhesS6
	 PXftyqNHQbpHkjgMZYeaYoO6uheEUMTJfZKGLtrsPRVjKB50H48zRAgVqWGDueSMeK
	 +jadYWnJ61QpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C79419A6;
	Mon, 15 Jun 2026 20:26:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86BAC2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B95B41451
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e21hlgYCYZED for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B45B4012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B45B4012B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B45B4012B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01c8.dip0.t-ipconnect.de [91.58.1.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A23D7A4C2EE2;
 Mon, 15 Jun 2026 22:25:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDsd-0000000017U-20EX;
 Mon, 15 Jun 2026 20:25:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2026 22:25:55 +0200
Message-ID: <20260615202559.1465158-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781555159;
 bh=McyOCsHP2Mf9J9l0uWiBG5AKndXaKY8w/9pqSBVbD3o=;
 h=From:To:Cc:Subject:Date:From;
 b=iuoWVQHqhAgBVYK+IEwPFYj+KuuUT06ncEHfzIJI7RzCXnWYQCorLk4WN2vg9ULbY
 hbeUHp0sa0xssbbL6rlzBmt/4+eAxD/38d5CQucABBl0xHJ1+CdHLkXyZdzMdt67yL
 PBN9Wfd+/+FVgaDPfjwLiAeSJk68tflll1LJ56QB7LB4GA7sIM064tumlr9fSw2GD+
 oeylS3t04dCmlQzcrK4w5uuKtLdbI02X5aGmu7SvJx25q6DKgqDHSxlTYYJMHWd3bw
 tJKf8S3l0AZ+aoaHVXDsgSLQEi0ov+ycgnMViRmFh/lSwTv7d7zTEOfWkntb9SKycR
 gpnwlBEq5eg0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iuoWVQHq
Subject: [Buildroot] [PATCH 1/5] {linux, linux-headers}: bump 6.12.x, 7.0.x,
 6.18.x series
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
- 6.12.92 -> 6.12.93
- 6.18.34 -> 6.18.35
- 7.0.11 -> 7.0.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668

 linux/{7.0.11 => 7.0.12}                   | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.92 => 6.12.93} | 0
 package/linux-headers/{6.18.34 => 6.18.35} | 0
 package/linux-headers/{7.0.11 => 7.0.12}   | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{7.0.11 => 7.0.12} (100%)
 rename package/linux-headers/{6.12.92 => 6.12.93} (100%)
 rename package/linux-headers/{6.18.34 => 6.18.35} (100%)
 rename package/linux-headers/{7.0.11 => 7.0.12} (100%)

diff --git a/linux/7.0.11 b/linux/7.0.12
similarity index 100%
rename from linux/7.0.11
rename to linux/7.0.12
diff --git a/linux/Config.in b/linux/Config.in
index 8b17fece44..bbd0e491cd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 93c36c9156..4ebc486eac 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fe376b7db3cac4456b38291bee4faa7091cb8befaa6f9870314f5d1282f9e3e  linux-6.12.92.tar.xz
+sha256  492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3  linux-6.12.93.tar.xz
 sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
 sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03ed2d7876..8274594ec2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  e56c8356dda01136a6041c6ef832bd0ec99bd2d35dff97832aa5ec10ed014304  linux-7.0.11.tar.xz
+sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  640c4732fb42842166db97e032c1fe7e5ff72c85a8982c75b40f74be3555d760  linux-6.18.34.tar.xz
+sha256  f78602932219125e211c5f5bfd84edcfd4ec5ce88fc944f8248413f665bef236  linux-6.18.35.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.92 b/package/linux-headers/6.12.93
similarity index 100%
rename from package/linux-headers/6.12.92
rename to package/linux-headers/6.12.93
diff --git a/package/linux-headers/6.18.34 b/package/linux-headers/6.18.35
similarity index 100%
rename from package/linux-headers/6.18.34
rename to package/linux-headers/6.18.35
diff --git a/package/linux-headers/7.0.11 b/package/linux-headers/7.0.12
similarity index 100%
rename from package/linux-headers/7.0.11
rename to package/linux-headers/7.0.12
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c00e2508b..3e3832b707 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,9 +472,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.92"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.34"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.11"	if BR2_KERNEL_HEADERS_7_0
+	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
