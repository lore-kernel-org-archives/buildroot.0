Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4543C02190
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B29A83A77;
	Tue, 28 Jan 2025 17:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kr7owGvcB5ew; Tue, 28 Jan 2025 17:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C5A83A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C5A83A51;
	Tue, 28 Jan 2025 17:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E33431
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF0914142D
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcKzM64N9fAZ for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1C784142B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1C784142B
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1C784142B
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:01:59 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e06e5d11so154084939f.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083718; x=1738688518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zvCr8iW6ZvZijqW5VCEdsEcSqklJhbvEPhi8A2RFrM=;
 b=FJrhYiJ/H6UMzHuUbp/UFYX8o4raI9SmKx3DQ9GnmLyJGEYizO8QwD4x5Cb2+eT3Ya
 UMF1VIikIRopvYs4SN4St4NdSrt/Rhv3gfH45ath7MuOCNJaX7CCmLo2/luPIoee/rG8
 UL6TEJfIqKxAbSggo8aKZnIuUc1VQYs5DRC61E/gTMYBLGGbGLayVTbn0J4Ad/1vjCsr
 3x0tlEMTI06NzLcwdeYYwN6ABH+hRZ36BxwpBCsJwF8DRpLxVCcGbgYuVHl85ZoXLL+o
 eETNGBpTDBMI+7JNAe0P4Zmdy4AsINo+1LYgWGkIFk5I3UmF33y9r0eNXQ/J4ZN90PUe
 2V+Q==
X-Gm-Message-State: AOJu0YziinpmKPJFe9Ch9ZJhAtdetgdSDqMCa7XsqXfTnSONU6Olo9pN
 S82rKY2kQRHH4Lqyz9qAlxwSa8kQG5jW6vsJysX4z7XBQCC2dEmO++oeqPiE
X-Gm-Gg: ASbGncvbtZRau9biC5cCTGIwfVbjBkzZo1rCPbTG+mQi7+9mUv5ENKSir5JIL/pcmAh
 EwEdTxzK5IlMvJIQK3j4QzcV45W0VNaGfr0Z1N2IY+hZA/kVacL/dcitNKi4bV+R54pZdvFHjlv
 Tkf124uc/OemhF00yMz74KFX3JZTe3b3NSVRzboUf3hJ1ezG6HkMKg64WCZ2kb1DQC8E2+xkufU
 ur3zRUV5NsoZ4E4po0DmyeYbb3fJJN55Hy75/rpqLw+R9ftHF+QrtMoC0+Nhgm06itHQQggq8hA
 b7PPLVj9+ufM5nC1xYd7YzEyTQTSr0JlX9BWMjggPhn7WvLUTISnE1/4oBov6avuoA==
X-Google-Smtp-Source: AGHT+IEFE6eOyOv7uYH5vYYJgCSUQyMC0o1uFKayAmehRxLmYg2MBmwTL1Q7elO+Czc4g3xYv9jlRQ==
X-Received: by 2002:a05:6602:6d02:b0:851:f0be:9637 with SMTP id
 ca18e2360f4ac-854006df2e8mr5832239f.0.1738083716930; 
 Tue, 28 Jan 2025 09:01:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:01:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:45 -0700
Message-Id: <20250128170153.2298242-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083718; x=1738688518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zvCr8iW6ZvZijqW5VCEdsEcSqklJhbvEPhi8A2RFrM=;
 b=DXM+zmBgM1LpTmjhLXXmLCVN/MAXNVw3WscEuLZSTIxBRqCKwTRBt06lroiqF1y9Dx
 ZBSDF+p3BcxolAGQwxvCDgT14flNwvKjz6rIFW2mYHfYKpbmvCv8R+n9AgncrqcMlp6L
 QJ2m7MHYHNnTtPf6+v5JBBl0rwUYAwfQ8EGOagtq4M2DUUAem6gAEO8VphVXsFH3RNI8
 6shcUnz3FNcnPVMk9xha88o5o5LgllYvVnCyPw3OhpbDLuhGyphfnQejx6Gn6SMNmjCp
 80JKq3FC/f0yGwvNZEUTihhTx9iXNkSceDwepSxm/Yesa7225SgWRwCHnU+qIwV4up8q
 J40Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DXM+zmBg
Subject: [Buildroot] [PATCH v8 02/10] package/ruy: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest version
Changes v5 -> v6:
  - add architecture dependency
  - update to latest version
Changes v2 -> v3:
  - add C++14 dependency
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/ruy/Config.in | 22 ++++++++++++++++++++++
 package/ruy/ruy.hash  |  4 ++++
 package/ruy/ruy.mk    | 18 ++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/ruy/Config.in
 create mode 100644 package/ruy/ruy.hash
 create mode 100644 package/ruy/ruy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e33b20bba..e9e106e250 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/ruy/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
 F:	board/freescale/imx8dxlevk/
diff --git a/package/Config.in b/package/Config.in
index 70ad2af568..f982b7332a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2300,6 +2300,7 @@ endif
 	source "package/qlibc/Config.in"
 	source "package/reproc/Config.in"
 	source "package/riemann-c-client/Config.in"
+	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
diff --git a/package/ruy/Config.in b/package/ruy/Config.in
new file mode 100644
index 0000000000..cc137a403c
--- /dev/null
+++ b/package/ruy/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RUY_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_RUY
+	bool "ruy"
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	select BR2_PACKAGE_CPUINFO
+	help
+	  Ruy is a matrix multiplication library. Its focus is to cover
+	  the matrix multiplication needs of neural network inference
+	  engines. Its initial user has been TensorFlow Lite, where it
+	  is used by default on the ARM CPU architecture.
+
+	  https://github.com/google/ruy
+
+comment "ruy needs a toolchain w/ C++14, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ruy/ruy.hash b/package/ruy/ruy.hash
new file mode 100644
index 0000000000..159687bf04
--- /dev/null
+++ b/package/ruy/ruy.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0bd02bef7675d3edd8168e6e4ce22e162516947fcc07bb79809be4cda8f27a0c  ruy-83fd40d730feb0804fafbc2d8814bcc19a17b2e5.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/ruy/ruy.mk b/package/ruy/ruy.mk
new file mode 100644
index 0000000000..3e83553f19
--- /dev/null
+++ b/package/ruy/ruy.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ruy
+#
+################################################################################
+
+RUY_VERSION = 83fd40d730feb0804fafbc2d8814bcc19a17b2e5
+RUY_SITE = $(call github,google,ruy,$(RUY_VERSION))
+RUY_LICENSE = Apache-2.0
+RUY_LICENSE_FILES = LICENSE
+RUY_INSTALL_STAGING = YES
+RUY_DEPENDENCIES = cpuinfo
+RUY_CONF_OPTS = \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DRUY_FIND_CPUINFO=ON \
+	-DRUY_MINIMAL_BUILD=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
