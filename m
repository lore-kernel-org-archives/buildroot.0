Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97862C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7048483E18;
	Fri,  4 Jul 2025 06:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSplP43cJrBC; Fri,  4 Jul 2025 06:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AEF83E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AEF83E07;
	Fri,  4 Jul 2025 06:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D5BB7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B06240FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mauUrGd4t6Ax for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31A3740F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A3740F8C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31A3740F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-453066fad06so3767965e9.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611627; x=1752216427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeqoZQAPPpqDSXQS5imCKbeIjomE5elkBlbUWnviBto=;
 b=eqveULbFQn++Q9acsQCYpFzkxLVR5yeKX8H3PPSe7HSQRzznVDAUGh02iU9gzCEMVA
 GrWF/EuzxxQJQFQ1rA44t8IZHTRVEAPLjHaroPzAGU4ZCvfr9pWfWDQx/ZpsWzCWKlja
 x1yu9139UlVLM72mOzf6zhPJvLwij1cuUWSxJtOO4QDTlBRxaAYgpvxIbm10GLdE4iDk
 SEQXntUgSiY+8kkWoAdkTTRZLXpaRPradSeuScvfU1jdyL6tQe/LZ7//6bn0UO+M4efv
 hHUOiF/rHJH02jynRLxDjNzpbKAbyGa7ihH2ynwAUSyz9Aaiphpqau433Go+yYfCIDhS
 e4rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA7+yhiTzoklgCne6PLk7YgEdbxx4ramfDQuKoDvtfMDSxN0i7g9o6F8OLqhWL86H1gdyJSMZoUG4=@buildroot.org
X-Gm-Message-State: AOJu0Yxhx2GYucobXkbpTUPvgAhhLBnMW623tr43q/35VcqAOOiEop8I
 pDZbe8azIECyABwqvDlFujk/M+RkcOHc2BeLfKiMm0MtTIX9LwKY+wWHcW7IZ9t72c9VNR/E7aE
 uRB+F
X-Gm-Gg: ASbGncsX69lqdf7GTtg5Fbk5icOj+BUuGmwP/ooNZPDi2C7afm5kS4avdp7THcfpq9Y
 BauqBuJdSRaq/fx9uUZS78UYTcpCxR1MxxeOBo0Qs2tDwALuvlJfoGGLuSsZ0KzFHV4WsQgEw+0
 ZA2SkthPP4sSQUkiL/DUtSXB5DVFYGtnRTJuka9B1fLvwzACW4kAykw/sF+pkcK5gTEfyJpj6qs
 GT7HfSMErC/euab7HHHUVWf1HZjY7rJEfj9oZgFyGx/9oWddzP2ihJD8odssxMsuQ7FvXNPdbUR
 vTWiirCqUSb+rmnXp06ED1qXNzRMTxBNlYNydYpfhx3wlQKST11Pg9gpd3aBHcamUcLm3jkBWbX
 Z0ex9l9LZhw==
X-Google-Smtp-Source: AGHT+IEgr4oEKWbtRPUR9diNeAczdXeqbjf+Evl9vEQ15BdsvmFFz5CkXzFn/cPxXzx6W4K3cqaZIg==
X-Received: by 2002:a05:6000:41eb:b0:3b3:a6c2:1a10 with SMTP id
 ffacd0b85a97d-3b4964eb8c5mr1007964f8f.12.1751611627061; 
 Thu, 03 Jul 2025 23:47:07 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b4eb4abasm6529125e9.40.2025.07.03.23.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:06 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:05 +0200
Message-ID: <20250704064705.4064566-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627151521.776955-1-titouan.christophe@mind.be>
References: <20250627151521.776955-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611627; x=1752216427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeqoZQAPPpqDSXQS5imCKbeIjomE5elkBlbUWnviBto=;
 b=JwtOKDHIVohkTq2UUa7PKzckXMaD13BWlRL1Kb/VbD5ZtPfZUQ/DcZbI9NYQdk1T03
 Hgwwrnwe/Jy4lDggJPjGd1pXwRKdzT+B9ca/lILnqZbXWdI0MVLCL/QJk0A6jnxwODaS
 Zldwr32gXJ90p7LysZuqJzKpADxr/3zQWyBbNkemD0JgQntOr2osLrn3zKyqQ6sMPvIb
 TBYgNt3tHwi0OHHWlNkg2EGnlFgllSqgbnooYsaUrLkBgJJEHKJUKsDYRpOzEVRzaAJj
 c4ZSgajWxOdQjGcRIIrkI5AEMuO6giPhhxq2IpR8c1kOB59+Lh+PB1zusc2pgaviYclZ
 2Cfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JwtOKDHI
Subject: Re: [Buildroot] [PATCH] package/libbpf: add patch for CVE-2025-29481
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
> This fixes the following CVE:
> 
> - CVE-2025-29481:
>     Buffer Overflow vulnerability in libbpf 1.5.0 allows a local attacker to
>     execute arbitrary code via the bpf_object__init_prog` function of libbpf.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...er-overflow-in-bpf_object__init_prog.patch | 103 ++++++++++++++++++
>  package/libbpf/libbpf.mk                      |   3 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
> 
> diff --git a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
> new file mode 100644
> index 0000000000..2806ff220d
> --- /dev/null
> +++ b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
> @@ -0,0 +1,103 @@
> +From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
> +From: Viktor Malik <vmalik@redhat.com>
> +Date: Tue, 15 Apr 2025 17:50:14 +0200
> +Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
> +
> +Upstream: https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800
> +
> +CVE: CVE-2025-29481
> +
> +As shown in [1], it is possible to corrupt a BPF ELF file such that
> +arbitrary BPF instructions are loaded by libbpf. This can be done by
> +setting a symbol (BPF program) section offset to a large (unsigned)
> +number such that <section start + symbol offset> overflows and points
> +before the section data in the memory.
> +
> +Consider the situation below where:
> +- prog_start = sec_start + symbol_offset    <-- size_t overflow here
> +- prog_end   = prog_start + prog_size
> +
> +    prog_start        sec_start        prog_end        sec_end
> +        |                |                 |              |
> +        v                v                 v              v
> +    .....................|################################|............
> +
> +The report in [1] also provides a corrupted BPF ELF which can be used as
> +a reproducer:
> +
> +    $ readelf -S crash
> +    Section Headers:
> +      [Nr] Name              Type             Address           Offset
> +           Size              EntSize          Flags  Link  Info  Align
> +    ...
> +      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
> +           0000000000000068  0000000000000000  AX       0     0     8
> +
> +    $ readelf -s crash
> +    Symbol table '.symtab' contains 8 entries:
> +       Num:    Value          Size Type    Bind   Vis      Ndx Name
> +    ...
> +         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
> +
> +Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
> +point before the actual memory where section 2 is allocated.
> +
> +This is also reported by AddressSanitizer:
> +
> +    =================================================================
> +    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
> +    READ of size 104 at 0x7c7302fe0000 thread T0
> +        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
> +        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
> +        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
> +        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
> +        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
> +        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
> +        #6 0x000000400c16 in main /poc/poc.c:8
> +        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
> +        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
> +        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
> +
> +    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
> +    allocated by thread T0 here:
> +        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
> +        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
> +        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
> +        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
> +
> +The problem here is that currently, libbpf only checks that the program
> +end is within the section bounds. There used to be a check
> +`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
> +removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
> +sections to support overriden weak functions").
> +
> +Add a check for detecting the overflow of `sec_off + prog_sz` to
> +bpf_object__init_prog to fix this issue.
> +
> +[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
> +
> +Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
> +Reported-by: lmarch2 <2524158037@qq.com>
> +Signed-off-by: Viktor Malik <vmalik@redhat.com>
> +Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
> +Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> +Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
> +Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/libbpf.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/libbpf.c b/src/libbpf.c
> +index b2591f5ca..56250b5ac 100644
> +--- a/src/libbpf.c
> ++++ b/src/libbpf.c
> +@@ -896,7 +896,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
> + 			return -LIBBPF_ERRNO__FORMAT;
> + 		}
> + 
> +-		if (sec_off + prog_sz > sec_sz) {
> ++		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
> + 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
> + 				sec_name, sec_off);
> + 			return -LIBBPF_ERRNO__FORMAT;
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 7fa541ad24..7c8cfbee85 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -13,6 +13,9 @@ LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
>  HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
>  LIBBPF_INSTALL_STAGING = YES
>  
> +# 0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
> +LIBBPF_IGNORE_CVES += CVE-2025-29481
> +
>  define LIBBPF_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>  		-C $(@D)/src
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
