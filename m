Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C35EC47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D965A60BCA;
	Mon, 29 Jan 2024 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D965A60BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDZ4oEvNv540; Mon, 29 Jan 2024 19:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC0C60D7B;
	Mon, 29 Jan 2024 19:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC0C60D7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D29DA1BF489
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 19:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8A581D16
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8A581D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpvNYhAtPuzh for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 19:44:15 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5868381A29
 for <buildroot@busybox.net>; Mon, 29 Jan 2024 19:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5868381A29
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3394b892691so1742427f8f.1
 for <buildroot@busybox.net>; Mon, 29 Jan 2024 11:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706557453; x=1707162253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Syro6HPayfTjfv7RmHXs/1RE5aGp3jg2dqC+MlHtQ2A=;
 b=e2HB2Ccg2jh/RV3wafBRHeIL/GVDi585l57393tzMN5LCXrnpyIyd9KmZxnCyFjdio
 rYrf76r2vYix7RUaf7x4NqwfZPxwmexss/YisfxQo9ZPdssoe4lY72pddvxptvGuTAck
 Rf/3xnQixHZC61y4oh/XC0iHyntPhg+TP3+KeItD9lVAvs+JsILtBmc8xzwuDagfG/IZ
 liIdNnFQi55AXL57VYDg54BIGermdHp6p1JeNu3C5Sso4sVUfNQ7xj643rBvag6SwAOl
 7bsT6PcMlDD3l7rGu1Joaurmznw4yGAKImpxK8H6caoIspL8Ia5lfr31oFMi5CBC7s6Z
 XDuw==
X-Gm-Message-State: AOJu0YzzGTleY4bbWP5mb3XPo4zp+l9Vi+GRUfkwp/7d6iLtsq2CLgpX
 oMP+qGYfbXYcaLur7xmtgdYEFiqK+gHNrKhr+xsqVS3SljkY6PlG9S34HR0D
X-Google-Smtp-Source: AGHT+IH5oqYKinJaTrsUu/rYmTv0QSMdqqCVO4t5thNsMaFXgHJILCUgcmJg5P/7Yx/onRI1LghZXA==
X-Received: by 2002:adf:e40b:0:b0:338:8892:fbdd with SMTP id
 g11-20020adfe40b000000b003388892fbddmr6632925wrm.4.1706557453269; 
 Mon, 29 Jan 2024 11:44:13 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 ck11-20020a5d5e8b000000b0033af31c1cfesm2300645wrb.29.2024.01.29.11.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 11:44:13 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 29 Jan 2024 20:43:54 +0100
Message-Id: <20240129194354.6851-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706557453; x=1707162253; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Syro6HPayfTjfv7RmHXs/1RE5aGp3jg2dqC+MlHtQ2A=;
 b=ONnkGdnn4GBoPmSZlPBe7KSalz5fK/BVyJ7KImSGf05mckhnIBlETh7YRyxzpriCk8
 T7BNnCrXtYL/MpY6+M+UFCniA/1XPbLx/q3N5BM0y7uBS5BUhFynFjJ3e06oxhzjFiu+
 hPe2yqo8l3dVtM6Hx6oEJras55BMUFm1Sk9uGbXqlDSlotXaC8uEIsQUPLpd0qe+zHM+
 BahZOIu8hfEnHX0gjy5ybBV+ptkUa0mMxlF5aXYcXauD3gyuzE/cJAz3AzVJWHv76FeZ
 Hu7AvtuVbmysDXTHWhJ8XuSrq44V6EH/ZcUDJ4Fhj+UMH+eWO8T1D+0rdAIgjBxG0hKd
 U4ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ONnkGdnn
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.41
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 609a56aae..0fa487344 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.40.sha256sum
-sha256  444dbb11f4fd5d592d74422441671854d1b744d0a7f3a3fbf9d4f936eb0552d3  gtk+-3.24.40.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.41.sha256sum
+sha256  47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7c8988bd651b6fa  gtk+-3.24.41.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 69315b6ed..7e5882f83 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).40
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).41
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
