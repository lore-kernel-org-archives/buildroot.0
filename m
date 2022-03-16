Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8650983F14;
	Wed, 16 Mar 2022 21:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ch3pvWEcOSnL; Wed, 16 Mar 2022 21:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9868F83E61;
	Wed, 16 Mar 2022 21:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C82791BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B422A4031D
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qw6tZIE1R2wu for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:24:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D001C401DF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:24:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t11so4756194wrm.5
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNM5PqdO7rc5J8c5Z2A19Wgj0G2FFbpTbq/ko4qI0Zo=;
 b=b7R/eNnnW/18v4kaqdYFuyBI01z4DLAkC75xFx7pWNAhvedfJV7/r+J5urOmxbkXFO
 WnbhydTw4HIPWhdSKY2DIGQauch/R6tRhQgpNCPg4P8kI9ZRMKrP6U3Fttk7aJZi4u5f
 /okYgy1KVfO8TjWNYzSp3cwTbpScSOSqjNg1NfeDHZPuQrOYjKGSggbXvKcta9UBB/n3
 hN93KGIkBBuiqTB6UT4fHnC0QzQevTLpOv/tx4cPYs5CyIgdx7We/knHhKavaEn/2l6i
 +UxdZk8os26ERSSPk9uwPZPvxAD062XYnsIvO+DVvG6T1Qgp56dFIg9nddkNADNJEU9W
 2A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNM5PqdO7rc5J8c5Z2A19Wgj0G2FFbpTbq/ko4qI0Zo=;
 b=5xFgRWiVfpEECT0C6ZalXtSvuoL22imd5S/0z22wjwLw5GM+/o1ASQnDdh1+tC7yZf
 yJpW6cTLmgd9VoXe0Fa4VYpdZRrkXQ8sYEYqUIZewReRkRiUDE55Ln3m90NnqdYG/PeF
 T+9L+jp/dIiegPJr0dWpEOErnRDMvBSjZ/REKh5x3M+Tw/Tok3/bmVIaDyuxnXI1PJLr
 egsKfpbK2Mbo4W9pYNVHwXhp/zxE/H8ZRkGlC79QluaQxWTrwQlgrXkhFUkDHB0WzcLp
 4tJ+Kbnp5E4/oqzupwOIDLmIDZEv8DklMK5ITDRufKYzhk3m5qLRzhV8Haw6VJdtRBRA
 4H7g==
X-Gm-Message-State: AOAM533+aIlkZi6ieYVexzldhjNARCk94MZ3E98XmQcsUF/TQV3cAjBA
 xrvNY88/2/BAMHEJKkWZvtuxz7Er5bg=
X-Google-Smtp-Source: ABdhPJwvYTJb/et7FGCQtiLH5aFqqbJSc+eAyedw+UiGUtai8gejsJvs9BJIVnQsw/pkAngAFKifLA==
X-Received: by 2002:adf:ab06:0:b0:1f1:de8b:ecd with SMTP id
 q6-20020adfab06000000b001f1de8b0ecdmr1409141wrc.156.1647465840869; 
 Wed, 16 Mar 2022 14:24:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:24:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:18 +0100
Message-Id: <20220316212220.3437314-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/zynaddsubfx: fix alsa-lib handling
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

alsa-lib is optional, not mandatory, since the addition of the package
in commit 18a863063735e2c658fa6947a4e540e9dda6c431

Moreover, alsa support depends on BR2_PACKAGE_ALSA_LIB_SEQ (otherwise,
it is silently disabled)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/Config.in      | 3 +--
 package/zynaddsubfx/zynaddsubfx.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/zynaddsubfx/Config.in b/package/zynaddsubfx/Config.in
index 837a469e7c..f181a23944 100644
--- a/package/zynaddsubfx/Config.in
+++ b/package/zynaddsubfx/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_ZYNADDSUBFX
 	bool "zynaddsubfx"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, liblo
-	select BR2_PACKAGE_ALSA_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_LIBLO
diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index db0459ce62..aeeb0b6405 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -18,10 +18,16 @@ ZYNADDSUBFX_CONF_OPTS += -DOS_LIBRARIES=-latomic
 endif
 
 ZYNADDSUBFX_DEPENDENCIES = \
-	alsa-lib \
 	fftw-single \
 	liblo \
 	mxml \
 	zlib
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
+ZYNADDSUBFX_DEPENDENCIES += alsa-lib
+ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
