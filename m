Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A5FC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 14:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BA260F4D;
	Wed,  2 Nov 2022 14:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BA260F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3nauKPRSfaA; Wed,  2 Nov 2022 14:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A206760F51;
	Wed,  2 Nov 2022 14:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A206760F51
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D36DA1BF909
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE3D60F4C
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 14:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE3D60F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afUPJ_XBH4OR for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 14:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43BAF60F36
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43BAF60F36
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 14:49:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id cl5so13266546wrb.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 07:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zj52HPzRrI8hgKsH4qCtGhuqTErgIV4zqfqLBJOSeV8=;
 b=x8Hng9hKSJ7OSUJvsLVZEGcJ4A7ed6agGx7TN1CVTv0FJRW1tHEUxmY6uGqpwsRuG7
 zByavSjLV36CEcGZYaQ1qoOncJ0Zhm2KhGmjBAeqQ/oSfjwj1UiEPCGgo0ELbFhSYeAZ
 V3nTYD2qR3sz3a/DuVT/OtlxxGr/oXbZg+GeCJTivenNSolQTV7JaC+hHrx7xmEHVo7P
 xFu/BRtSI8paj4Kt5+sUR5gXdXDqKXDZ8er6md0ELyCRewFEPCbay31lWTpqZXpgisKx
 /Fs/Dt6rJJc356h3XhVjGdRKI7HUn/MveI+8hcRCSO+7uV7133mIL8Rxxg0prLhSB7ob
 NGJw==
X-Gm-Message-State: ACrzQf2jTnQODEysPqgc5ORMK5Hx5b3Bf9kwpNHf00YIdKnDJ+g0Iw63
 QEWhJzJR62vaXaAIPxigWyzPpeF2YtajBPKn
X-Google-Smtp-Source: AMsMyM7WoxLDwlLhY7cwhrgQsiRPjf0zKibLsJMolK9xKRKk43ArHitvzhW2QOMuIFFno1XpDw2jSA==
X-Received: by 2002:a05:6000:510:b0:235:e5de:8da0 with SMTP id
 a16-20020a056000051000b00235e5de8da0mr15620822wrf.416.1667400543864; 
 Wed, 02 Nov 2022 07:49:03 -0700 (PDT)
Received: from TIM-LAPTOP.localdomain ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v10-20020a5d59ca000000b002362f6fcaf5sm13280844wry.48.2022.11.02.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 07:49:02 -0700 (PDT)
From: Tim Gover <tim.gover@raspberrypi.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:48:58 +0000
Message-Id: <20221102144858.3037-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zj52HPzRrI8hgKsH4qCtGhuqTErgIV4zqfqLBJOSeV8=;
 b=POWU+6t8M3SSIJF13H0bngdKuwFeJf8ECYoK8ps8Ggk9Z53q0EX0/dCP5Bib9/P3X0
 Rzx3XIqLEDWfZtm6y9Mlt8onB0kG41ZlgrdiU/m6dDWwFy4RK+pNd+MrIXJEXAx5PHrs
 gGdLiFaQsxPQ3G66m8U0wQ6NaPnRn83M3hqAeBiQz9QX6UlNYuUr312ZULI5ZsvIr+NL
 67zFbQWNOzXZfUs9bkLihYFyvGqaxv3OfMwNKJ1qRA0jmlQ20k+j+f4xydGmnejathSD
 1UVCIsEbjfQ8cexYQjviNSrwA9UXZBLw3DleZuO4VE0vJUTka1vPy243czANxIxezSII
 rGfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=POWU+6t8
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix hello_
 applications
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The HELLO_ examples fail to run because the librevision.so
library build by the userland package is not included
in the image.

Include this library if BR2_PACKAGE_RPI_USERLAND_HELLO
is selected.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
 package/rpi-userland/rpi-userland.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1204196e19..2800b56296 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -25,6 +25,9 @@ define RPI_USERLAND_EXTRA_LIBS_TARGET
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
 		$(TARGET_DIR)/usr/lib/libilclient.so
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/librevision.so \
+		$(TARGET_DIR)/usr/lib/librevision.so
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
 
@@ -32,6 +35,9 @@ define RPI_USERLAND_EXTRA_LIBS_STAGING
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
 		$(STAGING_DIR)/usr/lib/libilclient.so
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/librevision.so \
+		$(STAGING_DIR)/usr/lib/librevision.so
 endef
 RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
