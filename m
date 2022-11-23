Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A448C40C3F;
	Wed, 23 Nov 2022 19:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A448C40C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEdavipCtG5C; Wed, 23 Nov 2022 19:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF79140C28;
	Wed, 23 Nov 2022 19:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF79140C28
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ED521BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15F1F40C28
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F1F40C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04jZNW5yBc6l for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0148840610
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0148840610
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:58:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y203so18312559pfb.4
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhgurvDgKb9iIOMBpNdpzmWUjgvxw7y9vZWq5JIMCXw=;
 b=7OS871ff0+x0rKdXNd08h911oa0qBvjDFWVy3u9+egtpSaXhy4t+lnSKuQEnXrj6FU
 PIP6CEfYp6dNPkBtSy+OevUCwl7imiQg1lcJFyUmBNvktCxLy26sngOFqynr/quE1xKE
 EKMOKjYapV+pyQQsn9BMOGGthCkhz+3mx5HQwJQiXNs9T3EBnGU9fhjVbMzaV0bUci1/
 QbU4D06l+IKAyPFRPC5KYBQjcZwcwzbuG/IGoag2Q6BqL4yGuFkZoqQ+x9WKaxzFDGoT
 4AJ4LaEKMDl4cgERsKFuRBjtCSMht7iiX3JxSL3/M2epyW50wt0faYJA1lqJu4U14ztb
 OKOw==
X-Gm-Message-State: ANoB5pnG+8tdYczDmdfqNk595ULAWYC6461b9gcWUf2zPLbu80ZT5a+H
 TjnukmD3+EgrzTaNIZNKyCOWUh1bRD5/kQ==
X-Google-Smtp-Source: AA0mqf5OFC/ID90FeuKO31OUDvdVICTj4GSFQhNv2okH53wExwKFAil0M3LqUXeCcAFGmBdiUUYtxg==
X-Received: by 2002:a63:117:0:b0:476:f43d:913e with SMTP id
 23-20020a630117000000b00476f43d913emr9690638pgb.386.1669233510794; 
 Wed, 23 Nov 2022 11:58:30 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020aa7842f000000b0056b9df2a15esm13124508pfn.62.2022.11.23.11.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:58:30 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:58:14 -0800
Message-Id: <20221123195815.1583545-5-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
References: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhgurvDgKb9iIOMBpNdpzmWUjgvxw7y9vZWq5JIMCXw=;
 b=ixREo8kM70hklIqiGKxAAu0yOD5shkgG99JmGOFtz9TNSPbhR6axLbfSS5i9+RyfnN
 7ts2t9XdAP3oDkJiRKT71J81ccF0qBqvooFexdZTix3y8yx2V9TJWnJR9l0o+UVHuWss
 1suPWpIdEUXFWNmVMO2f+vClopv3EXyAqe7UA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=ixREo8kM
Subject: [Buildroot] [PATCH 2/3] configs/nitrogen*: bump u-boot to version
 2022.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- U-Boot branch boundary-v2022.04 from Boundary repo.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 4 ++--
 configs/nitrogen6x_defconfig  | 4 ++--
 configs/nitrogen7_defconfig   | 4 ++--
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 configs/nitrogen8mp_defconfig | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 2e25a2011a..967d064f1c 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -24,8 +24,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index aa3b8b912b..1cded53765 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -23,8 +23,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 4df3f47b4b..d1e81d90fd 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -23,8 +23,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 226ded6208..41e2ddb79d 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -38,8 +38,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index dd97f79f7e..c20c64b121 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -38,8 +38,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 27a374e485..5a78df3865 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -38,8 +38,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 48749e2a1a..078476b004 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -38,8 +38,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mp_2gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_v2020.10
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1d21a3d5.tar.gz"
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
