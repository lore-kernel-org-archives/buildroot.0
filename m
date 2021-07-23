Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBFFC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C4C660F02
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C4C660F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B3560709;
	Fri, 23 Jul 2021 22:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0M6s7zYrpDjG; Fri, 23 Jul 2021 22:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2682660A64;
	Fri, 23 Jul 2021 22:08:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1941BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03AA2414C8
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXyILJldlaS8 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEF74404C0
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:08:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hb6so5705256ejc.8
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 15:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hsuU34gdcnFrBJaZbXsAvPSE4P5hE6/uBWuDcEUhCEQ=;
 b=R5thPSok5HUp9T5QMj+iZAadkfsGprPRzbOe4p5RD4EyOEcgGZmsjTw4vJhaswGjNr
 UX/3yg470cIgBOYNshkz+wI0Ta8iGhOvmnDzZOCRR8AUQEQLSIlnthgshLfATITsVr9x
 v4PPX0yi6/XpWJFbOkuFxlCv5pYfk8H0D5dmHt78YvhqBrNCsMIlVvTsJjdIV1Ko70JM
 DBZ3EUuKAOhgIK1FVewhukysn1KDK9r5dHx3owza8KuWllD+awdnxYArUXwh4dW0wO3U
 Zba18gbKbzrcoIB3spvz9TCw2hynTf/++VXZi9GISP6mV3FyoRb4kBC2ACFOYSlFtfPZ
 HwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hsuU34gdcnFrBJaZbXsAvPSE4P5hE6/uBWuDcEUhCEQ=;
 b=DGvYWXauCSE/Wwq+7KuR7yIGjiCszRhwtCduGq16jBah4Jztms6AE3b9Nj0jXF+ZJe
 /1g0xCWMNP5Yda2ZUF3+TmQKjgCKbgMvJG6aVgRVnw24oHV4NWfr9m4fA9qeaAF+JXzm
 UOWrv5vmOFQbbgDPbmJF6ecnUSBvd4N6f7A3KIPpUGyHblaUuthwycnwx6OXbJ1KmpcY
 p+IgRFjHvmSrM2q/GfNUr+5Pc1bjKb2Rjj2fJvHGrT7+WrlrnG3z5nystTfNczXAt0cf
 b6wHd4QOxMgf4vcLQaP/G7y9Svaay0xAlTIPIq3txUHJUE9fb+bayjIz1nlwMJKipe6F
 kSLw==
X-Gm-Message-State: AOAM533WgzPERjDPWT+NEZZng6o7KcrSDFXAA2nEsXba+nMmHUd3tHq9
 CyJ/os/5lPKBdbBaM9+3EmbO0g==
X-Google-Smtp-Source: ABdhPJxOlBn/vUF/YRw+08Dj9AZGzeXQNhGyCvbgxNCTL3V97ytGretTrTF4CwfbgkjxnHQ12rPR9g==
X-Received: by 2002:a17:906:30d8:: with SMTP id
 b24mr6537548ejb.358.1627078082175; 
 Fri, 23 Jul 2021 15:08:02 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ot18sm11259727ejb.109.2021.07.23.15.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 15:08:01 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210713191359.858920-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e03138f8-ffd9-c3e5-67aa-46c3ccab1ef6@mind.be>
Date: Sat, 24 Jul 2021 00:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210713191359.858920-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/apg: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 13/07/2021 21:13, Bernd Kuhls wrote:
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> v2: fixed license, added dot to help text (Yegor)
> 
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/apg/Config.in |  6 ++++++
>  package/apg/apg.hash  |  3 +++
>  package/apg/apg.mk    | 21 +++++++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/apg/Config.in
>  create mode 100644 package/apg/apg.hash
>  create mode 100644 package/apg/apg.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 15ea800f4b..4eb76e0fe1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -314,6 +314,7 @@ N:	Bernd Kuhls <bernd.kuhls@t-online.de>
>  F:	package/alsa-lib/
>  F:	package/alsa-utils/
>  F:	package/apache/
> +F:	package/apg/
>  F:	package/apr/
>  F:	package/apr-util/
>  F:	package/bcg729/
> diff --git a/package/Config.in b/package/Config.in
> index 1a8ba3c23c..f5fb97f3cd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2400,6 +2400,7 @@ comment "Shells"
>  	source "package/mksh/Config.in"
>  	source "package/zsh/Config.in"
>  comment "Utilities"
> +	source "package/apg/Config.in"
>  	source "package/at/Config.in"
>  	source "package/bash-completion/Config.in"
>  	source "package/ccrypt/Config.in"
> diff --git a/package/apg/Config.in b/package/apg/Config.in
> new file mode 100644
> index 0000000000..94c286a178
> --- /dev/null
> +++ b/package/apg/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_APG
> +	bool "apg"
> +	help
> +	  Automated Password Generator (APG).
> +
> +	  https://github.com/wilx/apg
> diff --git a/package/apg/apg.hash b/package/apg/apg.hash
> new file mode 100644
> index 0000000000..5532289a68
> --- /dev/null
> +++ b/package/apg/apg.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  89539aa734a47d68124fca5ba7acbe559edc5003b6791f5200ef9e706dd00fe9  apg-2.3.0b.tar.gz
> +sha256  5d0c892ea452c3828f1e311637cde4e3a04eb6431554308b3fcdac8c1b330168  COPYING
> diff --git a/package/apg/apg.mk b/package/apg/apg.mk
> new file mode 100644
> index 0000000000..ac4dce77f9
> --- /dev/null
> +++ b/package/apg/apg.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# apg
> +#
> +################################################################################
> +
> +APG_VERSION = 2.3.0b
> +APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
> +APG_LICENSE = BSD-3-Clause
> +APG_LICENSE_FILES = COPYING
> +
> +define APG_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(APG_CFLAGS)" \
> +		-C $(@D)
> +endef
> +
> +define APG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/apg $(TARGET_DIR)/usr/bin/apg
> +endef
> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
