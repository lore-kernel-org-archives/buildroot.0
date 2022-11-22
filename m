Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225EC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 06:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71165408AE;
	Tue, 22 Nov 2022 06:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71165408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LYlf1FIzrR7Q; Tue, 22 Nov 2022 06:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FAEA40329;
	Tue, 22 Nov 2022 06:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FAEA40329
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 859171BF333
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6080080C46
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6080080C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISAT72w1HFv3 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 06:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E68580C7B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E68580C7B
 for <buildroot@busybox.net>; Tue, 22 Nov 2022 06:43:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h189-20020a1c21c6000000b003d0283bf132so104781wmh.4
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 22:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fF0qG+y96G6PPqEjv8aMv9pEWkrjPIpq25wGmN27LzU=;
 b=YiYJ5O0dEWLUGj1yCJX/6bVUSo/+Mf7KVpTxzOYXQ8P2zcQVeBKvCkMGfs9gZYu95x
 PMEbGbKRFKcTRekXTtEx914eMG8d9s1uu5o7Pn7ImZTG0Z7HI0b8Tjo1LgRiag9XSkqJ
 1946CspuW3CTp4xpiJelllKnWBovebxPR94rYLiQDJkf9fPwFjsWqJEpmrdmLXZVRmey
 xyJnOqp+bzY80LvC715zMyBGkwvmWhBX/qWqEjtCB79L5Jih8UNTpVLjtSeit2bVTW9i
 R/bWQ6oq8BVp4bjNOOBx/vz88LWRCTULbLCKa6Ulq+cn/xCg927cwpqFlj9zojDVslcX
 BXgg==
X-Gm-Message-State: ANoB5pnl/UDgiz0fPgsiQXwSOBiYcQWJBeKYQNBvb60GLTpiq5PRrE4b
 YYDevp2XR7/0IT1OzuZWRwvnGjBRXBs=
X-Google-Smtp-Source: AA0mqf4cOF/sV06vcAr3b4sZX1sGkE9/i/lqK3qgg5UXrSF2RGD7NgcBawn8ou9fQ6A1/MqayqHLYA==
X-Received: by 2002:a7b:ce05:0:b0:3cf:7c1b:3c29 with SMTP id
 m5-20020a7bce05000000b003cf7c1b3c29mr4522995wmc.23.1669099420296; 
 Mon, 21 Nov 2022 22:43:40 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b00241a8a5bc11sm12833981wrs.80.2022.11.21.22.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 22:43:40 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Nov 2022 07:43:23 +0100
Message-Id: <20221122064325.30941-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122064325.30941-1-francois.perrad@gadz.org>
References: <20221122064325.30941-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fF0qG+y96G6PPqEjv8aMv9pEWkrjPIpq25wGmN27LzU=;
 b=GU7My5Le8t76WYIq7B1tGShDb+09sTl4FFgHyMMVH2qubSXEDE4cZtdobgITtn4DDf
 zFZryG6MXb3RwGvL2pNJkWNzuuavRvdFGTthhMe/jdwhrGUApuWbFr/GEvJuI549eQG0
 jIdHP72RQ8K67poXLSYQLoFNEeLMsOlqHphk8/TSJqy3/EGzD9rXXzTdDwa+5wLs4K7x
 JM4NxT8VrPnLRjZZDBY3k4+BoHKAx0GvpBtIdyXt59W16mpsZTWVsCuPUndod7Ye2FSO
 zy3/00wW7BewJsmaXyXdn7OFzq5n5qNktCvrR8lHKIU2Kqu+G0r8q5eFCU5s83qW2K2E
 4KYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GU7My5Le
Subject: [Buildroot] [PATCH v2 1/3] package/qoriq-cadence-dp-firmware: add
 install in target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This firmware is loaded by u-boot.
This firmware must be shipped in /boot with the kernel & dtb,
there are 2 cases of installation:
- in $(TARGET_DIR)/boot, in order to be in the rootfs
- in $(BINARIES), in order to be bundled into a boot partition

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 2ccdd8b90..4f7528726 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -11,12 +11,18 @@ QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
+endif
 
 define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
+define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+endef
+
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
