Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF8BECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD54B41524;
	Mon, 31 Oct 2022 15:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD54B41524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPPY5jeLcbLm; Mon, 31 Oct 2022 15:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED79410E7;
	Mon, 31 Oct 2022 15:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED79410E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF301BF95C
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBAA8819F3
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 15:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBAA8819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipm63hymHojq for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 15:02:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF1B81902
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABF1B81902
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:02:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y16so16341414wrt.12
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 08:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yqcd/oXnOPodkGTUzy8MM/PPdeXJWeLzRf4txUD432U=;
 b=HEPy2Nb0fam2QR+xUEcOLLGspl0eR2yIXm8Dq9oNle95xjvDmr0ZSYWxr6ibt3MMmS
 3Rb6PiESzkXeoQKZzEPwmTE34ubIWg5DhxaZY32yHNZFaXXdBqDtRmgwF0XSsiTIWzbT
 8QyXyrF0voWCrmt1xA1uz3nbR+2z+KkQlmZzQqCyOPp/CoMcNkQ1kOhf9VcUTPb36U4S
 hTVr8lqmXlIRp1QA3qk+RyCtM+0OY2YKxVWNL8M9GV8EH6yWQGnaclen3eUghwhiAkFe
 eFoYjGJK9zOiiI+e5rrvsSMKR2tb0zOHgZioBrJuF4DP1O4bfP5QoeFym3z3gBQs5lwc
 ENSw==
X-Gm-Message-State: ACrzQf0R5g823q1yhTYYEFbFbshjVrhTIoK0KezyfMNfCmg44krdfhja
 6ahH/tK4U20wbL8whk4a9P67VYiG4mTkvg4T
X-Google-Smtp-Source: AMsMyM7x5VMg+kC6JnC/Nrk/kK5iw93Q8uxciXN2Q7JYZgQW4eQ2heoRfAcoIsJq3j5psMpqPZVhHg==
X-Received: by 2002:a5d:53c9:0:b0:236:69fd:d4cc with SMTP id
 a9-20020a5d53c9000000b0023669fdd4ccmr8538195wrw.618.1667228566418; 
 Mon, 31 Oct 2022 08:02:46 -0700 (PDT)
Received: from TIM-LAPTOP.localdomain ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 m2-20020a5d4a02000000b00236695ff94fsm7332524wrq.34.2022.10.31.08.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 08:02:45 -0700 (PDT)
From: Tim Gover <tim.gover@raspberrypi.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:02:35 +0000
Message-Id: <20221031150235.12074-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yqcd/oXnOPodkGTUzy8MM/PPdeXJWeLzRf4txUD432U=;
 b=pEcw/QhH0MNu139lJYPMk/eHL/0d5wu9xjKbOzEoP+R1+ziQhF8GKoY2Scc2MToafY
 X1oSeVVfuoTj1Qh48wkH6VZVDff6HbrcS67vuPz+yruG3DZ8aM9W8F628VjRHH0HAgX7
 BMxx6z3sVPKF9hhrt7Y/TUbxVfxx8lX9BPcTBOo+rO77zPW0zqITACFR3TbUFjxhlqCw
 3mOTFFqlvqpgnOh+pCHjL1auM7dwqa8efXfVHOH/1g2Zs6lUQweOlgAh2H3Lb7kGospi
 n3hplrXDjN0e0L6X6iB2k1lbyTyCyb8yLzGLfmIzpTJU0MUFjOUdPny/AA9uVELRTiMr
 1PxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=pEcw/QhH
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
firmware probes for the README file in overlays directory. If
this is not found then firmware will use the top-level overlays
directory which can be confusing if os_prefix is used in conjunction
with other filters to implement alternate boot behaviour.

In Raspberry Pi OS the README file is always included to ensure
that the relevant documenation is in sync with the overlays. Rather
that including the entire file let's just include an emtpy file so
that overlays directory is consistent with the Raspberry Pi OS
APT package.

From
https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix

Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
with the main OS (i.e. os_prefix is ignored).

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6f5902fd52..53d6d8ca06 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -57,6 +57,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
 	)
 	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
+	touch $(BINARIES_DIR)/rpi-firmware/overlays/README
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
