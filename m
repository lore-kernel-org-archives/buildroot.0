Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32DFC61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 06:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E17B4080C;
	Sat, 29 Aug 2026 06:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMYO8JKIKbxW; Sat, 29 Aug 2026 06:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787983387;
	bh=UFRAMRh3FuSuZ1AdIdpVKCjfEH+dcoJqe2YS/oPturs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LqkxNAWCVWEuRK0bmyYSiQjIwHcw6KOyhUo7O78FDfQYD1+6PcPY+9XV7czYysxf8
	 l+6KnbL6JejjKzj3GGY0GMicKF+W4bm1jPMjuizye9lfT2Maq1btHcGiwGEa4vic85
	 UBFnC12KgSnDe3i4UJHu/Ph4Ntf4zGvtnHcKQ2Y2JHuJgRUBPxUv3eDihFhjpq1u3J
	 PyRscX1/o8E06P00TE8eufsG0g5k5+xyktGRTkhdTdEU8UVosv5iefiGmECmn36fip
	 jzIzJBukFKOwwd1ZmrYP90bZBLXZzevBsFLq1kGC9IaYUri5MuLliNwSUatbvYYB8s
	 6YZg///Ivl0uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C4B4077E;
	Sat, 29 Aug 2026 06:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E30C355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 06:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FC040176
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 06:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCK-UI2HI3Vw for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 06:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bRgUImQf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C66D400D3
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 06:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787983379;
 bh=GMNIHgN2/plTHU8DbsKt+eniu+NjlmolxUYiSWZiRYg=;
 h=From:To:Subject:Date:From;
 b=bRgUImQfMGMgaL6pq7Cdupfk9w1YYeMPRW05p7xhe7cz9071f4sbESMXwiW5I81uF
 bF3iBqM3hZIQjopbrXoHlECIkP0113dkzvaRelhSr6sbMDm9x4F8FAdfekXFC3KJmU
 n8dMxPBo9Y5DBcef/LAdMvzEdCWQe8dB8GCAvKiDn1h8TvwKxYLn+NfF7lSHhHDOX1
 jSnApCqzr5zZxc3i3s5U3HDR4+5LwrfmmVgKSOAC2PoskA9OBgyzrp9NGMpZ1TMN0L
 t9Y0D+rcZCu83W5T5oUGxG83Iz0stnL8vihCHKBjFRqWW+hzw29T+bEIlXohiiWcLM
 pjz69+U5WuyOA==
Received: from fli4l.lan.fli4l (p54a1b659.dip0.t-ipconnect.de [84.161.182.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A5F9AA4C00F1
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 08:02:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59990)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1x0C9b-000000001WJ-0WuG
 for buildroot@buildroot.org; Sat, 29 Aug 2026 06:02:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 08:02:59 +0200
Message-ID: <20260829060259.4186-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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
 - 6.12.106 -> 6.12.107
 - 6.6.154 -> 6.6.155
 - 6.1.185 -> 6.1.186
 - 5.15.218 -> 5.15.219
 - 5.10.267 -> 5.10.268
 - 7.1.11 -> 7.1.12
 - 6.18.47 -> 6.18.48

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.11 => 7.1.12}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.267 => 5.10.268} |  0
 package/linux-headers/{5.15.218 => 5.15.219} |  0
 package/linux-headers/{6.1.185 => 6.1.186}   |  0
 package/linux-headers/{6.12.106 => 6.12.107} |  0
 package/linux-headers/{6.18.47 => 6.18.48}   |  0
 package/linux-headers/{6.6.154 => 6.6.155}   |  0
 package/linux-headers/{7.1.11 => 7.1.12}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.1.11 => 7.1.12} (100%)
 rename package/linux-headers/{5.10.267 => 5.10.268} (100%)
 rename package/linux-headers/{5.15.218 => 5.15.219} (100%)
 rename package/linux-headers/{6.1.185 => 6.1.186} (100%)
 rename package/linux-headers/{6.12.106 => 6.12.107} (100%)
 rename package/linux-headers/{6.18.47 => 6.18.48} (100%)
 rename package/linux-headers/{6.6.154 => 6.6.155} (100%)
 rename package/linux-headers/{7.1.11 => 7.1.12} (100%)

diff --git a/linux/7.1.11 b/linux/7.1.12
similarity index 100%
rename from linux/7.1.11
rename to linux/7.1.12
diff --git a/linux/Config.in b/linux/Config.in
index 3597548800..12b04de477 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 73dac876e8..cba5ae653d 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0392555761d99c7604503f6178951e2df77e978b92cc96d11e248423e48ed785  linux-6.12.106.tar.xz
-sha256  edee00f83db050239fc1186535e1037782a5025001381f1353d0d3d741ed0234  linux-6.6.154.tar.xz
-sha256  3864d9a1137dc626497757c7406a6d865456fd8956c80795ff3aa46c7f1a2674  linux-6.1.185.tar.xz
+sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
+sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
+sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3801bd134f3e9eeb77e370983d42126ac1a1d75039e985f928818dd6b8df236  linux-5.15.218.tar.xz
-sha256  5b440750ac42c88abc06c26f5d47d2c839164ead382387df07654517c67cb106  linux-5.10.267.tar.xz
+sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
+sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 421cd7831b..0d4b7ba9bb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  3029540d8f2ec75bee5cbdb7c2a0daa60bffa1d105c82ecb99b53432f6351afc  linux-7.1.11.tar.xz
+sha256  389716b3ed27e4cd520b903eea04acc33b9804c4282cb7a918f05ff14e9b5ae1  linux-7.1.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1b3fbafd43601a5473107cf8172a2b66f42994119089d7aee078e4bca3dee818  linux-6.18.47.tar.xz
+sha256  5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c  linux-6.18.48.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.267 b/package/linux-headers/5.10.268
similarity index 100%
rename from package/linux-headers/5.10.267
rename to package/linux-headers/5.10.268
diff --git a/package/linux-headers/5.15.218 b/package/linux-headers/5.15.219
similarity index 100%
rename from package/linux-headers/5.15.218
rename to package/linux-headers/5.15.219
diff --git a/package/linux-headers/6.1.185 b/package/linux-headers/6.1.186
similarity index 100%
rename from package/linux-headers/6.1.185
rename to package/linux-headers/6.1.186
diff --git a/package/linux-headers/6.12.106 b/package/linux-headers/6.12.107
similarity index 100%
rename from package/linux-headers/6.12.106
rename to package/linux-headers/6.12.107
diff --git a/package/linux-headers/6.18.47 b/package/linux-headers/6.18.48
similarity index 100%
rename from package/linux-headers/6.18.47
rename to package/linux-headers/6.18.48
diff --git a/package/linux-headers/6.6.154 b/package/linux-headers/6.6.155
similarity index 100%
rename from package/linux-headers/6.6.154
rename to package/linux-headers/6.6.155
diff --git a/package/linux-headers/7.1.11 b/package/linux-headers/7.1.12
similarity index 100%
rename from package/linux-headers/7.1.11
rename to package/linux-headers/7.1.12
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 25d61f6a9d..14c62a698d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.267"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.218"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.185"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.154"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.106"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.47"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.11"	if BR2_KERNEL_HEADERS_7_1
+	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.48"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.12"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
