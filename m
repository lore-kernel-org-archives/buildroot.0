Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D151ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7B8660B63;
	Fri, 26 Aug 2022 06:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B8660B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6ybJwc5UDLM; Fri, 26 Aug 2022 06:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB5060B42;
	Fri, 26 Aug 2022 06:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB5060B42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4571BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355C040336
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355C040336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XvJdzPeMJdF for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21339409D3
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21339409D3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b44so945949edf.9
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Iy4LVl9WZ5JYg0QB/G4FLJxN6HVZPq03JIgDOD3hwWc=;
 b=uQQHI/0vm9vmKeorVhPKOuj9/ruVLUiOUxZOLDAcb4pzzI0sILsGRU8TX/vriwpuBA
 IOGx8J+zrFsv2RbaUKMJp5IHCyb0wYbi/a0qIOHupcjvFAQ41cW/o2RJ33VU4vY/T9HP
 C2vyMh0eXycW5zt0SyT3L9RILIQys2iJBycpUXvSn9F9o3/SiiPAVWx9jXYshUjVeDRv
 dXalEL51rdltykQ8VAgvPdjv72+KrA5lun/9Z8Wrcw0w+L972vOgpZIOsF2eSDNFE5dn
 dSHAvhT0CUFO0OHfQB6+alu7AsM//j1TZonmHEWcWYXAuyMYgFkKpL0FGrr/bx4JdyCD
 4B8w==
X-Gm-Message-State: ACgBeo2snBxFCxJ8P1q1v81lvwoVO0uTpdPDXlTCZc1dXe+nnLjgDc9h
 ouERSBuWgk/+kEB+67l5Y55yWhrLbRR3/SB+
X-Google-Smtp-Source: AA6agR6F/tDzjOeBTa5lvCphORKAon6gXFI/8afjWZAQ3TkKBbN+oVRR9wriKQVrDj1ZRD6WPUjdIw==
X-Received: by 2002:a05:6402:13c1:b0:43b:e330:9bbf with SMTP id
 a1-20020a05640213c100b0043be3309bbfmr5642176edx.417.1661496508223; 
 Thu, 25 Aug 2022 23:48:28 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:27 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:55 +0200
Message-Id: <20220826064758.3968647-27-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Iy4LVl9WZ5JYg0QB/G4FLJxN6HVZPq03JIgDOD3hwWc=;
 b=XHu547BPUE/9+MsX7oGQS18EpHVtn7y+eT6rqCXM8lEovm7fGxJvjp6/ybFsCaJ71d
 8+z3YRd2f/l7ONsJxCdLLKgM6IruPy/2kR5gs7M1o/afMRszOSnjhoPExPMJZhVIq8ZF
 Av3/2DAAI2/1hWzodfp+MPE+bp1o+E5+Q03XQNZtjuZmniptgV0+g+IO2GPG9eFMDmkw
 0Hi5HXA3ORm/IlzHIT8FhZNnFx9MfOsGHSXyVn1h3t254fNq5BHSO+SlnsDtPxjW8F8A
 +iokKhdTa8hZLvjIaBEhvNflv4JUNgKWshqYLXVTGcOczrOlYf6udrtG1AG6iu9mU9z/
 PrRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XHu547BP
Subject: [Buildroot] [PATCH v2 26/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 2c61cac9f6..f33dd2c636 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -283,4 +283,10 @@ comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e20be63287..3644abc4f9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,14 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
+
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
