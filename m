Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E15C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 06:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888EC80CB0;
	Sun, 19 Jul 2026 06:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT3-ZSGfT2MO; Sun, 19 Jul 2026 06:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B2880C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784443678;
	bh=ECMaAGmlVL9giEEJQXIsuHSzGL4AskRlnjQ2IuFFCko=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jg7WzGWOcNO5n7KbRNjScvpQ0b0ODydETbK6MuRVNlrZpzFTKJ4qUpdo6B+Djp3iA
	 7WDKJv0YFHma10LXu5dM5MgwBOhTxBX+2juBQFQNI2O8hAE1ATu7r47x10D7S7QoAR
	 Jn73XORKqqisBVp6inDfrfTdUf9gEEVPJRcKMOlMhF1i1WQz7SKOywG9pAhtlAOXh7
	 atfF3G2WMji0bzk5IP56glZH+10foIjdbai8WokCRpuz8jfzVZcq3YovumNsTBXAZb
	 NygrOFbekrG848SItpJWj83+iAm4s4Y1sQTt26MT0s+88lI+jyTcSzKx7KaFJ13ss7
	 /WUPoNxJioYVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B2880C31;
	Sun, 19 Jul 2026 06:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C94A01F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2BAE400A0
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wgm7Gzi2SbD0 for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 06:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB5714005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB5714005D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB5714005D
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:47:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02DE9A4C341C
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 08:47:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49048)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wlLJW-000000000Ln-1czc
 for buildroot@buildroot.org; Sun, 19 Jul 2026 06:47:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 08:47:49 +0200
Message-ID: <20260719064750.3859427-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784443671;
 bh=10b4vDiv5lJJcv66oPq6L9u5Ipi9HdBbI2A2W8IB3sE=;
 h=From:To:Subject:Date:From;
 b=LqaliYHL9AvLqZDkKGhXMOh8GFKlc/ON9wBl8J/r7zh97CdxOJcpISWP1B6oBhyKc
 ZpiVxY44WLPiXFCk6ZQOUxPgFYw1fwJA/cm5omRlGFeZFLVVEeBfyJvOhWenG1wwng
 ZbePOzXghXlLC9bOHkM9yCPXV+fD71+M8QHQWITvCOngtJnM3uNuNW3Oj+MbcTOUYX
 wGRw2PgGAOrDxPbppPH/nakBPFu06IaWVdqal280TKCeDv10We+cG1ChpFut4B9Twp
 p0/VH13wQuqNtrbUXe8l3mHzNp+8HyIzUFjqERbBHcheeXhnI3KY+hwZMJ3od54UEs
 uGegsCth1twgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LqaliYHL
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 7.1.x,
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
 - 6.12.95 -> 6.12.96
 - 6.18.38 -> 6.18.39
 - 7.1.3 -> 7.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.3 => 7.1.4}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.95 => 6.12.96} | 0
 package/linux-headers/{6.18.38 => 6.18.39} | 0
 package/linux-headers/{7.1.3 => 7.1.4}     | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{7.1.3 => 7.1.4} (100%)
 rename package/linux-headers/{6.12.95 => 6.12.96} (100%)
 rename package/linux-headers/{6.18.38 => 6.18.39} (100%)
 rename package/linux-headers/{7.1.3 => 7.1.4} (100%)

diff --git a/linux/7.1.3 b/linux/7.1.4
similarity index 100%
rename from linux/7.1.3
rename to linux/7.1.4
diff --git a/linux/Config.in b/linux/Config.in
index 7fd802f9bd..bc18e9d4e7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7490651b94..4212f73df0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
 sha256  ec19b8307b495078cdc03749e63cb3802ac23cf6122c82eb9719feeb4557ecc3  linux-6.6.144.tar.xz
 sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 809574b9b1..75556f7ac3 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
+sha256  1c63922a119675d38e3ae0f8f6ee07f15c41a786ab9ed66563749bb8c9a08e2e  linux-7.1.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
+sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.95 b/package/linux-headers/6.12.96
similarity index 100%
rename from package/linux-headers/6.12.95
rename to package/linux-headers/6.12.96
diff --git a/package/linux-headers/6.18.38 b/package/linux-headers/6.18.39
similarity index 100%
rename from package/linux-headers/6.18.38
rename to package/linux-headers/6.18.39
diff --git a/package/linux-headers/7.1.3 b/package/linux-headers/7.1.4
similarity index 100%
rename from package/linux-headers/7.1.3
rename to package/linux-headers/7.1.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a8171aabef..b1c0da9647 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,9 +476,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.211"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.177"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.144"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.95"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.38"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.3"		if BR2_KERNEL_HEADERS_7_1
+	default "6.12.96"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.39"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.4"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
