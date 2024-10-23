Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A797CFA465
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DEAA40BEB;
	Wed, 23 Oct 2024 20:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7WS2Rf-HyPV; Wed, 23 Oct 2024 20:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8B240BFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8B240BFF;
	Wed, 23 Oct 2024 20:10:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 675264960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FCA606EA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-cESORpj9qL for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D652605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D652605A5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D652605A5
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2D601B00563;
 Wed, 23 Oct 2024 22:10:39 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48480])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 22:10:39 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 22:10:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20240906183313.1612683-1-petr.vorel@gmail.com>
References: <20240906183313.1612683-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <39100d74b321edbc9bf78ec64dd79885@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729714240;
 bh=T+AotqN0i+Csz3+Dj52SbjXCrtOw0d+6NKGkNXDp5FQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YC5kphQzqNot+va2EIrwhQtaFLHII1kJ/PFg2CeLtJStRxXCcYkiTsVRYiha6bcBx
 CGhNpDVzD6hEnIIlI3MDaPodz0UTWVv6lWTx5tl2dsK8kohbDMUuGfjEK92HiZwAtt
 /4Zrh3rFQxLXMr5zJkrars0hfAN/ZASSPOf7ICys6oSOF9WLI9RVnyqTJvSKyRWHDy
 XKBhcVPjpSrZhCm1JTCvo6CQV6p6IH10MpTKerS9cmhIUHWHufYeS+nF1hJJJfn0B5
 d5GAErL5WAwpqy24Qv2Xx+j2q7qIiI89pg5Fx2/B9HOqg8scVDdGQVTyftu31i1O5n
 lj3YVYTBgSGSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YC5kphQz
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20240905
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On 06/09/2024 20:33, Petr Vorel wrote:
> Update comment. This release includes pre-generated man pages & HTML
> docs in dist tarballs [1], but we don't install them anyway (Buildroot
> does not ship package docs).
> 
> [1] 
> https://github.com/iputils/iputils/commit/535f6de25909a63ea35750c8a37408e49c0d235c
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master.
I also added the link to the release change log in the commit log.
Thanks!

Julien.

> ---
>  package/iputils/iputils.hash | 4 ++--
>  package/iputils/iputils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iputils/iputils.hash 
> b/package/iputils/iputils.hash
> index a3e48d60a9..6baf433dcb 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,5 +1,5 @@
> -# 
> https://github.com/iputils/iputils/releases/download/20240117/sha256sums.asc
> -sha256  
> 7ed46e876e4157e1d20c40ec945e1ce0f3af3b10b5f6373e423135c6f22cd116  
> iputils-20240117.tar.gz
> +# 
> https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
> +sha256  
> 599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  
> iputils-20240905.tar.gz
>  # Locally computed
>  sha256  
> 2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  
> LICENSE
>  sha256  
> 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  
> Documentation/LICENSE.BSD3
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 08d849e69d..ec8c24e4e0 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -IPUTILS_VERSION = 20240117
> +IPUTILS_VERSION = 20240905
>  IPUTILS_SITE = 
> https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
>  IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>  IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 
> Documentation/LICENSE.GPL2
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
