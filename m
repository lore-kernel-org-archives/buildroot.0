Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9821C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:22:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7687A60BD3
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7687A60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29193838B6;
	Sat,  7 Aug 2021 16:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxJ35eaoQ1jY; Sat,  7 Aug 2021 16:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809FD838B2;
	Sat,  7 Aug 2021 16:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8EEA1BF5AD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A231F838B2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff8qkoEjW8OJ for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 16:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9904C838AF
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 16:22:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k29so2490319wrd.7
 for <buildroot@busybox.net>; Sat, 07 Aug 2021 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qkiPg5fL9Nln02Ie6fHZAYqagTBmC+JW8e9k6Mw/lE=;
 b=V+8xUiajQY0nw1QkZvUV+6ja99Fhw+87PZDGgEfGOE/lAQIRfhzvon4ZLOJrnvVu5+
 tjJSdbxw0iqwQA4oskXNPTa+JpevCfT5QA3WtcI4fuX39q0V94u3vGQFbLguZ44EU2Uo
 IrubBsZ3Un8S1HYywiyAPl96/5E4WP3iM+MwR3xCowPaSR+OGLTuVE6fhfF8Lxg9fWHE
 i3Mmud0QJOC6SYKONANuPVEhJ0ZSRXbsiXBScGtYdaVNO92v4R2Adcf7kLgawxrnUh5g
 t0XKeVsjv117imzZo37Azk5PEDBmrQSNUJfCziXkD7WWj1X0o+RpvjVnXcgKKEJu9G2M
 pzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qkiPg5fL9Nln02Ie6fHZAYqagTBmC+JW8e9k6Mw/lE=;
 b=CS6Uy8CO/Q8FQvY6UXG/0NbQZqB05A0aZLD6ge3cjsvjZFoLvQ0l61J2tR6MnIwJen
 +wtv2YJdreOWA/VLV8i58MCsqnvpFu7d7YO2JjLr/kjSXFRzkD9YPkcV8CB5X9BoEUli
 WOZqTRkzrNp6BEwbUCZAWBhQFZ3hxJQK/T/zmwUq5TZ1JgxxKHAJfMescO2BZMQ7Xvm0
 4B1BkMGe4UvtRVzxzDCM4BylFdTLB8t1wh02f8BttgbIDqLU9urjuWK/44Yr7Rnf39aK
 GLU3k0ClrpSeVS3GHjK9kCavjd1m95eBTfmmTS8zhVTK17pLNLceEwnHpellYCbtlLdB
 ZtgA==
X-Gm-Message-State: AOAM531si+6DcTh6b2XZ4DejeyVprFWOnQTkyhbHhHxAYE4bnJckWjqg
 qGRGY555fHOqMN4XBkbpC8T+LyL/jDQ=
X-Google-Smtp-Source: ABdhPJyp9wD5fDn+1GOmFGVF01bOba7L9M22zHRkAlE09gwiOHAGGlM6jpxHOdpaLNN5W8C5/+BHiQ==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr16499311wru.253.1628353337777; 
 Sat, 07 Aug 2021 09:22:17 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id z5sm15061467wmp.26.2021.08.07.09.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:22:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Aug 2021 18:22:02 +0200
Message-Id: <20210807162202.154898-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Partial revert "configs/olimex_a20_olinuxino:
 switch to extlinux.conf"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Old scripts are still used by a10_olinuxino & a20_olinuxino_micro

Fixes olimex_a20_olinuxino_micro
see https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738568

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a10_olinuxino/boot.cmd      | 6 +-----
 board/olimex/a10_olinuxino/post-build.sh | 4 +---
 board/olimex/a20_olinuxino/boot.cmd      | 5 +++++
 board/olimex/a20_olinuxino/post-build.sh | 3 +++
 4 files changed, 10 insertions(+), 8 deletions(-)
 mode change 100644 => 120000 board/olimex/a10_olinuxino/boot.cmd
 mode change 100755 => 120000 board/olimex/a10_olinuxino/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino/boot.cmd
 create mode 100755 board/olimex/a20_olinuxino/post-build.sh

diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
new file mode 120000
index 0000000000..612c745500
--- /dev/null
+++ b/board/olimex/a10_olinuxino/boot.cmd
@@ -0,0 +1 @@
+../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
new file mode 120000
index 0000000000..b346896024
--- /dev/null
+++ b/board/olimex/a10_olinuxino/post-build.sh
@@ -0,0 +1 @@
+../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a20_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
new file mode 100644
index 0000000000..44d9239a94
--- /dev/null
+++ b/board/olimex/a20_olinuxino/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
new file mode 100755
index 0000000000..d3f612f811
--- /dev/null
+++ b/board/olimex/a20_olinuxino/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
