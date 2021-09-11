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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A52C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:10:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B3161213
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7B3161213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A707F60807;
	Sat, 11 Sep 2021 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VliFR91sqiwC; Sat, 11 Sep 2021 15:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1075B607A7;
	Sat, 11 Sep 2021 15:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3D51BF35A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A4AF607A7
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZejwIGZQZia for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:10:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A044E605EB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:10:34 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y18so6269427ioc.1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qg4azdEJIWeZqUDpRLn/o4REliiqofCSkKpEY5Kp7oc=;
 b=fihBwZ/wCuGed6+D4E8L8BlYnFKGFKDBssw0URy7AhW2qo24DAwQaGuKk57EbOKTHh
 aJUYdP8qyGk2m3Gu/MHolEWIslFM8wYprtfYVOz6GCwZewzjUXAxxpwA2UObYdUYogBz
 YSpo5sw93b1Q1++m7fewkfbjQ+pKUEIX+J+VKCZk8R6jXPg4kHM1HInorHt56ISsoQPf
 8ZDpbRVaB6XzuX921E49CbpFPDc9wo70ZDnuOLmZ11uvr/p7DFFt87m2gZDQlK7raIdo
 OwdKcS0X4iuwY8+BT8PJ84ABt1eWgH8W2oaze8eQRD3ypHnfF8nVzpdbnD9zkP96hJHE
 yQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qg4azdEJIWeZqUDpRLn/o4REliiqofCSkKpEY5Kp7oc=;
 b=JahZ1LnPPexbcl9/YS4AsDzQzLBbPILjPKAfF1ItCDVhZ/e95FSMmZP8vRoZ+jG4G1
 wLLRl4cd+qcZ5OSMfAVcbId0zP0sGsplLkeLpzBrfYLS78UmS4CRhT6MYmm5Ocg2rdTv
 FIo566ZR0zI8LcWI5piibRGfgf2lGpsIW17NXn7JarDAW+/vlseIqsOmDEj/M3nM/Mmf
 kFx/8I68QDgMFfdPHmWY7DZe+noSPeSfOLvtTnq6TxCPxV68uMpe6TMEpgTl/AqqTMp0
 JQhVl25nOzD/LAhgox4eT8ijOBYxKqAh7ihEDj8vA4oU0JsnOueXavAp/G/OotYFb9aU
 5v4Q==
X-Gm-Message-State: AOAM530/WZRPyF7uKBDE3E6FyMt2ezJ3rXk3FxFk40Xf39e4V+upzJgd
 SZ5FcdXd0Usl5ch2Sut0HmVBCW4HT78=
X-Google-Smtp-Source: ABdhPJwgzS9fHeLzzrUoJcnHH51IzDWCulaoZmX5YeQoUm/4NXsH+YBXSs4hVHR/1oDF8sHC/Ox+4Q==
X-Received: by 2002:a02:a18d:: with SMTP id n13mr2484905jah.120.1631373033335; 
 Sat, 11 Sep 2021 08:10:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id y11sm1043763ilh.5.2021.09.11.08.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 08:10:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 09:10:31 -0600
Message-Id: <20210911151031.41146-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add option to enable USB
 install
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
 package/swupdate/Config.in          | 7 +++++++
 package/swupdate/swupdate-usb.rules | 2 ++
 package/swupdate/swupdate.mk        | 3 +++
 3 files changed, 12 insertions(+)
 create mode 100644 package/swupdate/swupdate-usb.rules

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 6b832cfcbf..54a99b73d5 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_USB
+	bool "swupdate usb"
+	default y
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  Enable update from USB disk.
+
 config BR2_PACKAGE_SWUPDATE_WEBSERVER
 	bool "swupdate webserver"
 	default y
diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
new file mode 100644
index 0000000000..b4efd0b733
--- /dev/null
+++ b/package/swupdate/swupdate-usb.rules
@@ -0,0 +1,2 @@
+ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
+
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c49af7ebf7..c06106e2ee 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
 	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(if $(BR2_PACKAGE_SWUPDATE_USB), \
+		$(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \
+			$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
 	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
