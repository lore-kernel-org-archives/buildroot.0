Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D8ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 21:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1F56102A;
	Tue, 30 Aug 2022 21:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F1F56102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDZNtScZoTHW; Tue, 30 Aug 2022 21:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9741961027;
	Tue, 30 Aug 2022 21:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9741961027
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 793701BF388
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5402781776
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5402781776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Keezke9qpCD4 for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 21:29:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D398175F
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D398175F
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 21:29:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so24720821ejb.13
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 14:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PFGuaJrEugTN/WzF+NtGEMzQtyR27du1jZ7nANUecgg=;
 b=r2MwLa71jrSRuLYjzdIiAxwYgwtF77GGKMhLdumbF+42vqGJcBomxK7qD0+wXlWReZ
 PkmlYOLIGoswmZ4b1b87+aWHMjlRAHkHJOJFQnv000P6p5EvVDoYNMfRHaB45M4TRSWs
 yc8kj9rrxaeH/xX3g4IebLY+VHz0YRuINel2hAI7q9YS4mP+mNw8wt+bWhSBhrdlkeHZ
 bu0Gd2Huqpo1aNn6wSNOlZMBOMiZSMNzik8C80mLFX+wInscYT6T/RftSgJGuL2xIjsW
 uTTW7nuOMRcJELV/p1k8vlSxB932ZkLR68DbGuEwWeM1SgEu1Yhq94JAtOqzjoMLrgHI
 wfag==
X-Gm-Message-State: ACgBeo0EWX+DanTUGsYjUFuZVnqMt9Aoo/XQ1iSC5RGm+Y/+o81w59kB
 ICP5M/EDlUeSOd0xZmXNyCvv4g==
X-Google-Smtp-Source: AA6agR5ZAfy1dln2229AWtYkIBKsayi/uIIvkmhTNjgYtpclBLpnxREa8T44r7MOQWHrQvsQgeF58Q==
X-Received: by 2002:a17:907:72d5:b0:73d:d6ce:5d3a with SMTP id
 du21-20020a17090772d500b0073dd6ce5d3amr17106977ejc.489.1661894961671; 
 Tue, 30 Aug 2022 14:29:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a056402501100b004481af6c760sm6277956eda.0.2022.08.30.14.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:29:20 -0700 (PDT)
Message-ID: <7c9466b3-bd51-c161-fd75-ff4b8f1e18c3@mind.be>
Date: Tue, 30 Aug 2022 23:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220829171415.129914-1-marcus.hoffmann@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220829171415.129914-1-marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=PFGuaJrEugTN/WzF+NtGEMzQtyR27du1jZ7nANUecgg=;
 b=J6UmG6pJbkVBSbjuRlzNJk7Agt1KgV3szFMYfF4Z0kQg1AhV8d/QCY33DPbcUoUq16
 zV+zSj6S5Fmxl+a4XAIrLYbZbWKWZboDGJFKQNDFGIpA7LYKM0jng071ah9BiGtjWlZU
 8zO1CmzGJT4Ij3fcWMxCoUdjBH1vCmTaars16cjy+Y+tC3KZSi7S8R7FPzqg0Ckg9yIA
 ofCMsMeAvhZPsGCzzKtcXj1ujiLsZKmEcg1Uq0kzvPXTVGrRl6nSTTcYcbASxQnHdQUH
 BVbkNXmxFC5zIWgjDBouq1+nmW/+ZR58g5qiR5vgCUV29bcWYp0ebHmWp05tkT+HSZqJ
 dATA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J6UmG6pJ
Subject: Re: [Buildroot] [PATCH 1/2] package/libzlib: fix CPE vendor id
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/08/2022 19:14, Marcus Hoffmann wrote:
> Can be found in this CVE entry for example:
> https://nvd.nist.gov/vuln/detail/CVE-2022-37434
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

  Applied both to master, thanks.

  I extended the commit message with the URLs into the CPE database search for 
the right and the wrong vendor.

  Regards,
  Arnout

> ---
>   package/libzlib/libzlib.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index 933732d6ba..431c48739a 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -11,7 +11,7 @@ LIBZLIB_LICENSE = Zlib
>   LIBZLIB_LICENSE_FILES = README
>   LIBZLIB_INSTALL_STAGING = YES
>   LIBZLIB_PROVIDES = zlib
> -LIBZLIB_CPE_ID_VENDOR = gnu
> +LIBZLIB_CPE_ID_VENDOR = zlib
>   LIBZLIB_CPE_ID_PRODUCT = zlib
>   
>   # It is not possible to build only a shared version of zlib, so we build both
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
