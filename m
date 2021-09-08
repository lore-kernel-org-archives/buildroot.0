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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873ABC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0391E61139
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0391E61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98CA383408;
	Wed,  8 Sep 2021 16:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgLET56Rg-Np; Wed,  8 Sep 2021 16:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFF4833A0;
	Wed,  8 Sep 2021 16:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6A641BF3CA
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3556833A0
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijyzfDRCgA5B for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 16:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01CA18339C
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 16:43:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1578044wmh.1
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GK4167ZMDnTtCoJ4dxzHRh/dl6DGsSBvVO7Xo6FEQyM=;
 b=mcTBqCgvSp1EGXFcOemIt11YZfgqlt1ZTnPRLPIpssxxNup0hcYejRWAkFNOY+UJxO
 v3Ru30EkXymfWTLUhWMglbaW8LYbc8mA3CmDEOpwYLIFeVdV8FaHSPKYsVDRAvMi5hy6
 kiZJP5pFkJQOhco/xLl7mhwvdsl29yKMpHgAtoxVT2Hswql8pbg0qytSn36bmPSWnAe2
 fnh6Hihl1B0Un1Py8o7dPJhPb6B5thYkY/y11nuf3CDfcxS5PKQR5dTny90LMLNHujuo
 dmIQliBA4NjPsrn6uNPIwUoNgKU+8LJy2T+lc0iguKuVdM20+5KEKo3Av+dt9J0cpALm
 juxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GK4167ZMDnTtCoJ4dxzHRh/dl6DGsSBvVO7Xo6FEQyM=;
 b=OwT0MXQKKNcq93w+YFFMO2QrrZktXYsZlKZwrZR4ZZu5MiY6T08q+ujam7yLSDs1FQ
 rm12hkGuix9Us/EJZGqL2pbDcHawIXSAeAfVYAuM4DJmwPoouiH2ox/uJ5GN6frTwvFi
 QsI8Y3FmgGdlausP8+v3v8dCF7ew85DaXrPQBKtVA9FjIax6zrdbejTJpVHgAVUhPY8N
 tVG3aBlGd5Y70MAAhbpM8HkljKSst0D5vL43zSkj+31OSgflZwya4TWh5h7J7l9F2vcF
 dzRG4j8BnMFFL4Cy4QmvdMjC4x0k8YpoYqkfRq80zx3U0VEifKlNatrv6W1qhnxsrcub
 7m8A==
X-Gm-Message-State: AOAM533xM+XDE9PSfFu19IO9qkefYh4l3RMzaZzJUkFO91ojd7yJhXji
 xrmUtNQF309J0DbZThV7i8Rlm790efw=
X-Google-Smtp-Source: ABdhPJxGU5E7V8//PIZyABbR8QdDSF1f6Kfe22kx2tL+4qltIGqO9fr+S17lGeEc1Ud6bjuEULJwfg==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr4460919wmp.73.1631119381986; 
 Wed, 08 Sep 2021 09:43:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id s12sm2689359wru.41.2021.09.08.09.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:43:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 18:42:24 +0200
Message-Id: <20210908164224.474851-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix MKIMAGE_ARCH
 handling
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

Strangely enough, we only have one build autobuilder failure even if
or1k must be used since the addition of openriscv support in 2012:
https://github.com/u-boot/u-boot/commit/3ddcaccda3824e1c7f7266d543e4c0eb3ea9851c

Fixes:
 - http://autobuild.buildroot.org/results/c3f0f2a3fb87d74bfdaccf9b94c66f0b5bae7520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
