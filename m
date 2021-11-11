Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FADC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:33:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081C661152
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 081C661152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB76840432;
	Thu, 11 Nov 2021 21:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evhkn-HpmDfR; Thu, 11 Nov 2021 21:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E037C4050D;
	Thu, 11 Nov 2021 21:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0381BF388
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4C9400C1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KFrw0Ti_KBV for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 21:33:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F12884037A
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 21:33:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DBA0E19F57E;
 Thu, 11 Nov 2021 22:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636666386;
 bh=+DSdRf9KCjATyMOAzDxUdVtrGVxDTjzV6NHkigk4LrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dnb+bOZKLWoQS0wWCZXcJ4WAvnWaSY019hcvX7nUSbxx2IE+kJ4Z2u458V8K3w7Gp
 MbZQscSKauT7g7w0CKIUPNm1ytoar/HCBJc07e5F8RKVrTv39UpXTkXHxTb2zHeE+z
 tJRtZSZucbMzXcDf8JdU763dTZAp7pZxYkn5ZxKn6iQmBvnIGL5/ps6Tx4vOKKKiZg
 ndthLO+mLNcQ9tuDrnNVNqiL5DzZgmYvqAefU/wGhchAv3WHwJWf0J96AETSxE9oym
 wesCuKoDty7K3qOg41MamJuhwiBAMTGJedy+f8DdIaQknLPSQCmMynfKoaPe3z9xYD
 sR/CKeOBm9mzg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 22:33:01 +0100
Date: Thu, 11 Nov 2021 22:33:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211111213301.GG2609@scaer>
References: <20211110223244.2116243-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110223244.2116243-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix musl build on riscv
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-10 23:32 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since gdb 10.1 and
> https://github.com/bminor/binutils-gdb/commit/bf84f7066626c78884436e1c39fb60f04c665f21:
> 
> ../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
> ../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
>   140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
>       |                   ^~~~~~~~~~
>       |                   ELF_NGREG
> 
> musl fixed the issue with
> https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../10.2/0007-fix-musl-build-on-riscv.patch   | 60 +++++++++++++++++++
>  .../11.1/0007-fix-musl-build-on-riscv.patch   | 60 +++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
>  create mode 100644 package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
> 
> diff --git a/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
> new file mode 100644
> index 0000000000..983f3b30d0
> --- /dev/null
> +++ b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
> @@ -0,0 +1,60 @@
> +From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 10 Nov 2021 23:14:54 +0100
> +Subject: [PATCH] fix musl build on riscv
> +
> +Fix the following build failure raised with musl:
> +
> +../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
> +../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
> +  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
> +      |                   ^~~~~~~~~~
> +      |                   ELF_NGREG
> +
> +musl fixed the issue with
> +https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570

I've changed the URL to point to the official upstream repository rather
than the unofficial cone on Github.

It is also unfortunate that we have to have those patches on gdb... :-(

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +Fixes:
> + - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + gdb/nat/riscv-linux-tdesc.c  | 5 +++++
> + gdbserver/linux-riscv-low.cc | 5 +++++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
> +index 837b1707e0f..667c013006a 100644
> +--- a/gdb/nat/riscv-linux-tdesc.c
> ++++ b/gdb/nat/riscv-linux-tdesc.c
> +@@ -31,6 +31,11 @@
> + # define NFPREG 33
> + #endif
> + 
> ++/* Work around musl breakage since version 1.1.24.  */
> ++#ifndef ELF_NFPREG
> ++# define ELF_NFPREG 33
> ++#endif
> ++
> + /* See nat/riscv-linux-tdesc.h.  */
> + 
> + struct riscv_gdbarch_features
> +diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
> +index 8bf97ea4aa3..1142dbc7b16 100644
> +--- a/gdbserver/linux-riscv-low.cc
> ++++ b/gdbserver/linux-riscv-low.cc
> +@@ -30,6 +30,11 @@
> + # define NFPREG 33
> + #endif
> + 
> ++/* Work around musl breakage since version 1.1.24.  */
> ++#ifndef ELF_NFPREG
> ++# define ELF_NFPREG 33
> ++#endif
> ++
> + /* Linux target op definitions for the RISC-V architecture.  */
> + 
> + class riscv_target : public linux_process_target
> +-- 
> +2.33.0
> +
> diff --git a/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
> new file mode 100644
> index 0000000000..983f3b30d0
> --- /dev/null
> +++ b/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
> @@ -0,0 +1,60 @@
> +From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 10 Nov 2021 23:14:54 +0100
> +Subject: [PATCH] fix musl build on riscv
> +
> +Fix the following build failure raised with musl:
> +
> +../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
> +../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
> +  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
> +      |                   ^~~~~~~~~~
> +      |                   ELF_NGREG
> +
> +musl fixed the issue with
> +https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + gdb/nat/riscv-linux-tdesc.c  | 5 +++++
> + gdbserver/linux-riscv-low.cc | 5 +++++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
> +index 837b1707e0f..667c013006a 100644
> +--- a/gdb/nat/riscv-linux-tdesc.c
> ++++ b/gdb/nat/riscv-linux-tdesc.c
> +@@ -31,6 +31,11 @@
> + # define NFPREG 33
> + #endif
> + 
> ++/* Work around musl breakage since version 1.1.24.  */
> ++#ifndef ELF_NFPREG
> ++# define ELF_NFPREG 33
> ++#endif
> ++
> + /* See nat/riscv-linux-tdesc.h.  */
> + 
> + struct riscv_gdbarch_features
> +diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
> +index 8bf97ea4aa3..1142dbc7b16 100644
> +--- a/gdbserver/linux-riscv-low.cc
> ++++ b/gdbserver/linux-riscv-low.cc
> +@@ -30,6 +30,11 @@
> + # define NFPREG 33
> + #endif
> + 
> ++/* Work around musl breakage since version 1.1.24.  */
> ++#ifndef ELF_NFPREG
> ++# define ELF_NFPREG 33
> ++#endif
> ++
> + /* Linux target op definitions for the RISC-V architecture.  */
> + 
> + class riscv_target : public linux_process_target
> +-- 
> +2.33.0
> +
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
