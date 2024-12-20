Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D057E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 19:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E00407DC;
	Fri, 20 Dec 2024 19:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-FcsNqbksn2; Fri, 20 Dec 2024 19:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2144740895
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2144740895;
	Fri, 20 Dec 2024 19:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC5106C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A12A405AA
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIs9CspilbGO for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 19:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E82C400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E82C400EA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E82C400EA
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6A8B119F57E;
 Fri, 20 Dec 2024 20:43:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38270])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 20:43:51 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 20:43:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20241220151123.620117-1-zgyarmati@zgyarmati.de>
References: <20241220151123.620117-1-zgyarmati@zgyarmati.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <867acb7d2873080a52f9c70728e72471@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734723832;
 bh=wr0R6sZJxR4leR5CsKmetXN7t/t+x3T0DnD4koz9QzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N5Jz2pghH+kVLVtVH4U7BLaEglc5jEsW/d5sum00wV824UiEEcG25+VjBk6lBD4cm
 TNLctSu/n4ILkkAQwH9jdBVloaDeSoXm9Z7BWdGq6S/FzyN3NIyqMC+Jn6cO95913A
 +xV5uA9nHkdxvQZwFeM+uJq+/rsYmVQlqFUuHa1Gsa3XhiF6YbXABigaaHMPGV1lXF
 9RAZgeYbUsB6fMbOhuUy8DKwOxlr5qjuhCXwZRZz8L5RPjqFIdV2P3Vu7b5vWQlppg
 P44wrfuOE6ZC0rsb/zkwiphrUrwVsC1z80sKoj9tvFUta2L05nHFr8d8lNWu0GQBqn
 3ryDKs8aYq2Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N5Jz2pgh
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to 9.5.1
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

On 20/12/2024 16:11, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to master, thanks.

> ---
>  package/proj/proj.hash | 6 +++---
>  package/proj/proj.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 8a1650ade5..5249f52c10 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
> -md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
> +# Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
> +md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
>  # Locally calculated
> -sha256  
> 659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  
> proj-9.5.0.tar.gz
> +sha256  
> a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3  
> proj-9.5.1.tar.gz
>  sha256  
> 6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  
> COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index a17a0a1feb..19b5f1012e 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PROJ_VERSION = 9.5.0
> +PROJ_VERSION = 9.5.1
>  PROJ_SITE = http://download.osgeo.org/proj
>  PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
