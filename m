Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FD9C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654AD83EE5;
	Sun, 24 Jul 2022 23:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 654AD83EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrVz8lFqJsLl; Sun, 24 Jul 2022 23:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AED383E32;
	Sun, 24 Jul 2022 23:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AED383E32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB891BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29DF883E32
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DF883E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1pP52UpNJYH for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D85783E31
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D85783E31
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:52:13 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 x24-20020a17090ab01800b001f21556cf48so12817709pjq.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8Ti5EsjSu5Qw5YQQzxGoRr7hd/avRILZdL+IrTcrGA=;
 b=Nqn6gyOazxURYZIPMiumNDz2Uwi1Lw2xk2NRTIq5nwHhzE1vOlowvRP4LaSZkKGf4p
 tDBrArVzqoaT5g4WIliLmNJj8MuSAhNC9o1TUSnyEd6KzGnDOlJaiLsD0KWd1ZbmdGuu
 DiDCcPT0xg3hDAZBfk191pcTegzrkqTfgHpiKONJkv42w2M+3jNkEGo1VtKR6ZZOntrW
 +Slh/1z3Ikfi74+i0bAnrHhgyXNcRLoSMPgV80a6gqcb0X+aG5aHAkS5KXLRmttj0HRM
 9nUxkeg2wuejS6EZxRNQ6N+2hAq2ae5VwKn9mf3V9DN6bZgpwgRqhH1WeKNYZsbyZj/q
 UkGA==
X-Gm-Message-State: AJIora/8HM8VKb1m0bO4x0nX4Urdy3sOfPIy1/W0ephmFTMDf33BvSjw
 9X3LrDaiLZAivuLw50D/LmqWajsFSetaEg==
X-Google-Smtp-Source: AGRyM1vDSi8D2S+4Wi/oeQ0C1i3oN8ow7gkFDgFQqX+0Rcxuptal1GOtFFpoqxheaaOiLc0g6ymGgA==
X-Received: by 2002:a17:902:7b85:b0:16d:2976:42e1 with SMTP id
 w5-20020a1709027b8500b0016d297642e1mr9548598pll.141.1658706732449; 
 Sun, 24 Jul 2022 16:52:12 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm5389131ple.255.2022.07.24.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:52:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:52:09 -0700
Message-Id: <20220724235209.678188-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/beaglev-secondboot: bump to version
 e17302
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

The filename was changed from bootloader-BEAGLEV to bootloader-JH7100, update
the documentation for the beaglev board as well.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 board/beaglev/readme.txt                        | 6 +++---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 2 +-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
index 60678059e1..472d6b1cf1 100644
--- a/board/beaglev/readme.txt
+++ b/board/beaglev/readme.txt
@@ -17,7 +17,7 @@ Build results
 
 After building, output/images contains:
 
-+ bootloader-BEAGLEV-buildroot.bin.out
++ bootloader-JH7100-buildroot.bin.out
 + ddrinit-2133-buildroot.bin.out
 + Image
 + fw_payload.bin
@@ -30,7 +30,7 @@ After building, output/images contains:
 
 The four important files are:
 
- - bootloader-BEAGLEV-buildroot.bin.out, the first stage bootloader
+ - bootloader-JH7100-buildroot.bin.out, the first stage bootloader
 
  - ddrinit-2133-buildroot.bin.out, the DDR initialization firmware
 
@@ -109,7 +109,7 @@ You can flash them as follows:
    "expert" features.
 
  - Then, press 0 and send over X-modem the
-   bootloader-BEAGLEV-buildroot.bin.out file.
+   bootloader-JH7100-buildroot.bin.out file.
 
  - Then, press 1 and send over X-modem the
    ddrinit-2133-buildroot.bin.out.
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index efc93347b1..d35d3a3856 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe4d37f3ff38e7f2da70a08f9cb1668c0b928e85d2e0935bd985f910b3ce30e9  beaglev-secondboot-2d20047960044308126117ad56bc08a1164e82b2.tar.gz
+sha256  bf152500e9f7e467bb1dee95a2291f9ecfaaebe1d64b93f6d403cfaf50e540e0  beaglev-secondboot-e17302063c9a4b74475b18ff24dd149c27257354.tar.gz
 sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index a423c6c6a6..7e5f5681f4 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = 2d20047960044308126117ad56bc08a1164e82b2
+BEAGLEV_SECONDBOOT_VERSION = e17302063c9a4b74475b18ff24dd149c27257354
 BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
 BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
 BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
@@ -15,14 +15,14 @@ BEAGLEV_SECONDBOOT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_SECONDBOOT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
-		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
 		SUFFIX=buildroot \
 		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
 endef
 
 define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-BEAGLEV-buildroot.bin.out \
-		$(BINARIES_DIR)/bootloader-BEAGLEV-buildroot.bin.out
+	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-JH7100-buildroot.bin.out \
+		$(BINARIES_DIR)/bootloader-JH7100-buildroot.bin.out
 endef
 
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
