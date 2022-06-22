Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D92C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 18:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8418418BF;
	Wed, 22 Jun 2022 18:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8418418BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWhWIT3cWLuV; Wed, 22 Jun 2022 18:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD27D418AB;
	Wed, 22 Jun 2022 18:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD27D418AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50EF51BF408
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 392DF83E05
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 392DF83E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZAeJSxnOZ9Y for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 18:48:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055BA837C9
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055BA837C9
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 18:48:31 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id go6so11907021pjb.0
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 11:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hwWSX8mIu4yQwp6zMBLZPzaCmX7wlhnYAgyGGpJ3QWU=;
 b=zKCyoIR828qWAClyc5NFQeaMLuhwALgy8QYKeG2y3c8ADQE3muoBBXyargZlb/40VJ
 gjAAVhVCn1lfFT6R2mSD/gQkLX+hfXW0D4Z9YxuNgQuqXUlTvAXFkS6fcM8sm4pAyUa1
 UFpI6rnzy1/uvd8g95FpPTiq24hX3l0KNgB0d2NmqKI5meNi/frouMMdfr1rO7Qnbj3A
 LgLgEfPdUWBXZGqmB4EmmV3NhfwPakVyg4t+C9M9SPNbmJF3Ch+xvelWPGnZi6f96bTT
 b19+gh/akr3aukFb0jU+qg21ooCjhNfm5y9ytxGKs7vUfjTLpVOfkj1OrSUNPQ/g4lfS
 o/wg==
X-Gm-Message-State: AJIora+jW1qTyKBLIS2PJPGjeZ7RToJk0tpN8HdSIDSw89yggQ/e8TKZ
 wNgxzS/s9X+CWqzlnTdXjWoaTwV+UIA=
X-Google-Smtp-Source: AGRyM1tlyWSZq1XSy+ly01QEyR0vOrWdnMhqMoAZBxohxnhl8e0m0YkSvSnsAGOVbZ7WyDUONmG4Iw==
X-Received: by 2002:a17:90a:4216:b0:1ec:a909:2b16 with SMTP id
 o22-20020a17090a421600b001eca9092b16mr5064169pjg.86.1655923711008; 
 Wed, 22 Jun 2022 11:48:31 -0700 (PDT)
Received: from adam-workstation.goriv.co ([47.153.95.92])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0015e8da1f9e8sm13143075plm.77.2022.06.22.11.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 11:48:30 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 11:48:21 -0700
Message-Id: <20220622184824.289640-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622184824.289640-1-aduskett@gmail.com>
References: <20220622184824.289640-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hwWSX8mIu4yQwp6zMBLZPzaCmX7wlhnYAgyGGpJ3QWU=;
 b=pduTFkwbiK4j1gy2QMnvNkLjKjfzaFtsgckRB5maX67b97LtKH1QSB6dvEnwqBelf5
 CFZMeGGB5oVrDleyinzSumsd+xpYKZpFeAUKMblc8aJvEmyF8Z1iahnwmxMUrUpu6VT/
 cdCA2Evx8l1p+ICTCI10FN+kpCJk3bjbWzcqkfVEHJ2GzEH22YjL5x2CMTMlC6fvS1AY
 OzWBLMilo2BZE6NLtXyf0R6zo65EzA2TUhL2ESiWONNB5sXvJAdEiXKiJ0kryS9sZWY9
 4ufdbE5TE4PPLtNBPUBEhm2BvZ7fvWTAJ9fqqZM3IO/godT+DegsymhbdUH1QwCxJvB9
 6ubA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pduTFkwb
Subject: [Buildroot] [PATCH 2/5] package/mender/mender.mk: add
 bootloader-integration inventory script
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This script is installed in the official meta-mender yocto recipe. Install it
here as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index f25e24f54c..03e76fc55d 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -61,7 +61,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,hostinfo network os rootfs-type, \
+	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
