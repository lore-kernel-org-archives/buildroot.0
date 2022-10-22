Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728EDC433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BED6079D;
	Sat, 22 Oct 2022 20:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8BED6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ol0Wlj45fNnI; Sat, 22 Oct 2022 20:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0220260792;
	Sat, 22 Oct 2022 20:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0220260792
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A37E1BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7A01410E9
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A01410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8qwe06-MXld for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:10:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62CEF410E8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62CEF410E8
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:10:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o4so1529209wrq.6
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i60iaeH1aHCGJ6jkFWdkhTyleGjIU4eWSEGyjKE9dSw=;
 b=MPn6bNak7AmmrM0R3r6AVVxpK9EhPAkSmlfK2CfMfjMHMqjcXWrG1HVLWfeRj6wHcc
 fUaTs9ZF6T+Agds0/0lm/K2W0gFnfwc1WO1iGKC1uU9G756mUhSw/cnB6VGfWZl8JbI2
 maMwWKChryfKrk1OUydmxyrfP+PCXRtKwB7HokcjAcdn42vcupUsHsXEb7q47S0vCP+1
 mIX4853EWeZYYO1tMY0yt1TpdwKInY0ReqIbtrTk16GwwaMlO4WADBO2QS9scCRIa77h
 y7aedN4fDu9YC7QWpNJXNd0AWe0xqK5VceJB++f54UQdqAgz53hdWWvZbvRDakYuShha
 408g==
X-Gm-Message-State: ACrzQf23bNsrqCPMTX2agVAYdWTeMu69K15xw01VucLiu0IodCewJF5H
 CuGgMjGCq39jxaYNk6cMjtlrORMXMtU=
X-Google-Smtp-Source: AMsMyM7Adeh/NFqOBZiUMvD3ApkyfEoLA6VNZOkwE00bcNQmQRUYPYutnNK9XoXyEo5avsMXofbr5g==
X-Received: by 2002:adf:f04b:0:b0:22e:3a85:59bf with SMTP id
 t11-20020adff04b000000b0022e3a8559bfmr15575767wro.683.1666469457016; 
 Sat, 22 Oct 2022 13:10:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b003c6b9749505sm3842534wmq.30.2022.10.22.13.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:10:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:10:52 +0200
Message-Id: <20221022201052.28903-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i60iaeH1aHCGJ6jkFWdkhTyleGjIU4eWSEGyjKE9dSw=;
 b=punos4vzlaAtoJpEurvbAYozXdXNBixr9zHPFTddzJxgwZI4eZSdfGfl/F/gIbV1Ts
 3P99UGlHn4tRm0QN8z+yai0yQXnIuK0RsU1h34wez/u9bBiB3PICcezIQKjmN4V/BYwm
 pujLEt9b4x/jtgK6+gxoLSSKt/0XpEu920RmXF9Juz7aAxXXLAot9lNfF0DLHiZDZypF
 JW3jFBX4htwsKXZCNPww0WWYAeaJP4iT3nNzAwM8Cj3bN0SWWfBBYDUy2Df+dsn3t/Zk
 o/EKtAp3bZkrOLqRnzJ65zW8K0G7VDw9UG0jJgABqUFrrc72Fq0bpsvojMkqxiRURNA/
 x84g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=punos4vz
Subject: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

usbredirserver was dropped by
https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy               |  7 +++++++
 package/usbredir/Config.in     | 12 ------------
 package/usbredir/usbredir.hash |  4 ++--
 package/usbredir/usbredir.mk   | 16 +---------------
 4 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..39b00547c8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_USBREDIR_SERVER
+	bool "usbredirserver removed"
+	select BR2_LEGACY
+	help
+	  usbredirserver has been dropped by upstream since version
+	  0.13.0
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 8ce180a884..2190cb88ac 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -18,15 +18,3 @@ config BR2_PACKAGE_USBREDIR
 	  'y' below if you want the server too.
 
 	  http://www.spice-space.org/page/UsbRedir
-
-if BR2_PACKAGE_USBREDIR
-
-config BR2_PACKAGE_USBREDIR_SERVER
-	bool "usbredirserver on target"
-	help
-	  If you want to serve usbredir requests on your target, say
-	  'y' here to have the usbredir server on the target.
-
-	  Note: the server is not required to use the library.
-
-endif
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index f738c36690..577e08efba 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,5 @@
-# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
-sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
+# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
+sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 6792a3e758..6d5a80cbf9 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.12.0
+USBREDIR_VERSION = 0.13.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
@@ -17,18 +17,4 @@ USBREDIR_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dtools=disabled
 
-ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
-
-USBREDIR_LICENSE += , GPL-2.0+ (program)
-USBREDIR_LICENSE_FILES += COPYING
-
-else # BR2_PACKAGE_USBREDIR_SERVER != y
-
-define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
-endef
-USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-
-endif # BR2_PACKAGE_USBREDIR_SERVER
-
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
