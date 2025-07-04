Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6B5C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8FAA83DF8;
	Fri,  4 Jul 2025 06:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjru4VChGB1Z; Fri,  4 Jul 2025 06:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC9983EBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC9983EBA;
	Fri,  4 Jul 2025 06:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 193461EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1659083DF8
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpJJD_K8ztn6 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBB9283ACF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB9283ACF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB9283ACF
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so415753f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611720; x=1752216520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+aIVDn7SvejdGupQDqOnahLc0SjFCd/Ggi4DUYp31o=;
 b=idhMR3yqZ+0+6CKwK6v2DmbKCQkAlk4IRL1BrSCQ0hfQ4+HV2QAv6acRbstli/BeMr
 borUGNgRhDk3M3jYCImM88ewIzdEhwXTPVtzk98hhtPYnKIdt+gKtTl8yIQIMaMJUAli
 y7W+MOiYD7xCF81yLbygB9aLirl3Ma4MlIPc8Pn9DQYZ8NZBXBfzkdX+gnN6a9F+k+t/
 29lO8DPOMeO2EE76nCyatpqE+h8Hr62B2s42Ec+YIc29+q3X8QnM2ZUofZIXBWeeMWrP
 tfGqvomKS712Ye8jbMRWbEa56vIr7Xbsov86Zh7qVq3ydcj1dLhmuIGGRz7lHI8dTWEK
 QcWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP3WvhmurJM8e+OYgcPnb/qe3FcyKNxJ4P4TDPeuCjiM0YzqtGWk18iS1szz1IuyC98Z/lg0F+YRE=@buildroot.org
X-Gm-Message-State: AOJu0YwKigHRdwI7NeQmhV8YwLHv2NUFjet5JYCftk91WYn5nOItrQ1h
 Ed5abtSg2NGm+50h6q31yuRrSLiegT8vWwa/CktYFtcl+1DxEZ9+4jBRMVCGZUrg2/hj+i4y+C6
 HaJfp
X-Gm-Gg: ASbGncvYSZfR5/hVEaYPsMatYjoLSOVyknRkWz6SwAsATqiuYBMS+i4MhuwyrTcCg2Q
 k9MnJqFokOXal/vl58Ffd5fDFoznCqQmF3803X5PNQGyzXq9SJ8aK03I4tYUW6keNX3SmeznAMD
 34t4h3b2nWroc/uHKlTg1r04XGpHDWpQcOtkh/sFMsFi9/MZA3D9W60u1EHT++VDzIZ/iLoqqtN
 JS2siCApH6u5vOQp/NZP0apfsUErWJ+fxUEWLQewBKTHo1/X58UzjZJYisJYBJT5lAVI8fNpnay
 6VJGGrdde6JbT2qXWhZsc5QDAEiS3z1bxjn8uJk5gZpa6vmAXucpR1fzh1yuKYsvkNowy2lEZ01
 aeyyfVBDRQQ==
X-Google-Smtp-Source: AGHT+IGXd5D+HB2Cc7iLefUR1zp3KvYp8Ffsr3FDZi+y45TnuwUApMz5jTJfJea1oyhNmzaM1ypMIw==
X-Received: by 2002:a05:6000:25e6:b0:3a5:3930:f57 with SMTP id
 ffacd0b85a97d-3b497042d34mr720374f8f.51.1751611719904; 
 Thu, 03 Jul 2025 23:48:39 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bdf038sm46992165e9.27.2025.07.03.23.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:39 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:38 +0200
Message-ID: <20250704064838.4065936-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627151521.776955-1-titouan.christophe@mind.be>
References: <20250627151521.776955-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611720; x=1752216520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+aIVDn7SvejdGupQDqOnahLc0SjFCd/Ggi4DUYp31o=;
 b=ey1sLKuU2Ze5WnOWPC6Ixy5EWoAe7rwKx7MS/ssxAWZX+3B9meOudaM+qBTlMYm+s7
 2/kCWQroyMJft/+E2uZHlwscr8YjosTYnpDTgSGfIzPfCLXpgs6NC8fi6sNjL9yz4KZR
 XoSClCTjGtuAw8TDW0jlN1g0L5MusatALuU4AGMWVoQrAGS/0N8rgKHKEVt+Sa4Hm4Pf
 CAIgH24SNi0XyDTRwjIle/F2/zmC+FS9eMRkvJVjZue/KHu/eyqkiksvNjZ0vjDtyQhP
 k/bfKfYB6VVamMDtBrsczIuq18LCYT5xw2OP2cLVrQyrMkZ6OKbq8fHp6DzlohZAimSK
 f7cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ey1sLKuU
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

Applied to 2025.05.x. Thanks

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
