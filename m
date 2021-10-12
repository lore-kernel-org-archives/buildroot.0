Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB73CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 537E860E74
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 537E860E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E12FE400AF;
	Tue, 12 Oct 2021 17:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_1AefzzERT7; Tue, 12 Oct 2021 17:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A639401CF;
	Tue, 12 Oct 2021 17:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8221BF304
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A938060BB1
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClUYQXG6hJ1U for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 17:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0962360BC1
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 17:18:15 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so2390675pjc.3
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMTOPgBF2Zaw9h2K1BEKNtlgHjD+/vSCg7E3/oRdqUI=;
 b=Zqvr2TESxkAE/uBBwHV/QhuEMpDHkYsWQN1BKugiprgPek9y3xHS4p2FvHxChnrpRi
 k2zxv+jTyCEPdQrVlBLM2+sELuDtCWmH2vlkMAb540OY9KFVEfFvRb6sW9WrBt+ICS0Y
 sqhYEkfnI2aSDvEAKuGxdd6lfm6AUUI/PjHPKJhaJPAc6ddBAtUJ/tYCvAoTfCSMqPXy
 /jAWDMbDaEmUXUClVE15yXvoFiBAl3297g2vXbhfuHch1QAUq2kWVz5n58o1qyzVjvox
 HPXkDkgCGJtyBAkA5eFcuPluBc/3uOYwNWwu9+doKEvds8tKsV9gS4p42AoTrqo/4dAr
 Iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMTOPgBF2Zaw9h2K1BEKNtlgHjD+/vSCg7E3/oRdqUI=;
 b=Ln/Nk+KSe6yeQjsJ99kI11uBy2ojDvy3D+wm9nxp6mHSF4isenIaxcCsklQbNIHlVQ
 LuKF5eQll8Z45ZZaPIYO2mHxrlVfZX8sHD6HHHoaEorUaw4XakOE0m24uf091zdQvgQI
 X72v6M5zLRgHI979dHK0mabsekrWjQ5ylsk/pHHlp8HpjOtn+R6ewH0fj2boyNVWOUat
 l1mxqjiqTJR0DdQPIyIQp3u2JL/AodW7ckbgCO0lxEUmKJj9z9ZANPZNL4ERDPA0/Gh+
 ifiUiVbrOEZdR+7tY8jDblpBz/oFkieQGSyKDj0GgrlTicUOEDw9Tbz1ayjtrzw8qHVg
 JGTg==
X-Gm-Message-State: AOAM532T+MHrqaUaV+fKBnzn0Jr56HIh1igk8e7kR80w7e/KCdQvIDu8
 91uO4R6i8hCnS7++Kw/qphx+oNIDqNM=
X-Google-Smtp-Source: ABdhPJwiOJS5Vjk3cwQWcqZkI8OGr0WXgnHelYkryTZsWaEOUdb03kKToxlj48r2UrxPLmsSRJSghw==
X-Received: by 2002:a17:90b:696:: with SMTP id
 m22mr7563593pjz.108.1634059095195; 
 Tue, 12 Oct 2021 10:18:15 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id k129sm8522861pgc.20.2021.10.12.10.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:18:14 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 10:18:07 -0700
Message-Id: <20211012171807.691567-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.59.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a regression introduced in 0.59.0 which prevents gcr from compiling
UI support with the following error:

meson.build:225:5: ERROR: Tried to create target "@BASENAME@_merge",
but a target of that name already exists.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 9bb7ec9f40..f3cfe66072 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.gz.asc
-sha256  e376c298df64b643dfe01eccb2d7b6f1e02e95aa38c19f19d120d129612ce476  meson-0.59.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.59.2/meson-0.59.2.tar.gz.asc
+sha256  13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49  meson-0.59.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 134411625a..bd03a7cd67 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.59.0
+MESON_VERSION = 0.59.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
