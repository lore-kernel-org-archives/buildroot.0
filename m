Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6199CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E533608A5;
	Sun,  7 Apr 2024 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BvONwism45B; Sun,  7 Apr 2024 21:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5A8608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5A8608BD;
	Sun,  7 Apr 2024 21:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D069D1BF387
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA55B40789
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBe_-QFgU8Nx for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 21:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5274440783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5274440783
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5274440783
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 21:09:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4162b5ba2bbso25244325e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 14:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712524165; x=1713128965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJv1qowovjeDPJNkAHSo5HPidEjsGsd4zDzl4x3UHrA=;
 b=pmYmEbCM/A11pHdT27bEnbj6C4JlS3wXTubZIFe3ljf5scp88ASQNYWgvhItG0wPiN
 bKDq+ODmE8ioz/zAYd5OboVxj7h4LPYvkcXs3roh3W0GnstWiK3b/NJmlsBd7rcA9PUZ
 ixRbLiXUVDbLfYB2UdQebpgi50BH4GDEe0BR3lO6qjX/hQY6M7J6EN1cL3K64NKqP65N
 5RkMAirezJLUDbY0sK/VjaxvZ18IjlGwwkr1Wwk9PpIaYOT0GUasknPdAyWNLyhc75O7
 +eTg66NlTygmjH0jvpOt3jaIiPOSRpAejAsJnatjJw+4Vx9JojA1bItZWdS4/sA/YXkp
 Y1pA==
X-Gm-Message-State: AOJu0YxQZeX5asBS5vqWG074/HdKKVUGJIuiKGQ8g3ViOMI/lR/16Pbg
 B9kFkP0CKyqJFAkAwQXpABjIlxFnl8QdQCg/QL0c0cTwGEBmjPDf5hcvNCf0
X-Google-Smtp-Source: AGHT+IEJeks9aBI0wTyuE/DrAyzGlYiI94D8COEb/UStjJ9Zk/zNbgZy30M6v0yeSbAAtsN3oqCNIg==
X-Received: by 2002:a05:600c:4f05:b0:416:6d1d:e2 with SMTP id
 l5-20020a05600c4f0500b004166d1d00e2mr841476wmq.3.1712524165252; 
 Sun, 07 Apr 2024 14:09:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e23-20020a05600c4b9700b004163703fd6asm4671555wmp.1.2024.04.07.14.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 14:09:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 23:09:22 +0200
Message-ID: <20240407210922.3404297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712524165; x=1713128965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RJv1qowovjeDPJNkAHSo5HPidEjsGsd4zDzl4x3UHrA=;
 b=lDBZDldV5R5llYHC20Zglu0GZjGlr3KZNOLsz5l02APPTE++u8Ic8olJHsPQPHdaRQ
 cWxrMxmqxP7kB052WU8O6P+bPSp5BbsI6Nn2X6kE8rW6LcwovFW1jvwb3bFD9ImKW6s+
 Csf10jEIZY2guduODGZ7IvH23yyIpYCYgL7zV8aio0GMbhBgOtaSDVXIwP07KTlk+FvK
 QvzZKpgj4xPDDws72mPen3xXOGqT4iiGt+fIsKMMmImBijrXYxNiG+TGF+YrSWCyANO5
 UEorwfPn3+hDn5r8sAIlxsfYtZa4L7jbvz8RbSk1qiPsmSFeljk7Lpq1NTw9eRGjLedZ
 Lg8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lDBZDldV
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: replace
 br-i386-pentium-mmx-musl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace br-i386-pentium-mmx-musl by bootlin-x86-i686-musl to avoid the
following build failure with efivar and musl < 1.2.3 as suggested in
https://patchwork.ozlabs.org/project/buildroot/patch/20240303171115.1140763-1-ju.o@free.fr:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: ./libefisec.so: undefined reference to `qsort_r'

Fixes:
 - http://autobuild.buildroot.org/results/a0ed3970da8a84d884b26c081b49b8d2b7208829

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../autobuild/bootlin-x86-i686-musl.config             |  4 ++++
 .../autobuild/br-i386-pentium-mmx-musl.config          | 10 ----------
 .../config-fragments/autobuild/toolchain-configs.csv   |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-x86-i686-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config

diff --git a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
new file mode 100644
index 0000000000..2afe096f32
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
@@ -0,0 +1,4 @@
+BR2_i386=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
deleted file mode 100644
index 1b3c45fe9b..0000000000
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_pentium_mmx=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 2c4fa45fe7..c5ae4d1ecb 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -39,6 +39,7 @@ support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-x86-i686-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
@@ -50,7 +51,6 @@ support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
-support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
