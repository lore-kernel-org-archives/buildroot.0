Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD45C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AF260EF9;
	Mon,  7 Mar 2022 22:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AUtIaRURa-l; Mon,  7 Mar 2022 22:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FA160773;
	Mon,  7 Mar 2022 22:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20EC81BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD1360773
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4IBLZgAQZmP for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8814D60597
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:42:30 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v4so15419839pjh.2
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtWSOjOcKOJvIIdfhJGoZKJF0+1HWsc2HRmc/1q8dj4=;
 b=kb0Ylx3ug1HMcJamDXiF5+tg1Ea8mUkPSNhf15QJWVpS4o/SwEKe63RAujSwQDjpzo
 WNiow9WxF20dpA3VJDRlRTT6OtA+jUhYGVWliVSM2bPC8SoAFHOd5ZaESSHIuuE7R0pX
 QcCO+W6Jrn/saOrebyFqkGvf3f7hpnalzHbpCTGm+UwzG3Q/TXZny7fv1Swd475M6ZTf
 Qg9frJIIK2cBwUmcwmrSKu6Cu8RYBl/gxpvVvLhWD9TO6ai5VAyMGGZOxhi8p8hRiI70
 YYPf1gGPGxu7mW7kg8oDC8LWftWLRLdDJATwYDmhf0Ao9P93XXZtbmggMv0NGaft+68Z
 6HCg==
X-Gm-Message-State: AOAM533RQCRQ/4Qf6CmQs4GG2tt4/A1YKTh9jZ7+eU+s8+8OIlRsMDXv
 w9fkh9GijyevG8iCT8FEgJV0HPVYF4g=
X-Google-Smtp-Source: ABdhPJzoQRuHbhiHsaI8uAnnhfZ70YaWFhcd8o6BFKC6fjnPOOxSmoeILhLwM1C6R8Tw0bLgItJIjQ==
X-Received: by 2002:a17:902:6b4a:b0:14d:474f:4904 with SMTP id
 g10-20020a1709026b4a00b0014d474f4904mr14440814plt.122.1646692949582; 
 Mon, 07 Mar 2022 14:42:29 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 on18-20020a17090b1d1200b001b9cfbfbf00sm349108pjb.40.2022.03.07.14.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:42:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  7 Mar 2022 14:42:26 -0800
Message-Id: <20220307224226.1375696-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rpi-userland: add support for
 aarch64 build
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on Pi4 Model B (aarch64).

Note: rpi-userland and upstream rpi os now support arm64.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rpi-userland/Config.in       | 4 ++--
 package/rpi-userland/rpi-userland.mk | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..81f3588822 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 84050b6df3..8a05bf2b51 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -13,6 +13,10 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
+ifeq ($(BR2_aarch64),y)
+RPI_USERLAND_CONF_OPTS += -DARM64=ON
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
