Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841F3E743F4
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6F360B73;
	Fri, 29 Sep 2023 07:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6F360B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRsqLmBLEsnD; Fri, 29 Sep 2023 07:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AB5611D4;
	Fri, 29 Sep 2023 07:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AB5611D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0E071BF267
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ABCB60B94
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ABCB60B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vNmio4h69Qp for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:59:06 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93B7360B73
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B7360B73
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso13178794f8f.1
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 00:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695974344; x=1696579144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uIr2Tp7TrvRwUKJcbGKy36Vxy1dAEX/3QQxmX4P/nCc=;
 b=HaCssQZNcdjTReAtm567jLOpgQIDJ3ZNlSSkHLeLzAgCEVWVp5ftVe2OVfADUAM14X
 7WPZdC0BrVP/TmaxcDrZJZgDv7d9/o7MN7pozjUvnkCKOCKTIJRAd5DFFB4PalK6M0hB
 jFqd7Pd3VtlEd8ZpEmQ+MW5bC9/YDbLkNVr7OyOlAIkhFJf4DodwG7KgbjJWzXvlKpoF
 z2ysC0cNyECSWCQ80mfQ/GPcGvYaPi6docvFXDDN6kKC3LRmg79XU2cxiSSdk1O1e62I
 qXnCMqoycO9CU2OQvXTiNAzy5WUMWSQK1YRB+hllnURsO68CUK47tm/M/Vr4Jws7cSjh
 L1rg==
X-Gm-Message-State: AOJu0YwVAGLpP5xJ98Jw4JUmTHdqlH/Nkffh+nUqcP9qQ3ibtHReKNkR
 zrsnDl8WGYmwS07g8HUoVpoNUt1g9+5YbWy2
X-Google-Smtp-Source: AGHT+IFxZr462kMAxRbWtsIPIioBXafuqkMthLVkUfAa/C9G2bp9PGMcvCPx58mQ4w8mrBSJ03A3Iw==
X-Received: by 2002:a5d:500b:0:b0:31f:f9fe:e739 with SMTP id
 e11-20020a5d500b000000b0031ff9fee739mr3002324wrt.59.1695974344356; 
 Fri, 29 Sep 2023 00:59:04 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bt14-20020a056000080e00b003200c918c81sm14576481wrb.112.2023.09.29.00.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:59:04 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 09:58:26 +0200
Message-ID: <20230929075844.1145939-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
References: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695974344; x=1696579144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIr2Tp7TrvRwUKJcbGKy36Vxy1dAEX/3QQxmX4P/nCc=;
 b=kmonb9Yt1A6s4mVCgeinkSDCv7a3/7BA69UfOTidX+rwn/I+R8tII3eBRYcgguPDHh
 032yOvFpay0ptTch6ipsb4IlRu1WRMzcvgM8X0xrM3X0s567VyDGaVAWN2JwyWIx+qjd
 j8mVUclHfsJFLzD/mDkPPXjWXrrrDzcgaSOo+RfvItg164z9QFfiepbRGCmGm6daVmba
 5F9dhKDI5hV21xw+jgtjEIBa2FfA8C1pmcp5Os9ZvbOTLgOgi80eOs+vX40rtAKz69yv
 nKigawO03TWkj06OlaDoZYH0DKDuTiroTSwI0CoEMA8KrFmf4huyn9mYyAy47tL15xjf
 FTmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kmonb9Yt
Subject: [Buildroot] [PATCH v3 3/4] package/webkitgtk: select wpebackend-fdo
 if wayland target is enabled
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400

egl is mandatory if ENABLE_WAYLAND_TARGET
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473

So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: n/a
v3: no change (added from another patch serie)
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 927792b1e4..cb10784133 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WOFF2
+	select BR2_PACKAGE_WPEBACKEND_FDO if BR2_PACKAGE_LIBGTK3_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 88bdfae27b..9c68fe73cf 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -115,7 +115,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LI
 WEBKITGTK_DEPENDENCIES += libegl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
+ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO),y)
 WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
 WEBKITGTK_DEPENDENCIES += wpebackend-fdo
 else
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
