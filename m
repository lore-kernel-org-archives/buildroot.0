Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A36EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9827E40236;
	Sat, 19 Nov 2022 17:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9827E40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNyd7YGCSgbB; Sat, 19 Nov 2022 17:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB64D40169;
	Sat, 19 Nov 2022 17:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB64D40169
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1C11BF292
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7DAD81330
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DAD81330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KehmjaVMnwYc for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0668137E
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F0668137E
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x17so467447wrn.6
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 09:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpZEfDHdW1YDg0Lvf7znJriLUDq4bIrB+g08Woc/iH4=;
 b=8FDkZ77j9cYXXFWwZCRggmvdsPRmzpkbcom7g1rvpG9Y39EADBILXu/QmuTpfdvKkP
 7zwUmOIkRNJi1ysDjQDBKkWlHxe9KRkK2PqM0K4DXCIfMUWvUJsEZwVxybV9PMpq/Jcp
 pYH9CnfQaj+2p7mVvD1rqxYfxwBIvsAwDEOP/ivLvEcLiohpDM6X40XmT+PuffvKDHZx
 HvU3gVhzdypf1uiAWuPn8VIHlSMo2Lr7oh/DPWEt7wVZ3wgeoBE6g4bP/11XDv4+A4hV
 t/g3CQ040nJES4RGcHXheeA3EnDxJ+9Gc4Tq62vVIZCZNVXrWuW+JSUEi4vZofKUohVx
 qCHA==
X-Gm-Message-State: ANoB5pnfnrO0GQ1sWyCehbPY5VGNT3lT8DvUhDHobi4BIhRZ22dKnlu9
 g/CHjm0QuYZbLSQahzZpos0JpJzidmA=
X-Google-Smtp-Source: AA0mqf77WgwExXVHpDecqRHZNeD2kNSmZpzwZKIvcl2iy2gvr3nrkqWqL9LxDHb5lvPZnK9lVC4pcA==
X-Received: by 2002:adf:ab13:0:b0:235:e130:77da with SMTP id
 q19-20020adfab13000000b00235e13077damr7014687wrc.469.1668878172327; 
 Sat, 19 Nov 2022 09:16:12 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003cf4ec90938sm8854383wmo.21.2022.11.19.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:16:12 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 19 Nov 2022 18:15:47 +0100
Message-Id: <20221119171549.26487-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221119171549.26487-1-francois.perrad@gadz.org>
References: <20221119171549.26487-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpZEfDHdW1YDg0Lvf7znJriLUDq4bIrB+g08Woc/iH4=;
 b=OJhaUrwhvRRE+kjGn3ysVgBVS6hmbpQS8Gkkk3sIBDRpCRdSRXqXrkpD6tDpKV6ygJ
 vQJLXE3C0ORmry/WTKCaN89FgSUTOzxBLPLF9VF8ileEBBQHz7ZWbW0xMobfidNcAW9V
 jd6ASoR29gmOGSwbGPlpjVYFkJZiQIAFXYrhScD4M/WF/EzRhpunVk9YTYqGNt+V25rK
 d8M1rrUs+VSGc+0eqrAx+yAEBx+JN1G7DmvBcMmbQODH9/g64CpWaulDUGiQy4DoXHhc
 wVPpNL8oCLNHHN2EuuACsCqiN/mfdJMwbpO6/SSD9r/eMU1NVMbUaWWVnReraGhgXdal
 0TGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OJhaUrwh
Subject: [Buildroot] [PATCH 1/3] package/qoriq-cadence-dp-firmware: add
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
index 2ccdd8b90..10f3fd45e 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -10,13 +10,19 @@ QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
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
