Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B16EE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9EE81FA9;
	Sat, 14 Dec 2024 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_CnHrhXlYxd; Sat, 14 Dec 2024 14:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A4B81FFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A4B81FFC;
	Sat, 14 Dec 2024 14:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB22C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEE860683
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B001RprNPdtH for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 14:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B2F260664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2F260664
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B2F260664
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:05:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3BA4C19F58A;
 Sat, 14 Dec 2024 15:05:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45058])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 15:05:18 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 15:05:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214135836.3254625-1-peter@korsgaard.com>
References: <20241214135836.3254625-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <486bd51a2e24f478c7a88a0ff37a1a32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734185119;
 bh=U4dgjbIwB3XWj8pTSZKSjFu+YeuCtNHfStbP5G+BGUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hJsyx6K2/vwAd/yUllRTJV7mPHMmsZBtUWh+nFcn1s0rTmewS/az3wdRmsYRl2Z3V
 KflQzo0V4zUbv3VlyqS9mz5EXFzxkzTlFHVm7xB3pEuy8GaKihUxDUUDoxubItiXX/
 YSXCXCQnGH8puAAiggpqQoSyuG0AYeWotnE1wwuP0kIUNQsSC1L7vMpHSC4laxWGFm
 xts0GNV8mCCjVBNnqyC+1lr+CW4oaAm7FAtQILftCH2oTZgRemH3XtuaiFN6NoQdlv
 261Z6Y6Vh47xSx+zNF/TlG4sSsrOgdruDphBLEU8kX1g2CazcHkKoyv99hZILCNwib
 emdaxDbliCYPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hJsyx6K2
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 8.11.1
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

On 14/12/2024 14:58, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2024-11053: netrc and redirect credential leak
> https://curl.se/docs/CVE-2024-11053.html
> 
> Changelog: https://curl.se/ch/8.11.1.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash 
> b/package/libcurl/libcurl.hash
> index 93a0f85dee..c2ddee2cc2 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.11.0.tar.xz.asc
> +# https://curl.se/download/curl-8.11.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  
> db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb  
> curl-8.11.0.tar.xz
> +sha256  
> c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56  
> curl-8.11.1.tar.xz
>  sha256  
> adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  
> COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1022abac85..845bf43418 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBCURL_VERSION = 8.11.0
> +LIBCURL_VERSION = 8.11.1
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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
