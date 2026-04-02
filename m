Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FBFD6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 17:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BE541133;
	Thu,  2 Apr 2026 17:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4OIpaD3JD2D; Thu,  2 Apr 2026 17:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D4041139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775152755;
	bh=/BOHmMHdZlz4frvYKyIHx5J0fH35Gty9x7lR6yuksr8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Io90ra52HSwrrS4gRG8ukNBpfW4K3ad10zMIizKgbW110hR8ikBacOh8nEi+pKWUG
	 L0PxqN7C6VJ80NS9aHyb/Jamq6ekRKZlN8iuuuchAb+Ai3d7BqqkXn2g+5t2akaBxn
	 agvYY0ruzNQcMZdaSFvCk5sKP6m3PMvbhZhEqs/3/HIfu9m5Ujh/QtQuQLyXfMDKZV
	 2mgMI31n95xi0KnIGPdEtLRPeKe+bylSLtY/jpUarbz3jMt+KQINEQyjWOzEQ2ASfe
	 6gzFNcLpmVkuAsOg2NsQwB6fANNqbGoE5yv5Sl3gY1TDQOxGLYHi4xoEX/eWx3tYvP
	 1PdnIbrw2Qgdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D4041139;
	Thu,  2 Apr 2026 17:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CF022D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E71A401D4
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4L1cyEd9ti08 for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 17:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12EA8401BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EA8401BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12EA8401BE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F719A4C1889
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:59:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41712)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MJy-000000007fG-2Rn5
 for buildroot@buildroot.org; Thu, 02 Apr 2026 17:59:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 19:59:10 +0200
Message-ID: <20260402175910.2779634-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775152751;
 bh=X5ksz1F9BJc7L8l2A9nUwl3w+zImffB4qfZQz+r6nIo=;
 h=From:To:Subject:Date:From;
 b=He5bXm0hCV8L+bHJ95LYM8CVeZEtKbBbcW++QzVlA7mtjXf96YWjj9JiAkFxelVnB
 dEnNT7AG4JhrybrhcPWainlJjJckvOae9inptxyJsiT4+yGSy49ShOIkgdrLapqNLm
 RUf+4ujXXylPvAUYQ5u/rowp6pK4RcfQRfEY3wumjHdu4iQFilK1ZGeiT+22u0qk3T
 OSorfUByWKBc7umExudleA2Xihl1YnQib1FQPhi+QI9VZ3FKjIG5Q6FfsIJwE8SRGH
 aUpbfFStXvB28iVLv3w5D5p3ww3QcDUQKQ9RW+8MrOZ75hErw7aVOeTeEhV9X+tBH+
 TsfY8DQXA6Kuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=He5bXm0h
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12, 18,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.19.10 => 6.19.11}                 | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.79 => 6.12.80} | 0
 package/linux-headers/{6.18.20 => 6.18.21} | 0
 package/linux-headers/{6.19.10 => 6.19.11} | 0
 package/linux-headers/{6.6.130 => 6.6.132} | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{6.19.10 => 6.19.11} (100%)
 rename package/linux-headers/{6.12.79 => 6.12.80} (100%)
 rename package/linux-headers/{6.18.20 => 6.18.21} (100%)
 rename package/linux-headers/{6.19.10 => 6.19.11} (100%)
 rename package/linux-headers/{6.6.130 => 6.6.132} (100%)

diff --git a/linux/6.19.10 b/linux/6.19.11
similarity index 100%
rename from linux/6.19.10
rename to linux/6.19.11
diff --git a/linux/Config.in b/linux/Config.in
index f41b03c795..5a910a3bb7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index a3c6bf57a3..b01ade78d0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4bfa751f33de2a5d7ecb4ff964743a027fc726a2225a76a18f92f0582aa0790b  linux-6.12.79.tar.xz
-sha256  2460aa67b9494cff6f9fc2b235470867d2005469d40f29da452e8ee82940248d  linux-6.6.130.tar.xz
+sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
+sha256  c5b62bbb104f5fddf6be6f50ebd170146c1995d2cc84e591a914decb4b6b2eb4  linux-6.6.132.tar.xz
 sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03202b91d6..2bb1b7143f 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  466d441a0ea5e04b7023618b7b201bfd60effab225f806fd41ce663484395a1c  linux-6.19.10.tar.xz
-sha256  837a5abd98e46078a0ae1400e2daad89ece45cc3209037b09c2265dab2393553  linux-6.18.20.tar.xz
+sha256  20039d7b6b256c08be2f8fac43c3ff9a620308c703c643cf2f80c3910b9bd59b  linux-6.19.11.tar.xz
+sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.79 b/package/linux-headers/6.12.80
similarity index 100%
rename from package/linux-headers/6.12.79
rename to package/linux-headers/6.12.80
diff --git a/package/linux-headers/6.18.20 b/package/linux-headers/6.18.21
similarity index 100%
rename from package/linux-headers/6.18.20
rename to package/linux-headers/6.18.21
diff --git a/package/linux-headers/6.19.10 b/package/linux-headers/6.19.11
similarity index 100%
rename from package/linux-headers/6.19.10
rename to package/linux-headers/6.19.11
diff --git a/package/linux-headers/6.6.130 b/package/linux-headers/6.6.132
similarity index 100%
rename from package/linux-headers/6.6.130
rename to package/linux-headers/6.6.132
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bf8b6b2728..c61eef10d0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -467,10 +467,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.130"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.79"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.20"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.10"	if BR2_KERNEL_HEADERS_6_19
+	default "6.6.132"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.80"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.21"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.11"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
