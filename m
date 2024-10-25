Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64172D149E8
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9C3406AA;
	Fri, 25 Oct 2024 19:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTDNhbEPWh1k; Fri, 25 Oct 2024 19:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B2640674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B2640674;
	Fri, 25 Oct 2024 19:11:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 360E22318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 315B640F56
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nz7dK-IcRkD for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 19:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE16540F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE16540F45
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE16540F45
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D3C3C19F5AF;
 Fri, 25 Oct 2024 21:11:30 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46532])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Oct 2024 21:11:30 +0200
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 21:11:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20240924195627.596208-1-zgyarmati@zgyarmati.de>
References: <20240924195627.596208-1-zgyarmati@zgyarmati.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <bc89e6bb7157cf529a0a5e8a18589ccb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729883492;
 bh=CPCVWwaj1vMP3/2OfVrbxuzTDn7kOIwZ+4rk83sDveM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=leSm+h+gMG13xkdVTyQCzaKIrXD8XbfPR3vT+Q8634zLA6KO/BZS1Z7fr95QsDTsE
 dzAp4WhFLxLUNa4ZSwbWnVrAfkb0fEnIb7vX/haty1753cZRg0kII47eI6v0UrpqBD
 1VdBTKQcLEHjcAVPpNNeln/Mzo4BSiaPTGe2BpURYnm2ui5jsO6WqfnKyoIvx/txj0
 nS6B2jNJldICTaACxkbVU+kTW6ihQdn4MVkah6s621CNKlxFiS0adprQQmOYFaIKcG
 +080uUoy7xcHpk1D1X3WeA8ziSsSt+ki8sMtkLVWNMzfRxHp0+JkqfQiU2GHm7Vu/z
 dBW6Asi9K9WQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=leSm+h+g
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to 9.5.0
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

On 24/09/2024 21:56, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to master, thanks.

Julien.

> ---
>  package/proj/proj.hash | 6 +++---
>  package/proj/proj.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 828380293e..8a1650ade5 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from https://download.osgeo.org/proj/proj-9.4.1.tar.gz.md5
> -md5  e53d826635908369895060c9226f09f6  proj-9.4.1.tar.gz
> +# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
> +md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
>  # Locally calculated
> -sha256  
> ffe20170ee2b952207adf8a195e2141eab12cda181e49fdeb54425d98c7171d7  
> proj-9.4.1.tar.gz
> +sha256  
> 659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  
> proj-9.5.0.tar.gz
>  sha256  
> 6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  
> COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index d591d4eb6c..a17a0a1feb 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PROJ_VERSION = 9.4.1
> +PROJ_VERSION = 9.5.0
>  PROJ_SITE = http://download.osgeo.org/proj
>  PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
