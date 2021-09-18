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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E05AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:28:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87376127B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D87376127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9007484209;
	Sat, 18 Sep 2021 15:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciEccQOQcKS6; Sat, 18 Sep 2021 15:28:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA08484202;
	Sat, 18 Sep 2021 15:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0DD11BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E41F606B6
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ruc5fzBaOXeQ for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:28:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA5E660662
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:28:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CD290B0054E;
 Sat, 18 Sep 2021 17:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631978892;
 bh=oXTb/8XdDT9gI7mBiHPITQj9e341iNG4tZZx8tmkiBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=devGGIUhjfSGr7poBUnwHkmo/MIeax0dEZbpiSh45MbMyXg2i7cujLLz3lmrMgIzw
 95JQyR9237CEKi4HPYhkPaRxINeoS8UpUi+j6XkmU7o2tAyq9Nwfafams0YlhxMP9L
 mCUVoAEIskXDEk2oGwSWv0PJYWJhvhv+NCIOCBsB+tlEKha0bvQbl0A09um9sggcWq
 SVSfwVFEYTj1Pe7n5FnwM5phipnpOMp0Nf2u0TiUvDqxYnE2HABipTkfKNTVDQ09Um
 iLwh3+kx5g740Y32qtT8o99NUO/wmaPfAsO42aB/nFM04TrwVUcie2fXBr77i4U3ri
 xLwSZpmEbA0Ig==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:28:03 +0200
Date: Sat, 18 Sep 2021 17:28:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918152803.GW1053080@scaer>
References: <20210915213435.31580-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915213435.31580-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/wayland-protocols: bump version
 to 1.23
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-15 23:34 +0200, Peter Seiderer spake thusly:
> - convert to meson (as no configure script is provided, alternative
>   would be to enable autoreconf)
> - disable tests
> 
> For details (since 1.21) see [1], [2].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041972.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wayland-protocols/wayland-protocols.hash | 8 ++++----
>  package/wayland-protocols/wayland-protocols.mk   | 6 ++++--
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
> index fd6b9925eb..b76bafb437 100644
> --- a/package/wayland-protocols/wayland-protocols.hash
> +++ b/package/wayland-protocols/wayland-protocols.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041815.html
> -md5  8196416baac07cd833bcb86b69da41a7  wayland-protocols-1.21.tar.xz
> -sha1  6e0e2a05edb43d32e3b2e3f681ef266a287a186e  wayland-protocols-1.21.tar.xz
> -sha256  b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5  wayland-protocols-1.21.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
> +md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
> +sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
> +sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
>  sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 3d7a0e472d..41ab1e1c99 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAYLAND_PROTOCOLS_VERSION = 1.21
> +WAYLAND_PROTOCOLS_VERSION = 1.23
>  WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
>  WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
>  WAYLAND_PROTOCOLS_LICENSE = MIT
> @@ -12,4 +12,6 @@ WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
>  WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
>  WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
>  
> -$(eval $(autotools-package))
> +WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
> +
> +$(eval $(meson-package))
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
