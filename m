Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D61D1357D
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A40D281258;
	Sun, 27 Oct 2024 19:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AKsY0TPPJKu; Sun, 27 Oct 2024 19:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F81B811D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F81B811D0;
	Sun, 27 Oct 2024 19:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1B5112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60704605AC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axWSxPXoKs_S for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 19:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3556B60646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3556B60646
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3556B60646
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so2749914f8f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 12:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730058222; x=1730663022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhpVp57RxBGX6Hi+wLCTxtlts/2twWej4RT4AsyL134=;
 b=bm/SWzbh5zMcugXJ3baMNJXZEzpSe3l9smw8WTHwm8buoSWXZwkVfEeh4Zws5KJkFv
 eRRYHBzNuJD1y5/HG6sr4F4pgHoMpezYcW4nfNINHTCy+RDnjdTF4a4I51bBG4Qu/gH/
 wlnYtw6NRxBsUIWhsgpKu1xY2TD6xKhfKRPx57+jPnA3a4HvjSUCus2IHtuyIAuWzRWC
 mG+9IufPL9//gQmIFp4A4eY39qKOy0GOnSOeOrHvwsaFnBtTXIC4ig3nbqNYDMNry6Ha
 CSxLqNXNIb6FDR1CTkM9VxrSCIEkDbBId2oXeV9l8O1yQpuXuL/rBUeHdtqyyMsK+geh
 Sysw==
X-Gm-Message-State: AOJu0Yx2VE9CV9cbzeGDWe3Wm+QrA5OOyY9wVkzNuwrrY8yr6+LLdv7I
 OTGGYre7Et6NXXZl9J5T1FTNFSIATfjK+qMMdk5IR7EhcUCAZAqQV5Q5J/B2z/MLpOjUgH5BBzK
 o
X-Google-Smtp-Source: AGHT+IEjpKJft0fkG+mg7l+29dDWDbH8jYnQsoJ1cj5NmuRx/7/U2GaYQngBQtdl8Qcz4HXUeRkNlQ==
X-Received: by 2002:adf:e54b:0:b0:374:bf6b:1021 with SMTP id
 ffacd0b85a97d-380458827cdmr8906224f8f.27.1730058222011; 
 Sun, 27 Oct 2024 12:43:42 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bb57sm7495010f8f.38.2024.10.27.12.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 12:43:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2024 20:43:37 +0100
Message-ID: <20241027194337.2444930-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241027194337.2444930-1-romain.naour@smile.fr>
References: <20241027194337.2444930-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730058222; x=1730663022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhpVp57RxBGX6Hi+wLCTxtlts/2twWej4RT4AsyL134=;
 b=BJFZQ2xWJ2dqU61QwqFYe38vqQuZPoVEzlOb+I6rZa/yTXtjY6hw8BKEmMYgsJac+L
 JiOY+MSDDN9s1YOphI1dRGkDgXQ9ZohMUxorwKjaYPYAfT7XoYX2lK/JQefn7W7TbnC5
 Rxhdtl3/B2hlQ+64du4AkNWe3egUgdAU/p33k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BJFZQ2xW
Subject: [Buildroot] [PATCH v2 3/3] configs/qemu_aarch64_sbsa_defconfig:
 switch to neoverse-n1 (armv8.2a)
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

Note: SBSA Reference Platform was recently updated again to neoverse-n2
(armv9.0a) in Qemu v9.1 [2]. But there is no armv9.0a support yet in
Buildroot.

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: update a typo in the commit log (neoverse-n1/neoverse-n2)
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
