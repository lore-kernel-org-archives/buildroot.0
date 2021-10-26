Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1D7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:01:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110B460200
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 110B460200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C91AF40275;
	Tue, 26 Oct 2021 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mrufzdf6joiw; Tue, 26 Oct 2021 20:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D6D4024F;
	Tue, 26 Oct 2021 20:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 301521BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EEA760ACA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH7rWGBgG-Xl for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BC47606AF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:01:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u13so1036210edy.10
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=as+T13GekHgaGdex/XmzVXLTnzUeYQduak9MzeOrO50=;
 b=FxbpxQJjPDnp32IyHuAVddSJGhPyr4gEcE/Gmborowpr8X8pmudkPfmwdapxj0uEr2
 ue0NM+SEQiPEeTy++757Be+e9fGBlRZPsDoWVfa1YQWbL/YvcwfHkdrKq98AGgl/nCoy
 qOVNG4/J5ih5/7pPwSVqiWIO+CkSgqwOe/T3KYNEp3m+ZDtkfDqLZpWg400lJ4eTlQ78
 ew1ad6Wwh9YTc86nbnm9arezgKRDUvqEvJStZyeBY483pib90K/b3DxXuFlow/2nQJ7Q
 lbS6VKo2M77or93VRKYIWHiZDVxm6Lfyrnmd8vcLAPLm/T3wSXC2G7y4TH7XGwgo7i7O
 G1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=as+T13GekHgaGdex/XmzVXLTnzUeYQduak9MzeOrO50=;
 b=VMvxs39NDpV9w6bxzFbGN80jgfCX72N+TPmb+F3aSaYO073faC0MrZWH3rzqmT9bTH
 NDRj3a2eTKcU2iDGWDZb68XDUM2BYgKI/hvkaZGumzTJ+RIIDEpXoC8Jla0i0JzUsouW
 A46pLfbpvY+NlkzTL74fOP+gtABu3dDWoi4Ozh6pnCofOR5yRqL+wmzN1ZDpYT2xKjnQ
 oFRNOzIOGMiMdLj6qWZhledXdCn+x5Mi7d6Wf2QtYub/jRwx5Hqop33lA56LbR6HNRfx
 z47Wh/rDPbbPjna28PnyQpmOJeSuL5Qr3JQ51pHcAf0lzOvwOfKJfTbaYbdWYM/PqRoa
 yevg==
X-Gm-Message-State: AOAM532ZARMUWIYbVEfmNnM0/J71yTQFHA0Vd20VIwSikKtnv1+5QwSr
 Wiysg5Vu4b1F7mTeM5Fz2CBAhw==
X-Google-Smtp-Source: ABdhPJyYUNPw85kduQFfCyr8vZO+urimhyHPx4AerebcVCkeDH+ezUqN7KY5ZEBYh6DYtMpwKhzfVw==
X-Received: by 2002:a17:907:7f87:: with SMTP id
 qk7mr5150038ejc.105.1635278477658; 
 Tue, 26 Oct 2021 13:01:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m1sm9902782ejn.121.2021.10.26.13.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:01:17 -0700 (PDT)
Message-ID: <40ff9344-0dc2-5135-f756-e545365c4d8e@mind.be>
Date: Tue, 26 Oct 2021 22:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025083817.4045062-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025083817.4045062-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: fix fontconfig meson
 option
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



On 25/10/2021 10:38, James Hilliard wrote:
> Fixes:
> output/build/pango-1.48.10/meson.build:1:0: ERROR: Unknown options: "use_fontconfig"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pango/pango.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index 104551a1fa..7d3d6626d9 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -13,8 +13,8 @@ PANGO_LICENSE = LGPL-2.0+
>   PANGO_LICENSE_FILES = COPYING
>   PANGO_CPE_ID_VENDOR = pango
>   
> -PANGO_CONF_OPTS = -Duse_fontconfig=true
> -HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
> +PANGO_CONF_OPTS = -Dfontconfig=enabled
> +HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
>   
>   PANGO_DEPENDENCIES = \
>   	$(TARGET_NLS_DEPENDENCIES) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
