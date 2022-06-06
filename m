Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC6E4404DA;
	Mon,  6 Jun 2022 16:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3l8TaIxVTEaG; Mon,  6 Jun 2022 16:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 252764049E;
	Mon,  6 Jun 2022 16:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B87CB1BF303
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B59BC414E4
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBKFPBhUn4gd for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 16:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FA63414C2
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 16:41:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id e5so1133803wma.0
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcpNF35bwEVu1P8dGsV5hkKqtdQOUAKQv/aOMGmtR5s=;
 b=k0EXUvgXYofRqR/6NBGJFEtMzoqXA2cnJVype0wnDE0FdQIcwVUY5KMCW7W01synR+
 fj8pJNB6m8TXMj8LbvKazxIcOexVKCim62JP30dxnOaJgdIlVi1tuYHXkkQr4AVQVNL8
 X+7aJQuY9COQUtxIpcELNI0BF01FXDbxWOz+NYNH1zGCGUkVCK0kQ5HOMBp5wYxuPNEO
 zUXhCZx05OHwbhsMCVfxm6ZySMvHmhKH2myghNdpDvmcwME29BJt+ZOtYcWfRszAzBF7
 9rJXoFbAD5TlR4XuDApRx10kmUexMWCU48BkDmPOda7wb2wQ3fXnN0s2E7+N0f7byOX6
 OXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcpNF35bwEVu1P8dGsV5hkKqtdQOUAKQv/aOMGmtR5s=;
 b=2q4k9AIAwuL1Cr4Qpr+WOW/Mw61ngcdNf32Lf8GYWtwzw0YmBmnChifWf8DT/eOnJI
 777uv39n9Hx+hot6+C8Z+0lpD4je5KS7bPQ8b9M3w6S+iGF3vZ4Tzj9nDlqp0vNfx+sv
 0CSIVsWM4E0QaVp8355ZiLKgkY2mio828Op8ZRFVelQvUvbYyu5moRdcC7W5SmdiLN8u
 Ka5SIJ2WYrHsND1n2MLPGocSQ3xY4erWYCgnWjUZdt+SPRUDcd1F8o3ll+sSZbhqHybf
 pONIDDl1WKT9s2HDhtoKbE8liIhziAQSnEchQV64p8Xhnlt6Y8ThJC+BEuL77+YQgu++
 8ECA==
X-Gm-Message-State: AOAM530oXzxblEtjVv7o2cQppGIDoV1eFsZb2nav/YXLmG3+/gQDkT39
 5SxMai+L+VTjQG+yTAAq3u6zoDDGZr4=
X-Google-Smtp-Source: ABdhPJz8TSgspwhorBsOSQaGeWh6Hv1cVz+8eK6FFQR9SCykEqkRT2fkCc83FXOBLIThhz/WFtEetw==
X-Received: by 2002:a05:600c:19cb:b0:397:51db:446f with SMTP id
 u11-20020a05600c19cb00b0039751db446fmr53307305wmq.182.1654533705082; 
 Mon, 06 Jun 2022 09:41:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adff846000000b0020c5253d8d2sm15933858wrq.30.2022.06.06.09.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 09:41:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:39:14 +0200
Message-Id: <20220606163914.1592818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rockchip-mali: fix armeb build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following armeb build failure raised since the addition of the
package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

ERROR: architecture for "/usr/lib/libmali-bifrost-g31-rxp0-gbm.so" is "AArch64", should be "ARM"

Fixes:
 - http://autobuild.buildroot.org/results/33ebfa936da8dfa4035db08a96f8872d7c9db6c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rockchip-mali/rockchip-mali.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
index 848682229d..98dabf70d7 100644
--- a/package/rockchip-mali/rockchip-mali.mk
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -14,7 +14,7 @@ ROCKCHIP_MALI_PROVIDES = libegl libgles libgbm
 
 ROCKCHIP_MALI_LIB = libmali-bifrost-g31-rxp0$(ROCKCHIP_MALI_SUFFIX).so
 ROCKCHIP_MALI_PKGCONFIG_FILES = egl gbm glesv2 mali
-ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_arm),arm-linux-gnueabihf,aarch64-linux-gnu)
+ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_aarch64),aarch64-linux-gnu,arm-linux-gnueabihf)
 ROCKCHIP_MALI_HEADERS = EGL FBDEV GLES GLES2 GLES3 KHR gbm.h
 
 # We need to create:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
