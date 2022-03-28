Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F57FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAF0410B9;
	Mon, 28 Mar 2022 19:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIOqcmuLsUG1; Mon, 28 Mar 2022 19:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B7B4017F;
	Mon, 28 Mar 2022 19:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72F71BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C472181A30
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlqZnurpUgjc for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:57:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA651819F6
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:57:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x34so18186648ede.8
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9gGWrhTZmSNHl4xTnC4l1+2BFcKhx2BmZbmy8XcWN2U=;
 b=ek8OZ7oAFOWrsKWulB+xulHOSHBC9EzkECPYxBaGq0fTvF1MvUmox6gykL3HIFHhs1
 LG4DhvYcQZx34t6lZlQI509f66ueK2JdCV8diDo6VOSRGQ5N7GeQ3jbdeG1eJugjr8eV
 YeYwR3t1gnmsbvslk65r6sPryO5K61q1zzrObd+qYi2OS7UkhT1uTRPYDEZ48iPHs3pT
 h6jloP3th3DmmKgVhmyUVizndCPnDeCj/vJffnZkTL/kFFMJrjepplXUEFA6jaZ0I2mK
 4oWRY6f+s+6pmBHsFjnMp1yn8HhMyoZeFbRbQiozS18H2uwjj1p7hS4cbwcuNI3diOJH
 XysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9gGWrhTZmSNHl4xTnC4l1+2BFcKhx2BmZbmy8XcWN2U=;
 b=GtKU67BOmfkiPg41jTcGYfd9jr0/BBjH17hH4JzGBHNymCzpKa6pMTN4pVmDE9Q9du
 nt6TuShvTIA78u+XgQ2SFaha++N7sdclABtZsbZSBJX4earFtJygU5kmr7zP4W5BYxw6
 KQ9x7wMUp/hfAvrlyL75FgNuupFGT+O2sbky88p18VlR/BoznP2WD74c+6eTYTywEZuv
 tmYkaSVE6hw8YPqo9aukkAYHtVk4Xl3PVEtfTFNRcWfUM9TynSWQc6FTvYhh7XBn6xas
 EY8OaxSxaduAaBTjv0tLzqTxCR+ah6WKAG3Utbc604cSVYnZpdDitHFHYLGv1EfXq5Yw
 ENcg==
X-Gm-Message-State: AOAM533FKuLF4hQ6xR1+kRUCMgrG/wKVGr2/XeAH07nbp+vWmq4ASBVd
 rtCynq5yKypS/VoWKq+p+4RF2g==
X-Google-Smtp-Source: ABdhPJwiMI8BP/yUpft4qK7/L/WxfHTdJU54NnD59uF7P652NXiv0yIwLhkEv8NL7Zvgw/OR1DnwLQ==
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id
 t3-20020a056402524300b004194ce2cb5cmr18582710edd.151.1648497443027; 
 Mon, 28 Mar 2022 12:57:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a17090635cc00b006e055c9c91esm6190802ejb.101.2022.03.28.12.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:57:22 -0700 (PDT)
Message-ID: <cadabb91-aa2a-ca02-4529-b7feaae8eca4@mind.be>
Date: Mon, 28 Mar 2022 21:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220327174130.2577520-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327174130.2577520-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.62.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 19:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 8389adb243..38fa43f6dc 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
> -sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.62.0/meson-0.62.0.tar.gz.asc
> +sha256  06f8c1cfa51bfdb533c82623ffa524cacdbea02ace6d709145e33aabdad6adcb  meson-0.62.0.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index e9c3145183..13adc2f2b1 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.61.4
> +MESON_VERSION = 0.62.0
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
