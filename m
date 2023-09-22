Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D47EE81A61
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B506168B;
	Fri, 22 Sep 2023 19:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B506168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNjIC-75DSeZ; Fri, 22 Sep 2023 19:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC6561690;
	Fri, 22 Sep 2023 19:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC6561690
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBDD41BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D2683F44
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D2683F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bS3dvbJXswPb for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:33:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0977F83F36
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0977F83F36
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D319AA4C0B4C;
 Fri, 22 Sep 2023 21:33:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44318)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjlu8-0003tt-1r;
 Fri, 22 Sep 2023 21:33:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:33:31 +0200
Message-Id: <20230922193332.2345183-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922193332.2345183-1-bernd@kuhls.net>
References: <20230922193332.2345183-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695411212;
 bh=sJc3IFxUkxD0jdWh5HNUkidlDWRW6FVwNHZ2MI4xC/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iQX4iHmWVhFrk8lLdRJZeyabtq4U5Z1fU6pH1M+faNtw3waWfXHIQtIXOqsn4/hcc
 WfcBCHrtrRJ9CsLfmOq1F5BZ8eOwD4IjNeVe2/V21gnJBgiNb7lmlMtr6T+wsuOlZT
 8EQh+LhVxPpmbAS7c/wyM7KV8Xn1aqO4j/BMG7bnKKpb+ajA/lrLtFjQkze6LC0H9t
 yBtWrUQBBNoL2Ar7mMcVlIWO9ciE+/mfGa+KTCy4jH1QS5tNqmh8MnhxsZXzt3ipVI
 qGxF+pq6PjOnbLcxIKRGoC0UTncie25tKb0aQgtHXBF8UvLgGRuXNdiu2q0Y+rb3kE
 +Yr3FoQQxkDZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iQX4iHmW
Subject: [Buildroot] [PATCH 2/3] {toolchain,
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index ecd3492c43..d770b77627 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  bdf76c15229b241e578046b8486106f09534d754ea4cbf105e0660e551fb1669  linux-6.5.4.tar.xz
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a3181e46d407cd6ab15f412402e8220684ff9659b0262b7a3de7384405ce4e27  linux-6.1.54.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3eb47e315b..77b5d19e2b 100644
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
 	default "5.15.132"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.54"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
+	default "6.5.4"		if BR2_KERNEL_HEADERS_6_5
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
