Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13856E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C095760748;
	Thu, 12 Dec 2024 21:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSPVft5szvYH; Thu, 12 Dec 2024 21:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8248613D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8248613D5;
	Thu, 12 Dec 2024 21:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B547114A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B8024012A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f04p6B6X_4TA for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 062D140017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 062D140017
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 062D140017
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4DED520043D;
 Thu, 12 Dec 2024 22:50:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48856])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Dec 2024 22:50:43 +0100
MIME-Version: 1.0
Date: Thu, 12 Dec 2024 22:50:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20241212073449.449807-1-dario.binacchi@amarulasolutions.com>
References: <20241212073449.449807-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <489c24ab0ac7336c010f072cad7395f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734040245;
 bh=Tz7LdHQYO7IJRNHkAufhcjzALIlMVgHCQ3B/7aNjWb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RXUre4ToKXtiYkg0Ji6lLjKv0mId5uAg8ertbttkcgsc1jU0hYpjuKXO2DlxnVTOX
 /hB+kpB+0B/xDutX9gzdTTCmq2JfQNa9wml4d1kFl0kbcARifJrnWXc3lVb4hob3ga
 Y4E5/RX47vZCj7Jns81Th3geSYMyN5I8jvLJw4tPsOLOgwCGSorWNnMaMA2K+30oZt
 yEjesGyAos0s83CxH0bzo+PdHnha/off40R2eTma36L5pvNFEiAalUYotpt6q9+stH
 yJL++NQg1MGONIUeRx9gwSI6CO+AyzzvMhe084EX5CULkxfLgLyvHwpr47tJXs+TvI
 CHVIHQKqFubvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RXUre4To
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: fix static build
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

On 12/12/2024 08:34, Dario Binacchi wrote:
> By default, the library is generated as shared. Therefore, if
> BR2_STATIC_LIBS is selected, let's require the creation of a
> static library.
> 
> Fixes:
> - 
> https://autobuild.buildroot.org/results/fdaf2028b97f60bc01d22d3caeb9a6432d92b598
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

> ---
>  package/armadillo/armadillo.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/armadillo/armadillo.mk 
> b/package/armadillo/armadillo.mk
> index e2d7c3968f2a..0d2e85464f6a 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -30,4 +30,8 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
>  ARMADILLO_DEPENDENCIES += lapack
>  endif
> 
> +ifeq ($(BR2_STATIC_LIBS),y)
> +ARMADILLO_CONF_OPTS += -DSTATIC_LIB=ON
> +endif
> +
>  $(eval $(cmake-package))
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
