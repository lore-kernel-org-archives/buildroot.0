Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E95C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9EDF61015;
	Wed, 30 Aug 2023 20:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9EDF61015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIjuKKRmosc3; Wed, 30 Aug 2023 20:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2949861257;
	Wed, 30 Aug 2023 20:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2949861257
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C50741BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C74641B80
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C74641B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocXAfw6OGSwE for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:12:57 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2DC41D89
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2DC41D89
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso4442766b.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693426375; x=1694031175;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57ItKlBEJcpzhP4t3wMcd0f3t+9fFSJ+2anBbUJo/lQ=;
 b=bX1q5dvJ+e9DsnIVg+KgSTWnbD6+psaLww9n9EY5X8URDhrcFXIvTZZb3SCDbc4hr6
 RsbTNAJzX9pQlOhqplJ/bovtUGOJqZjoHB0NrnoHyhyKXJOnbfsHEp9eDQc2s2CLGYo/
 ZHd6vwOWrj5KMCCU/ZrnoWxS9wseY5rl+jkCibHqrg3Ucrw319DpFjkc/2HPXU1wYbia
 fIaTNcQi3067Ou+2O6AXBLscsmc6nJPF7KmJEBEI9Y3R8W/9KJvaY9Tp7k9f3+xWy6Ak
 DLjjR6L7Sm/MSGnbN/AqTuND3mnJn5BeDa/inMjBPCbcxtw8LzbBYNy4U4uFzYvOgYR7
 EBEA==
X-Gm-Message-State: AOJu0YyU0go4+MGuNpVSd0OXF5WE3zjV+Bcl/TunZUekP56Ma+ELNmfG
 5pomvG41+Vnrqsvlv0Xxfw1Tdw==
X-Google-Smtp-Source: AGHT+IF0hnCjHmemmITZx+rSNj/hb1yteD5epPJg2N+Ou7OAerI3wMtv3Sw69BS1i7En29/9TRC6WQ==
X-Received: by 2002:a17:907:98d4:b0:994:522f:3f4a with SMTP id
 kd20-20020a17090798d400b00994522f3f4amr2516842ejc.29.1693426375576; 
 Wed, 30 Aug 2023 13:12:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dk24-20020a170906f0d800b009937dbabbd5sm7486670ejb.220.2023.08.30.13.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:12:54 -0700 (PDT)
Message-ID: <0d128196-501a-6866-bcec-d136c41ef38f@mind.be>
Date: Wed, 30 Aug 2023 22:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com>
 <20230828212221.2328358-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230828212221.2328358-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693426375; x=1694031175; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57ItKlBEJcpzhP4t3wMcd0f3t+9fFSJ+2anBbUJo/lQ=;
 b=YmBWW45ARIzAfzVvxy8CbKWP4fIkoj9Xdh9JEjEQFoRVFcVGypMFZ69/HknlQSd3tS
 rzSs9zO1v+C/i6cj0xzP7xJQTjrR4THScDYqGDKrPAWRsPnazggpGvzbocdsEKOk3DKp
 +EUJtQpCaXJIYYGJxTDrtmug29WhmUFfE5m7iJj49hCaEX1vSLzUSh0RGDoP9vbhODRK
 PrjrMM32HpO3qhbevZVtp20q3dqfe2Szz5ZQSgsdmwETtE+UDEMlU5c0wSnMbOIh8ReE
 fXjZc5mqEaxr3VOOPwmQeeNqhEJRToHG2Usm8WTn0MLDqTpSIX2RfnBV5o4sh4Y6c/+G
 w3aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YmBWW45A
Subject: Re: [Buildroot] [PATCH 2/2] package/heirloom-mailx: ignore
 CVE-2004-2771
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



On 28/08/2023 23:22, Thomas Petazzoni via buildroot wrote:
> The CVE-2004-2771 is already fixed by the Debian patch
> 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch. The Debian patch
> description is:
> 
> Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
> 
> See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
> more details.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/heirloom-mailx/heirloom-mailx.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
> index bb2e1f48de..6e0f2c31ab 100644
> --- a/package/heirloom-mailx/heirloom-mailx.mk
> +++ b/package/heirloom-mailx/heirloom-mailx.mk
> @@ -14,6 +14,8 @@ HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
>   HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
>   # 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
>   HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
> +# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch

  I've added "in the Debian patches" like in the other comment.

  With that, both applied to master, thanks.

  Regards,
  Arnout

> +HEIRLOOM_MAILX_IGNORE_CVES += CVE-2004-2771
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   HEIRLOOM_MAILX_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
