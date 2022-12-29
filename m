Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BF9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C9DA4055A;
	Thu, 29 Dec 2022 09:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C9DA4055A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItufDg3pKakz; Thu, 29 Dec 2022 09:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD55040102;
	Thu, 29 Dec 2022 09:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD55040102
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFED1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 643A280DE9
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 643A280DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VztZcJlqc_mG for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A1980DC5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77A1980DC5
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:30:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso2616457wmq.1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pP4k82K4lQkZ6K2E3wmODrzy4/10sXBDEiXcEJhACc=;
 b=quiT0Gs+v+98bTSqYkhHx1CWcYMcWEac3w+YJ4xeg+TdQ5ajpJYrjKmuvkkhQo+DY6
 WUpIx6fKxivYg+nkTKv89luq86oGcXpJVhpU3Lg88Ag0iP4KG5bbzj7wUv8Ay9v3GaWc
 SgztnxdpQXfrxBRyTShh4sLdOmuoCWPNDo/ZVKyNZ3NDNdYcbciS9LM5vfLuE4Yjs44o
 6MhzdKfHiDRjXOSxbzmSvukVgJrw1PTs8vx69w03LCn7sinIVJJRorgf7sFtl1HZJhZ7
 7fZqX0KH4as4+xI2Ig1K8OBApNBeu0F+F9MlyQu4x08xYHj1ixGeoYrNX0dyKg2+YkCT
 C9qA==
X-Gm-Message-State: AFqh2kpBfI0si3Z1YNhkL8TzT2ELzTTFrRf2awbQjYLlPvOjpifweR6v
 pceTMQBQIYPBxd06vjj39hYgp1P5g1I=
X-Google-Smtp-Source: AMrXdXvp4gfET1bmr8ByfUkeiwHOmbtgvdhdpsHjygQR4F0JV7d5VYhSvMzoXwRGPAxeb2pL0lT38Q==
X-Received: by 2002:a05:600c:5114:b0:3d0:75ee:357b with SMTP id
 o20-20020a05600c511400b003d075ee357bmr19903943wms.21.1672306236401; 
 Thu, 29 Dec 2022 01:30:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm33101739wmq.8.2022.12.29.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:30:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:30:28 +0100
Message-Id: <20221229093029.264681-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221229093029.264681-1-fontaine.fabrice@gmail.com>
References: <20221229093029.264681-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pP4k82K4lQkZ6K2E3wmODrzy4/10sXBDEiXcEJhACc=;
 b=YIOpz1k3KUI0/zj2pVg2GcReyE4Um5tIcxCh23JSztmqGfAPFoGkOQXaxiLGYidrWp
 +NqZb7T0ipYhOwNW3uJpDqQ/e60Pw7MDEI9OzJaKg7tFgiKgKN3jl0lKjx6ePhHyDdt9
 UUFFREg5+XIrwIaLgKeYv4iQfAWHMqJ3/TF3/QuwyQMOw238km5vPyhkqUPunxAJzn0y
 vfDGqqsZPKmCa0sMmuw/0DjH8jJbZ1JOymQz5scWYh2bRCVlWqTL7pu2rpz68AAn/aEi
 jst3+bPA5CpRHjNzn3IoU2vDywJ4YTqkn7udtjS7gfqeKmWnTThJAfLhL4moqw85XKrm
 11Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YIOpz1k3
Subject: [Buildroot] [PATCH 2/3] package/tiff: add webp optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

webp is an optional dependency which is enabled by default since version
4.0.10 and
https://gitlab.com/libtiff/libtiff/-/commit/9eacd59fecc4ef593ac17689bc530ab451c8ec14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d1004d6668..b9e3656e6f 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,6 +72,10 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
+config BR2_PACKAGE_TIFF_WEBP
+	bool "WEBP compression"
+	select BR2_PACKAGE_WEBP
+
 config BR2_PACKAGE_TIFF_ZSTD
 	bool "ZSTD compression"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 90b28ff37a..6d761ad678 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -100,6 +100,13 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
+TIFF_CONF_OPTS += --enable-webp
+TIFF_DEPENDENCIES += webp
+else
+TIFF_CONF_OPTS += --disable-webp
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
 TIFF_CONF_OPTS += --enable-zstd
 TIFF_DEPENDENCIES += zstd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
