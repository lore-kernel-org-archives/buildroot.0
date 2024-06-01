Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCD0842AD;
	Sat,  1 Jun 2024 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olOm8m5SjBzj; Sat,  1 Jun 2024 19:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C6284559
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C6284559;
	Sat,  1 Jun 2024 19:51:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6391BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 682608208F
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AolWhSN8MHhe for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67E5E81F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E5E81F84
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67E5E81F84
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 19:51:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 96E8D13F899;
 Sat,  1 Jun 2024 21:50:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:50:57 +0200
Date: Sat, 1 Jun 2024 21:50:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zlt7oZypbkxjp2OH@landeda>
References: <20240601125951.29789-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240601125951.29789-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717271459;
 bh=ysEa+Y+/ApShzrcVyP7BrYW6icwk/8OMTSW95a+bX6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pzOrKTqqTPsklj5KIM0o208vZZfTx2ZTuuEbdg/uW2JGyEfp8mrxw/ChVaF6xkDDo
 ffH3pFCt1LjUx5RiO3aOAcPIP6xUe1sTwUtdQK2G3vsWGFmVro3bKcdhbDpXrH0i1z
 qA7SK4idynp2kzCE/eVAGJUApVFBMobD3jxhEd4s+g5rF4ZshXugAp6aV7qcxCqvIg
 5MAZLyulvL3tlhAUnxSm+YA7L36sAqxeJqLEnuXStyI3UMhQTcIXmlq8Mk9cSm/Qpa
 Pyd/u6ZwR3RkgXM0xG82JA2X3qaxyDmpBffEW4nD0rOKz7B2YOC6g9z8ogVsiy1CIw
 +xmqxdO4FQsVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pzOrKTqq
Subject: Re: [Buildroot] [PATCH] package/luarocks: bump to version 3.11.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

francois, All,

On 2024-06-01 14:59 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/luarocks.hash | 2 +-
>  package/luarocks/luarocks.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
> index fbf527021..15a44f9db 100644
> --- a/package/luarocks/luarocks.hash
> +++ b/package/luarocks/luarocks.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  25f56b3c7272fb35b869049371d649a1bbe668a56d24df0a66e3712e35dd44a6  luarocks-3.11.0.tar.gz
> +sha256  c3fb3d960dffb2b2fe9de7e3cb004dc4d0b34bb3d342578af84f84325c669102  luarocks-3.11.1.tar.gz
>  sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 4c9922914..cf5f966cd 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUAROCKS_VERSION = 3.11.0
> +LUAROCKS_VERSION = 3.11.1

This version bump looked minor, so I eyed the git repository I only
found fixes between 3.11.0 and 3.11.1, so applied to master, thanks.

Regards,
Yann E. MORIN.

>  LUAROCKS_SITE = https://luarocks.org/releases
>  LUAROCKS_LICENSE = MIT
>  LUAROCKS_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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
