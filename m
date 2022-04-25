Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D006EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851FD60B59;
	Mon, 25 Apr 2022 19:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8s643vy5OlKg; Mon, 25 Apr 2022 19:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883B960AC9;
	Mon, 25 Apr 2022 19:35:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70EEE1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DD4E8125B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6djcKCzC2Tx for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ACE381254
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:13 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y21so12807014edo.2
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xMiwq2zFazDYpyMWqhq7093u+VoJYKWVFR+vgwyzU4Q=;
 b=C9HTc6hpvuHybe6yLsxSzh70d0MFD3OJdXF/elsnOXSrlqs+AUtMl3GNJC/yjItjEG
 EcG/UDpvckvgtWVgswhbEEB08QU2BAmG9u+BEdn2mmbnRnhYSuD9uEsc/Nn6RV0syLGj
 o7oYPvziHaM00rBzoB1fRdMc9VWEMWzqa5OziGW22iVKW7r/8ZAo3fYKt2bNZI543MPc
 j0u+TqUyNmMvEFGTZFSVunhulEXpcH7Rx7SAnNrdUyIcKjQGXm8lqEZMqNlGDj7WkZOw
 KMPFP6SOVHKa7I1HR80/Jx6F013l4enQVxxNWhVsDuDoNpLJLEYLAE6b06cYz0Vpy+sw
 7Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xMiwq2zFazDYpyMWqhq7093u+VoJYKWVFR+vgwyzU4Q=;
 b=TTGPdxupPNARXUMCVi5BsJL0xzTntA3W7PaHrzruxzNMKkkolX3Fti+grM2LFGJn+K
 IclBExpi9Z637WnoX2t+3E0qayBDwez9AOaoVxrilKYdpU5swT9T8VHY6Bhft7E0eXDJ
 Fvcw0T7caTbwWwW+eTvP5qZA9RDfYEFGWES6zCjn9EI86gXNaaTLR5ZPWiOoMbCaduYd
 4wDf+E6ZwuOmpXSdagkHJ4ByYCw5r0YNEYvoain+qG6zBXM++B5iFjqodgNgSbUtnIA0
 BSCR/JLwA71NNQgVDGLnHo37+pnsbol3iIM7ZxXO8tbsj9CU3nP2o9uIPqPCGQjqd1cw
 Y0ZA==
X-Gm-Message-State: AOAM532rjAMsfo0/daEnpJT8p0iOs/0rxhQDrBfSwOdSvVuwHCXuMR4U
 qzg0IynixUKw9762QdCNXySjEA==
X-Google-Smtp-Source: ABdhPJzWXoh5fASmdpBNcBA2+8XuHSPSJ4ZyTuJ5s9WyqabyrgqKcXsqMnyCoGoNSLaZxwVNG/gOhA==
X-Received: by 2002:a50:eb87:0:b0:425:c3e2:17a9 with SMTP id
 y7-20020a50eb87000000b00425c3e217a9mr17628182edr.109.1650915312285; 
 Mon, 25 Apr 2022 12:35:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a056402525300b00425cd5973efsm3768247edd.24.2022.04.25.12.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:35:11 -0700 (PDT)
Message-ID: <cc3a6965-017e-27ee-33aa-79db8bfa0805@mind.be>
Date: Mon, 25 Apr 2022 21:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220422220408.3173274-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422220408.3173274-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/imagemagick: SVG support needs
 host gcc >= 4.9
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



On 23/04/2022 00:04, Fabrice Fontaine wrote:
> SVG support needs host gcc >= 4.9 since bump of harfbuzz to version
> 3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:
> 
> In file included from ../src/hb.hh:473:0,
>                   from ../src/hb-buffer-serialize.cc:27:
> ../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
>        hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
>                      ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/7b2430c5ae4eed51685ec12bf778c07a0a8b1701
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/imagemagick/Config.in.host | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
> index 671b0995dc..5055101e23 100644
> --- a/package/imagemagick/Config.in.host
> +++ b/package/imagemagick/Config.in.host
> @@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
>   config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>   	bool "SVG support"
>   	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
>   	help
>   	  Say 'y' here is you need ImageMagick tools (like convert)
>   	  to support SVG.
> @@ -24,4 +25,8 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>   	  This is not enabled by default, as it brings quite a few
>   	  extra dependencies, and thus extra build time.
>   
> +comment "SVG support needs host gcc >= 4.9"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> +
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
