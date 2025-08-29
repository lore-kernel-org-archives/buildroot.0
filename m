Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C4CA1000
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE1261600;
	Fri, 29 Aug 2025 11:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TysCemZj6LO3; Fri, 29 Aug 2025 11:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC93F61603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC93F61603;
	Fri, 29 Aug 2025 11:28:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1134869
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34262418ED
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzqxbG_KHBDE for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E50FC418EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50FC418EE
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E50FC418EE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so2308675e9.2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466923; x=1757071723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R42Z/6WC+EP77sp7bw2CQ/7HuwEy3m+yQ6Z4GO7Dp7c=;
 b=JYZ9iXfwQ7LUfMEvCJZCXV7hD7i5Tyq/dgY3YYTZujAXgFl0HIkdNEqhmw5sh5I4z9
 rfYcwStQKwMaCh9FoMZVJwbW7HO7AOaHqIjGA0iw+f/bHJdOYPd4Pdr/05bhCom/bR02
 k05tKbu/1h+ilVur6kzMSSHdDQYDIwxggPVJTZTQc0xKH6zFr0wHg+oIQVh2qeXbAiTi
 WYgxJMKaCw5vLSLw/mXVtizDswn60Ii+9iCt4ihN4N2+X0hPDQTTKNUY/z7YjLyKcqV+
 J7dfPhZ7BusD/m40V+K1dce5i6ud97fBWhn6gtW3szBLrQXoInDSj3NvV9pf6AcXGw1g
 aZ6Q==
X-Gm-Message-State: AOJu0Yyc9GjvTSEepmv0shvDgzl16K+b0sA8YkC8/llH83EJIFipnppZ
 n2z6qWK91H4mDjM6pb6AicXDDQ/J8UDoWlfehXhGG8/G6IWa55iQdiwwSi8eECPk1Z9U5JAFeyt
 ZvTfEGwKfNGn37TQ=
X-Gm-Gg: ASbGncufo7slCbcuPDB8jHmjVaeoRjht9iKiturIM16mFYHgpAHPeooJ9wm039/oRjQ
 y97uQG5mWz4bX0vu6mlRc/fwqh/pJiB9IsFEoQMIrN5qXiekcJigPdtilqK7+TPbFasMSShI/Lp
 FxX5NCqvWNRRm7KwwZZO+5PEU7MhWtKve0aD4iLliT5hyLrRiLaypdXoMyRNKI12l73fJAFgkqv
 tPChg/h0xOdPwI3jp0JzIHZ4DD8XaIlwf4HhF1sKnY/cL7WAqqZPwUKXjyXUG875lphO+EjNOPb
 7W/p0JKW5ZxTdIVutlbQwIq50/7ZMX7SDJ3brS5aOSxkR9Gt9UXTHleLpB0a5hCcklQq48OIaVO
 HZJ8WC57Z/Ua9Gqc1JRzYv4pnWCeM58pTEm4kE5qYelfpJUdPlbkKTo+V4Vcm96M2brIGa1H+vq
 H1kQs8r9tghWODc/CI
X-Google-Smtp-Source: AGHT+IEcc/Ll5v2IVi0GNAYHnqu5nL5U1RxcC8rKb3mGA4u6ulS+cQ0d7IqIb5dWX0v8Fiq6YGILAg==
X-Received: by 2002:a05:600c:3044:b0:45b:7d77:b592 with SMTP id
 5b1f17b1804b1-45b7d77b91dmr25146125e9.12.1756466922942; 
 Fri, 29 Aug 2025 04:28:42 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:17 +0200
Message-ID: <20250829112818.129101-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829112818.129101-1-titouan.christophe@mind.be>
References: <20250829112818.129101-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466923; x=1757071723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R42Z/6WC+EP77sp7bw2CQ/7HuwEy3m+yQ6Z4GO7Dp7c=;
 b=NP0D9Y0RBH87DXoGVOnstokw/i6oBMLI4j9NyuQp0xxBcGEwJk+yWPhQFHwrC58bXa
 6DdAo9kZpndMbFkRkmogD6Og6xg3vM8DlxEdEjmZsA73btqWY+Th18b0Rn2iA01v8KCe
 fFqlvPwqI3fgg7sd8wxCFVse7V6iCginxC8f8OcrG12hh1UNFggVTQOghXwFOQo5d02n
 LDmV1BoosS1RebDRgylYka1Px321evnOv58TWTwD5Ue+wcYf2eUEd3isSGu1dsAr36nu
 h6UJqp9MnWkvj2Oo41qC8KJLg7UAggq8OfUKjSPAWCcujMiFhG9fyZ4emo23ZE6FW8Lj
 ysig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NP0D9Y0R
Subject: [Buildroot] [PATCH 4/5] toolchain/external: remove Linaro arm
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
 Config.in.legacy                              |  7 +++++
 .../autobuild/linaro-arm.config               |  5 ----
 .../autobuild/toolchain-configs.csv           |  1 -
 .../testing/tests/package/test_gst1_python.py |  2 +-
 .../testing/tests/toolchain/test_external.py  |  2 +-
 toolchain/toolchain-external/Config.in        |  2 --
 .../toolchain-external-linaro-arm/Config.in   | 27 -------------------
 .../Config.in.options                         |  9 -------
 .../toolchain-external-linaro-arm.hash        |  3 ---
 .../toolchain-external-linaro-arm.mk          | 16 -----------
 10 files changed, 9 insertions(+), 65 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/linaro-arm.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 29650de84e..1c98a0a7e4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "Linaro ARM 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro ARM 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-arm.config b/support/config-fragments/autobuild/linaro-arm.config
deleted file mode 100644
index d72e19b3ad..0000000000
--- a/support/config-fragments/autobuild/linaro-arm.config
+++ /dev/null
@@ -1,5 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_ARM_EABIHF=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 87c58946bc..a559221b99 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,4 +61,3 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index caae3e6b2d..501d00ce73 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -10,7 +10,7 @@ class TestGst1Python(TestPythonPackageBase):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_ARM=y
         BR2_PACKAGE_GSTREAMER1=y
         BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
         BR2_PACKAGE_GST1_PLUGINS_BAD=y
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 27dfd68500..78ae09303f 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -43,7 +43,7 @@ class TestExternalToolchainLinaroArm(TestExternalToolchain):
         BR2_arm=y
         BR2_cortex_a8=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_ARM=y
         """
     toolchain_prefix = "arm-linux-gnueabihf"
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 007d91d451..2599015d4b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -19,7 +19,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
@@ -111,7 +110,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.o
 
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
deleted file mode 100644
index 8b3b4c844e..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_arm
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2018.05"
-	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2018.05 (based on gcc 7.3.1), Linaro GDB 2018.05 (based on
-	  GDB 8.1), glibc 2.25, Binutils 2018.05 (based on 2.28). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
deleted file mode 100644
index dcbc6599d9..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arm-linux-gnueabihf"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-arm"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
deleted file mode 100644
index 7169e0b936..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
-sha256  7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
deleted file mode 100644
index fda356bcea..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-arm
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
