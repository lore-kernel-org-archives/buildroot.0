Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC04C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13284419E8;
	Wed, 23 Nov 2022 19:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13284419E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3e9S8GVwRbyG; Wed, 23 Nov 2022 19:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6DF04199C;
	Wed, 23 Nov 2022 19:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DF04199C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E986A1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3DE6409AA
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DE6409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HLm2CF1ZiMp for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032EF40951
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 032EF40951
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:30 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id k5so16715914pjo.5
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnoati0xoqwPXpTcVp5RcuiXgyUJzdR+95HYvxtqNj0=;
 b=48bCLDyoKCJnK+CNf7w3ItkgkIPNobtZKVwn0R6zmroVqIUNZ2vMdvp3x4U+2Tb4I7
 fVUfhYel0rzZ9BIlE31D8KBpVHqOEspK0diuzYTkLnotsE6snyrm3xA8lRNt8el+eqnS
 peP1gEwX6mOUwBiGE54nHbb9vo467Pm4NxDbc4TtNxV7Tims/8oublGyNzN6QGbRF7DJ
 iUOm8ni4wTgH/9pOvSe0OHZuT3J4/noAo5/5b6HqFO5lzjhxjh6E+NDWnkFC+jskIext
 XyIaCNKvWEFMDTfbOVjcFcjmDB2WmvipyLr8JYsHZusWBjQFGEwLa2uzbFXs2NN+sqA0
 ciaA==
X-Gm-Message-State: ANoB5pkzzt6hDGcKCmThae6n+Wzlbr3FqETMtDDYkDFqr6xDTcdOhARb
 omip7W6dnW2Xl5A2/MKIfHt3kUHF8K33HQ==
X-Google-Smtp-Source: AA0mqf71amPWhUAe6KEKgH1b0S+1rNb4a2aQCxvS8yHWsNRpOB3plIDccvIHjyA+yZXsWF0hoEH9mQ==
X-Received: by 2002:a17:90b:2341:b0:218:a506:4fdb with SMTP id
 ms1-20020a17090b234100b00218a5064fdbmr18986046pjb.207.1669233210096; 
 Wed, 23 Nov 2022 11:53:30 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:29 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:53:03 -0800
Message-Id: <20221123195304.1582783-13-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnoati0xoqwPXpTcVp5RcuiXgyUJzdR+95HYvxtqNj0=;
 b=WyIJdY63H2PZNMhnnxUL0Sz/VrB3kKQmJAdlVXVzI+VCNQRrupijbUIjCHSzHCJpdJ
 y5eLY+KXUeeUSGn0FwHn0JI+AGdZx9siPFIhDbJyIrIis5grZSjAGvI5NzHhEhJ88aSh
 7JgfDyB4VpZQbTVXWWSD9Mruzcx6TfA4JKhIg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=WyIJdY63
Subject: [Buildroot] [PATCH 6/7] package/freescale-imx/imx-vpu-hantro-vc:
 add INSTALL_STAGING_CMDS
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

Add an INSTALL_STAGING_CMDS define as libraries needed by
imx-vpu-hantro-daemon.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 1f033c1434..a8a6ffdef8 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -8,6 +8,7 @@ IMX_VPU_HANTRO_VC_VERSION = 1.9.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
+IMX_VPU_HANTRO_VC_INSTALL_STAGING = YES
 
 IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
@@ -17,6 +18,12 @@ define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
 endef
 
+define IMX_VPU_HANTRO_VC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755  $(@D)/usr/include/hantro_VC8000E_enc/*.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m 0755  $(@D)/usr/lib/libhantro_vc8000e.so $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so
+	$(INSTALL) -D -m 0755  $(@D)/usr/lib/libhantro_vc8000e.so.1 $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so.1
+endef
+
 define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
