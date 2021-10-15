Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041FCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B10860F39
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B10860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353BD60EF1;
	Fri, 15 Oct 2021 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7ZX3ne9V0p4; Fri, 15 Oct 2021 20:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB6E60BC3;
	Fri, 15 Oct 2021 20:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD5741BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA5860BC3
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPdD5jH8dgwh for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C63F60B2F
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:47:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ec8so42846951edb.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LTK8saPSV5Zq3F8XEtGPRjTUpGqv2ZL4sSz7c5h/bNg=;
 b=EpJ2ePPMJhhdVTlLB9VLzJ82iFVLjGKOXQqLvrZbAu9oXZxyzBADYhlrCUKFBSnMci
 q5QriztWRot3DSnoUukEFjW7SAa8TCzdSo1y8fD6gh5aionxfJIxEVy/7Fii5mTNosTl
 IBRUvMd4bfwMlb0rwt7CTjnBHXxLDCuweFcQ/hR9h8GxMU368KYvZCxyQbJtIG3k8nSp
 K2TR++/lvaTWypX53q9E3dd7CMLza25IDjykRvu1Rv/gSBkcq6h7rhRaqS8+OcieSVDT
 Nohy/AW2ZOO/bnc7YwtnpKEfMgRXHGOTT/oqGblHUT/0Pegf8jlB523fSIugfDeotmwR
 r9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LTK8saPSV5Zq3F8XEtGPRjTUpGqv2ZL4sSz7c5h/bNg=;
 b=zDIsR+Mb9Y4vvJHnf0PuclDlf+HAw94GoXi3bXacJpc1kiISpHvtrM6VwYwWEO0bud
 ZVrXaqDk8XuAAY68EC6gSK+OB3cOzahXVIV7BQG0ttIGlOIeguPnvQM6syYSONIzyN2W
 fqw3l5jL39z7VzYiTGnVjddntyLLLWn5DenU/0afJshdmZETkAIgT/pUqW4RvFgAAdzt
 SzcTBxArQC56aT2DC3CvSjJf3+nokWVwCR+TD/sLEUVP4Qj9nliRgY2of/9uZkhRkIuR
 kgKwEnCJjad5MZZOVEIA1rC8h4erkGI9R7bryLexLgxPnwP9Qr/1sSF6iFZhugs3aBb1
 4ovg==
X-Gm-Message-State: AOAM531SBmAijt7p1HYNvkEN1M7L78FYXnJSYlvLxrspX0KILd1h4Y7P
 sIl/ZgTB3WFYQNvbQIvqVwpJXg==
X-Google-Smtp-Source: ABdhPJxsk8OJGAwAbN1bgk+jHM/Iau2am8dMhHKhI/C89F2AjTM8HMB5WtDhr1+8KTuOv3xITeiNMg==
X-Received: by 2002:a17:906:3cb:: with SMTP id
 c11mr10050199eja.404.1634330856873; 
 Fri, 15 Oct 2021 13:47:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d22sm5100201ejj.47.2021.10.15.13.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:47:36 -0700 (PDT)
Message-ID: <fa0de507-3043-a8e7-0292-da2761b361d9@mind.be>
Date: Fri, 15 Oct 2021 22:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211007093101.1643900-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007093101.1643900-1-kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/psplash: add support to psplash
 personalized png image
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 11:31, Kory Maincent wrote:
> Add an configuration to use personalized png image. If the configuration is
> empty we keep the psplash default image.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   package/psplash/Config.in  | 10 ++++++++++
>   package/psplash/psplash.mk |  8 ++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index 5053ebacf7..da99b264e0 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -27,5 +27,15 @@ config BR2_PACKAGE_PSPLASH
>   
>   	  http://git.yoctoproject.org/cgit/cgit.cgi/psplash/
>   
> +if BR2_PACKAGE_PSPLASH
> +
> +config BR2_PACKAGE_PSPLASH_IMAGE
> +	string "psplash image"
> +	help
> +	  Use a personalized png image as boot splash.
> +	  Let it empty if you want to keep the psplash default image.
> +
> +endif
> +
>   comment "psplash needs a toolchain w/ wchar"
>   	depends on !BR2_USE_WCHAR
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index a0f01869b4..882c17704a 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -18,6 +18,14 @@ else
>   PSPLASH_CONF_OPTS += --without-systemd
>   endif
>   
> +PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
> +
> +define PSPLASH_COPY_IMAGE
> +	$(if $(PSPLASH_IMAGE),cp $(PSPLASH_IMAGE) $(@D)/base-images/psplash-poky.png)

  I changed this into

ifneq ($(PSPLASH_IMAGE),)

around the whole thing, and applied to master, thanks.

  Regards,
  Arnout

> +endef
> +
> +PSPLASH_POST_EXTRACT_HOOKS += PSPLASH_COPY_IMAGE
> +
>   define PSPLASH_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
