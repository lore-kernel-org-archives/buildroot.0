Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42155C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE72081815;
	Wed, 23 Nov 2022 19:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE72081815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbM2730Xc9x0; Wed, 23 Nov 2022 19:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E215B8175B;
	Wed, 23 Nov 2022 19:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E215B8175B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B27581BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D39F4181F
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D39F4181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOc9S7qHanta for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:58:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FED541889
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FED541889
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:58:30 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j10-20020a17090aeb0a00b00218dfce36e5so2388738pjz.1
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAia/miXQNDnqsQoLxmMX9mTQig9ivUuDvtCcNjj0v0=;
 b=Sxb0H240LV9NMMvQOKF/Hd1Euzxnov/GOUFOYQ9bF2iydSUu9tzCSpr3jLWjf8OdZ5
 4JHIDrR8nAzeakQI3uA+jQXNiHJqBQ0auy1DYpJthMe+PqlwzjnZprYWWeUbzeo4+Fan
 bo5dkayTesLofxopZKnlINNHi8nEolizjdXpRFH2XVQ5SQ4mb31Ut4zz8E0R158+8iit
 MnvnF0XHLaRaODrMvqqc96YM7STd8EjrMw8vKV3tE3ZTHGCn1Y17uOcIQ96wmKMv94h9
 BXK8SehGrPW5bOulYUX57gpFOPR89fM4da0pXxerFySvrDU10GSbsuLIcP2YMAF81R1S
 M5mw==
X-Gm-Message-State: ANoB5pkMhi0r1S6Y4C47BrqwMXbbqTcmdJqxi1k5w+rW/ikiG/yrvmj9
 XD9tlMUA28pAN3PjVR61qX50aEgemkvDWA==
X-Google-Smtp-Source: AA0mqf7jOTbeaVkuZR/9n+A1slciZnr+YV8qhzSvn2Z8LUIbBV/GcOalf1o+SZbuaK//+Dcfwu/vuQ==
X-Received: by 2002:a17:902:e807:b0:186:fb90:5774 with SMTP id
 u7-20020a170902e80700b00186fb905774mr11055652plg.137.1669233509168; 
 Wed, 23 Nov 2022 11:58:29 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020aa7842f000000b0056b9df2a15esm13124508pfn.62.2022.11.23.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:58:28 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:58:13 -0800
Message-Id: <20221123195815.1583545-4-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
References: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAia/miXQNDnqsQoLxmMX9mTQig9ivUuDvtCcNjj0v0=;
 b=A8RqSZ/z42wQZYi0DscACG073XDoD1NL8ZvTWFzAyHm5WnZEGuJbQ9XSrEj5zArCdf
 V3wBJlil6jBlFNzn+ii7sDNZXIoNDb1o/2znWeo3Y9vj+UoDkHVFUgDRFbDDRyGH8mYE
 RdzUMgSOm+c6AQGiPgu00m/LXpCq5JosDbijo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=A8RqSZ/z
Subject: [Buildroot] [PATCH 1/3] configs/nitrogen*: bump kernel revision
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

- Based on NXP 5.15.52-2.1.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 configs/nitrogen8mp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index e302fcbba5..2e25a2011a 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 6f7c3bbe99..aa3b8b912b 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -35,7 +35,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 1efcdf6071..4df3f47b4b 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -35,7 +35,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index a6a9526dee..226ded6208 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -50,7 +50,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 0130a6a62a..dd97f79f7e 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -50,7 +50,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 50976959c5..27a374e485 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -50,7 +50,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index a14a024353..48749e2a1a 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -50,7 +50,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/5dcbb9a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
