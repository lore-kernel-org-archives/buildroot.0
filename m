Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66283CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E819419A9;
	Mon, 15 Jun 2026 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VesulCr3KPpX; Mon, 15 Jun 2026 20:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53893419B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555212;
	bh=e9h5xl76SuZaYPIgmLrTr6Cn0JGjg6knp50I+tcax5Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4gfCZHUz3jNiw/i93bXl5GngKbfQekcqJT/MRagNkXs7sEYOpl3BVkDcRgF4mI86
	 V8GP1FjmmxckHnxGnyuGkM+MQDp7bQHtve8lWLZQ0oXyP/IXAyymV/R0iLzvYdJoPs
	 YlT9HoNoC+T1RgBorO1cvo8WvX82OYEYF9JYXDgtUMIGHqtI0hGTNV3qPWOD4YsbiM
	 WBmc/4AXByf22QWqRVoljh9UdBR+cl+RPaBx1FxR7xNDO/k8AgcnOz/XFMfduYdmg6
	 sTpcRFoneI/ykhMUenZoaxGxOYgejVgC4c+uL/P7MwBsknThqiTAYRsMTmbjzVD3yz
	 mdZB9MNYGOXeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53893419B4;
	Mon, 15 Jun 2026 20:26:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D552F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94BD8419B4
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O5RpGY-Ba0t for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 815F8419A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815F8419A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 815F8419A9
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01c8.dip0.t-ipconnect.de [91.58.1.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DEB4A4C3247;
 Mon, 15 Jun 2026 22:26:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDsd-0000000017U-3BQQ;
 Mon, 15 Jun 2026 20:25:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2026 22:25:58 +0200
Message-ID: <20260615202559.1465158-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615202559.1465158-1-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781555162;
 bh=7nX3r7sVwN31VlyLjyq7es0ecA+gXrM+BA1O2GhbsEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n9z8d7EqsS86003HAvIHkzluVsOCliETgmKGnhshjUsiaQF/5kTuagmBB69ThtlzV
 B0lYr59/mYluCmINRm9A3tjhnaSciFdLNiu6t5jgO9CqFxG+2m1v/qApptz4yKeF5m
 Q3Kk9BXzF1bgPBb0Mc+1lhfLNx91jzNf1+AYa2V7O0vUh+sEXubRiPAfHuQMIj7iPn
 6mYmAezV+8J3dyzeHapEGyelfpYeDxTIbp3jSIzpUIXunxZes6z9ql7cjxLLztMp6n
 G2r8K+Dk4LL4yARExCbvMM7G4cdLZ37eARlhs1eUgla+bH1ItE98Kl9QnRNI28NKjx
 YRdWrn11iBfbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=n9z8d7Eq
Subject: [Buildroot] [PATCH 4/5] {toolchain,
 linux-headers}: add support for 7.1 headers
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
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668

 linux/from-6.17/linux.hash                          |  1 +
 package/linux-headers/7.1                           |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 120000 package/linux-headers/7.1

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8274594ec2..9aa69b6e96 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  691f44797fbe790dc8a321604c927087526ad27b6d649925d60f8eed0a2564a0  linux-7.1.tar.xz
 sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.1 b/package/linux-headers/7.1
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.1
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3e3832b707..0b02c183c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_0
+	default BR2_KERNEL_HEADERS_7_1
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_0
 	bool "Linux 7.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
+config BR2_KERNEL_HEADERS_7_1
+	bool "Linux 7.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
+	bool "7.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
-	bool "7.0.x or later"
+	bool "7.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
@@ -475,6 +483,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5aa6cf8f6d..7762106bee 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -680,6 +680,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -693,6 +697,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index f69e09ecf0..003887f025 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
+	bool "7.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
-	bool "7.0.x or later"
+	bool "7.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
