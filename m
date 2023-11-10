Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2474CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986BF42417;
	Fri, 10 Nov 2023 16:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986BF42417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tkzGwJornIF; Fri, 10 Nov 2023 16:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9D7423F9;
	Fri, 10 Nov 2023 16:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB9D7423F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7F0B1BF97F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B166160F80
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B166160F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dovb85ZdYsVg for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 16:46:24 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C137560BE3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 16:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C137560BE3
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-507962561adso3291684e87.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 08:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699634781; x=1700239581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szczuh9djr8wUOjl2dxC590Z2QrCsP+jFnSWxmDnWYY=;
 b=P2MYWd6D4ubfo6Ke4t93pxMtN+ic9ic6kTMYatYu27b48yOK8GG/4/H1YgCRnjsXb2
 WR9sIOBIUGrlMTXddayHmgNpfQa5fFE1aBRWDdURJ5gn1dzVAIriBjJt5GGytCgtvJm6
 RMWt25kntVX2aETANgztLk0/oLzPdefxMvFVLGR2BhFIrq1L5RjuzG4jDXR7v/6nztI6
 xjxxeLO++Q39MfhlYrkN6Gby20EtKqiKz4ct10D8tUNsGglkIvySwcLdxCdDC25tQZak
 8xChI3AiADjdosqOI8nRJdypcVodZmaK0ZHTprHy6Y9W+0kSCv2U2jmzMC6mTmtx14ha
 QvOg==
X-Gm-Message-State: AOJu0YwFrj7zkaoew9XrEx93W6yvNO12Sghctm+3pmbqiqPySlr21x9h
 fTYqVnOOU2M2pi28XgchRfmSvAA7tyNEk3NO
X-Google-Smtp-Source: AGHT+IEtTUhI4jc6P1djQLkpIdQ/tJCUA1hWM8XcsWRXd8zePHdO3FuJ0DQC4CIz6VNHMzbgeWp8Bg==
X-Received: by 2002:ac2:5208:0:b0:503:35bb:1e74 with SMTP id
 a8-20020ac25208000000b0050335bb1e74mr4076170lfl.61.1699634780594; 
 Fri, 10 Nov 2023 08:46:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:afce:9bf:b5dc:c3a0])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b004065daba6casm5712828wmb.46.2023.11.10.08.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:46:20 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 17:46:15 +0100
Message-Id: <20231110164617.569602-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/3] package/webkitgtk: make gbm support
 optional
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added upstream in commit:

https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
so ensure that we unset 'USE_GBM' if we don't have libgbm.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2,3,4,5: no change
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bb6df3d592..88bdfae27b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -88,6 +88,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
