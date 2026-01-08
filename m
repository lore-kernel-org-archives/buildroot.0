Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3395D232C2
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 22:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6977660E23;
	Thu,  8 Jan 2026 22:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBc17Db4hxrS; Thu,  8 Jan 2026 22:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BC5608D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767912542;
	bh=SSadnU+QsXFGTf/dleehv/NIzqsX35AniMvLq/VmK6A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s8F0Lcst9/pciuW3WLAuEDM6lyxOlemWaaUUqd5w1Dmk2Sd9/7/48M50MMwVQknxM
	 YRrrPsBHOjHns0gZqsW36gq9//oNd7CBTK5DuTNW83Ltr/1TQDbvp7dfu4uo9hSjOq
	 Qv15MEOSRAPStNDSYFHlijBFpG80NvIjXGvZnM6BaiVoPPO5YKlaL8lkH4otl3gCeO
	 4vaMzb5wlA+dLXDQCDFspo5mcdxuJ1rxuo/L8f0MS+DVWbGRuyfF/RaqllpTIvk/gT
	 eOcqTeEHTGdxLV72EVXHGpMKBIgsArHrKWnBtqa/+3S9+2qTro7VzR2GyGoDqO0TOL
	 Lk4eDbRFyB8Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BC5608D1;
	Thu,  8 Jan 2026 22:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B6D278
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 22:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42309400D6
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 22:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XiZ4McWdxLl for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 22:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 821CA40078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 821CA40078
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 821CA40078
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 22:48:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DCACA4C3785
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 23:48:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51124)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdyoJ-0000000086b-33RB
 for buildroot@buildroot.org; Thu, 08 Jan 2026 22:48:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  8 Jan 2026 23:48:55 +0100
Message-ID: <20260108224855.2762464-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767912536;
 bh=ls7SH52dotDzrzndM6JcdiEHHlqUmElZ7Y4YR7SCjBg=;
 h=From:To:Subject:Date:From;
 b=FUUIKae2PNnfBCNoSFrCpqfqB2Q4ElZ628V3mQsDJ9jNgApKuvlotKsHLLMBW8ttv
 lqzRrRpVQPyi0GXi0W3rcfH+QkXrLg1invhTpXbIWAvxUmcPfnzDUMpkY2NapwjwY1
 CWTevCfVfDasfsQSQiTrofiAqZTS8VGbNoU3mX0goXCHPsV5a/GSkfY2UbIUUyAMtJ
 QLMbOIgcv0I0F7Nazvwc1aaDS+8o8+2QlKZCUa2JCSBuwY73JwYp2iGTSa+b8xR0zL
 D1m2rJur+QxWxLGUwU97UJHyZ5Hk+0v7MRm13avGx0MdJHMkC9gRbiMkIEJ3pVYyh7
 UKGt0McjNCHFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FUUIKae2
Subject: [Buildroot] [PATCH v2 1/1] linux: bump CIP kernel to version
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

Added Upstream: tag to patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Added Upstream: tag to patch (Julien)

 .checkpackageignore                                       | 1 -
 .../0001-arch-microblaze-mm-init.c-fix-build.patch        | 4 ++--
 linux/Config.in                                           | 8 ++++----
 linux/linux.hash                                          | 4 ++--
 4 files changed, 8 insertions(+), 9 deletions(-)
 rename linux/{5.10.162-cip24-rt10 => 5.10.246-cip66-rt29}/0001-arch-microblaze-mm-init.c-fix-build.patch (93%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 99a864fd3f..2a09961f74 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -176,7 +176,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
 package/acl/0001-Build-with-old-GCC-versions.patch lib_patch.Upstream
diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 93%
rename from linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
index 4760d9e4fb..d1124f4cda 100644
--- a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
+++ b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -13,9 +13,9 @@ arch/microblaze/mm/init.c:71:2: error: #endif without #if
 Fixes:
  - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
 
+Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to
-Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
 ---
  arch/microblaze/mm/init.c | 1 +
  1 file changed, 1 insertion(+)
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
