Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE37ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF2A61102;
	Fri, 26 Aug 2022 12:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF2A61102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vunPuk-rgCnZ; Fri, 26 Aug 2022 12:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C88660B8D;
	Fri, 26 Aug 2022 12:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C88660B8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB99F1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B315E40AB9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B315E40AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLGbVIBm05DK for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66EF409E7
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A66EF409E7
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kk26so2951746ejc.11
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ckvSyThIzpREuD5XU30JXh6rJsdPJIryo9j6ItbAzE0=;
 b=WOWug2CG4Ph6+51NPCcKWytvgkQodvYc1EjJwcxlE/OZqSrN4yMR/HnWYsCqr9Shmr
 cZgYuA5LWTelFsUsfazcvP5b7RZuI2tl51/pN8QLJ9JfNfzFisFmIl+ECjb7cfqM25vw
 uMT7wfnhQbYnsJ5rQQyLyFNIysC/DsqlTKfxwlqFfSQHhTkR+apD+rX5ATl95tpnjtjg
 5TP63z5ckYZkRaU9Ie0Y+xE7mxduTIoDhsfVaF+vEhoYIh0dWfWozmGFenCHC1wqi0ju
 dD2P+ZYGwMgPcOrxTjH+xlnYrzjFxU2I1y+nbCvAPjOOVVU5vBppvOZ92Oo6sUKlxab3
 7Fqw==
X-Gm-Message-State: ACgBeo2Ru+Kp3oxyYLxmvqZup/01mmCanbFx1EJfhtSVuowzqz5/cbIF
 XPhh1WvvyXqcit4NNGfMC69gjZThxbwBzMms
X-Google-Smtp-Source: AA6agR5CkcP3ZahA2GeHQUCxFCaCMBA0rLLt9I6HEIWSC9UMTL+DZiZaRzg73/t39PBbkHoL1SV/0g==
X-Received: by 2002:a17:907:eaa:b0:73d:9d0a:702f with SMTP id
 ho42-20020a1709070eaa00b0073d9d0a702fmr5489552ejc.713.1661518402833; 
 Fri, 26 Aug 2022 05:53:22 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:22 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:49 +0200
Message-Id: <20220826125252.16782-27-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ckvSyThIzpREuD5XU30JXh6rJsdPJIryo9j6ItbAzE0=;
 b=Tlf66sz1lTPpGKyqpQcO/Avh8oa5kCcETDWMtc0oH4RF3yrvmupKbTNfZn1To+spt6
 oJsR2yh9dmeu5SvAb1QtIn0GRV0R+aW716KDkXHrwvD4I5J/sWg6UgxQqlNQds50Z37L
 b346mcxIkL59rQJmERnt5DB5/YuRKp2F9Odjp7/qZZuMR2QRDfpWt4tVHDIKtPWYNUMG
 OouYAYNAbCIyXgXrXVuLAjgKmC2BEr+6M2KM6IHiFyq5SC7Boj+XvNcANcEgtC0Cu2Hg
 zSKsJsTMYhYzWwn8CX3m+YLOcsfhF5z0LqtIaFwD1juL6OxDb906JdqfAHQoAIdqt2Sr
 o0gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tlf66sz1
Subject: [Buildroot] [PATCH v3 26/29] package/qt6/qt6base: add support for
 gui module libinput
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
index b5b67ec100..2911555963 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
 QT6BASE_DEPENDENCIES += tslib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
