Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB01C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387CE409A6;
	Tue, 14 Dec 2021 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSPgq-pt5YIL; Tue, 14 Dec 2021 19:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AC4408CB;
	Tue, 14 Dec 2021 19:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4391BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD8B817EB
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWtcKpQHJLK5 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:41:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8EA6817A7
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:41:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o20so67203544eds.10
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bvKXTmDpPMr0Cebq2npAHfW8qzsEByV3VfXPdUB2kLA=;
 b=HNwxP0XoDQ1QXE+h6T0XOXvvF/s8TXXZ3QSu/TZTzUcC1KtBcHPyoUTg3KmVTmpnK2
 kbqOc+6m+7fAUmsyP8TVWSs8hLSApo6QrBj3k1Exb3bHdkosBCQH/4J3bWk9euT5Ggr8
 HsijnRkKUPF3gpki4d8FzjTli7FP1y6Bt3jsKudyHpsfG87jdzyQ/it9muyPLfBbTZAX
 FGpjdJlCenXMPn5Q5eNgkbBZOO5X0K4YFDnynbvZQEydi7x8j1uvmUQGVLAU98kloh2C
 a0DU3/UgHaOKgg3HPradnrEhOc8aC+AkYeoTn8KwHCRYNqX1qLagvsXddCovuUSkRs9Q
 L80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bvKXTmDpPMr0Cebq2npAHfW8qzsEByV3VfXPdUB2kLA=;
 b=dsur/9YyhsVf7KDMxK/w8CBZ2eeBWrCdkNJnlP7AvdSgOQQ0+FX2jjlPkj4Oc1lKEp
 LRij/ijlWYJx5+tg9SXZ7ZM4ECl6WY6WFWR/z1H1VZPUrfnKTk1S/qNTi0EXW7Fn8xQD
 cdbU5sPEu39SiUKTc4nBYYJdDNSiZQ5mXDDHNYVnv7rKDombmfG0PZ/Oe5mTKjxGmbx5
 0GBkKM2Oix2efGwQkCfoCav261czsb72OeXKcEBhrw+FB8vQrU032vtdHkiStMLsc3GS
 U5vymedfRWYn53IpgvlxU5GlejUH49DrtiTwAhA353QTfrWwkU7fofyCMNuE5tfdGIvr
 H3Ww==
X-Gm-Message-State: AOAM5313UxDBBUmo0EUB4hpCSdwsHG7BFWnik7ZqOhICE7O+crcK3nE7
 IB6PuI+uP69Af/VOcfpHJfwX3A==
X-Google-Smtp-Source: ABdhPJzkp5HjRLC5JUrmR0c9iZzXZL3i37ivC7Qnv7v/PRLIeewOnM46Oo5sustT/PZA9SVn25I2IQ==
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr10471859edh.125.1639510861198; 
 Tue, 14 Dec 2021 11:41:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s12sm208319ejm.147.2021.12.14.11.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:41:00 -0800 (PST)
Message-ID: <c3c37dcc-a0db-3ffe-6765-a332c4af8047@mind.be>
Date: Tue, 14 Dec 2021 20:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211212191706.6408-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212191706.6408-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-plutotv: bump version
 to 19.0.1-Matrix
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



On 12/12/2021 20:17, Bernd Kuhls wrote:
> Changelog:
> https://github.com/kodi-pvr/pvr.plutotv/blob/Matrix/pvr.plutotv/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
>   package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> index 3ad0d4e875..6f115bb8f8 100644
> --- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> +++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  0b85c5c9583239bcecccccc2c43fc6d604bf5a4e4304238c8635410823ab8ae3  kodi-pvr-plutotv-19.0.0-Matrix.tar.gz
> +sha256  1707cd9c61e6874f7e3ea75e1136ea0ccdf8be67a2a41ee09feab746a36f4d14  kodi-pvr-plutotv-19.0.1-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> index 15c7135880..f2d1879b6e 100644
> --- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> +++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_PLUTOTV_VERSION = 19.0.0-Matrix
> +KODI_PVR_PLUTOTV_VERSION = 19.0.1-Matrix
>   KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
>   KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
>   KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
