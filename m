Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D653FCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E053404C8;
	Tue,  3 Sep 2024 18:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Irsz6YbGxXmh; Tue,  3 Sep 2024 18:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F5DE40A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5DE40A02;
	Tue,  3 Sep 2024 18:55:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECAB81BF319
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90BB402C4
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x79gV-U3RfqE for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18B8D402C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B8D402C0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B8D402C0
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:55:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24902C0002;
 Tue,  3 Sep 2024 18:55:27 +0000 (UTC)
Date: Tue, 3 Sep 2024 20:55:26 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20240903205526.1d30e17b@windsurf>
In-Reply-To: <20240902175956.2837858-1-Mr.Bossman075@gmail.com>
References: <20240902175956.2837858-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725389727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee+Et8WRJ6f28BPdYRE9Kd+y5NJCOjF/xFrlIx6p960=;
 b=g6k3BjA6KpToh+0/WTCthjU/BZcJ6BaZEM5kfIM1IW49XEPpf/8wkszHtWkptEdBBovtv1
 O675ObtXrYzf8v0UShceioawypy4w/0UNF3OnlXT27z/pcng2EXudMD1jaIqHJc9XmH5cy
 dnGCsIVFbpLjL+DGgIFgi1ssrzamkPeDgc+WrieigfaFDWccSkVI9H6B0oM/gMRP4YGd5R
 F0c0Effy4oOc8QKnILoWQYX7bd24Qjw0InAXHpBmWuZdQqhTY1hT+uinAramkhtIrrjtsK
 0eYoClXO1SKMN3zctn24cRVAQHB9aAV2vkjsKkKVTHRWa51wst0/W/z/C89P+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g6k3BjA6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Waldemar in Cc, uclibc stuff :-)

On Mon,  2 Sep 2024 13:59:56 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> If the RVA option is disabled uclibc won't build with Shared libraries
> enabled or Threads enabled. Add guards against this.

Meh, this looks weird to me, and I'd like some better understanding
before adding "random" guards.

> When the RVA option is disabled, the build fails with the
> following errors:
> With Threads enabled:
> 
>   LD libuClibc-1.0.48.so
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L0 ':
> err.c:(.text+0xa0): undefined reference to `__atomic_compare_exchange_4'
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L6':
> err.c:(.text+0x138): undefined reference to `__atomic_exchange_4'
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
> __cxa_finalize.c:(.text+0xac): undefined reference to `__atomic_compare_exchange_8'
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(fork.oS): in function `.L23':
> fork.c:(.text+0x130): undefined reference to `__atomic_fetch_add_4'
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(sem_timedwait.oS): in function `.L5':
> sem_timedwait.c:(.text+0xe0): undefined reference to `__atomic_fetch_add_8'
> 
> With Shared libraries enabled:
> 
>   LD libuClibc-1.0.48.so
> riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
> __cxa_finalize.c:(.text+0xa4): undefined reference to `__atomic_compare_exchange_8'
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  arch/Config.in           | 2 +-
>  package/uclibc/Config.in | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index f39c33ef7f..d0052782be 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -431,7 +431,7 @@ choice
>  config BR2_BINFMT_ELF
>  	bool "ELF"
>  	depends on BR2_USE_MMU
> -	select BR2_BINFMT_SUPPORTS_SHARED
> +	select BR2_BINFMT_SUPPORTS_SHARED if !BR2_riscv || BR2_RISCV_ISA_RVA

Why this? This is no covered in your commit log.

>  	help
>  	  ELF (Executable and Linkable Format) is a format for libraries
>  	  and executables used across different architectures and
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 73ddd5ef58..f7edd417c6 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -78,13 +78,13 @@ choice
>  
>  config BR2_PTHREADS_NATIVE
>  	bool "Native POSIX Threading (NPTL)"
> -	depends on BR2_USE_MMU
> +	depends on BR2_USE_MMU && (!BR2_riscv || BR2_RISCV_ISA_RVA)
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  
>  config BR2_PTHREADS
>  	bool "linuxthreads"
> -	depends on !BR2_aarch64 && !BR2_aarch64_be
> +	depends on !BR2_aarch64 && !BR2_aarch64_be && (!BR2_riscv || BR2_RISCV_ISA_RVA)
>  	select BR2_TOOLCHAIN_HAS_THREADS

I would really like to hear back from Waldemar on this.

uClibc supports architectures that don't have atomic support (such as
ARC750/ARC770), so it is somewhat surprising that it wouldn't support
RISC-V without atomics. So let's try to understand the real problem and
find the correct solution rather than papering over the problem in a
very custom/architecture-specific way.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
