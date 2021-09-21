Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCFA61168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BCFA61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45E1406D4;
	Tue, 21 Sep 2021 20:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvgztBqyihIj; Tue, 21 Sep 2021 20:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52181406CE;
	Tue, 21 Sep 2021 20:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5CB1BF9AD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C073608B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_pmPcm7EWEc for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32E7F606D5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255700;
 bh=Ph5AJ9QUUnZEJbCKxHG3cDt7ZkoDa3BvfF7+teFp7Mk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GHcYiGH0duDYkroXRsZidY8FFX8V0qURTog5nNVcdWhRts94K6sFg/60gnJ0yw0+Z
 uJds0WMXY7C6T3m7dLGoMC/0R03GbfAo3jPNfrdjn483EKFvBUpvFxVAU3R0kdGncf
 MNnUGo5cnoewFa457C1vZLe86rgYC39j7cZramsU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGQnF-1mf5Y106LF-00GuEK; Tue, 21 Sep 2021 22:21:40 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:37 +0200
Message-Id: <20210921202137.7092-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DxGA8PPk2bMr1LvxedlfZYn8kwBav3K9B9JfLy2hl6+vE7Nd+l8
 Bsv8zZd52w7jieBXk+cBNR9Xdv1qODa4sY97SGCIAvAO5LnPxb/r1jOI/Z2//O52a5BFUcc
 eAAWtnSVzSv7oAtEIXFMav627ZKuwgEHviV78FyPuTYde6POhnpByNp4zFluAV2WsUFW2Jn
 lfPLxWyKfCsshPzcoYUcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SbOgagEyBqs=:gxS8UXyZmTN10n+I+UHGzy
 v8NLMD/c6UC6DThsQ6ZRqxXGjfNJFR4OiGKA6ZJePGW2gq1H50Yy/7iFCZlE2X4lhOd5EChX5
 9sVVy9SgdDzaw4Jd2rkEZ2c8lMviS+xSEEdMQVDmNxiXBHRVwWyZdPe4hodvTS+u3g2AiVCSq
 vPfc5hM26+kFaa7+7pd5gQuyjX3/2Y+bB0Cg+srtC3syDNlOKeumJnZBY9pEiCeH0cT7d03aD
 pMYlZvIfFb5RrRXwnfrezpd7QZJawHxcamsnTjdhf8uM+sZnKTUZypISX8DfR63H/C2/lD43C
 iCtbYzf9g+aAa45cd/EIUj5YUJcTttReTsM43MRgN5C0RB03xPhX+VSwKTQ6FQOIGZadmPzf8
 5NJryz6Gl0FHE/gfRDST4Se4693zqMs+YQK28XtS/JDkVQ0mw0bbafK8iX60mnez9PTH/VG6l
 su7l/MYMeA6sRgWKoFHBrzSQMVSXfvaIn2UtboHcECcJalf9U5ExMqkxlMaYMD7XNBRnFSsS9
 evmwTyTT4zPMHpA5uyfP1whEUer2AEHFFWtQLv8kUMQd7ACsVIEs6Ne/iPZ0SYHI6/nIx/6U1
 yKNOOKe15BGQhD4SDwgJ196W+A84QZFZnQFEB+Ve7anvuT1guMyHzuvq/0l23ikta6Tm8iOY2
 wS0cDSsUOCnh9xINO6tvhoM8/xVv2YWw593rTNiY6N+ZyOlS5wiNB7sCtQPvL0ISY0BtRWD5q
 F4lO87VSpNWwbOZdhDyJ1JmThwex9qX+skeCxcVplGb9k9HKmb6w3758IIa4YlERddU0Cfj3E
 UvTvf/13Whpq9/w8RIMrlX/UBXvV9HDM9fVWtP432VjijzD2ACa8f8JChaL/a3mTYt7RA+uv6
 3pAwVG5B55f46pfXAiPYhWXflK9zKXDcaGIy8zyOt9ugXAfWuUaTSw1GkGM9ZagsgMVZsaVWu
 UJrkoWIvyvI41eExxlbEMyfccczdsmUcg1cUL4RSCyuEYLdrzenwHbE4jNPJzktL6udGpdf3S
 KG+XtljzrYq6UZm24XOPUekVX8dXOfNLGCxgZu99L7e89BZ4V4DK1ya9vG0eRM6AQKgnp7I2+
 TTzenmPrm+uWNc=
Subject: [Buildroot] [PATCH v5 6/6] package/rpi-wifi-firmware: provide
 convenience links for RPi3A+, RPi3B+ and RPi4B firmware configuration files
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Provide convenience links for BCM43455/CYW43455 based RPi3A+, RPi3B+ and RPi4B
WIFI firmware configuration files to avoid runtime firmware loading warning in
the kernel logs, e.g. (RPi3B+):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

or (RP4B

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt failed with error -2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v4 -> v5:
  - new patch
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 28926ff4f0..582e0aa8f5 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -12,6 +12,9 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 endef
 
 $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
