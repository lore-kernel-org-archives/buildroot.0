Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9F5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869BD60EE5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 869BD60EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624F44032A;
	Sun, 26 Sep 2021 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVVT7K3awYvh; Sun, 26 Sep 2021 21:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B30C04035E;
	Sun, 26 Sep 2021 21:46:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46F6F1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443014032A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5lGM4gmB5Ig for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57BC140312
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:46:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v18so25537058edc.11
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4GlVu553H1SjCspXdXJ1kr2gFpPwmwj+5agRJsD6CKo=;
 b=XkKswuIamyBXqArOWHuIubPFPSThphViIiOdcsN262NYS2h+Kzl10QIETqLrylJYO3
 M4nqxKqwrwM/sq9XcZDkOXS5hfck+F93qk8grZGU3oyxNd3pUllyC0LZje6lpI3QpSte
 geCRomVrTA/CdE+yIxew8iYdb0GKvYGyUhyglj5HE2lJ9GET7IlL0dl/nX4QsglFb+sh
 too+pZ/TjdpqN4ikcK6ViEqGYz1BWj/Jy+rTBHorXDOhsg3Ho9pH4RflLIdI+pNHG5jD
 6Zw9iOqXt5fqQbDPXX0LUuOT/Jg0H21YogBZLPC6UNSe4smKCEveo3vfOQyWXdp0gi8n
 sguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4GlVu553H1SjCspXdXJ1kr2gFpPwmwj+5agRJsD6CKo=;
 b=y7/1P5VZZApgeY+DrUyerSBZ0zNu2C4aMBT8L20v4Icm5L04npx0rtE+BVT4uvNl+b
 auEcmWQBsIkHiN6gkI/VNm70HBo0P9fO3Tek4YHBGB3eWJsYi+XdG8sTPzRqz0xhPRX3
 0h3mGCpOwAICYc6yEjiyScZ4X2IRBI7FPBb2xJzNNkeJLDfC89VdSxp3cZi6tXGv/dRC
 v+4aU++xZMDKM2zRoCPMPV3o2pR3VDDPreb0DKxuTEMuCvLxDg+IANk0zg7r83g1HiTZ
 OHJKaBsYdAI9qSkfy1/yFEg+i6FXpna+7aweDayCdEIWseAmAvFvlVD50b88IpT/yAPd
 IFTA==
X-Gm-Message-State: AOAM532KDqMb6UJQlYeYrPmgeqb3X61ABXjfMZ8MYY9yEtTvNW5vnwR3
 eHhR5OJ5RziiVYgrX6R94ahGiA==
X-Google-Smtp-Source: ABdhPJyl4WrXaXx1BgCp8JnGs/4os0IBXPtWvp6K+1eGCS5Agk1xPlA2PHUE6dFp7ep4N+cHPf4tWw==
X-Received: by 2002:a50:cf01:: with SMTP id c1mr14313787edk.94.1632692775520; 
 Sun, 26 Sep 2021 14:46:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k16sm9421725edr.33.2021.09.26.14.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:46:15 -0700 (PDT)
Message-ID: <2a26267b-a2d4-e3d4-50c5-d854581171d9@mind.be>
Date: Sun, 26 Sep 2021 23:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210922045955.13130-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922045955.13130-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/debianutils: bump version to
 5.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/09/2021 06:59, Petr Vorel wrote:
> New archive contains ".orig" in the name, thus update
> DEBIANUTILS_SOURCE.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Fix redundant slash at the end.
> 
>   package/debianutils/debianutils.hash | 4 ++--
>   package/debianutils/debianutils.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
> index 16a45d4ea1..0b28ac705b 100644
> --- a/package/debianutils/debianutils.hash
> +++ b/package/debianutils/debianutils.hash
> @@ -1,4 +1,4 @@
> -# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
> -sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
> +# From https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils/debianutils_5.5-1.dsc
> +sha256 2b0fad5c00eb2b8461523b2950e6f06e6ddbb0ac3384c5a3377867d51098d102 debianutils_5.5.orig.tar.xz
>   # Locally calculated
>   sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright

  It seems the license file hash changed. Can you check?

  Regards,
  Arnout

> diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
> index d2c41130fb..0817f81cdb 100644
> --- a/package/debianutils/debianutils.mk
> +++ b/package/debianutils/debianutils.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -DEBIANUTILS_VERSION = 4.11
> -DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
> -DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
> +DEBIANUTILS_VERSION = 5.5
> +DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).orig.tar.xz
> +DEBIANUTILS_SITE = https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils
>   DEBIANUTILS_CONF_OPTS = --exec-prefix=/
>   DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
>   DEBIANUTILS_LICENSE_FILES = debian/copyright
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
