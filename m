Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627BCC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 231B640518;
	Sun, 11 Feb 2024 17:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4h9PN05PoU0x; Sun, 11 Feb 2024 17:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8AB04028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8AB04028D;
	Sun, 11 Feb 2024 17:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45FEA1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 334E84072A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tTnWs2GrSh9 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DAD440727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DAD440727
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DAD440727
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:14:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6170213F88F;
 Sun, 11 Feb 2024 18:14:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:14:47 +0100
Date: Sun, 11 Feb 2024 18:14:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZckAhy1vxUx24gVB@landeda>
References: <20240211153211.2187231-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240211153211.2187231-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707671689;
 bh=KRHYq+FAut+YWvP0WaZWR7xpVHdszZQpptLSRkLJU+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ak3Xhe8NSIWICV5PggVwAJxxT60lDm5K9++x0480pk1samDX4Sarb585vO+ZatmtA
 awy3IeibzAF2wVYsX90V3Utu9/G1Hm8eTerUdBzFX5YC9t1I5oRrQ0U/aotUspcd4j
 VXWNJHuA/pdtciRbYFi+MekhVvfnezG8bWb/YmAUcZGM1Ig0ClSttDL14rx3dxl0De
 0qCxjjwlXHg4PV6ER606J3xWmvJ4EpNkKA7ZO7loGR1XN4MJBopCxV4Y/7ReKeLaKy
 KBJ72y6Mz+kY6fLMFIiXy4jo817qD0vHQG6L0TiKyh/xXFHE7bb4kuV5tE1Qr8wMQ/
 pLh6mk6jRmTFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak3Xhe8N
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.38
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

Bernd, All,

On 2024-02-11 16:32 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/58731594/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fetchmail/fetchmail.hash | 4 ++--
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
> index 9ca6b2c7a7..3c0403fa78 100644
> --- a/package/fetchmail/fetchmail.hash
> +++ b/package/fetchmail/fetchmail.hash
> @@ -1,4 +1,4 @@
> -# From https://sourceforge.net/p/fetchmail/mailman/message/37783197/
> -sha256  4a182e5d893e9abe6ac37ae71e542651fce6d606234fc735c2aaae18657e69ea  fetchmail-6.4.37.tar.xz
> +# From https://sourceforge.net/p/fetchmail/mailman/message/58731594/
> +sha256  a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9  fetchmail-6.4.38.tar.xz
>  # Locally computed:
>  sha256  6d87443b61041067a5eddb2cabf8aebff15b8b40771ad6b5e4754e607ec21b39  COPYING
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index 6d418f9739..c74b259698 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FETCHMAIL_VERSION_MAJOR = 6.4
> -FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).37
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).38
>  FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
>  FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
>  FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
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
