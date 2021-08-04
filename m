Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5930C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985F861037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985F861037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6956E40164;
	Wed,  4 Aug 2021 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_uY16SdrfEd; Wed,  4 Aug 2021 20:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ABB5400D9;
	Wed,  4 Aug 2021 20:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C54001BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3D09608BA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJREphYWYRZv for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE2E86073B
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:49:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id yk17so5634956ejb.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8wO2LyZKsfxhFU0AbprxISxVIhdPRiKxiyoaOsdlYsw=;
 b=Ny0P4kfrx+zswHpBrllHY0/n8SbZ0Krsa1uarP5bTx7tE58HC33aaP9JfciCrsh+Pk
 /E9WSzsqly94ftehyZTuX/G/sYQUfmVJCGfDIgzcH6cz4HpWCsZp25CNe8Bq9WKnHYV/
 OnpPEkPyaV/8Ray713qOJSGWPF1xF4CNyojwUERrUyoA3FQqWz8XpmLVtvcu6AnSFl2p
 VP8tuJk9v6+Pl4Jd3jKX/HxywPV+SL2++9fNUkeIdou81OzPgX/ftlk2m/QZC1EnxdfB
 kw7W4LIZpMOa4fnSnZ6YUDo/op7iwiNr2/0bwOfQxVD4unIz8A5R1MFQfeHy4Z8gpL09
 ppmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8wO2LyZKsfxhFU0AbprxISxVIhdPRiKxiyoaOsdlYsw=;
 b=KF97O+3UimLuJ1XDqZp+m6lY5+ovoN0QE46kYjeRHN6943uJNc/5knWaYR3q3aCOnB
 bNlDnw3G0MQr9X9xtAByqYa5HJSaD3SVUymV+WWOWXAmCX+Ct7WR1Gg9f7D1yMsOfQ/g
 VP5CbT59lubWQlmAcb3T2Dfs9kwzlf6EQPaztQ7RnUhTlZ2W1pJA9kvFK5xdIFhSm8Sq
 v85X3widnpRRkgcbNFVfdL7/4PygSbCIASBsE4w5f2grvRgjP4vPhwxLRr+BGkBh0XWN
 oAh17r69FxWgwrOiYKjelkIY0Ryb/HPz4loU+iR3XbREoZBexxMoHr3rgTkpgpyci7wV
 D49A==
X-Gm-Message-State: AOAM53007Fr97jOlSzjeRj8FIE8V8E7j8777AcJ7zkfV9aCBLGPbqD88
 ufMKhvhtoJOjrsPvT/BBeavejzRauav93twzAKE=
X-Google-Smtp-Source: ABdhPJyzI+A1g1c681olktqdqPZP5yQOpyTIZiQz9YwneO/wda4yt/cte2BHiPPeEET1piWjitB7Tw==
X-Received: by 2002:a17:906:abc9:: with SMTP id
 kq9mr1030028ejb.420.1628110194843; 
 Wed, 04 Aug 2021 13:49:54 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cm1sm1368053edb.68.2021.08.04.13.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:49:49 -0700 (PDT)
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20210803143654.550783-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1e2a20e9-3c43-8de3-a954-be4543e77edf@mind.be>
Date: Wed, 4 Aug 2021 22:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803143654.550783-1-b.bilas@grinn-global.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/cegui: disable OpenGLES renderer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 16:36, Bartosz Bilas wrote:
> Support of OpenGLES generates tons of autobuilders failures
> so let's disable it till upstream finds a solution for that.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/41d/41d10c09472fbb8481a72c4f8bed789bb15bb3c2//
>  http://autobuild.buildroot.net/results/9a8/9a8122b4d3d0aa9d71cdf8d21359411b130741f8//
>  http://autobuild.buildroot.net/results/7e5/7e5dd79b48abde09bf4633b196579da5561f9fa1//
> 
> and many more...
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

 Applied to master, thanks.

 However, I wonder, if opengles is turned off, is the
$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) still relevant?

 Regards,
 Arnout

> ---
>  package/cegui/cegui.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 127d3b0fad..2e56322374 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -13,6 +13,7 @@ CEGUI_CONF_OPTS = \
>  	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
>  	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
>  	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
> +	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
>  	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
>  	-DCEGUI_USE_FRIBIDI=OFF \
>  	-DCEGUI_SAMPLES_ENABLED=OFF \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
