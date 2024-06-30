Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B43C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E134B4038E;
	Sun, 30 Jun 2024 09:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN18dEO-uMtf; Sun, 30 Jun 2024 09:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AE00408BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AE00408BD;
	Sun, 30 Jun 2024 09:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C35691BF364
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01814038E
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_MIErdmp6-q for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65CD2408BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65CD2408BD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65CD2408BD
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:31:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 69C8C13F89A;
 Sun, 30 Jun 2024 11:30:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Jun 2024 11:30:58 +0200
Date: Sun, 30 Jun 2024 11:30:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZoEl0jaExXsymmzD@landeda>
References: <20240629073102.772416-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240629073102.772416-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719739860;
 bh=dOKHotN7f9XaWubUIKpHBpt5Zx2RO8sX+IF5i25+FCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jP4d4qd/lCk3FcoIshQ+I0XCqyZE6gHDeNi7/t0/Om4RbngFxSycdNbpLnUSD3QUP
 OqWgy9C/SPjAxBpsZKZ14C0gTSSSSgY7fPuz93qxeEmgW8WmLy008U5ecA1UKwX7wU
 Qbt8UQ7nB93zvtxEdq5NcKDSg274Zz81ESoT3EbivVfJsQFaXgG88lnE/p9r6lKh+e
 +18kYW7EOoxtkgjZ3XkWRCW1i7awjzTb3kbZVhZ7iZ3h9QHvNCnfFnst34MSF1Ft4D
 pQy1Pf7ZKdFzhtrQOqx6JHIU5e2iyfwmxOhCNGYa7ur1P4d4CxQ/81OfVftX3bqLTH
 ujv20qtUdApzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jP4d4qd/
Subject: Re: [Buildroot] [PATCH 1/1] package/libyuv: update patches to be
 applied with fuzz 0
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

Bernd, All,

On 2024-06-29 09:31 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, libyuv fails to build with output:
> 
>     Applying 0001-i386-sse2.patch using patch:
>     patching file include/libyuv/scale_row.h
>     Hunk #1 FAILED at 33.
>     1 out of 1 hunk FAILED -- saving rejects to file include/libyuv/scale_row.h.rej
> 
> Rebase the patch to fix the problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8ca446ee4bd657a661894dec66f45aa02b6a7325/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/libyuv/0001-i386-sse2.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
> index b8ecb34d0f..2380bbc973 100644
> --- a/package/libyuv/0001-i386-sse2.patch
> +++ b/package/libyuv/0001-i386-sse2.patch
> @@ -5,7 +5,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
>  --- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
>  +++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
> -@@ -33,7 +33,7 @@
> +@@ -55,7 +55,7 @@
>   
>   // The following are available on all x86 platforms:
>   #if !defined(LIBYUV_DISABLE_X86) && \
> @@ -13,4 +13,4 @@ diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/
>  +    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
>   #define HAS_FIXEDDIV1_X86
>   #define HAS_FIXEDDIV_X86
> - #define HAS_SCALEADDROWS_SSE2
> + #define HAS_SCALEADDROW_SSE2
> -- 
> 2.39.2
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
