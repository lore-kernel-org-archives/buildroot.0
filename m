Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E02EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08FE60C0F;
	Sun, 25 Jun 2023 13:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08FE60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At52RLnej7CV; Sun, 25 Jun 2023 13:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EEF660BEA;
	Sun, 25 Jun 2023 13:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEF660BEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D47671BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC16C415E7
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC16C415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irlsEdMEuRhd for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A553410C6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A553410C6
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:15:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3ACFB00585;
 Sun, 25 Jun 2023 15:15:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 15:15:27 +0200
Date: Sun, 25 Jun 2023 15:15:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oleg Lyovin <ovlevin@sberdevices.ru>
Message-ID: <20230625131527.GM24952@scaer>
References: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
 <20230625124848.1423168-2-ovlevin@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687698932;
 bh=eInE87tJUJgjg7RUl6eK8cXi5wh/Q/zqGi+c3iI1MIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AE+b0M8leANBhZazY9wt2dg258Z9EQje1SI5wgauqQfySQqBdFt0DWL+QUjGb85Gg
 Doy5QOv7CRcKKilZYFZgtmeWoM05ZfudtK6emXa3zksjZt6dpQUMD8ZYSkTokEvHC9
 xLP9jBwdHStfc0frQrudobk9kc9EVFlVjYHPWL5w2ChstEC1mfxMeo9G/tasYktQ3z
 tOHMh8cLuVgIc6TQI191eHG3oeMwbqcg3uN6XGuASLABeuKUZVZH/1RTqCb6nzXI9N
 IK407fqgsZZJ1zcglNHRkWi6AuNKfwamTihwccKtR60qaC8356kBeRu+KO+QT1nBH4
 9bMpT9/mIHy4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AE+b0M8l
Subject: Re: [Buildroot] [PATCH 2/2] package/libcgroup: fix build with musl
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oleg, All,

On 2023-06-25 15:48 +0300, Oleg Lyovin via buildroot spake thusly:
> libcgroup depends on fts API which is missing in musl libc
> and provided by musl-fts package.
> 
> This patch makes libcgroup dependent on musl-fts for 
> non-glibc configurations.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> ---
[--SNIP--]
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index fb0b646c51..d67710ec1e 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -36,4 +36,9 @@ else
>  LIBCGROUP_CONF_OPTS += --disable-pam
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +LIBCGROUP_DEPENDENCIES += musl-fts
> +LIBCGROUP_CONF_ENV += LDFLAGS=-lfts

I think it would be better to use LIBS rather than LDFLAGS. Could you
check that works too, and report here? If it works, I can change when
applying; if it does not work, I can apply without changing. ;-)

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.34.1
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
