Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A448CA1001
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B5E418F3;
	Fri, 29 Aug 2025 11:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGbvAyCwQqoI; Fri, 29 Aug 2025 11:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21FF8418FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21FF8418FA;
	Fri, 29 Aug 2025 11:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C40E369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C3F600B3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zb4Vnl650Uoc for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9460061580
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9460061580
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9460061580
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so11780775e9.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466924; x=1757071724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZe4ZtDClY5c92bPkSzUbBpQuIrSY/BgLLrIATd0pzg=;
 b=okvlzeB1BmWOJ3HXhr/8IRcyTjqdPmfoT+eODvQcTaAtu8+dQvFEJoJOZRCbDK9aco
 7HvA4xaeljk919O4oXmsyl8Bh7Q3V5ZxqM+TmEh8c6bFsx2P8HP4KB9hbHuYgnrngziy
 ghu509PESvWJRCve8BIGhwsgm8GUhqL7ttyAsEpa6j7O3lrswgBHmkolazG0tmqTvm4I
 WUcKuB0ug7k7yBeclHWCQBOmrUALQwyLpM0VVLia7RcFAO9faT87TiLvr7RsrAgKi9Oz
 k5/BwIk7gPLnQpmRPp7sVCrvP86jYnpHxMeJfDo3q3RLUlNooMhinlkxlEGiAyvEXOEW
 cTnw==
X-Gm-Message-State: AOJu0YylyIhRFEZYC/lmEmQvm5YO3ghR+gDxsnf/5jzO+zeHXzYA5dc4
 sqohRBHAAwwczU/6lukbtZepBv9rZFWmDSh/2td9p5uQZ5lbqWLYzQ/Nezhd0N8oBHq9qzRRgE9
 h0kFi+bbaEJFq9EM=
X-Gm-Gg: ASbGncug1ZTjRTRUZVfanbhFAaith9iaUlE2j1hdXSyGVmkkHhXmDl3/h5uzZ1RELnP
 dlzBBAIn2v6bOtql7BxptmKJPqM6cer6gWVycC32hVgGoHA8/phGMMUAL32WvF04fj6ITtH5/XO
 vjKY5NruktvQmLavram1TJeCJD2EPUrHG+B/jFG1Q2BQvy+vh5u+q6lUGDHN+oEPSwi+Z7HTPue
 TFcinwZsiQ9aGQq4aNtfaDALIu9HAVT57kbVbfNgg+W5YuwzMn00IsM+Ehg8TLxEl5eDWUVnK3C
 SHtp5EukUbTu4kOUcUnOijexWLl1r5DazkEMfwjGjMp7hAMuePBMNmtlyNDA5p7Hkm5EfRwKtIh
 TNXePaNlffFMCLVLhlgsPy/5m0Wt0jHMlxvlotg/y0EwzlyuOZcRS9PIrv4dIO0Tzwj5RztNF9S
 LT+8rTew==
X-Google-Smtp-Source: AGHT+IHvciv0pPOrp3NTzfHGVsXLf8bRCpK1K6tLKJK2rllnw2rsUUsGkhX3lE/0frfd7ticMm59VA==
X-Received: by 2002:a5d:64e3:0:b0:3ce:c602:58b3 with SMTP id
 ffacd0b85a97d-3cec6119bdbmr2753808f8f.24.1756466923574; 
 Fri, 29 Aug 2025 04:28:43 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:18 +0200
Message-ID: <20250829112818.129101-6-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829112818.129101-1-titouan.christophe@mind.be>
References: <20250829112818.129101-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466924; x=1757071724; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZe4ZtDClY5c92bPkSzUbBpQuIrSY/BgLLrIATd0pzg=;
 b=LPl5rgb0qtw4h9TmNJVRI9nMEe2zFHCyCjHcKsdNStpCjGIvN3cooeDnfW5XTr4O1f
 fRnmCOcDJThWZG6zsywZgl/a7O5elf2TJLggUf8IfG6/mIpBjLcJBtILQfj6XjqgKxBy
 gt3I3CvIjMrjSS+4+7jsLbEpoBXER2BipozDui/5LquysN6I406GOe298e3tMJRestZD
 P9WsPQ8MF4y3kKR3nG8TxvIa22lO+gp+BflN1ZSXMJDqzj82Wk6Z9td5hkcr2qgiyYav
 uT12+5KTq8ohf5DdAUy66M30snyGQ90oRQJKbghNHZjv8QJHT7PMEvRzKyxlj1HS8iRW
 KK8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LPl5rgb0
Subject: [Buildroot] [PATCH 5/5] toolchain/external: remove Linaro armeb
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
alternatives in-tree, such as Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                              |  7 +++++
 toolchain/toolchain-external/Config.in        |  6 -----
 .../toolchain-external-linaro-armeb/Config.in | 26 -------------------
 .../Config.in.options                         |  9 -------
 .../toolchain-external-linaro-armeb.hash      |  3 ---
 .../toolchain-external-linaro-armeb.mk        | 17 ------------
 6 files changed, 7 insertions(+), 61 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1c98a0a7e4..84c850ab9d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "Linaro armeb 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro armeb 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2599015d4b..831387bc4e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -20,9 +20,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 
-# ARM big-endian
-source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
-
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -111,9 +108,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.o
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 
-# ARM big-endian
-source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
-
 # Bootlin toolchains
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
deleted file mode 100644
index b143ee5e24..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_armeb
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2018.05"
-	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	help
-	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2018.05 (based on gcc 7.3.1), Linaro GDB
-	  2018.05 (based on GDB 8.1), glibc 2.25, Binutils 2018.05
-	  (based on 2.28). It generates code that runs on all Cortex-A
-	  profile devices, but tuned for the Cortex-A9. The code
-	  generated is Thumb 2, with the hard floating point calling
-	  convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
deleted file mode 100644
index 225e90f009..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "armeb-linux-gnueabihf"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-armeb"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
deleted file mode 100644
index 2b80f396d1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
-sha256  c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
deleted file mode 100644
index b8ea80ff60..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-armeb
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2018.05
-
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
