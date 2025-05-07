Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B4C3ABC5
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C13861393;
	Wed,  7 May 2025 21:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtM1D1hqyBWq; Wed,  7 May 2025 21:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A666135C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A666135C;
	Wed,  7 May 2025 21:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C028151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2832741A9C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IScV6405W1x for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D03D041A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D03D041A8F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D03D041A8F
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso2489225e9.2
 for <buildroot@buildroot.org>; Wed, 07 May 2025 14:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746652875; x=1747257675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URZxQ/NelB2rHLoIIyTYraZFf5eRwGq1RfVeHvLbOi0=;
 b=SIUHR9pOHTtYATaZ+TZhGvv7Xf+CulsUrTJfOhlW2cfrz9cPL5n0Y9Sdyn8TLmZJXl
 nH4SNt8qcsPBu8vXAU7gHb1AtaopV5KQ0SnqGOhq/HprpYPnoJsNSfvi61vZtUcfkmMw
 TRtYUKFBjGh47SCJyiPm3Sr2KCNcWRaiEj5h8DBd5f/dn7y3DqdQ+n+9JyhQkDpQDzP8
 Qj/kHShd2EETwetn2cMCuoai0pGqLxknKMgI8vrhhQoopVu0oG3PnYgLAniFATxO4IZ0
 c+HV2HM42H+XYnjZH1FRGJe8PmtXf0vpwvoQKVFOWR0wZ4x+I1mGijyjwnf/Y42QHZgL
 V1tg==
X-Gm-Message-State: AOJu0YwkDu1DgO9oCV5EfOJKh+LYgpnv0L/t+IfpF4ul04FqilGb5zBq
 4dFYos9Gvo6aqjS709BX4J5k66urCps2ZAL4U5bD+4exkPnQrB27JLqustIj7Ittu1YaZuuQbUV
 6
X-Gm-Gg: ASbGncu9ccIi/PSpR+/koSCguJHkhg/evDUXhtNl9ZBV23yaQ25Etl9wSOS+tlXP7LH
 8g850sVxLSmTEMPFmxuNW48rgtg6YVhdTOyWk+xpOoSMF0oGCKZWGKAcRfPayXPsponpojkESgD
 Yq5RAAzMaO30oLTWlYzvJgrX0G/ZXw2nGgavXBuRmsfnvEoJaQq+KuDhXBnUJs9kQ/pNIGL4V+j
 F/ci2aWI3vpiV7u1AakW2xE0+pLahyMlvki8kQSMECOFtNwoY6JL7v3hltDYkmDm8g9/0OBNcXG
 ZUEeWh4gLKpuWg0o9Cuz2Z6TqUN9cuBzAyJWvcKRQo130sAreo7gGuG7BtQB7/kVHV4iHHiggJw
 dH4z0q9Os/WO46SBFfvCd4FdwqIyQzwB1jXnD0RE=
X-Google-Smtp-Source: AGHT+IEpu86AbJDWKmvmibnPwl7exoC0LJQGlGMBVyJBBqpcI1kZqyNn0cIQwHYt4LSL74O/xE9nxw==
X-Received: by 2002:a05:600c:4744:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-441d44e3655mr28919395e9.32.1746652874894; 
 Wed, 07 May 2025 14:21:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm13109785e9.39.2025.05.07.14.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:21:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  7 May 2025 23:21:10 +0200
Message-ID: <20250507212111.748688-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507212111.748688-1-romain.naour@smile.fr>
References: <20250507212111.748688-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1746652875; x=1747257675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URZxQ/NelB2rHLoIIyTYraZFf5eRwGq1RfVeHvLbOi0=;
 b=S74TF41nLLTtWu25cAl2Jsvxdj6A+8XrDCBT6EPq1du/E6V1ULcQAKImDKjP/uUUAY
 QveeT2ln8khjbT4/6MjVYtK3Q0SstZvFgCqiBYsyPviKb8MHv0EMNb8DeludsXvAOjAF
 IWoytmCmazEI8/7vi8PFU4bUK4gvTOadg2qWY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=S74TF41n
Subject: [Buildroot] [PATCH 2/3] configs/qemu_mips*: backport a patch for
 GCC 15.x compatibility
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

Mips kernel maintainer merged a patch [1] for GCC 15.x compatibility
that will likely be merged upstream soon.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...g-specified-in-KBUILD_CFLAGS-to-vdso.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch

diff --git a/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch b/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
new file mode 100644
index 0000000000..630fcf6315
--- /dev/null
+++ b/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
@@ -0,0 +1,52 @@
+From c94606e06b54bc7b909fb342aa8dae732b50f5cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 29 Mar 2025 08:39:03 -0700
+Subject: [PATCH] mips: Add -std= flag specified in KBUILD_CFLAGS to vdso
+ CFLAGS
+
+GCC 15 changed the default C standard dialect from gnu17 to gnu23,
+which should not have impacted the kernel because it explicitly requests
+the gnu11 standard in the main Makefile. However, mips/vdso code uses
+its own CFLAGS without a '-std=' value, which break with this dialect
+change because of the kernel's own definitions of bool, false, and true
+conflicting with the C23 reserved keywords.
+
+  include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
+     11 |         false   = 0,
+        |         ^~~~~
+  include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
+  include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
+     35 | typedef _Bool                   bool;
+        |                                 ^~~~
+  include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
+
+Add -std as specified in KBUILD_CFLAGS to the decompressor and purgatory
+CFLAGS to eliminate these errors and make the C standard version of these
+areas match the rest of the kernel.
+
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: stable@vger.kernel.org
+Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+[Romain: backport to 6.12.27]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/mips/vdso/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
+index b289b2c1b294..c729bd687804 100644
+--- a/arch/mips/vdso/Makefile
++++ b/arch/mips/vdso/Makefile
+@@ -27,6 +27,7 @@ endif
+ # offsets.
+ cflags-vdso := $(ccflags-vdso) \
+ 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
++	$(filter -std=%,$(KBUILD_CFLAGS)) \
+ 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
+ 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
+ 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
