Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D651CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DE144043E;
	Mon,  1 Apr 2024 13:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtWv47jKfD8x; Mon,  1 Apr 2024 13:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421144052E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 421144052E;
	Mon,  1 Apr 2024 13:11:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E26E1BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A7154052E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tO3WnyGu600 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 577604043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577604043E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 577604043E
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:11:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8ABA013F8C8;
 Mon,  1 Apr 2024 15:11:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:11:48 +0200
Date: Mon, 1 Apr 2024 15:11:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZgqylOJXW4v_NyrI@landeda>
References: <20240331080302.19519-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331080302.19519-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711977111;
 bh=U4E8VRn5LuzZYYZ4NaXihfSnV3pWe5ZJRAO1xXeVHA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gc63U+RAr/WGhsgkuc4rT+kp7c7pk5aXezdbY6TVppQN12rZOXCG+l9wj9pwUw48s
 Jig+dlh149dsqU5FdEsHc/VmSZ3/nodeRGHXltTBnQCtUKwh8ojtGykMv4h/3DAbHy
 YXZYYQYD1fxuv/jQ7vhuEggVsmcCM+8Sv1n80TtMYzCrJlbwNzf48EDP/r74iOsfNx
 XbDWKx7+JQypjQoFyAAipyMI9JLiO7MeHrKVl2rcZL9pucjcAeV4QyYZwSqNjLXhnC
 CFM2C2TCOeZcCuv3smxbCuNu1VJqRn4SUmQPbnrx5J9gIs7mABx3Je2X/rGt8NxS74
 7dMWn/KNWz6LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gc63U+RA
Subject: Re: [Buildroot] [PATCH v1 1/1] package/delve: bump version to
 v1.22.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-03-31 01:03 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/go-delve/delve/releases/tag/v1.22.1
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/delve/delve.hash | 2 +-
>  package/delve/delve.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/delve/delve.hash b/package/delve/delve.hash
> index 105249f7f9..3b0798e77c 100644
> --- a/package/delve/delve.hash
> +++ b/package/delve/delve.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  58ad7a7fb42ae2ddd33e7d52dad688b249ca8a358eb73b9e48f91eda79e862a8  delve-1.20.2.tar.gz
> +sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1.tar.gz
>  sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
> diff --git a/package/delve/delve.mk b/package/delve/delve.mk
> index f261d240b2..408286e3b4 100644
> --- a/package/delve/delve.mk
> +++ b/package/delve/delve.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DELVE_VERSION = 1.20.2
> +DELVE_VERSION = 1.22.1
>  DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
>  DELVE_LICENSE = MIT
>  DELVE_LICENSE_FILES = LICENSE
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
