Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056E1E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D1860E6B;
	Sun,  1 Feb 2026 18:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxqzg70a4_YI; Sun,  1 Feb 2026 18:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CCF660B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971176;
	bh=yFNAfxtLXCVflFYGWMPExebQoP1KPqpaiNuL6zsPPt4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f4E2TOkP/k92TORLm03RbBG0BJjVNFoGmyHp6nblDk+AwbUz/s7ZfmnJxZ3fIEcyc
	 Fiy/oKW6V2stZvCxYOi+x40Lm8LoMDqMPsHEbXhCE6G5xD6yJffXL/arUn6Vn8BcNu
	 7O3Ef+4fDjdlotEUHD2PxMw46ZnXlZSYmbCHi5bpW/Ip3DP7yjuyUeGGbJArTPF57j
	 HA3+Z1lzLEq5NSGjgJA083cK9ypMnfbUhq5TXFQo+3pUnWZ421+8eYFAMSkgvZJqQp
	 lInc5xMHmhKFX8ZiJGKRcgV1UJ4oCvF7zipeRHhMT7Q3za5FLEPZnIbqV33TWMKodz
	 ysuTCKNNCV1lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCF660B00;
	Sun,  1 Feb 2026 18:39:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC27D23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD01660B00
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyfDDDhyX8Ac for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14E8960AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14E8960AE6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14E8960AE6
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:39:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D93CA4C55A0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:39:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43446)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcLz-000000007Qn-2PiN
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:39:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:39:22 +0100
Message-ID: <20260201183923.3271804-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971164;
 bh=nEmwWHe5OrQ95dm/H11/qmi0NnKfJ77KoZQRLG7dpLY=;
 h=From:To:Subject:Date:From;
 b=luyS672CECDdzJo6rzmPSZBVkoiivYQoiI2t56IuSyFrIJ2kgozCX5DoFOQQQTfQp
 EqFMnbnkvVg/P6mvXFef2wuELLhDvORb6xLrzhxHuz29AqF829ysfWtyorhQbmUVWw
 wV6exXLi6oYPrAAckjRbv4/btDfZt5bdJeH/ef/MbqB5IC2Q+vIB7lXYj9DFSf6jx4
 aLlq1yokJYhiwpo8JWMBF/eeAdMraUynQbnTvdFClG9zcwq0pBcWcV6zEQLfyv3Lsp
 AcK8hY6ny6ElAwAnvDOiMg+Ytc+VtW/ouh2yL/7gGA+jJ9BLukllH2zeSFU7x0HZ4W
 Bh0cgTqqruanw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=luyS672C
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e9ab0d67e0..955f6877f3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 64f8411046..2ba90714d3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b726a4d15cf9ae06219b56d87820776e34d89fbc137e55fb54a9b9c3015b8f1e  linux-6.18.7.tar.xz
-sha256  16805dc62e1fa5ef8a3f466f3f44a2efb171b5206d6840ced4ba5475cf12c432  linux-6.12.67.tar.xz
-sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+sha256  d367c7504bd4da520dd01eb08125d2d0ac088bc8af4cd56d236f2074dd4225b7  linux-6.12.68.tar.xz
+sha256  d48e0d9de04bef2fb9740bdb0124548bcab8867cdca00ff9712c110282b299d6  linux-6.6.122.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4727ba2048..c80ff97208 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -459,9 +459,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.67"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.7"	if BR2_KERNEL_HEADERS_6_18
+	default "6.6.122"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.68"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.8"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
