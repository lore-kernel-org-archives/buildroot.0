Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5820EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31A44245D;
	Sat, 23 Jul 2022 21:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C31A44245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4lOluZTsa_i; Sat, 23 Jul 2022 21:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C26D41803;
	Sat, 23 Jul 2022 21:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C26D41803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52E411BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250F341803
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250F341803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWZ4opyLVZ9D for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6223417AB
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6223417AB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:54:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g2so2893819wru.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yg1RUSue5jMOQKzGBKrJeIdugso1RbRRkDTrATXhG70=;
 b=kKljq0gafKQYvH1a/nzgtRkGRGvu+ah8JcHVF78njpooiK0QHsuLqbYqfTfNFhr6DE
 jbUEN/4BATKBVXXV71dZWqhKg9xVrgAoQkvCT6nNlfxJybnIcqOgUsqlSKVsSXE6PvWq
 EeU/3l6n75ZlZKYXW6XObXsHGt039Qlu5TCAAQTlYGXxSKs8GV8/ah7nvWOPkdeY2wy1
 e92/CZgSZOnNrwoareQJYBsTPJ8iFs1keke/3P4NUcSocBDyop1NqcyvAxm63CeMJBhg
 czTfJj6ZOHUCKdXqE8dzUdHp+mWuWf0jk4nq1jOGHu6bdnLFhd8+b61IdnZq8Tp2EAZd
 3h3g==
X-Gm-Message-State: AJIora+D827nxWZGmZTaz+X/oyCZwZ84hD5KSdbyvpQPKgn4d1OuX/AW
 iFRLDM1a2dp430Kcd11B2ZV2FGviU3P+SQ==
X-Google-Smtp-Source: AGRyM1uP8RSlG2Iq2HTTDLJbs2zzMejHfwr6dihV/u1onhWZueTfhMrIZijO/yO5Cw0Lk+PsBkw1Qg==
X-Received: by 2002:a05:6000:186f:b0:21d:969e:c80e with SMTP id
 d15-20020a056000186f00b0021d969ec80emr3510225wri.129.1658613294656; 
 Sat, 23 Jul 2022 14:54:54 -0700 (PDT)
Received: from jupiter.home (14.5.23.95.dynamic.jazztel.es. [95.23.5.14])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d568c000000b0021e5cc26dd0sm6227959wrv.62.2022.07.23.14.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:54:54 -0700 (PDT)
From: Abel Bernabeu <abel@x-silicon.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:54:47 +0200
Message-Id: <20220723215448.2532160-1-abel@x-silicon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yg1RUSue5jMOQKzGBKrJeIdugso1RbRRkDTrATXhG70=;
 b=C8sYuMteK85HeJXE366F/sX93Xd9XkjTFQ3P40+V94U9Qp73q7xlsXydORVRZ1B+pv
 T/6KsPlkwyIbdD24BfDZBref8b/N2kfEcGLf6n2oaAFvnbiAoLHAhUV4WQiTfhKgDLjV
 JiWYGhEDGmYntID6TbfMxBt41X/tSDgfZ+CRg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=x-silicon.com header.i=@x-silicon.com
 header.a=rsa-sha256 header.s=google header.b=C8sYuMte
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
index c1887e36dd..61197fc588 100644
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
+	default "riscv64" if BR2_riscv && BR2_ARCH_IS_64
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
