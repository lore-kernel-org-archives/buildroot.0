Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B8C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 19:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A520B60A9F;
	Thu, 25 Jul 2024 19:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd9IVXC05CvS; Thu, 25 Jul 2024 19:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A52460A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A52460A5B;
	Thu, 25 Jul 2024 19:50:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E07601BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF4A660A5B
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46No2hlQI2de for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 19:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43F306076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F306076D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43F306076D
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:50:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2dc.dip0.t-ipconnect.de [79.214.194.220])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65F83A4C328E;
 Thu, 25 Jul 2024 21:50:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX4TQ-000000004NT-25MG;
 Thu, 25 Jul 2024 19:50:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 21:49:59 +0200
Message-Id: <20240725195000.2965998-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240725195000.2965998-1-bernd@kuhls.net>
References: <20240725195000.2965998-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721937001;
 bh=0Q2Mi6ziPZMRJZu3mzU3GNL8zPfEOkeUqnibtWxsVKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PS8ltZHhtrk+uvm1eBDveERoeqvxIydyC7+X4UE3bdez7ziuqjXN3Ee89oONfNMMc
 wiRU6iupwpHNs8is93QUXtMWaSsCz3m+aBvIpNDYfBWaHS4PwIqEUCcsWEnOtfkg47
 tdTZu9RJe6N7VijqVF2L2RWoO3nVdzF1MYwAUaE2HL0NxjlC1TQwzDClAbpAzLxvCL
 U1uM57S9mQL8Uz73mDYg7BMcfOoTuY0PkDnX0jO28jHpki8BnBf7YgV/ndRNLjGghk
 7iAOBP++i5JhoyTzr2qc6Y56hXQXfSs7WAZafdfHwH6WQMIf9JXqOxl5q47dIcKxUv
 0hrx4LLkB5uyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=PS8ltZHh
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.10 headers
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And add (and default to) 6.10 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b059ecd892..2d2b6d3546 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  70109dfd1cd1c5f8a58eb1cb37122b9bf93f9c6a6280bf91019263c7339cf76b  linux-6.10.1.tar.xz
 sha256  efd12e335fa67d13a3eae30e4b7b7546e74b8ccc90682e4c3fffab0b22654da1  linux-6.9.10.tar.xz
 sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
 sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index daa54b4ef1..707f2ad026 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_9
+	default BR2_KERNEL_HEADERS_6_10
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_9
 	bool "Linux 6.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
+config BR2_KERNEL_HEADERS_6_10
+	bool "Linux 6.10.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -128,8 +132,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
+	bool "6.10.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
-	bool "6.9.x or later"
+	bool "6.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8
@@ -426,6 +434,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
 	default "6.9.10"	if BR2_KERNEL_HEADERS_6_9
+	default "6.10.1"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8acdc62fc2..6e91ab756c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -652,6 +652,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -665,6 +669,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 45a87fb3c8..0daa1e3583 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
+	bool "6.10.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_9
-	bool "6.9.x or later"
+	bool "6.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_8
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
