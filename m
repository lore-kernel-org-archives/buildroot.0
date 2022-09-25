Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CDC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B65A41756;
	Sun, 25 Sep 2022 12:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B65A41756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYqnk7wavepY; Sun, 25 Sep 2022 12:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F45416F6;
	Sun, 25 Sep 2022 12:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F45416F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3BB21BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCEE6416F6
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCEE6416F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuC51tLhddZW for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE67F416ED
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE67F416ED
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:39:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso5911220wma.1
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 05:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/Tz9Ta84EMnxSb/yyQhF5zFKoVEDzIjsDP5KdvBY6xo=;
 b=PaFcJ2IwifQEwHtuqwrP5XM/dlkhzdMcoQnZbZSyAsmUXg1xsRvKgf1LT3E8jGbRMY
 f9sUn1FlrtKmKYn3D2ErZHUshEAk1BXLOr9jB2UoBQRbZdHeCvDBHe/yVFvpzukOZYWq
 kUPb7WkrNfbt/PMU7wlT99albKSKv9H2JcrhOZH0gV17TK8xMy+wczJ9E3igGh5HZM+4
 P61qemGJasqMfyFKSDAxphGPO442v3QyP2C/7PgLOIYvmtKwFJfxL2L34rEEH7fp1Xus
 eOlpESd9KK3qhWOSjGFEXY3MoEjdAijege1WfYXJNt3J8XhJOmkP/3+gCe5U9qpCplOM
 CwVA==
X-Gm-Message-State: ACrzQf3MJcEcIcQsVC9IqFB6U26M2mSZhjcm4OTw208LxEMUJuyPQOKa
 RIjWzgs0ez6IGsShRcgZ2A4oot3dVnw=
X-Google-Smtp-Source: AMsMyM4lFMIxZzTJ87Q1LBmU9JoIA7u7h5XAFHITECFZUpJbsx02EtU/B6ZrL43mpBpGI382527oqg==
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr11639930wmq.47.1664109592508; 
 Sun, 25 Sep 2022 05:39:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003b476bb2624sm8011805wma.6.2022.09.25.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 05:39:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 14:39:48 +0200
Message-Id: <20220925123948.264951-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/Tz9Ta84EMnxSb/yyQhF5zFKoVEDzIjsDP5KdvBY6xo=;
 b=AC2N8PP2oSoCvh3KNHIJc7cw8vSR9sc6UzeV7w/ORqkiZV1LXwFwrnn3WZqapRr91P
 vsrgItAL+/GvV/bG50kGm9UDk1ooOlTeQ+N9HEczvKEF8Yxb9Fh/L05CpzNgen+v1ymN
 U6nMM0jinnG1+WR8SDhe8wqoDR+vSkhuU5h8gD9mo59om38FXzHAGEBYmfEqk+phflIx
 Ea1t879L4kO1rgEsoPgT8RU6vEEiwTGzv5TuUcizOkUk+ppbx/xZHajEXGaKQPwiuIKk
 38srx40cV0beU95FqMQoXPEmmPSE/y7xuGjD8MOY74kQWfcREvktJNrIMOXC7eAr6BGM
 acGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AC2N8PP2
Subject: [Buildroot] [PATCH 1/1] package/uhd: drop have_mfpu_neon
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop have_mfpu_neon which has been added by commit
b07de37540ee34e4e5fa8586ecc40da1586cd940 but is not recognized:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_INSTALL_RUNSTATEDIR
    have_mfpu_neon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uhd/uhd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index e8f197f9dd..2a5b69cefb 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -36,7 +36,6 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 UHD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -mfpu=neon"
 UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=ON
 else
-UHD_CONF_OPTS += -Dhave_mfpu_neon=0
 UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=OFF
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
