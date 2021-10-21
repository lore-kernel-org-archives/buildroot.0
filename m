Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D328AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4506E610A1
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4506E610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B4940221;
	Thu, 21 Oct 2021 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZGrY63XahEu; Thu, 21 Oct 2021 20:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AE6540776;
	Thu, 21 Oct 2021 20:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4DCE1BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2017832D9
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5vn1qPVrocI for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:33:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E098272D
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 20:33:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 5so9884edw.7
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HR+N0CqsKuo3lwrPOc6Kcag0PcL6RO1j5ao60I+OKDg=;
 b=WwjUzUYJPDkmzv8zbpabKlTChsgk0AdtEGgTKojHLm0iMZzY470XcA9qn4Cz4se6n7
 oTh7t1ofMwlVjrJ22YuMHceOhHKAVL19pUfjEX8mMvWcWvIuzm1QbWdBZBBD5PhYHxNw
 GuflIw1UcpC+uyhPduisD+pwmruwepjHG/BxlhvacYb9jqD95Upx3+2G1IrWpBfyQLYv
 ub7Aw3550dYKqT3UAwBe16l6VqdtfhNen9mXfDgNVSbP8z9A/lZ9ISmdI4sXroslMxGk
 Yl57LWkERrM5qtrkonEJcMbXso8HFJnFg+V0aW1hCZNsfOXRu9DnGGjmtDlyayhBN2No
 hohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HR+N0CqsKuo3lwrPOc6Kcag0PcL6RO1j5ao60I+OKDg=;
 b=Kl/Dw1cMGGGZdkdCdY0vr+zRSNLRtfL9NFOjrkdO/9DaTK8YyVB92a9ujAgrX+kWJa
 23nb+XLe7qYYEITXieLNL3pRlQQNvpM3KXeeZMnySUchR/TU1u2uudbWj34rC9b3Syrh
 iO5KOiRaDtTXXO2oNX55WnS4iLTCfuc0JoXayI2fgqhcauJX0lSBa/uupmChXL7POuYL
 VhTIcZR2vpA74ctfE9d8FoZQYe+RYfto4IwloEnMrz5pqID3Lvk7weuXOUqsz49wrYoV
 SgD1KHPJZLdcs7wg1H9PUjoaeUhU5O++s+0nYi0iaJs3xthsQ7BrENRSkzcmdZ2wzdbF
 HCBQ==
X-Gm-Message-State: AOAM5304fNU++oHwhIDvgjy0afVH7+kuzX+gBPyFkJO71nKqLM2PmRhM
 bd87x8nyGgqocjc2c6coLs4vyXchHMa0kZeK
X-Google-Smtp-Source: ABdhPJz1z+X0GAeaJAXq1eB8jIs4Q/NksGbA8QM+CvMAr2o1Yc+DDl26Je6dmUEqs6Kv9KqAHkVCIA==
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr10650247edv.347.1634848412967; 
 Thu, 21 Oct 2021 13:33:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j22sm2931458ejt.11.2021.10.21.13.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:33:32 -0700 (PDT)
Message-ID: <6bac7933-4da4-ae85-8df9-21f3c5f56bc3@mind.be>
Date: Thu, 21 Oct 2021 22:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211012164757.233855-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012164757.233855-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/bison: bump to version 3.8.2
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



On 12/10/2021 18:47, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bison/bison.hash | 4 ++--
>   package/bison/bison.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bison/bison.hash b/package/bison/bison.hash
> index 04b6ca03e..98ce5b97a 100644
> --- a/package/bison/bison.hash
> +++ b/package/bison/bison.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature from
> -# http://mirror.keystealth.org/gnu/bison/bison-3.8.1.tar.xz.sig
> -sha256  31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15  bison-3.8.1.tar.xz
> +# http://mirror.keystealth.org/gnu/bison/bison-3.8.2.tar.xz.sig
> +sha256  9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2  bison-3.8.2.tar.xz
>   # License files, locally calculated
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/bison/bison.mk b/package/bison/bison.mk
> index 841323306..27038de67 100644
> --- a/package/bison/bison.mk
> +++ b/package/bison/bison.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BISON_VERSION = 3.8.1
> +BISON_VERSION = 3.8.2
>   BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
>   BISON_SITE = $(BR2_GNU_MIRROR)/bison
>   BISON_LICENSE = GPL-3.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
