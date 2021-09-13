Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFE8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E699610E7
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E699610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6AE40299;
	Mon, 13 Sep 2021 20:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2VJwZmQb-Pc; Mon, 13 Sep 2021 20:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C35540295;
	Mon, 13 Sep 2021 20:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9041BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DDE740195
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3tHGJmnqGzN for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:44:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD8C140135
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:44:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d6so16621560wrc.11
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wb4OhI/RN06ERcDnnvvGxNjqjxuR9LQuYdGNjycA+ko=;
 b=bWxSvO2f1xWD14bt6azvDsZ92TOZtaVF/UU0A3T/S+Z7wQ3LWk2QDrNAojGqJy1Xnx
 g7m4ruaTTb94CUqs4Y0RAjg+mAKAXIXJ+VUxW21fyRheHEHBRVzHboYiGwZdn2SFX0bf
 +4mS3gywWxkMeu07ZWtS+xd14Hpo0gTAF3kw2ytpEmo0KxP87Cs1uT8Ohro9/hJZRTfQ
 eVEgu3qoBafSQB7Ri51d6P19i0VQWJ2QyBFZ0FD1EM7scOBAMfm/wrbIU3FhckmozDjZ
 V6ED8Lc24CgPDTvEGAWkqwPDxG1uC/grTSUDzW9g51r8vnUlFu4HUSeRpaZ+gmlfzLO/
 lgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wb4OhI/RN06ERcDnnvvGxNjqjxuR9LQuYdGNjycA+ko=;
 b=D0L5mrwYfyv+XAjJXj2TP6I9jm6tbaT/zdw1CcuHl9Wplk0jKtKTfDPiyRuytEnQfS
 zXb5QqyKl9hrLE1m+PyoRnZ26rrtHEwQvS5StIybNkfk541M+Oqi0IxqShJZt7BrvsF9
 z3OObrayk8nvdTAX+WheGJsaQhG5ZrUdDTGbukJUtnlUrlgEAJAdSEqOyK4yXoB1dosb
 wpNSxUoM1HmWBKo5KyU4TC+MqDbiIu7sdRWTpg94+lMyqC/eXvbrZrcrGMJaW68QXSBC
 OIR3tfPfczgWK/Xqlh/CHTYpMXW51Tmt9TWcM/TEfzdrzeiNZG2YemcPq/4q5Ezgnvyg
 Ntxw==
X-Gm-Message-State: AOAM532PerwqxyTk8+ib+mIjqi6maJCu1HB3QPn7We7UYvHdi29yY4nW
 3NWpxFY+5iV32d/6MNmXloog8i+8TLU=
X-Google-Smtp-Source: ABdhPJwXcKkcbaXbZ4wY5UoHfqt+i4mQ5TVNYH38ZxCObS6gOnf+mHlGNAPAg+5XDCEOaFKKAM2XtQ==
X-Received: by 2002:adf:9f4a:: with SMTP id f10mr14778819wrg.384.1631565868783; 
 Mon, 13 Sep 2021 13:44:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id 129sm7739042wmz.26.2021.09.13.13.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 13:44:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:44:24 +0200
Message-Id: <20210913204424.3896484-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gd: security bump to version 2.3.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Fix CVE-2021-40145: ** DISPUTED ** gdImageGd2Ptr in gd_gd2.c in the GD
  Graphics Library (aka LibGD) through 2.3.2 has a double free. NOTE:
  the vendor's position is "The GD2 image format is a proprietary image
  format of libgd. It has to be regarded as being obsolete, and should
  only be used for development and testing purposes."
- Drop patch (already in version)
- Update hash of COPYING (duplicate merged and title added with
  https://github.com/libgd/libgd/commit/82d260950589563a1af9c56f4ce5fde843a695ae
  https://github.com/libgd/libgd/commit/6013c7bcf6eb795dba584f92d3824ebd3ae60202)

https://github.com/libgd/libgd/releases/tag/gd-2.3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-of-bands-in-reading-tga-header-file.patch | 29 -------------------
 package/gd/gd.hash                            |  4 +--
 package/gd/gd.mk                              |  5 +---
 3 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch

diff --git a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
deleted file mode 100644
index a42bfb402e..0000000000
--- a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
-From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
-Date: Mon, 19 Jul 2021 10:07:13 +0430
-Subject: [PATCH] fix read out-of-bands in reading tga header file
-
-[Retrieved from:
-https://github.com/libgd/libgd/commit/8b111b2b4a4842179be66db68d84dda91a246032]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gd_tga.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index cae9428da..286febb28 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
- 			return -1;
- 		}
- 
--		gdGetBuf(tga->ident, tga->identsize, ctx);
-+		
-+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
-+			gd_error("fail to read header ident");
-+			return -1;
-+		}
- 	}
- 
- 	return 1;
diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index 25e64e801b..d0b1e97675 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  478a047084e0d89b83616e4c2cf3c9438175fb0cc55d8c8967f06e0427f7d7fb  libgd-2.3.2.tar.xz
-sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
+sha256  3fe822ece20796060af63b7c60acb151e5844204d289da0ce08f8fdf131e5a61  libgd-2.3.3.tar.xz
+sha256  005f4b6b0141d1bd11d371bbf7d4f67947f85a4906b7f5465f942204cf918ba3  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 90f966c294..55c12e6968 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.3.2
+GD_VERSION = 2.3.3
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
@@ -15,9 +15,6 @@ GD_CPE_ID_PRODUCT = libgd
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
-# 0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
-GD_IGNORE_CVES += CVE-2021-38115
-
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
