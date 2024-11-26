Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E85D65553
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E904EDB2;
	Tue, 26 Nov 2024 20:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaG8z3KLxRlN; Tue, 26 Nov 2024 20:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE5C64EDAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5C64EDAC;
	Tue, 26 Nov 2024 20:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 505AC112A
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CDE9435B7
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMK7z3joBhRl for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 20:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28CA6435B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28CA6435B9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28CA6435B9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:22:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AAAC213F8AE;
 Tue, 26 Nov 2024 21:22:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45828])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 21:22:07 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 21:22:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Torben Voltmer <mail@t-voltmer.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241125225132.1476605-1-mail@t-voltmer.net>
References: <20241125225132.1476605-1-mail@t-voltmer.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <fa309a0b83ef9367125ff07592e6357f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732652528;
 bh=oAsUKnvgkPlAd/uGgugToafM/AEtltpqku6AuHds3GU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nuEwEtn7zyBwV4ulpiLjXD1lEsBMu/cKhiCUP+pU/DKFets71ws2EIirwLM/n990J
 5cMEJNNwodBgT18BRisKOJ8UBJk1zr/hfO7m02tO9M5s7VbgLIyX/RUhzxur8sz3YI
 M7eXJkKrhynC5de7XMykAW/rTTmdeY90JP4tEZOdTLGWt6iOgjiNApYL1COxFiBDl0
 HIl+DFNFFHQbSGDwwMjbcEAontnTDzRR8NYifZKLOlZM0rnvGiZJ76obUc4Z06prgy
 D3B1AfI5XIOvsORu0EfCzwsVwNpG8F/nX8ICALi4z/GZtlT4xvney2+zDH3rcElE6h
 qv6QOylvmCbkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nuEwEtn7
Subject: Re: [Buildroot] [PATCH 1/1] package/espflash: bump version to 3.2.0
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

On 25/11/2024 23:51, Torben Voltmer wrote:
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>

Applied to next, thanks.

> ---
>  package/espflash/espflash.hash | 2 +-
>  package/espflash/espflash.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/espflash/espflash.hash 
> b/package/espflash/espflash.hash
> index 0b1e160a47..e079fdf322 100644
> --- a/package/espflash/espflash.hash
> +++ b/package/espflash/espflash.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> f91a3e33e874bac0d7687d87c3cd692a54325c0dceaf35c983bd3d94519dee25  
> espflash-3.1.1-cargo2.tar.gz
> +sha256  
> de65d1d9efa0561aae1a0fe476860402139f8a7ebbf28948d2ef7e4b68b21373  
> espflash-3.2.0-cargo2.tar.gz
>  sha256  
> 0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  
> LICENSE-APACHE
>  sha256  
> a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  
> LICENSE-MIT
> diff --git a/package/espflash/espflash.mk 
> b/package/espflash/espflash.mk
> index bcb343fc58..dae852fad4 100644
> --- a/package/espflash/espflash.mk
> +++ b/package/espflash/espflash.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ESPFLASH_VERSION = 3.1.1
> +ESPFLASH_VERSION = 3.2.0
>  ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
>  ESPFLASH_SUBDIR = espflash
>  ESPFLASH_LICENSE = Apache-2.0 or MIT
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
