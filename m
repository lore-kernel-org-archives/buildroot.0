Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D3C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 12:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F228A60F7F;
	Sun,  2 Apr 2023 12:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F228A60F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkgOycBnrZVx; Sun,  2 Apr 2023 12:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3468160F67;
	Sun,  2 Apr 2023 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3468160F67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4E01BF473
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D5681F4D
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D5681F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvbRuGgyFhUh for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 12:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3367981F4B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3367981F4B
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 12:48:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id p34so15529987wms.3
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 05:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680439690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVj04KgqivVg/053YNZgIaeDvex1qGJ/PCMC0Vc1RnY=;
 b=xvP5aiPDlw4KfxYOPei3jbWd2Fk+0MXApwbmv9/k0BUUlWcc/GgjLG/VPie6z073FT
 k8GBzLCJGqwbRD1o4IoH83c/1e7/TbF4FqUyz9+YaXTf73TQ+Em87/11vjgQkbOigwWI
 cAx6ctHiSZCc5Zqha2fN1wcIHoZ/icSThpL43oIL90LvQiYZcAvrPC1RHok4fIHoo6BB
 cx0APu8doAF32cbujXtHJhi2pxm7cjNuXVyR+mLIJG+AUmIjR8h/EWtJ9R8MswxK2jfc
 D3m6yvkAzwZceAJhdqM2KEpdSN7iJqJbaIvqCqy1MBRtg1ZvC/gmRP+maqsx50S7uHW8
 o2jw==
X-Gm-Message-State: AO0yUKVUjuXtMEEgq/bzZT1+WtfzL8qcQ64sa2eVSLYIa46l5yN3R8cC
 VbCPryUeJo6ntX/cha8XdRl6yM5G5wU=
X-Google-Smtp-Source: AK7set8ofT1xjTnKQM8uG4E+QYxgUjo6duL8LMk+ZCnirbYcnhVdQl/SRQ7uEOe2NLzF0VzHsZof9A==
X-Received: by 2002:a1c:4b07:0:b0:3eb:2b88:a69a with SMTP id
 y7-20020a1c4b07000000b003eb2b88a69amr24666496wma.14.1680439689797; 
 Sun, 02 Apr 2023 05:48:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bh23-20020a05600c3d1700b003ee9c8cc631sm15762615wmb.23.2023.04.02.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 05:48:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 14:48:06 +0200
Message-Id: <20230402124806.1073162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680439690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yVj04KgqivVg/053YNZgIaeDvex1qGJ/PCMC0Vc1RnY=;
 b=X9r6YGhmg7Krt/kl82OjVMVyq299EEVvUS92zGJixeTW5UUovofeN6Oc5JqHcqOQX3
 CUGDp0dGZb4vZU7wJ+IxOjNCJRixfheSS1rpXiAhW4OzEJIYPds423gB1BCBUQhVCYQt
 k+nB45+4MjS6tSTxT6lOBEPbny0kHvGFBg4inCaVU3ra54I/1Jzdwa0x51ejm5lzW1GC
 nfdEqPA5qs97hVLBgGkqKsEGJK6ey0WlZvLlYsLj+osZwXGB8hImFSs/gzmQnc0hJhgs
 2mC4xECW3GiS8+eGUcq3n3KiLVKMgHDYYipE+MBKT9klPG2tUDkNRbStpo7xcnEP2qLY
 SBAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X9r6YGhm
Subject: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 7.1
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to cmake-package (autotools removed)

https://github.com/avrdudes/avrdude/blob/v7.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/avrdude.hash |  2 +-
 package/avrdude/avrdude.mk   | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index d53d4dd60d..5910a568db 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-6.4.tar.gz
+sha256  016a5c95746fadc169cfb3009f6aa306ccdea2ff279fdb6fddcbe7526d84e5eb  avrdude-7.1.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index accd92c1d5..8ebe33b372 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 6.4
+AVRDUDE_VERSION = 7.1
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-# Sources coming from git, without generated configure and Makefile.in
-# files.
-AVRDUDE_AUTORECONF = YES
-AVRDUDE_CONF_OPTS = --enable-linuxgpio
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
-AVRDUDE_CONF_OPTS += --enable-linuxspi
+AVRDUDE_CONF_OPTS += -DHAVE_LINUXSPI=ON
 else
-AVRDUDE_CONF_OPTS += --disable-linuxspi
+AVRDUDE_CONF_OPTS += -DHAVE_LINUXSPI=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
@@ -40,4 +37,4 @@ endef
 
 AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
