Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE49CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDF2641142;
	Sat, 23 Sep 2023 20:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF2641142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnFHr0WTDpIV; Sat, 23 Sep 2023 20:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24911409F8;
	Sat, 23 Sep 2023 20:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24911409F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE751BF292
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7187F4188F
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7187F4188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfEz0heZzU6T for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 20:31:25 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49B9A4188C
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 20:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B9A4188C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F08E07804FD;
 Sat, 23 Sep 2023 22:31:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Sep 2023 22:31:18 +0200
Date: Sat, 23 Sep 2023 22:31:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jens Maus <mail@jens-maus.de>
Message-ID: <20230923203118.GE1469982@scaer>
References: <20170608153557.30726-1-mail@jens-maus.de>
 <20230923165214.4014466-1-mail@jens-maus.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923165214.4014466-1-mail@jens-maus.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695501082;
 bh=VWBdgSXEb8fa0KEtthn2dL1ZqQ8HEzKD2tAFBSHGla8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RF6yxtiay+ln7ImsR4JVrnw/HwMBZHujiZ7KGKGzZi0nMYt92Y2e/gIOq30tktTkV
 wuHPk6IzcxcvTSez45/111LhuAcdkN2ldQtMOVDmn6tdLNIzH9Js11qlb/0Vz11PW+
 W4GIAeW4GRZDSl5CQxH4IyZ8Jugec7DA8qq3rugxp1n9B8GbKcj5IC8c0yAy7pZJg7
 GlVw3EKFoQ3+8pEh2eI0MIV53rHpn6vopFX+GIq+IiA+qPIzIX31gqIju3cYxfBEL/
 mhER8pf17DHr3pM27YLZaKw+6Uisa7JCN2B05+JyU0Vpb8gwtOw38ZtRZ6jKF8vRyO
 8208JWD+cIW0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RF6yxtia
Subject: Re: [Buildroot] [PATCH v2] package/nut: package/nut: specify
 --with-user/group when building NUT
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jens, All,

On 2023-09-23 18:52 +0200, Jens Maus via buildroot spake thusly:
> This commit fixes a problem where the NUT package couldn't be
> used as a NUT server due to the fact that the default group for
> nobody is "nogroup" and not "nobody" like the internal default
> of NUT. Thus, when starting a NUT server daemon the daemon starts
> with incorrect group permissions. This commit fixes this
> shortcoming by introducing a dedicated 'nut' user and 'nut' group
> to drop priviledges to it.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - added NUT_USERS with nut/nut user and group (Yann)
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  package/nut/nut.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index fb98ba04f0..4c322aeb85 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
>  NUT_CONF_OPTS = \
>  	--with-altpidpath=/var/run/upsd \
>  	--with-dev \
> -	--without-doc
> +	--without-doc \
> +	--with-user=nut \
> +	--with-group=nut
>  
>  NUT_CONF_ENV = \
>  	ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
> @@ -34,6 +36,10 @@ NUT_CONF_ENV = \
>  	ac_cv_func_strncasecmp=yes \
>  	ax_cv__printf_string_null=yes
>  
> +define NUT_USERS
> +	nut -1 nut -1 * - - - NUT user
> +endef
> +
>  ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
>  NUT_CONF_OPTS += --with-drivers=auto
>  else
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
