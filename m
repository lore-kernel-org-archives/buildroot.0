Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBBFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4CB40471;
	Mon, 31 Oct 2022 11:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4CB40471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT_HW4sw6vvp; Mon, 31 Oct 2022 11:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 774AE403BE;
	Mon, 31 Oct 2022 11:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 774AE403BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE8211BF2FD
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA80960BBA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 11:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA80960BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGBKcWJIfiYg for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 11:47:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9458760BB5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9458760BB5
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 11:47:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y16so15546176wrt.12
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 04:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ytFSgzB0wG7ZKFssTpDMFDVh7z5FjOwiZn+qAXRG3k=;
 b=NyQwVdkWVSB29gd/Doq54gkXu4JdPMQobP5YPvoqFX9tMnIJSoW2Jm3mSM9vrr3hLf
 efOpJN2UOKtTQAw1ku0dgnuAs+i9870brOadVbOOaAeteAQMS6jhJYXaG67FRuSVhnlH
 50FDGga9L8bqmO6dUuwjHxun8tfatxc68zArFyTmNBZs/KbeevtewiFX2xOu2xrXj8h1
 n256jkte38IWEK1Eh9zUzr1xkEMZplwM91CSVgiix7WbkGjRNIMopTtCab2AaKE8uA1v
 Hxbe5s2oBjJRfWNHoZKLECNOg2JeJcE9gKf3fV4tE5VCUNQPAWi6/Uf8mzQU0dQe2s4j
 2DsQ==
X-Gm-Message-State: ACrzQf1EhHzxvt6h7cFGqCblevBoQs4FWcvwgNsVCzj+zB4nNeZ1EDkh
 n+1Dr6H7+gvJIzKtC+o+eenthhqe1BuoW5Vx
X-Google-Smtp-Source: AMsMyM5zoDNmRtHzL/i8Bd6WnezHPjA3KlACkYx+9nUVr2V6szwNsuaG4ulztQpKxiaAFU77PnZ/Bg==
X-Received: by 2002:a05:6000:1a85:b0:230:f67b:da03 with SMTP id
 f5-20020a0560001a8500b00230f67bda03mr8136572wry.296.1667216820274; 
 Mon, 31 Oct 2022 04:47:00 -0700 (PDT)
Received: from TIM-LAPTOP.localdomain ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 bp7-20020a5d5a87000000b00236545edc91sm6981276wrb.76.2022.10.31.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 04:46:59 -0700 (PDT)
From: Tim Gover <tim.gover@raspberrypi.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:46:43 +0000
Message-Id: <20221031114643.6648-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ytFSgzB0wG7ZKFssTpDMFDVh7z5FjOwiZn+qAXRG3k=;
 b=YE/HcSghGaIN668XWljMZ3CvVYV9d8Q2NdEjpIB5hoizWoZU3mnSyHD75jfHUKIjto
 iJSDPybwKGB6j3/fMzhe70xw+7TpPHm6bBqeLZ1CWxebFHbuaIhBJ3JjZWV/+ornwFFl
 nMw1jH5XCWzRNrpSK1qaOap7BtQYVJ/HlsIqqbbN21fiQBm30RvWe0C5eIZ4dpXPVN3T
 /DVwfZxcrl8k5vweYPsiH0a0TBBrIFqSabVK9YAC0bNSymCI/7RvRAiaWKbdO4BMt14B
 ICGrHqvzR1TOXcHMvR22Eo69Q0HerRe84/cRDuQVhMB6CW7rCRntBPlvVTGLUroB978C
 RzPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=YE/HcSgh
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: add overlays/README
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
Cc: Martin Bark <martin@barkynet.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a custom os_prefix directory is specified then the Raspberry Pi
firmware probes for the README file in overlays directory.

Since the README file is small let's include it, otherwise,
the firmware won't recognize the overlays directory if the user
later moves it to an os_prefix specific sub-directory.

From
https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix

Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
with the main OS (i.e. os_prefix is ignored).

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d4d1d07b3f..908d7def6a 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -48,6 +48,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
 		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
 	)
+	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/README $(BINARIES_DIR)/rpi-firmware/overlays/
 	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
 endef
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
