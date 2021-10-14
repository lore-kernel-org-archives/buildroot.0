Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DDBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D742F61056
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D742F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C66406FC;
	Thu, 14 Oct 2021 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mf1o4pbiBOmy; Thu, 14 Oct 2021 21:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C4040477;
	Thu, 14 Oct 2021 21:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C77B61BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B724A825D3
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtJ6hl9PKTkT for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:00:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B9FD82430
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:00:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i20so28539893edj.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cVLNMeeGQDq9oOVrZlh+vJN+jNI4/cCZ89Ry4BPAGZQ=;
 b=M3SDcqLtHoVDRALba7oE7wmRbCcC9VdbIpFOQo9NxuZW6lzijbB0iwz2Y1PYgH4SJY
 TMnpMYe5vh3wsdrs6sTutwOvEkxtybooQ/B/bez7v7Np9yRArMs4eIAkJHk73Nyami59
 j86o0TXWzGSLklBPgiG0NgLgs046HlTCDzwDw/2Z45TspK44+ZasZPn/5drlucYfL5eV
 MBBrUaLe/GzgYNHC1SnQfSB1j6kAdrx9qQC2iIEJQbgAYZutDcuRaBw3hNpkAljzNKm/
 DBCJRtcSOPCxDAubVaqxxbohlFq1N2NXqlVOLzo2Fl5ahmYdChHJj4A+MEumyQYRi3hV
 sguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cVLNMeeGQDq9oOVrZlh+vJN+jNI4/cCZ89Ry4BPAGZQ=;
 b=pR23wN5DkihpHyEYDGZ4B4J+TehTYnjAlJU9bqVvgxzXsNYy4MqWoZo3kr/R0W73q0
 uO6o9QsKjsSmn9rb+lFMmMcyMR3HdS0JfJMRitZMpdaUk+RHW7yw0hNDY5ujni4vaP2D
 uhvGX23NRtGlOK6nbNCoC5IDkeu6EtDjxoBWT+lvhD+bH0VuG0SxBF4UFsYfDrOrTOqY
 R13DS/jc1YSP+Vt+CULykCy723ikZ8+KIHjveWzEJuH+zH/g0DVrswEFm0jpH3F/i2Z4
 gdAv/pXiY5g2UfkshSLqwiO/V4gVSG926SQGK2w721bvHBZ+nqKdvRiSivWVUPzasiiv
 4Uuw==
X-Gm-Message-State: AOAM533D07YRKYVZ4oTbC+Vqs6UJb2itlRv7qRJ9aUxgRfkAiquLFOON
 nfwW8n4qtZalNdS4QdcEscOEeFVVuLlE2S3a
X-Google-Smtp-Source: ABdhPJxbzPR9NosNpReFnxWQXTCuIonIQ2/e2K9zVMC3FiyUStaWHBD7qyiPqmkr0GljR783kVvuRQ==
X-Received: by 2002:a17:906:7ac9:: with SMTP id
 k9mr1623145ejo.411.1634245204428; 
 Thu, 14 Oct 2021 14:00:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q23sm2955285ejr.0.2021.10.14.14.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:00:04 -0700 (PDT)
Message-ID: <d61e2474-fd34-c1a8-3fb6-88556eec9e60@mind.be>
Date: Thu, 14 Oct 2021 23:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211008212859.141323-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211008212859.141323-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/jhead: bump to version 3.06.0.1
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



On 08/10/2021 23:28, Fabrice Fontaine wrote:
> - Update site to get latest version
> - Update hash of readme.txt (changes not related to license)
> 
> https://github.com/Matthias-Wandel/jhead/releases/tag/3.06.0.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/jhead/jhead.hash | 4 ++--
>   package/jhead/jhead.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
> index ffe75381b3..bd9c8560d5 100644
> --- a/package/jhead/jhead.hash
> +++ b/package/jhead/jhead.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated from download (no sig, hash)
> -sha256  ef89bbcf4f6c25ed88088cf242a47a6aedfff4f08cc7dc205bf3e2c0f10a03c9  jhead-3.04.tar.gz
> -sha256  46c870a208305489eea862ec8b05b030ba1f06d99195f660dc0ba541cc38d82b  readme.txt
> +sha256  5c5258c3d7a840bf831e22174e4a24cb1de3baf442f7cb73d5ab31b4ae0b0058  jhead-3.06.0.1.tar.gz
> +sha256  8b709512c737fc0c1e1024800b9a44c54d14ab02132c636a66c3ac66955c3e95  readme.txt
> diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
> index 49cb03da61..a206e2fe34 100644
> --- a/package/jhead/jhead.mk
> +++ b/package/jhead/jhead.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -JHEAD_VERSION = 3.04
> -JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
> +JHEAD_VERSION = 3.06.0.1
> +JHEAD_SITE = $(call github,Matthias-Wandel,jhead,$(JHEAD_VERSION))
>   JHEAD_LICENSE = Public Domain
>   JHEAD_LICENSE_FILES = readme.txt
>   JHEAD_CPE_ID_VENDOR = jhead_project
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
