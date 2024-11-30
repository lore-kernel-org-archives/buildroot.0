Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44ED7360F
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 22:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41D4614B5;
	Sat, 30 Nov 2024 22:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hver_jKnhQkc; Sat, 30 Nov 2024 22:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F195614B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F195614B2;
	Sat, 30 Nov 2024 22:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3480271F
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 165FF848CE
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5GT_ONLUrPj for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 22:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D55A848BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D55A848BE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D55A848BE
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DD44120039F;
 Sat, 30 Nov 2024 23:38:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60726])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 Nov 2024 23:38:05 +0100
MIME-Version: 1.0
Date: Sat, 30 Nov 2024 23:38:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241129141354.913694-1-aperez@igalia.com>
References: <20241129141354.913694-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <19fb97f95956ea1e244fdc097349a427@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733006287;
 bh=YSYXxrqRHxbap9oAZuznTWoyDXElofrPtVac83AkjY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zgy+PvsQ8LE+Qu5A0ouKCXM5ScIZlnMeME/WfJeIjwKfXcIyfqLSqbXxmIZ+XQGyt
 g7nnery/63TP137RXjoxoTmWZVf2oVyoQmp9ED7nmZHVvu97g+nXd5Ng3Ma2Y+uoPf
 HIbK9ZqUREkLwBA4uInQC0ngmzJ0vgUjikDjRhnq0HC6AJGgwx6VgijGicPMzUADWq
 44rNJyOt/lGl5qJH3wwKPWrD1XeQmnoM8Kbu8m6mUxplKdpTTsUBwr0CiV9QxYfl0w
 tg3Fbh8cKCoTBY7T1+E2rjjU+25oJcbUWSg5dy37PKlVZRzkJHvjeDzaWBEiOrC1dd
 iAFW/GVqrTR1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zgy+PvsQ
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: bump to version
 0.11.0
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

On 29/11/2024 15:13, Adrian Perez de Castro wrote:
> This version adds support for creating overlay mounts (which requires
> running with user namespaces available), and fixesd to I/O operations
> on sockets. Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.11.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

> ---
>  package/bubblewrap/bubblewrap.hash | 6 +++---
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash 
> b/package/bubblewrap/bubblewrap.hash
> index 37276046b8..b2b88ffe92 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,6 +1,6 @@
> -# Locally generated after checking GPG signature from
> -# https://github.com/containers/bubblewrap/releases/tag/v0.10.0
> -sha256  
> 65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b4be54b0c45565471  
> bubblewrap-0.10.0.tar.xz
> +# Also checked GPG signature from
> +# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
> +sha256  
> 988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  
> bubblewrap-0.11.0.tar.xz
> 
>  # Hash for license files:
>  sha256  
> b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  
> COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk 
> b/package/bubblewrap/bubblewrap.mk
> index 94ae72d4d2..ea46d7a127 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BUBBLEWRAP_VERSION = 0.10.0
> +BUBBLEWRAP_VERSION = 0.11.0
>  BUBBLEWRAP_SITE = 
> https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
