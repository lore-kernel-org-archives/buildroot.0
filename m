Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34606C5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 19:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA7D40972;
	Mon, 11 Mar 2024 19:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuDRGI4drIMd; Mon, 11 Mar 2024 19:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF71940B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF71940B4F;
	Mon, 11 Mar 2024 19:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEEE51BF86B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B94CC40B4F
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OY9qz6Ka5v5D for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 19:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A8D640972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A8D640972
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A8D640972
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:21:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0dd1.dip0.t-ipconnect.de [91.58.13.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B666BA4C066D;
 Mon, 11 Mar 2024 20:21:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56460)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rjlD6-000000004H7-0rgc;
 Mon, 11 Mar 2024 19:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:21:19 +0100
Message-Id: <20240311192120.252264-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311192120.252264-1-bernd@kuhls.net>
References: <20240311192120.252264-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710184880;
 bh=CJFdyBOWJzZFYMLnBWxBisHzyOdU37GXWUk2pHR7NFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GRt3dgItqdkx+WBhFHiCFTudV5RgupXaBNPa6Av+Obcj+YQk8ih9/8NaS0kdVVmP/
 efbEWRz5adCXhwP4UO+n/khG1abCgy4ZllY2F6Q0olZS9WCRy8/CtKF1QuonAdgCbc
 q99fPnfiR5bhHmqHvSObcMuvJpJqvdoflTlcT8+/hekzuZf+YWiGnNzCI9Fz1rssLh
 BhD2ANTCMn5Y9BXIW4diF3L7XGnqSxWZYhnMyzVFNcGo6QhGYFsCbyHEZQTEuk/XlN
 PUxuF2CnhdXF0f40I23L2/rViSxSnxMtNnUTSOPZwEiJCSnYoLHawO6z0YtDsmfRuC
 e/LhV2KSss9mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=GRt3dgIt
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.8 headers
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

And add (and default to) 6.8 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3c149a031a..197aa5eaab 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c969dea4e8bb6be991bbf7c010ba0e0a5643a3a8d8fb0a2aaa053406f1e965f3  linux-6.8.tar.xz
 sha256  0fd733fc0778f8da1fdf66df1698d394248807de71eef83a4d1218bcb3dfd346  linux-6.7.9.tar.xz
 sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
 sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 274752a412..84bf5ee704 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_7
+	default BR2_KERNEL_HEADERS_6_8
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_7
 	bool "Linux 6.7.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
+config BR2_KERNEL_HEADERS_6_8
+	bool "Linux 6.8.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -128,8 +132,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8
+	bool "6.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
-	bool "6.7.x or later"
+	bool "6.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
@@ -418,6 +426,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
 	default "6.7.9"		if BR2_KERNEL_HEADERS_6_7
+	default "6.8"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 33528ea8fc..e5a9593bf1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -649,6 +649,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -662,6 +666,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a7c239dcab..f7825cb88e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_8
+	bool "6.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
-	bool "6.7.x or later"
+	bool "6.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
