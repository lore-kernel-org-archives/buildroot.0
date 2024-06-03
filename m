Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E39C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADDC340725;
	Mon,  3 Jun 2024 09:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8kexCkVf6JK; Mon,  3 Jun 2024 09:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BC5406FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BC5406FA;
	Mon,  3 Jun 2024 09:20:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55FAF1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DDD86065A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezO76Lz-52jC for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A8B960650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8B960650
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A8B960650
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C161F13F8CF;
 Mon,  3 Jun 2024 11:19:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 11:19:50 +0200
Date: Mon, 3 Jun 2024 11:19:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl2Kts-cHL5pwRqb@landeda>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-3-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603071726.532652-3-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717406392;
 bh=UfocGpR29b3hkURhhZN3BVYkHdnAto2BKOPbtx0UIbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jR2PIxzYvqDiAt7XxQGzvsgSNZ6Poks0dZ7V+im++eJei4cK5eduo8w6S0Bb0NEhY
 84kHpkye0ILFmMPdCqo3/XQAN5I1ihnkGQBgLyXjTYrUjvdcAN5KC/WbhtSCaFa5Cb
 ueweQMwGGt+aPrBxdsUF1dIHiIJEUwzKwqzyvFLnvdZw0s/W+2JcEr8/O1dgXKyNJ8
 4nNeYRCjfyXij/InTFwG7Nhnl1u1DsBYqbBmhUC5q3PvZB7VYRN9Xzc4itzaV6zIdo
 wnk3Lh5dCdSAoRfEGxoKe0v2WLsO+b6g0kaJXWCXboYnukgTNSVxa4ECJGhclj4WfZ
 wNikAsGPC3MrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jR2PIxzY
Subject: Re: [Buildroot] [PATCH 03/23] package/file: use http:// _SITE
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

Peter, All,

On 2024-06-03 09:17 +0200, Peter Korsgaard spake thusly:
> ftp.astrom.com also serves the files over http://, so use that instead.

I've switched to use https instead.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/file/file.hash | 2 +-
>  package/file/file.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/file/file.hash b/package/file/file.hash
> index 08e8497471..4beca5e2e3 100644
> --- a/package/file/file.hash
> +++ b/package/file/file.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after verifying signature
> -# ftp://ftp.astron.com/pub/file/file-5.45.tar.gz.asc
> +# http://ftp.astron.com/pub/file/file-5.45.tar.gz.asc
>  # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
>  sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
>  sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
> diff --git a/package/file/file.mk b/package/file/file.mk
> index b67fcaead4..52fbab81a9 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FILE_VERSION = 5.45
> -FILE_SITE = ftp://ftp.astron.com/pub/file
> +FILE_SITE = http://ftp.astron.com/pub/file
>  FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
>  FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
>  FILE_CPE_ID_VALID = YES
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
