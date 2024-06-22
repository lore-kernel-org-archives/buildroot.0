Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F9C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED3CB405D6;
	Sat, 22 Jun 2024 17:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAyLSDvEC1TG; Sat, 22 Jun 2024 17:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3642405C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3642405C6;
	Sat, 22 Jun 2024 17:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC6E1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C256070E
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1iT7fNmool5 for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17FDB606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17FDB606C6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17FDB606C6
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:40:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51C2220002;
 Sat, 22 Jun 2024 17:40:37 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:40:36 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240622194036.2916b857@windsurf>
In-Reply-To: <Zm/k5MktW8WaUp2q@waldemar-brodkorb.de>
References: <Zm/k5MktW8WaUp2q@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719078037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaPdK4c9gvLp5B1SvEIp8KbEj3SJeAsZ5raYBtOgCvM=;
 b=J3dWqDULhG4jSfoUzxNbOEo+vCmVmmRPnzIZPvd7V8WD7oI6APjX9yfmgLwWz3pbD0LXvQ
 Y3iaatqUO7YZjSnFTg0lR7Wov/xDevaiGu6G/yNhZqJD4yWIIUv3ucjpl5ln264kvtWBFo
 eLY9sXn1QmSQjcGFKQmItEGo7072AMSNg1h2+kxH0unNBpaBgdqYD0bDx+BOIRcNF4Ik2i
 kW/BPSlW49rO81MuIuqWk2PLJLdhRS4ZdYbj2l+kIvNNHEv93c/1gps+eUuVjgWh2RoN0L
 J2b7ETewkbs/Ht42ad8aiyPwanZySLTXgt3MpVn86UGBe4CljP3FK8Zv6qIc6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J3dWqDUL
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.49
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

On Mon, 17 Jun 2024 09:25:24 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> git shortlog v1.0.49...v1.0.48
> Dmitry Chestnykh (6):
>       Correct uClibc compilation.
>       Fix uClibc build for nds32 with gcc-14.
>       Fix riscv32 build with gcc-14.
>       riscv32: Fix `struct ucontext` definition.
>       Fix wrong `struct ucontext_t` typedef for all arches.
>       Cast to proper types inside atomic macroses.
> 
> Fabrice Fontaine (1):
>       libc/sysdeps/linux/common/utime.c: fix riscv32 build
> 
> Joe Damato (1):
>       epoll.h: Add epoll ioctls
> 
> Max Filippov (9):
>       iconv: fix type mismatches
>       ldso: FDPIC: fix type mismatches
>       ldso: arm: fix build with gcc-14
>       malloc/memalign: avoid integer overflow
>       fix kernel_stat64 definition
>       linuxthreads: enable unwinding over signal frames
>       xtensa: use compiler-provided XCHAL macros
>       xtensa: make _init and _fini hidden
>       xtensa: add FDPIC support
> 
> Waldemar Brodkorb (9):
>       futimesat: add missing header
>       sparc64: Fix incorrect sigreturn stub function implementation
>       csky: allow time64
>       m68k: fix noMMU ELF compile with gcc 14.x
>       Revert "nds32: sync with binutils 2.37, gcc 11.2 and linux 5.10.93 changes"
>       m68k: fix for m68000 cpu
>       config: make ctor/dtor visible again
>       config: enable TIME64 by default
>       bump version for 1.0.49 release
> 
> Yuriy Kolerov (1):
>       libc: cast free() argument to void * in wchar.c
> 
> Patches applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-futimesat-add-missing-header.patch   | 26 --------------
>  .../0002-fix-kernel_stat64-definition.patch   | 35 -------------------
>  package/uclibc/uclibc.hash                    |  4 +--
>  package/uclibc/uclibc.mk                      |  2 +-
>  4 files changed, 3 insertions(+), 64 deletions(-)
>  delete mode 100644 package/uclibc/0001-futimesat-add-missing-header.patch
>  delete mode 100644 package/uclibc/0002-fix-kernel_stat64-definition.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
