Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A90EC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14AD240D00;
	Fri, 10 Jul 2026 13:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiGGv_t7b51u; Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490AC40CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691519;
	bh=67/yQ5mDpl4tmmm1ObYPdvty4FSGSHZpD0st+GgiPgg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E7hdqCOAQ5sskGExXudM2mlaGEA/DNE+huH+lGPJYkkHUofiz/WEFGA8D/BQfk9pE
	 tnwbBg4NkAWG9De/CAAwYC2zteqgkrGapRUgVtT9UJCPR3Nix4r5PNuqM2MZt7tsDg
	 3/xYYw5b8W3dhiZTj1W5jFY2O+3fv8tk/OlvA0H6+w0xO1ZiVHYAU0+BqbXtzjPqge
	 rhLJiRKZTHHt80xye6052mlAgC5wOMFgxH1v5KhJRwgZ6mf4gbawJgVTeA5o0rQJ04
	 lvFF7hfB0AthG2cc32fM7dY8F2CXzihuKo/xwBfYe1Ltr/jCGin6tP3PUoDITvWxOd
	 MNN6JsbAMjmrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490AC40CAE;
	Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 238512FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F57606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiuufEAeKZFX for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A298606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A298606F2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A298606F2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so8685875e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691512; x=1784296312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IS5IQutSgYbzlz6pSR2YMP1Afk/W1i4DdatVtpoixPw=;
 b=LQq71vCtslxHlLgf94YkihW4kXLYaULV3OkH89VnU1OqgCW8dyIXjLjoSlI103O9Nz
 1WD2vwEb+9V3/QVksU/VolPW85BNA1LA9a2Uw7fsG5AuUbUXbcGo1olxT/5PNnZLivl8
 904Jn7qjpXNe2bp5I66t8AYrftZp/UzLLmfE6Jgb4G1vcUQV35Frgw6bdOD9xng9KfLn
 nQz2zqXGoxMLdBAVnn2TYTIpbxMZip0wNxJ4X96MO6Bz6+OtKpiW74ZBDkHL3m2mIpeq
 SSiAB2bMwkEQulgurrf2eRSqXK+7cdiNNhF4eDP48eX4PSkiydmU5rxIZBjOoNKU8f97
 n+9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIXTrhOTU9g7Ouw69oz3YBoHQfUfa2MI30K8ptjm7MkJlVZx5LG2DyevcPYTOolBihJqxJ7mQSAdM=@buildroot.org
X-Gm-Message-State: AOJu0YzmgDfp7lfG1v7RbVWCaVCyxeNulNMLOqPU1+EZcoHzsmNxJHJN
 cBYvssAQl0ToJS/iHRLlv/bJs3SJn/wEWZxHhRN1A8+ZS5QW/tejNotGZzekFrVPpoo3DVPX3mO
 9jHFu
X-Gm-Gg: AfdE7clf1Cr+X15BNq4mgvlBxCvYxhvfJkoEaI+HeZ5acWjCXRB3Ga2wjI4BFgWY5Te
 Dp0Mct2btCrCI4dyYmy3WT7XUInHtxfChEsTTK390VdD8HTRbdw33t3v94wnzP+jat2w6Sby9YC
 /Zs4QgpEdmN+T7gclzcLCL9mh0Iw/du8dGhFiz6JRLiW6BZf8Eg5Rrz8lpKLCmktagsuLXhX6mq
 MhoesxxuM9KpGjn+LTTFHUmXK/A0xTdpvXXqOeMgDqQmDISl9ROUjbMPSpNN6x7xrNr7sQnGW/L
 KGSu5r/sG4EBQtKZ3ljqqPiFJ5Rql4nhWU5rQfIjkcUEp8UOeiWCN7G+X9RbDNex/sfACQfMCta
 exFdo1N+0Fvc71FWb/mq2Y9bhF7XewKaUa8kivuYAT1WABzfv2hP9U/BQ6zsV/vLiupwBciM4qM
 KxR5Y+xOLG1DvNTGZz
X-Received: by 2002:a05:600c:82c3:b0:493:be13:98b with SMTP id
 5b1f17b1804b1-493e685f507mr108772405e9.23.1783691511967; 
 Fri, 10 Jul 2026 06:51:51 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2e77c2esm42880495e9.2.2026.07.10.06.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:51 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:50 +0200
Message-ID: <20260710135150.759569-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260627064155.1938273-2-bernd@kuhls.net>
References: <20260627064155.1938273-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691512; x=1784296312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IS5IQutSgYbzlz6pSR2YMP1Afk/W1i4DdatVtpoixPw=;
 b=XFqOBzyYSTHm/YCDvMf+pa8ajJroBckV/kHrPIhamgQEGDgw6mKvkKJdGz8XhykFfK
 wUEWVgHCwkptGJtoArJYpiBqfgIUJaYAWSuvNIOYflis1XMizBkaVbhdspuZPeN3Svb8
 jPj3TwTKA/3OXgMYBCv3eZJXSN2ZuI7R3KHhn3APh4kPInaB3mi6evj+091tBXjFHDdb
 B4QYNGA2+Oort5iT83ZFJp8kmhzzpHgfAYDF2StCg4qmxjv8xJpqjv1vBU+cVpRTViKW
 D2VZ6aMm19JjlVWDVYcxyJETM94y66h3dYVVBR/wHFFXj/bIEqM1WestBo2BPQXA9lTo
 Xcgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XFqOBzyY
Subject: Re: [Buildroot] [PATCH 2/2] package/gcc: bump 14.x series to 14.4.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Announcement:
> https://gcc.gnu.org/pipermail/gcc-announce/2026/000192.html
> 
> GCC 14.4 is a bug-fix release from the GCC 14 branch
> containing important fixes for regressions and serious bugs in
> GCC 14.3 with more than 104 bugs fixed since the previous release.
> 
> For the list of bugs fixed in this version, see:
> https://gcc.gnu.org/gcc-14/changes.html#14.4
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  .checkpackageignore                           |   2 +-
>  ...laze-add-atomic-test-and-set-support.patch | 286 ------------------
>  ...bsanitizer-Fix-build-with-glibc-2.42.patch |  81 -----
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 261 ----------------
>  ...am-and-memory-include-above-safe-cty.patch |  78 -----
>  ...le-split-stack-for-non-thread-builds.patch |   0
>  ...o-undef-_TIME_BITS-in-sanitizer_proc.patch |   0
>  package/gcc/Config.in.host                    |   2 +-
>  package/gcc/gcc.hash                          |   4 +-
>  9 files changed, 4 insertions(+), 710 deletions(-)
>  delete mode 100644 package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
>  delete mode 100644 package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
>  delete mode 100644 package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
>  delete mode 100644 package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
>  rename package/gcc/{14.3.0 => 14.4.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
>  rename package/gcc/{14.3.0 => 14.4.0}/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 3aed62277a..6147f35b03 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -349,7 +349,7 @@ package/fstrcmp/0001-disable-rpath.patch lib_patch.Upstream
>  package/ftop/0001-overflow.patch lib_patch.Upstream
>  package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
>  package/fxload/0001-fix-static-build.patch lib_patch.Upstream
> -package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
> +package/gcc/14.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/15.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
> diff --git a/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
> deleted file mode 100644
> index db6aefaef2..0000000000
> --- a/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
> +++ /dev/null
> @@ -1,286 +0,0 @@
> -From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
> -From: Gopi Kumar Bulusu <gopi@sankhya.com>
> -Date: Thu, 10 Jul 2025 12:44:44 +0530
> -Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
> -
> -Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
> -to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
> -added. As MicroBlaze has no QImode test/set instruction, use shift magic
> -to implement atomic_test_and_set. This fixes PR118280.
> -
> -Files Changed
> -
> -* gcc/config/microblaze/iterators.md: New
> -* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
> -* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
> -  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
> -  type: add atomic
> -* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
> -  atomic_test_and_set
> -
> -Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
> -Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
> -
> -Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
> -Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
> -Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
> ----
> - gcc/config/microblaze/iterators.md        |  25 +++++
> - gcc/config/microblaze/microblaze-protos.h |   1 +
> - gcc/config/microblaze/microblaze.cc       |  28 ++++++
> - gcc/config/microblaze/microblaze.h        |   2 +-
> - gcc/config/microblaze/microblaze.md       |   7 +-
> - gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
> - 6 files changed, 150 insertions(+), 20 deletions(-)
> - create mode 100644 gcc/config/microblaze/iterators.md
> -
> -diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
> -new file mode 100644
> -index 00000000000..2ffc2422a0a
> ---- /dev/null
> -+++ b/gcc/config/microblaze/iterators.md
> -@@ -0,0 +1,25 @@ 
> -+;; Iterator definitions for GCC MicroBlaze machine description files.
> -+;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
> -+;;
> -+;; This file is part of GCC.
> -+;;
> -+;; GCC is free software; you can redistribute it and/or modify
> -+;; it under the terms of the GNU General Public License as published by
> -+;; the Free Software Foundation; either version 3, or (at your option)
> -+;; any later version.
> -+;;
> -+;; GCC is distributed in the hope that it will be useful,
> -+;; but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+;; GNU General Public License for more details.
> -+;;
> -+;; You should have received a copy of the GNU General Public License
> -+;; along with GCC; see the file COPYING3.  If not see
> -+;; <http://www.gnu.org/licenses/>.
> -+
> -+; atomics code iterator
> -+(define_code_iterator any_atomic [plus ior xor and])
> -+
> -+; atomics code attribute
> -+(define_code_attr atomic_optab
> -+  [(plus "add") (ior "or") (xor "xor") (and "and")])
> -diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
> -index 90b79cfe716..1cee0b3096c 100644
> ---- a/gcc/config/microblaze/microblaze-protos.h
> -+++ b/gcc/config/microblaze/microblaze-protos.h
> -@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
> - extern int label_mentioned_p (rtx);
> - extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
> - extern void microblaze_eh_return (rtx op0);
> -+extern void microblaze_subword_address (rtx, rtx *, rtx *);
> - #endif  /* RTX_CODE */
> - 
> - /* Declare functions in microblaze-c.cc.  */
> -diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
> -index 2ab5ada4ec9..80d10ab60e0 100644
> ---- a/gcc/config/microblaze/microblaze.cc
> -+++ b/gcc/config/microblaze/microblaze.cc
> -@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
> -   return false;
> - }
> - 
> -+/* Compute memory address *aligned_mem and corresponding shift value (*shift)
> -+   from a QImode memory reference MEM */
> -+void
> -+microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
> -+{
> -+  /* Align the memory address to a word.  */
> -+  rtx addr = force_reg (Pmode, XEXP (mem, 0));
> -+
> -+  rtx addr_mask = gen_int_mode (-4, Pmode);
> -+
> -+  rtx aligned_addr = gen_reg_rtx (Pmode);
> -+
> -+  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
> -+
> -+  *aligned_mem = change_address (mem, SImode, aligned_addr);
> -+
> -+  /* Calculate the shift amount.  */
> -+  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
> -+
> -+  if (TARGET_LITTLE_ENDIAN == 0) {
> -+    emit_move_insn (*shift,
> -+		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
> -+  }
> -+
> -+  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
> -+					  gen_int_mode (3, SImode)));
> -+}
> -+
> - static bool
> - microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
> - 		      int opno ATTRIBUTE_UNUSED, int *total,
> -diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
> -index 2390542434b..b2e9ccde363 100644
> ---- a/gcc/config/microblaze/microblaze.h
> -+++ b/gcc/config/microblaze/microblaze.h
> -@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
> - 
> - /* Default target_flags if no switches are specified  */
> - #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
> --                             | TARGET_ENDIAN_DEFAULT)
> -+			      | TARGET_ENDIAN_DEFAULT)
> - 
> - /* Do we have CLZ?  */
> - #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
> -diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
> -index 45c48a71e8d..270df8da0c5 100644
> ---- a/gcc/config/microblaze/microblaze.md
> -+++ b/gcc/config/microblaze/microblaze.md
> -@@ -21,6 +21,7 @@ 
> - 
> - (include "constraints.md")
> - (include "predicates.md")
> -+(include "iterators.md")
> - 
> - ;;----------------------------------------------------
> - ;; Constants
> -@@ -43,6 +44,10 @@ 
> -   (UNSPEC_TLS           106)    ;; jump table
> -   (UNSPEC_SET_TEXT      107)    ;; set text start
> -   (UNSPEC_TEXT          108)    ;; data text relative
> -+  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
> -+  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
> -+  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
> -+  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
> - ])
> - 
> - (define_c_enum "unspec" [
> -@@ -79,7 +84,7 @@ 
> - ;; bshift 	Shift operations
> - 
> - (define_attr "type"
> --  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
> -+  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
> -   (const_string "unknown"))
> - 
> - ;; Main data type used by the insn
> -diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
> -index db7b11e5379..6478ab6dcac 100644
> ---- a/gcc/config/microblaze/sync.md
> -+++ b/gcc/config/microblaze/sync.md
> -@@ -18,26 +18,97 @@ 
> - ;; <http://www.gnu.org/licenses/>.
> - 
> - (define_insn "atomic_compare_and_swapsi"
> --  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
> --   (match_operand:SI 1 "register_operand" "=&d")	;; val output
> --   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
> --   (match_operand:SI 3 "register_operand" "d")		;; expected value
> --   (match_operand:SI 4 "register_operand" "d")		;; desired value
> --   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
> --   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
> --   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
> -+  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
> -+        (unspec_volatile:SI
> -+          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
> -+           (match_operand:SI 3 "register_operand" "d")		;; expected value
> -+           (match_operand:SI 4 "register_operand" "d")]		;; desired value
> -+          UNSPECV_CAS_BOOL))
> -+   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
> -+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
> -+   (set (match_dup 2)
> -+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
> -+   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
> -+   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
> -+   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
> -    (clobber (match_scratch:SI 8 "=&d"))]
> -   ""
> -   {
> --    output_asm_insn ("addc \tr0,r0,r0", operands);
> --    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
> --    output_asm_insn ("addic\t%8,r0,0", operands);
> --    output_asm_insn ("bnei \t%8,.-8", operands);
> --    output_asm_insn ("cmp  \t%0,%1,%3", operands);
> --    output_asm_insn ("bnei \t%0,.+16", operands);
> --    output_asm_insn ("swx  \t%4,%y2,r0", operands);
> --    output_asm_insn ("addic\t%8,r0,0", operands);
> --    output_asm_insn ("bnei \t%8,.-28", operands);
> --    return "";
> -+    return "add  \t%0,r0,r0\n\t"
> -+      "lwx  \t%1,%y2,r0\n\t"
> -+      "addic\t%8,r0,0\n\t"
> -+      "bnei \t%8,.-8\n\t"
> -+      "cmp  \t%8,%1,%3\n\t"
> -+      "bnei \t%8,.+20\n\t"
> -+      "swx  \t%4,%y2,r0\n\t"
> -+      "addic\t%8,r0,0\n\t"
> -+      "bnei \t%8,.-28\n\t"
> -+      "addi \t%0,r0,1";
> -   }
> -+  [(set_attr "type"	"atomic")
> -+  (set_attr "mode"	"SI")
> -+  (set_attr "length"	"40")]
> - )
> -+
> -+;;
> -+;;
> -+;;
> -+;;
> -+(define_insn "atomic_fetch_<atomic_optab>si"
> -+  [(set (match_operand:SI 0 "register_operand" "=&d")
> -+	(match_operand:SI 1 "memory_operand" "+Q"))
> -+   (set (match_dup 1)
> -+	(unspec_volatile:SI
> -+	  [(any_atomic:SI (match_dup 1)
> -+		   (match_operand:SI 2 "register_operand" "d"))
> -+	   (match_operand:SI 3 "const_int_operand")] ;; model
> -+	 UNSPECV_ATOMIC_FETCH_OP))
> -+   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
> -+  ""
> -+  {
> -+    return 
> -+      "lwx  \t%0,%y1,r0\n\t"
> -+      "addic\t%4,r0,0\n\t"
> -+      "bnei \t%4,.-8\n\t"
> -+      "<atomic_optab>\t%4,%0,%2\n\t"
> -+      "swx  \t%4,%y1,r0\n\t"
> -+      "addic\t%4,r0,0\n\t"
> -+      "bnei \t%4,.-24";
> -+  }
> -+  [(set_attr "type"	"atomic")
> -+  (set_attr "mode"	"SI")
> -+  (set_attr "length"	"28")])
> -+
> -+;;
> -+;; MicroBlaze only supports lx/sx instructions for word mode only
> -+;;
> -+;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
> -+;;
> -+(define_expand "atomic_test_and_set"
> -+  [(match_operand:QI 0 "register_operand" "")    ;; bool output
> -+   (match_operand:QI 1 "memory_operand" "m")    ;; memory
> -+   (match_operand:SI 2 "const_int_operand" "")]  ;; model
> -+  ""
> -+{
> -+  rtx old = gen_reg_rtx (SImode);
> -+  rtx mem = operands[1];
> -+  rtx model = operands[2];
> -+  rtx set = gen_reg_rtx (SImode);
> -+  rtx aligned_mem = gen_reg_rtx (SImode);
> -+  rtx shift = gen_reg_rtx (SImode);
> -+
> -+  microblaze_subword_address (mem, &aligned_mem, &shift);
> -+
> -+  emit_move_insn (set, GEN_INT (1));
> -+  rtx shifted_set = gen_reg_rtx (SImode);
> -+
> -+  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
> -+
> -+  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
> -+
> -+  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
> -+
> -+  emit_move_insn (operands[0], gen_lowpart (QImode, old));
> -+
> -+  DONE;
> -+})
> --- 
> -2.43.5
> -
> diff --git a/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
> deleted file mode 100644
> index 13f7f469c4..0000000000
> --- a/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
> -From: Florian Weimer <fweimer@redhat.com>
> -Date: Fri, 2 May 2025 17:41:43 +0200
> -Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
> -
> -The termio structure will be removed from glibc 2.42.  It has
> -been deprecated since the late 80s/early 90s.
> -
> -Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
> -("[sanitizer_common] Remove interceptors for deprecated struct termio
> -(#137403)").
> -
> -Co-Authored-By: Tom Stellard <tstellar@redhat.com>
> -
> -libsanitizer/
> -
> -	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
> -	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
> -	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> -	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> -
> -Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
> -Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
> - .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
> - .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
> - 3 files changed, 12 deletions(-)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -index 49ec4097c90..dda11daa77f 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
> -   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
> -   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
> -   _(TCFLSH, NONE, 0);
> --#if SANITIZER_GLIBC
> --  _(TCGETA, WRITE, struct_termio_sz);
> --#endif
> -   _(TCGETS, WRITE, struct_termios_sz);
> -   _(TCSBRK, NONE, 0);
> -   _(TCSBRKP, NONE, 0);
> --#if SANITIZER_GLIBC
> --  _(TCSETA, READ, struct_termio_sz);
> --  _(TCSETAF, READ, struct_termio_sz);
> --  _(TCSETAW, READ, struct_termio_sz);
> --#endif
> -   _(TCSETS, READ, struct_termios_sz);
> -   _(TCSETSF, READ, struct_termios_sz);
> -   _(TCSETSW, READ, struct_termios_sz);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -index c87d5ef42c9..7bbc6f2edac 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> -   unsigned struct_input_id_sz = sizeof(struct input_id);
> -   unsigned struct_mtpos_sz = sizeof(struct mtpos);
> -   unsigned struct_rtentry_sz = sizeof(struct rtentry);
> --#if SANITIZER_GLIBC || SANITIZER_ANDROID
> --  unsigned struct_termio_sz = sizeof(struct termio);
> --#endif
> -   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
> -   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
> -   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -index c07f7cd0b0d..a80df656826 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
> - extern unsigned struct_input_absinfo_sz;
> - extern unsigned struct_input_id_sz;
> - extern unsigned struct_mtpos_sz;
> --extern unsigned struct_termio_sz;
> - extern unsigned struct_vt_consize_sz;
> - extern unsigned struct_vt_sizes_sz;
> - extern unsigned struct_vt_stat_sz;
> --- 
> -2.50.1
> -
> diff --git a/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
> deleted file mode 100644
> index f9f983b464..0000000000
> --- a/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
> +++ /dev/null
> @@ -1,261 +0,0 @@
> -From daa3e1ead791bc58208043cfc4595ba1a78cdd34 Mon Sep 17 00:00:00 2001
> -From: Jakub Jelinek <jakub@redhat.com>
> -Date: Fri, 21 Nov 2025 16:25:58 +0100
> -Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> -
> -The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
> -and c++26.
> -
> -I see the u8 string literals are mixed e.g. with strerror, so in
> --fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
> -the u8 literals everywhere are worth it either.
> -
> -2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> -
> -	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
> -	char in argument type.
> -	(MessageBuffer::Space): Revert 2025-11-15 change.
> -	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
> -	with char8_t const * type of first argument.
> -	(Packet::Packet): Similarly for first argument.
> -	* client.cc (CommunicationError, Client::ProcessResponse,
> -	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> -	IncludeTranslateResponse): Cast u8 string literals to (const char *)
> -	where needed.
> -	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> -
> -(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> -Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> -Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=daa3e1ead791bc58208043cfc4595ba1a78cdd34
> ----
> - libcody/client.cc | 36 +++++++++++++++++++-----------------
> - libcody/cody.hh   | 22 ++++++++++++++++++++++
> - libcody/server.cc | 28 ++++++++++++++--------------
> - 3 files changed, 55 insertions(+), 31 deletions(-)
> -
> -diff --git a/libcody/client.cc b/libcody/client.cc
> -index ae69d190cb7..147fecdbe50 100644
> ---- a/libcody/client.cc
> -+++ b/libcody/client.cc
> -@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> - 
> - static Packet CommunicationError (int err)
> - {
> --  std::string e {u8"communication error:"};
> -+  std::string e {(const char *) u8"communication error:"};
> -   e.append (strerror (err));
> - 
> -   return Packet (Client::PC_ERROR, std::move (e));
> -@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
> -     {
> -       if (e == EINVAL)
> - 	{
> --	  std::string msg (u8"malformed string '");
> -+	  std::string msg ((const char *) u8"malformed string '");
> - 	  msg.append (words[0]);
> --	  msg.append (u8"'");
> -+	  msg.append ((const char *) u8"'");
> - 	  return Packet (Client::PC_ERROR, std::move (msg));
> - 	}
> -       else
> --	return Packet (Client::PC_ERROR, u8"missing response");
> -+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
> -     }
> - 
> -   Assert (!words.empty ());
> --  if (words[0] == u8"ERROR")
> -+  if (words[0] == (const char *) u8"ERROR")
> -     return Packet (Client::PC_ERROR,
> --		   words.size () == 2 ? words[1]: u8"malformed error response");
> -+		   words.size () == 2 ? words[1]
> -+		   : (const char *) u8"malformed error response");
> - 
> -   if (isLast && !read.IsAtEnd ())
> -     return Packet (Client::PC_ERROR,
> --		   std::string (u8"unexpected extra response"));
> -+		   std::string ((const char *) u8"unexpected extra response"));
> - 
> -   Assert (code < Detail::RC_HWM);
> -   Packet result (responseTable[code] (words));
> -   result.SetRequest (code);
> -   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
> -     {
> --      std::string msg {u8"malformed response '"};
> -+      std::string msg {(const char *) u8"malformed response '"};
> - 
> -       read.LexedLine (msg);
> --      msg.append (u8"'");
> -+      msg.append ((const char *) u8"'");
> -       result.GetString () = std::move (msg);
> -     }
> -   else if (result.GetCode () == Client::PC_CONNECT)
> -@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
> - 			  size_t alen, size_t ilen)
> - {
> -   write.BeginLine ();
> --  write.AppendWord (u8"HELLO");
> -+  write.AppendWord ((const char *) u8"HELLO");
> -   write.AppendInteger (Version);
> -   write.AppendWord (agent, true, alen);
> -   write.AppendWord (ident, true, ilen);
> -@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
> - // HELLO $version $agent [$flags]
> - Packet ConnectResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
> -+  if (words[0] == (const char *) u8"HELLO"
> -+      && (words.size () == 3 || words.size () == 4))
> -     {
> -       char *eptr;
> -       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
> -@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> - // PATHNAME $dir | ERROR
> - Packet PathnameResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] == u8"PATHNAME" && words.size () == 2)
> -+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
> -     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> - 
> -   return Packet (Client::PC_ERROR, u8"");
> -@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
> - // OK or ERROR
> - Packet OKResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] == u8"OK")
> -+  if (words[0] == (const char *) u8"OK")
> -     return Packet (Client::PC_OK);
> -   else
> -     return Packet (Client::PC_ERROR,
> -@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
> - // PATHNAME $cmifile
> - Packet IncludeTranslateResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] == u8"BOOL" && words.size () == 2)
> -+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
> -     {
> --      if (words[1] == u8"FALSE")
> --	return Packet (Client::PC_BOOL, 0);
> --      else if (words[1] == u8"TRUE")
> -+      if (words[1] == (const char *) u8"FALSE")
> -+	return Packet (Client::PC_BOOL);
> -+      else if (words[1] == (const char *) u8"TRUE")
> - 	return Packet (Client::PC_BOOL, 1);
> -       else
> - 	return Packet (Client::PC_ERROR, u8"");
> -diff --git a/libcody/cody.hh b/libcody/cody.hh
> -index 789ce9e70b7..93bce93aa94 100644
> ---- a/libcody/cody.hh
> -+++ b/libcody/cody.hh
> -@@ -47,12 +47,21 @@ namespace Detail  {
> - 
> - // C++11 doesn't have utf8 character literals :(
> - 
> -+#if __cpp_char8_t >= 201811
> -+template<unsigned I>
> -+constexpr char S2C (char8_t const (&s)[I])
> -+{
> -+  static_assert (I == 2, "only single octet strings may be converted");
> -+  return s[0];
> -+}
> -+#else
> - template<unsigned I>
> - constexpr char S2C (char const (&s)[I])
> - {
> -   static_assert (I == 2, "only single octet strings may be converted");
> -   return s[0];
> - }
> -+#endif
> - 
> - /// Internal buffering class.  Used to concatenate outgoing messages
> - /// and Lex incoming ones.
> -@@ -123,6 +132,13 @@ public:
> -       Space ();
> -     Append (str, maybe_quote, len);
> -   }
> -+#if __cpp_char8_t >= 201811
> -+  void AppendWord (char8_t const *str, bool maybe_quote = false,
> -+		   size_t len = ~size_t (0))
> -+  {
> -+    AppendWord ((const char *) str, maybe_quote, len);
> -+  }
> -+#endif
> -   /// Add a word as with AppendWord
> -   /// @param str the string to append
> -   /// @param maybe_quote string might need quoting, as for Append
> -@@ -264,6 +280,12 @@ public:
> -     : string (s), cat (STRING), code (c)
> -   {
> -   }
> -+#if __cpp_char8_t >= 201811
> -+  Packet (unsigned c, const char8_t *s)
> -+    : string ((const char *) s), cat (STRING), code (c)
> -+  {
> -+  }
> -+#endif
> -   Packet (unsigned c, std::vector<std::string> &&v)
> -     : vector (std::move (v)), cat (VECTOR), code (c)
> -   {
> -diff --git a/libcody/server.cc b/libcody/server.cc
> -index e2fa069bb93..c18469fae84 100644
> ---- a/libcody/server.cc
> -+++ b/libcody/server.cc
> -@@ -36,12 +36,12 @@ static RequestPair
> -   const requestTable[Detail::RC_HWM] =
> -   {
> -     // Same order as enum RequestCode
> --    RequestPair {u8"HELLO", nullptr},
> --    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> --    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> --    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> --    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> --    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> -+    RequestPair {(const char *) u8"HELLO", nullptr},
> -+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> -+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
> -+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
> -+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
> -+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> -   };
> - }
> - 
> -@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> - 	  std::string msg;
> - 
> - 	  if (err > 0)
> --	    msg = u8"error processing '";
> -+	    msg = (const char *) u8"error processing '";
> - 	  else if (ix >= Detail::RC_HWM)
> --	    msg = u8"unrecognized '";
> -+	    msg = (const char *) u8"unrecognized '";
> - 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
> --	    msg = u8"already connected '";
> -+	    msg = (const char *) u8"already connected '";
> - 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
> --	    msg = u8"not connected '";
> -+	    msg = (const char *) u8"not connected '";
> - 	  else
> --	    msg = u8"malformed '";
> -+	    msg = (const char *) u8"malformed '";
> - 
> - 	  read.LexedLine (msg);
> --	  msg.append (u8"'");
> -+	  msg.append ((const char *) u8"'");
> - 	  if (err > 0)
> - 	    {
> --	      msg.append (u8" ");
> -+	      msg.append ((const char *) u8" ");
> - 	      msg.append (strerror (err));
> - 	    }
> - 	  resolver->ErrorResponse (this, std::move (msg));
> -@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> -     return nullptr;
> - 
> -   if (words.size () == 3)
> --    words.emplace_back (u8"");
> -+    words.emplace_back ((const char *) u8"");
> -   unsigned version = ParseUnsigned (words[1]);
> -   if (version == ~0u)
> -     return nullptr;
> --- 
> -2.54.0
> -
> diff --git a/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> deleted file mode 100644
> index e48dd91c18..0000000000
> --- a/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 046776dac7cc74bdbab36f450af80644a045858a Mon Sep 17 00:00:00 2001
> -From: Andrew Pinski <quic_apinski@quicinc.com>
> -Date: Mon, 25 Nov 2024 14:03:27 -0800
> -Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
> - [PR124830]
> -
> -This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
> -the <memory> include to fix build issues with a C++20 host compiler.
> -
> -sstream in some versions of libstdc++ include locale which might not have been
> -included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
> -c++ header files needed to be included before hand as comment in system.h says:
> -/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
> -   poisoning the ctype macros through safe-ctype.h */
> -
> -I don't understand how it was working before when memory was included after
> -safe-ctype.h rather than before. But this makes sstream consistent with the
> -other C++ headers.
> -
> -gcc/ChangeLog:
> -
> -	PR target/117771
> -	PR c/124830
> -	* system.h: Move the include of sstream and memory above safe-ctype.h.
> -
> -Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
> -Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> -Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=046776dac7cc74bdbab36f450af80644a045858a
> ----
> - gcc/system.h | 21 +++++++++------------
> - 1 file changed, 9 insertions(+), 12 deletions(-)
> -
> -diff --git a/gcc/system.h b/gcc/system.h
> -index b18482c7190..da331f105ba 100644
> ---- a/gcc/system.h
> -+++ b/gcc/system.h
> -@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
> - #ifdef INCLUDE_FUNCTIONAL
> - # include <functional>
> - #endif
> -+#ifdef INCLUDE_SSTREAM
> -+# include <sstream>
> -+#endif
> -+/* Some of the headers included by <memory> can use "abort" within a
> -+   namespace, e.g. "_VSTD::abort();", which fails after we use the
> -+   preprocessor to redefine "abort" as "fancy_abort" below.  */
> -+#ifdef INCLUDE_MEMORY
> -+# include <memory>
> -+#endif
> - # include <cstring>
> - # include <initializer_list>
> - # include <new>
> -@@ -758,22 +767,10 @@ private:
> - #define LIKELY(x) (__builtin_expect ((x), 1))
> - #define UNLIKELY(x) (__builtin_expect ((x), 0))
> - 
> --/* Some of the headers included by <memory> can use "abort" within a
> --   namespace, e.g. "_VSTD::abort();", which fails after we use the
> --   preprocessor to redefine "abort" as "fancy_abort" below.  */
> --
> --#ifdef INCLUDE_MEMORY
> --# include <memory>
> --#endif
> --
> - #ifdef INCLUDE_MUTEX
> - # include <mutex>
> - #endif
> - 
> --#ifdef INCLUDE_SSTREAM
> --# include <sstream>
> --#endif
> --
> - #ifdef INCLUDE_MALLOC_H
> - #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
> - #include <malloc.h>
> --- 
> -2.54.0
> -
> diff --git a/package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/14.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> similarity index 100%
> rename from package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
> rename to package/gcc/14.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> diff --git a/package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/14.4.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> similarity index 100%
> rename from package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> rename to package/gcc/14.4.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 896bb3cfbb..e80c864cf1 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -68,7 +68,7 @@ config BR2_GCC_SUPPORTS_DLANG
>  config BR2_GCC_VERSION
>  	string
>  	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
> -	default "14.3.0"    if BR2_GCC_VERSION_14_X
> +	default "14.4.0"    if BR2_GCC_VERSION_14_X
>  	default "15.3.0"    if BR2_GCC_VERSION_15_X
>  	default "16.1.0"    if BR2_GCC_VERSION_16_X
>  	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 0890abc2ea..edd8ab7061 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -1,7 +1,7 @@
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
>  sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
> -sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.4.0/sha512.sum
> +sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
>  sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
