Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F222DCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B442D843DB;
	Fri, 29 Aug 2025 11:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL_zC3VexGWn; Fri, 29 Aug 2025 11:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5FF83C40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5FF83C40;
	Fri, 29 Aug 2025 11:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FF669
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25D01418F2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4aX-JDeeXMY for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3E53418ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E53418ED
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3E53418ED
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so6318465e9.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466923; x=1757071723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9g8iPCMVpmZMywmx/MQRQlJ7QE3WYBDcyKgVddibOI=;
 b=VO2yf28tcTmwpJLP0haC0As7ydMPeVJvDNYgrAGob94rxKafQOFeV1vCvh0SncFXQi
 bJCY1Y18xRBpM32NzaWMpxp/0b7LhxOACiGLLooKq1sQkHNP63v37ELWKFijN6SBzP8z
 jK78bHU532z6FosqAPjR3/Py+WJAGDVClkUoO5QGtgEM6hLJk8Gi5peHqHjaAZNpHWzK
 H1rF1g3VCSuzZ2Q66IDnmH046vC8+WNlBeTu+TmU7t/i4+fzfemDtnCwAaSXOR2KPlBt
 bFvdn5/pgmk7TeIpBqbdRIKkRLxZz0udSUsPb64sxVPCwM3vZO/n7c3RSeoxTNyORehy
 nxPg==
X-Gm-Message-State: AOJu0YyI6CE8wPieVPcq4h5kJ2gMNWolG5iaF/zgC5btH2W4YstDAgO/
 KwBWgnPwwAvmePGLbEAFAiWd6yjWpH0KCD3N7y4rF62lWE1TRLy0dCyGw/ViGERj/RztPts3BFt
 pXOutcnjLBpn1/kM=
X-Gm-Gg: ASbGncs+1orq3JiSus3DywJkM1cKlF0WeIvGDqCbXYtJiVjmYV3luTc9SforDhAZAF8
 mIDjHQQsod4Ox4dMIPjan4uvQrd9JNaUXGp9h66MDBmgc+7aNKJFst8WQYZPLsx+6khonAiYXfP
 dDcIpAXS7rLK4d6N+ECczTFpdo/hCcpqdHGbj7z8yXkfOsfw97yYXcGXI3GxXItyj1sddPFkOSy
 e3sDeFyKY65fGfUdO642uylUgex5XiBa18Rwde9M7ES4QQtJuZLga69CyXU+RveZhpQcLTxJ31Q
 dZp57B+GByRH9VSu749Zs9/AGVnK+eVeXcCZf2NYeGBvZ1We/wPE3kdIKcaL+uzhGd0nmHtHg/A
 GSE7gG0he71iCl544c7VLR8IXDO/SXtrVbOxIJ1Yz+2Ov0OuPOBcmqXHtxF+TKBm9ygSbZz6vGh
 0il+Cs2g==
X-Google-Smtp-Source: AGHT+IGpsti00UfEGZnroHZOXzh1GMgWfYHC33OCncNnks8jNmfXIYjSE/L4rhLmTdK39x0CIhbVuQ==
X-Received: by 2002:a05:600c:350e:b0:456:29da:bb25 with SMTP id
 5b1f17b1804b1-45b517b962bmr221060305e9.19.1756466922467; 
 Fri, 29 Aug 2025 04:28:42 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:16 +0200
Message-ID: <20250829112818.129101-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829112818.129101-1-titouan.christophe@mind.be>
References: <20250829112818.129101-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466923; x=1757071723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9g8iPCMVpmZMywmx/MQRQlJ7QE3WYBDcyKgVddibOI=;
 b=KYZUf6phuB2iYKSlRjYvlWFoNmn+1Fge90bKPVPtpQ2KukwrHmmBnLUtGgmbSteN5/
 vfeCZz6kvJhHTdRu2Yw1mHW+G3BVY/Fi5Qz+b6BOTQkVS9S2Yt6ssTYZNDcf47Wkd0D+
 XA4tfjQs8KSxCYV9G1TkL8UMNNCX2NRmYa0eJDvSi+iu/qpT+q9L832dBmbDqpuQnb3X
 OlKbk9OqKG2TMsFVkzCcFQmNZoa0pCjOc0GbZ+pQ7D34oAADZ7cxpM+iTQgvSEPzTm/P
 w4APsoJmCbM2lxK8uVAqcYzAEAHQcJZvW8L7K6j99I6ZZIy7LbMm7fZb3XSRIZGzhN8v
 /3MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KYZUf6ph
Subject: [Buildroot] [PATCH 3/5] toolchain/external: remove Linaro aarch64
 BE toolchain
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
 .../autobuild/linaro-aarch64-be.config           |  3 ---
 .../autobuild/toolchain-configs.csv              |  1 -
 toolchain/toolchain-external/Config.in           |  2 --
 .../Config.in                                    | 16 ----------------
 .../Config.in.options                            |  9 ---------
 .../toolchain-external-linaro-aarch64-be.hash    |  3 ---
 .../toolchain-external-linaro-aarch64-be.mk      | 16 ----------------
 8 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/linaro-aarch64-be.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0247b5c138..29650de84e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
+	bool "Linaro AArch64 BE 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro AArch64 2018.05 BE is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-aarch64-be.config b/support/config-fragments/autobuild/linaro-aarch64-be.config
deleted file mode 100644
index e075fe7eb0..0000000000
--- a/support/config-fragments/autobuild/linaro-aarch64-be.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_aarch64_be=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 5c2f4c673e..87c58946bc 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,5 +61,4 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9abd77302f..007d91d451 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -13,7 +13,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in"
 
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
@@ -106,7 +105,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.op
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options"
 
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
deleted file mode 100644
index 295a8987f1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
-	bool "Linaro AArch64 BE 2018.05"
-	depends on BR2_aarch64_be
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
-	  Toolchain for the AArch64 Big Endian architecture, from
-	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
deleted file mode 100644
index d44750ff08..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64_be-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-aarch64-be"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
deleted file mode 100644
index 53b6966e7b..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
-sha256  277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
deleted file mode 100644
index 7a01151bf1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-aarch64-be
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)/aarch64_be-linux-gnu
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-i686_aarch64_be-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-x86_64_aarch64_be-linux-gnu.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
