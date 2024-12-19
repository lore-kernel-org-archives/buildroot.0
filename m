Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE0E7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 23:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D858C608DD;
	Thu, 19 Dec 2024 23:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKsZNpQyA4zm; Thu, 19 Dec 2024 23:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF2E607DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF2E607DF;
	Thu, 19 Dec 2024 23:32:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1198730
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1BAB40B93
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLYkyfpT4TiF for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 23:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 214E9409EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214E9409EF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 214E9409EF
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:31:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7301D19F5BE;
 Fri, 20 Dec 2024 00:31:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56272])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 00:31:54 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 00:31:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219220910.402990-1-james.hilliard1@gmail.com>
References: <20241219220910.402990-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a04288cf38f63ccc9c232d61130a58a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734651115;
 bh=tU2O0fKPadmWk0lctrjTjbaZI94t+H2HoqnFuaWD6w8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VJlWttKOKwC0a0qveDoCPIVy20MB2l5gx1DL2pORhIlrCCOTjZboOsgEoQA77wiUo
 y01at6d/9x033Gg8nn1sfqdylsxKgWF2qfKBn/ItRSQs5h1sgMKIhWySKnMW9vp7SB
 eirYFtnsAsHqgqe3xxC29emjxnAQinbXyU9A3TstcqAZ9cjBA3jW2SYracDOXW2ce8
 VvjiEcEWy4ydlLM8fi6iglIVabAlMzsZKzEfpR0YrpWft5yzgqwlIvJnog0GyZs4zD
 ThdxXKBvQGyfK9Vzj8EL3yiK5dHRWb5CzedTFfrv2e3n7sR7LyKdSzsH5yVdVNVVHC
 mwGjWG+YLZJhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VJlWttKO
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: bump to version
 1.78.1
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

On 19/12/2024 23:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/tailscale/tailscale.hash | 2 +-
>  package/tailscale/tailscale.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tailscale/tailscale.hash 
> b/package/tailscale/tailscale.hash
> index a5492684a1..e2d600f03e 100644
> --- a/package/tailscale/tailscale.hash
> +++ b/package/tailscale/tailscale.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 46b68067a8b91f0e32ea8c23c292b9eb6675fac4c7bba5471a1f787bc3ad7412  
> tailscale-1.76.1-go2.tar.gz
> +sha256  
> 4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  
> tailscale-1.78.1-go2.tar.gz
>  sha256  
> d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  
> LICENSE
> diff --git a/package/tailscale/tailscale.mk 
> b/package/tailscale/tailscale.mk
> index 91290ba4a3..55f8ac4ab9 100644
> --- a/package/tailscale/tailscale.mk
> +++ b/package/tailscale/tailscale.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -TAILSCALE_VERSION = 1.76.1
> +TAILSCALE_VERSION = 1.78.1
>  TAILSCALE_SITE = $(call 
> github,tailscale,tailscale,v$(TAILSCALE_VERSION))
>  TAILSCALE_LICENSE = BSD-3-Clause
>  TAILSCALE_LICENSE_FILES = LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
