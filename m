Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE4C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A26D60C1C;
	Wed, 24 Apr 2024 20:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8isu_CbnKqtB; Wed, 24 Apr 2024 20:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27CA160E5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27CA160E5A;
	Wed, 24 Apr 2024 20:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A80011BF30F
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F70414FD
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 20:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iH8jsD3919D for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 20:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58253404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58253404D4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58253404D4
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 20:10:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f6so1859795e9.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 13:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713989436; x=1714594236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rpn6WXHzrPYwKt6AamdtGX2yZh72nA+HnXfJ2gbe1rA=;
 b=omeeuftjLKW7jm8n1SVt7M1WU/LXd6t42pO39QAU4w0VTx8h0yAt0nyuqyrTR6i9GC
 TZKgSiBOyGztCVhSdg//p/90GCxf1M6UjMSPEgHQMvjKSka5EQLgcjajoAAN+gDLLfm4
 +oU9j70JCqvOmieWJCTSCcsfoFZ60FUqbfd9C8/499s9E4WHmBZzHfCA9wyf1/EvrnZa
 Agrol55ZMgBtZP3Xm71p6hBwx4f2zan4sc1EN2K5GTZOpWjAQf5IWScNfJozNfefLI+S
 /l/evAeLsBwO+p4TO0r2kiTVHXrtJ1F8j/swKVC9UnAMrULl5D5OeutpYK2VoI1RJzBl
 chbA==
X-Gm-Message-State: AOJu0YyR7AFTB+mdR8oblMmMLIwrG5AxuXKLsmNvQZUPLuXbO96tW8AK
 eJd8Kl+LwbSwgl9aLEMIcF3jc+Lal0sVfBFlDpV5fWdlDr32LRaNyTnHq548b078lWrmRbDmOC1
 N
X-Google-Smtp-Source: AGHT+IEQRSf3GC6/J9xDIXvvDaRps15R20Z2tCc6gAw8SnRZvq81OMa0RmOp9lmwKRBlvwT9+5JHkA==
X-Received: by 2002:a5d:5288:0:b0:34b:152a:ccfd with SMTP id
 c8-20020a5d5288000000b0034b152accfdmr1967904wrv.69.1713989436313; 
 Wed, 24 Apr 2024 13:10:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm18239990wri.84.2024.04.24.13.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:10:35 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 22:10:33 +0200
Message-ID: <20240424201033.550180-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713989436; x=1714594236;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rpn6WXHzrPYwKt6AamdtGX2yZh72nA+HnXfJ2gbe1rA=;
 b=jEUj5Yk3dXvBr3PCUxXK33QD8Vr4mLyjitNXVm+tXEJjfyfOaJJy3TLVo+kaEmXYYK
 a7X0AJ/V2TbZF/6Ym+r7USGlxsnWdvp4bQEi5+ntnf4LMHKhx+gIGX9KdCud6ruAd0VL
 CeMoMXpQ3kXJbMKz2gkAoMu2fbRI2ApHCbBn1sh68yUDhOPW3TsBs2UvgDKU/XObRmzX
 oQZ8R3EzS/EuEhQLHzpJzq4He0dzkj+ugwSMmFV/iqpjzhqUWAksvsVcQ55esY6vWl4b
 TRk/RKH/psbjD7c19OoP5vSIahAaF8PlKfDuKunxXf9kJYx4L19irV2p4rbONfIsrii0
 QWFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jEUj5Yk3
Subject: [Buildroot] [PATCH] support/testing: TestF2FS: update kernel to
 4.19.310
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
kernel build is broken with binutils >= 2.41 with:

  arch/arm/mm/proc-v7.S: Assembler messages:
  arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

A similar issue has already be fixed for qemu m68k [2].

Bump to the latest kernel 4.19 that already include the backport
of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

[1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
[2] a1ce9474e40f731f327035d8c0962abb16f00ff7

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222383

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 425fbe31ca..826077ac94 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
