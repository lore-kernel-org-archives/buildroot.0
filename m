Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE0FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9F761074
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E9F761074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BCB240433;
	Sat, 18 Sep 2021 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQ6HZ2Alq4fE; Sat, 18 Sep 2021 20:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C2C415CB;
	Sat, 18 Sep 2021 20:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED0B1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF0381B17
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVLs_OuxNG9O for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:14:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D8D681B26
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:14:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6494B004FF;
 Sat, 18 Sep 2021 22:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631996041;
 bh=3ppgciJ66nGeAjUqyUn/odaN7DYfMucfgfurkqgxSzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWVvX8/xUfmw/4zkNQcr9IEVNGjwitEwFzS39DKzQzw9L82OrYxO56ziSGdmgaqzT
 kKn+B7J1ZbrI/sgXjJimnPQqP+MHrIsO2Mf2feIp1OR5hm06aRvDO0YdBi9/iaKmmd
 Oqkj7kEhIivDI9Sc5GrMRrTpmmOM0vsSm/uLEzY7NxGa4lexL9pdjXXOQdc1uP8w6D
 qE9WOx3lqvGta8JeIHJ8lM3R7dxhN3t3klsrdVaMG1eKY0LPBHh7NViEdvKaYywQFQ
 F21EpanjaSL9SqTMeMlja4fWa9tw01oTXwryNKvhUqKiZeBSR/d8TWsKFdekVKPwDU
 6n8B5umMRB6JA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:13:57 +0200
Date: Sat, 18 Sep 2021 22:13:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918201357.GM1053080@scaer>
References: <20210914210423.29792-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914210423.29792-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.0
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

Peter, All,

On 2021-09-14 23:04 +0200, Peter Seiderer spake thusly:
> - add new optional wayland, wayland-protocoll and libx11 dependencies
>   in case the debug gui is enabled (libgtk3 available)
> 
> For details see [1], [2].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041971.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libinput/libinput.hash |  6 +++---
>  package/libinput/libinput.mk   | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 8b6a5466ed..7d57ae9b2d 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html
> -sha256  9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb  libinput-1.18.1.tar.xz
> -sha512  450e38c0f8245aa0165a8047d25aebee646332f0f2ed442bb2d1bd3e723c2082b6d00d6e3bda308981ece8e29b5cddbd56eab900d2b7497705a45fc27b281828  libinput-1.18.1.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html
> +sha256  3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb  libinput-1.19.0.tar.xz
> +sha512  daf42ce797f2b5aef8d6f7a5c0d967590581e6ac12c26fa6bde5fbc619d75319e39ca55d65d5347e554dd6a48b91f5fed4d3167eabef8ad1ebc43bc0c3e8e220  libinput-1.19.0.tar.xz
>  
>  # License files
>  sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 844a4ae8ba..3ab1a2c38f 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBINPUT_VERSION = 1.18.1
> +LIBINPUT_VERSION = 1.19.0
>  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
>  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
>  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
> @@ -17,6 +17,15 @@ LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
>  ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>  LIBINPUT_CONF_OPTS += -Ddebug-gui=true
>  LIBINPUT_DEPENDENCIES += libgtk3
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +LIBINPUT_DEPENDENCIES += wayland
> +endif
> +ifeq ($(BR2_PACKAGE_WAYLAND_PROTOCOLS),y)
> +LIBINPUT_DEPENDENCIES += wayland-protocols
> +endif
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> +LIBINPUT_DEPENDENCIES += libx11
> +endif
>  else
>  LIBINPUT_CONF_OPTS += -Ddebug-gui=false
>  endif
> -- 
> 2.32.0
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
