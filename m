Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860AEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 06:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2990485491;
	Mon, 30 Oct 2023 06:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2990485491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpEOieb0YLNs; Mon, 30 Oct 2023 06:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC4685484;
	Mon, 30 Oct 2023 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC4685484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C60C81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 06:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF5B70A7D
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 06:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF5B70A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfOYRejNqD1y for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 06:41:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B781F70A77
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 06:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B781F70A77
Received: from fli4l.lan.fli4l (p54a1b0b0.dip0.t-ipconnect.de [84.161.176.176])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FE13A4C0951;
 Mon, 30 Oct 2023 07:41:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47582)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qxLxN-0006rU-2B;
 Mon, 30 Oct 2023 07:41:01 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 07:41:00 +0100
Message-Id: <20231030064101.362244-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698648062;
 bh=qxV0dctIwyChyTu4PKuBwp1jL3tdEKMo2s01FCam/I8=;
 h=From:To:Cc:Subject:Date:From;
 b=ww0hHjHX5ptndTzzFy7+HdV0OMWrXGhFx/kLXzaqJ8rAaoLzqVFEI6+pKuC0zoLjF
 a6ka7wKnxGOk10H/vzmmmsgue5SNcwyifWP3Bn5UJZXMVjDL8oayapjCISD7HG+AHU
 LNUg7RI+qiiYqv6xmeMtIxQYxPcCenFYvaUlxuGEVDmXiEWg7Wylj+oDu9o51301ss
 oik5oXICP02dbPofvvwII3s9BMwY4+Sd2U0zAb8fuSxcgaR9JHstDwwrCIzqEFzDV3
 ve/xLeqPCIFjK+EXaA+IiGyU86uPzhTRM4ty6jPsu5l36Mm9P0crngqmpqw95nFKM0
 68ItpnbQqlTCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ww0hHjHX
Subject: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 6.6 headers
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

And add (and default to) 6.6 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 78d1395e66..7b56d19cb5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0  linux-6.6.tar.xz
 sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
 sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bb624147ec..74d445ff27 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_5
+	default BR2_KERNEL_HEADERS_6_6
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_5
 	bool "Linux 6.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
+config BR2_KERNEL_HEADERS_6_6
+	bool "Linux 6.6.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
+	bool "6.6.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
-	bool "6.5.x or later"
+	bool "6.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
@@ -411,6 +419,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
+	default "6.6"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d8081f1b9d..34e0ae2c5f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -640,6 +640,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -653,6 +657,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 556ca7a642..5554d56719 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
+	bool "6.6.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
-	bool "6.5.x or later"
+	bool "6.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
