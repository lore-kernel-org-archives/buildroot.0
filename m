Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAB6C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720DE613BA;
	Thu, 16 Feb 2023 18:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720DE613BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIr97hfylrNZ; Thu, 16 Feb 2023 18:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975E860758;
	Thu, 16 Feb 2023 18:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975E860758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 258081BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CAC460758
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CAC460758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Q_OQz6-8Svm for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019B560591
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 019B560591
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:34:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso4971239wms.0
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umSD0yPAKfbVi2GJoDU0a/R6f8F/6/x7WqRSHgHxo7I=;
 b=T/RYmNle/41sxsgIHTTcIWpuDlX6kxem0yK7oUztxKzb1V/VNZNHg7vpbBAU11fKki
 aXbXqzl8GA0GGknl5NpDA2/xAGroGdMUZs4KNjhSE5GVM9geuWs1HdnjvL881KDtCpHy
 WNvJmlSvpsdt6/6E7hv5looDpVdYzzcla1OaxuVEaSpUsW2dZyYB5aoMXv3q3vez7kA+
 IQA7qwqsDtw3CaAaWWyYKL1W7a471OKVRP8D1+BCF20eOB9eW5z7TBhtbfhlWpwfDc7M
 H5oXtpTGUxAwtpyCS25WmjFl6jKWYjeZmBupCKTkLQ0EJoGD7FZx+NSDKNETPm06jRUc
 6GYQ==
X-Gm-Message-State: AO0yUKVIJhHsUmb4zEDMN7R+gaoHGS4w52KsfTtzBxN/NV4MMMJw6wY9
 BKloNETB/zQW96/6JlyWmGZd0ewpvLxq3w==
X-Google-Smtp-Source: AK7set+aBkS+Hq2das7DtK6goP3/XLWI6DRYsSLGQAORF65VyhTjbCBmB2tXflCBA3lbX6b5BSd8RA==
X-Received: by 2002:a05:600c:130f:b0:3dc:198c:dde with SMTP id
 j15-20020a05600c130f00b003dc198c0ddemr5175805wmf.41.1676572441150; 
 Thu, 16 Feb 2023 10:34:01 -0800 (PST)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003e204158ac7sm6754969wms.47.2023.02.16.10.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 10:34:00 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:33:22 +0100
Message-Id: <20230216183322.21622-3-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216183322.21622-1-raphael.pavlidis@gmail.com>
References: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
 <20230216183322.21622-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umSD0yPAKfbVi2GJoDU0a/R6f8F/6/x7WqRSHgHxo7I=;
 b=CmbxSaP+sRYv69+h5D5AoIcL/FQmcTJlqanWM0ma0bbXFavdsJ2a7EB6gOGeTU7SU3
 AfSrRaktG4VV4ZoPkO04Lwb1Cc+3vptflDJcdyj2URDmaqDQowsw4wuttp2Ln+4Gt3Ip
 8gglqiIOjbyQLHdvEK/wmh4lxRgRZyyAt4svdlONQT8SeV+BNjWoHJttjCPIB/z7I1Ju
 Ww8rGVR4bfr447Wh4WAHmO90TlG86lbh06aQpW/xJpXLYl9cqLICbxpbn8loe32Yupku
 jHqkbaAXK24pMvdXZ7gH+Ou2sjd5UderWi2WYZhCflxycvQlUnw4lPOaXpGuD1x2RRbH
 2PRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CmbxSaP+
Subject: [Buildroot] [PATCH v2 3/3] package/wlroots: add XWayland support
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
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new option enables the XWayland support, so X11 application can be
running on a wlroots based compositor. Also, do not enable the XWayland
support if the X11 backend is active.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/wlroots/Config.in  | 19 +++++++++++++++++++
 package/wlroots/wlroots.mk |  6 +++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 84a4ef846e..fe3080450c 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -41,4 +41,23 @@ config BR2_PACKAGE_WLROOTS_X11
 	help
 	  Support Wayland sessions nested inside a X11 window
 
+config BR2_PACKAGE_WLROOTS_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7 # libxcb, xcb-util-wm, xwayland
+	depends on BR2_USE_MMU # xwayland
+	depends on !BR2_STATIC_LIBS # xwayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_XWAYLAND
+	help
+	  Support for X11 applications
+
+comment "XWayland support needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+comment "XWayland support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 endif
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 4f14d20b11..5b930a51be 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -30,8 +30,12 @@ WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_BACKENDS += x11
-WLROOTS_CONF_OPTS += -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_XWAYLAND),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xwayland
 else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
