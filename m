Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FEFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1521E4189F;
	Sun, 24 Jul 2022 23:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1521E4189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0X0_0W8hvHh; Sun, 24 Jul 2022 23:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80D641899;
	Sun, 24 Jul 2022 23:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80D641899
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 498FA1BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CF6611EB
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CF6611EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNDc5F-UsWc2 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:51:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A156611C3
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A156611C3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:51:41 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id q16so8896575pgq.6
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WExq44ipQQm+NyMIecVbDo2rLUexUMpj1iVFjz00aQ4=;
 b=LgTyYV5B9GSEcuMRz0gfURJbdZtM5vynO/fR9AmANLMlMxXWVFAPFhuaKd+VRzG6bl
 Iwr+DUnCZKSjC0623mjvfvX4114ReOfRmQg69krw8L0+UHJxaHGwD1gjZtEjeXLHpirA
 q1zpgbgF9wBX/iXTPUDT2Imr0b8OnynoeiHBix0Y7JtfnALouZjQb2GV+ZhSrbeDAkQ3
 EcVLTi6VKqAxF48Crkc+K/1/VnyMISBQMp0eI5mluVvemiiyiIJXWLxZcgWDHTyci/p5
 di//MdC1aUEbMWAjAveeyZhCDq9QvhuGr2nVQzBU/OX+hHCcJlLQb1zNWB6sDcEq6JaT
 u5Sg==
X-Gm-Message-State: AJIora+axgQ7GulEyKNTMWsDt5q+IDFfFnUd+FWJbKMZcKEGBnpYQ0Zh
 RkBZwvHQlFsqzWsTRpoKnh2aP9oUE7xeYg==
X-Google-Smtp-Source: AGRyM1sUENY02900iEUsAbnt9J6EOCY85VxMlNBp6tu3P6jVHprHWYSPIn5nB/4stajm1fiQ4T3CWA==
X-Received: by 2002:a63:f91b:0:b0:40d:d291:1555 with SMTP id
 h27-20020a63f91b000000b0040dd2911555mr8816447pgi.399.1658706700442; 
 Sun, 24 Jul 2022 16:51:40 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ik1-20020a170902ab0100b0016c48c52ce4sm7755830plb.204.2022.07.24.16.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:51:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:51:38 -0700
Message-Id: <20220724235138.678079-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/beaglev-ddrinit: update to latest
 8d6318
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest "master" version:

8d6318acfe71e790c983b34448c9abfcfcec3ed8

Signed-off-by: Christian Stewart <christian@paral.in>
---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
index 2aaab53a3b..d4235904d1 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d491f64bd77de9dfd4b8ae6c00e83670e80c205cc20917fefa6194b1dc1fe4e  beaglev-ddrinit-c0839f25246d9e308c23498d344ca13d8a7ad6ed.tar.gz
+sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
 sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 76406ed4c5..d9707de610 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = c0839f25246d9e308c23498d344ca13d8a7ad6ed
+BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
 BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
 BEAGLEV_DDRINIT_INSTALL_TARGET = NO
 BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
@@ -15,7 +15,7 @@ BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_DDRINIT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
-		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
 		SUFFIX=buildroot \
 		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
