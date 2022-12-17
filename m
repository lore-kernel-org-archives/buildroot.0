Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF94C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED445404C3;
	Sat, 17 Dec 2022 05:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED445404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsCmNLqzlkOC; Sat, 17 Dec 2022 05:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EC8040575;
	Sat, 17 Dec 2022 05:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC8040575
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 013661BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE85F81F47
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE85F81F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjFlQVQk0pHR for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:13:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 062AE821C2
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 062AE821C2
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:13:41 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id jr11so4375838qtb.7
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 21:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rcy+cb4y2iLXGxoif1/CnIf7DTPgwjm0SZsLIOBRkZ4=;
 b=htNkV8knAsCaFMIAXtI23koxTi0IgPs023iuZ25YuWBuJn7Jimyl8KdbPpBS0gTiw8
 DuFDO851IBEE54+XVgJ2mynCy57BUd5jAR0/3NrmyGXFrb5dfropuU4MM3EnNvbgPWl7
 1s68BozJzPB8pd4izs73hEX0Pi7u1fPZooWzuSFnJCrbtqyWVblg3BA09kAzccLO3LkO
 +XeH64fPLLsmwEW4OG74tlcSp8Xjg05xwa0bqLSap32hdPzeeauKxnwPYYa8T0E2xsJx
 wPzGCOscokD9TgZijTyxtS5UH91a2cMnNuHrx4IgobcPIyJTMRTZ9H3/9COlmcsq9KW1
 EWYA==
X-Gm-Message-State: AFqh2kpnw5jZG88ReNVh8dPqd4jKhtMDtWKjiB+e3AunkW4SYktM5XG1
 uhcPcSaPVGrkSC4Z+oxw4i2TimoF8LI=
X-Google-Smtp-Source: AMrXdXsouKv55a48ClhmjwA+ky5Gm0ebxUIuN83NdFL207NR5C4vzk9bwqLhNXc6YhO9FNCIm6oGvA==
X-Received: by 2002:ac8:5842:0:b0:3a7:ea9b:5627 with SMTP id
 h2-20020ac85842000000b003a7ea9b5627mr3724821qth.13.1671254020537; 
 Fri, 16 Dec 2022 21:13:40 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac87351000000b003a7fef41526sm2448854qtp.77.2022.12.16.21.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 21:13:40 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 00:13:34 -0500
Message-Id: <20221217051337.3778405-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rcy+cb4y2iLXGxoif1/CnIf7DTPgwjm0SZsLIOBRkZ4=;
 b=cjOyQV2WfGO5omEX3sO6OcT1julQLSe+oHF5S940bCzEdpUsh4ff23ZLQAr7sab74A
 vvdXkLapD1eROgEW+bcxGwY62hKG3X9bQHqXzJkRZ89KZqBpvOYlFAryvL8stN5xQc9G
 YHCyrB+Sep2qWZHLoH5qp4XvyIMlGzRUtEY+W4eiF2iUXiRzibHihSPRIekNOw5Wv6K7
 PHF4rphykUDaIyPgiRjqT4czhX1D5m6zyKuKhPcen4HQT4Nfs8PqT++ELc9b5kzTwDdv
 nMNx2pL1keheXPI6NlOgDHyQFnckVRrIrVy/xftotQpRYmyRRs4FybKvllfNA60VEHXM
 HpAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cjOyQV2W
Subject: [Buildroot] [PATCH v2 1/4] package/elf2flt: add RISC-V 32-bits
 support
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yimin Gu <ustcymgu@gmail.com>

Enable selecting elf2flt for RISC-V 32-bits no MMU builds.

Also modify the package Makefile.in file to add the -fPIC option to
the target CFLAGS for RISC-V 32-bits no MMU builds.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/Makefile.in                           |  4 +-
 .../0007-Added-RISC-V-32-bit-support.patch    | 87 +++++++++++++++++++
 2 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 package/elf2flt/0007-Added-RISC-V-32-bit-support.patch

diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..4f554f48eb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -41,7 +41,7 @@ GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
-ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_riscv),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
@@ -174,7 +174,7 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-ifeq ($(BR2_RISCV_64),y)
+ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
diff --git a/package/elf2flt/0007-Added-RISC-V-32-bit-support.patch b/package/elf2flt/0007-Added-RISC-V-32-bit-support.patch
new file mode 100644
index 0000000000..93ee955552
--- /dev/null
+++ b/package/elf2flt/0007-Added-RISC-V-32-bit-support.patch
@@ -0,0 +1,87 @@
+From 4a4e8551b7f14ecd2092debbe256c667497a256d Mon Sep 17 00:00:00 2001
+From: Yimin Gu <ustcymgu@gmail.com>
+Date: Wed, 14 Dec 2022 06:49:46 -0500
+Subject: [PATCH] Added RISC-V 32-bit support
+
+Allow elf2flt to work with RISC-V 32-bit targets. With these changes, the
+uclibc toolchain and busybox can work fine for rv32 no MMU systems with
+no noticable problem.
+Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
+[Add more ELF relco types and edit commit message]
+Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
+---
+ elf2flt.c    | 18 +++++++++++++++---
+ ld-elf2flt.c |  2 +-
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 99ad2a8..23c9907 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -81,7 +81,7 @@ const char *elf2flt_progname;
+ #include <elf/v850.h>
+ #elif defined(TARGET_xtensa)
+ #include <elf/xtensa.h>
+-#elif defined(TARGET_riscv64)
++#elif defined(TARGET_riscv64) || defined(TARGET_riscv32)
+ #include <elf/riscv.h>
+ #endif
+ 
+@@ -127,6 +127,8 @@ const char *elf2flt_progname;
+ #define ARCH	"xtensa"
+ #elif defined(TARGET_riscv64)
+ #define ARCH	"riscv64"
++#elif defined(TARGET_riscv32)
++#define ARCH	"riscv32"
+ #else
+ #error "Don't know how to support your CPU architecture??"
+ #endif
+@@ -351,7 +353,8 @@ ro_reloc_data_section_should_be_in_text(asection *s)
+ {
+   if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+       (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
+-#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
++#if defined(TARGET_m68k) || defined(TARGET_riscv64) || \
++      defined(TARGET_riscv32) || defined(TARGET_xtensa)
+     if (!strcmp(".eh_frame", s->name))
+       return false;
+ #endif
+@@ -851,12 +854,21 @@ output_relocs (
+ 					break;
+ 				default:
+ 					goto bad_resolved_reloc;
+-#elif defined(TARGET_riscv64)
++#elif defined(TARGET_riscv64) || defined(TARGET_riscv32)
+ 				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD8:
++				case R_RISCV_ADD16:
+ 				case R_RISCV_ADD32:
+ 				case R_RISCV_ADD64:
++				case R_RISCV_SUB6:
++				case R_RISCV_SUB8:
++				case R_RISCV_SUB16:
+ 				case R_RISCV_SUB32:
+ 				case R_RISCV_SUB64:
++				case R_RISCV_SET6:
++				case R_RISCV_SET8:
++				case R_RISCV_SET16:
++				case R_RISCV_SET32:
+ 					continue;
+ 				case R_RISCV_32:
+ 				case R_RISCV_64:
+diff --git a/ld-elf2flt.c b/ld-elf2flt.c
+index 75ee1bb..68b2a4a 100644
+--- a/ld-elf2flt.c
++++ b/ld-elf2flt.c
+@@ -327,7 +327,7 @@ static int do_final_link(void)
+ 	/* riscv adds a global pointer symbol to the linker file with the
+ 	   "RISCV_GP:" prefix. Remove the prefix for riscv64 architecture and
+ 	   the entire line for other architectures. */
+-	if (streq(TARGET_CPU, "riscv64"))
++	if (streq(TARGET_CPU, "riscv64") || streq(TARGET_CPU, "riscv32"))
+ 		append_sed(&sed, "^RISCV_GP:", "");
+ 	else
+ 		append_sed(&sed, "^RISCV_GP:", NULL);
+-- 
+2.38.1
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
