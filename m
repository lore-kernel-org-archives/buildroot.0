Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED01C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C57140C55;
	Sat, 14 May 2022 09:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4A93UX8ozlF; Sat, 14 May 2022 09:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1B0D40C5D;
	Sat, 14 May 2022 09:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C03E91BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE79E408D8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAZOJzYaCSJH for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 501B0408CF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:24:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 129so5974899wmz.0
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJ3tS5btKR1TBdCkEgQKum4/7bngpQIjrMyIj+w6TLY=;
 b=V+OUMkhzjDkLnW65lT5qSxXIqaKZTRfJWNjdJU+gWGF+ssVItl780qdLippNz6X6in
 v9tuerhDC4ca/4nmnab9PT1iE/e4HYsy2nam4xLRVAlUeQxydtPgrN47AAd4rIexc91U
 yFDFLvsUMtQfHOEy8tmIcDmgFWJaBg+b2VOGUouzNgNH6gb8YFh9He6FpN4xu1n6OWMy
 9I5PPXSUKlbEQZsSXhKM9FIICW35Fg+5C+uoJ+lA6cxVcqAtGMyZMGZX93IZm3PqTMXL
 DCZ3qA8aINbmVQGH2T0fks5l3Q28gMCa//ATnwSIbss6jpAyjfkX407ekEqFjiXa1t6w
 qAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJ3tS5btKR1TBdCkEgQKum4/7bngpQIjrMyIj+w6TLY=;
 b=HQBCvPnWsa3PCbCyv05RjPBc//vTVn/8nodwxFCa8s1WDo/hfkx9Lp5rsmEOtVCuyh
 bLGgicF0bG22VP9qLZCbfwB4ffnQCQFHCm9S8AzKs466PFQcefwzhpekuSf3NIcMasKH
 qfBMKLSubUD731mQ4PROFtX87JPtPWqG6oB0mZELx3hXGxRoJMbJ4rjdRCiRDCCTe6yT
 jTZ28lzB6dobLV3qCM8z2w7unyH0mY1YfO1IBXlDh9xcSngP0vjwbNoDssU4jqv6rT8z
 h4IsaTyhaKAzm3qnXQQUsmS0/TFBxR0n0wNJyU6tHbmzMgl6q4VDid8LjXmkSZixtGmB
 uEQw==
X-Gm-Message-State: AOAM531bp/mYMVhSjxOBcvsyTNPmj+2lfRJIQVJmf5rHnpmV3m2Po4LY
 N9ib+GS1uyZtEiYNl0Y0HaMisSxlUW8=
X-Google-Smtp-Source: ABdhPJydSrmWms/3CGypsHl6hP8ZOCDJXulyHKVKZzuiM3XQneOe5eIxNqE6N64RnMEsjAYzdOv9wA==
X-Received: by 2002:a05:600c:190b:b0:394:880f:ae2c with SMTP id
 j11-20020a05600c190b00b00394880fae2cmr7905178wmq.79.1652520290904; 
 Sat, 14 May 2022 02:24:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003942a244ebesm4800871wms.3.2022.05.14.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 02:24:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:21:52 +0200
Message-Id: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

ERROR: modpost: "video_ioctl2" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "__video_register_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_new_custom" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_handler_init_class" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_device_alloc" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_device_register" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_device_release" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_handler_free" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_device_unregister" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_unregister_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/v4l2loopback/v4l2loopback.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 7701bc3a30..712088b6b0 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -15,5 +15,10 @@ define V4L2LOOPBACK_INSTALL_TARGET_CMDS
 endef
 endif
 
+define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
