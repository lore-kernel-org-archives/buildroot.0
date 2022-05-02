Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705EFC433FE
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2902F415A9;
	Mon,  2 May 2022 21:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg4mTdvhw-PW; Mon,  2 May 2022 21:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6482409EE;
	Mon,  2 May 2022 21:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 203901BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D41C606DC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9TdbeR-AJLZ for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31304600C5
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:54:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id be20so18027320edb.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rs45plx+Hy2zkSB+sFPuihDqhiHdYGFRMemctZglPbs=;
 b=OOf6YE3hPp1hm9kIi23Kpoxr8zuWZXpbqSsjvtThko38vVXhDrs5gT8OAja3mE0BAt
 4wiUWOWxLUa4UZ/ztT7U9KQnCXGL/7b1eQHCBsEN3TSHJyQEoFBGJNoX5TuYA0UNV0fz
 0nKPwVjcM7mPYLsvNPh9U0rmNJuyz3EJ4clXs90leNDJGHxEkzcIZ61hsOT+xMZD2ht2
 Rse5wMDJxWtLZlY5CC1VdlIY2lFWMc2mwNAVwJCtfCqY8zq12LthT0oN2zQWZKHqoOco
 zKacBCidxyc+No/hZB8sMXQ3LxAWI5f5fYTO+3tXM5oUgLjX9tNnuETttVnHdhd13AlY
 bESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rs45plx+Hy2zkSB+sFPuihDqhiHdYGFRMemctZglPbs=;
 b=Pzlqgu3xEiMhWBa/Al02Bf1w7VgxoXKmvAWzjnaAd7WoFg2I6sAbEdk0GaYueW5mEA
 xQ33qcGfeVQi7X3op7Cq4enHb2Z1VEH6ZBjALAfISfOvMc6QIovkjAcm9rjKMS36p89o
 3QP9LBhq49y5Zpx6L2OGqMIUl2orTlC+uywY9DqGjp+VRs7eUjXmxJHEPbpSvRv+UxxW
 btoWC+Hg0VXPp98bpuFz2OVrTiCU8e9nvu0Irb61dWqTjkFSGYYJ3AASxJ51RUOHW+Iq
 6cEGDf3Xhs3VgfztfCcD8V49mqaHXVsKhMpI58uiydMK1oKvwoSNidDwMi7nmS76c3AR
 1qIQ==
X-Gm-Message-State: AOAM531iMe8X0iIrq9AgsQa+RGwUhV5RbUw2tDcF8qLeaWhsrR3SP8aq
 zTHhiV/IpP1p5tpj0LCf8gv9eg==
X-Google-Smtp-Source: ABdhPJz3kcybXR1/SEmS1cat9cAuV6OwMNtqjecQlpuphLlvIkZolW3wpOrq7q72ijVfOKabu4my9g==
X-Received: by 2002:a05:6402:2743:b0:427:ccb0:b8d3 with SMTP id
 z3-20020a056402274300b00427ccb0b8d3mr6007416edd.72.1651528481323; 
 Mon, 02 May 2022 14:54:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cy19-20020a0564021c9300b0042617ba6386sm6996373edb.16.2022.05.02.14.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:54:40 -0700 (PDT)
Message-ID: <5f262b22-1c9c-763b-a052-e462daef2648@mind.be>
Date: Mon, 2 May 2022 23:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220501110640.300796-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220501110640.300796-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build
 with libexecinfo
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



On 01/05/2022 13:06, Julien Olivain wrote:
> Fix build failure raised on uclibc and musl since the addition of
> libexecinfo package in commit:
> eea8ba446c10701a273432552108d80fb2224ef4
> 
> Fixes:
> - http://autobuild.buildroot.net/results/9591ffe5968fe5f20b29799d1c234426cacd549a
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/glslsandbox-player/glslsandbox-player.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
> index c5fbf062b7..70bd5ca370 100644
> --- a/package/glslsandbox-player/glslsandbox-player.mk
> +++ b/package/glslsandbox-player/glslsandbox-player.mk
> @@ -12,6 +12,11 @@ GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
>   GLSLSANDBOX_PLAYER_LICENSE = BSD-2-Clause
>   GLSLSANDBOX_PLAYER_LICENSE_FILES = LICENSE
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += libexecinfo
> +GLSLSANDBOX_PLAYER_CONF_ENV += LIBS="-lexecinfo"
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG),y)
>   GLSLSANDBOX_PLAYER_DEPENDENCIES += libpng
>   GLSLSANDBOX_PLAYER_CONF_OPTS += --with-libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
