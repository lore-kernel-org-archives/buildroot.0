Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DFCECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D9E40FE2;
	Fri, 26 Aug 2022 14:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26D9E40FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SklSyB1xO3G0; Fri, 26 Aug 2022 14:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB3A40FD5;
	Fri, 26 Aug 2022 14:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB3A40FD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17A841BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7B6F61113
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B6F61113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMOrhy8TAbLi for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1887D6110D
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1887D6110D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m1so2201649edb.7
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7VJGoD3YrmRw9BXMF5yxIKay4HIiO8KCVBPDkxKpzKU=;
 b=azsvZcXOAg+LI22LI5B+HmATD9RYVcCJeWfR/UXDMwGj+lvjpE3xzD/w0W4Sou0ieu
 tVUSTfxUx83y1/7wjWTpNdsZeK28BJIFIsZ3Wk6dHpU+YOxlE4JDjWFEVcRq15Cgv6Ov
 eUciNp2EvdnKKTzHhvMQOMaVq31KpyZwPEo3Vv8+6lP8j7bT8eTy0Cvl/kkGbUYIZZKz
 kx0Pi1x5xqiaZ5lKK/33NorLndlktOQZtlUUq/KpF6dieIqudE4zUtM/sEjzYRI9lXzt
 F/F5y1Wb6SnMSKua5M2rOIP8Yo+D3mKqyDzDc1H1j+WNsrWpl1s7zuPLmlPgD5K6Wpn4
 YHrQ==
X-Gm-Message-State: ACgBeo2SgzrCvASMNVZxgBC7G29G+TrRfp4rSkvdv/z1YuTWPCvbBuHx
 7V/vZN0hd6CuDM3He+k4iOqIr3GYf7iSDarJ
X-Google-Smtp-Source: AA6agR4a7GydR2plw+98Dk3VQ8lftfjXk8vPTBAOoyrYkBO5vLquiL9ODK5YmWJQA2P3J3WSqrO/Gg==
X-Received: by 2002:a05:6402:354d:b0:447:2155:734d with SMTP id
 f13-20020a056402354d00b004472155734dmr6765829edd.397.1661522133283; 
 Fri, 26 Aug 2022 06:55:33 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:32 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:55:01 +0200
Message-Id: <20220826135503.20612-28-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7VJGoD3YrmRw9BXMF5yxIKay4HIiO8KCVBPDkxKpzKU=;
 b=igwMpOGBa++qHNvOQhNVI+IFpWcERGDBQaiDfU9FO4Xq/tJK1yI7Z8+W4xBcgdDBLD
 wN2RHG1eXIFIA/7UtinDL0rSBwx07suFKM4vfm6WO5XPOYksoeIuFiWRGKVSdhXotik4
 oBU3P/1586EGZ1b1jm0dnyp8nPZu86/zmnC8DWA3a716E1dCO2ySm3Yo+ErVdWPtkq+U
 yNo3EGgBO9Q8pqbWW/+CgODp6llEcrHnuxzBUiWKrUV+3Pl9tH7Ewlwpp3qbxc/c41oJ
 tRE7D1QHBWc+fRmj+h1RZN2F7+Dk5RZmIG9JztZdgzWkxwYhXxWmD1ROVzwyLx8qzLhu
 DiEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=igwMpOGB
Subject: [Buildroot] [PATCH v4 27/29] package/qt6/qt6base: add support for
 gui module kms
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2911555963..424dc6f754 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -175,6 +175,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
