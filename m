Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B5EC54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB05417B6;
	Sat, 16 Mar 2024 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNAJYHYvnR9R; Sat, 16 Mar 2024 08:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A54344176C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A54344176C;
	Sat, 16 Mar 2024 08:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 135A81BF389
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 08:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB98607CE
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 08:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HDqp9kFQ4CT for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 08:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D406B60799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D406B60799
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D406B60799
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 08:43:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b99a.dip0.t-ipconnect.de [84.161.185.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76959A4C120D;
 Sat, 16 Mar 2024 09:43:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rlPdg-000000002v5-0hdl;
 Sat, 16 Mar 2024 08:43:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 09:43:33 +0100
Message-Id: <20240316084335.20839-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240316084335.20839-1-bernd@kuhls.net>
References: <20240316084335.20839-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710578616;
 bh=OK/6KaCM47YYEgc6dbQ2K8Jd6DeE8LoY/jUkl7KtmUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S0SSFhgovTk++XWNiv64weHgwWmtWiv1bTkW2W/Q1gcpt7z823XINMyzqUxsG3WEV
 zWFjGlbyRU9igB2eK7IgH0Ir+6rf9Rb1he3uoqfByz5/6WiAkxPw1P3kwR4LwgcBwL
 iOZ+HpZ3kkJpl/k6sdw4miPdjXaS7AD4bbf2DBIdLGE01jUuaJ2+GgyF7ISNlLk4gF
 38SzTwljf8gVdKFs+AMD+Nw6rqVOAXtf5E/Bp6p/ZVj4vu08hiuT0Wk2S2gLkZd1Ra
 iLGITRQS759Hhtss9396U61kBEHdlSKnZXcMcrZZZPC3Tyct2ljqpvY0tcFiSfPOFj
 sUJ6Lf68WS6Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=S0SSFhgo
Subject: [Buildroot] [PATCH 3/5] {toolchain,
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
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
index 6b0c5de1f6..846e59d24e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
 sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
 sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
 sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c2500fb79..227d41101f 100644
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
 	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
+	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d71fb96d40..e8b3db64fb 100644
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
