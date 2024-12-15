Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC3AE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F61407B7;
	Sun, 15 Dec 2024 10:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSImiqceFDmd; Sun, 15 Dec 2024 10:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7860C406D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7860C406D4;
	Sun, 15 Dec 2024 10:40:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5943069
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4683F8135C
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sA4lmlWRRh6x for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29E2381321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E2381321
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E2381321
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:40:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 393D013F8B9;
 Sun, 15 Dec 2024 11:40:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46696])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 11:40:02 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 11:40:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20241215100724.3835761-1-peter@korsgaard.com>
References: <20241215100724.3835761-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b87691d15522cb870bb707d8f87e92b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734259204;
 bh=KAd3nqFwyxwdcsde3djrd8C62OpLhRE09yQHZ8YAQQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T5yBOQagKijHB/Lbo33RzoxeB/vQuEFYveXTAwN/ebu7YiWE8yMjDWbYjs2uzBQNs
 J2DFsFqkbNrAwqOVhaEGhOpUffIh77iLyJtlp7mo4IqhJRJ5MKUq9AXkoBQJi7VIIn
 FHsALwiRp8KmX7JWZ4opRd1bR5NC0IEJs9Ba3VpWr/UPfDRmfRbTOGDqu8bC0wItOj
 nVVZN3vZ2NzGaEBoOwq4zJ7FkjTSw7+ju7gvgujdN6I8T+Xjxxuf091g7a+HmVVVjD
 K/VCwg3c/mLUCqJtkTbkI3+h3k3lghcfPvlhOGUBo9u40ZbUwyBhzgA2VNlARwKDlj
 fTsK32sShAZow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T5yBOQag
Subject: Re: [Buildroot] [PATCH] package/libsoup3: security bump to version
 3.6.1
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

On 15/12/2024 11:07, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2024-52531: GNOME libsoup before 3.6.1 allows a buffer overflow in
> applications that perform conversion to UTF-8 in
> soup_header_parse_param_list_strict.  Input received over the network 
> cannot
> trigger this.
> 
> https://www.cve.org/CVERecord?id=CVE-2024-52531
> 
> CVE-2024-52532: GNOME libsoup before 3.6.1 has an infinite loop, and 
> memory
> consumption.  during the reading of certain patterns of WebSocket data 
> from
> clients.
> 
> https://www.cve.org/CVERecord?id=CVE-2024-52532
> 
> Changelog: https://gitlab.gnome.org/GNOME/libsoup/-/blob/3.6.1/NEWS
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/libsoup3/libsoup3.hash | 4 ++--
>  package/libsoup3/libsoup3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsoup3/libsoup3.hash 
> b/package/libsoup3/libsoup3.hash
> index 37ecd2db84..23af347903 100644
> --- a/package/libsoup3/libsoup3.hash
> +++ b/package/libsoup3/libsoup3.hash
> @@ -1,4 +1,4 @@
> -# From 
> https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.sha256sum
> -sha256  
> 62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3  
> libsoup-3.6.0.tar.xz
> +# From 
> https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.1.sha256sum
> +sha256  
> ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838  
> libsoup-3.6.1.tar.xz
>  # Locally calculated
>  sha256  
> b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  
> COPYING
> diff --git a/package/libsoup3/libsoup3.mk 
> b/package/libsoup3/libsoup3.mk
> index f8a7e26159..f2f96c2def 100644
> --- a/package/libsoup3/libsoup3.mk
> +++ b/package/libsoup3/libsoup3.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  LIBSOUP3_VERSION_MAJOR = 3.6
> -LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).0
> +LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
>  LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
>  LIBSOUP3_SITE = 
> https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
>  LIBSOUP3_LICENSE = LGPL-2.0+
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
