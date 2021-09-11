Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2412C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29EF3611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29EF3611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD24E60896;
	Sat, 11 Sep 2021 16:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2oJXACPecqg; Sat, 11 Sep 2021 16:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B9A60814;
	Sat, 11 Sep 2021 16:50:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCDD1BF388
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D74B60814
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCIM5O5hTMTL for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D825607A7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:50:27 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso6922944otp.1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duCCXfJbbTJCTpWY6tpGSHPhXC7h9acNUVLXt4TDCVU=;
 b=KrgLe6n6HQvwjmJFYnylS33bPu9mhZp2D2/wjDeJk0DGsDdkJ6FzD4fRKnrA8MEmTH
 laBdE4ChGriAY1g7zoJmyBsQtZDc7d9qdnB4SEcikkfDqQ5zh6zoSxbIRMQJbEQngjSW
 UGyd1IdrWrebq7tVZ4EmJ+zNmrx6KQ6Xytyd5K91gt10ZdQB9J/2rEgs6gEXD8wJEvqS
 iN7gJtlD0dZ3aQd+fE6aOOqXUXGnJwhA0Tr+Z9AGENpvN5I5UzAs2sRkCP1jP/Uojbg5
 XdpUlIT7rCdGKmSvBJS20ZlFflxRKjHaIOW4Z4Ey0uub0PDB0Myusi2UYBgTPZqK6HOD
 8imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duCCXfJbbTJCTpWY6tpGSHPhXC7h9acNUVLXt4TDCVU=;
 b=uK1l2rV/dzDQITmk/SOmRiWnJhPss46CDVBQDy0WN/U4HpD/574oszJWgTsbxCx0G2
 pjtcKNQRoNstd966aSE69YEehR6xs0fZNgI5p9ZkFb3Gc/dAz633rbBTwCP77QSLLRzY
 fGoLsG6qJBJCl41bwE6guDZdD3Wr1VywTOguSkvRL6wiJQpEyNFdTfmc7GcSx0UyrFqz
 YVG1afVmGHEOkUYMPfvi/eLUJc1h1fju8qHbKpYLwAMlS6Mz8MqhucOCGoIWaQpTpAap
 xLcrFhClIrs4RbpLM8JrsJsQEC34qf9/We7aYAL2y2CfekK1GhtAw4GwP4tVDyXVgJ7j
 HvZw==
X-Gm-Message-State: AOAM530UHIubxCKfNrBwMcE4JFtdPDyJF3gDHNw3Y9ece4l4/+00f95Z
 bm2jDomrYbJemc5vxzzWxJtEyIrX5u4=
X-Google-Smtp-Source: ABdhPJzNbW6m31PCdPRl43vEM13aEhsjIXUU9bg99hP2fQT3WvGEB5JiowecqPOKWUNjQZXrX3q8YA==
X-Received: by 2002:a9d:62cc:: with SMTP id z12mr3022655otk.270.1631379026475; 
 Sat, 11 Sep 2021 09:50:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id y26sm516043oih.2.2021.09.11.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:50:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 10:50:19 -0600
Message-Id: <20210911165019.1364188-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: use $(SWUPDATE_PKGDIR)
 for pkgdir path
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c49af7ebf7..e191ab384a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -238,30 +238,30 @@ endif
 define SWUPDATE_INSTALL_COMMON
 	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
-	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
+	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/swupdate.sh \
 		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
 	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
-		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
+		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/10-mongoose-args \
 			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
 endef
 define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
-	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
-	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
-	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
-	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
-	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
 define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
-	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
+	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
-	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/90-start-progress \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
