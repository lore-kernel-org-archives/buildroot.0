Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E31C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 04:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2789B400A6;
	Sun, 19 May 2024 04:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dpUfqIbVfVL; Sun, 19 May 2024 04:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29AE44025D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29AE44025D;
	Sun, 19 May 2024 04:50:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A75C1C32C3
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 04:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CEB81F1A
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 04:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6cBLEy6WTgR for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 04:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2BF081F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2BF081F05
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2BF081F05
 for <buildroot@buildroot.org>; Sun, 19 May 2024 04:50:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-523bb4c7e2dso139849e87.0
 for <buildroot@buildroot.org>; Sat, 18 May 2024 21:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716094218; x=1716699018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QkPxEAVcbqCBlgLs4rVkCdNYMP3w6LAlZGyudvl6kOs=;
 b=SFD5c6FwN4UEbh2v8s2aY3hTTRgAhS/sNyrYVQxgugq0lCZQchuDQphpaUFLrsbo2K
 Gjt7XwFzKpG5xdu+WXrIo1Rhz0RoEePlTMUPQDBhO3u/5GgaNj4L8iNIOtEqPXqQmAHp
 sDRyx1nyGXh8FwpiYTB0T5kKrHyrthhExGNAhIVGTIiT9+0OF6oTVL0OTUndRI0zem8W
 Iauzwld51e94xHyfPEZ3YazCTMBN2XgbaQwAok4wWuwdz20++DHzkmL7XB58QOS2amFv
 k/inSaaP0XMT3OzD0GTO6MSarbnvv1dhyl1isCqSdeV9mVMXqEhlI6wQ/1CRtAluLFuv
 9RJw==
X-Gm-Message-State: AOJu0Yx+By8fegq0wR19uUImG/CKP9THr4jLXLX325xLsjPHsfub1wov
 WPdfhbm9tfOPTIzr106HIi2s9rUW94Q6/aKHPH/BqzmBSWWtCrfYjt5v4w==
X-Google-Smtp-Source: AGHT+IEkL8dcVNCLFN0/TWhrh2shhHI8sQoYA103qBFwmGr/tXzr9c4t0SefW8Z407Rdu2+KxJ419A==
X-Received: by 2002:a05:6512:3b94:b0:51a:e38d:4e0b with SMTP id
 2adb3069b0e04-5220f86a1f5mr19470987e87.0.1716094217732; 
 Sat, 18 May 2024 21:50:17 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8806sm3773723e87.186.2024.05.18.21.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 21:50:17 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 07:50:03 +0300
Message-ID: <20240519045003.306052-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716094218; x=1716699018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QkPxEAVcbqCBlgLs4rVkCdNYMP3w6LAlZGyudvl6kOs=;
 b=W9soCn2V6x4SYzppFcO4fUM7ccAvvmuArbc4Wj5V0GRb21h7mAHl7pDVX+1ljPckSf
 +TsAyd1UOD2Ca38B+42kGPFtDMogUq941SFSUbbbLlD7OsxEiBe4TUYErYVD3gsrgq3c
 b3YABKMnQMJlMiA+PcQU6o03nzxD+gT1FXLFVHsVztnB1Zyql6GWNIOhj9iSjlRGk3m5
 Ln6MY7odac6zJcaqFd9aNeQzAIeGDAujeyS++ioPy6//e6xwfO2vFWx6UskbcATS9k7m
 BMqq/AD2FPqjIRt6r/ZvlAI6DtFRBvINEOrqxZGrNwPK7kP+OCcapjkvh7fe6MHu1nM8
 WFyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W9soCn2V
Subject: [Buildroot] [PATCH] package/uclibc-ng-test: Bump to the latest git
 version.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream contains new tests and refactoring
of the existing functionality.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 DEVELOPERS                                 | 1 +
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..ba81ddb5cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -851,6 +851,7 @@ F:	package/wireless-regdb/
 N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
 F:	board/qemu/sparc-ss10/
 F:	configs/qemu_sparc_ss10_defconfig
+F:	package/uclibc-ng-test/
 
 N:	Dominik Faessler <faessler@was.ch>
 F:	package/logsurfer/
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index dc0499001e..38621062be 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f5badc6621eb9dbc9030121bfa6d4d1ccf680a346cd15c6dca05a6e03010d96  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-git4.tar.gz
+sha256  fae9be86b0eb050e139047d934e7e02599d074d481523dead65ce164c8453500  uclibc-ng-test-132c6134d69146bcafbdda68ae3a9cbd9f8fb921-git4.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 7d62401244..a80b64349b 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 0f303c63fab7f4038515ced6f2659242cf60ac19
+UCLIBC_NG_TEST_VERSION = 132c6134d69146bcafbdda68ae3a9cbd9f8fb921
 UCLIBC_NG_TEST_SITE = https://git.uclibc-ng.org/git/uclibc-ng-test.git
 UCLIBC_NG_TEST_SITE_METHOD = git
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
