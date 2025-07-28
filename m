Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB039C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 19:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75B1760A6B;
	Mon, 28 Jul 2025 19:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4zBxXRoKY59; Mon, 28 Jul 2025 19:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 929E460A6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929E460A6E;
	Mon, 28 Jul 2025 19:10:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9921D3D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 19:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4639B40D54
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 19:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDbz4Cq7FK50 for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 19:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46D3D409DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D3D409DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46D3D409DE
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 19:10:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D1FDA4C1F57;
 Mon, 28 Jul 2025 21:10:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59118)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ugTEz-000000005nC-0Kxe;
 Mon, 28 Jul 2025 19:10:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jul 2025 21:10:28 +0200
Message-Id: <20250728191029.3903749-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753729830;
 bh=ROgtWpCeqPN/Aiqbkuv/EvxNuk51HFDVy9KbN+zlTzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=hhXGwDYx60IthqV08n1AjtjiOHSj4nkbDARJ3FbjNCZNwm2nbCu5AvOMeJwZ36gG1
 603njSUOYaQH71iztoYEvHhQ7XdXVW92qtP3Vdu3TZm8rtZ1dMcBfboWCj1ZcS6Wbj
 c/lwza7kRyaWH0CWSqrmMmC0+LQddAjVhiCfXlbZ/1pQnUaPJgf6ncEUGrCHJAS1OH
 RU9hAulu7JUsHYcS3Iky0N+QHX4XtD1PtIBzipdZtANmB8pQ0HZ7zqFkf/PZIbcjIP
 SmJzx4X7LpgMEar4KLaVW28b2lCDIw2mN3ZPvxZrsdTBG9i3LNIXlvrgILnFcUUNV4
 wlt8HbEnA8FWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=hhXGwDYx
Subject: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 6.16 headers
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

And add (and default to) 6.16 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1e6602c878..8401af95e4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
 sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
 sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
 sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 23b65f8dee..37a44c2e3c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_15
+	default BR2_KERNEL_HEADERS_6_16
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_15
 	bool "Linux 6.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
+config BR2_KERNEL_HEADERS_6_16
+	bool "Linux 6.16.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
+	bool "6.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15
-	bool "6.15.x or later"
+	bool "6.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14
@@ -451,6 +459,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
 	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
+	default "6.16"		if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 185a01057e..8f91b23562 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -657,6 +657,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -670,6 +674,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1580ffb920..bc34701455 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
+	bool "6.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_15
-	bool "6.15.x or later"
+	bool "6.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_14
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
