Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B42C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91DD0611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91DD0611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D81180F77;
	Tue,  9 Nov 2021 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDzTAU7WamS8; Tue,  9 Nov 2021 17:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC6B80F2A;
	Tue,  9 Nov 2021 17:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1BD1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D05380F2A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HhcQxyUfXBm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D574680ED3
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:21:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d24so34291091wra.0
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8YAZXuZZxqr14dLprWXEiwzDAYCq5xSejzcowe3ELOI=;
 b=MJj4ICQuikteh41Exb7OSBS2ypEIfLCETQCvXGiOySojClSoDsDH5Pt16oStd45FP6
 aRpzOGqA2mb7enLdDPRCNImbJwec8EucFZJ6Jjg6slNuKco/bniP6wJ5O0ZpRldedHES
 HkxKMxTu3s6Ko2w88JRKSR9HC/T3RTqFw1Pn5yL8yTDWKFMpBEWlmkdeX90hc9qMkquo
 Ip1Aw528lHvE3PzC5fWKsSKRE86FXnJIS5ME63p4xXKQJLdEZ50FfhuGG8xvEIeZ8bx2
 l+OO4ZgcNshWMcAr43RA2BZeu3grICBHCzOjORU6VJzKrjR71IDpl2fF8rshUsiLZzw9
 n0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8YAZXuZZxqr14dLprWXEiwzDAYCq5xSejzcowe3ELOI=;
 b=ii0OMjxQYt/oSup7NsBGChT+fVYJrI3o8DYvMIs+0ueit/kqfDBQi1XEuRidrle2GZ
 8fB5LD8u8a+j0bDXByTrZ2UK4kgK3eh//xfjVaeCRtcVGcQWq3vc+x3TnFsOzc3DXYCo
 Njyka1djxtBaQR3tocfnlYbYiPGe9EAtuyt/JqJdE8DKyVsrupB4Lo1MQAkPXTFVuS9n
 gXYvryS5Vdi4Uby7VKPuAyKM7yhfwIh3x1iPbHAv0OC8n+6GqLmGovRiHn7knmkb+U08
 pR7taX9cp1xV0RRbRaX2rAuz9qxQEe4F1N0wTir/aAYkta41+4SzQmDSQ3AYUbJkJNUb
 WlCQ==
X-Gm-Message-State: AOAM531nwRgekkuGeiXWqvIQck+Rabn8M4zBWk+/gw8Z7RpiSWbwguD+
 AzAdX5c2JtVOgQ/VZ6IoVtdLE6PtpYc=
X-Google-Smtp-Source: ABdhPJynxDLfbGWcWA6GHaJePZ+8P+6YHTPvuqAaZ0A2ImK+T/708gx8FxOBjoVskzaMHEW+OMW3Fg==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr11186651wrm.299.1636478494033; 
 Tue, 09 Nov 2021 09:21:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id y6sm22110039wrh.18.2021.11.09.09.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:21:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:19:40 +0100
Message-Id: <20211109171940.457031-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rcw-smarc-sal28: don't override
 dependencies
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
Cc: Michael Walle <michael@walle.cc>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override RCW_SMARC_SAL28_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
index 4928f1a7f8..2bc740027f 100644
--- a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
@@ -14,7 +14,7 @@ RCW_SMARC_SAL28_INSTALL_IMAGES = YES
 RCW_SMARC_SAL28_BOOT_VARIANT = $(call qstrip,$(BR2_PACKAGE_RCW_SMARC_SAL28_BOOT_VARIANT))
 
 ifeq ($(BR2_PACKAGE_RCW_SMARC_SAL28_BUILD_UPDATE_SCRIPT),y)
-RCW_SMARC_SAL28_DEPENDENCIES = host-uboot-tools
+RCW_SMARC_SAL28_DEPENDENCIES += host-uboot-tools
 define RCW_SMARC_SAL28_UPDATE_SCRIPT_BUILD_CMDS
 	MKIMAGE=$(HOST_DIR)/bin/mkimage $(MAKE) -C $(@D)/contrib all
 endef
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
