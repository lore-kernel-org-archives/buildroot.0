Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C4C83F16
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 544B981415;
	Thu, 29 Aug 2024 15:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJSPsvG02k19; Thu, 29 Aug 2024 15:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD4881F1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AD4881F1F;
	Thu, 29 Aug 2024 15:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 666C21BF27C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 15:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52AB461122
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 15:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ16_JUrHJDh for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 15:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=bmeng.cn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66DEA60A5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DEA60A5A
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66DEA60A5A
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 15:41:57 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7cd9cfe4748so626872a12.2
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 08:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724946117; x=1725550917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ERku2jgyH3QInw3PWRhfKg6IQcRZgAhQxyMlNcsV+PA=;
 b=abiF0uab/sSfGtK2iwJj+IutVDs+JiWtjAAJG/QAPcJ4CYzkZHob9NtItnv16xiylS
 SL2gwHxv5NsQ69Bsc0vRPd7lpIlpEt8/7X78kuCrcGYiaA/u/h42EQqpX0JEnJJRniQJ
 WF7WkhnwZ9CoFO4L/VvK6IYaC05ab5Lo+1SdN+eKZRY4oUxLvcLGc/GS4Mxoihup9aXt
 W4r29q78FzvO3v1257T1YU+7rqyYo573d9p7KxY5ZzlV5TW1c5DdIFVCVS3zB9IU2sTB
 E8NQk0kxwNElVi8eNCk6+1MZd4F3NA4Z99C4Xvc34NF4ADIMYEuuuGUGGt7ds+IXvIqd
 yiAg==
X-Gm-Message-State: AOJu0YxFRXrDQ9R/x4ipCrdCn3wFNupTJcOVUo7jsCs0CuWkMTMszAXU
 mrc+JlFna6KABcuQlepR4R6HWRzU+JJkm5TIYDxW4nAcfOreQuiXonvttnLh
X-Google-Smtp-Source: AGHT+IGoBsoMe+uFmKSH615BYxQ3kFK3hQ0W9+XSutgAJ6AFtPVLB2KTJIjPEj8BEKPBLu0I35cySA==
X-Received: by 2002:a17:902:c40e:b0:202:cbf:2d6f with SMTP id
 d9443c01a7336-2050c48f92fmr38440005ad.57.1724946116461; 
 Thu, 29 Aug 2024 08:41:56 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205152cf476sm12869855ad.102.2024.08.29.08.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 08:41:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Alistair Francis <alistair.francis@wdc.com>
Date: Thu, 29 Aug 2024 23:41:50 +0800
Message-Id: <20240829154150.174934-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724946117; x=1725550917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ERku2jgyH3QInw3PWRhfKg6IQcRZgAhQxyMlNcsV+PA=;
 b=KJtqvNY0F8lbNHiYpoeTNgSqRZIUzlfcaSr5z4fMISFVGpCoJ5y9r/Xj8IqLjQs0lg
 EechSkadMB881cJUbWPIxNEWYRgDxuRI6d8vGS9chSRUAFcTh7JCUGZAOUOKoD1AFoyn
 Sl99qaHn3bQAqctywbeluHD8C96DkLIWVJZSB0OcAZP9D6BVXTec0OPPdErvwTVZLkI4
 cQOMvnuHDVzNjTV/kisliYu1Zb3BTtwZOb9fjvfUo9dQfJzV4U7GDA+hJ1P479bWiz5s
 jfAuHHf09CPnkqYWoH1s/83XOj+iJLbRZvUE0CK2sI9O/Z+FyLBVJRn8o3Irdb4Yb14L
 a+kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KJtqvNY0
Subject: [Buildroot] [PATCH v2] configs: riscv: qemu: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

Update qemu_riscv32_virt_defconfig and qemu_riscv64_virt_defconfig
to use the latest OpenSBI due to the reason that:

1. they are the main platforms to develop and test OpenSBI
2. latest OpenSBI binaries are always integrated into QEMU as
   the default bios

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---
See v1 @ https://patchwork.ozlabs.org/project/buildroot/patch/20230626160030.93063-7-bmeng.cn@gmail.com/

Changes in v2:
- Only update QEMU defconfig files

 configs/qemu_riscv32_virt_defconfig | 2 --
 configs/qemu_riscv64_virt_defconfig | 2 --
 2 files changed, 4 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 631526b695..28bb2b0cd6 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -29,8 +29,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 31ac1d1ed9..54999cfee7 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -29,8 +29,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
