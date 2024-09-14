Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67770C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27327402E8;
	Sat, 14 Sep 2024 12:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJCq36AHWGov; Sat, 14 Sep 2024 12:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C54404F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C54404F3;
	Sat, 14 Sep 2024 12:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 682EC1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643B860769
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYf9n144O5qI for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:45:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18826606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18826606E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18826606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:45:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2CAE6780503;
 Sat, 14 Sep 2024 14:45:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 14:45:24 +0200
Date: Sat, 14 Sep 2024 14:45:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZuWFZML5M4lxIdAg@landeda>
References: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
 <20240908144815.3822467-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240908144815.3822467-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726317931;
 bh=vyAKLePe+Y6NEfEfW0TnmsG58pNnBiHecQRMue+0H0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=abVf1KQSExNdROANVJQVY4iD79vzmva3u8YDPxvFkX4eJTMouuayyimgEUqHEbbGD
 aBbfymR2Fnycvm79Hsm3MRjPId+1SWnyi8tTQ4O7ylMFxXVDsBA8kRmN2gmgbtTUQl
 8TSysfob6i3I6NCTYzxzYtmX6JMbu915xyrCL5Nr8POG3VeQFXXwQDmr4c1atRt2xE
 cVEArxlBSeZo578MtyE9W7UGYWdTaJPyM24pffJIYgPp29oK2PzLmpOeU18CMQs48l
 SDFLjLke+FrxOegvNDE8xkGfMCkMZbjJ+MzCsnIsEBJj8ZVQd0IYheA+FtCAWwwQ4p
 bJG7RtXbE/rEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=abVf1KQS
Subject: Re: [Buildroot] [PATCH v4 2/2] package/ipmitool: use versioned or
 custom PEN registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-08 16:48 +0200, Dario Binacchi spake thusly:
> The previous default URL used for the PEN registry was not stable and
> could change at any time, making it unacceptable to have to update its
> hash every time.
> 
> With this patch, if the PEN (Enterprise numbers) registry is installed
> by the iana-assignments package, ipmitool will use it. Otherwise, the
> user can provide a custom file named enterprise-numbers to be placed
> under /usr/share/misc/ of the overlay rootfs.

As discussed IRL, I've made the location to always be the same, whether
the PEN is provided by the iana-assignment package, or by an overlay (or
whatever), and modified the comment in the help text accordingly.

> Downloading such a file is no longer supported.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> 
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>   - Drop BR2_PACKAGE_IPMITOOL_PEN_REG_URI and mark as a legacy option.
>   - Drop IPMITOOL_DEPENDENCIES += iana-assignments.
>   - Add IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc in case of
>     custom PEN.
>   - Use IANA PEN registry in case BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
>     is enabled.
>   - Update the commit message.
> 
> Changes v2 -> v3:
>   - Use by default enterprise-numbers from iana-assignments package.
>   - Alternatively allows to use a local PEN registry file.
>   - Don't support URL path for PEN registry.
> 
> Changes v1 -> v2:
>   - use an enterprise-numbers file versioned
> 
>  Config.in.legacy             | 12 ++++++++++++
>  package/ipmitool/Config.in   | 18 ++++++------------
>  package/ipmitool/ipmitool.mk | 20 ++++++--------------
>  3 files changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 7513aa7efd66..ece342bb12d9 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -189,6 +189,18 @@ config BR2_BINUTILS_VERSION_2_40_X
>  
>  comment "Legacy options removed in 2024.08"
>  
> +config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
> +	string "IANA PEN registry move to iana-assignment package"
> +	help
> +	  Installation of the IANA PEN is now handled by the
> +	  iana-assignment package; to install a custom PEN,
> +	  use a rootfs-overlay for example.
> +
> +config BR2_PACKAGE_IPMITOOL_PEN_REG_URI_WRAP
> +	bool
> +	default y if BR2_PACKAGE_IPMITOOL_PEN_REG_URI != ""
> +	select BR2_LEGACY
> +
>  config BR2_PACKAGE_MIDORI
>  	bool "midori has been removed"
>  	select BR2_LEGACY
> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> index 9516ff8596d3..5cbcf8e535d4 100644
> --- a/package/ipmitool/Config.in
> +++ b/package/ipmitool/Config.in
> @@ -5,22 +5,16 @@ config BR2_PACKAGE_IPMITOOL
>  	  IPMItool provides a simple command-line interface to
>  	  IPMI-enabled devices.
>  
> +	  Note: If the PEN (Enterprise Numbers) registry is installed
> +	  by the "iana-assignments" package, ipmitool will use it.
> +	  Otherwise, the user can provide a custom file named
> +	  enterprise-numbers to be placed in the usr/share/misc/
> +	  directory of the overlay rootfs.
> +
>  	  https://github.com/ipmitool/ipmitool/
>  
>  if BR2_PACKAGE_IPMITOOL
>  
> -config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
> -	string "IANA PEN registry URL or path"
> -	default "https://www.iana.org/assignments/enterprise-numbers.txt"
> -	help
> -	  Enter an URL or a file path to the PEN registry to use.
> -
> -	  Note that the official registry is 4MiB+ and may change any
> -	  time and is thus not guaranteed to be reproducible.
> -
> -	  Leave empty to not use a registry; vendor IDs will be
> -	  displayed instead of the corresponding names.
> -
>  config BR2_PACKAGE_IPMITOOL_LANPLUS
>  	bool "enable lanplus interface"
>  	select BR2_PACKAGE_OPENSSL
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index 4f2151904d43..f2ae72bab841 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -49,20 +49,12 @@ endef
>  IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
>  endif
>  
> -IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
> -ifneq ($(IPMITOOL_PEN_REG_URI),)
> -ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
> -IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
> -BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
> -IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
> +ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
> +IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc/iana
>  else
> -IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
> -endif #findstring
> -define IPMITOOL_INSTALL_PEN_REG
> -	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
> -		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
> -endef
> -IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
> -endif # IPMITOOL_PEN_REG_URI !empty
> +# Directory where ipmitool will search a custom PEN
> +# registry provided by the user in the rootfs overlay.
> +IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc
> +endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.43.0
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
