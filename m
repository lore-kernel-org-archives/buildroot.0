Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40B2C5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 19:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 757A040972;
	Mon, 11 Mar 2024 19:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChGRy8PmNT6P; Mon, 11 Mar 2024 19:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 688DA40B64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 688DA40B64;
	Mon, 11 Mar 2024 19:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AEAD1BF86B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574624052D
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHJlJzBJrsxh for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 19:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCB684011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB684011B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCB684011B
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:21:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0dd1.dip0.t-ipconnect.de [91.58.13.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3E71A4C2CE5;
 Mon, 11 Mar 2024 20:21:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56460)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rjlD6-000000004H7-0DyC;
 Mon, 11 Mar 2024 19:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:21:18 +0100
Message-Id: <20240311192120.252264-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710184880;
 bh=2nG5yg4E9E+QjSplqWC6yDawXR7NxGSI6cdRQwXVWIU=;
 h=From:To:Cc:Subject:Date:From;
 b=DjMLgWMeLwvsJ4F+5IUAYys7PnKsq6tYITddBpKFLYG/IR66TMrHhYdaBiALf9pKv
 6gOY/9vHpIo79hnzgcMBfxTAtfrPmqxcMR8r0s7sryh6myGZzUq3jXOsOop7pgSzAx
 qmfOgTd8tbLo71+FrCC0+A3KfZ6k3chav38tEieKOogKXY+Hf/m8Q7fC0GMeIp6ULg
 QOEM8bHoNy6iCtJ1tWI2QxsWV4AWvnZKPYO6LGuh3loiK+o85NGjiK247YKD3SOBeb
 YziiBeqZwl5cQIEQ/oWf7wpINi9HEs/OOV7I5G/DrYuvHmh6oMhrvuIjZvpJZmz4Uu
 F6qjUl9mZwWdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=DjMLgWMe
Subject: [Buildroot] [PATCH 1/3] {toolchain,
 linux-headers}: add support for 6.7 headers
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

And add (and default to) 6.7 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 977ad30f73..3c149a031a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  0fd733fc0778f8da1fdf66df1698d394248807de71eef83a4d1218bcb3dfd346  linux-6.7.9.tar.xz
 sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
 sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fe4fc5011e..274752a412 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_6
+	default BR2_KERNEL_HEADERS_6_7
 	help
 	  Select the kernel version to get headers from.
 
@@ -47,6 +47,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
+config BR2_KERNEL_HEADERS_6_7
+	bool "Linux 6.7.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -124,8 +128,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
@@ -409,6 +417,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7.9"		if BR2_KERNEL_HEADERS_6_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3dd6e83d35..33528ea8fc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -645,6 +645,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -658,6 +662,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5554d56719..a7c239dcab 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
