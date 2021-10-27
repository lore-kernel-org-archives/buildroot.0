Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4CEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:27:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE4E60E8F
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FE4E60E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D4514011A;
	Wed, 27 Oct 2021 19:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id db72fy3C3Zlk; Wed, 27 Oct 2021 19:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2812F4015E;
	Wed, 27 Oct 2021 19:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE2F41BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB2E980EE8
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eno9lBoS3zeC for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:27:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5189180EA5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:27:09 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z20so13435372edi.0
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=R8tdSGdYH+GbfTtrVo2zL4xNsXKK68jKykHjAiGlgS8=;
 b=ISjwPh4KsKq8GRMJWKXn8JAdem5Jf6pA/fxgRAzOrS2dA78LDefpQS28suFUikWvoB
 I1IeWgOeVJf8gV4t3ee6dtJKQuFc55IDEF8l0JO0NG4d0ZngyoE3CBzDGPYSLyuEbIlo
 57pagPqQKGMDiXT2LRzwJmT1HIjIzb6MRZWJhbw0usgxtFnyNR2yGalLJtN9yY4qye6N
 2Pbs0vIidZxN2I8owkPalN0aMGm9fGdrqk6UAEIQbe3yGjN7vPLwyTjeqvbxPFNLhteL
 E5W7vLc5agN0yUENF9G7UclBImwkVFzZfDgLMM7mVXJAW8tb23AYIOLRBgo7wmNPJIn9
 ELow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=R8tdSGdYH+GbfTtrVo2zL4xNsXKK68jKykHjAiGlgS8=;
 b=EcvDEmteU6TdvHNhJ0Ez1bICOKtdv+BcCORtmv5fqj4p1z9YOUEtF9N8JFJaJAf6IQ
 f7X4AL+dJWefWyVtXW2zGgOEyGeRjc229hNyoclChc0JN3VopiBrgyAT14LB+/L98V5v
 uA9IC/ZQXH4RwAxYoqvJup77s/LQCfnXkWtN8AvifWGj6xR68yPrG/DfRVy90IKFAOiv
 Yhut1+g6OldxOvKoas1Nn8jCKvu/kce+Lqr89hO6Aep1I998UrOEdmqga/ja6f9bf2dc
 3cpAPWFXfYaeMw9fbZ8keaZYgnSr0aYcXykL4G1iH+o4dY7cTtBYx83EZL9ifyyYf3E+
 St+A==
X-Gm-Message-State: AOAM531rRT28APfQj59hFrjJfEB8CV9vgw/oFE6KhZM7tIgzGBxBxA53
 8EqDXqhXLPNqHWt3gNDwJhGsRg==
X-Google-Smtp-Source: ABdhPJyLvTL/HIZJ31GDZsYPKAzEPo3Co7+TjK5FLGAeq/Gt7Gfp5L2P0XAP+tmUtPjnzck3/xoN6Q==
X-Received: by 2002:a17:906:6ad0:: with SMTP id
 q16mr40895815ejs.552.1635362827513; 
 Wed, 27 Oct 2021 12:27:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t6sm511019edj.27.2021.10.27.12.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:27:07 -0700 (PDT)
Message-ID: <b6e63e74-4bfe-de38-243b-80f2186e17a2@mind.be>
Date: Wed, 27 Oct 2021 21:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 1/7] package/opengl/libgbm: new virtual
 package
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kamal,

On 07/10/2021 11:51, Kamel Bouhara wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
> wayland.  To enable building libgbm in mesa3d without x11 & wayland we
> need to create a virtual package for libgbm.
> 
> Also other packages besides mesa3d may provide libgbm.so, see
> http://patchwork.ozlabs.org/patch/647235/
> http://patchwork.ozlabs.org/patch/939703/
> 
> We also introduce two feature that shall help user choosing the version
> implemented by a libgbm provider. This foresightly avoid building package
> without having the required libgbm version (e.g. kmscube, qt5, sdl2
> etc.)
> 
> It turns out that libgbm has seen several additions in its API over
> time, and therefore not all libgbm implementations provide support for
> all features. In order to account for this, this commit adds two hidden
> boolean options that allow libgbm providers to indicate which optional
> features they support:
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT and
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF. These booleans must be selected
> by the packages providing libgbm implementations, and depended on by
> packages using libgbm.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [ Kamel : introduce gbm api features ]

  Series applied to master, except for 4/7 and 5/7 because they received 
comments. So sunxi-mali doesn't provide gbm yet.

  Bernd, if you like to update kodi to take into account libgbm, now you can!

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Squashed patch 1/2
>   - Added more relevant comment for each features added
> Changes v2 -> v3:
>   - Updated commit message
> 
>   package/opengl/Config.in        |  1 +
>   package/opengl/libgbm/Config.in | 24 ++++++++++++++++++++++++
>   package/opengl/libgbm/libgbm.mk |  9 +++++++++
>   3 files changed, 34 insertions(+)
>   create mode 100644 package/opengl/libgbm/Config.in
>   create mode 100644 package/opengl/libgbm/libgbm.mk
> 
> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index cbc001427d..cfa51def45 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -1,5 +1,6 @@
>   source "package/opengl/libgl/Config.in"
>   source "package/opengl/libegl/Config.in"
> +source "package/opengl/libgbm/Config.in"
>   source "package/opengl/libgles/Config.in"
>   source "package/opengl/libopencl/Config.in"
>   source "package/opengl/libopenvg/Config.in"
> diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
> new file mode 100644
> index 0000000000..7aa3efb97a
> --- /dev/null
> +++ b/package/opengl/libgbm/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_HAS_LIBGBM
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	string
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +# gbm implementations should select this option if they provide the
> +# format modifier plane count feature. This API was initially introduced
> +# in mesa3d version 17. A gbm implementation provides this feature if it
> +# is implement function gbm_device_get_format_modifier_plane_count.
> +
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +# gbm implementations should select this option if they provide the
> +# dma buffer feature. This API was initially introduced in mesa3d
> +# version 10. A gbm implementation provides this feature if it
> +# is implement function gbm_bo_get_fd.
> diff --git a/package/opengl/libgbm/libgbm.mk b/package/opengl/libgbm/libgbm.mk
> new file mode 100644
> index 0000000000..ecab234720
> --- /dev/null
> +++ b/package/opengl/libgbm/libgbm.mk
> @@ -0,0 +1,9 @@
> +################################################################################
> +#
> +# libgbm
> +#
> +################################################################################
> +
> +# This package requires to install a gbm.pc which needs
> +# to be provided by GBM providers.
> +$(eval $(virtual-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
