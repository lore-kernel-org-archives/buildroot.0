Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283ECE82CB1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4BB428D7;
	Wed, 27 Sep 2023 16:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4BB428D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xk5K96ndXwre; Wed, 27 Sep 2023 16:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F62428E2;
	Wed, 27 Sep 2023 16:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F62428E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B62F1BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4423428DF
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4423428DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqxFhl-1IwKD for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:10 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C30BC428D7
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30BC428D7
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6907e44665bso10406711b3a.1
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833230; x=1696438030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLBtiJYCXSEnUjTijpWbnYTACtweV7P7EwNLRK9GiMA=;
 b=X7g6tQK+9omS7ZgAfB8EjV5ttQMkR+HEtMjhdTYsmdbxPyfaPm2TevQT008ViWNVCY
 7UtQQri6xbnhCvrN4t3FZF76jKbgLHo/EcGC+tBzuYM3W4fPr8j/KJpzZ7aYJTWkPNlX
 pNZhantaxC9Cm3o4+2hwEbzMb4pDh5p8rZoA4XjO18CL39etTejD3uNaUT/2sspwvNV9
 1fw2OlMh04QvkF+CHbbYDt+GjWptLq9xojsmoNUmBOFtwCThYBdXIAESk/YLZxNWJrPu
 bl7wdGux1URIP52NVbvZKV17XCooFDJSd2qI1vQKh1tGqKpeVDWC5osHUF1C0eKWSk7A
 1R3Q==
X-Gm-Message-State: AOJu0YxRa9oCxkNVHT8UQA4YsFQ4leDGyreJJ/kgHCSS8Gk7N6498fuF
 oRxpryO2EHEa0ZoBSaS9Or+1pOxGxffFZBC+
X-Google-Smtp-Source: AGHT+IGjA6xUH7cA/LH0URhTRxwpgoXhTNrrv9E+TgW+Gwh0FnnYIl/XuBvaH5GOKH0kOXo+8JXvCA==
X-Received: by 2002:a05:6a00:2389:b0:68e:236a:93d9 with SMTP id
 f9-20020a056a00238900b0068e236a93d9mr3381173pfc.17.1695833229935; 
 Wed, 27 Sep 2023 09:47:09 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:09 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:36 -0700
Message-Id: <20230927164640.67592-2-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833230; x=1696438030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLBtiJYCXSEnUjTijpWbnYTACtweV7P7EwNLRK9GiMA=;
 b=URyDeFX2Yy2lJ8Sdn+4B/yb0LpIPbyUJrhJ3+rdj1hXMy8xkaNF/zwvuuZwLukXCh+
 P5uXdnY0UZzXIdACYTQ0wcfNFSXFPuGX8bwbEZb2+ib00rcL1UMBH5Bf3rWNoL1YzQ/F
 b6C8K0XF8Hmx3cVfVNsF2HheYEdgUCVOw7dVXXvRDlrloRgEoWF4rwwpxtpDtwGLNFTp
 Vypw05YQqpfGXD3V3rOwIW5Bv9TuUo5btpiiqKztchS7ypGkNhPoPEAaF+TiDXZPFgIE
 u/j45euEvB0Q5HOWgLzLH/7dYq3IgYeMkV7/OOE7bXcMDFO94TrNK+SuwNV1jFhxAaPK
 y6Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=URyDeFX2
Subject: [Buildroot] [PATCH 1/5]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
 6.4.11.p.1.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 6.1.22-2.0.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash  | 4 ++--
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 528a4d4d9d..1411c8d3ef 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7d5102dfb99172f440e957ea23bb755d99655d179efb348c3f17a4ae387ffd56  kernel-module-imx-gpu-viv-8c864975607cf455c5e95d5313aa00e69f48d32f.tar.gz
-sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  COPYING
+sha256  ce32d7f9e16daa0ac87a41bd6da2f96743cd5b28b7bc324ca642e985a29a4e48  kernel-module-imx-gpu-viv-1e65746bb15628ccbe88e3ee7a0a1d2becc48e79.tar.gz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 56724a4a98..13df35dcc0 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 8c864975607cf455c5e95d5313aa00e69f48d32f
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 1e65746bb15628ccbe88e3ee7a0a1d2becc48e79
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
