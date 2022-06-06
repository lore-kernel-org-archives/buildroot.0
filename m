Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3BDC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 08:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5950360E8C;
	Mon,  6 Jun 2022 08:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv73G7IuuTdZ; Mon,  6 Jun 2022 08:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73DFB60E2E;
	Mon,  6 Jun 2022 08:51:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 679E51BF39C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5672E41620
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ee-TTRTQdvn for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 08:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5464541607
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 08:51:23 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so5239327pjb.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ErAmk+miLJw1gbYCuNd8wbWVydvR7FAMfdqzZ7GKWA=;
 b=MlZ2g57b6C1aALpQE0QPs9NuN70YLCHRSaCf5vdQuI1kvQlAPrIPQqAKAYOa50medT
 3+/Gm1mh9OEDXD74ycaIseeYvTfL0er4+XX0zbsZSAjP7n03nxHrwFdCtxfQDVBsSmIE
 KI540PaADTeG+D5USKxyzCdIsX8KJCY/jBdJuAm8e9Z6WLDDf1PIcZaXdn/H4Hu5lhk3
 EBpYnWzYBLz6yytNs2t5dydXEXtn6O/a7tkrN2GOMSMsAsXQA+USBAPDbvHtVwCMX0QT
 60Fcm8izkiYgNarBDlQEujiD4Q9ha7e89cx99yrd7+26B4E2WijEGvMWPFXTSXWBTGFk
 PYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8ErAmk+miLJw1gbYCuNd8wbWVydvR7FAMfdqzZ7GKWA=;
 b=HqvoOfdLk1e9HsZTY3ZosC3g3NALyn8ibn58gU/c+2YXqZTkJWR9JKQVJSoELTsCkm
 /QT8S9lQDFSaq+6G8pST4rMg4DzaDZMnfwJxleXrfw6rtsQx35M7jM6KcBIr9qLVTpct
 /4haWR/OwR3zRJ9seLWrDEffY8fGcc0ZzvFcmtgl0un6AtiMso52XUOYxQWpOMXGxEj8
 lTZ6XqVkTWSV1PtidmtDeFz9f4/tO6CS5cBpT995E2NlBj+uUvwOpKswbEs/kf0ILBU5
 y55M1ChIENCacHqQ8N3TJMSBTTuiu6VRIuzg811hMGv1FlXA72e8L5p81Rc3CqiagKAS
 NKhA==
X-Gm-Message-State: AOAM531u1IZdZpVHHJ3UeFOSyf7J8+5HpocqF+UwThFFnQcNcC3PWtG3
 Aa8T//b1OlKwRehSsiJkBvJoUhGpX0c=
X-Google-Smtp-Source: ABdhPJwnQNcsb8P1oB9pleRJzk1L4xpgAcQiDShDImM/070w9evJRr1UwmvNlmVAvD150tKExqZXtw==
X-Received: by 2002:a17:903:248:b0:155:ecb7:dfaf with SMTP id
 j8-20020a170903024800b00155ecb7dfafmr22945542plh.84.1654505481923; 
 Mon, 06 Jun 2022 01:51:21 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170903020200b0015e8d4eb1f6sm9975253plh.64.2022.06.06.01.51.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 01:51:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:21:08 +0930
Message-Id: <20220606085108.1628288-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606085108.1628288-1-joel@jms.id.au>
References: <20220606085108.1628288-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/powerpc-utils: Bump to v1.3.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v1.3.9 the package requires numa.h from numctl, so add this as a
dependency.

This bump fixes a missing limits.h for PATH_MAX when building with musl
as detected by the autobuilder.

librtas now builds fine with musl too, so remove the glibc restriction
for enabling that support.

Fixes:

 http://autobuild.buildroot.net/results/613ec647e251ac52a01f222044bd675ce36c1b5b/

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/powerpc-utils/Config.in          | 5 +----
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index d04d81c08acb..9034ea2e0fdd 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NUMACTL
 	help
 	  System utilities for PowerPC machines.
 
@@ -16,7 +17,6 @@ if BR2_PACKAGE_POWERPC_UTILS
 
 config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBRTAS
 	help
 	  Enable support for functions that require RTAS.
@@ -28,7 +28,4 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	  lsslot, activate_firmware, rtas_ibm_get_vpd, serv_config,
 	  rtas_event_decode, sys_ident.
 
-comment "RTAS support needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 endif
diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 8d0b10425b6d..b3c77fb223ba 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e3a21419863c08adde49f0795eff0fbfe4597ce82593fa5fe1f1177913fb7b9  powerpc-utils-1.3.8.tar.gz
+sha256  d64d9016a3e63a1e44c6e0833742cf964ae6bb1c6a9c7f0c7c5748aa335dc3db  powerpc-utils-1.3.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index b12194ae8e73..19fa84946c91 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.8
+POWERPC_UTILS_VERSION = 1.3.10
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
-POWERPC_UTILS_DEPENDENCIES = zlib
+POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
