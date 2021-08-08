Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE621C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:29:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E98260FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E98260FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33FB060709;
	Sun,  8 Aug 2021 09:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4P_HlBJfbCik; Sun,  8 Aug 2021 09:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9630760637;
	Sun,  8 Aug 2021 09:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C03F1BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF16D40278
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbGIAnjiA_ss for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:29:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 214BE40237
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:29:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C3995780357;
 Sun,  8 Aug 2021 11:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628414982;
 bh=O7oQYjWD917FswTaSrHH6FSPmxa0qL7y6f1bE7Oi5NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJuaGw/Lk4BrvCCk5pKXxbxBCOGqZO9/c6NrncovUoke/BLqkalLcPMYqrAkLQ0Bo
 nKJBNM55+hpnm0Nm3UrQHHlyowHqIxgdkKbW4hJpORGvStKUOaTCIAMd5CslYm7mBg
 329DgxGQOuMyrdh0W2eSojxEK+A14ZQYEL0ddC4ee/zYakYI9JXS7UZpQoORxunFLb
 xBNkAagfrDEW9sknQVfueCmnKUW1So5fd8a8I0K/7vW2mxHcv6vQg1zUL231b7uXYq
 qkqQIFOdfKukU9fDaHXBNKtirR51Ns7F8r5AkpbfHTHJkH+fAUTvezXhY+D8MGQBwX
 RJ1nkXKxn7vog==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Aug 2021 11:29:35 +0200
Date: Sun, 8 Aug 2021 11:29:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20210808092935.GK27036@scaer>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Tomi, All,

On 2021-08-06 15:50 +0300, Tomi Valkeinen spake thusly:
> We can drop all the patches as they have been sorted out in upstream.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
[--SNIP--]
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index 871ecaf85c..ab0158d1ed 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KMSXX_VERSION = 548905611c130ea9d31929a0caf7a198d8bac462
> +KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
>  KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
>  KMSXX_LICENSE = MPL-2.0
>  KMSXX_LICENSE_FILES = LICENSE
> @@ -13,9 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
>  KMSXX_CONF_OPTS = \
>  	-Dkmscube=false \
>  	-Dpykms=disabled \
> -	-Domap=disabled \
> -	-Duse-system-fmt=true \
> -	-Duse-system-pybind11=true

Those options have been dropped upstream. Does that mean that they now
always use a system-provided fmt and pybind11, or that they always use
their bundled versions?

The answer is mixed.

For fmt, the option was dropped entirely, and upstream dropped their
bundled version in fdffbcdc0b0e (Use system libfmt). So we can indeed
drop -Duse-system-fmt=true.

But for pybind11, the option we added in our patch, was added with a
different name upstream. We had 'use-system-pybind11' as a boolean, they
added 'system-pybind11' as a feature.

Applied to next, with the above changes. Thanks.

Regards,
Yann E. MORIN.

> +	-Domap=disabled
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
