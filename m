Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98D6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841D261051
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 841D261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DB96062A;
	Sun, 22 Aug 2021 19:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lvQLQXELqbo; Sun, 22 Aug 2021 19:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD53606BA;
	Sun, 22 Aug 2021 19:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0F6A1BF41A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA5E980D46
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rigSqpHZbSYg for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 19:46:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2C1780CE9
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 19:46:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k8so22912774wrn.3
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m4RiSDs7ELpQs6FFWKNdT7xMK5Q2KAjUBJu2qNiXmQU=;
 b=kPC2ZGp5UHLGrS3wg2JZd1hsU8WYS4T+kxn4YW2nP1DEF7BY4SAOdv5or0nP/lT/s/
 vfUTa7S1oPzbKkiFddSERzgbUPm9StnQyMntorrTTCg9U6v1V7s+9Leu383U6BYs4iW4
 xq75tJDHZzViX71p+OKtv1UNmPyYaeCIs89kCe2J1XmvxseGvhiud/4UrSdZ3LJCBwed
 iUElM6tY83s7L8TPcsSJASV3jm80JwQ7bM06f0B4yjjbRRp2Dw9mJxLuy5yjMYC2NnMU
 TZU3cfyuBjtKrwNRyJ5OKHQGOcnlc0MMUcmfpjws1WIfOW6uHV6La3iawHs/EGKfHXe6
 2ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m4RiSDs7ELpQs6FFWKNdT7xMK5Q2KAjUBJu2qNiXmQU=;
 b=D6vkeypB+TwJZDSkBcjYHwdwKaMllLKQdVJEHL3N2kY1tH1hbb/j/cG45m6r6AznyM
 eW1yUC5+rS9nmrNkPYputKTrd9LHrNQS4qyFKD2dmkHzPoHV984MH1PoatwO/KK9Jp7m
 UUGrsnkNDgiNhadhTIddxtBKsr0/5JnJK2Gkgjs1HjRjryDCBdqwPvsOAYBNrT5Gl8Vf
 ssbEueoHNhbPZ5LumH3cva2YhgJeNXm9OxOsgZmJS69tyR4RgxBegWjGHW/gwJIAzerZ
 nzJgglnyQdi/MtCV4VRBYdVZv/KYpI55sggSJ6F3AgGqv94liHwKWZCbN5JIpDCCJ4wc
 E6WA==
X-Gm-Message-State: AOAM532Y7eDmq6Rk8N6uTBqyK0gJivq1EzhPnvrp+JX1KmDSFoPRQ37N
 q3seD+w+EQwQ/JSSlEb9MySrOEw3CvA=
X-Google-Smtp-Source: ABdhPJz7JcyAxHJ5WDALTooaIXYeGe7fFPb8bhucqTnMn73mIfCVDGXMoDY8cee/4bq8tfVgaWbX0g==
X-Received: by 2002:adf:e702:: with SMTP id c2mr9701454wrm.397.1629661614121; 
 Sun, 22 Aug 2021 12:46:54 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id z137sm16971021wmc.14.2021.08.22.12.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:46:53 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 21:46:44 +0200
Message-Id: <20210822194644.3260223-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_atf: bump the custom
 version to v2.5
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This version bump is needed to pass the ATF test with
hardening option enabled (-fstack-protector-strong)

With the version v2.2, ATF fail due to undefined references:

./build/juno/release/bl2u/arm_tzc400.o: In function `arm_tzc400_setup':
arm_tzc400.c:(.text.arm_tzc400_setup+0x10): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0x18): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0xb8): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0xcc): undefined reference to `__stack_chk_fail'

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index a9d5b67ac7..4fcb9b241c 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -10,7 +10,7 @@ class TestATFVexpress(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
