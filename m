Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3113AD10C16
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 09:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94B5181340;
	Sun, 27 Oct 2024 09:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv38ikctpr-S; Sun, 27 Oct 2024 09:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D77812C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D77812C2;
	Sun, 27 Oct 2024 09:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24686971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035AD606E5
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5xw6MKe2rEV for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 09:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E0EB606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0EB606DC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E0EB606DC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso32741255e9.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 02:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730021591; x=1730626391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Db7z7cOv+s8HKdU10jwbYAXojph7mtRc3oILLmkYHM=;
 b=eUQBp4cW9teEkTzZdthwpmtUvlxtRfGXlF5a/2m5YDYxi3pC+x5pMsGYTiBxvp52lr
 KQqOz4CaL9493Jr3EOlVYQqyRDqJ23t1ShRO0ipLq0czMm4NJ2GGd0mFSE05EzUxAhUW
 JXzRjS8f6hdNt98HubVR5UR/cFlwl0fIx+RNcio2+JxuHVJ+RjK7CArK+2/Ou8TgIf79
 9s9jFIFr0hhKrK+vB5B9FxSvUzVvu69I+44rbQignNw2BQJvyNhEPGaLnwHxYG26S/ab
 TSaQIQ244zyiyEoWHRkJSQaU7NpK+WYZrvp5LgcDz4bSSCdydtaVvjfe5L9IvYPddDOs
 Z4sw==
X-Gm-Message-State: AOJu0YyTUQqYte98uujcISEmRRokDTWlogi5jSFt/T1XVaZsW3BO6vcf
 APwgMm74rrQmE0jW/Pk89MwkKdWxfk+RXAOPL3EUP37+569pIyZNSgIRU8cQy9Ybk6Eel8gXXG0
 9
X-Google-Smtp-Source: AGHT+IFyWWBBPFiL0hzxmFa7OfiWWtBzDD0gGqFOFotS7UWf3ejlJIHBedhFTS1b99AsJGhuHNEbrw==
X-Received: by 2002:a05:600c:1e05:b0:431:5847:f63f with SMTP id
 5b1f17b1804b1-4319aca78f0mr41258475e9.13.1730021590660; 
 Sun, 27 Oct 2024 02:33:10 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193595baesm69662135e9.17.2024.10.27.02.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 02:33:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2024 10:33:06 +0100
Message-ID: <20241027093306.2271872-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241027093306.2271872-1-romain.naour@smile.fr>
References: <20241027093306.2271872-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730021591; x=1730626391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Db7z7cOv+s8HKdU10jwbYAXojph7mtRc3oILLmkYHM=;
 b=UMsh34/m7fbdmENk/NN418b6i5h0vD/ncGKe4rIogGiOotjpQo2tmtRnQfX9f2iji9
 cV6HHx1cUDYadT8GPT7/ZAZhjCSC9Vd9WxQpMpALcNDj6nvuosQFhmt50W0EwqPeqEsT
 BTgsoLQM2ydEFdlDBls5INLDawCQEdHOOO3Rg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UMsh34/m
Subject: [Buildroot] [PATCH 3/3] configs/qemu_aarch64_sbsa_defconfig: switch
 to neoverse-n1 (armv8.2a)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SBSA Reference Platform was updated to neoverse-n1 (armv8.2a) in
Qemu v8.1 [1].

BR2_cortex_a57:
  # cat /proc/cpuinfo
  processor       : 0
  BogoMIPS        : 2000.00
  Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
  CPU implementer : 0x41
  CPU architecture: 8
  CPU variant     : 0x1
  CPU part        : 0xd07
  CPU revision    : 0
[...]

BR2_neoverse_n1:
  # cat /proc/cpuinfo
  processor       : 0
  BogoMIPS        : 2000.00
  Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
  CPU implementer : 0x41
  CPU architecture: 8
  CPU variant     : 0x4
  CPU part        : 0xd0c
  CPU revision    : 1
[...]

Tests test_fwts.py test_edk2.py using
BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y are not updated to neoverse-n1
since the Qemu used by the gitlab-ci is too old (5.2.0 while 8.1 is
required).

Note: SBSA Reference Platform was recently updated again to neoverse-n1
(armv9.0a) in Qemu v9.1 [2]. But there is no armv9.0a support yet in
Buildroot.

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index cf5f66d4d6..7d97d7f6ab 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu cortex-a57 \
+    -cpu neoverse-n1 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 23d274b529..6df2b2e273 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_cortex_a57=y
+BR2_neoverse_n1=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
