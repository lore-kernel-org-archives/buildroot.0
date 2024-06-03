Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5EFC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74CB2402D4;
	Mon,  3 Jun 2024 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2nk4aI3i8id; Mon,  3 Jun 2024 09:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B09840463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B09840463;
	Mon,  3 Jun 2024 09:24:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 608C41BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CCE38113C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVte6QzkXiWB for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4826C8112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4826C8112C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4826C8112C
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:24:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 883F513F8AD;
 Mon,  3 Jun 2024 11:24:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 11:24:27 +0200
Date: Mon, 3 Jun 2024 11:24:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl2Ly8g2Ayl9IF4-@landeda>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717406669;
 bh=Phi2qIvgVlZdxtEGIGIqwBS9uZuJN1pKbAsSSF5qsPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gzse7jdwJ55515AP9E9nYhCnduQwgoMYah7Re5EjqphYzed/Uycy1PC3pZ+KukBHW
 xyI8HU/qakJ683MC4iLdAMy/NmVNWuO0nqw7IkpzB7a+tyQoZZlq6voZtoLw91CfiB
 8svFOh4IdIMNtgitZevdvGp+zYHaU6cNgZjZXWYE/vYcG9rWpDeq8SjoI4akS0v0A6
 vgFpy59MXqhWlH9eQ8DDg2EEt3Naa+pTzKzip3NeW7jhIxEZ7wJ39oiSdf0WhRvhbd
 kuIXH6yLsjHvpsgFCywER+5P7GJHUEn59NnSuoVg5VJ3wygEPcjfld4HHnmv8LYC/d
 uMuKn51aShU4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gzse7jdw
Subject: Re: [Buildroot] [PATCH 01/23] package/doom-wad: drop reference to
 ftp.idsoftware.com
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

Peter, All,

On 2024-06-03 09:17 +0200, Peter Korsgaard spake thusly:
> The server was decommisioned in 2017 and is unlikely to ever come back, so
> drop the reference:
> 
> https://www.doomworld.com/forum/topic/96999-rip-ftpidsoftwarecom/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series applied to master, thanks. I've additionally replied to
individual patches where I did some changes.

Regards,
Yann E. MORIN.

> ---
>  package/doom-wad/doom-wad.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
> index f348fc2207..5d37a6a6d4 100644
> --- a/package/doom-wad/doom-wad.mk
> +++ b/package/doom-wad/doom-wad.mk
> @@ -7,7 +7,6 @@
>  DOOM_WAD_VERSION = 1.9
>  DOOM_WAD_SOURCE = doom$(subst .,,$(DOOM_WAD_VERSION))s.zip
>  # Official server currently unavailable
> -# DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
>  DOOM_WAD_SITE = http://www.jbserver.com/downloads/games/doom/misc/shareware
>  
>  define DOOM_WAD_EXTRACT_CMDS
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
