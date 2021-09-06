Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A92C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 20:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85AFC61076
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 20:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85AFC61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316B482893;
	Mon,  6 Sep 2021 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtIPBVIpvqPU; Mon,  6 Sep 2021 20:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F43E82883;
	Mon,  6 Sep 2021 20:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7584D1BF4E2
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 20:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 649BC4029A
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYjp_R7ksSpN for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 20:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BDA0400DB
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 20:43:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o6so153846wmr.1
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tbGnSZBZUAw94TrCBroegrfuMYT0mae9YQhS/suOq4=;
 b=Lt3bDYIrm1sGCRK75wm0bhYbPtE2Ac2u1DAyxM7AfIiTReaifN6y/+WJsqOxL208Ez
 2Ar7r+ilelYQkmVtCDHMcVjieGMKkwwXo+ZNOK2WNKX1/VcXQD3WUf7BhEw+Nz5gDVcv
 FEU9bLbWR5oHPLU0m4Qp4MHoV7VluHzT1UqyJwBso7z0V4UBl8ayoiEsQB8btzeuN1IL
 sqHdHp654T3gQppbNAFm3NXeOsYWjfIn9evZCJrHyKCijDT+gDvmkh0Y3nNCFAF+b0jJ
 k0IqvM99MZOkZIQPoSpl7S9txTyRJd+ToHmlTZJESam472VW8RKlLSQS3rF/Zr8nOyi9
 yxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tbGnSZBZUAw94TrCBroegrfuMYT0mae9YQhS/suOq4=;
 b=Rj95/kHsMlpXYpe1oCpqpIIqXGZkaRmn8GDVIhBoLbJ2vPGbsHDLbt1aIyggKa8OTF
 yGnja9FhewEPAyEn2uV8wdAGc3kdOOSEBQaabayo7gDr2ZgCY66nTMboIdX3wk8Ivko3
 +ZM8t+r8OTLPSGAvmePsJmGsLsiX9NzzWx92OqvMxKWUlPewYkS+ZnYcOeZFTkobkll3
 1nnJpqHZdU9rD3ecM/7EwbBmpWZwxKtYPnqeWF7BQlmN/zaTB+hj03YneHelVZKoQYEM
 C5moknB/fEjG+p2tqXrDXtm3J0diSPc6ELj3tKGTNidJ4nUNkSyvgEIIZQrm+MHv0daJ
 2Qkg==
X-Gm-Message-State: AOAM532rMQGArZG+xGV+BNPTXulG+jZA0QsR+hEd+f6AkRIKWFt3NTKg
 OFyPAyqn481T/Rq17uQxjpG/Yw70Axs=
X-Google-Smtp-Source: ABdhPJxaGSKgYg3pe4T4T/Sh8FLoGEeMq5thR8rjBdOOg+L2sMeK/6zyRFOHg9Mw4gKWkB8XOB9PXg==
X-Received: by 2002:a05:600c:3384:: with SMTP id
 o4mr822722wmp.12.1630961003413; 
 Mon, 06 Sep 2021 13:43:23 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id q13sm462629wmj.46.2021.09.06.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 13:43:22 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 22:43:15 +0200
Message-Id: <20210906204315.2613473-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_openrc: switch to ARM arm
 toolchain and builtin kernel
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The kernel 5.5.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

But we can't just update this test to the next linux kernel LTS 5.10.y since
the minimum gcc version has been updated to gcc 4.9 since 5.8 kernel [2]
and the Sourcery CodeBench ARM 2014.05 is used (gcc 4.8 based).

Enable arm cortex A9 and VFP support to switch to the ARM arm prebuilt
toolchain (the Bootlin toolchain could be used).
While at it use the prebuilt buildin kernel for the vexpress target
recently updated to 5.10.7.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1564202094

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4476ac82512f09c94aff5972654b70f3772b2
[3] 3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_openrc.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index 14839434ef..c6ade7676d 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -5,15 +5,11 @@ class InitSystemOpenrcBase(InitSystemBase):
     config = \
         """
         BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_OPENRC=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.5.7"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -34,7 +30,7 @@ class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("squashfs")
         self.check_init()
 
 
@@ -46,5 +42,5 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("ext2")
         self.check_init()
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
