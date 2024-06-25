Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47527C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 17:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6958C81604;
	Tue, 25 Jun 2024 17:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ii455FDjiQ0n; Tue, 25 Jun 2024 17:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D41D81364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D41D81364;
	Tue, 25 Jun 2024 17:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B17E21BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE4D81A33
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3xxSA44Hvhu for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 17:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53743812BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53743812BA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53743812BA
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 17:36:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B63D113F8B9;
 Tue, 25 Jun 2024 19:36:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 19:36:49 +0200
Date: Tue, 25 Jun 2024 19:36:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZnsAMTK-uGmdAEsT@landeda>
References: <20240625145202.789086-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625145202.789086-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719337011;
 bh=P/Q8q0far+/mjXKvGZRKAAQC0yS1OiaUAcMQ2KU6Lwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1cebrvyHtZBKfQQMMw2nkrCV5srbebliEJQ2LsZMHcNWPcRKEh9KOApns7/zEi2d
 B8/xhU/e4GRbm3z3SLWtyu0rPdEefA91AROgUq6/DAhj8+RoVYgPbdmD2WpUu5GTgO
 XSbzaTOPPNzgT7g/VkrF6d4zEYYE8GyeVkV2o9C6kblj/vCPRsN1N5KceqFCNooSjI
 diFpodX2TvquJPItAr8cDiQU2DLSOaeajgraMPWXIJYvZDZ5ROsQRzRGRnwceyquFn
 n1d6U/9RW9LyZU107VWH7ksN+YSocIV2tqHCvWOwWiZZ0oDnGFFIjXBYHwDkzh0wgj
 azXZilAgfwt7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z1cebrvy
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: update the patch
 to be applied with fuzz 0
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

Julien, All,

On 2024-06-25 16:52 +0200, Julien Olivain spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, host-riscv-isa-sim fail to build with output:
> 
>     Applying 0001-riscv-disable-precompiled-headers.patch using patch:
>     patching file riscv/riscv.mk.in
>     Hunk #1 FAILED at 35.
>     1 out of 1 hunk FAILED -- saving rejects to file riscv/riscv.mk.in.rej
> 
> This commit rebased the package patch on the package version, bumped in
> commit 853b7661bf "package/riscv-isa-sim: bump to git version
> 00dfa28cd7".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

While you are at it, could you add an Upstream tag, to state the status
of that patch, please?

Probably, "N/A unfit for upstream" would be what we need. Ideally, an
upstreamable patch would be better. Ideally-ideally, an upstreamed patch
would be awesome. Ideally-ideally-ideally, a backport from upstream
would be wonderful! ;-)

Regards,
Yann E. MORIN.

> ---
>  .../0001-riscv-disable-precompiled-headers.patch     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
> index 461f34e3a10..9ce32e3b768 100644
> --- a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
> +++ b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
> @@ -1,4 +1,4 @@
> -From 980d5143089bf32ef8a6dfdf1bb9e9fe92fa7bf5 Mon Sep 17 00:00:00 2001
> +From 12e0257495de41202827fabd5935f2e5a92ae8a6 Mon Sep 17 00:00:00 2001
>  From: Julien Olivain <ju.o@free.fr>
>  Date: Sun, 9 Jan 2022 13:38:48 +0100
>  Subject: [PATCH] riscv: disable precompiled headers
> @@ -16,12 +16,12 @@ Signed-off-by: Julien Olivain <ju.o@free.fr>
>   1 file changed, 3 deletions(-)
>  
>  diff --git a/riscv/riscv.mk.in b/riscv/riscv.mk.in
> -index 2347ce6..4f56eaf 100644
> +index 469c48dc..c61cadaf 100644
>  --- a/riscv/riscv.mk.in
>  +++ b/riscv/riscv.mk.in
> -@@ -35,9 +35,6 @@ riscv_hdrs = \
> - 
> - riscv_install_hdrs = mmio_plugin.h
> +@@ -45,9 +45,6 @@ riscv_install_hdrs = \
> + 	triggers.h \
> + 	vector_unit.h \
>   
>  -riscv_precompiled_hdrs = \
>  -	insn_template.h \
> @@ -30,5 +30,5 @@ index 2347ce6..4f56eaf 100644
>   	processor.cc \
>   	execute.cc \
>  -- 
> -2.34.1
> +2.45.2
>  
> -- 
> 2.45.2
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
