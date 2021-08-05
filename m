Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED98C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5419560F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5419560F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AEC740264;
	Thu,  5 Aug 2021 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yavIzvx5H4Kz; Thu,  5 Aug 2021 21:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40381401CA;
	Thu,  5 Aug 2021 21:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD6A81C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADADE839CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cU_P43xtKjyw for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:27:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D02B48382D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:27:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0126E240005;
 Thu,  5 Aug 2021 21:27:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 23:27:34 +0200
Message-Id: <20210805212736.2799576-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
References: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/freescale-imx/imx-gpu-viv: make
 pkg-config fixups mutually exclusive
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The IMX_GPU_VIV_FIXUP_PKGCONFIG fixup is defined conditionally
depending on the value of IMX_GPU_VIV_LIB_TARGET, which means that
obviously only one of the definitions is possible. Make this clear by
using a ifeq ... else ifeq ... else ifeq ... endif logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 9d974cac41..df39d3ddc2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -46,15 +46,11 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
+else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
