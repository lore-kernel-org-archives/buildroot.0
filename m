Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B7C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 19:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18F24005C;
	Tue, 30 Apr 2024 19:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwfGjioo8uan; Tue, 30 Apr 2024 19:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A313840164
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A313840164;
	Tue, 30 Apr 2024 19:03:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD7B1BF29A
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 19:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 682D560B07
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 19:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVTNkCHl74jc for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 19:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6607860B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6607860B05
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6607860B05
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 19:03:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA0AF13F8C6;
 Tue, 30 Apr 2024 21:03:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 21:03:41 +0200
Date: Tue, 30 Apr 2024 21:03:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjFAjTl6XLpBxjF1@landeda>
References: <20240427161850.158702-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427161850.158702-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714503825;
 bh=mkmVf5ZigtlePlGGdsgbSn92PpxF7VkmkJjiIjnXads=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsSKvk2gU77oexGxru3LvS/tlL4MRf99d7Yq8Kmo+NBk5T9t8xrV15tu75C5tjq/P
 Q6xhKWMUAujjm4R5zIVNT1kTHdbtBQaM3L2q2S1pbGiJPqcIGpqbNA7xfBBD/jQdhz
 /xNPlv1og8pscfgYzxb3lSjRCCQm2sINl6SoBTPxrQFU7rCZUKi0/X9CrIY2rjsi51
 gPIdf0U0Raw//MMU15Mez3+KfrSx4DjPuv/GuhD8rRnqKVkUJrC61LOaeucdXQnnzC
 PPU3PPO3qxYOO2lIF8MoYH/enzGPh1JXR3tf9jOJgu5eoQLh7mrDCw3azO1LhUo4q8
 LVBthjkq64XEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DsSKvk2g
Subject: Re: [Buildroot] [PATCH 1/1] package/libunistring: bump to version
 1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-27 18:18 +0200, Fabrice Fontaine spake thusly:
> https://savannah.gnu.org/news/?id=10599
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libunistring/libunistring.hash | 4 ++--
>  package/libunistring/libunistring.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
> index 8267d56327..256fb651d5 100644
> --- a/package/libunistring/libunistring.hash
> +++ b/package/libunistring/libunistring.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
> -sha256  827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98  libunistring-1.1.tar.xz
> +# https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.xz.sig
> +sha256  632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44  libunistring-1.2.tar.xz
>  # Locally calculated
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
> diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
> index 8d5b6f54ec..05bdec71b5 100644
> --- a/package/libunistring/libunistring.mk
> +++ b/package/libunistring/libunistring.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUNISTRING_VERSION = 1.1
> +LIBUNISTRING_VERSION = 1.2
>  LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
>  LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
>  LIBUNISTRING_INSTALL_STAGING = YES
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
