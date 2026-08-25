Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E98C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B66040629;
	Tue, 25 Aug 2026 07:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX3WM8C0MCRq; Tue, 25 Aug 2026 07:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787644277;
	bh=W+Ix+qgi5gA8FYTohEu0FXOYdUmOQm7Ad24zCjBiMeI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sSCAub7uqzI8EEmHcu+VEDQIhDyhRua1nRlOtS2PE7FjTdWRkwJn4ePTsNKXUrOLP
	 NvyYsew/wPp+LqiM2pFw020kKmGDUgSiBj2Pjc/iY5JFOXlo6C+9nEWl7+18mPjh9i
	 JqordE+er5YnqZDm2hFsMAnOYSZGEuyoXmlkdhWkY7cJ0aEgYDuLNAk00t75joQvoH
	 yRWc1BxdEHsjzoy1uFZA6zDL3nrVRTYmdSqsy2JwNOf6Zx4kXVh6938aATLZD2rSoF
	 kIangk5VVHXkmgE/4V/YP2MArY2j/JUh0Y3uJo2vX9z5WHanuEswnIlfNWNH2ijvCe
	 nmD/2Got0vChQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2EA40620;
	Tue, 25 Aug 2026 07:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90FF1118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F0D40077
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 507XEqSxuyap for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BzdA1DgL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7742F400F9
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787644270;
 bh=ajFIf+CSst0R5WvF7oFWve4RunfJIhItfMAzk17WGoM=;
 h=From:To:Subject:Date:From;
 b=BzdA1DgLV87g2qPkXSfXz1pONNvLvb+N8RG9r8QTf4BY801X/WCEEpJScFxyDPciL
 fUvSSj882Fnn40m+7Y6A0LesrD3vg+AyDGaJ4PaY+Lf8+1sp9uz9E5m3VeLUZpc6NG
 a/oLyRwJ/lX/uPXtAE8/3SnBgdlpkaEIkwqwRgwrSN5m0vimre01VTKifJOQFbVVxC
 J5IQ/f6+xz6juLuVHRAR2k2dGHOrX6lHjXjBhhS/fBm6jggeiYI5TKQ1cSiYoEruXZ
 0hLa+PQKzXUCKoAddS6GqcYbH9vLhhOb5PRURgg/1c+RPnbvsvvjyCFYcJLbLu/Uq1
 V5G8I80B0gGWg==
Received: from fli4l.lan.fli4l (p54a1b0c8.dip0.t-ipconnect.de [84.161.176.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77F50A4C20A9
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52866)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wylw6-000000007sr-0aVI
 for buildroot@buildroot.org; Tue, 25 Aug 2026 07:51:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 09:51:09 +0200
Message-ID: <20260825075109.3385-1-bernd@kuhls.net>
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
 - 7.1.9 -> 7.1.10
 - 6.18.45 -> 6.18.46
 - 6.12.104 -> 6.12.105
 - 6.6.152 -> 6.6.153
 - 6.1.183 -> 6.1.184
 - 5.15.216 -> 5.15.217
 - 5.10.265 -> 5.10.266

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.9 => 7.1.10}                      |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.265 => 5.10.266} |  0
 package/linux-headers/{5.15.216 => 5.15.217} |  0
 package/linux-headers/{6.1.183 => 6.1.184}   |  0
 package/linux-headers/{6.12.104 => 6.12.105} |  0
 package/linux-headers/{6.18.45 => 6.18.46}   |  0
 package/linux-headers/{6.6.152 => 6.6.153}   |  0
 package/linux-headers/{7.1.9 => 7.1.10}      |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.1.9 => 7.1.10} (100%)
 rename package/linux-headers/{5.10.265 => 5.10.266} (100%)
 rename package/linux-headers/{5.15.216 => 5.15.217} (100%)
 rename package/linux-headers/{6.1.183 => 6.1.184} (100%)
 rename package/linux-headers/{6.12.104 => 6.12.105} (100%)
 rename package/linux-headers/{6.18.45 => 6.18.46} (100%)
 rename package/linux-headers/{6.6.152 => 6.6.153} (100%)
 rename package/linux-headers/{7.1.9 => 7.1.10} (100%)

diff --git a/linux/7.1.9 b/linux/7.1.10
similarity index 100%
rename from linux/7.1.9
rename to linux/7.1.10
diff --git a/linux/Config.in b/linux/Config.in
index 7d36397c41..ab1837e3e8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 054188c45a..06ba1b17ed 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  949d166a1263bd0cf0c5aab44eeb57869615099e7c48bf88d0e4adb77379b999  linux-6.12.104.tar.xz
-sha256  778b058c63da849d0b74006b23509255b2bed57c62a5151e9dd7a62e2cdd70d6  linux-6.6.152.tar.xz
-sha256  362d07fe4938c415ce651aefee063a5c4151109b39c97be039bbaa8312ffc0e2  linux-6.1.183.tar.xz
+sha256  eb36801e119529b13513c3459dc20e2a32f7053629f3aabb63ea501a4d88f63d  linux-6.12.105.tar.xz
+sha256  39bc77068923520dee396766361e3728a22cf3e69eff389f494285bf91c99557  linux-6.6.153.tar.xz
+sha256  960976085b6054856fa0befeac42810169b9adc15f02ab6a9caeb24dbb6f4cb9  linux-6.1.184.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  09affb2005aea3f44eec3f3eab4c1944e00707355ea7ca7fa2ba6b34a82605ed  linux-5.15.216.tar.xz
-sha256  d10cb9169e49da3d5f7154a01e450012486565fa9442e23d660b0581a3f92645  linux-5.10.265.tar.xz
+sha256  e320fd344fbde45a5d94e345df93c10eeb8beb7cf2aae7a378a50d99b673a5e5  linux-5.15.217.tar.xz
+sha256  940ea3be9390a46f7070798acbe613e0f047307a0f25d8fd227af8599df23afe  linux-5.10.266.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 1bb104612d..612570d040 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  3271a4ae3897b38352980f2b0975bae61bca81c644d186221c5ae928bcc072b0  linux-7.1.9.tar.xz
+sha256  67d2f4697a02f3bec98e744b1bdc307e920c24bb4e88b5ee97dc9a34e9aa9999  linux-7.1.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  30fa4a56579ca614ac125a12614f7f6466f87ab1278aef7b951dd74156deab33  linux-6.18.45.tar.xz
+sha256  f5d44b93808b02cc2969c5404ba081d97523719c9fd2ba2de6db318b4141cca0  linux-6.18.46.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.265 b/package/linux-headers/5.10.266
similarity index 100%
rename from package/linux-headers/5.10.265
rename to package/linux-headers/5.10.266
diff --git a/package/linux-headers/5.15.216 b/package/linux-headers/5.15.217
similarity index 100%
rename from package/linux-headers/5.15.216
rename to package/linux-headers/5.15.217
diff --git a/package/linux-headers/6.1.183 b/package/linux-headers/6.1.184
similarity index 100%
rename from package/linux-headers/6.1.183
rename to package/linux-headers/6.1.184
diff --git a/package/linux-headers/6.12.104 b/package/linux-headers/6.12.105
similarity index 100%
rename from package/linux-headers/6.12.104
rename to package/linux-headers/6.12.105
diff --git a/package/linux-headers/6.18.45 b/package/linux-headers/6.18.46
similarity index 100%
rename from package/linux-headers/6.18.45
rename to package/linux-headers/6.18.46
diff --git a/package/linux-headers/6.6.152 b/package/linux-headers/6.6.153
similarity index 100%
rename from package/linux-headers/6.6.152
rename to package/linux-headers/6.6.153
diff --git a/package/linux-headers/7.1.9 b/package/linux-headers/7.1.10
similarity index 100%
rename from package/linux-headers/7.1.9
rename to package/linux-headers/7.1.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a16ffdedef..c7501decb7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.265"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.216"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.183"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.152"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.104"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.45"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.9"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.266"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.217"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.184"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.153"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.105"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.46"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.10"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
