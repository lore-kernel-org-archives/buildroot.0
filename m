Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0229C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C706102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05C706102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F446074E;
	Tue, 17 Aug 2021 19:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 991GyORhVNAg; Tue, 17 Aug 2021 19:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5253260790;
	Tue, 17 Aug 2021 19:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14AF41BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0288A40242
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeTQd7wR7D2r for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB33740215
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:47:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bt14so25092228ejb.3
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XzRIQTd6FK571+6ec58XTdz4aw/qkhqofdY1YZGvEJo=;
 b=JdASbS1ChlnFMkPYYEojmQNklahuzAZeaumoKpcEEMRTVlIPcb8DA9kS7OlY2iod9a
 haXJYqsoPj1TcfEEki0tkwjg3bmCRgQFVAbmpQC2nyE9UMWKsg2A7WnkqHgdv9Yy75MM
 rZke8Hd7Hm1d017SCPw7ycKZWosXbfJlWt/40289hxTaaWYT8GpfjxbqiRDrYqNyMa+x
 Uc9nPiFMjGpnf2vYJvaSVZz+s+hH+aZw+0qhEl/CEp9oPaFvRa2oRTRVnjPsdbWU/ps/
 /EvUNpiebEoQ6NbLh8uTBVk0FOXKBp9yi7Kd3Ut6B0ljrMDgKFPD09Ng0XNymf3DI0q/
 LJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XzRIQTd6FK571+6ec58XTdz4aw/qkhqofdY1YZGvEJo=;
 b=oFHf8IHzZnHPj6MuRRxCyOvHyuJZIYcpG6fykpSSoB9RzpN+JG+o8rng3qd91f/voX
 ceq21MrNvHQboZrnM5gwb4qyTc+WveoqP7/e0aortWA8u3/+QSwqP8r2M8O80STbSaWx
 aeKS+RtWvrmphtPm5YSpe+pKYJXhHaLJb8oOZk9g6wh5D6jL5IptJ0ggejYI1aPTDKbB
 9uqm7+rK0MTbJmPXGTzm9oYQpQgfU1iSgiJ1IvgWGCpfuiNaCMy8gvcyaM5lQiHUXtpT
 39lA6CBXhWoB/3tqiOVcB8QyXvOzOfLJM2wJ3Fqd7i01fTea9ghC0yGbHFXKGNQ2CRwi
 DqLg==
X-Gm-Message-State: AOAM531uSUHI3c5ntA8pJZHxZYcoE7awEyvbUGYwsUhMrLzWyMD3VDuY
 cXYo0ViYfA23hsIfnBhFVkLXIPbWv78L7g==
X-Google-Smtp-Source: ABdhPJzgdVkdZzcY2J6XeQn2+eKzAa/bfElwFIyMYUY3E5v1gIlgcEYml/GrxG0Oe/ej+eAvPksY4w==
X-Received: by 2002:a17:906:c249:: with SMTP id
 bl9mr5761024ejb.225.1629229675733; 
 Tue, 17 Aug 2021 12:47:55 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g16sm1135679ejw.74.2021.08.17.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 12:47:55 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20201107155250.427556-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d22b2bcf-27a3-3d98-f594-5359e35522a0@mind.be>
Date: Tue, 17 Aug 2021 21:47:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20201107155250.427556-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: break circular
 dependency
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



On 07/11/2020 16:52, Fabrice Fontaine wrote:
> Build fails because of the following circular dependency:
> 
> fontconfig -> util-linux -> udev -> systemd -> polkit ->
> gobject-introspection -> cairo -> fontconfig
> 
> which results in the following build failure:
> 
> checking for UUID... no
> checking where uuid functions comes from... configure: error:
> *** uuid is required. install util-linux.
> 
> To break it, apply the same ugly workaround that was applied for
> libglib2 and cryptsetup until a better solution is found:
> https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice@gmail.com/
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2c6ef073e7e98e13daa409e1ea6130e9abd32c87
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 I found this old patch because your other fontconfig patch didn't apply... It's
still failing in the autobuilders, so applied to master, thanks.

 I'm not sure if the workaround really needs to be called "ugly". This is what
util-linux-libs is for, right? Perhaps it would be a little cleaner to
unconditionally depend on util-linux-libs instead, but this is fine as well.

 Regards,
 Arnout

> ---
>  package/fontconfig/fontconfig.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index ee82cc1de3..018a28556e 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -10,7 +10,8 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
>  # 0002-add-pthread-as-a-dependency-of-a-static-lib.patch
>  FONTCONFIG_AUTORECONF = YES
>  FONTCONFIG_INSTALL_STAGING = YES
> -FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf util-linux
> +FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
>  HOST_FONTCONFIG_DEPENDENCIES = \
>  	host-freetype host-expat host-pkgconf host-gperf host-util-linux
>  FONTCONFIG_LICENSE = fontconfig license
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
