Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ECAC27C77
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 11:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8ED18128C;
	Sat, 15 Jun 2024 11:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GC8aEyts1uH; Sat, 15 Jun 2024 11:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5611812A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5611812A8;
	Sat, 15 Jun 2024 11:31:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 047281BF31F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14C3400D6
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VscqzKm0IWye for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 11:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EE1D4040F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE1D4040F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EE1D4040F
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:31:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beb3.dip0.t-ipconnect.de [84.161.190.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52D03A4C2574;
 Sat, 15 Jun 2024 13:30:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46656)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sIRcP-000000003xY-2jRj;
 Sat, 15 Jun 2024 11:30:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 13:30:47 +0200
Message-Id: <20240615113049.456274-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240615113049.456274-1-bernd@kuhls.net>
References: <20240615113049.456274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718451050;
 bh=TgLBioJMbrxuyun37CaAT9bMJV4Og9XwdOOCUDcIe6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mdMbAkGOdO07bkK8niTcdISTf5QctjbgkEAVSFYLsj9uEC1ursjTF4LX3Dv8sDOQE
 emZjiqgVKm3SoEw9+zKNbjXYBfL4iHhUmKWb7ZJMTsHDKHKzuWnx1ymM8PLUkRLYzY
 bNo0HXfYNzHdtsNY3mCr6PFZAcAMfI1wAcsSQ5gaRwdwEUafJyW9fQLjiNK8x4HfMh
 JwS0fqibRrJqAIILnqcddqzT+fhUciiru2MtdMFIAqCuU3QEoYT9URCw+/RqqiiNDY
 pKTKX/aN/qCGFJHn4eYFq/T+/5WLiS6ANM7jVFCtstdrpx3tVQ7HMTEyp2SKq9IajF
 W0a2Xei89HzyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=mdMbAkGO
Subject: [Buildroot] [PATCH 2/4] {toolchain,
 linux-headers}: add support for 6.9 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And add (and default to) 6.9 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9374af71b0..ac7028c535 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
 sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
 sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
 sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 487d941a16..e2664a523e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_8
+	default BR2_KERNEL_HEADERS_6_9
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_8
 	bool "Linux 6.8.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
+config BR2_KERNEL_HEADERS_6_9
+	bool "Linux 6.9.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -128,8 +132,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
+	bool "6.9.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8
-	bool "6.8.x or later"
+	bool "6.8.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
@@ -422,6 +430,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
 	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
+	default "6.9.4"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index baf69ce463..1aa17cbfbd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -647,6 +647,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -660,6 +664,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1c4b0d2554..45a87fb3c8 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_9
+	bool "6.9.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_8
-	bool "6.8.x or later"
+	bool "6.8.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
