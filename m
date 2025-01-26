Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAC4C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F32404FE;
	Sun, 26 Jan 2025 15:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13l0AqbqUPlb; Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD1A40500
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD1A40500;
	Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9CDF94A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4E7C40F82
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzcVYt_koqTQ for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6157B40F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6157B40F4F
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6157B40F4F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:43 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3ce873818a3so33649605ab.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906462; x=1738511262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNP9hyU11n40XQ1qIoQ5mxNn/Ot0GMzxRNbl5hJGhSU=;
 b=FRIOXxgZQDGrLaTvBCs6vGW/pI4/JO0GKHEopQYvNUAVeQrw83H1PZjt0ZalfwPh+b
 5yw2FfEtdppsMCc7DBQpgiyim0NhRxhf+tuP3JaNfGxUMvNo+deJBkChDG+Tg6LIryBs
 +YdKdd/sSQP94+oBvDZAgOqDeEC1iIUNqApwJhNyZdByqkVZKQ3/RDxx+9ZxuqpKFPUX
 67B9aKMx5KSYTuQ4b8XGMZzxECE5SDUYjKGWwP6GjzpsQIf9GxLNuTvSyEWT3hr00m5H
 IpG7Ag2Kt7gYKOAtT8ThKDSWfEDArv8S3CfvkOuyo8BDGRAqjSsd5Fg2EyUs27Equ8q4
 Qu0A==
X-Gm-Message-State: AOJu0Yz/hAoIGHnPORsv0i9DyneUn/VSDVCKWFfjuFCzmtZhigK3kibU
 940bwXRs5XYVv/dfAbxAP/9BtrSQTNGQtshmr8eYKLtcaJXXMFPf1lRw4r/5
X-Gm-Gg: ASbGncttAWB0jUxuLm/Q8rvlzrW1/ROeiyezXcf/iymkkJwe1YoOSWK1LgvmhcXHpQe
 wZjTVBMMqxP5YhzreiZOQEPJPjYcFXQ6zjkqwosKiE3zKpdgG4McPpAI9VwwEmXRpOF70jWYNSA
 loFNFGBQdHb8ca2s07j/rMK9JMmb5hmg7XYLawcM7bFZ4hz2SIvuoivq3XXdr7EkxOOF1R9NaSH
 HxIKGRyUwzWsvKgePvDN5ivsd3bAgY/jlACB0UfDvDqFLuMWNyfH7ESF4K+tL3rBdo5dA9dlcrf
 DC2rpb2fW7qzYip2uZCqlfEdGSZF1b7vMDdLlXxSZlHqfMkfjT7AxZ0=
X-Google-Smtp-Source: AGHT+IGGtnZC1ci0tBnt+KvwdLIzEB9bJzAlQ45viQMq95v/hKj/l2qU0cn2uj+2ogAG1VTHcANJSQ==
X-Received: by 2002:a05:6e02:33a0:b0:3cf:b5d2:cf44 with SMTP id
 e9e14a558f8ab-3cfb5d2d4afmr170262135ab.15.1737906462174; 
 Sun, 26 Jan 2025 07:47:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:24 -0700
Message-Id: <20250126154732.405055-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906462; x=1738511262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNP9hyU11n40XQ1qIoQ5mxNn/Ot0GMzxRNbl5hJGhSU=;
 b=Y9W5CTFWzJE0VqySXOz3PhQ31uIiIm60g+MvhWrk4Cb86t/4jI2FK/VqObERZQJFtf
 NQNQiVTIWVXJedadEZXyFuG4DKd/gph4O1XYutukM2DmAnmlEEjCaovv8DdTu8DpZ8Mv
 oiL7zJadaWbSG9ulr40b4mmXMendFHFqALwnkI7+zA4cHzfY87M2LD4luhjiY8eLsCk2
 AbiOT7Jp5rU6TuJxo6F7nBm0N28JR/pU/yaq5cTAAoiHzWT5WxsFLYo5ifFQQInAqZHS
 YpzCXTS+Qk+u6v9O7HjliWcYfd+IMClr81cpLd8vYhgo0gBGKgHeSPO4cwsLyuEcPTqH
 V3Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y9W5CTFW
Subject: [Buildroot] [PATCH v7 02/10] package/ruy: new package
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
index 0c741ee2a3..75c4ce2990 100644
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
