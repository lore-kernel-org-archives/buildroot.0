Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE5FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8081660E9C
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8081660E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2125960A35;
	Sun, 12 Sep 2021 07:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esWpbpUfdZkE; Sun, 12 Sep 2021 07:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7184B608DA;
	Sun, 12 Sep 2021 07:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5F401BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9588D403BD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXPr6G-EhBIW for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:24:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F475403A6
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:24:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 62BACB0053B;
 Sun, 12 Sep 2021 09:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631431460;
 bh=AHypOLppBYDBd+CR+9Wq7c1IATRQJdvxMmyS9r8RGkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IFAh5IwjEjDpQF471Xj/tq6Huy5aSNOgKFJh8/DhEkDOlom0lHPSFqh9ED6JXxVG9
 DeOHgrbMnD6Z6rRu2mqVWsCkHQluHGM/BCNhWG2C7jSzNQlyW/iBIUuBA1KXzjtOHT
 YcOCb8hR4+F6pMrDkkN9baXtSHvcmZX9V0Vn6Ul9QejWn7LyjLcMbfEAldKHfHj1nz
 A1aJEa2dEYSzanA1cDbLE/uKvQiIR1UMSuZKgBCjY5upd2w6H7gP1C4+LixZR/GIpS
 RuNf26bb/CLrDqXG06wBV85oCzvMgw6PFkSkicyiLM6GL9KCNcaO7PZDJREZe0twRA
 9clkRm3zpCxXQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 09:24:14 +0200
Date: Sun, 12 Sep 2021 09:24:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210912072414.GZ1053080@scaer>
References: <20210911211724.731848-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911211724.731848-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rpm: fix recursive dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-11 23:17 +0200, Fabrice Fontaine spake thusly:
> Fix the following recursive dependency added with commit
> 429e247b869027f6ecd4efa0f31bccd2765e3875:
> 
> package/openssl/Config.in:4:error: recursive dependency detected!
> package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBGCRYPT
> package/libgcrypt/Config.in:1:	symbol BR2_PACKAGE_LIBGCRYPT is selected by BR2_PACKAGE_OPENSSL
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpm/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 2af04b41b4..adaf7c96ec 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_RPM
>  	depends on BR2_PACKAGE_LUA_5_3
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_FILE
>  	select BR2_PACKAGE_POPT
>  	select BR2_PACKAGE_ZLIB
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
