Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D3C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5B5812CC;
	Mon,  7 Mar 2022 21:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mF362jIDdMh7; Mon,  7 Mar 2022 21:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7673E81261;
	Mon,  7 Mar 2022 21:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB0B51BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA790410BC
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iAjT6FVCGbm for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14908410B3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:23:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p15so34855395ejc.7
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SlaNAtoUDot8Cn28z2bqUe2o2Eq7FdFfPxJC0SlZIhw=;
 b=ITQZLi1z0d1IMV3imcJFukO8mXkd/vpqdaYXXYZZCu6b/W6cL0FGe7tpek+pPqhq4R
 /T4L9uUd+9ouAWWamEcgJY53MCwBrebBWuuHC5ajoWcberZtUD1dhvXcwzTYcoeNWsV6
 eRfhW3vqZLzTI7NO+Kow5rGBF4P8v6inUtqqAnKNY3pJ39AxOYc+itD0KnkhCRpoWhUa
 +diogdHc8S6yw42J+2HIozSVrA1EdIz5k5qcqwpnno2xX71TUYW6N2I+uPyaVDyZIOLV
 hk+HIg7P9UtgoepjzH5j4hlU22UoAjL4vFKcrChv3JwUa8q0xA0pd2Oal3LtYlidQvUg
 MxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SlaNAtoUDot8Cn28z2bqUe2o2Eq7FdFfPxJC0SlZIhw=;
 b=gUDw/rMTt6M03caJ0dx59HbCFFFoosF4cdl9qkgQ8kuJq0EwAUAXxlQ9Tfkvs1kGbR
 hRz2m3STczBoEXzaYqP845EHYZ5ubSyefTYPhE7NIKkzCGclzwWjqE/D4W/zrcWiW/GQ
 jE7GO+FRafo9ezkdLNkyBAwcbUZbgUO/W+5T28kVkVTJ5L4cgS9n/WtnFS6U+ziP1cEq
 pgseqfTEvaZg8RjIA3lhdtUOJKJmjiKFfyaDfOAEj+glfrFHc2gSMetQaCPv7Yb8zZGA
 k4OjqcKqF1Dw+w1aqASLCPM/TVkzPn8dHfC9HC5x0Nc1olsfjhwX8djFATt8EKYB2bHF
 sdMw==
X-Gm-Message-State: AOAM532k6hqMAqwXMRpHsZKRLxMWYjjdtQWxFIpSUcFc3wmlhHnQNtvj
 HTatlnFRruQXgI7FvJuqVhSO8+O2efyBig==
X-Google-Smtp-Source: ABdhPJy05fRFOTGfQzepGSC/EKCMqOelb+64jpVSCjSW6urZTr/85THGog89QCmAbz1855mgRsxckQ==
X-Received: by 2002:a17:907:7d8e:b0:6d7:12a2:a962 with SMTP id
 oz14-20020a1709077d8e00b006d712a2a962mr10581306ejc.565.1646688217126; 
 Mon, 07 Mar 2022 13:23:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm6701935edu.51.2022.03.07.13.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:23:36 -0800 (PST)
Message-ID: <ad6c0592-4687-b977-221b-bd4f0b9b1f26@mind.be>
Date: Mon, 7 Mar 2022 22:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: moritz@h6t.eu, buildroot@buildroot.org
References: <20220217230638.98748-1-moritz@h6t.eu>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217230638.98748-1-moritz@h6t.eu>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix building
 cargo packages on 32bit arm
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



On 18/02/2022 00:06, Moritz Bitsch via buildroot wrote:
> From: Moritz Bitsch <moritz@h6t.eu>
> 
> there are duplicated symbols between rustc and gcc. Specifying
> --allow-multiple-definition to the linker as workaround until
> rustc is fixed.
> 
> rust-lang issue: https://github.com/rust-lang/compiler-builtins/issues/420
> 
> Fixes: http://autobuild.buildroot.net/results/53f/53f5598b8e520caaa135fb4923c09da382dab329
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-cargo.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index e74a8358bc..71d695d926 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -46,6 +46,14 @@ PKG_CARGO_ENV = \
>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>   
> +#
> +# This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
> +# and should be removed when fixed upstream
> +#
> +ifeq ($(NORMALIZED_ARCH),arm)
> +	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +endif
> +
>   HOST_PKG_CARGO_ENV = \
>   	$(PKG_COMMON_CARGO_ENV)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
