Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE45CC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AF240EAE;
	Fri, 14 Aug 2026 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRIv1mU5u1ON; Fri, 14 Aug 2026 14:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4A340EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717113;
	bh=4ioTlN+pFNrxTa/HsWPQ7q+PTBd3n11Cu8Ujd91F97s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=U3pN3znbER9ncrKrIvXNzD0qljI1FIhJ4ICQb+Qw732VGhkaqKT/LpkgqBw5Dk+3C
	 5jXUVD4E7rqcW/AgcZQa10I9YfoqQH+44CovFA1gjGGYpMYWz1qToE+DH/UAZ5RdzI
	 Y/6QvRgSg7OHdrW9egg1ualFmG1ixf/kisc1ZjYwWMqOnRecji+HSaZAtNcm5oZNat
	 H/nvVCYP5WC2JUioaZ26dQQSw4K3yK0kmIipjBVIk5FLb26rGaqQLRUXvIb2rm1LJJ
	 6UwpoSR4L5Y6JMDhMTWyROmIlpg40Bz9saDsUcVeKRuRO9sTg8KCKq84Xwz1C17z/M
	 vG6+i5MeO9jEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4A340EC9;
	Fri, 14 Aug 2026 14:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC28B23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2230812F4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4IRIp6pDYbJ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2BA3811B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2BA3811B6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2BA3811B6
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49557167508so10067205e9.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717109; x=1787321909;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0tMlIjSLhfLL7m40Q6u7pNPdANO0A+vxEWXXnj6qaE8=;
 b=VY8oy0FzTuFcjDPR6wJT6ZPIUlAEmxe2gXEbPrY082bi7SpbJDkQUO7xlDWOkYaWZl
 VmmPmd6Wn+rQEhAyVkEVwJNvGxE0EA3h0GbCWt+5VtlJSVZKcKaUdVFOdypkvhsZz3Jk
 uHI21elqPgfPRNpchZQm0NNlntH/3SK2KQ5wEm+6qiMCKK8Cpz/2n02497Wl167uZeqi
 PhvQp3TMZddrDjOq1hYqhWPrW+sTzZJYrGJTBBl89aeEhhC7ZVxgOGgd/RCPCmrUARyD
 Lsr3FTEc2jBxtJOpdka7/5Su7zqZmR/hQLLXiZLgFdI0cnGiDHLqxzcza2buEwGfDKhp
 q1mA==
X-Forwarded-Encrypted: i=1;
 AHgh+RolTKOxicZvC6VBRFUZya0V/SNl+rqwe7MfzLHTiCe9PfoNWNIwc3EQlPsgOP4cXfWEB6vxJO0DEm0=@buildroot.org
X-Gm-Message-State: AOJu0YyYeOusImtrCH3dc18oLpZijtHQH/4TmJew5T9gubXBu4kJ+XKD
 HBL/wse1jIaAb522tf/M7+3krDs00SdVth4X0l/+D0BDp7Ok8G00Rg2kydBl6PM3lLOiBSJSFQy
 uCX/Ug00=
X-Gm-Gg: AR+sD13Mr9uzKz/94Jj2fQUrhElzTjgfM/x/7lQtsul77X+JVqCJ7IQ4QH9EUZb8MnD
 Z47b6s/5m4NxLorLCJK4jfirjJBaRzPCH4sCdeuLGj0D5OtSiqNZvHVTwTre4R/5Gtar4N1XMVl
 Sdiu3io9GEWf+JnjBhb+1lXYioryTHQ4a0QoQF8BCGu5JkDkqk0SubdI8Ob47ZWc0uydeaQFR1K
 VZOKdENDwNLBXBMNPoPRpTl+pA44K3eVCKoa4XOesjCu42wjBVWlTxis7UYdZUqOdLrPMr803v8
 N+9Ao/e9Z0e/ocdn/ByJmOnH8VxEkktmDhWdd0xFZu63ti92ySVEmjUmPPg8yvDzUCJPjLXZmp4
 DrHMrQecdklKemyNlMxA4sHCAPNEWhFQDmJnTvj1a7/8hBs46mClxwhRVRFJ8xtMDn55Dda7kc0
 YxbJ37+Ku0+w79Cgm3DPR3dvRctuMuPhTY3mKKTWFbSm4voS61YJmEPsWK2Z8PC1VM7lDubSo//
 psjPue5uvQV0APsmmjztugPLePe5zhRx3oqHkWwXK0k5i2bKg==
X-Received: by 2002:a05:600c:8b84:b0:499:8a3a:fd3a with SMTP id
 5b1f17b1804b1-4998bf23303mr10549785e9.5.1786717108676; 
 Fri, 14 Aug 2026 07:18:28 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b438cesm54382185e9.3.2026.08.14.07.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:18:28 -0700 (PDT)
Message-ID: <9ee44147-978b-47c7-8f0c-dd31aff741f5@mind.be>
Date: Fri, 14 Aug 2026 16:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ancmjQOp42gd7zkv@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <ancmjQOp42gd7zkv@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.59
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/08/26 14:52, Waldemar Brodkorb wrote:
> Changes made in this release:
>
> Ben Wolsieffer (1):
>        nptl: fix getting main stack size on no-MMU
>
> Max Filippov (4):
>        stdio: fix %a formatting of inf and nan
>        stdio: fix radix point output for %a
>        stdio: output sign with NaNs
>        stdio: restrict first digit of %a output to 0 or 1
>
> Ramin Moussavi (19):
>        libintl.h: route stubs through format_arg inlines; fix gettext_noop
>        build: scope .NOTPARALLEL to locale targets only, restore parallel build
>        limits.h: define PAGE_SIZE/PAGESIZE like musl, fixing the gdb build
>        wait4: fall back to waitid(2) at runtime when wait4 returns ENOSYS
>        pagesize: restore PAGE_SHIFT fallback for binfmt_flat (no auxv)
>        buildsys: build locale headers in-tree, not via a recursive sub-make
>        extra/locale: skip locales the build host cannot provide
>        csky: fix struct semid_ds layout for TIME64
>        csky: make __kernel_uid_t/__kernel_gid_t 32-bit
>        hppa: fix inotify/signalfd/timerfd flag values
>        hppa: do not set IPC_64 for the SysV IPC *ctl commands
>        x86: fix struct semid_ds layout for TIME64
>        i386: add CFI to __libc_i386_syscall6 for cancellation unwinding
>        i386: do not set IPC_64 for the SysV IPC *ctl commands on 5.1+ kernels
>        buildsys: terminate .eh_frame in shared objects
>        m68k: make the __jmp_buf layout match what setjmp.S actually saves
>        inet: use the direct accept4 syscall when __NR_accept is missing
>        m68k: implement atomic operations with the CAS instruction
>        libc: fix struct shmid_ds layout for TIME64
>
> Waldemar Brodkorb (10):
>        netinet/in.h: sync with glibc
>        bits/fcntl-linux.h: sync with glibc
>        add copy_file_range syscall wrapper
>        sys/fanotify.h: drop include to fix c-sky compilation
>        adjtimex: fix for architectures lacking __NR_clock_adjtime, f.e. frv
>        sys/user.h: restore required macros
>        netinet/tcp.h: sync with glibc
>        loongarch: add basic static only support
>        riscv: setcontext: fix linking error
>        bump version for 1.0.59 release
>
> ramin (16):
>        ldso: harden _dl_tls_get_addr_soft against an unusable DTV
>        microblaze: implement atomic operations with lwx/swx
>        ldso: microblaze: add missing addend to R_MICROBLAZE_TLSDTPREL32
>        ldso: make the _dl_tls_get_addr_soft DTV check microblaze-specific
>        microblaze: fix struct semid_ds layout for TIME64
>        m68k: fix struct semid_ds layout for TIME64
>        mips: fix fallocate() 64-bit argument passing on n32
>        mips: fix mmap64() for large offsets on n32
>        mips: fix setjmp() on n32/n64 (.cpreturn, not .cprestore)
>        mips: always set IPC_64 for the SysV IPC *ctl commands
>        libc: fix struct msqid_ds layout for TIME64 on all common-header arches
>        linuxthreads: fix SIGSEGV in MIPS cancellable wrappers (waitpid, nanosleep)
>        ldso: serialize dl_iterate_phdr to fix concurrent unwind hang on SMP
>        nptl: cancel the current thread directly instead of via SIGCANCEL
>        mips: only n32/n64 always need IPC_64, not o32
>        m68k: use the kernel cmpxchg helper for atomics on ColdFire
>
> Patch 0001 is applied upstream and is removed here.
>
> Fixes:
>    - https://autobuild.buildroot.net/results/2bd/2bd73b0060cad4f44649ffe4ea60c4775160d86e
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
