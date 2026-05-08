Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C6CD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C235861B52;
	Fri,  8 May 2026 19:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQ9KLDJ8fWDm; Fri,  8 May 2026 19:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAABF61B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778268967;
	bh=4A21ZMn33nncgWFPu9a2MlUgAsnP5AidDch6/1GDEKE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XRRvGRs4IAhvglArecR+A1PmwFv+KC+2SE07RrdTguIXU9I3WKWI1t80481a7wd8i
	 1j3c6buOBo8H4rmvOEaKGZnIWdub+8VCEoyDWSPELnwfIf+KWU32kW3Cx6wsECtonc
	 NykDxRaTTuVndVjy++ohV4w6nlhp/DcsmDDgmriwpekmAtYJCu2ZotsKm/L251PdXC
	 zGB3YfQC83K33LJ5bdpM3f+ESAr/jLnz9C6IZlxCj9QszeVQ8Y1BtqLmjSo3lQdlwz
	 NnNl4OETUfs79bNQ2JcXCXrsKQfk6azZtn9cpdUtZSY800MvkGe7IX3iKaYqaz2Avx
	 kjp2sjHhZEpNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAABF61B4A;
	Fri,  8 May 2026 19:36:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A8928D
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C72C8488E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXButOBdKGB7 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09C1E8488C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C1E8488C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09C1E8488C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C704A4C2DCE
 for <buildroot@buildroot.org>; Fri,  8 May 2026 21:35:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40604)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLQzG-000000002Fa-12b1
 for buildroot@buildroot.org; Fri, 08 May 2026 19:35:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  8 May 2026 21:35:49 +0200
Message-ID: <20260508193549.4015030-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508193549.4015030-1-bernd@kuhls.net>
References: <20260508193549.4015030-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778268950;
 bh=zK5nEuH9ejHUe3ntJ6qE5Wuket/e6LwH6+VgrucGYB8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=eB7yXSaq02m5/vwCt8IZauSAfrSzqGjP0OMerF28Di5fmgMy4XtTkAbIhAl/3JcKI
 CfmoK8lngvNZyox71jEAvvtpgBzqeF54FQ0EA0ev0BlHs6drqxcrOnW+sqJjRJ3/+s
 uBDoWaEVRntd+hVfFyV1hM0x9JJ/13X96LJEo2WNLjepRJUBw3FR5qq6lyDn3rD7dI
 d8bEOpNgGG2aGqrnZ/ZT6mmnE51oJYnSW01dUalOuUqfeI8iDqXb2R8uhtHrkoyavM
 CD2+SAp2xAQo+QLjSkcB2F9DIm0yLoPyUGNq7L+EfXeUaIXiXzznfTvvYabX9qURbd
 OjydwzofwZgeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eB7yXSaq
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP kernel to version
 5.10.254-cip72
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
 linux/{5.10.246-cip66 => 5.10.254-cip72}                  | 0
 .../0001-arch-microblaze-mm-init.c-fix-build.patch        | 0
 .../linux.hash                                            | 0
 linux/Config.in                                           | 8 ++++----
 linux/before-6.17/linux.hash                              | 4 ++--
 package/linux-headers/{5.10.246-cip66 => 5.10.254-cip72}  | 0
 .../{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32}          | 0
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename linux/{5.10.246-cip66 => 5.10.254-cip72} (100%)
 rename linux/{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32}/0001-arch-microblaze-mm-init.c-fix-build.patch (100%)
 rename linux/{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32}/linux.hash (100%)
 rename package/linux-headers/{5.10.246-cip66 => 5.10.254-cip72} (100%)
 rename package/linux-headers/{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32} (100%)

diff --git a/linux/5.10.246-cip66 b/linux/5.10.254-cip72
similarity index 100%
rename from linux/5.10.246-cip66
rename to linux/5.10.254-cip72
diff --git a/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 100%
rename from linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
diff --git a/linux/5.10.246-cip66-rt29/linux.hash b/linux/5.10.254-cip72-rt32/linux.hash
similarity index 100%
rename from linux/5.10.246-cip66-rt29/linux.hash
rename to linux/5.10.254-cip72-rt32/linux.hash
diff --git a/linux/Config.in b/linux/Config.in
index a98b4aa186..99f675a598 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -37,7 +37,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.246-cip66)"
+	bool "Latest CIP SLTS version (5.10.246-cip72)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -59,7 +59,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
+	bool "Latest CIP RT SLTS version (5.10.246-cip72-rt32)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -144,8 +144,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f97ab45c2f..ba20750b7b 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -6,8 +6,8 @@ sha256  f1672e610dc9e05e33de1803857e26c5abe1d1ab0a2ea74b0d8269267f73b499  linux-
 sha256  5fc6ce4f4cfb17977bc6e14c52a0e10846544f1ffc133aac26d6de7e14a5e61f  linux-5.15.206.tar.xz
 sha256  3956b387bfb5133c00f3f7f76a0a436934a349e8a9319a231a1b5b829d7866a7  linux-5.10.255.tar.xz
 # Locally computed
-sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
-sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
+sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
+sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.246-cip66 b/package/linux-headers/5.10.254-cip72
similarity index 100%
rename from package/linux-headers/5.10.246-cip66
rename to package/linux-headers/5.10.254-cip72
diff --git a/package/linux-headers/5.10.246-cip66-rt29 b/package/linux-headers/5.10.254-cip72-rt32
similarity index 100%
rename from package/linux-headers/5.10.246-cip66-rt29
rename to package/linux-headers/5.10.254-cip72-rt32
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
