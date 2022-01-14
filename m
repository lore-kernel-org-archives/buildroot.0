Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DEAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 05:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51EEE84D24;
	Fri, 14 Jan 2022 05:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfJgD9q2b6zE; Fri, 14 Jan 2022 05:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1E784D1F;
	Fri, 14 Jan 2022 05:08:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 860261BF836
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 05:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8275184D1F
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 05:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCH1lPjCausy for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 05:07:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F59F84BBA
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 05:07:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id t18so12309891plg.9
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Bt33KXxW2yUVpHria0Jyqmn7JDpDed7rsa0DL+2vyI=;
 b=Up7m59z/Ch4jTwqWCjefDGxdAqetUoNAZdBmAH+E+Q4ZnG/TzLMc32AhfAwhwq0iWH
 7GHRfFKibrFgONNFK6rsqMnABDpDxB21nY2o4x6/qMDXgiv6/mLY/r98Dt345jFVXZ20
 Yq2+U1G+Cmk5KcJAOiH33u9bQRUUX9EpTOHKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Bt33KXxW2yUVpHria0Jyqmn7JDpDed7rsa0DL+2vyI=;
 b=0lv9Dqmz2vGNykCn1nQVNW5CiG1pxHb1AKzd93mDa2m6+EH2Mrb7Q7Ijc8FA0Ix9mm
 Xfg4RUQH+Wi7dPIbsWEAG5wpQNfcZQbZSLPSN+AT66G9reFbd2wBj6LhyYcR1uVPfy/b
 MH9GB+N3Y0SWsSEXvrch2QClkOs7N919pnvdnFGR93vBjudLsISKYnVfvQmx6n8To8ip
 mR0rAghvbQuzoF39hg2hSYNc1PbF4geToZkTy05E2KLzI9tmZFB81cMUQutUUtep2a4V
 U00QsC3MhfquEzOSk2KsM7Cfcc5rTomoB3EPI8cNfQL5G6JOAJMLt0L20yUM6rj8ce9e
 7IRg==
X-Gm-Message-State: AOAM532c2exDh3tb1Hi+PG9abnVmrHDVsyy3DlfmpLxk6w72GzlPGGsA
 /kxYRy5Zg5SoWpaLjzkQhX4bET4RSaa2jcqw
X-Google-Smtp-Source: ABdhPJxXUIjIVMk8bbLmPv0hjI0LpE5b1fUN20IDb1pX3lCsdBDYdiaCdYQ/WMo1hf6ZjgUlKetNRw==
X-Received: by 2002:a17:903:110d:b0:149:a908:16a2 with SMTP id
 n13-20020a170903110d00b00149a90816a2mr7900368plh.77.1642136875717; 
 Thu, 13 Jan 2022 21:07:55 -0800 (PST)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id l22sm4468800pfc.167.2022.01.13.21.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 21:07:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:07:34 -0800
Message-Id: <20220114050734.497034-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114050734.497034-1-doug@schmorgal.com>
References: <20220114050734.497034-1-doug@schmorgal.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/rtl8723bu: fix firmware install path
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
From: Doug Brown via buildroot <buildroot@buildroot.org>
Reply-To: Doug Brown <doug@schmorgal.com>
Cc: Doug Brown <doug@schmorgal.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rtl8723b_fw.bin file installed by this package is not actually used
by this driver at all. It is used by the btrtl Bluetooth driver in the
mainline kernel. The mainline btrtl driver looks for the file in
/lib/firmware/rtl_bt rather than /lib/firmware/rtlwifi. This driver's
Makefile has an install target that confirms the correct destination
firmware directory.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 package/rtl8723bu/rtl8723bu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index e490bddf09..838bbedb74 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -13,7 +13,7 @@ RTL8723BU_MODULE_MAKE_OPTS = \
 	KSRC=$(LINUX_DIR)
 
 define RTL8723BU_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin
+	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
 endef
 
 $(eval $(kernel-module))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
