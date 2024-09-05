Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F98CD5BA6
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 10:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C89805BD;
	Thu,  5 Sep 2024 10:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mEKg4EBBFqA; Thu,  5 Sep 2024 10:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F6D8054F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F6D8054F;
	Thu,  5 Sep 2024 10:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD971BF3F6
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 10:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C97B40613
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 10:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHGzUuX2kxG1 for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 10:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A019D40606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A019D40606
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A019D40606
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 10:39:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7E1473536D02; Thu,  5 Sep 2024 12:39:25 +0200 (CEST)
Date: Thu, 5 Sep 2024 12:39:25 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtmKXQ/HiwslHFOR@waldemar-brodkorb.de>
References: <20240902175956.2837858-1-Mr.Bossman075@gmail.com>
 <20240903205526.1d30e17b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903205526.1d30e17b@windsurf>
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1725532765; bh=+fZJmqG5IjsT013MdfB/xVciIDa3cewZeV4OR5qCjuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUft1ZAP6ZfsFn6yyD93mEv5YVTX+CMfFXApVxpC5jd7W62qcMJRQVCHXlwaViVA6
 nuwhNKhA3prErXMevMX2ruWQsma3PJiq+fOLr3VrmGZG2luCca3jC0zebEDN3hacld
 A/h9ybr5vVPpWdAzeUWqQVajTgmHSrzIcfbIFE7QFUPx/lsCV6QfyUMVWfz6ztNjZm
 rJzpU8fkMKtdiuysSZlkRfzDYkEDpPxD+MISHrEUh69QaN5NqG6G3K7eq5iUyZtl27
 WS5Gnb+d0xwEO2ex9LW+4VRGDADO8bd+mYsbsHjl/xyR28NdrgFRVW0ROQg82hsIQl
 hggqAWrQ6JE8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=iUft1ZAP
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix build when RVA is
 disabled
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
Cc: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> +Waldemar in Cc, uclibc stuff :-)
> 
> On Mon,  2 Sep 2024 13:59:56 -0400
> Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
> > If the RVA option is disabled uclibc won't build with Shared libraries
> > enabled or Threads enabled. Add guards against this.
> 
> Meh, this looks weird to me, and I'd like some better understanding
> before adding "random" guards.
> 
> > When the RVA option is disabled, the build fails with the
> > following errors:
> > With Threads enabled:
> > 
> >   LD libuClibc-1.0.48.so
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L0 ':
> > err.c:(.text+0xa0): undefined reference to `__atomic_compare_exchange_4'
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L6':
> > err.c:(.text+0x138): undefined reference to `__atomic_exchange_4'
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
> > __cxa_finalize.c:(.text+0xac): undefined reference to `__atomic_compare_exchange_8'
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(fork.oS): in function `.L23':
> > fork.c:(.text+0x130): undefined reference to `__atomic_fetch_add_4'
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(sem_timedwait.oS): in function `.L5':
> > sem_timedwait.c:(.text+0xe0): undefined reference to `__atomic_fetch_add_8'
> > 
> > With Shared libraries enabled:
> > 
> >   LD libuClibc-1.0.48.so
> > riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
> > __cxa_finalize.c:(.text+0xa4): undefined reference to `__atomic_compare_exchange_8'
> > 
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > ---
> >  arch/Config.in           | 2 +-
> >  package/uclibc/Config.in | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/Config.in b/arch/Config.in
> > index f39c33ef7f..d0052782be 100644
> > --- a/arch/Config.in
> > +++ b/arch/Config.in
> > @@ -431,7 +431,7 @@ choice
> >  config BR2_BINFMT_ELF
> >  	bool "ELF"
> >  	depends on BR2_USE_MMU
> > -	select BR2_BINFMT_SUPPORTS_SHARED
> > +	select BR2_BINFMT_SUPPORTS_SHARED if !BR2_riscv || BR2_RISCV_ISA_RVA
> 
> Why this? This is no covered in your commit log.
> 
> >  	help
> >  	  ELF (Executable and Linkable Format) is a format for libraries
> >  	  and executables used across different architectures and
> > diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> > index 73ddd5ef58..f7edd417c6 100644
> > --- a/package/uclibc/Config.in
> > +++ b/package/uclibc/Config.in
> > @@ -78,13 +78,13 @@ choice
> >  
> >  config BR2_PTHREADS_NATIVE
> >  	bool "Native POSIX Threading (NPTL)"
> > -	depends on BR2_USE_MMU
> > +	depends on BR2_USE_MMU && (!BR2_riscv || BR2_RISCV_ISA_RVA)
> >  	select BR2_TOOLCHAIN_HAS_THREADS
> >  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >  
> >  config BR2_PTHREADS
> >  	bool "linuxthreads"
> > -	depends on !BR2_aarch64 && !BR2_aarch64_be
> > +	depends on !BR2_aarch64 && !BR2_aarch64_be && (!BR2_riscv || BR2_RISCV_ISA_RVA)
> >  	select BR2_TOOLCHAIN_HAS_THREADS
> 
> I would really like to hear back from Waldemar on this.
> 
> uClibc supports architectures that don't have atomic support (such as
> ARC750/ARC770), so it is somewhat surprising that it wouldn't support
> RISC-V without atomics. So let's try to understand the real problem and
> find the correct solution rather than papering over the problem in a
> very custom/architecture-specific way.

It seems indeed that uClibc-ng depends on RV-A extension. Gcc emits
the calls to some atomic functions when RV-A is disabled in the
compiler. It is not uClibc-ng itself. We don't use atomic functions.
I haven't found a way to disable this behaviour in GCC.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
