Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297F6C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 22:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FB460B43;
	Sun,  6 Nov 2022 22:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FB460B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieTgIQ-7ndwd; Sun,  6 Nov 2022 22:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F5C60ADD;
	Sun,  6 Nov 2022 22:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F5C60ADD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4EB91BF2A5
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 22:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0C2460ADD
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 22:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C2460ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI2i2P3-P3c6 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 22:20:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 893AD606B0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 893AD606B0
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 22:20:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id y16so13767004wrt.12
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 14:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejOtgUJ3ZfPfNxA4UrsI6lJtV7mmMucJLSmYpoHjocE=;
 b=guAekhqHWpvEAxuwwUOjSnfRsK7eHoToZwFuyFwqo1o/3c4eUCbtbd22U/D8+Zrfxa
 eHRGrOZ+69U/V9syGdd5qmO+DcIxpJ24ayVwcAk4qlP8jmMszjauRu+8WN+RedutSKTH
 dNWfoxXudwH9MXJxK3FRVsEc8LnSwPI191V7BcpVd+L71Rn1YNjgjPbbRdOtV/HDpClz
 OG6fB2dShJ2Rxkv65GLm0OYOfagftYB9urG+65LwpQi0iPnaMwIrvPhGuAqskZ0XN8ay
 g9hT98WOrDwkhXHGVlUHbW4KxJ2uXR5K4FqS0VY6X7BL3OQRACveCQdvYFsII4jEx2PE
 EulA==
X-Gm-Message-State: ACrzQf30BsrYZuZtQ6aKCM5MclYCTIvXygeITdhfMoLrsE6ZWujZNDk0
 kEpc0h0ess9LkWi2ARYddE0HCKNY+ho=
X-Google-Smtp-Source: AMsMyM4+l0Fom0FRLrJAtD5BWKc2s+JMAt9kFPijkOaSUNXhlSGmgZbBZcTyXj8cCO5tHsntGb5lCw==
X-Received: by 2002:a5d:53cf:0:b0:236:bbc0:236 with SMTP id
 a15-20020a5d53cf000000b00236bbc00236mr27606511wrw.572.1667773245234; 
 Sun, 06 Nov 2022 14:20:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c26c500b003b50428cf66sm6125595wmv.33.2022.11.06.14.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 14:20:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 23:20:42 +0100
Message-Id: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ejOtgUJ3ZfPfNxA4UrsI6lJtV7mmMucJLSmYpoHjocE=;
 b=LBSX3hDDIt7cAEvModPZtbatRpLXxjSfi5mZLimULZB5z730l/8c3ug4vV3qyPUpRt
 EjNQxpLW4eNKqVavvm2sui0BgH+RZD4h8BwBZ9xE3TJtcQaDNVOEh3SqHrXAgJzmM2J1
 i6uvC/3SC/hiso1efd4augAp+3XNGhGcpnti2S7D+jOIAMeUIKu9BwEg9mbdLg/T2N7R
 eXJFhSLspoHjHOq59F4XazZBYBO5I8x0HA4en5gGKkD/YqzJskMQEPLEUgRqXESCP/8y
 gUg+T68lkRrQY5J5vbNpZhLUaJrmnsboxuwxhB26I/GyWIcuL5iM77h2aJk6gkomuWSy
 VMkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LBSX3hDD
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass TARGET_LDFLAGS (which contains -static) to fix the following static
build failures with gpio, iio and pci:

  LINK     lsgpio
/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.4.0/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

[...]

  LINK    iio_event_monitor
/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0/build/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:88: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d664a7ce
 - http://autobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/linux-tool-gpio.mk.in | 2 +-
 package/linux-tools/linux-tool-iio.mk.in  | 2 +-
 package/linux-tools/linux-tool-pci.mk.in  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index d5a0dbda38..e825db1b11 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += gpio
 
-GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define GPIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index a8cc89e830..27ab0ed7ed 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += iio
 
-IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define IIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 4ef0368a32..17246f5d7e 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define PCI_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
