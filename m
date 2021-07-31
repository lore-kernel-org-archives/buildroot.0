Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A3760E94
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A3760E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A4C607B4;
	Sat, 31 Jul 2021 21:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5VCG9glJoOf; Sat, 31 Jul 2021 21:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D756078D;
	Sat, 31 Jul 2021 21:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7131BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BA336078D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9czRYHNnHP_b for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 21:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A6A60716
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:22:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso265791wms.5
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b3TgwoKb576B14Dhm4ZXlnbZioDA+W00nZjf1NMMI9Q=;
 b=bKclEBhOz94zAvPUYUudu5qY7mB88MlcRaDdut/e+geRT+TYph3HNZ6usNz33Md5Bp
 FsJDLIntzFp2VQpP/2Q+onl/zgeVxm84ur4ls90iaLruGTKgTOein2B+jFoHZk7sUNPW
 cNVc6OqNj4f81tw9GNntdP4r3dSEqT4hauOaprMtG7gO4r936FLe+v8LnKSbOWNS1Jr7
 i7GOk3HEjl8Y1vdG9BY5Cpu6pkz+/s8LrnD7HgcC9Ihp5D9hC6XkNs24VsS4xGIT1Fop
 m7POWUrrD47iovcYH9qbRE4339ryD6bJWIpVNSbims9LFKVrlneLdfHWXodwDIhIKYCK
 Zqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b3TgwoKb576B14Dhm4ZXlnbZioDA+W00nZjf1NMMI9Q=;
 b=dS0qx1kf5kool+cMVvUjq1tI9WRwQrRCpwq2Gzvj6x8dnYP9GyxWOLWA/tDFFix6kI
 H/bCqT3FHbBNKqpt53f5xb+esFduYdM+AVFrLqULJqk5XxJNcMEN3xv/oD/AYmV1uJiz
 cQ+97QOW+a9vjMaWvobvlF16jIVs2ng0elC+bToy7MsOa5tBoHZDVHZnpzUeYEI1D3KF
 ZNOAJ1FNc9zLPnCgH3aTrjR/E99gySQj+Qu8Yyl6DZ5cEaI1kcv35YVHJu+OyuJNfGlM
 pGK8THH5gceahfUPU9FX9VNcAYo3GQPCCcoZKO345x8zhhsvg+ygHD/TobgVFCoAR6ae
 bRmg==
X-Gm-Message-State: AOAM532RJ9hBRLrysJawjxIJ6DNJr94bOk2WD2r2VjiYjpcTnnTHz+UM
 cnN6mrDiwKzsaz2xfqziwnjzF/qgTqJ7RA==
X-Google-Smtp-Source: ABdhPJwPKXDe4brDKauk8YZ61/eYByEE4VEwwE+peeqrirkShnv9ayyay8TZqHqOjeMRIgM8p8X0yA==
X-Received: by 2002:a7b:cb19:: with SMTP id u25mr9505772wmj.25.1627766537861; 
 Sat, 31 Jul 2021 14:22:17 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id j36sm1036806wms.16.2021.07.31.14.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:22:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 23:22:08 +0200
Message-Id: <20210731212208.1742425-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump to version 1.6.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This will fix a build failure with gcc 11

https://github.com/dgibson/dtc/releases/tag/v1.6.1

Fixes:
 - http://autobuild.buildroot.org/results/59305de179a5bde415cfd42d75e005b36b7ec4f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 902ce1baf9..29b7e0b121 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  10503b0217e1b07933e29e8d347a00015b2431bea5f59afe0bed3af30340c82d  dtc-1.6.0.tar.xz
+sha256  65cec529893659a49a89740bb362f507a3b94fc8cd791e76a8d6a2b6f3203473  dtc-1.6.1.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 749abc6cac..53f9c9c8df 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.6.0
+DTC_VERSION = 1.6.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
