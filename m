Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE85C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E7960BB1;
	Tue,  7 Feb 2023 17:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E7960BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_wAW6hWhz7B; Tue,  7 Feb 2023 17:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDE36100C;
	Tue,  7 Feb 2023 17:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CDE36100C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDA01BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E998E8137A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E998E8137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTHP83lgKBSM for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF51881371
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF51881371
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i5so7102091wrc.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3OUI0x3S6Rrz3zBbzqQrnMutWFXwim+Mi6Z5iQrxQn0=;
 b=G61yYVBWsEqcjS8TzCtCyCfQb02bJsUgBvfXts5NpHBBg9WPa0wJx7ct/mWuMboO8h
 RTN00vzTvb4dhiiue4bkFwYqE50cKUqMOH/uYeQ8jV6VYBcmHacH8/z+BBn1SVplJHYg
 oe3oVUeQErWgt/g/M6ub54sE7cN8wUmL5ERSSnfGVxKhSHoNYpEGgGGxR06UgpAIyegZ
 JwihjaafsyPgDTku09JDjFVCyjQU/Dpsx6wq4URgNTYjVI7EPW+EZk/NGAKEMAPONO8u
 Qm3baFZgmtxA3qeJDSxe8Dg2D+8kdT4OLO8+Ep4/pLKKqHK/RS3p6TRDyUb14AmMat4P
 mSWQ==
X-Gm-Message-State: AO0yUKW2EdqC615cXgktG7tYk9SenRF0oVuVDr5ip7lhc5+d8NxMl7A8
 hByq1aSIHOINPWaFq7GRwq9fzQHE7YIixJ5U7uvgag==
X-Google-Smtp-Source: AK7set9KQZ8Cg2IGyfYRcoknKGh+iklUrwAvL+XwJRh9XBwMZeUO2FGVrNFL74pgMDd9Y6Rith00jg==
X-Received: by 2002:a5d:6101:0:b0:2c1:2a1c:a8d2 with SMTP id
 v1-20020a5d6101000000b002c12a1ca8d2mr3429001wrt.27.1675790249783; 
 Tue, 07 Feb 2023 09:17:29 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:29 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:09 +0100
Message-Id: <20230207171721.2973997-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OUI0x3S6Rrz3zBbzqQrnMutWFXwim+Mi6Z5iQrxQn0=;
 b=ZuILkLVddPcuRNyZPIjHif5Ry/sVnlbIAzf+gbsHRpgF/AdscQlO2C9+kmgDAyvJz5
 lFHocsFPcVzJ20IRbuaD6vV/LoB5rGIFF8ko1fC0JuJA5/rQwoj8pgoGgLnVg+iVQz2D
 UMqcZNfxtPeAyP6KUpHzUbZZ5ilmnQQcR8dOA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZuILkLVd
Subject: [Buildroot] [PATCH v6 01/13] package/qt6/qt6base: add support for
 gui module
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v6:
* Moved the basic linuxfb, xcb backend support here (Thomas P.)

 package/qt6/qt6base/Config.in  | 31 +++++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e8357a675c..1810b1586d 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,37 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT6BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This option enables the Qt6Gui library.
+
+if BR2_PACKAGE_QT6BASE_GUI
+
+config BR2_PACKAGE_QT6BASE_LINUXFB
+	bool "linuxfb support"
+
+config BR2_PACKAGE_QT6BASE_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+comment "X.org XCB backend available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+endif
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2f159f380b..9bfb2a8420 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -141,6 +141,39 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_xcb=ON \
+	-DFEATURE_xcb_xlib=ON \
+	-DFEATURE_xkbcommon=ON \
+	-DFEATURE_xkbcommon_x11=ON
+QT6BASE_DEPENDENCIES += \
+	libxcb \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xlib_libX11 \
+	libxkbcommon
+QT6BASE_DEPENDENCIES += xlib_libXext
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
