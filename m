Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE490C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 06:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2374260FC1
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 06:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2374260FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23B9833CD;
	Fri, 22 Oct 2021 06:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hdPSx-eaWpR; Fri, 22 Oct 2021 06:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC88831CA;
	Fri, 22 Oct 2021 06:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98AF81BF681
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 06:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94D9B606D9
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 06:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zqnHpMFuvqJ for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 06:40:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A40B6606C5
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 06:40:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso1596699wms.4
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 23:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q38CkkokhpOBwWDSmyyhdWtpY4w12WHIjZWuT93I1YA=;
 b=L1Sdrx6NR8N45JROoWXNNgTJIORwW+ZAZN/zVr+GHXG2vAPyH2+XtH5SR4h3gGhPFP
 I+hjunZJ/HR85K2j5Q9HCk15sU16FaaxDJPZBM069S7QVSCQnd2t2HxiDM5zCxHZvKEl
 HM9ppninGSctW8XsrAweWaPAAvmPZktSBC+9vgitgFdHfuJJFjP8lot2DlDGf0W8cffl
 UfARgq8WXCOEI+WRmljE/5o4LSG3euasZR19haTVncoVa9n16F9Qkt++t24/z+7ueyyJ
 vd5VnBSNfS+xLR3jyienWgqa2eaD62rVAZ+FV/mMkXze2YJziKsnacdgMC2dG8e1H6Wg
 bwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q38CkkokhpOBwWDSmyyhdWtpY4w12WHIjZWuT93I1YA=;
 b=kkModKHgmT0hk5AKykbHNqPM9T0+wMvAvDvhT4EtJjbkis9RP1VH78vpFMZ4wgT2mZ
 II+4ebxvdTpacsF0rAA51oDdoDYPS0fqOrEXFLfJA0u6HcRFquULT0jfKD0eRMhjJxmd
 OGB5FpWDK3zUNvlsvsY5qJAlO33ta80OK9akkqFroBo/SzC6+7rhkiVVGFnOaI4cc7gv
 TiYx9HxsfwC6vm+TZNWrtXuHLWZdQeU/O7s39oLmK+b/Fq0gawiLscmrjaeBdmu7lbP2
 Tk4iDqWXz8IjjtV341f6kikRW5mPKEmmfG4flPVVocB/Co6Wwgcc1Q0WsVzFcfN37krc
 aj7Q==
X-Gm-Message-State: AOAM530L9GcM/WG2XK36k2Vw751d3WsjFhjn3KDApAhEEO5YnJh9Advh
 7clflHsFyJ98ab7ZPms417A1RzZ28CQ=
X-Google-Smtp-Source: ABdhPJzwIfTZBoyYaZXSxYCZ7jbmogeggpHzT2sT48ywXrfFlHfUdEDuScgN4P5Gqxcew1QlAg6OWw==
X-Received: by 2002:a05:600c:2316:: with SMTP id
 22mr10463794wmo.124.1634884855417; 
 Thu, 21 Oct 2021 23:40:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id e9sm7018008wrn.2.2021.10.21.23.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 23:40:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 08:39:25 +0200
Message-Id: <20211022063925.696027-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix static build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version 6.1
in commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65 and
https://gitlab.com/qemu-project/qemu/-/commit/ba4dd2aabc35bc5385739e13f14e3a10a223ede0
(which enabled plugins by default):

Library dl found: YES
Checking for function "dlopen" with dependency -ldl: NO

../meson.build:460:4: ERROR: Problem encountered: dlopen not found

Fixes:
 - http://autobuild.buildroot.org/results/df447bd963e62e06b28d7230da744616ae55b194

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/qemu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 31f5ab6033..f4dcf0ba5a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -168,6 +168,10 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QEMU_OPTS += --static
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
