Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12674C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0492605E2;
	Tue, 20 Feb 2024 21:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVBsHQqxuInY; Tue, 20 Feb 2024 21:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B856062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B856062E;
	Tue, 20 Feb 2024 21:12:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5FF01BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00AA81E1A
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UE9ytDZq0bZN for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9068581E10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9068581E10
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9068581E10
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:12:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 51F1113F88D;
 Tue, 20 Feb 2024 22:12:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:12:15 +0100
Date: Tue, 20 Feb 2024 22:12:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Martin Kepplinger <martink@posteo.de>
Message-ID: <ZdUVr89TMi6HKcC6@landeda>
References: <20240220073251.251521-1-martink@posteo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220073251.251521-1-martink@posteo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708463537;
 bh=1+GvFMqf41dza0SkPcmp+0xkCaH7EL+bq506Vi6enWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BXraBewHPm8cmtWw3+tp5MDs7DeGZJfRkoUAcELsW9EfdVXYuZs4f65v9T6+c+LB7
 T699sP6IbkNW5pA0S3BVJfIl6nSQVQpLbq+BHtzVEp1w7JZKzmSyvakeVEYBA/lsWZ
 cWXu5Rj52E/9CGK9crFglE46+QUlICNEu1zY+ydkqlTwOJrtwfYr0kbQMseHnd7x1X
 L6vzyHh5ccA/iQGfzNRvHY4sTxVc/0Ek8IbROCXBL4JU7xd4JuoZqIkpTh/UdBscKm
 NldFPp6GvMZ1n09Z0WO06CE4pIY7JiLQtrq4ygeDCr4P6bPg12LLKn6/4CPOvmHiPE
 HUpGdZkhegYcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BXraBewH
Subject: Re: [Buildroot] [PATCH 1/1] package/tslib: bump version to 1.23
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Martin, All,

On 2024-02-20 07:32 +0000, Martin Kepplinger spake thusly:
> Release notes from https://github.com/libts/tslib/releases :
> 
> This release includes libts version 0.10.5 and the following changes:
> 
>  *  new filter module: module crop
>  *  some build and security fixes
>  *  improved release procedure
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tslib/tslib.hash | 4 ++--
>  package/tslib/tslib.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> index 762fbebb26..6fe35633aa 100644
> --- a/package/tslib/tslib.hash
> +++ b/package/tslib/tslib.hash
> @@ -1,5 +1,5 @@
> -# https://github.com/libts/tslib/releases/download/1.22/tslib-1.22.tar.xz.sha256
> -sha256  aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a  tslib-1.22.tar.xz
> +# https://github.com/libts/tslib/releases/download/1.23/tslib-1.23.tar.xz.sha256
> +sha256  9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac  tslib-1.23.tar.xz
>  
>  # Locally computed
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index 45e29808bd..e8eb3beeaf 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TSLIB_VERSION = 1.22
> +TSLIB_VERSION = 1.23
>  TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
>  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
>  TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> @@ -29,7 +29,8 @@ TSLIB_CONF_OPTS += \
>  	--enable-skip=static \
>  	--enable-lowpass=static \
>  	--enable-invert=static \
> -	--enable-evthres=static
> +	--enable-evthres=static \
> +	--enable-crop=static
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.39.2
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
