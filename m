Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099FECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52EC843C9;
	Fri, 29 Aug 2025 11:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_2_etEx5Evn; Fri, 29 Aug 2025 11:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5AD1842CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AD1842CB;
	Fri, 29 Aug 2025 11:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E274D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FEB4418EF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WR8TnSQdHgs for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00DCA418E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00DCA418E7
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00DCA418E7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso11481535e9.1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466922; x=1757071722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZ28YKcue8hug88G0lcYl9krQ2dHfXBSPIg+Nkg+j4w=;
 b=dUnHJeTOiRyDeO9Qzo/AErAKU2avjp0D96qojnQ8Wz06bf32KVIP/HrgamA1AvFnH1
 OP6d5bj71a+FDZSA+41H8hQT7yb1T8eBVtavn7BmuUCpO1ppSCWEOb3ZNgxI7ArKoLSC
 9PfqEXEaeYPLoNwRlKzidQb/EHg/2Ez8UE1JYr2JaHHCXpc1k1TQ9xC+h/Izexstvea0
 YsjGj96IiTzKXbFpVYD34W9Q+31fMksUwrSCVSZrngqROMUkbhjXvwKyccyBFYxJeoBs
 L98rZfLWx3HZtlTnFF/H0hmZuvtYLHRuMpVM6ROR11EOwlko/eeNhs9x7V6xtq4N3X1r
 DxCA==
X-Gm-Message-State: AOJu0YwOwmFumTgM5sokInLG9wuHZkC44pnVrtKlaLtUDA6U+1+qnvVH
 vKMHzAUOQstOjNlcNtscKFx7HWLCv3D9MgR+myXwLkFi4tcELBGIk2mCv4rncf6h4nqhr+Um9Nb
 IAj0lvYcDMqmLG90=
X-Gm-Gg: ASbGncv66gecVN+AGoBJ34l0PXxnSBr2Qu7lqvNJnNMqh98x4Tkxfb/tSHgHn0HISbt
 yld9t/WRlw3EtF0oHyjGfEcJ/V2QODYO7kFEm1aDKB1Ik+JhQ/QXj8xxDaKH+1MsSXw1K9BmaQm
 ULJ+1hpAuDGffZgGMNSZXZoJ43a+l61VwZ40jyLm0ZXAuMFnluQuaRznR1e6lgddoLhzwo+BgUm
 nKk40KHf4As3boEN2jjo6pbotia/JfQWc6EaEcL+Rz7aOwLj7LxJC63wOhL79IiR9wOvKzqEuTW
 dBc6bXc9M5i67EhBzZET22oBdqe/shoX0+pmeI77tQZK2kBNqnalMupFRbpdiXjSNmjJin31leb
 wovppE8VrCMyb4RXwhPGgiGB8WZUql4CHCBi0EE6enurCQ0JzwWSi4aO0bw6qJxmI7eGQC1QnU1
 rWWO3uFQ==
X-Google-Smtp-Source: AGHT+IEeLJZyERF9NLquDstnLnHP4Z2RTNuAWpRO/PXDKPi86uqVi4h9gQMTnxFGyWiJiUTvYJJA/g==
X-Received: by 2002:a05:600c:3589:b0:45b:765a:a8ff with SMTP id
 5b1f17b1804b1-45b765aaa1emr54162565e9.11.1756466921919; 
 Fri, 29 Aug 2025 04:28:41 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:15 +0200
Message-ID: <20250829112818.129101-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829112818.129101-1-titouan.christophe@mind.be>
References: <20250829112818.129101-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466922; x=1757071722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZ28YKcue8hug88G0lcYl9krQ2dHfXBSPIg+Nkg+j4w=;
 b=gxMWD4pBoabBTGxA/iy36Mz2M3YpkDyGyZIbWQ3n04DnNHR0LT0XkAmugQ9/Rw3BSW
 cLPImowjE5cXAX3UtWLFkVBJsdU2UCTLwqofWg4Bq+oVsorEmNXm56OvAMpDkpLAEBrH
 M9MW0p1Y2B3Mjk1KW1nkbgIH8HRn6O2wk8WjEqivSEuD8VFBxT58GA0Z/ZnRbXJFNK8t
 fIlrBxf6a9+UtDa3vh5h4U9xi/eIY2WN27ejnj810/I5HytGPD4ol64DiP3YZxDAH+OL
 uqD8ybRpOOnckwDanJsRAJv7D/9tKFkc3xnP8lvPGTNNY8xeyj2VPDOmDqkXGue1r3jM
 f+6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gxMWD4pB
Subject: [Buildroot] [PATCH 2/5] toolchain/external: remove Linaro aarch64
 toolchain
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolchain is more than 7 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. There are still some
alternatives in-tree, such as ARM and Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                                 |  7 +++++++
 .../autobuild/linaro-aarch64.config              |  3 ---
 .../autobuild/toolchain-configs.csv              |  1 -
 support/testing/tests/boot/test_atf.py           |  2 +-
 toolchain/toolchain-external/Config.in           |  2 --
 .../toolchain-external-linaro-aarch64/Config.in  | 16 ----------------
 .../Config.in.options                            |  9 ---------
 .../toolchain-external-linaro-aarch64.hash       |  3 ---
 .../toolchain-external-linaro-aarch64.mk         | 16 ----------------
 9 files changed, 8 insertions(+), 51 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/linaro-aarch64.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b356c71fbe..0247b5c138 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "Linaro AArch64 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro AArch64 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-aarch64.config b/support/config-fragments/autobuild/linaro-aarch64.config
deleted file mode 100644
index f65f78a39b..0000000000
--- a/support/config-fragments/autobuild/linaro-aarch64.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_aarch64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index a2fba3a2cc..5c2f4c673e 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,6 +61,5 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 6142dd36c1..b822b9d357 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -6,7 +6,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6e66fb63f1..9abd77302f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -10,7 +10,6 @@ choice
 
 # Aarch64 (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
@@ -104,7 +103,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 # Aarch64
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
deleted file mode 100644
index 1b0ec7cd9f..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2018.05"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Toolchain for the AArch64 architecture, from
-	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
deleted file mode 100644
index 099c6c0d07..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-aarch64"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
deleted file mode 100644
index 70841a4fa2..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  466b801a60491ae1e2ce9952e0615cf04cf611596c6ffd5bfe8a89ef5be47e03  gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu.tar.xz
-sha256  73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345  gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
deleted file mode 100644
index 1015d63014..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-aarch64
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
