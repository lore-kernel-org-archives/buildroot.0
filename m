Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2245EECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD73A82F3D;
	Fri, 26 Aug 2022 12:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD73A82F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3b973c_C9-yh; Fri, 26 Aug 2022 12:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14C982C89;
	Fri, 26 Aug 2022 12:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14C982C89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7094F1C2742
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C09B40515
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C09B40515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FIWkzknDOxd for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9660340FBD
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9660340FBD
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so2975891ejc.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5mp7siQU6xBaEgCuAA1Rl+aUp0A4xmaaXdCX6UXjqlI=;
 b=ERTkTqQ14w3Y0L06MIdaPUkELr+1BK8DEBvuB5Ct9zFkA9z96zWJNLnSe3FUjNyyg9
 7uL8UmJxjmQRShKhBc1mdLmXo1C0vkE4JVRsjBKFPwwkrEJQQcbkznMnJKxe0hfbMk+w
 AwyXrT/coO9JU6ugglpFz6xmm1gDddu4KHl7BHOG+jYIWeliqV8F7c2JMXcAYevype0t
 whvD898qqS7D9cuN03Wv1uEwxaDFbwyKOZ/g0odQb1xB4HOwja0F/Ja2bOyYPuXDyy8D
 0khf27lNSqBzc26/xZLQzg1GcycSJ9V4krb0rsfIxTEfSYGhpxEtm1dFiLFUB85fpmdg
 mhLQ==
X-Gm-Message-State: ACgBeo25/47DpJM6TiScv6sHYw2ceDNd17ZwI9C55aQo8LMXRYyc9usE
 suQmoj4fp8dKK2vDaiCgUakJNiDvTjNua+m4
X-Google-Smtp-Source: AA6agR7mREIzd1jBzRyew91FKFxwUWklK7xyyLbKheyUh604fvIPcEFo2+Ml4B2xzuedw6D90l/HMg==
X-Received: by 2002:a17:907:d8d:b0:73d:538a:cb87 with SMTP id
 go13-20020a1709070d8d00b0073d538acb87mr5571478ejc.368.1661518392400; 
 Fri, 26 Aug 2022 05:53:12 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:11 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:39 +0200
Message-Id: <20220826125252.16782-17-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5mp7siQU6xBaEgCuAA1Rl+aUp0A4xmaaXdCX6UXjqlI=;
 b=XUML8uyVtm6Wsn0iWZ7ErgsU2yta8KcIR2svbcVBRupr/4V2OwTje0TM3lGiVqsIPA
 qGojfcEQzcEjAwDsVup2ZCE4TW+HN97Os+InaLD/BQnbIFI+cfYe/fEDK8KGj+USzXeY
 7OpYXNE1aeQbNaz8lTK3T37uSkea5C+ygmckQwZc1lDWF+vbY6nLpXh+fp1ReasiKk6c
 8zhQBjNQ+q3fld1jSe4go/2R9oWJ2wdCU8oWhGvZ/7bta7ZcW0zf4N0CHUiwJb3+jsbx
 wgCZl+FGgmnngsrtN6YZqMZ5hf7rzY039BHGrqYcW6I4A7JCYfCQ7MdFNvmkJI0DMvoQ
 tmDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XUML8uyV
Subject: [Buildroot] [PATCH v3 16/29] package/qt6/qt6base: add qt libglib2
 support
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
index 3e94eaacb3..87ebc59cd6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -121,6 +121,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
+QT6BASE_DEPENDENCIES += libglib2
+else
+QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
 QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
 QT6BASE_DEPENDENCIES += icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
