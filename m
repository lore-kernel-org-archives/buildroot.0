Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43578C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCE3440BC8;
	Sun, 24 Jul 2022 12:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE3440BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h34XRw-S55xN; Sun, 24 Jul 2022 12:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF7540186;
	Sun, 24 Jul 2022 12:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF7540186
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 434811BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1044E41574
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1044E41574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhy3nPOFNjAK for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:28:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7AA41572
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7AA41572
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:28:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d13so4663216wrn.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YO3KQv1cqijXnszEOl8dK2wBijj41DyI1RAvUp+6SBw=;
 b=UvyZjfhkibXCAD3e8AOZT/aF5ZgABwFOM9cYFGjMwsp3ajki+76icLeUh2IwyrJE6J
 PfKscdMl8K23SL/+r3ytXWi1/4X8In31Znm7eQBROFCVUZdohwaNIAFjw/rEfagCFQ0R
 gNHA5TPnftRupx7bCdjh4WekExNhiOHE2zrIj47nIOCQfWDd/5PHPvqtBqTgVww3SH0k
 vMc1RF9wBrFdJwawe6wZ3oUZzkPLBzIatM2887x116eMaJL26ezp/5dX9ahdhqtTX02z
 qIzOxvvzOz0xcS9UY2patTZomcIEY/o+tvZIYhTiNcZi3KDZPnidMTKLHdF/qkqq/Ri2
 kBMg==
X-Gm-Message-State: AJIora9zQaQzo3aKwohqIfBzRM1dsnEwzfNCBCZYMkeqsKCPoe/ZBkRG
 8H3aEG2ykSLsEtzpKqX9jlwfIg==
X-Google-Smtp-Source: AGRyM1vzonThvcxsK2sDwKjV4tOSpmT8SVSw5auDZfVzPZRjt36ijgnVmoAKr1EEWpeE117fcxVYyQ==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr5366944wrb.116.1658665725394; 
 Sun, 24 Jul 2022 05:28:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm11553913wmq.39.2022.07.24.05.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:28:45 -0700 (PDT)
Message-ID: <5ce77be8-847c-4852-4a45-409c0fac2320@mind.be>
Date: Sun, 24 Jul 2022 14:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220724112830.1108001-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724112830.1108001-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YO3KQv1cqijXnszEOl8dK2wBijj41DyI1RAvUp+6SBw=;
 b=iHdTWnJRHoseLkauLR1eExwCunP58P9oooG+P7paTFyRLGpj5T3BW/sRC6YMAFEcFi
 YDlBVVV51JeiM2g9fDhE7AyQ+qrie7F+MktfBeyVvmXqED5eRmo5+R9HmgmiFcfh9xt4
 ZGaYBqEQYsIAml1d4XZbPi72oDcKAhP7DRUSM1JRsM51iOvC3QTB5I1Wt08aDKcdRmTb
 VZ3T68bWfEHWbu+kwyn96/JAkiq7F3Wa4VgkLfBN60HMJrT+S4Xgt1PEPzw7BoS0cHJT
 /kDM9jRjOToWb11RX4Qz/LjInszxgi4p1mZ3OSorVobcr5KRaAVl6P+Ew+m4f6pBUPR4
 wFGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iHdTWnJR
Subject: Re: [Buildroot] [PATCH 1/1] package/matchbox-keyboard: bump to
 version 0.1.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 13:28, Fabrice Fontaine wrote:
> - Switch license to LGPL-2.1 except applet/applet.c:
>    http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=267595f2ef18e46c79f76057ad3c6fb40009ca4f
> - Drop expat=yes (not needed since
>    http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=4cf2976842612a0a278de4515715e4e4228c2987)
> - xlib_libXrender is a mandatory dependency since
>    https://git.yoctoproject.org/matchbox-keyboard/commit/?id=b38f24036cff3be6c2fbcf9ca9881803e69003ac
> - libgtk3 is an optional dependency since
>    http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=e4ab2198a5f9611027cb62e6ff41ee2593f07d4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/matchbox-keyboard/Config.in           |  1 +
>   .../matchbox-keyboard/matchbox-keyboard.hash  |  6 ++---
>   .../matchbox-keyboard/matchbox-keyboard.mk    | 24 ++++++++++++-------
>   3 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
> index b6753f3bec..260a57c6a4 100644
> --- a/package/matchbox-keyboard/Config.in
> +++ b/package/matchbox-keyboard/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_MATCHBOX_KEYBOARD
>   	bool "matchbox-keyboard"
>   	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_XLIB_LIBXRENDER
>   	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_MATCHBOX_FAKEKEY
>   	select BR2_PACKAGE_MATCHBOX_LIB
> diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
> index c65fbecff4..43ace650a4 100644
> --- a/package/matchbox-keyboard/matchbox-keyboard.hash
> +++ b/package/matchbox-keyboard/matchbox-keyboard.hash
> @@ -1,4 +1,4 @@
> -# From http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/0.1/matchbox-keyboard-0.1.tar.bz2.md5
> -md5	50940321d59fee23b38a4941100abf25	matchbox-keyboard-0.1.tar.bz2
>   # Locally computed
> -sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> +sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
> diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
> index 23ab5ad7e5..242c4831d1 100644
> --- a/package/matchbox-keyboard/matchbox-keyboard.mk
> +++ b/package/matchbox-keyboard/matchbox-keyboard.mk
> @@ -4,15 +4,16 @@
>   #
>   ################################################################################
>   
> -MATCHBOX_KEYBOARD_VERSION = 0.1
> +MATCHBOX_KEYBOARD_VERSION = 0.1.1
>   MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
> -MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
> -MATCHBOX_KEYBOARD_LICENSE = GPL-2.0+
> -MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
> -MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expat
> -
> -# Workaround bug in configure script
> -MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
> +MATCHBOX_KEYBOARD_SITE = \
> +	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
> +MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
> +MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
> +MATCHBOX_KEYBOARD_DEPENDENCIES = \
> +	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
> +# From git
> +MATCHBOX_KEYBOARD_AUTORECONF = YES
>   
>   define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
>   	$(INSTALL) -D -m 0755 package/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
> @@ -29,4 +30,11 @@ MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
>   MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +MATCHBOX_KEYBOARD_CONF_OPTS += --enable-gtk3-im
> +MATCHBOX_KEYBOARD_DEPENDENCIES += libgtk3
> +else
> +MATCHBOX_KEYBOARD_CONF_OPTS += --disable-gtk3-im
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
