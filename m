Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BF4C25B79
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 08:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B012820B2;
	Wed, 22 May 2024 08:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn-hih2-UYPW; Wed, 22 May 2024 08:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E53FC820B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E53FC820B3;
	Wed, 22 May 2024 08:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 553AF1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404B4820B3
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 08:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGhI8HzCD6Wq for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 08:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD5B7820B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5B7820B2
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD5B7820B2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 08:16:02 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 0D7EE44035D;
 Wed, 22 May 2024 11:15:36 +0300 (IDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240522070238.3282121-12-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 22 May 2024 09:02:30 +0200")
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
 <20240522070238.3282121-12-dario.binacchi@amarulasolutions.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Wed, 22 May 2024 11:15:58 +0300
Message-ID: <87bk4yntxd.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716365736;
 bh=lwT8uOCAbioRhV8eJp9dDKGXeF0iX5ZjpPhwKba+vQQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B8Jk+sQTLksZyd3Pbnsxl7A8R3Ck5t7tv/RBFxBBf+MksLa9mBl7fz/GfK2HPk1NF
 /M2B8d9+PLuRyfZFJv8LSxAqzP2T26RMlywP0YDUlJxMJzlKW7y8o9vkjmW59m6D+X
 Ds9WJlbqJG+soktqxKhjqP4P4Dyftjbky9QnnwxBB91tN36TcD+A1RroP7Ug8BlVf/
 JyRFs23KVLU/Q5SGZFL4dSwA1t709832uMdWUeIBs5NYCxvtW2v3lmnif6Nvg6bPXS
 8hvgVbPi/m6/b/UAuo/N8gNzrWSJL2mac9hSwQryOae5/Xk+j/X1W1jQfXhPu85lop
 S/Ww/VV7TDT0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=B8Jk+sQT
Subject: Re: [Buildroot] [PATCH v2 11/18] package/libnl: update the patch to
 be applied with fuzz 0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?utf-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Wed, May 22 2024, Dario Binacchi wrote:
> This commit allows the package patch to be applied with fuzz factor 0.
> The fuzz factor specifies how many lines of the patch can be inexactly
> matched, so the value 0 requires all lines to be exactly matched.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...l-workaround-to-the-libc-compat.h-copy.patch | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
> index 57d1c8747dea..4c833cfb22bc 100644
> --- a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
> +++ b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
> @@ -1,4 +1,4 @@
> -From be07fdbc9658de19304defa7538f219cd3f21ec0 Mon Sep 17 00:00:00 2001
> +From 5c984c942e2f9dca4a8380ed782519d9cb0f554d Mon Sep 17 00:00:00 2001
>  From: Baruch Siach <baruch@tkos.co.il>
>  Date: Sun, 12 Mar 2017 08:52:20 +0200
>  Subject: [PATCH] Add musl workaround to the libc-compat.h copy
> @@ -12,26 +12,25 @@ definitions will be needed. See the Buildroot iproute2 patch
>  package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch.
>  
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
> -musl fix must go to the kernel first.
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I think this patch is not needed anymore since libnl version 3.5.0.

I have not tested though.

baruch

>  ---
>   include/linux-private/linux/libc-compat.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/include/linux-private/linux/libc-compat.h b/include/linux-private/linux/libc-compat.h
> -index 9bed5b6ae4d9..e2562a819464 100644
> +index a1599911e7a9..f6df7193b8b4 100644
>  --- a/include/linux-private/linux/libc-compat.h
>  +++ b/include/linux-private/linux/libc-compat.h
> -@@ -49,7 +49,7 @@
> +@@ -50,7 +50,7 @@
>   #define _LIBC_COMPAT_H
>   
>   /* We have included glibc headers... */
>  -#if defined(__GLIBC__)
>  +#if 1
>   
> - /* Coordinate with glibc netinet/in.h header. */
> - #if defined(_NETINET_IN_H)
> + /* Coordinate with glibc net/if.h header. */
> + #if defined(_NET_IF_H) && defined(__USE_MISC)
>  -- 
> -2.11.0
> +2.43.0

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
