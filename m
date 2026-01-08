Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218EED1D489
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B83F82325;
	Thu,  8 Jan 2026 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-MzQ_qFgTwh; Thu,  8 Jan 2026 19:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97ECA80DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767901374;
	bh=yTH4b/4r9E2smq9GhHi0WizCZWRS1Kdt2H2OHGG3zks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QO6E3cwq7j4kRQJHvWxNIVxTYfWsMvloXXNFQ0DdtOhDeCQd+bx8fNUXj1gMxM23C
	 /kbb6LdHv7AihgPwWJB2j4RA4VvSutS9/zgWS4bI93K7HIHMiPv8MgP/CHSAx8Gbhe
	 5IJVvz7N/7hMRQx84Wt6sed66/kL1vqkMNwr84zYraxDfCuWKv9l7uM+Zr6FNd9q7M
	 qbu26mt4OOKVdHvjJibU3IILJNb/zwpUHHOiuNkhCasc8GDXNiyj30CMbOlSI5nAw0
	 cx3VqKi7Nu6lbRIv+qIgsB/L8tEwE2XmB8rPFt6xT9bPhbwdw+/WlNBKBdR9x7W8qc
	 7n7vo/DKPGcKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97ECA80DDB;
	Thu,  8 Jan 2026 19:42:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 502FF308
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42EC9408DD
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xje4xP-qLF8 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B59A4408DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59A4408DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B59A4408DB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59A6AA4C37DB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:42:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46494)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdvty-0000000042h-01ci
 for buildroot@buildroot.org; Thu, 08 Jan 2026 19:42:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  8 Jan 2026 20:42:33 +0100
Message-ID: <20260108194233.3499269-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108194233.3499269-1-bernd@kuhls.net>
References: <20260108194233.3499269-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767901354;
 bh=LihYlLtrhFBe1EcZ61KHRIynFASV2oZrHQO2rX6ODOM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=tjsNsAe/cMWQ4rixnjeFLjPjCGO3F4ZcutATGMJ6FPgxtJCFlG+78kqrvOr90zonK
 Hdhg7bVpsBWvj64dwRLURmXToan0QKBZz9gJS/p7v4JKE6fPa9mfFLum/cEO3sexyY
 4yAas527Y0lwo1wrfQjJo2JdEGXo55FTOSb04lP9F9UzTh0q1f8w/CkStrUj2pEMDK
 KQtNrIvLn1wUiHRPf/cj9qEqs5z7dfEdyHeyHQsRsXS2X4eJBSbVqp3vtsvkB4zmuY
 OG9xBVbdjSD9aP/ZzPA2RmGRwLZ4AtEp+q1euzW3Gyv9jExtCl5cr17RDpvAV1h2AN
 fYFGyMFmMrHDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tjsNsAe/
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP kernel to version
 5.10.246-cip66
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-arch-microblaze-mm-init.c-fix-build.patch        | 0
 linux/Config.in                                           | 8 ++++----
 linux/linux.hash                                          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename linux/{5.10.162-cip24-rt10 => 5.10.246-cip66-rt29}/0001-arch-microblaze-mm-init.c-fix-build.patch (100%)

diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 100%
rename from linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
diff --git a/linux/Config.in b/linux/Config.in
index 42214ccbda..14d644ecbc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	bool "Latest CIP SLTS version (5.10.246-cip66)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -57,7 +57,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -142,8 +142,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 45437f8796..11db3e59b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,8 +7,8 @@ sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
 # Locally computed
-sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
-sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
+sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
+sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
