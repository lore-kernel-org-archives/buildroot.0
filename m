Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE35C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 09:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 108BA4091E;
	Sun, 31 Jul 2022 09:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108BA4091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kqc6sBo1xnJ; Sun, 31 Jul 2022 09:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A29C40502;
	Sun, 31 Jul 2022 09:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A29C40502
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1F51BF342
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4970881279
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4970881279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xh14GZKCjuBl for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEB681372
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DEB681372
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l4so10694834wrm.13
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 02:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y70+QjjC6MPH5TSqySCiuvUERZ2UhdDpJLx7tN2Y+gU=;
 b=j77Qiq89LBykwAfQ2C5eMBguJ3/R99CX8VhxH+7cbwJsD03edWNQi61286LFA2JIUQ
 VTi233XUR8yoNeuJ55CthGUuRd9b4z06c4PQeKEpg/x7G22s1oZxQb933FqUGyiWHR7i
 FYYJE/W8iT9FNVypJZDquOH0CN3LaAJJiviNU6Ajt3Bib53k/QZ/tuwlJQlXrUMQzuB1
 +rYi+91R4Xsix1PnyR51szKWN/5CgSNdf4/LFy3Grd2BQfRWoZFYRu1Jb6xD2pcuSNY3
 xkBGHMlGjcThXpSoNnMhC5UXLR4+Tq4GFcSX0XkAN3eTKZX/dIPeBGRg9mSYhAvRxS7s
 w/vA==
X-Gm-Message-State: ACgBeo0YRio1NTt5/fG3ihCYQa04Yu4Qavt51qRfKNqmjvol5Y2vTE5x
 yhGO3hNG0S5kc8J4d4V5OzY7dACILFg=
X-Google-Smtp-Source: AA6agR7JJr/NAAv+2GPswO1Zl8jtD+ytF5O3cUHajIPHxe7fDMX2ccE/kQvyqIekDqd/o5czDKSlvA==
X-Received: by 2002:a5d:4dcc:0:b0:21e:e644:6af8 with SMTP id
 f12-20020a5d4dcc000000b0021ee6446af8mr7150495wru.219.1659260907766; 
 Sun, 31 Jul 2022 02:48:27 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm10241477wmb.44.2022.07.31.02.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 02:48:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 31 Jul 2022 11:48:07 +0200
Message-Id: <20220731094808.1347975-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220731094808.1347975-1-francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y70+QjjC6MPH5TSqySCiuvUERZ2UhdDpJLx7tN2Y+gU=;
 b=SN/2xGqf50jwb9WkF40lOscdKdIS+Xff7032UqCRPlit3bbSFsqL/qc8y9DBwBDaFe
 VG1pp5eobV8pvvTZh24as3YpfybgAo6WlVngj7btXmCiusak/oE6OENmRRCBUiOFKq0b
 iRxX/JkxG5gYzDjlh7vs/AfK1mFLo6RDCfmb849U2OSH/xMnRR8jk8rEozZEfHxFaBKt
 Y061sJlDaiLrIonvOMV+ndq8/8+wmeEAnKchdeGZq69hBtuWIjHEzNOFGtxF24zqAak3
 fBL6fzhx2d6m9+MiFYb5ZX7Qyq0aS6ExRzEsZN65d+gIfeTsxfgfhKWF/lLddOe/tfNH
 EZeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SN/2xGqf
Subject: [Buildroot] [PATCH 2/3] package/qoriq-cadence-dp-firmware: add
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

this firmware must be installed with the kernel,
there are 2 cases:
- in $(TARGET_DIR)/boot
- in $(BINARIES), in order to be bundled into a boot partition

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 23643d24e..a8172cb1d 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -10,8 +10,10 @@ QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
+endif
 
 # Helper for self-extracting binaries distributed by NXP.
 #
@@ -42,6 +44,10 @@ define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
+define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+endef
+
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
