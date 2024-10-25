Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CF0D149E8
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 18:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B1140C0B;
	Fri, 25 Oct 2024 18:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHxBRkzqBa3S; Fri, 25 Oct 2024 18:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E6640C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E6640C5F;
	Fri, 25 Oct 2024 18:59:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2519281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A310381F75
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nagVsx5aQOJb for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 18:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ECDA81F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ECDA81F79
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ECDA81F79
 for <buildroot@busybox.net>; Fri, 25 Oct 2024 18:59:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 745AA19F57E;
 Fri, 25 Oct 2024 20:59:36 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53104])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Oct 2024 20:59:36 +0200
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 20:59:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20240930190234.3923303-1-francois.perrad@gadz.org>
References: <20240930190234.3923303-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <c46d553e4343f143208e42c0a0c9532c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729882778;
 bh=rSB0paxAWyVeF5IAdTD1btY/4Mr3fMrsvsfFrSzXXrM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ko1ntEvjYX5fKDbLoCQwHf0xdQDV/JlfjfiaJ4D2KEJLdsjnZ/eN/9R6/pk06QrU2
 dzm7uVRcv/TpVnfDjb3L5LEikzbcdsCkXBFEitEhjr2OKgMA6gU/8xzc3ITQOTpb++
 xuOo5gY0x7LcQqNmx+V81bn8io0FPAPoGF5id2RJ0q4EUaA75ew3cl/WoXLzseADKP
 BkKsD0xjhO+vZeARyJd/QFEsU1dZ3kYvdQ+qn95DKI7RiPHL8hhoPZABICsl8mygcP
 0NRax8zZIshLd+RcTqdJJAkPdXznRlP6cQklSiUYjiH7wbuLXh9JT8XR4MU4GZVmSn
 JRnbOFyuVRwZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ko1ntEvj
Subject: Re: [Buildroot] [PATCH] package/kbd: bump to 2.6.4
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

On 30/09/2024 21:02, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Julien.

> ---
>  package/kbd/kbd.hash | 2 +-
>  package/kbd/kbd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
> index 63f7286d3..25866751f 100644
> --- a/package/kbd/kbd.hash
> +++ b/package/kbd/kbd.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
> -sha256  
> ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683  
> kbd-2.5.1.tar.xz
> +sha256  
> 519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926  
> kbd-2.6.4.tar.xz
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
>  sha256  
> 5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  
> CREDITS
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 15912419f..953adccd0 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -KBD_VERSION = 2.5.1
> +KBD_VERSION = 2.6.4
>  KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
>  KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
>  KBD_CONF_OPTS = \
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
