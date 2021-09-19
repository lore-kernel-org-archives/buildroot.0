Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C11C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653E260ED7
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 653E260ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C574051D;
	Sun, 19 Sep 2021 08:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5H2ISKdFIFO; Sun, 19 Sep 2021 08:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E63640513;
	Sun, 19 Sep 2021 08:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B53FD1BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A401940513
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOFf0hBj5cIT for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:11:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7648840510
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:11:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 356F92003A4;
 Sun, 19 Sep 2021 10:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632039089;
 bh=lEO2kVpGdMDskEVlLB7cgnpKv+1mWZK3TMrR7oWlP2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5LY3qVg4pIoU7TwDtY2vommW+1NohO0RtUAjCgbWYotQuFlawkwpIi2O/K0oKrms
 3Jl2yTtNCowlv3YoJTp+ASFEpCGM1cgkKfX4+E+K64rvRpZ75kRtFaIKF7tZIWGwpE
 MqbLEqge+ONCBWdTcjrdVJxL2Lsvmw6m0ZoQvRhugM6gILK4f4l944YC3oIGHerGJx
 7uKK1lTuA03Jf9Z7nWVUXPkFwR9sBcQM3VuRLG8SlpWUSgsO/8HeLuwrMaYAy0Ttze
 ajQzy4WIuiU0solnfsRHS5nbnjYnTYdNK7joNWXfsZnwZQS4XrdZAwY2BfUASz/t6/
 R/nFDLBey6rqg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 10:11:20 +0200
Date: Sun, 19 Sep 2021 10:11:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210919081120.GJ1053080@scaer>
References: <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919005154.461600-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Giulio, All,

On 2021-09-19 02:51 +0200, Giulio Benetti spake thusly:
> To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
> since 'switch' blocks are pretty wide and lead to build failure. This way
> 'switch' blocks will have a 32-bit addressing by default instead of the
> standard 16-bit. This can be done only with m68k gcc version >= 7.x
> because gcc flag used to fix this(-mlong-jump-table-offsets) is
> available only from that version on.
> 
> Fixes:
> http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I've reworded the commit log (expain problem first, explain how it is
fixed them; add upstream BZ references, and non-propagation notes).

I also added a comment in Config.in about this new dependency.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * add gcc >= 7.x dependency to Config.in as suggested by Yann Morin
> * improve commit log according to Config.in change
> ---
>  package/mesa3d/Config.in | 1 +
>  package/mesa3d/mesa3d.mk | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index eb7c1eef46..e364f435c7 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 1a9e355641..f1862aed69 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -259,4 +259,13 @@ else
>  MESA3D_CONF_OPTS += -Dzstd=disabled
>  endif
>  
> +MESA3D_CFLAGS = $(TARGET_CFLAGS)
> +
> +# m68k needs 32-bit offsets in switch tables to build
> +ifeq ($(BR2_m68k),y)
> +MESA3D_CFLAGS += -mlong-jump-table-offsets
> +endif
> +
> +MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
> +
>  $(eval $(meson-package))
> -- 
> 2.25.1
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
