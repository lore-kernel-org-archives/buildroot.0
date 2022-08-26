Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A4AECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A7A61123;
	Fri, 26 Aug 2022 14:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A7A61123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9P7Krf78TND; Fri, 26 Aug 2022 14:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38ABF61112;
	Fri, 26 Aug 2022 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38ABF61112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2CCC1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A49DB41A3F
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49DB41A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tq-eJnDeszkI for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83AD141A21
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83AD141A21
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z2so2226154edc.1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5djllh+1eXgutqcrX10yM0hwfkR3vLbf5yhuZgiuM78=;
 b=rUjHFC1cgSKRwdOqVuXMkTfo/i/P/hQGb7uihKjj8toLO7GY7xRe7iBVTDRnGRw25x
 RNxygR/PmNXkwA5NNItQwlj/NbDU4nMWOiFW0+H9YQg710z4CGWGhZ4jObJDbbuM0HX0
 ARbw8fGUQhRtDHB6GHMo89fsRo3ZjdJ3nk3ONfklSqtgna53mdsjNF4tL21zW9lWZXei
 rQcYscpBtJBUtJ9l8vSjCo+Q5oipmgrDmnkpjbmUyPzacOQIvZQDZYM5a9xcLgwvr8J5
 OaV16/6UcTUzsLTpjogvX10NDY31/4TAdSzthOxQHUQ/kCfJ6GySqLDCQA7H0ipPrTtV
 GRJw==
X-Gm-Message-State: ACgBeo2lngaXQVURBKChuyF1QLXgXPVo+YURHn2tDvwfJMkZ0KJ8NFnn
 8WBC9h6jX6bsEnVGBKNl7PjsS3Vvq/iKEx4/
X-Google-Smtp-Source: AA6agR7uXu+Jk+3Y09HbpOllmttF01nutpV9sML2DFhvD7gBVXZORJiXfa0H7MnLGaQ8pdh58xvSIA==
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id
 k22-20020a056402049600b00443a5f50d3bmr7152788edv.331.1661522131339; 
 Fri, 26 Aug 2022 06:55:31 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:30 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:59 +0200
Message-Id: <20220826135503.20612-26-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5djllh+1eXgutqcrX10yM0hwfkR3vLbf5yhuZgiuM78=;
 b=pEnruyQuc5vkx7g0btMU1gHFuYiqZPU2w6VCQPi5G6Ku4ybBd7yR/knmQmPZ5aB5TW
 WHWyYnOnDOUuHRXiu+HKLaIZp0yyOKSaUo2x9N8iaxQ4FYM/4KlY1TcW5LXFWYiPwyQz
 puq855lroiptwkCtdAtAMJ5p4GwOgKk0KGuKOc/t92GPH4MHWwPp1k98Hfj0U26S+9Lk
 bp/kJ65t/jeWldLDosr7BrCTLtVUVywnhrOK0tbPQFU+DKNRYG3sTict7sJCwijToTI0
 3KXwfaR2yj6F2Oqu/V91dC0tdJeFSJkJOpUFGnTqAgRPi3nXTD52i4Fyfg8w2pN8K3Iz
 o0DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pEnruyQu
Subject: [Buildroot] [PATCH v4 25/29] package/qt6/qt6base: add support for
 gui module tslib
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
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 52c1ba1421..648afa78a4 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -271,6 +271,12 @@ config BR2_PACKAGE_QT6BASE_TEST
 	help
 	  This options enables the Qt6Test library.
 
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c4b4876d53..b5b67ec100 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
 QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
 QT6BASE_DEPENDENCIES += libgl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
