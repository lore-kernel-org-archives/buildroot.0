Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24DCCD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3107340488;
	Sun, 17 Sep 2023 19:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3107340488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BExGuLCV5vGj; Sun, 17 Sep 2023 19:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFD34053E;
	Sun, 17 Sep 2023 19:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFD34053E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54CFD1BF406
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DCC6817A1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCC6817A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9WSuoX0XywJ for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:15:08 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B280781765
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B280781765
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-500cfb168c6so6283462e87.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694978105; x=1695582905;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgfXKODnO+MNsHKNssiFocBlLbekNwmQ/AKccZMiR38=;
 b=gWGj60616zh/VAKazh/zuqPozFze1OB2UU6wfWQ2NxoTHcnXSkNFdhp43DSgD8rTeD
 HjI+xM1LNBztn1HrTvpdZOmb0V0ZrcHhlErMffYxcgGWJWn4d7zMae4/tOYuJP5SjYxM
 0F+BO/pz82gi4RwPhbg2yiPFLFg710UOxBhr+Iu3U69ctRQhFejlrHZFaY/Ro7uUtm2f
 2rqdIE8MKIqNs/ASbchQ6Vi8zjqS/gYuHyCTrxwOgkTYKYiQhBwkI8c3uP3enK2E76d/
 Tw8lFlKMUExPsdR3TtIBlsU4tgSE7axjqjontteNvZYVq6BHIBUdWyWUjLc1Zy0qzUna
 dF7w==
X-Gm-Message-State: AOJu0YzlBLcreGcvBML0u2ybWw7JVLFZK8nlFbelpn+qDzLytSYYHjXO
 uYtI2+WxZQsdBrHGZNT1gIKlrg==
X-Google-Smtp-Source: AGHT+IH1q7nl6eNxICC5ZU33vjiyA5G9xJiw4UfDB1OjxPhd3SpK3wnlKYz4Cfah/XzrojRjpCmSiQ==
X-Received: by 2002:a05:6512:33c8:b0:502:a942:d7a8 with SMTP id
 d8-20020a05651233c800b00502a942d7a8mr7463526lfg.69.1694978104933; 
 Sun, 17 Sep 2023 12:15:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t16-20020aa7d4d0000000b0052574ef0da1sm4938160edr.28.2023.09.17.12.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 12:15:03 -0700 (PDT)
Message-ID: <85c64452-6420-35ee-f097-b5fa3f93fe4e@mind.be>
Date: Sun, 17 Sep 2023 21:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230917163157.700211-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230917163157.700211-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694978105; x=1695582905; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XgfXKODnO+MNsHKNssiFocBlLbekNwmQ/AKccZMiR38=;
 b=Q9mwpBs0+rgNtMugiaZP7nmydjUcLjFsr75n+LBMs/1Q/1/dvG0HbX1vFEh7mkVFY/
 MYdHTu/fmWgDqBITQHyL8JqeGK5Jr+eUY+NiaDsyBbt/GrM53VnULyjlKTTSQnqFubil
 sOnZDx7z8O9e5eytVTnaUFh01RS7qkRi2G2ctKMtuKYwd5nlMOpRsyQF+8hiBxhmIgDE
 mCURrrsW+qpJDRwY9OUGXjpzUe7bxCVAz+HlrKXFzAf6u37WOHh9CNpFe3CTYXTPiZBv
 Wm9hgOohcmQk0exxmpP7qjb40GtfvLZZysnyLMPMUysahvHsI/fdluMoKeIRuJuQgyES
 FjeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q9mwpBs0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 4.0.8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 18:31, Fabrice Fontaine wrote:
> Fix CVE-2023-3648 and CVE-2023-3649
> 
> https://www.wireshark.org/security/wnpa-sec-2023-21
> https://www.wireshark.org/security/wnpa-sec-2023-22
> https://www.wireshark.org/security/wnpa-sec-2023-23
> https://www.wireshark.org/security/wnpa-sec-2023-24
> https://www.wireshark.org/security/wnpa-sec-2023-25
> https://www.wireshark.org/security/wnpa-sec-2023-26
> https://www.wireshark.org/docs/relnotes/wireshark-4.0.7.html
> https://www.wireshark.org/docs/relnotes/wireshark-4.0.8.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wireshark/wireshark.hash | 6 +++---
>   package/wireshark/wireshark.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 6598f51f53..f044f99483 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.6.txt
> -sha1  a60b6f8063df2a711932ba869ae86e6476087cf0  wireshark-4.0.6.tar.xz
> -sha256  0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884  wireshark-4.0.6.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
> +sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
> +sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
>   
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 80a986cfa3..500bdbb77a 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WIRESHARK_VERSION = 4.0.6
> +WIRESHARK_VERSION = 4.0.8
>   WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>   WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>   WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
