Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A5DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:28:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE9C61039
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BE9C61039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDFA80EE8;
	Wed, 27 Oct 2021 19:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQyHglEo-v82; Wed, 27 Oct 2021 19:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B862F80DD9;
	Wed, 27 Oct 2021 19:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB1991BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5126063B
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hh0AraN-xiet for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:28:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5C5A60627
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:28:40 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r4so14302454edi.5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zbIgrEAdy7mCz8HnhRCa4+vv9o3C/GvDLHQ5XnJYNPw=;
 b=DegMRseh7pwedk6Zvbv+Ng4r0X+yFvs1Oclt8qsB9PTiOhwW234BlIbc1LImBvJ4Ah
 hrhP1OeXhk2cwUK08SrYuvuW8OVnnbNXSMHCuJh9e7hqUpPVntAd1mw5RQ1d6/6i9TeY
 JcqjCHLLgj4W1hrSQPqQBDk6MMtGYc1MH/pusBwJnMTO5YiJJpEubxHaXDAWndGHHl+l
 QxfBOkzV+UaPihFaUDIAqQg5zdN2Mt+If6W8sxfoaaBQ5B8szvJTNKAuQSB599ZiZArY
 KA9PJZSEk5Ig8O+q7LThr3/E01JhoEePxpXmmYo1juaXuliCHt7dYwsH1kcZziQVjgTM
 Yg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zbIgrEAdy7mCz8HnhRCa4+vv9o3C/GvDLHQ5XnJYNPw=;
 b=qfKl3WVNQsYyLOE7oZKWz8E6raGP+CEB7xkkPD1fAqU7Ed1jYYsW3qCdIY5RJyvIF6
 4bb3d6Mn0uFgbjF9Hj/4zCjfEvtY50K1juyGfJrPq0a63Co53SqfKKb0Z58ggXGD4z9h
 D20trCCBSwRxFHVIkfpt7UaUW9GTUQU/EagyKvrf1Xs9Yo/Wso8FWApIym9yf9biDuij
 yc26Ja4dsygPu60uCXCON6l7PRTlfI8qp3evGGfrBCD3VyHs2mw+Sk/c+hw/3LO0GA69
 wuw2oLG5gtZax+ph8QXrDDsWVTy3rtk8D7j48PoDIb/ICkfUOPVugvYewCIZ7tFVtnh8
 1iOA==
X-Gm-Message-State: AOAM531gLGtkMD7W3F88XGGnB5M/RT80FdjxziTiI3qaU995MQ5QX+nM
 VLDhbEGZz/+S5Rl2NmqW2O3xBQ==
X-Google-Smtp-Source: ABdhPJwN+daaYEtiyJK6blBTUCPMzjQrla64kzLKecMwVUBBurNIVWkmEC89+1PwNdxD8Oxo1yLZFQ==
X-Received: by 2002:a17:906:6149:: with SMTP id
 p9mr39249055ejl.362.1635362919001; 
 Wed, 27 Oct 2021 12:28:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jo18sm391620ejb.22.2021.10.27.12.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:28:38 -0700 (PDT)
Message-ID: <d1949716-f65f-41b3-80f4-b1b0546357a3@mind.be>
Date: Wed, 27 Oct 2021 21:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
 <20211007095147.688449-6-kamel.bouhara@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007095147.688449-6-kamel.bouhara@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 6/7] package/kmscube: use libgbm virtual
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kamal,

On 07/10/2021 11:51, Kamel Bouhara wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> kmscube requires a libgbm implementation, which until now, only Mesa3D
> was providing, so kmscube had a direct dependency on Mesa3D.
> 
> However, now that we have a proper libgbm virtual package, so this
> commit converts the kmscube package to use the libegl, libgbm and
> libgles virtual packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [ Kamel : add dependency on recent libgbm ]
> ---
> Changes v2 -> v3:
>   - Fixed comment suggestions
> 
>   package/kmscube/Config.in  | 16 ++++++++++++----
>   package/kmscube/kmscube.mk |  2 +-
>   2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> index b6ad305bfb..8c5fe9b7b0 100644
> --- a/package/kmscube/Config.in
> +++ b/package/kmscube/Config.in
> @@ -1,9 +1,17 @@
>   config BR2_PACKAGE_KMSCUBE
>   	bool "kmscube"
> -	# requires libgbm from mesa3d
> -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> -	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	select BR2_PACKAGE_LIBDRM
>   	help
>   	  kmscube is an application to test kms/drm drivers.
>   
> -	  https://gitlab.freedesktop.org/mesa/kmscube
> +	  https://cgit.freedesktop.org/mesa/kmscube/
> +
> +comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGBM ||
> +	!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT ||
> +	!depends on BR2_PACKAGE_HAS_LIBGLES || !BR2_TOOLCHAIN_HAS_THREADS

  This syntax is invalid, kconfig can't parse it. Please do minimal testing of 
your patches before sending :-)

> diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
> index 7b458376dc..5719f72ba3 100644
> --- a/package/kmscube/kmscube.mk
> +++ b/package/kmscube/kmscube.mk
> @@ -8,6 +8,6 @@ KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
>   KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
>   KMSCUBE_LICENSE = MIT
>   KMSCUBE_LICENSE_FILES = COPYING
> -KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
> +KMSCUBE_DEPENDENCIES = host-pkgconf libgles libegl libgbm libdrm

  Since I was anyway editing this patch, I took the opportunity to order these 
dependencies alphabetically.

  Regards,
  Arnout

>   
>   $(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
