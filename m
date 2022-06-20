Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B467CCA481
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC9C60FF3;
	Mon, 20 Jun 2022 21:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC9C60FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRIf_9Wz2d0g; Mon, 20 Jun 2022 21:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDDDC60B5A;
	Mon, 20 Jun 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDDC60B5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5786F1BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4D460B5A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4D460B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9_rYFkyoMos for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:12:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C8960AE6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44C8960AE6
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:12:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n1so16020411wrg.12
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rCCnv0r97Sgzz86KMgQr2hHtEConOjpQIB69c9buJXc=;
 b=QCRD8+FyaHhPgvWew4Hxhk4SOS+Z4lP7NPOPv1XxwqtE0NjvBdmGlVuhCsVdRYFH5G
 imtNZxghlSJyHycaizNrXAmTfjWauuqNzTUarNwDKPSTThafcYBoP35fmx2IF5Qcqir/
 BoiG0gPonb8MUyb0CP7hnxHayCeIBUw+cp4KE8Ig4PE/dDa3iIUBHNw2LCFSeEv7RJWc
 SSF2l8gojZhE8UHvDjFilM5DBxO9E/GGf0s8pVDaPAb75EL934RW1vTKNs48WlKtPKja
 GZVIR+7ZO2jpCBDXcVh4c/qmwXnaKwDZVjWutGaAAb07q8LRKQjU7IZ7jb61CkGIlTKr
 rFxg==
X-Gm-Message-State: AJIora9ieTB6pdnytaK5APxfEBTpCQA9wRKl50xQz1+DvcHjdzD6dbo0
 O9K0CVkbJiUO6vVMAJpIZiwEQssA08A=
X-Google-Smtp-Source: AGRyM1v30T/r1SQUq/Fp8YhKVAsCvg588zEcOYP0NT9PgjhLC/zZB1pi8UkxXs+zhD1/vXl7p1bIQA==
X-Received: by 2002:a5d:6d46:0:b0:21b:933d:7950 with SMTP id
 k6-20020a5d6d46000000b0021b933d7950mr3977801wri.679.1655759535067; 
 Mon, 20 Jun 2022 14:12:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bt28-20020a056000081c00b0020fcc655e4asm13729556wrb.5.2022.06.20.14.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:12:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:08:55 +0200
Message-Id: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rCCnv0r97Sgzz86KMgQr2hHtEConOjpQIB69c9buJXc=;
 b=p9gPgeBOTDhq8FEDdfvDkpYpUWsFImo1q3mDFswegE4u8EJ5aNAfZ9gwunwp3aDB7t
 wCYJ43EN39YIKD5BwI5rg0/Yy8KsdTBY/9pGISq0frAnV3juALbeNGuE7R8x3vx/akKt
 DH2hKwlQWfgNpiCsZ38ltl1ye+sa1zGKLmMoW9kjWD7kvbvSWhxZbDhpi1hkqC5NoNp8
 44YHYLxdglpRdtQcWAcC8z037BxP9ks4oPKNCrvtA6qnJniKFme+g7XmAthJMw8JIsYG
 NtDvpuNuu2uFYeJyKopxkUOhAxyJf9DslEM0yeOcxwTzqkRdORMKnz85IHbtpi1Mh6Jg
 gzlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p9gPgeBO
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 xephyr build with kdrive
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following xephyr build failure with kdrive raised since commit
eedbd6f97d51a0049ec512de26541465403ab06f:

checking for XEPHYR... no
configure: error: Package requirements (xau xdmcp xcb xcb-shape xcb-render xcb-renderutil xcb-aux xcb-image xcb-icccm xcb-shm >= 1.9.3 xcb-keysyms xcb-randr xcb-xkb xcb-xv) were not met:

Package 'xcb-renderutil', required by 'virtual:world', not found
Package 'xcb-aux', required by 'virtual:world', not found
Package 'xcb-image', required by 'virtual:world', not found
Package 'xcb-icccm', required by 'virtual:world', not found
Package 'xcb-keysyms', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/baba218c879b67bfbadc9c25d34313abc76397bc
 - http://autobuild.buildroot.org/results/9471b77db9aefa2fd0e5be61ea84709183511623

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in              | 4 ++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4fb03051dd..daf4d81702 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -85,6 +85,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR
 	bool "Xephyr server"
+	select BR2_PACKAGE_XCB_UTIL_IMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Xephyr nested X server; successor to Xnest.
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0f1779dcab..fa5d2a802d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -84,6 +84,13 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-glx \
 	--disable-dri
 
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xcb-util-wm
+endif
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
