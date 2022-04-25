Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73449C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095D34167A;
	Mon, 25 Apr 2022 19:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5Hi7JrGkYzR; Mon, 25 Apr 2022 19:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD92441621;
	Mon, 25 Apr 2022 19:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEA101BF312
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D6140A8B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwM8PfzmaZFA for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0169540574
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:03:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i27so31452438ejd.9
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hkXuv7r9qbziNQHowL4SJsGdytjbB1XbjzJu2CvhMoo=;
 b=A4ggMzED2aAIu5B3igyCs6i1aN/3yWn9mKDuC1UxxDwc5z9gkHlnKMxmLtyg2DvHDF
 F1tKfy28awW5Q/b23viDpRsYaVZ1C7cWrgFTI+WHcEJsF0KvU0rMOb0woXvomR1ToDbn
 erttlUusT6I2CEtV+3NwJPcAF5WCdvz+KBYNg5sXCYF8TO5+RwdJ1ou+/bfHJSlv9bB8
 9+DHYiigwHJyzojb/2tv3W34dti6PGNoe+whf25ni6nkLwVCFFfmhHlz88bFLRMBDd/q
 5sHV+b1IEDlLMbvHhiAUs/tasfhVIRWh9rzUR05EXVjSnAKGhkaHFfUiljpnsm7IlHp0
 jlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hkXuv7r9qbziNQHowL4SJsGdytjbB1XbjzJu2CvhMoo=;
 b=A22Wx99qHzLencIUcwBW+vlgjpAlaLgDsZ4aaYzbC7o17lXBewzjn6OenpDK41xhok
 978DWPVs2+S/GR1egx1qNeAmq/HqvYkzSHcU1aF61i8SairyHKdwyEenKZ7Sc6KglVyD
 dTmnTYp/3gcJMvUI0rww765fSQsGrKUWWrVBF9TZ4cOmSx9PGoRa6hAOcCb/oFSEW4CK
 9qsZkyIGxZWUSTNN0yn0v8qQI56+c4jmtiy3+20vU91NHTheFwUXoXhwsflgqn/elxI/
 tzLcSOtpPDCq4+oNL5+79GZJkAT+U4V3bwFQMkPYnciAYy1i2KhHzfwreiLI/9y4U4X8
 eiww==
X-Gm-Message-State: AOAM530kBK4TT6q97TJWhvW2Q2Be5fUYRb+Zb19OjPIYpq3IrJRgiMij
 lMUWE8pX4c7wn/DM83iAZXKkPNSC9No2Ag==
X-Google-Smtp-Source: ABdhPJzDeKuJWO1vO2QCJBwwVBEd2IgNUH1Xq5tImh3GJeDnR1WdBEcmHEjTJnzp6bYJJ6MFvHeSgQ==
X-Received: by 2002:a17:907:7da2:b0:6f3:a802:d52d with SMTP id
 oz34-20020a1709077da200b006f3a802d52dmr1816788ejc.706.1650913430165; 
 Mon, 25 Apr 2022 12:03:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm5025604edv.5.2022.04.25.12.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:03:49 -0700 (PDT)
Message-ID: <8d52be71-ea3b-e704-7e50-cc2434160758@mind.be>
Date: Mon, 25 Apr 2022 21:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220422173415.662392-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422173415.662392-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-peripheral-xarcade: bump
 version to 19.0.3-Matrix
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



On 22/04/2022 19:34, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
>   package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> index 5cb774fe26..3ceabd4759 100644
> --- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> +++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  27f592e07c788067c97f7bbcac8a2c6803954730e6f0f66f2047a1d939e6648d  kodi-peripheral-xarcade-19.0.1-Matrix.tar.gz
> +sha256  589b5355bf9b0b5183ecf2d93a4a80ca1ae317a9fdf4efb9c14eb7114b4ec13a  kodi-peripheral-xarcade-19.0.3-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> index fd8b1af38c..ef3cc6fef1 100644
> --- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> +++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PERIPHERAL_XARCADE_VERSION = 19.0.1-Matrix
> +KODI_PERIPHERAL_XARCADE_VERSION = 19.0.3-Matrix
>   KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
>   KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
>   KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
