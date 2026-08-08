Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706DEC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F136068F;
	Sat,  8 Aug 2026 15:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3WNbiuc6al8; Sat,  8 Aug 2026 15:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C1076062A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786201619;
	bh=6NE1RLyI/mFHIxHIMriVL8OVpiI/DFZlbz/DdPNOZv4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ON1x0PZXd44wSA5g5AExvH2q4kGRMtKxR12nn4roh8l7yS3TWW+a1iINTD6pQnPim
	 0ParFQJ1KrqijWwVJSlqaGEW065SAJCRffR3aAEwIzaLR5d1MKgAr42eLDoXJV55+X
	 Vw6T+ecNSc0IAWPTIS1gcDC/AMU7OBdYCDKSh18/auScD+ALskMqGXK8xGH7XqQOc6
	 6wW/s4lvQF0sM59hNXPGjikX5KxrM0k6nKbn97IdzvLorCMIS2R93C4gQ/6OPAiwXS
	 obJYOA83hxsrjMMP45if8X/Nlrz76f4USKCUn6yAKWJ7bAdz00ydS+pBFlLiyhee1c
	 Kg6NiAxKxzQHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C1076062A;
	Sat,  8 Aug 2026 15:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCDB8144
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AED63405D0
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KWYQ_iuBB81 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:06:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF1B2405D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1B2405D2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF1B2405D2
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:06:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4B55119F732;
 Sat,  8 Aug 2026 17:06:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 17:06:52 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 17:06:52 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <ancmjQOp42gd7zkv@waldemar-brodkorb.de>
References: <ancmjQOp42gd7zkv@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <c38d5f060d3ca461c9e1bb38e970d328@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786201613;
 bh=dYifTQK6t7PaT9ut9Uzwqz0pL6XqOMHE3YPVCCZrZD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tgCSk6gzAy6TC4LxuV6LdTL3itL1LsY150Qi1hzCtzhtVn7KPQaEfkJtkAsfKQk5r
 VoTAUNK1R3TSUW9YkjFqqUTnceSRZh2cIcxLugWuYmN9UPwn66nmpiwXFAOf9Jq+X1
 CqtlUWStU9q3UVnRr0wKWdf8ujfEGrX0mjEa0CrVNtF3hiv6TS5zE5NWUPLly4bBG2
 iyqhcQAoX9MKqfL1XMxSC7Xch+ok1tdg4XIbi3+CtRRFQzvili+rJVvFAyMYiDtJO7
 /dY4lKcinSrfky/EnEeFaPiL9/6IK419vlzcyji5+kmBvuESl2MqGlVLD3bKZrSEo7
 2FYjlSC1KupLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tgCSk6gz
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2026 14:52, Waldemar Brodkorb wrote:
> Changes made in this release:
> 
> Ben Wolsieffer (1):
>       nptl: fix getting main stack size on no-MMU
> 
> Max Filippov (4):
>       stdio: fix %a formatting of inf and nan
>       stdio: fix radix point output for %a
>       stdio: output sign with NaNs
>       stdio: restrict first digit of %a output to 0 or 1
> 
> Ramin Moussavi (19):
>       libintl.h: route stubs through format_arg inlines; fix 
> gettext_noop
>       build: scope .NOTPARALLEL to locale targets only, restore 
> parallel build
>       limits.h: define PAGE_SIZE/PAGESIZE like musl, fixing the gdb 
> build
>       wait4: fall back to waitid(2) at runtime when wait4 returns 
> ENOSYS
>       pagesize: restore PAGE_SHIFT fallback for binfmt_flat (no auxv)
>       buildsys: build locale headers in-tree, not via a recursive 
> sub-make
>       extra/locale: skip locales the build host cannot provide
>       csky: fix struct semid_ds layout for TIME64
>       csky: make __kernel_uid_t/__kernel_gid_t 32-bit
>       hppa: fix inotify/signalfd/timerfd flag values
>       hppa: do not set IPC_64 for the SysV IPC *ctl commands
>       x86: fix struct semid_ds layout for TIME64
>       i386: add CFI to __libc_i386_syscall6 for cancellation unwinding
>       i386: do not set IPC_64 for the SysV IPC *ctl commands on 5.1+ 
> kernels
>       buildsys: terminate .eh_frame in shared objects
>       m68k: make the __jmp_buf layout match what setjmp.S actually 
> saves
>       inet: use the direct accept4 syscall when __NR_accept is missing
>       m68k: implement atomic operations with the CAS instruction
>       libc: fix struct shmid_ds layout for TIME64
> 
> Waldemar Brodkorb (10):
>       netinet/in.h: sync with glibc
>       bits/fcntl-linux.h: sync with glibc
>       add copy_file_range syscall wrapper
>       sys/fanotify.h: drop include to fix c-sky compilation
>       adjtimex: fix for architectures lacking __NR_clock_adjtime, f.e. 
> frv
>       sys/user.h: restore required macros
>       netinet/tcp.h: sync with glibc
>       loongarch: add basic static only support
>       riscv: setcontext: fix linking error
>       bump version for 1.0.59 release
> 
> ramin (16):
>       ldso: harden _dl_tls_get_addr_soft against an unusable DTV
>       microblaze: implement atomic operations with lwx/swx
>       ldso: microblaze: add missing addend to R_MICROBLAZE_TLSDTPREL32
>       ldso: make the _dl_tls_get_addr_soft DTV check 
> microblaze-specific
>       microblaze: fix struct semid_ds layout for TIME64
>       m68k: fix struct semid_ds layout for TIME64
>       mips: fix fallocate() 64-bit argument passing on n32
>       mips: fix mmap64() for large offsets on n32
>       mips: fix setjmp() on n32/n64 (.cpreturn, not .cprestore)
>       mips: always set IPC_64 for the SysV IPC *ctl commands
>       libc: fix struct msqid_ds layout for TIME64 on all common-header 
> arches
>       linuxthreads: fix SIGSEGV in MIPS cancellable wrappers (waitpid, 
> nanosleep)
>       ldso: serialize dl_iterate_phdr to fix concurrent unwind hang on 
> SMP
>       nptl: cancel the current thread directly instead of via SIGCANCEL
>       mips: only n32/n64 always need IPC_64, not o32
>       m68k: use the kernel cmpxchg helper for atomics on ColdFire
> 
> Patch 0001 is applied upstream and is removed here.
> 
> Fixes:
>   - 
> https://autobuild.buildroot.net/results/2bd/2bd73b0060cad4f44649ffe4ea60c4775160d86e
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
