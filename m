Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F01E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 19:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F876068F;
	Fri, 20 Dec 2024 19:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWrrpBwXupG5; Fri, 20 Dec 2024 19:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744F76062F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744F76062F;
	Fri, 20 Dec 2024 19:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BE36C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F8A40119
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioKvlJPhhN4k for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 19:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2449400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2449400EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2449400EA
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:34:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B139813F880;
 Fri, 20 Dec 2024 20:33:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46222])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 20:33:59 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 20:33:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20241219075802.2445204-1-dario.binacchi@amarulasolutions.com>
References: <20241219075802.2445204-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0c8856133fd885985dbad969cb440be8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734723241;
 bh=MuFJf+KCd+lHbQ0GbmpCkX/Q41v3NJRzTtxmXit1xXA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HvQ2RZJswtRJOp1gTUSx2mtNiPTfOLNywpcdhiqDRAD2WNXOMFLmtppsDLCIV0Z/l
 raZKmdlBs7cnPerZcCPKdrs+/GP/pN2aEJKrNoJ5qnA0IihOTyLcynJIZLz9r1G2pZ
 vXJgJ0291jJ+bPydGEDMLmeBA9UbG73FY3Crqm3q3Wj+rUKtvQcawuLGdZECxgE6AN
 fiH/jMj4rOciBV53sG+CxbbhGfUtf3vaL3YLcvU8uc/AZIUYyWWVvE7l1OGRRKJlCc
 ZfgJAkK5CK10uVL2kBrLTcLL0Di/z/R68qauIDZlNh9hbSRLClhzgCk0ihj/TSRDNz
 M3FFUqplInzAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HvQ2RZJs
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.2.2
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

On 19/12/2024 08:58, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

> ---
>  package/armadillo/armadillo.hash | 2 +-
>  package/armadillo/armadillo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/armadillo/armadillo.hash 
> b/package/armadillo/armadillo.hash
> index d94218d91d54..19446b589a5b 100644
> --- a/package/armadillo/armadillo.hash
> +++ b/package/armadillo/armadillo.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  
> ebd6215eeb01ee412fed078c8a9f7f87d4e1f6187ebcdc1bc09f46095a4f4003  
> armadillo-14.0.3.tar.xz
> +sha256  
> 3054c8e63db3abdf1a5c8f9fdb7e6b4ad833f9bcfb58324c0ff86de0784c70e0  
> armadillo-14.2.2.tar.xz
>  # License files, locally calculated
>  sha256  
> 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  
> LICENSE.txt
> diff --git a/package/armadillo/armadillo.mk 
> b/package/armadillo/armadillo.mk
> index 0d2e85464f6a..1798cbf5ed13 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ARMADILLO_VERSION = 14.0.3
> +ARMADILLO_VERSION = 14.2.2
>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
>  ARMADILLO_INSTALL_STAGING = YES
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
