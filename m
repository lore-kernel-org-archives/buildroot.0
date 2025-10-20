Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E0CCD19F
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 16:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87DDF82297;
	Mon, 20 Oct 2025 16:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4CCXOT1bq-H; Mon, 20 Oct 2025 16:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86799822CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86799822CF;
	Mon, 20 Oct 2025 16:49:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FDFD9E
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA921822CF
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVJvC0PQymdU for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 16:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C8AA82297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8AA82297
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C8AA82297
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso847774566b.3
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760978959; x=1761583759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4rTtg3oSz/l3VKzEgXwBCngbnSArASSEOTzpCwHC9e4=;
 b=mOYT6uwjeg/h1jhuK7CpzHmGvZlNJyzD5qJm1U9AixFhEaWrAwvkvr5FzGgIyc1MdD
 Ep3G36yypDznHGcEMbodIab+al8rd7n9PpFPz1MHpXi2EUaYLPaOfNWsx00xAj6TIskT
 3xophxIX392G0fxf7NMgXmUZJkSlLEk3oU7gdpw9Y3P65kmIpw3unN718knYVyDYrPAJ
 WruL77LZwyHPqJSmMraxBcoyXhfvAsmx4MUZ1HR9UZfmha4NtVIPWNdXv79bPRy7oTOp
 JdTDeklZxjf3+6kJsxIbL46CmEg/nzEE+8xYyMF1CMy3MWHvkeau7jq2SSaw+Vgk5nO1
 LP/w==
X-Gm-Message-State: AOJu0YymyxDx88EkEKB+TBYHix9e0Wk6c/LNfy+pkft4bnZN8bw2GYRy
 yOr6oZ2gX5QC4G5b0jmvdmgoxUwULAj6YB6w/foBPseQSsP5tlfA0uCDBdaqZKAWTtYV9AoAF4L
 Pnub7
X-Gm-Gg: ASbGncsRmvybVeGSo+ItnKzdzUQdID6l9J/KBeWnZ1O248BUpyTd6RXMcAU/lyHRJd5
 uQ4KWzpTMYAa9irrqQ2Cv382lPPPERajAFuBiJMNeZ5KKlvEcWVV9+2ADaQ6HSw0luEkPEw23dZ
 8JDi5OX2AQOi1kblFdtboVyEgE6yoTF4YQOi3omoIcoilb+g//GhZBVI5X/u+BJVx8mhqeVshbD
 WAmCJfEHkV+EHLhIlXyGlvbRV1DuC6eLXHXa44dKH4qp/fTcP8vBuOBKVSC19aIIqDIXZitguD0
 YRd6vNXBAOCHbFXCqk2vxAh5bkKM7uOF9p1m+qoNlU8shZuh2XIbfhwv7PjtE+enZvM7B9SEIzX
 6zy2gHZe2M18t0j9rDYqqiLO1DZdJ+geQnOa9+XvKQGEtvkdmcmT9NE4gxFU2xMiFn9cTA2+LZC
 gL/wikagV49MXw3KFwuf3E1Ds5O0eGbQ3aBYuztkBKCColfl+iZw==
X-Google-Smtp-Source: AGHT+IEdOnOMcNSjLPvFUzyLGtXOtrtlldtItr47rndjZeqtOOy87r4MwPJiPONiaFU3uzPcjuAwnQ==
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id
 a640c23a62f3a-b6471d48347mr1657789666b.13.1760978959183; 
 Mon, 20 Oct 2025 09:49:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.40.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb526098sm824020566b.62.2025.10.20.09.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 09:49:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Oct 2025 18:49:10 +0200
Message-ID: <20251020164911.1712014-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760978959; x=1761583759;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4rTtg3oSz/l3VKzEgXwBCngbnSArASSEOTzpCwHC9e4=;
 b=ix5BpHMgEnt/72iudIpGYN2whd7zSuclM7WzdAzrYfundePDSy6JaCZwkrGOAGc8MT
 leqJHASf03CLx4YyXnkN437oAIPoy1WsqoJbt7jP/1PXbd5k9fDH1VdtlllDVgdrseWV
 g4Xzqfx6jY0bltyE6D5ANsjh8nq3h2731tse0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ix5BpHMg
Subject: [Buildroot] [PATCH 1/2] package/libbpf: security bump to version
 1.6.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The removed patch has been merged in version 1.6.0 fixing
the security CVE-2025-29481.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-29481

Release notes:
https://github.com/libbpf/libbpf/releases/tag/v1.5.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...er-overflow-in-bpf_object__init_prog.patch | 103 ------------------
 package/libbpf/libbpf.hash                    |   2 +-
 package/libbpf/libbpf.mk                      |   5 +-
 3 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch

diff --git a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
deleted file mode 100644
index 2806ff220d7e..000000000000
--- a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
-From: Viktor Malik <vmalik@redhat.com>
-Date: Tue, 15 Apr 2025 17:50:14 +0200
-Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
-
-Upstream: https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800
-
-CVE: CVE-2025-29481
-
-As shown in [1], it is possible to corrupt a BPF ELF file such that
-arbitrary BPF instructions are loaded by libbpf. This can be done by
-setting a symbol (BPF program) section offset to a large (unsigned)
-number such that <section start + symbol offset> overflows and points
-before the section data in the memory.
-
-Consider the situation below where:
-- prog_start = sec_start + symbol_offset    <-- size_t overflow here
-- prog_end   = prog_start + prog_size
-
-    prog_start        sec_start        prog_end        sec_end
-        |                |                 |              |
-        v                v                 v              v
-    .....................|################################|............
-
-The report in [1] also provides a corrupted BPF ELF which can be used as
-a reproducer:
-
-    $ readelf -S crash
-    Section Headers:
-      [Nr] Name              Type             Address           Offset
-           Size              EntSize          Flags  Link  Info  Align
-    ...
-      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
-           0000000000000068  0000000000000000  AX       0     0     8
-
-    $ readelf -s crash
-    Symbol table '.symtab' contains 8 entries:
-       Num:    Value          Size Type    Bind   Vis      Ndx Name
-    ...
-         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
-
-Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
-point before the actual memory where section 2 is allocated.
-
-This is also reported by AddressSanitizer:
-
-    =================================================================
-    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
-    READ of size 104 at 0x7c7302fe0000 thread T0
-        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
-        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
-        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
-        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
-        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
-        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
-        #6 0x000000400c16 in main /poc/poc.c:8
-        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
-        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
-        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
-
-    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
-    allocated by thread T0 here:
-        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
-        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
-        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
-        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
-
-The problem here is that currently, libbpf only checks that the program
-end is within the section bounds. There used to be a check
-`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
-removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
-sections to support overriden weak functions").
-
-Add a check for detecting the overflow of `sec_off + prog_sz` to
-bpf_object__init_prog to fix this issue.
-
-[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-
-Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
-Reported-by: lmarch2 <2524158037@qq.com>
-Signed-off-by: Viktor Malik <vmalik@redhat.com>
-Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
-Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
-Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/libbpf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libbpf.c b/src/libbpf.c
-index b2591f5ca..56250b5ac 100644
---- a/src/libbpf.c
-+++ b/src/libbpf.c
-@@ -896,7 +896,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
- 			return -LIBBPF_ERRNO__FORMAT;
- 		}
- 
--		if (sec_off + prog_sz > sec_sz) {
-+		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
- 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
- 				sec_name, sec_off);
- 			return -LIBBPF_ERRNO__FORMAT;
diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index f5ecc59cd8d8..809d6934ebc4 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  53492aff6dd47e4da04ef5e672d753b9743848bdb38e9d90eafbe190b7983c44  libbpf-1.5.0.tar.gz
+sha256  d360ed1541fa4fc036132e7732fdf1e4569c187d3e4a4ddc07fd9dbfd121c4eb  libbpf-1.6.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 7c8cfbee85c0..f5154813e6e0 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.5.0
+LIBBPF_VERSION = 1.6.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
@@ -13,9 +13,6 @@ LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
 LIBBPF_INSTALL_STAGING = YES
 
-# 0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
-LIBBPF_IGNORE_CVES += CVE-2025-29481
-
 define LIBBPF_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
