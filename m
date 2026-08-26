Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8F8C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 15:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9F3809EC;
	Wed, 26 Aug 2026 15:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4xslJ0GaMKV; Wed, 26 Aug 2026 15:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787758068;
	bh=ikJHlhnz2B0Z8+3owcfzIr7noaMYx8RX+HPucXEe4vY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L5fnq21M3nfcJmWBmONY+yG3V+2es4oUXF26q/EXWu7QZiMpkRhp4iq01H8I3e8Xk
	 KPXgpXpulX20OFAeX6gHgaG5GCjgPIn4ueYyvhWgXJ1F92UagBlRTFm0hIAZ7TObcu
	 zCeXe0c5F0orQaexmGnnX/MmkHtc8ZjqS03uGT2UbTh6Q+9imvnc0YaDZVZbk6R20c
	 M7I5fS6+u9BcDKv57zvIHBb3CitUnQ/OB3nqwPD06LgqBW5vYqs9ps5jIJdFZNBEv9
	 8eEC7lnFE6fWX4gNVNIdxfeMYR/Ie3zAjE7rZJii9X/ijRYAYavphNOdxU9p0nOrQC
	 xv/GE+zSQpk6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4804080AC5;
	Wed, 26 Aug 2026 15:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC875334
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 935B940115
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRqThpMZML88 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 15:27:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D63F40064
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c1c26d7e951so162195966b.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 08:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787758062; x=1788362862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J5RbegBZqr/fVqHTthR2WufJESjZnMH2uOc2RXR3ZM4=;
 b=Z0+o2KidB8/ue9kSPuMRCrmYBbKT6tD98rlQm/XVNecAJ8h6aJRFQN9pF92MObkvFB
 TjyeYBHvO8vYe8fGUK/Espknt3GPRlxdstsmOjKuqFY4mTVa93cZvaOi/4DtFMyE1fE3
 dzeQU0PUuCtSGIKu2TPJoI2LDQkS1XwJRmQfvZfmPA5rmLNDbwnIILSfMf3lz/Hc9KpW
 K0vWg2pCUzMKIUBbLkp0Zy7xgIbrSr5XNRZl4mOlIf1z1r4gDM4hqfF4MGaKVqmFUeuL
 NtScFTHv72BXfs+dHNwUR0FSm17KJILcVpKENwWSlAQ7pa9lUihME7c7AzUb265uP3yC
 UcNQ==
X-Gm-Message-State: AFuF++kdhCVnr+rWV2Cd2S9mcB3cfMALr0b24auPt8o+OG8ur4e+Rw3b
 YreIJl8zFDCqPxg1ggkvt5TeBOyW19vR2m/ySuHGPFV+SlS+jNKboh3sqHprjbOGvcj7lbFgbGj
 jDgd0Y2w=
X-Gm-Gg: AR+sD115qPci/zdAGz2jbFLgm4mmDxLEWh1aNiC5pumg6gbLI4T9SnxhdCfaCzv/O4r
 6qBrBdGhfcmhMIAT1q5mWqVmFCzvO7jV29uHKo1GJzOupv6JeTf8MdvtRWDjRTt1GC9cBhzYGsK
 K5HnQOtM6Oz7z3Fpm26uPrNTrZ0db2lKXa/5Oo7OYfnfpneAW7uejXMSDp5flO5j3Uz7U2noqTS
 JOw8P5+dxuP+nNBhyOfELT41IRVrlm1vW+VXeyIi5sL5F3jufojuEdDxGCyelfP1SpKYk3WRpXs
 QNe0JeSCMpx3NJXbO6scLYNBZRlLntz8P32yIf2ctvQ4myrrWidTfctkHajkYc3nDuP1yehovyY
 D618X1SmDPlaO/ewuAnZ9Jvz1UF4WzSapmdg0p+7gVRftZS1PRnY18EPiwA4UgqF5PII4iwJ0Ey
 2qDAxl12Jwld7yoiFXtj/BaspfwsSGXVtFGSt63lh+lStL9msigbfP23FdSqTBeik1GTw2iak+h
 PShKOfMgqa8Bm9NBv0wDRDaK+mTa5Edcoau83nDR3z2T8W0QaY=
X-Received: by 2002:a17:907:930d:b0:c20:ff26:336e with SMTP id
 a640c23a62f3a-c250c31267fmr913512666b.14.1787758061769; 
 Wed, 26 Aug 2026 08:27:41 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ec343sm403804666b.57.2026.08.26.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 08:27:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 26 Aug 2026 17:27:32 +0200
Message-ID: <20260826152732.3556127-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826152732.3556127-1-romain.naour@smile.fr>
References: <20260826152732.3556127-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-gobject: bump to 3.56
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version bump is required following the glib security version bump
to 2.88.3 [1] to fix a runtime issue due to GLib-2.0 backward
compatibility removal [2].

We prefer updating python-gobject to 3.56 stable release instead of
backporting complex commits from 3.55.x unstable release [3].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

[1] e313a2d2590af689eb1f79e55b5a488154400da1
[2] https://gitlab.gnome.org/GNOME/glib/-/commit/e02603d44dd71fa7bcb07a1c5d64c5a91d3e93af
[3] https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310

Runtime tested with TestGst1Python and TestFirewalld{Systemd,SysVInit}.

Cc: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 191b74b1e6..6b26e289e7 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
-sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
+sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 9386b6fed8..310cde24a7 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.54
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
+PYTHON_GOBJECT_VERSION_MAJOR = 3.56
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
