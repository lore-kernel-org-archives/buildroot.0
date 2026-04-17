Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF84F43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C4140CC0;
	Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DwagVQaMPBL; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAFC40CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416386;
	bh=sAyg62vXIQeCIeDD+OtIXdBWUWEOiO8QQDVupkj2KUc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mCQ5zJySSlHtKN+7luDun8eGYzWQfnvbMaVP1Aj/wVXVH6BO3vIUbTOB1fu7E+xce
	 9aUMMdAGBqm6WTaxLbo9oC/pFO+yMnv0ZbcjBEYhdPLCXJ79Zx5xcTT3mmoshiYSXQ
	 6o1RllXoPZsyVhte37xfh3N1Ss+uvHDE91pk2+RU321GqVUagjHIm5LhQTcK4dFBzK
	 fHkXuduvIY2YKk/sUlPbESfs/pcnYtoDcGIXoVAqBnRKEJNjc2wIM8+Z/k2rwBjJr3
	 /nWgwDV4J6lTGvwmXoQr0P2vMlJpy168m94+8ydMYLPjnejGSbk42t2Ye+4yIjy7ae
	 I9kiupghkoW/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAFC40CBE;
	Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 709EB259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 569EC40CBE
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRC5dddSVjA6 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9506C40CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9506C40CBD
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9506C40CBD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488c2690057so4044585e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416381; x=1777021181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H0yzHEBcTB7NLs42aYcAQt6xRyG6QAsw8xkA9zavbtI=;
 b=nXxI7rVZQ2tPj6Er7x0LN6MRsMvRw9sVByscf79tLQz00yhxKoQJoERmIwZOJlUAn3
 eqvVJ2EUiBdfwNT7dIIgZ3sqOSWtsXou57pa17Ume7hx+lnxYRW2sJZLITAWcJmeiK7J
 uQcHv+N7cvtl2dyJK7Jn7FQNbFqBlCqIcNwb+njyyo79u5R89YLKFejMn0jkwswgIOqP
 gnBCdRJNJY5qsg5waoUvpdNv0pss/FAqEqPIliZeXDZ5/tPoLMewMdnO6t6k98gnB5SA
 mPqiQ/9q5ao65+02eFPfARVStiJCLengeXcEzb6+bwZS0ZQjY9MAX7sQ/XW4Pr/hYCBe
 dkXQ==
X-Gm-Message-State: AOJu0YzNWeoiReu2dtHYBZJpkN5Rkq2jkB5Nlizt6wwbSLtTaO9w6TcL
 kQNmSrwo/C3udz9bd2O9W9ufk4ySJd9ZR9iYPRQbdunKgyJc8YECmbkvc0Uvw4Wbi4Qal2ULyo6
 n9tQLVqg=
X-Gm-Gg: AeBDieuFEVbFf3RKcJmBUoRK+VwjZCw9WrK/pSDy+SILctR6Y21lt3EvgEPHz1rxfOU
 Wl7TXMuDYHWinrevFhvOllSIRDqBVQlBe1SFLPtEjrfShr57hUwrm3OuZl0mdomrstYjqFNjuI9
 KgZxijgyySmMMSjMAxfVlZcDwX/eNa4ni8DKuRLX592lKxhBYvlN5D615KZz2idOOnoszN1CxHL
 oS72Q+jOEHUUaAHqkLooN6ef7Qr9dkbgqN/YvezeFF5ym+GkIgdw49Cn77CfjPIFWMcp1VHaltA
 oDtJ4Q+YbV2MwQugkVeJz6xSxr4MXHnLxZN5Mg2ETFqx2QxrwrUWxIVzV3wZej6Ril5AcSZfzTU
 5LTQCURXMukDS8tj/Mu3mdeMUK9jXS5sj8yJZc33nnOpr2kpJnTWr7aGNR1+pnE1OCDwxMPuwBg
 OEhS6u/+3yL/OlbToAA7pJ0BTEb2uc/ly9oi82hwQIG/cuH8r+kX5NA83AykZjIP/GmJrfh08UM
 geAiPg0RM3DnQqGHUVzuRK34A5mX2k=
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id
 5b1f17b1804b1-488fb784662mr19048105e9.25.1776416381347; 
 Fri, 17 Apr 2026 01:59:41 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:17 +0200
Message-ID: <20260417085936.200528-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416381; x=1777021181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0yzHEBcTB7NLs42aYcAQt6xRyG6QAsw8xkA9zavbtI=;
 b=JlDBqB/FbxYt3rAw8FYk06N5MRAX/6aoRSzEdyiJiM+VdJzfRFnFMq+QTfSaD/D/GD
 Nh5dGxNlyRce9eXOa19K1647v8TwdeI8B134zrOdeppZYom8q8QPzExQCfzLVyTTH4tn
 ooZnlP4WpOOejtC/e8Qjam0mDwz5eWzEAG8wA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=JlDBqB/F
Subject: [Buildroot] [PATCH v1 02/21] support/testing: test_grub : Kernel
 update bump to last LTS (6.18)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y :
While building the kernel tools, libelf header is missing because objtools
was not compiled by default on older kernel versions. This results in the following error:

[...]tools/objtool/include/objtool/elf.h:10:10: fatal error: gelf.h: No such file or directory
   10 | #include <gelf.h>

That is why BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF was selected to build host-libelf.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/boot/test_grub.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 061bfc9a2f..a6246f5a4f 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -14,7 +14,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -43,11 +43,12 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_EFIVAR=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_EDK2=y
@@ -91,7 +92,7 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
@@ -139,7 +140,7 @@ class TestGrubRiscV64EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/riscv64-virt-efi/genimage.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.59"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
         BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
         BR2_PACKAGE_EFIVAR=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
