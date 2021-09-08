Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76792C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1397961139
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1397961139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A246A40796;
	Wed,  8 Sep 2021 16:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R33HTdTTOKIG; Wed,  8 Sep 2021 16:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0834440781;
	Wed,  8 Sep 2021 16:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7C111BF3CA
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A586083415
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bs43nJrlfFB5 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 16:45:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB6083408
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:45:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so2069897wmq.0
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMwYmI/iQ4B3mLtwP1StD7vnVMw6BCZ7FlfIWYQWjKU=;
 b=LDo82cGSJ0oQ3wYF7WtrLSak1cU94pbpN7BVM/gd6CZupsICSnc2RkraCeZ48Aa0x/
 ObA14wfNAvG7bHya0kHMjLilIAAUUAqjKHFBdwdJIEL4EvSQPvufb5wA8WLxhdlrZ3qX
 CamDhICEH/xOahYBQOt0WayyWV0RqvUr+K6hEC+oIS5RVf67rIKa6sre+ujwVgAQXRzk
 CcACN/mPeiSNyiRVpRd9vNW1Z/HvJaNkBv1Bo5iUVZMToem/pC8jQD6xL6GsMnBNyrlK
 bzckUS0JLUDg1ROoW9q27V3SS7IQrwJTtniIsaAUsCFrD8juV08hj6q5hBODQWrCl3g6
 HNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMwYmI/iQ4B3mLtwP1StD7vnVMw6BCZ7FlfIWYQWjKU=;
 b=TDA9f41cJcOIIUJd38qeSp0aaWQWBkr2DVkLVS3ve9df/aUT6VGb+pIzbS9/sOcdWQ
 27SclVybWd080u4I96zIcwREo2jsXzxBMaUbY6Yk/ji/s9rXDW1ZGWnoOFYUgcggGP+8
 SAv06+VAdaXOQNhwHTnU+AJEFUpN8EzFXTHX2chD6n68RQ0rO8H+Kt7oX9Nzohpual4b
 Bd0zCTc+zECggxxdvaZ8Lec3OUhCPnjeuCwqHniWa3FS3KwO/lnwtDpnHN8MVQWA+84M
 cegZW6e9mCxCiL5WjHOvdMH7hRpHkyOnAc5wqvl6qU9zRykREH98/GNSLyqE7OQIC8ev
 FBKg==
X-Gm-Message-State: AOAM530/Xj+PGvEBOBBdizEArEzRnszCAjDxp94JNcGSy4thKWB8uGzp
 tx4hYg4r+X9/Y3NWToKfurKoyNey7lc=
X-Google-Smtp-Source: ABdhPJywWX35VI1DsoatRrRrugSWWId7s5w+ykltiumyeT9iqdHLgmvEM4qbMQXVR/wVyd9PHn3EXA==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr4389364wmk.149.1631119539647; 
 Wed, 08 Sep 2021 09:45:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id f17sm2651319wmf.4.2021.09.08.09.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:45:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 18:45:36 +0200
Message-Id: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix MKIMAGE_ARCH handling to avoid the following build failure:

/home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/mkimage -C none -A openrisc -T script -d /home/buildroot/autobuild/instance-0/output-1/boot_script.txt /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/boot.scr

Invalid architecture, supported are:
	alpha            Alpha
	arc              ARC
	arm              ARM
	arm64            AArch64
	avr32            AVR32
	blackfin         Blackfin
	ia64             IA64
	invalid          Invalid ARCH
	m68k             M68K
	microblaze       MicroBlaze
	mips             MIPS
	mips64           MIPS 64 Bit
	nds32            NDS32
	nios2            NIOS II
	or1k             OpenRISC 1000
	powerpc          PowerPC
	riscv            RISC-V
	s390             IBM S390
	sandbox          Sandbox
	sh               SuperH
	sparc            SPARC
	sparc64          SPARC 64 Bit
	x86              Intel x86
	x86_64           AMD x86_64
	xtensa           Xtensa

Strangely enough, we only have autobuilder failures since July 2021 even
if or1k must be used since the addition of openriscv support in 2012:
https://github.com/u-boot/u-boot/commit/3ddcaccda3824e1c7f7266d543e4c0eb3ea9851c

Fixes:
 - http://autobuild.buildroot.org/results/c3f0f2a3fb87d74bfdaccf9b94c66f0b5bae7520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix commit message to specify that autobuilder failures are raised
   since July 2021

 package/uboot-tools/uboot-tools.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a87956d028..81f60963ec 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -206,15 +206,15 @@ $(eval $(host-generic-package))
 
 MKIMAGE = $(HOST_DIR)/bin/mkimage
 
-# mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
+# mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
 # KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
-# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
-# For mips64, we'll just keep mips
-# For i386 and x86_64, we need to convert
-ifeq ($(KERNEL_ARCH),x86_64)
-MKIMAGE_ARCH = x86
-else ifeq ($(KERNEL_ARCH),i386)
+# For i386, we need to convert
+# For openrisc, we need to convert
+# For others, we'll just keep KERNEL_ARCH
+ifeq ($(KERNEL_ARCH),i386)
 MKIMAGE_ARCH = x86
+else ifeq ($(KERNEL_ARCH),openrisc)
+MKIMAGE_ARCH = or1k
 else
 MKIMAGE_ARCH = $(KERNEL_ARCH)
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
