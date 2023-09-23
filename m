Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27BDCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 17:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3B840578;
	Sat, 23 Sep 2023 17:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3B840578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csxA47F7cwhz; Sat, 23 Sep 2023 17:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3D74049C;
	Sat, 23 Sep 2023 17:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3D74049C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 637BB1BF299
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49B6560B23
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B6560B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhPB8a8mXcDx for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 17:33:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31C9960A8D
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 17:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C9960A8D
Received: from fli4l.lan.fli4l (p54a1bfc3.dip0.t-ipconnect.de [84.161.191.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA999A4C0E2E;
 Sat, 23 Sep 2023 19:32:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk6Uu-0002RQ-1V;
 Sat, 23 Sep 2023 19:32:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 19:32:50 +0200
Message-Id: <20230923173252.3079114-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923173252.3079114-1-bernd@kuhls.net>
References: <20230923173252.3079114-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695490372;
 bh=XE5DWeC1DNMQDxlk5FiTm6kSRQU60cU10RYmVK/XF9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IQVejyo78Rz7GRf8Z/i2DKGKnYh0wtw561cNfC6VE23b45We5zF8Hm3IN5cl1T6/4
 18B3C9uPodTsT4Vl9HHt1Tzps6UGxcJqfcFbULNJVckTJ42WS10fg2I9jczsnm9On9
 IpXuuGrpHx5EunhL8JTseFHYZwAEEYsY54ErxWxsxkV9aVHL6NbuYMFJNrdlol5h6A
 T2SqswObK8cnJEIuBnn2+aRvd3APJM1I773EbL8/4VI3/vM4pXQ6k20p6/09QivYkq
 mhcUKo/q6QtNmH1x1iaI1xXX5yFJr4NGrKTCnVmdW3DC2lCFjNtePAMBtBfNJUoEEL
 Hy0iPE1WLFlPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IQVejyo7
Subject: [Buildroot] [PATCH 2/4] {toolchain,
 linux-headers}: add support for 6.5 headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And add (and default to) 6.5 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index cac7fba207..858e615a12 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0bdbe8555..ee4e953bf0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_4
+	default BR2_KERNEL_HEADERS_6_5
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_4
 	bool "Linux 6.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
+config BR2_KERNEL_HEADERS_6_5
+	bool "Linux 6.5.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
+	bool "6.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
-	bool "6.4.x or later"
+	bool "6.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3
@@ -407,6 +415,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
+	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index da6bf5f4c8..d8081f1b9d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -636,6 +636,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -649,6 +653,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0f4f5eef2e..556ca7a642 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
+	bool "6.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
-	bool "6.4.x or later"
+	bool "6.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_3
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
