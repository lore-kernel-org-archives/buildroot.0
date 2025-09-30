Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DFCCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E801A610AC;
	Tue, 30 Sep 2025 20:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQhLPlSyvHrY; Tue, 30 Sep 2025 20:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7E6610BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7E6610BE;
	Tue, 30 Sep 2025 20:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D80111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45121610AB
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVhZPjDvnIBP for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFF37610B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF37610B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFF37610B9
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c14e.dip0.t-ipconnect.de [79.214.193.78])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E4E3A4C593A;
 Tue, 30 Sep 2025 22:31:46 +0200 (CEST)
Received: from [192.168.1.144] (port=59878 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v3h0j-000000000W9-1ZOX;
 Tue, 30 Sep 2025 20:31:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Sep 2025 22:31:44 +0200
Message-ID: <20250930203145.1197559-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250930203145.1197559-1-bernd@kuhls.net>
References: <20250930203145.1197559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759264306;
 bh=qTufdGZWlt+mKturUr54tdgYsbgBaQVPG2ND3SelxW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jbRJG8U+rOZzoO6nidWzoKKQ1jfwiE2Z4B9oteNg2oqS7UpLvGBaaabT6S1OSk/dE
 k6I+jwFxhVDWrMZyU4E1JGsoRHh55qjA34xiB1p9rlwtBfvRcc37mBzrNRShQPJGtu
 QIqx6fOAljYAp8XP8fgRxKFd4FWf2A6WvzyJ5SnAymEm2zhi/HyuerGthNAHC9w74+
 JuCnlLsTZVPzGa7cfE2CkVRupcQbWjGz/n8l4xkVC4JMZ8G3viovHlI4V5o5sq1EbE
 ONsm5VYI+I8Z+v2JCWrWY6EcrdvxCSHywhM+oDoGhR7U3e3Ep0USZ0h5TUuATJp3PO
 /i3LHEzkSNeeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=jbRJG8U+
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.17 headers
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

And add (and default to) 6.17 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3e0dff74ee..d17675f20e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7  linux-6.17.tar.xz
 sha256  7ac8c8a3cf05476375deaaa85dfcee095a826ffe557b437f43774fc3b64ce58d  linux-6.16.9.tar.xz
 sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
 sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 05e1c7ae90..0593c13282 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_16
+	default BR2_KERNEL_HEADERS_6_17
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_16
 	bool "Linux 6.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
+config BR2_KERNEL_HEADERS_6_17
+	bool "Linux 6.17.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
+	bool "6.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
-	bool "6.16.x or later"
+	bool "6.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15
@@ -461,6 +469,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
 	default "6.16.9"	if BR2_KERNEL_HEADERS_6_16
+	default "6.17"		if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 30ccbcee7a..5fcc9362ba 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -671,6 +671,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -684,6 +688,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index bc34701455..9855b33ade 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
+	bool "6.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
-	bool "6.16.x or later"
+	bool "6.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_15
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
