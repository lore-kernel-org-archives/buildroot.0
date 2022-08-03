Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C3EC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0773410B1;
	Wed,  3 Aug 2022 19:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0773410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swNHbsLHOkfd; Wed,  3 Aug 2022 19:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E60409EC;
	Wed,  3 Aug 2022 19:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E60409EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 083151BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E6A812EC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E6A812EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4zCLuWdoQzU for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1B881298
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F1B881298
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 19:47:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b16so15269407edd.4
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 12:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kSuUNx+r0OVAPH9qkfLXs0aJ3ntzm6de/rqGdCnmc/s=;
 b=NzXIIHsWAKjLAud12Jh+DY57foiU9QKOzxSCj+3sTQ2myPAxP3nJjvCX/BVDI4fW4n
 xL8Dce12kvHsy9NrgD1gkIoEiptbnKjT1i92WCIc9xzAc2U5Y29Ho/fixT+8W/5sb3+u
 F0saDBCpOC6mODllw+lIV5cwoDpouzRKHfjUKuYNAmiaGMN0l0kucfPIEuf9qQcD/z6B
 wFEJa4Nzr4aOm0C9nktWEA4iazXXuZgblWFVC/+shgG51aAwdVQ9BIwzdYcxNxEcRjLE
 aEA8MtYv0VWUQML7anfbzjVi+Qx0oTfBbZTehJBFz6KNbAwuDv5koa+h1VYFLX6O+0Zb
 /4aA==
X-Gm-Message-State: ACgBeo3haUBtwNqsAUBjx2UQr2uSn//qgz6BHt72hImWi/6a3W6tMqZZ
 e9RuNzS0LLbUHy/mFscMF+srbQlOWz4=
X-Google-Smtp-Source: AA6agR4UaSODY0D6FBBfg7gP1bl5Y8RmcnsHcGY0VohCEP95rA8Zp6A2escFrDAd5rFgRn1zPSnwlg==
X-Received: by 2002:a05:6402:b88:b0:43d:6175:761f with SMTP id
 cf8-20020a0564020b8800b0043d6175761fmr20975787edb.237.1659556044399; 
 Wed, 03 Aug 2022 12:47:24 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090631ce00b006f3ef214daesm7563490ejf.20.2022.08.03.12.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 12:47:24 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 21:46:14 +0200
Message-Id: <20220803194615.9209-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803194615.9209-1-francois.perrad@gadz.org>
References: <20220803194615.9209-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kSuUNx+r0OVAPH9qkfLXs0aJ3ntzm6de/rqGdCnmc/s=;
 b=djNDE1U7YSXwVOiAr9P9+bSu1AoYa2uBSsBe5RAm/63sEeoZMk70n6jBXIy33m06oh
 ytcrovVvyMKNQtn5EuVJ0MoifbfQC1tqg2OHaajRsFjgjgp32f3I+DYKMWwV4GiOXg4u
 Oq+gWPFgkPLgNIqd1vVwlN2IgWj1VKQ00CZ3lYjY/Gr36Z4DTkDvX5323QxkT9wa/1Si
 9mTOlM4K8Lrto3gUG3m8UGlMO11NWlNk6yuqFKkoiQQJXE6SrBqt26vdAHnG4gAUJJK8
 7BeLZq5ppWFP3b7GCzneIXEAdzaKFf7TeujHo2pQNRj8uglM++HtICWMKdspi+fJv4ML
 97cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=djNDE1U7
Subject: [Buildroot] [PATCH v3 2/3] package/qoriq-cadence-dp-firmware: add
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the firmware to $(TARGET_DIR)/boot other than
to $(BINARIES) folder. This is needed in the case
BR2_LINUX_KERNEL_INSTALL_TARGET is not set

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
