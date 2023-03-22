Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCDC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 10:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5820060DFF;
	Wed, 22 Mar 2023 10:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5820060DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfpsdhbUcHAh; Wed, 22 Mar 2023 10:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 871B360E00;
	Wed, 22 Mar 2023 10:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 871B360E00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFA671BF327
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 10:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A2B4059C
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 10:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6A2B4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_o38I_cxaiU for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 10:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0216A40452
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0216A40452
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 10:51:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id z19so8465928plo.2
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 03:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CwO3Dr93s5T6DTto3p2exQKUqpfjpqFG3RhhRhlcwU=;
 b=q5aB7OPhamnW73ff/QUM5irCTLm1ScUdkyDjwjuxdLLJioBzD1QSeuJMEMzFd3Unf7
 6XvG2T38toxswZmiuTVzJqYGHQcJcfWlC1yxQJutO1b2k3I8Nethcvto4ycX7OlNME23
 qrsfp+9f16DgMd9+bEoZV2cg151o2fPGs3cOKQ8qpwX9pHF/ABi7tU9PD0jQBZXPog1n
 6O0+2CxT4wWmpLEMCZNCj4+GPWZXAGcLaVgIdjVFd4EH4nTC1vZXMVHNv2xgs+WfH3HT
 ERW7UKFd/ZUD8BsZlb9umtp8FYPTI+Hyx5HdnBjJUxbhZhp9nyVj+R7YuWBSjiwpK1yL
 V5pw==
X-Gm-Message-State: AAQBX9eVqxOs2/DZPegzTn19bf8L/KcKYKPILSYmiKw8C8M07WGnDbol
 mzABd3MMG3CishqXnfaSCRHXzy8/Ad5mrg==
X-Google-Smtp-Source: AKy350ZLBm6Ckm2Wx01VGfVTHWOMMk6UnrOd18FKtq0Zc19e3IzflNdmQJHu+siyOLakVyn2mj9I6A==
X-Received: by 2002:a17:90a:e686:b0:23f:c09a:722b with SMTP id
 s6-20020a17090ae68600b0023fc09a722bmr1705593pjy.2.1679482259665; 
 Wed, 22 Mar 2023 03:50:59 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 il14-20020a17090b164e00b0023a9564763bsm12888151pjb.29.2023.03.22.03.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:50:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 03:50:46 -0700
Message-Id: <20230322105046.62004-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl8821cu: copy modprobe.d config
 to target
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rtl8821cu repository comes with a 8821cu.conf file intended to be installed
in /etc/modprobe.d - the configuration file enables some driver features.

Install the /etc/modprobe.d/8821cu.conf file to the target.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821cu/rtl8821cu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 5a93376c20..4e35d15f28 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -29,5 +29,11 @@ RTL8821CU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
 
+define RTL8821CU_INSTALL_MODPROBE_CONF
+	$(INSTALL) -m 0644 -D $(@D)/8821cu.conf \
+		$(TARGET_DIR)/etc/modprobe.d/8821cu.conf
+endef
+RTL8821CU_POST_INSTALL_TARGET_HOOKS += RTL8821CU_INSTALL_MODPROBE_CONF
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
