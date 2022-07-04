Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4FFCCA47F
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 08:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B2640948;
	Mon,  4 Jul 2022 08:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B2640948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIPqPAQvg1M6; Mon,  4 Jul 2022 08:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B793540936;
	Mon,  4 Jul 2022 08:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B793540936
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1B1A1BF338
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 08:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA5EC82443
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 08:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5EC82443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbfloKX7FICV for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 08:55:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055F181A24
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055F181A24
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 08:55:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l40-20020a05600c1d2800b003a18adff308so5249708wms.5
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 01:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6mH0QsvxDEcmlrW/kHZKrEU/Jywz/EcwocHAalOrSo=;
 b=g2PPkWr1t1wD03oATc0TzIuuJFv6wJJWaiLR0oum6zJ3Jl1vHL/+B1pvlECx8PQbbZ
 QdEYmnFKF/vUGWgFOa9J7to81j2fBoal38ODQx6fsLdeE+mQ0WYcJ5AFMRs7wZ33/8+4
 +ENI076cvieTGOvCr0+fo46szqXm3eijC1431ARJWXFZooUR49f4MMq4hME2vMHienLl
 ocrFxxSAqgJlLODuzE460DSOe2/MDX4b8ToQvW8OpBGolZLrJEwTdEYa3QM86aNRuH9W
 QbxmkZ5IxOINhZbK7Qem0NmTHIHQZQrqd9L1kjl/ohteym48AkGnjHqafcNJ2AyVuxCt
 NCAw==
X-Gm-Message-State: AJIora/K2XjnyR+aNfL+c3dqT9Vy3juqRMqKgIRVKQWv8sCOdL/rs0NF
 M6LubKbNph5RAl+4CF1ztR//I4DMpM7pfQ==
X-Google-Smtp-Source: AGRyM1uo8XipbhgvQffEG2AmQnlvIPyUsmngEo2q5SuFKgwWxmBqMbhThwBjMNuhBxKj0x3atS6JwA==
X-Received: by 2002:a7b:cb58:0:b0:3a2:aefb:a4b with SMTP id
 v24-20020a7bcb58000000b003a2aefb0a4bmr2777305wmj.84.1656924956064; 
 Mon, 04 Jul 2022 01:55:56 -0700 (PDT)
Received: from jupiter.home (14.5.23.95.dynamic.jazztel.es. [95.23.5.14])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff992000000b0021b9416fa13sm6624967wrr.90.2022.07.04.01.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 01:55:55 -0700 (PDT)
From: Abel Bernabeu <abel@x-silicon.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 10:55:51 +0200
Message-Id: <20220704085552.3499243-1-abel@x-silicon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6mH0QsvxDEcmlrW/kHZKrEU/Jywz/EcwocHAalOrSo=;
 b=nkCOK07bhtqQtzoVghaWQcN0ne3owsulbJj8EAA2Cdly3RGpbUfL5B0GC0PY8UKmOe
 Qs8iePtSRExcjFZNu7sPKnk2ObeO7dcfEZG1kULW8jamyWNL00UzWA/Hlevb0ZdpL9KQ
 wW3xPLm9Ksp4sF7TnNZ8IWv38fd6MdFEBskdDm+x74UlsW4gREXl2seUERInOiwCudQP
 kCmdEAWMNXe2Y2UxH0NOymSxCmLmjKc04G/ea1OQuaH40PU3pC8y22nKINzfFg0OtMot
 gGPYqbCH/uyxo0LFDBK7tfPS15ybuAaFi4DqTmzvGIV3CqssCkHe5cKkjMM3yuGzbigr
 Cs4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=x-silicon-com.20210112.gappssmtp.com
 header.i=@x-silicon-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nkCOK07b
Subject: [Buildroot] [PATCH 1/2] package/llvm: Support for RISC-V on the
 LLVM package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Abel Bernabeu <abel@x-silicon.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The initial support for the LLVM package did not include RISC-V, and
needed to be added.

There is a new configuration parameter added
(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD) for dealing with the fact that
the LLVM target and the architecture have different naming for RISC-V.
While the target for RISC-V is "RISCV" irrespective of the ISA being
32 or 64 bits, the architecture does contain the number of bits
leading to "riscv32" and "riscv64".

For previously supported architectures the naming for target and
architecture matched and thus this parameter had not been needed, but
it is now needed for RISC-V.

Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
---
 package/llvm/Config.in | 10 ++++++++++
 package/llvm/llvm.mk   |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index c1887e36dd..5f2864b802 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -4,12 +4,22 @@ config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_aarch64
 	default y if BR2_arm || BR2_armeb
+	default y if BR2_riscv
 
 config BR2_PACKAGE_LLVM_TARGET_ARCH
 	string
 	default "AArch64" if BR2_aarch64
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
+	default "riscv32" if BR2_riscv && !BR2_ARCH_IS_64
+        default "riscv64" if BR2_riscv && BR2_ARCH_IS_64
+
+config BR2_PACKAGE_LLVM_TARGETS_TO_BUILD
+	string
+	default "AArch64" if BR2_aarch64
+	default "ARM" if BR2_arm || BR2_armeb
+	default "X86" if BR2_i386 || BR2_x86_64
+	default "RISCV" if BR2_riscv
 
 config BR2_PACKAGE_LLVM
 	bool "llvm"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4670773ca3..dbf1f7b813 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -42,7 +42,7 @@ HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
-LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
+LLVM_TARGETS_TO_BUILD = $(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD)
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
