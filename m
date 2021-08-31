Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82429C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287FF61053
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 287FF61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E5B6060C;
	Tue, 31 Aug 2021 19:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mwNcaPN75_0; Tue, 31 Aug 2021 19:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E0F60655;
	Tue, 31 Aug 2021 19:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E75191BF362
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E338A8101B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-5cvkJUegmZ for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 19:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC5280D60
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 19:27:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso261359wmr.1
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=19XuRMXcHFTX4MsZqTsWKiOytXKPHXyApLDpv2kr4TM=;
 b=R2zX5EthTNl3/dA+a41cqiLWgm4ZY6auUA6TLI4q/v3BB2IJdJJvANQodrKPfr+sTb
 O96tl8OI0hQaQy6oEDnp0vzZ+W5LtVmyiWxNP5gaLVKVhEumO5J1mXE9krbtHttrjn3f
 xYYc2PouWpH+CUODsyeGjFfaegKEXp9qi6wCM4vepmEPwgG9x8c10tW2xc/G2MQSmEPZ
 YC9gqTd2CKsGl4ItzUmplBIKBDzThors+jxY31V09EpN348onP5KG7QPiWNMHfzXolw4
 7SJWKMEY2abofX1/a/JiVHzGBWLiubLe4HmDRPQBe82pWH/IjaT8EEpb11PlwzE8ENOb
 lcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=19XuRMXcHFTX4MsZqTsWKiOytXKPHXyApLDpv2kr4TM=;
 b=oIWpq+zS+Ou/xxbPSI067IyWrjMNVFjH2eMgskYC8QHahDP7SAQv8ztOLBY35fIftV
 sEH37Nxen4W+D6htnUmp4UfOY2v0WR+7+DxpFYTxYBJdFC6XipVTDUHwk1Fxxsdkn+5F
 f2Qt7yv69s0pJro6dO23JIH8U8ZvM/DRZWGIIvfTHMyWFusrHUi6iypMPbAzBZ6GmKZZ
 pyZqmkS9R47afscFdGVzMD6KOEs+8UCtfOwLEwZ4/r0KRQG7LKXztjkxMdRWk23KLHAg
 FZQcp//D1oPpRI0/dSjKnp4AuuYfry1HRu2Lr1qr0j494OqTVaagpD1lPQ1KqMdmkSZr
 mngQ==
X-Gm-Message-State: AOAM530rcPXiSTlvwFfR7THULxqzaftnkpepB0VJW+gCBlbNplu5S38E
 uQ0mN3Jgjc2hU/5c5pd+gXxZhoOyb8U=
X-Google-Smtp-Source: ABdhPJxqmJGZkRdGb+hovFVpxmTFNRsVbmMVn5nezZpXVmCy70k48afLu+jGsDjdktyomrb5LOFoeg==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr5877856wmi.77.1630438069082; 
 Tue, 31 Aug 2021 12:27:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o12sm3274929wmr.2.2021.08.31.12.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:27:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 21:27:27 +0200
Message-Id: <20210831192729.407412-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [for-next 1/3] toolchain/toolchain-external: update Arm
 ARM toolchain 10.3-2021.07
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to gcc 10.3, gdb 10.2, binutils 2.36.1, glibc 2.33.

Remove BR2_TOOLCHAIN_HAS_NATIVE_RPC since the support for obsolete
RPC was finally dropped in glibc in 2.32 (2020-08-04).

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-arm/Config.in                   | 7 +++----
 .../toolchain-external-arm-arm.hash                        | 6 +++---
 .../toolchain-external-arm-arm.mk                          | 6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index e3bac38baa..0fbeba6aae 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2020.11"
+	bool "Arm ARM 2021.07"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -13,15 +13,14 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 10.2,
-	  GDB 10.1, glibc 2.31, Binutils 2.35.1. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 10.3,
+	  GDB 10.2, glibc 2.33, Binutils 2.36.1. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index a46ed4e40c..d58692de53 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
-md5  14f706db78cfb43aafed9056174572b0  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
-sha256  102825ae56c9e00142d06f35d2bdd3299edb6060e84a275a25b095e66fd3fc2a  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 88b6ae3403..4392205105 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2020.11
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
