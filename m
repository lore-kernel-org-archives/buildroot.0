Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6573AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 063264088E;
	Sun,  7 Dec 2025 09:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykeuCSepkeDt; Sun,  7 Dec 2025 09:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059B840831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765098859;
	bh=Bi63MbVgDBiK6ui6UV6j3ThS0elJKreHPb1We29wiZ8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4bn1nckfiwGStvXUMHUFD8n6Z8zpJPfPr+gAGE61hav30Lv78hUtohGy2dFh2BEt
	 iMsCCt4ltd3RgHl7WF451IchzjeKNXdHL3DyskLGVcrieydPPTmt5DsqJkeIvc1tOK
	 3MECCxxMKSl2t7HTM9kUKB80p47o2TG+rCcnCR237rQwUE+BN4jaGNch0Z9mGRWzof
	 s1yrQmy3zwvefBQYLeuMIb2+wtF6chm9vG8zoKIWnnTrDBg6pM/bpfFsFPlrMcEmqs
	 5z6DmL0gY265tr4jEOSFy360/JJAnw3xR+sP0q7RKtmZ34fQfIuxbUsKhS9iG7rIae
	 VHN2CvBR/elnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 059B840831;
	Sun,  7 Dec 2025 09:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98BE8151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 836F340831
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du-je3D_8Nq4 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C83FD40829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83FD40829
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C83FD40829
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DA8AA4C0198;
 Sun,  7 Dec 2025 10:14:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSAqI-0000000033z-2KyN;
 Sun, 07 Dec 2025 09:14:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Dec 2025 10:14:10 +0100
Message-ID: <20251207091410.28979-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207091410.28979-1-bernd@kuhls.net>
References: <20251207091410.28979-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765098851;
 bh=9vd87YAy14r2H1zUcu4oeAvoBeCLh3UwunvUYaFhhHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NJjAAzI/SxIpBQtBVh8LKZphFn30B9mzU2aRaH5ETR5ULVYvj/GrM2A3UuN0h1ACP
 EDcr6XCq2YBiysYU9OW1/zf+MJY4iCbOsg5AGrAPi2v3q7z2yWbCcVupaX0MSKu+fA
 yofatnk1MYblT1PgVnULFR2RLAIvzuuVl0zjSb9hBnUVNjmWApliaAE9Zpvdv8YMD5
 6fCw776YHjpKKhu427VRnQDkIgQkYEpOnwuzPWvovacHbQmkw68srm+7c9ITix+J0w
 n8688MePp6qG1e7toHhEaYNwG9v2VGRCPDr5eOmI+7pWYPWlT6iW/1ar+HjCgkqD87
 5ydVQFJYaW2Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NJjAAzI/
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 5.4.x option
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

The 5.4.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Bump kernel version in test_zfs.py.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                          | 7 +++++++
 linux/linux.hash                          | 1 -
 package/linux-headers/Config.in.host      | 7 -------
 support/testing/tests/package/test_zfs.py | 2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 81396a2ce7..64151b2f44 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_KERNEL_HEADERS_5_4
+	bool "kernel headers version 5.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_LIBARGTABLE2
 	bool "libargtable2 has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index d14de29189..d82ccf83c3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,7 +7,6 @@ sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
-sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f4c440fe3f..412232a571 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,12 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_5_4
-	bool "Linux 5.4.x kernel headers"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	# Support was introduced in Linux 5.19
@@ -466,7 +460,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index c218cc36a8..698d8d8bbd 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -81,7 +81,7 @@ class TestZfsUclibc(TestZfsBase):
     config = config.replace('BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y\n', '') + \
         """
         BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
-        BR2_KERNEL_HEADERS_5_4=y
+        BR2_KERNEL_HEADERS_5_10=y
         BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
         BR2_PTHREAD_DEBUG=y
         BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
