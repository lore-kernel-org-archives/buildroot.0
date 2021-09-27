Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512C6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7A660F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D7A660F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5A36080C;
	Mon, 27 Sep 2021 14:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XebNJy8wHEXf; Mon, 27 Sep 2021 14:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DFA3607EB;
	Mon, 27 Sep 2021 14:35:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A42081BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 939174036F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21X77PPeA91j for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:35:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9292D401C3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:35:17 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s17so51521255edd.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YH3dHX7nh9aErDc50yeez67kacm0ZTxQxyGTUsOu0b8=;
 b=YVGC2P5nQico+esn+W8c1osSJjwnabeL2mKbxofBcM/pVe0NfjmHQpD2b9svGOcz2z
 jkVcDjJRc/3m3JQtoSGobEuI/1L7fRf1J6YVyObmScqsRmA9RafL2F13VUoeOPA2RpPu
 HggLk9777F/W5/NvfD4wagmP/6vgvCMy/E+SkXdd3jxOTESYPdN/sm+pznYx3ECUXDgu
 bdzWVDu9jib345vwf457TKw8pc1TYlV1TIySRlvqFZnXRjpH60az3HJGkbF6M1D4ihWC
 k+6Q87JfDcl8Zh6LtrtPd9WA1XqeXS4XZik1EnMQjxhAdZxsCOVACSsMr3o0g8tcGKft
 C4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YH3dHX7nh9aErDc50yeez67kacm0ZTxQxyGTUsOu0b8=;
 b=Ibl2iyuAXwlDahyaIsliRzS5fcV+rNLV+rTDxREHTY+sHnacWF84G0XEcv1IjxaN2h
 kdF5M8K3JhENJOw7iyQXTzCsRIkUjJHZSVl1uBl5BT4wL05sPbRhoDv9nGrA02EhSZdl
 DdivwMgtDIWNrdR2I2aJLfhDxgCA6/R8VaRH3vNHkyUCnhSUd1ChU7A5ct9+9M7c/geJ
 sVf70PgmNIq84p+mWem/UlkAjPnqpKlQCX+1eqDnUfB4FwNYLUtYCVYr9OL7kCQG8arv
 68Zd7QoX+lJz3WyJEPx+Q8dLGb3hxTCD+R36pux8RFKeQTD2WH7w76zFpFz5CiapvsMU
 Jc9w==
X-Gm-Message-State: AOAM530W59Wu1PZUUVkE8Hmymxgt3oDeHmdESW7TXCvG30Xhjz8PTv+l
 ON7vbGd5WbHag6oMvT0xHfkNoiJNTEJ2Lnls
X-Google-Smtp-Source: ABdhPJwISex8IxU54edh7xqzPE8jxeRLjGvTdlh9xDZXxK4cb/j2l+QcPUPlCCHcIsL/wBhyKfIQ6g==
X-Received: by 2002:a50:9d0e:: with SMTP id v14mr232048ede.230.1632753315706; 
 Mon, 27 Sep 2021 07:35:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s15sm10787437edr.6.2021.09.27.07.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:15 -0700 (PDT)
Message-ID: <8d4c5ed7-b0ec-9531-4789-4b15d9ea9b61@mind.be>
Date: Mon, 27 Sep 2021 16:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926211503.897587-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926211503.897587-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mtr: use ncurses option
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



On 26/09/2021 23:15, Fabrice Fontaine wrote:
> Use --with-ncurses and --without-ncurses options which are available
> since version 0.88 and
> https://github.com/traviscross/mtr/commit/4e2a948a167d9b8a0a63b46a423d4ae1519ad759
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mtr/mtr.mk | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
> index 7198cbcc1c..0400a12021 100644
> --- a/package/mtr/mtr.mk
> +++ b/package/mtr/mtr.mk
> @@ -10,10 +10,16 @@ MTR_AUTORECONF = YES
>   MTR_CONF_OPTS = --without-gtk
>   MTR_DEPENDENCIES = \
>   	host-pkgconf \
> -	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
> -	$(if $(BR2_PACKAGE_NCURSES),ncurses)
> +	$(if $(BR2_PACKAGE_LIBCAP),libcap)
>   MTR_LICENSE = GPL-2.0
>   MTR_LICENSE_FILES = COPYING
>   MTR_SELINUX_MODULES = netutils
>   
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +MTR_CONF_OPTS += --with-ncurses
> +MTR_DEPENDENCIES += ncurses
> +else
> +MTR_CONF_OPTS += --without-ncurses
> +endif
> +
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
