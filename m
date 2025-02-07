Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A37C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D77042C78;
	Fri,  7 Feb 2025 18:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmORGIyQBsdr; Fri,  7 Feb 2025 18:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB6E442C9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6E442C9B;
	Fri,  7 Feb 2025 18:20:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D1C7CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C82684886
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbfVYUh4xfK8 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45BB0847DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45BB0847DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45BB0847DE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7103DA4C4A07;
 Fri,  7 Feb 2025 19:20:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50538)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgSxt-000000003Dm-2iNO;
 Fri, 07 Feb 2025 18:20:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Feb 2025 19:20:32 +0100
Message-Id: <20250207182033.2746438-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207182033.2746438-1-bernd@kuhls.net>
References: <20250207182033.2746438-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738952434;
 bh=aTjEF1jzWQENk9M2PRQ/krr2GkZuClfbLWcHp/KNrSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hq4GQ6pNej51KVkFZkN61TuamXn2CPB1bqPvIAvmbebhLAY23NrzNp1aWvaiaz1A7
 IZ3hO52Rjrx1FmpUpBfmYPSaRngGzJ8iS4R4BD3hxAtzdrtkuYC3fr2rvXEN95xZZc
 Mp+CKSjknqPWXllOIdUb77elXyjED0plDxJkH01SBySIZUDpoBtq/BBX33380r0tjf
 9FO7VywjWzyDgbBpBKskzljw57Ow131EnOOwD2u0oOuZGaWK9XpAjLDXJbIMO3Cko7
 xAzEMN1c7oN2yxXj0a99ucO/8XH5HfGqCBsoxScnWuUBpZvseO61dumzPCmLk3GO1d
 l1F12mz8ho9dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=hq4GQ6pN
Subject: [Buildroot] [PATCH] {toolchain,
 linux-headers}: add support for 6.13 headers
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

And add (and default to) 6.13 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ebd39c2bc7..a80accf785 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f011f6c8ea471df1b3dbbdd1eb261b29c92e43360503c3ebd005beec2155b66a  linux-6.13.1.tar.xz
 sha256  e98942d17ef7063b3f2d6d7692bf24899e2e021cf832d19b55308ec8e8e08eff  linux-6.12.12.tar.xz
 sha256  f7dfb1fa9716ba139d0b4c8161535816d400dea21d5943f513448429b1790290  linux-6.6.75.tar.xz
 sha256  874d67d3181570e69ac6b33853f0448f05fc90d4cf3e4baaadc4a9cede7c50f3  linux-6.1.128.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0cb484bd0..4ccb2224cd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_12
+	default BR2_KERNEL_HEADERS_6_13
 	help
 	  Select the kernel version to get headers from.
 
@@ -47,6 +47,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
+config BR2_KERNEL_HEADERS_6_13
+	bool "Linux 6.13.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -125,8 +129,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13
+	bool "6.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12
-	bool "6.12.x or later"
+	bool "6.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
@@ -434,6 +442,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.128"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.75"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.12"	if BR2_KERNEL_HEADERS_6_12
+	default "6.13.1"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d6ed25ff96..b9249c71e1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -645,6 +645,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -658,6 +662,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 2dc04747b3..e1ecf06e4a 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_13
+	bool "6.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_12
-	bool "6.12.x or later"
+	bool "6.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
