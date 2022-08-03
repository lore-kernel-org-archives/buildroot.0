Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B76FC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 07:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC894086E;
	Wed,  3 Aug 2022 07:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC894086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hbjBAmvekMr; Wed,  3 Aug 2022 07:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D99408EA;
	Wed,  3 Aug 2022 07:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00D99408EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0446A1BF4E5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF1C812EA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF1C812EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAgjzcZtJwga for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 07:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD39281678
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD39281678
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 07:44:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m4so8141632ejr.3
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TgSQFBsqe9uN0jSdAeBsGsrCUhKUI0AMsk2VK1eksNs=;
 b=2syGjMQ1i1EPy97O1SXHTYWUr+YOJs9nSOpxixl47+f8qoH6jDCvPsNrYXt/GAJKO8
 WKH6yButqiszEL9ui/6wAJ9lkZkRSxFRt/TGWl5+Sh8iaHNmRPGnNwbBXaLJbuiOzRJ1
 4RcC8MWeQeeQlvyjk6059Fm7WJTy28UoIkPXhmeOTiEEizfWy9JNFZr3bc7tzeHAHVxC
 q4+T8hbhRnysdhst2QyOz06+I6l3THB16oDoz6bEXeAjiZdRAfZt804mdRIsjkUlbah6
 0cdlB6YRXDE7zmmmBNYyMxcmNzTmatzAhSMDKOJF+6Pc5YuM6FLVo2T6dvAilZvUy1lW
 eW8A==
X-Gm-Message-State: ACgBeo3ucoC2NUkqj6rjfGHXeKLqmOldAD+9WzW7BhZv0T7g3G9qFA6y
 UmkVwzOijOZaMvuahOowTQ1/qhvIxCs=
X-Google-Smtp-Source: AA6agR7GpyKcnYtdwX+sxfh4lq7lA+M/IfIjxQzSKvJkU0cOho/QUZTvwoESGcXjN1kmaCFx1QtNhg==
X-Received: by 2002:a17:907:3d90:b0:730:a7d2:23f0 with SMTP id
 he16-20020a1709073d9000b00730a7d223f0mr3670501ejc.358.1659512643088; 
 Wed, 03 Aug 2022 00:44:03 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d88f000000b0043ccd4d15eesm9173758edq.64.2022.08.03.00.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 00:44:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 09:43:48 +0200
Message-Id: <20220803074349.7590-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803074349.7590-1-francois.perrad@gadz.org>
References: <20220803074349.7590-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TgSQFBsqe9uN0jSdAeBsGsrCUhKUI0AMsk2VK1eksNs=;
 b=MBmaDN+7wYp+akQAQ7azcdLidKmsEf41OBD10IVV1r+s3zh3enlZbGgnm+bQJkFkpn
 4D8ZKQsoFEYy66e9En3OlTvk116QMmryX0dgkTtXFNOJF9abcSwvpcy/8VIw16tjTHRv
 VJRvvV9y7VeGm/LN32Nc9EQKrNOj0FDcE0qNZfnYCv3U9tDuxmYBGqzXlun6ybTwRwX8
 mT0WWmrTY+RM8VLnjE2HHqz46wf9BgI8pb0rDS/2tZcTFJeusI1gPEtiLcsUXaytDGdh
 rXCdYbrfSCkRYzRJ0mLIqfBgFFHqVJ4IVBrsGesh2RMrEUsRG/XpSGpEOfEA1Vp61NCr
 Ql/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MBmaDN+7
Subject: [Buildroot] [PATCH v2 2/3] package/qoriq-cadence-dp-firmware: add
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

This patch adds the firmware to $(TARGET_DIR)/boot other than
to $(BINARIES) folder. This is needed in the case
BR2_LINUX_KERNEL_INSTALL_TARGET is not set
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
