Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25611EBFD18
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15C084332;
	Mon, 13 Apr 2026 08:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V5dXhrF3Z2Y; Mon, 13 Apr 2026 08:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11415842E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068927;
	bh=KMvW8qZR+A3lBn2Gpm3s9KuWbMwLhX/6A9PeIvIAG28=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kyb+C8SLYcbDwzB+huQ0S9YqrsduPVpr4iB/mXvJeQbFFzJgmac2ONoua3X2EMmTr
	 jnZY+3LiNCA/2X4jjQ15vvsYJYcgRbabM39Hbz9zX9tJGNIXRlusArtPw6mEyUEyTW
	 gxAG4NRjqeP6QzsUBERRF4qg7qQjHIoCQT83dVS7O58wf7DamjqVHHR2TK6Zc4stYy
	 hf7Qf94+FAkim/KXGikyL7Cbzes1RV6qmTZEYw9JJeAW8ge3T1MPFZq9m0PGPPR0UP
	 3DgGZyDqlti0lspF0O1lrinmaaiVSYqcKb1p4oWzu37dFtN9LF8rorJyF5WKhTrgQF
	 VT7DbYs/8FpyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11415842E3;
	Mon, 13 Apr 2026 08:28:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C9E237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E9B4263C
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok45ZLYSWQpp for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51FC142619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51FC142619
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51FC142619
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86720A4C21D0;
 Mon, 13 Apr 2026 10:28:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCeX-0000000008w-2rsS;
 Mon, 13 Apr 2026 08:28:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:28:15 +0200
Message-ID: <20260413082817.3553573-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413082817.3553573-1-bernd@kuhls.net>
References: <20260413082817.3553573-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068898;
 bh=c8ivW6wjnBDPlCJHoc4KiYPRsPHnspxO3UjpOB1g7zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pd6cuc/PofQ8OHOJrmP1tIVVxlG3iu+PDLZMQ7NFtza8KWlO0vIoKNUAAwCedpbga
 krdutoTU7hn5MVj8wlCu09H8D7NqWaOBijto/PI18qkmO0rqcPrhsVoa/Bzluz8xGE
 Gi+JXsMGTJRfbRG1wI1olhBt75oohQENycvTx1PwGpttx7prryZHDcVp4ChAx/KFAH
 oYrg8+7pWz7RAzyPTsEI7S1AJ0gwnpwiM2EYQCDhGy8f6Pmzr5P68VvtsajBTk9quE
 9JZsl5sdDi1fpZeiIIjTJWIm0HvxogpTEz9VmqBrHaHPTGRH5icf3yzeVXHAfbOLVL
 mGg98W/z8MKlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pd6cuc/P
Subject: [Buildroot] [PATCH 3/4] {toolchain,
 linux-headers}: add support for 7.0 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/from-6.17/linux.hash                          |  3 +++
 package/linux-headers/7.0                           |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 25 insertions(+), 3 deletions(-)
 create mode 120000 package/linux-headers/7.0

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 77c1ba866d..75994f545c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,3 +1,6 @@
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
+
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
 sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
diff --git a/package/linux-headers/7.0 b/package/linux-headers/7.0
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.0
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd68c29ec4..366d17ad09 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_19
+	default BR2_KERNEL_HEADERS_7_0
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_6_19
 	bool "Linux 6.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
+config BR2_KERNEL_HEADERS_7_0
+	bool "Linux 7.0.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
+	bool "7.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
-	bool "6.19.x or later"
+	bool "6.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
@@ -471,6 +479,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
+	default "7.0"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3158899474..b63f6db318 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -676,6 +676,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -689,6 +693,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index b849431a9b..f69e09ecf0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
+	bool "7.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
-	bool "6.19.x or later"
+	bool "6.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
