Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B6CC87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9051760FAF;
	Sun, 10 Aug 2025 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkwymKD1REm1; Sun, 10 Aug 2025 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD8060BE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD8060BE2;
	Sun, 10 Aug 2025 20:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9173C154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C39409F5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVvPMwk3mOaM for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5385B40297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5385B40297
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5385B40297
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:36:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso2203815f8f.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754858185; x=1755462985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGhpb9O5KIY2h9nhiO10lp0zoWMDsNAsm19ODSEVIA8=;
 b=l2osRHykgnT4gx9MLhG4bxMkIfS9daPa1+nXkRdOF8m52ytNbU5fqLp0euDdNlZSG0
 w1PRuq5r/pWcTkgpeDhxTslWIICmO+X2VvzQdTHD5vsLyFU7uh1DdNCJzQoWH/e8Fhb5
 mOWAJCzJWyObYxFw4nEPjlsSYkhibnroObiJpBaK+1rrZw5u2Vs6dSq+UUsXSbwdUBjS
 y8MqtIsyYuC+aoRxFk+HFslBvloT0U4PvwWqBV6C6wtwbaMaF348ZWj3OI/VOqoO/tpG
 PJmiD5j/z3yNFbnh+l5CHnPHvmtlq1ilIz6Ibe2yAo+1uvLqBTzzyKogHVg/72FRitTX
 PhkQ==
X-Gm-Message-State: AOJu0YyKOWK21BlBYu2t+noI36yT1JrfgN03iUHpPLa1PEPeHvBU8PW/
 FUVWutXJRX6B7dRyvWeMi8VSqbI63RWrpfse+gG+7X9SQnYZR+PtgNezS0asWrukuLcdhsMioDg
 4SKN3
X-Gm-Gg: ASbGncteVJ9/HAfzoY4IuE7HbaqLWFM5BnJVHUZfcRvAuLlzUZE8QS9avrXabB9OTSU
 kO8xCA0ibNNVDxtwuHlPdjAqkPDN6cEahyOZT5rRtslsa/OuAIHoG4XcxSToT65ymx6wrsrkb8m
 IZRlwc0eRoXn1ctpTZxeGfsV5Dcc6PXjaKyVgNcTueVSpFf2x7OhnoKnwBVUdbdJA1bU0bazX3e
 HJ4X5R3hEagBxfaxzOM0HRcs1RQqmmVMLND3c/J59ZIoldfQedqDmWEiYfalQV/h6vWhuQI1nUO
 /7TPf0+6PtYJcE2kY/fbcWiP8YwDU4ggwWJhwE3DRbwehN0YyOs0suVxGrjy0mA7reob+CkAuV6
 QMUmSJH5hg+MfKtOtVjDgcC7eoho6C1BGlmqlZbULlNd5o6W2K3AfmW2WLun6YEk91e4St0rpnF
 F8bJWIC9yPNUF1uUOPCxsm
X-Google-Smtp-Source: AGHT+IHourw4csBlpaDFyk3y3fCtrKoJ74O0IEob6uVPbW2fXJ9BWWtFmdAqKKvESRuEIigjpzKoCw==
X-Received: by 2002:a05:6000:4029:b0:3a5:1388:9a55 with SMTP id
 ffacd0b85a97d-3b8f97bb949mr11158055f8f.5.1754858185247; 
 Sun, 10 Aug 2025 13:36:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm27602586f8f.50.2025.08.10.13.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 13:36:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 10 Aug 2025 22:36:21 +0200
Message-ID: <20250810203621.945900-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754858185; x=1755462985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGhpb9O5KIY2h9nhiO10lp0zoWMDsNAsm19ODSEVIA8=;
 b=HMw3t7OW/5/b0X9s96gYAJW44qY6UbFBZeorSLxdwLOCCmwZ2lG6+srio5wEmKjpmB
 VW+tvnPMLmehZKYN6wqvRvwu7sED2HARJzWASVG3KlZCG/zOIDEl0oNjF9CwmkdK94wt
 ebPID5Fh/uj3EyU4nifMpq1SEavFyLFiU4oRc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HMw3t7OW
Subject: [Buildroot] [PATCH] package/gcc: add microblaze fix for GCC bug
 121432
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

This is a temporary fix under discussion [1], but it resolves the
problem, by implementing the same behavior as GCC 14.x for register
allocation on Microblaze.

Tested with qemu_microblazeel_mmu_defconfig and used to generate
Microblaze toolchains for the Bootlin toolchains 2025.08-1 [2].

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
[2] https://github.com/bootlin/buildroot-toolchains/commit/83947c7bb6158072bc2f52b58e90891cd3dc04a2

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---

This requires this patch [1] applied first.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250728045145.132333-1-neal.frager@amd.com/
---
 ...-config-microblaze-fix-ira-for-GCC15.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/gcc/15.1.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch

diff --git a/package/gcc/15.1.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/15.1.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
new file mode 100644
index 0000000000..6a1e5cf31a
--- /dev/null
+++ b/package/gcc/15.1.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
@@ -0,0 +1,56 @@
+From b6163bbd898e2462455998d5d38fe1463e70ca66 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 6 Aug 2025 22:32:30 +0200
+Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
+
+Add new hooks for callee-save on microblaze defined by [1] and
+return 1 to restore the old behavior prior to the commit [3].
+
+Tested with qemu_microblazeel_mmu_defconfig and used to generate
+Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
+
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
+[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
+[5] https://toolchains.bootlin.com/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.cc | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 4b7f0a1a5e0..3710755ae8d 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -3200,6 +3200,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
+   return NO_REGS;
+ }
+ 
++/* Implement TARGET_CALLEE_SAVE_COST.  */
++static int
++microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
++		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
++{
++  return 1;
++}
++
+ static void
+ microblaze_globalize_label (FILE * stream, const char *name)
+ {
+@@ -4038,6 +4046,9 @@ microblaze_starting_frame_offset (void)
+ #undef TARGET_SECONDARY_RELOAD
+ #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
+ 
++#undef TARGET_CALLEE_SAVE_COST
++#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
++
+ #undef  TARGET_ASM_OUTPUT_MI_THUNK
+ #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
+ 
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
