Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD544C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F87240C50;
	Wed, 23 Nov 2022 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F87240C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2YoOHv9y_O2; Wed, 23 Nov 2022 19:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6CA40C32;
	Wed, 23 Nov 2022 19:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6CA40C32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62ABB1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5E660B9A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5E660B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-ZnTiR29ah9 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF4E60B2A
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FF4E60B2A
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:21 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id w79so507746pfc.2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rb+x7NPDPVvrQt2O8bVIGHlIK4XjA8Px8EbsXYeUXdg=;
 b=xxXyvi84HF7iay6/JTyVISNTI2ytt5h0HcscJ2DMoxbVeaRLSywe8yySRwwL3Dbw5a
 BzoIIgaP0Gw5UFjIvLr8jFGWqeEtM1nBo5CPFP4Gc8oC8vaJenWchWwSUxGrRfDYOWsq
 /qeRJF7/S+gCYGfPtClrqKuibowfn54KaxTsJAFWVbGCqV08EyF5qMUi3BB1XVELSVDV
 8RmgKEa2wW5S2HTRak5hUcd3FzdfDvWbfeYBPfQ/dWvMzRE0VenlvTfLhP7c0ihs0Z0x
 nVTqdioH5Trxo4w9Plx9NIuUd2R+hBwTjE5XcKgItIONVISgvZPMTa237k/8Pe2wwtVF
 pAww==
X-Gm-Message-State: ANoB5pk9e3/EH7zgcfNE2NhKV976Ccz5tIXSmM2QdcJun5Yuxqc3sopk
 T3GUZuCAPtVHZ0Ypcn5kEjlYzytw6IksDA==
X-Google-Smtp-Source: AA0mqf6tKegO9N4hUjlv5DN/UzRxofgyIo0TxaCBVwogL7DfJNBjSKxVKxSORKlo8bM8MhZQAXlEyg==
X-Received: by 2002:a62:ab13:0:b0:574:6341:a3cb with SMTP id
 p19-20020a62ab13000000b005746341a3cbmr3333379pff.82.1669233200309; 
 Wed, 23 Nov 2022 11:53:20 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:19 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:55 -0800
Message-Id: <20221123195304.1582783-5-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rb+x7NPDPVvrQt2O8bVIGHlIK4XjA8Px8EbsXYeUXdg=;
 b=VxuAvw7yJSX0ubBadEMXWdnhya4dhP1FXtALsI7PXkfDQTcR0s0w5J81+/U0CXrz1h
 tnvo4680JV2W/FIYfDh+nfG/7Arivah5xsFjaDFXXqrhTTJERd2zxRMKGIB/r9r9zsvq
 w/f4MI8g1n74omTGhz/YXW/jdLf8Kw5TUMzSo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=VxuAvw7y
Subject: [Buildroot] [PATCH 5/7] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.9.0
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

- To match NXP 5.15.52-2.1.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  | 6 +++---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index aadf5b121f..bd9bc37c1f 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  62b5ba3c4aab21d0d4be3eee9b204a9bb50b83b6140ee1a3b27c648809bdfbaa  imx-vpu-hantro-vc-1.9.0.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 5f4c6faee4..1f033c1434 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.4.0
+IMX_VPU_HANTRO_VC_VERSION = 1.9.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
