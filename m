Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41B6C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:29:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BDDF60E90
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BDDF60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D016180D9A;
	Sun, 29 Aug 2021 16:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OM9Hgi38LkE1; Sun, 29 Aug 2021 16:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7794F80D9C;
	Sun, 29 Aug 2021 16:29:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A274E1BF298
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92153606BE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mru4gDtfyGw8 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 16:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1DBE605D4
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 16:29:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r7so1857678edd.6
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vQLQfjdo+Au8ce1Or2wYgJX1GkEiZ7Gks+yY2NJwDLY=;
 b=X/9RC2ltD5XVUoLgEmpr+qcRLpHV3uH0aTm7Sb9zbY3NZc0qzYDBp8tn/JjAiE/vVK
 dRJsB/3qcYrFicTJqmm+ALSE+m4n0jrifjVAKT9Y+AGS2htVzXUlt7C5llGiNHTGASi+
 G65vNftza0jp8vSZej/aIo7GUE11y4wPl3pfFTjfBBTdSEkCvc9+nDKIeJC7v0oDXI+F
 B5nJaAIRaXGyGedgUWhXLug2dWfnBaEoHDoXqczddJmBoYOvAgB/hXvTOZrk8mRsVUU8
 c9F8JJ6LUQNAlmUpmHdpXoiqUsuBlo3L9as0ZjQaXO0y1cGtibHe6nQjcwRJSxMWJ21f
 B7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vQLQfjdo+Au8ce1Or2wYgJX1GkEiZ7Gks+yY2NJwDLY=;
 b=dJYH6RxxvGy/mgGdL8z08Cb3lRG8RjBDe3KnImBLxtxLP7Dq44lr9Mt+fTUlUw1BVx
 /gd6pXPkAwR6sgrjcwyNbsbb4ByDQXP5SJfivorE4HpoujUVzzpsF3p3N5tvCf0m1nJu
 Lym05gu3Vh787KqPW2V9EZjCCeNkUSD/eT0zh6XqGivLHo0vaxBktC9gr++wSkg44Ew4
 hKgVjmP7i5bSfPrw38EFc7DSH9eVy+3+i9eBdAmnXLn3/IUexQ/OpzIdHecwV7A94B7p
 BnqbtRlTr9fcFGeV8ZMGgg1q3jDVbXCqhb0jXWQUkn3YQdQkYSD9zfV+OMW6f1oGOh+6
 lBqA==
X-Gm-Message-State: AOAM530jW9e+x2lYPwg0OMukKHK65BQHLsQgj7OUk0hoGpP3ZElxLug5
 mO3r1jPDhzU9Iy0nOjDw8zHPrQ==
X-Google-Smtp-Source: ABdhPJw5C/XSPCI4Qr4uxpiJiLNW6GWXEeVs+P9E3a5ERzBywUC3FLDig1SxAisuOIl1myyE+/ii0A==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr20185565edt.194.1630254558744; 
 Sun, 29 Aug 2021 09:29:18 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h8sm5747723ejj.22.2021.08.29.09.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 09:29:18 -0700 (PDT)
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20210802154812.408921-1-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <47951da5-349a-a4da-db25-6142f5828963@mind.be>
Date: Sun, 29 Aug 2021 18:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802154812.408921-1-thomas.claveirole@green-communications.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/vuejs-router: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 17:48, Thomas Claveirole wrote:
> Vue Router is the official router for Vue.js.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

 Applied to next, thanks.

> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  5 +++++
>  package/vuejs-router/Config.in         |  6 ++++++
>  package/vuejs-router/vuejs-router.hash |  3 +++
>  package/vuejs-router/vuejs-router.mk   | 19 +++++++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/vuejs-router/Config.in
>  create mode 100644 package/vuejs-router/vuejs-router.hash
>  create mode 100644 package/vuejs-router/vuejs-router.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1547ff123b..6d336c8661 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2591,6 +2591,7 @@ F:	package/x265/
>  N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
>  F:	package/fcgiwrap/
>  F:	package/openlayers/
> +F:	package/vuejs-router/
>  
>  N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  F:	docs/manual/
> diff --git a/package/Config.in b/package/Config.in
> index 046c04e994..9612dc9ff2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1639,6 +1639,11 @@ endif
>  	source "package/openlayers/Config.in"
>  	source "package/popperjs/Config.in"
>  	source "package/vuejs/Config.in"
> +if BR2_PACKAGE_VUEJS
> +menu "External Vue.js plugins"

 I've changed this into a comment - a submenu with just one entry (maybe two or
three later) isn't very useful.

 Regards,
 Arnout

> +	source "package/vuejs-router/Config.in"
> +endmenu
> +endif
>  endmenu
>  
>  menu "JSON/XML"
> diff --git a/package/vuejs-router/Config.in b/package/vuejs-router/Config.in
> new file mode 100644
> index 0000000000..ac79b3ea61
> --- /dev/null
> +++ b/package/vuejs-router/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_VUEJS_ROUTER
> +	bool "vuejs-router"
> +	help
> +	  The official router for Vue.js.
> +
> +	  http://router.vuejs.org
> diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
> new file mode 100644
> index 0000000000..62b16505ea
> --- /dev/null
> +++ b/package/vuejs-router/vuejs-router.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  d85cb70686cad36a087ad9586f1839c9997f707eb0065445fb1ea3d9218494f6  vue-router-4.0.10.tgz
> +sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
> diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
> new file mode 100644
> index 0000000000..60e751e1d1
> --- /dev/null
> +++ b/package/vuejs-router/vuejs-router.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# vuejs-router
> +#
> +################################################################################
> +
> +VUEJS_ROUTER_VERSION = 4.0.10
> +VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
> +VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
> +VUEJS_ROUTER_LICENSE = MIT
> +VUEJS_ROUTER_LICENSE_FILES = LICENSE
> +
> +# Install .prod.js as .js
> +define VUEJS_ROUTER_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 -D $(@D)/dist/vue-router.global.prod.js \
> +		$(TARGET_DIR)/var/www/vue-router.js
> +endef
> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
