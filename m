Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A5C02190
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E2461050;
	Tue, 28 Jan 2025 17:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39xctvDoF4xx; Tue, 28 Jan 2025 17:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B929C6104F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B929C6104F;
	Tue, 28 Jan 2025 17:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F5DA2019
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 256CF41435
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7n0BezvIRNAb for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD2AF41438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2AF41438
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD2AF41438
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:03 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-851c4f1fb18so148758139f.2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083722; x=1738688522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEHhyLoCktbajdorTaSL8woaPUhwzhLcFXwBux9IrKc=;
 b=nXhtFi2ND6cACoAK8qccGmdvvITrNp4KsQtU4w29d/IpUTBp9wCl/F6RH+AaTapEGJ
 Re8dyXFIf65NluvtpbCHrHNVvBmV5vQ2082KlKhpDPvYoWqrJvSnSO7d3Reo36hOqrYG
 R+K9nEta0upNzFDNLcvSUL94tkLcsSeOR70yv9m/MAxeAeBX2hB4eJUAkuyaRu1Xwa94
 124nEa58iX8Zvx0u5uXiB/zS9ftX5aXB+1m+hcl0axH0j7i7suTDGqJ5j/Z3n5MLd7/C
 HgW+eLrho5GmTEKqJxMkNXyXDzXQdFIkK2yegzSL+8O8w/5WvQngSyMemKYtTBPFg8BY
 aAMQ==
X-Gm-Message-State: AOJu0Yx7d/u6KXEBNIdd4TpLLOzOwYRSvKolvTOvnLZg6Jv4IfoG8Wf6
 BHftiS11tCJZBC8/x0Q4Gf6BnTDW2Lo9P1vFuL1uAy75OapfQF3XYFFmVdac
X-Gm-Gg: ASbGncvenhjsiG66YyIpRq7DW8xwpvPod45RPCjqoqLl1gCxsXg+4U1aSfY8KHWlpq5
 G2DaxC40tQR0ceWcupaYpv4QrK6jSURU1u4MWqp5qivWs3rTgHc3FGMEBKOutQ+TBLc98TFKrGE
 gAje98dloesgP4JMhYIoym4kawIlDPmSbfhxjic/hm9OoDhENVOwqEPofiDnGqcQSkf9ZHNO4Zb
 nBbRH9Alb43l79e2//G0F8NRQ228QcQl7ANFOUuTbRQ09kbGC4M4mXjK82Tf4vkE12+H/AauuM2
 aP4FeGFPN1pUtTM44z4/29kAYr6ZSjpJf64Pl6mOgKF7elIKbA3cLpJe5jeQ5if1fA==
X-Google-Smtp-Source: AGHT+IE7VdvfA013zKfUBk5eD558qWG8PE7L9jl2vW2Z33GffDZzF72o8G8FPl+Sha5Jcl2KheMIRw==
X-Received: by 2002:a05:6602:3e85:b0:834:d7b6:4fea with SMTP id
 ca18e2360f4ac-85411115a07mr4310839f.6.1738083722246; 
 Tue, 28 Jan 2025 09:02:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:02:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:50 -0700
Message-Id: <20250128170153.2298242-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083722; x=1738688522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEHhyLoCktbajdorTaSL8woaPUhwzhLcFXwBux9IrKc=;
 b=ReoRvvvrubtIs2AhM60kMck+z2g2sUr1sAjuC4YUj6Wrjy8SW/+N4UGjEls2S09EhH
 tsZya6rCozEyajJbv8NFgBi6rbBOArqEdmBd6KOh31BIiGkRvzfEQVAJ58/BLIc8sYfA
 rsPKd1jR/G/8it7vpPKaxRtGuqIfvuQAddIz4ab988v09bXgsKtD6ud8d9UpwYtFqT+Q
 S9e4Q830JaOuWnxS4L/MDhdfiVMBiyNpMzfX8Of2rQsfN0fqi10pufgJ6TukwF3FDgZ4
 LB6IbPoQol5+W3UFHamERnCtdwLOY4L8pIDJwNR/iuQxWajTSdI5gbgZFlBuhdDAYdT4
 /gbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ReoRvvvr
Subject: [Buildroot] [PATCH v8 07/10] package/xnnpack: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v7 -> v8:
  - update to latest version
  - build with PIC
  - disable broken arm32/aarch64 architectures
Changes v5 -> v6:
  - add architecture dependency
  - update to latest version
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/xnnpack/Config.in    | 25 +++++++++++++++++++++++++
 package/xnnpack/xnnpack.hash |  4 ++++
 package/xnnpack/xnnpack.mk   | 21 +++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/xnnpack/Config.in
 create mode 100644 package/xnnpack/xnnpack.hash
 create mode 100644 package/xnnpack/xnnpack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a5d0b2ddb3..2be4990676 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3039,6 +3039,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/xnnpack/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
 F:	board/freescale/imx8dxlevk/
diff --git a/package/Config.in b/package/Config.in
index cccb95b869..74cd3e9815 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2318,6 +2318,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/xnnpack/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
new file mode 100644
index 0000000000..e4b92f61e8
--- /dev/null
+++ b/package/xnnpack/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_XNNPACK
+	bool "xnnpack"
+	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_FP16
+	select BR2_PACKAGE_FXDIV
+	select BR2_PACKAGE_PTHREADPOOL
+	help
+	  XNNPACK is a highly optimized solution for neural network
+	  inference on ARM, x86, WebAssembly, and RISC-V platforms.
+
+	  https://github.com/google/XNNPACK
+
+comment "xnnpack needs a toolchain w/ C++14, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xnnpack/xnnpack.hash b/package/xnnpack/xnnpack.hash
new file mode 100644
index 0000000000..576b73aec0
--- /dev/null
+++ b/package/xnnpack/xnnpack.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0ed35a104a697abbae72b02b967e057883ff57b388178649c453b68cffb81f72  xnnpack-d7f398ee5e135ef4f7045802eea973cc6cb26c6c.tar.gz
+# License files, locally calculated
+sha256  63f519e15726f4c4f830bd958f694c84fecb4e0a4cacc527d2696bb71ef95ada  LICENSE
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
new file mode 100644
index 0000000000..bb53188f9e
--- /dev/null
+++ b/package/xnnpack/xnnpack.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# xnnpack
+#
+################################################################################
+
+XNNPACK_VERSION = d7f398ee5e135ef4f7045802eea973cc6cb26c6c
+XNNPACK_SITE = $(call github,google,XNNPACK,$(XNNPACK_VERSION))
+XNNPACK_LICENSE = BSD-3-Clause
+XNNPACK_LICENSE_FILES = LICENSE
+XNNPACK_INSTALL_STAGING = YES
+XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+XNNPACK_CONF_OPTS = \
+	-DCPUINFO_SOURCE_DIR=$(STAGING_DIR)/usr \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DXNNPACK_BUILD_TESTS=OFF \
+	-DXNNPACK_BUILD_BENCHMARKS=OFF \
+	-DXNNPACK_ENABLE_KLEIDIAI=OFF \
+	-DXNNPACK_USE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
