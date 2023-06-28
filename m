Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A262EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 14:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50759417AB;
	Wed, 28 Jun 2023 14:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50759417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6A5w_H0lQgHb; Wed, 28 Jun 2023 14:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F39314173B;
	Wed, 28 Jun 2023 14:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F39314173B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE071BF2CC
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 14:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBAA60A9D
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 14:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBAA60A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlkbFjxSYmK8 for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 14:41:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E598660812
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E598660812
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 14:41:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 698CFA4C0AC8;
 Wed, 28 Jun 2023 16:41:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49382)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWMB-0002vF-0K;
 Wed, 28 Jun 2023 16:41:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 16:41:17 +0200
Message-Id: <20230628144118.463876-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628144118.463876-1-bernd@kuhls.net>
References: <20230628144118.463876-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687963279;
 bh=LI2f7G8El6eNopoK2m8+YPkWCjQbU7C6fDBmEc48bXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jIfqqCy8KJfkKslnGKmzjg3VTTAroDcaq2J+AlPdn+ZkwiV+5Kdbmb1QS9wyOLBKv
 nbUo/SKXomOv8uv5/5iCtbZR3wzR4rfqPoFNtzmFlw2mG/8oWYwh2aORIQ45NodIio
 93JofSJqEIDv37H5pOKtnhxMHgEdSnE56WKElFUwhbZH+ssVQxuMNigyiF6YM0fBww
 wYHYwlOtcHFfwO7qwLiDde6geN++OgpwJXL7NpMzHDzfu5Pr0tTc6by/0jq4zsn+Yr
 knV1sLlfwdHiT1EMgxRtEt+YDN9puo1uZnPxBvGhKCrZIF82y0S/CPKcCN/uwyhNz5
 L09RLN5Dr0nGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jIfqqCy8
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.4 headers
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index d6371a4906..a300d7e9f2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3  linux-6.4.tar.xz
 sha256  e0a9ad8692b2191cbd33db371a780a3fe375de90123a307ecd874c0860cd46e3  linux-6.3.10.tar.xz
 sha256  d8ca0e300f30b9ff70c6e1497c638a1dac1407f45d3655e9c62c6e45a08afe6b  linux-6.1.36.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index baeabd94db..e7175faf70 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_3
+	default BR2_KERNEL_HEADERS_6_4
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_3
 	bool "Linux 6.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
+config BR2_KERNEL_HEADERS_6_4
+	bool "Linux 6.4.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
+	bool "6.4.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3
-	bool "6.3.x or later"
+	bool "6.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2
@@ -403,6 +411,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.119"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.36"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.10"	if BR2_KERNEL_HEADERS_6_3
+	default "6.4"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3f0eec3cfd..a142d27231 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -608,6 +608,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -621,6 +625,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index e2fdd0c206..d82c9b8a41 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -146,8 +146,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
+	bool "6.4.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_3
-	bool "6.3.x or later"
+	bool "6.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
