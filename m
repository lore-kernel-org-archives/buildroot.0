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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388AFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0A560295
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC0A560295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A333E403FD;
	Sun, 12 Sep 2021 07:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WolYqRhoWFlB; Sun, 12 Sep 2021 07:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E61401F8;
	Sun, 12 Sep 2021 07:50:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE741BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E7B40112
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkwJkI3X_3X7 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:50:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D9CA400AF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:50:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 862EFB004D5;
 Sun, 12 Sep 2021 09:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631433005;
 bh=+XmYj/e+Y/MEUeG0UDMU2M9P+0uEGKmx8ofCyzPYdbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FzjnmEpkOB0np7s1rpF5ZnkzrOduADOPsmjWoEHJnV7nbWsuq7XpIdO662JZwNcq7
 A+crmDvIDfboaMjzrPKKu5reoI71IHibCy9nE+N62bqIQXeb9oBhO/nPACnZc8G46i
 MhBa3S6J3eEgi5vXP6Q38+FCmI9YdniiHRYW9XKipR0W/xop07FPU8uJ+WXA2TOJgY
 AJtalIY55ImblwWucg+k/uRGiCeBRvbpd6HOUCM97c7s7FOJaC1fIDsBpNovAyeXvn
 tQ1T3U2sjXuIGNaZE4rVzkXISs4YXscx/RSAx7D5cveyifbtaHG42yAUZz20R4OwVo
 rOMM+Yr+Li9gg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 09:50:01 +0200
Date: Sun, 12 Sep 2021 09:50:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20210912075001.GB1053080@scaer>
References: <DM6PR08MB39939D38806EB3DFF8EB65D6A0D89@DM6PR08MB3993.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR08MB39939D38806EB3DFF8EB65D6A0D89@DM6PR08MB3993.namprd08.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rpm: support lua v5.3+
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

James, All,

On 2021-09-11 20:42 -0400, James Knight spake thusly:
> The version bump [1] for the rpm package to v4.17 added the newly
> required dependency to Lua; however, the change limited support to only
> v5.3 (and not higher). Correcting support for v5.3 or higher by making
> a dependency on the Lua package and omitting older versions which are
> not supported (specifically, the v5.1 series)
> 
> [1]: 429e247b869027f6ecd4efa0f31bccd2765e3875
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpm/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 2af04b41b4be8f779912644245e3ee5f2a3422b8..e4a7e00a4c705f31a7ab47aa64a4bec1f86c1ec0 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,6 +1,6 @@
>  comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -		|| !BR2_PACKAGE_LUA_5_3
> +		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_USE_MMU
>  
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_RPM
>  	bool "rpm"
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	depends on BR2_PACKAGE_LUA_5_3
> +	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> -- 
> 2.28.0.windows.1
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
