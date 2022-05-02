Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD4BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C223415C4;
	Mon,  2 May 2022 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNKOTGff1c6a; Mon,  2 May 2022 21:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC6341579;
	Mon,  2 May 2022 21:55:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3E81BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79585600C5
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dveW8QL6oY-5 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87F44600B9
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:55:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bv19so30161494ejb.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Rfz/ZD3DkQG0c/0PuygQKgRT1dt1/do7zGVtnhsBKr8=;
 b=b5IiXqaIhq1wuG2fFC0lHBsKmF8+mZ3oTKKSAcwmiFziZZEk8NY3JgMS9TCmjw87dL
 ri02lHxBaLKoY/DGOrNNas+dC6gZTtYr3Jj3hxlRmSmTxxoWpqhaOYf0RHMR7IHYAh8E
 pUVnh4ixPbqImHHdAU20i8WpkQjNa2o/ONwabf7ISTT2SfiAPRItsWE5+5YHT+eaIdcX
 chvvNPNupbxbo0Jl9lZQ3b5Ys8TJNKiRA1dlt22p7n4SHkjHFH6SDSrnTJKbtXNIVK8x
 uZ3dhRqJF/B8+MrmFbnBRlxmDCfTaE+eWkDEfVgIEu2wn6M0ApbDtQDf4Kpis5toUmrl
 iRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rfz/ZD3DkQG0c/0PuygQKgRT1dt1/do7zGVtnhsBKr8=;
 b=Jd7tI0wXOe5d7O51vWLbE0fXBT12sU8SESId6p5hHK2LeFOrykOBg1Jcr5ksEDkfoY
 Pja2mt8uWrA4tHK9VmBoHgUsY2Ld1pHiFmojLImHSZRRuMo/+yCj7fiExXu2rT/jI9yA
 nZSvF8Rc1NqGTeBX3/ySVbXzT8A03b7T20XK4bkhTHF/N/2Mp/yj3ohLsTS9R4J0ebxk
 14diyRZMbLD/D3+UjwqCH/Cp6mV+tFc0b4GJFaCyPjRY85Gvpa4OCmBBkkrug8D2NRO2
 KJPVSy4uMIsfhkvK/XKx6pJUKdRVX4dA7n4wTImtQNmrprKj865BoAm+P6JBXl94rw56
 656g==
X-Gm-Message-State: AOAM5316JgR6FsOJvdAAgUdXQ0kr2qJxWJ3VmFi+6fQwv3TG4jEB9nmK
 zBERz1zsa6Jfa8uBaWm3SeEWPA==
X-Google-Smtp-Source: ABdhPJwJOrUbZkiYD/IgexU/b9eJLdxvHMeuvU7De5dQbvb6juY91U4UdixkB4E5DW5w6ajyXm+m/g==
X-Received: by 2002:a17:907:3daa:b0:6f4:8607:930c with SMTP id
 he42-20020a1709073daa00b006f48607930cmr864667ejc.102.1651528521780; 
 Mon, 02 May 2022 14:55:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214df1sm3965479ejb.87.2022.05.02.14.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:55:21 -0700 (PDT)
Message-ID: <937fda85-259a-64df-c721-b12cf4478a6d@mind.be>
Date: Mon, 2 May 2022 23:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502082656.461316-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502082656.461316-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/rtai: bump to version 5.3
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



On 02/05/2022 10:26, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtai/rtai.hash | 2 +-
>   package/rtai/rtai.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
> index f0afafbd7c..f2eb7f33ad 100644
> --- a/package/rtai/rtai.hash
> +++ b/package/rtai/rtai.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256 13669da744a0ba411bdb8e47fa47b6e19171646ae42c8dbb2735d12e555fb1a3 rtai-4.0.1.tar.bz2
> +sha256  57acd3ad46cc8f1e01dc21089a24587c59e7328cbac06abb62bb0152de0b9df7  rtai-5.3.tar.bz2
> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> index 90f2cc4c8d..6b309ebf85 100644
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTAI_VERSION = 4.0.1
> +RTAI_VERSION = 5.3
>   RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
>   RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
>   RTAI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
