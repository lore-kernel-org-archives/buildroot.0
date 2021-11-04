Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652B9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9878611CE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9878611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7AA40506;
	Thu,  4 Nov 2021 00:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uk17FquOgfzj; Thu,  4 Nov 2021 00:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A0340513;
	Thu,  4 Nov 2021 00:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 038721BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3193404F4
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7p6ULiIbb136 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 458B4404E7
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id v4so2683569qtw.8
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Au0EejHSkmanS5LqoOBP0BZlZYhaEUSblNpJlRz1EE4=;
 b=UpeKdxh8+uGcconrDqAjoex5LFFsXRJHdQ5c3nZHwjbcJe0UJUVQCyUEmL2aYvlJpe
 TYkWabhb4+/ML1A53b7uAVeOlJT1LrKjisJE7yyPPRMs557X6k9ABfM7QKNRTI0RljnF
 cZaxWEftO3V0LkQi2rlkNLLS0DrZ1J7q+zxAzdSxE15ODWiunykygh/09LZ2qbHdiqWP
 VBP5FYA9miO5xnHpFpA94hhoo2BSP/kLOHVMFPcBbksuYdy3psTwJ2y39/3fDLcvoB4Z
 xGS62mwMpBIIA2y6/KWtCB3zskBYA4FEfns/fGy42l2lIQS8gVLkyTvCOeX6Jh/4ipSY
 9MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Au0EejHSkmanS5LqoOBP0BZlZYhaEUSblNpJlRz1EE4=;
 b=ViFsThNHwzoM8zeygULoKyO0ftNPpOyBQIHn0y8Vp6qgP6fF4gXj5NDronLdrcGMjp
 IuvbiOCokAMS0U7LrJgLbQoxN2SXkJw00T3iulRpYpBS5wM88qon8OR9F+JLWw5z723Z
 4fIqkZiMneyxEcnbliEqKQwZKUcT4q2Cl1dTI4LNhWkit8zHlGZj6JYBJaatzMU9g2Rz
 PWL2KedbpZxAnJeSjc//w5ZPqordTjpEMh7KW8Xk+brAFyBJ+2W866aZs+cm58XhU5KZ
 nsNISqpSZan9mkQrs6TR2zT1qwko4blyxdbkI6FYtklwhlf2KtBSHgcZImCzio2D17tR
 Kwbw==
X-Gm-Message-State: AOAM531XsL1QVK3/BHq7Xs7kRBSjJ5RQ9sBrbtF8MO0fwF0bobmTdc5G
 3zqfuX86EeEveC/5jyRTe/dxhva2YgA=
X-Google-Smtp-Source: ABdhPJwf1fxJycI5Zr4E6A62POGqBEIgi3VG1Yanw1AWkZue4VY38CjZ5y3NpUXYKSBW+72Olh2muw==
X-Received: by 2002:a05:622a:1441:: with SMTP id
 v1mr50463066qtx.45.1635986174016; 
 Wed, 03 Nov 2021 17:36:14 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o6sm2847034qta.2.2021.11.03.17.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:36:13 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 17:36:05 -0700
Message-Id: <20211104003607.2022984-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104003607.2022984-1-aduskett@gmail.com>
References: <20211104003607.2022984-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH vRFC 2/4] package/webkitgtk: add
 gobject-introspection optional dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable introspection when GObject Introspection is enabled.
Midori 9.0 requires webkitgtk built with gobject-introspection
support.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a3db249ae6..4d5d0b89e2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -21,7 +21,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_GAMEPAD=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
-	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
@@ -59,6 +58,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=ON
+WEBKITGTK_DEPENDENCIES += gobject-introspection
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
+endif
+
 # Only one target platform can be built, assume X11 > Wayland
 
 # GTK3-X11 target gives OpenGL from newer libgtk3 versions
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
