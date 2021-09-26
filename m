Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D17C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3CC60EFF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F3CC60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D08180EB7;
	Sun, 26 Sep 2021 19:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgBSxgNZ72IV; Sun, 26 Sep 2021 19:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89EB980E68;
	Sun, 26 Sep 2021 19:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE541BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B6BF60712
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyS2ajzSS_dk for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:49:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F1060596
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:49:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x7so45283405edd.6
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sgvZEPAWx41KfxjfrbfjSYakjgX2jeHu5yyh1MRRbyY=;
 b=RyyfEuhYLSpVNGhe70CcnYTRzFb30ho8xvu/hMKxmr6vWyE0xTRuXQVLDzDzjPAr0z
 zqRQSOrSHgm1bNESKaonZHBgJ6LwS9iQ1JyPKqIpXrVoA8Mf0unQof5GRjXw8k1rJ//u
 1ciD+Ks2SZLpR5K+ZZkAjHQKLwLzH+kCCbokM3LYyIwCRZ1JoqinZ8kOG4pnbT3+8dT0
 M32qiPYjW91RWXvkSptPh8XwNeXsnDJlMZljdeZG8KtFNP0qWYh42TpTZcPPCGXfhNg0
 u2zRyp5nAA34amWWrrWufbdrRuBVwyBAk034YHfV7OrXaLEJ5z75obPucAm/gKk3s8Ur
 stYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sgvZEPAWx41KfxjfrbfjSYakjgX2jeHu5yyh1MRRbyY=;
 b=qrR73+Enh2UshuvjmNBAQtMccQDIg4wn2+KCcS4t00cPOhkK4COLjr8wDZ82I3VV0Y
 CJ6J43nv3pFgJGQuIZBAp1DeesCoOI7E+75quZlKnct0MdXcyHYt91UoIPtO/L2OP2Qb
 RAPK+TqXIuA1z/lO1V7Lc0vBz3YQU4cSl/vbctRXUz1hmZEwBKwFuzxBWV/Ric0WgMCq
 1O4rcdFPvC2tSmWeZqT03FvLvfOS4SsWB97hbLSo/8dYBd8Ua54THFsz3rMgs9OWl6yS
 y9NMFl4UXxF/E5n4HxcNIFSNOK8u4zhlC4v/YX5918Jdl37U018UO9YJKD7uKqnXYQ67
 Sl5g==
X-Gm-Message-State: AOAM531lxmCRStK+BTbv9ui+LblK1Y+kVae3wf8tA69/CDwvTs3T7YIx
 5GkRGiBeodYkSm/Au7xO+XzrBHDQavkYug==
X-Google-Smtp-Source: ABdhPJz3yP4Vbmlu6847NHRWrEWZ3z7ewclX8DCbthtBFKFxI2IdcFV54IY8M4w41RNSDdakMcEBCw==
X-Received: by 2002:a17:906:dbf0:: with SMTP id
 yd16mr23137224ejb.445.1632685743541; 
 Sun, 26 Sep 2021 12:49:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id la1sm7737288ejc.48.2021.09.26.12.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:49:03 -0700 (PDT)
Message-ID: <f79b120d-df34-6cab-efc0-5b059354d566@mind.be>
Date: Sun, 26 Sep 2021 21:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210925212411.3359812-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925212411.3359812-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.3
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



On 25/09/2021 23:24, Fabrice Fontaine wrote:
> https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/minizip/minizip.hash | 2 +-
>   package/minizip/minizip.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
> index b006f32bfc..6043f96f3a 100644
> --- a/package/minizip/minizip.hash
> +++ b/package/minizip/minizip.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6ba4b6629c107c27ab526e517bdb105612232f0965a6747f60150e5a04c2fe5a  minizip-3.0.2.tar.gz
> +sha256  5f1dd0d38adbe9785cb9c4e6e47738c109d73a0afa86e58c4025ce3e2cc504ed  minizip-3.0.3.tar.gz
>   sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
> diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> index 351aee464c..2d0f63959e 100644
> --- a/package/minizip/minizip.mk
> +++ b/package/minizip/minizip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MINIZIP_VERSION = 3.0.2
> +MINIZIP_VERSION = 3.0.3
>   MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
>   MINIZIP_DEPENDENCIES = host-pkgconf
>   MINIZIP_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
