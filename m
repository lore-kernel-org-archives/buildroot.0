Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96C2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D7861B1E;
	Sat, 23 Jul 2022 20:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D7861B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5KAIzFALxMC; Sat, 23 Jul 2022 20:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83CE61B14;
	Sat, 23 Jul 2022 20:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83CE61B14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4351BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D4C4019C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D4C4019C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IPg3LjqF7de for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C11C40117
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C11C40117
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:40:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso7073389wma.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IK7KtbhoHUuSL3yRgwIgPVqebgmeObI9BZ34peFGeJI=;
 b=NCMgKFdlYEob20mM86XwkdGhNuxQOJiwqRjl9AY841MDK3Fjvs74Wy8cCz7cei0JJC
 WSf6wHwC53FJM6kWcv2yoWK59M4HwdAmgE5xV7Njcx9wbqXU4L6rPuD69Y3+4BhLMySb
 SNfFEvWtxj5iyAngzp29QsR0JAqebVuKqDbkCsqPDe3PSgitYfV524oqh8qf47eTmRW7
 s06r0v9PrGci1LDp+OxGgIugGodfYirh/yaCGdAH1musQd9NjUVA/iUhWJW0kIzBKJOv
 6ewwZ/CCH8sK0rJ0LYFbYBtafxScG7KKK00Tf2eGawTS720LdWCOuxfdnvNUzidkED1U
 tetA==
X-Gm-Message-State: AJIora8R8AUFH0RKhxxQTxuPq9oXf6IaPIhRqAq8sHtSCLX+G/aJbpXZ
 btHusxSDButoTAZh9NAPa31LXZB4sVuSCA==
X-Google-Smtp-Source: AGRyM1ujBEDri7SOXXqV/F8t33K3W44zTUdAEO0/U7uUXKheDLuypgd+TeZyCKHdPUQM+piIgZnaug==
X-Received: by 2002:a05:600c:1f08:b0:3a3:1b00:c201 with SMTP id
 bd8-20020a05600c1f0800b003a31b00c201mr3808733wmb.171.1658608834284; 
 Sat, 23 Jul 2022 13:40:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c218800b003a319bd3278sm12582346wme.40.2022.07.23.13.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:40:33 -0700 (PDT)
Message-ID: <eb0ed4af-1e3e-806b-a135-79c85dec23df@mind.be>
Date: Sat, 23 Jul 2022 22:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: vsvoboda@forkoder.eu, buildroot@buildroot.org
References: <20220624140742.78223-1-vsvoboda@forkoder.eu>
 <20220624140742.78223-2-vsvoboda@forkoder.eu>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220624140742.78223-2-vsvoboda@forkoder.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IK7KtbhoHUuSL3yRgwIgPVqebgmeObI9BZ34peFGeJI=;
 b=JwkxM3Rri3eaimZOc79T1mx1+5pDz0NB3iolfkwhFdTbP7CZxio/4mkUHV1jk8yep2
 nJlUZOBOZFxst4TDg1FOSrDDIpJa61iMTL5nir7g+l48wawMc5KnIMas8kpK1RAUxrNJ
 +QymSsesnOO/MaguJZMiphdHncAlYQojyMf62fKlwOYm1TdPZL8Y5NkhNFB797Um0vyr
 3JFtcS5b0lFJvxHG0TVhyPKAJ2cDXpqoBFvG2Mah8FVLtsKMavtTLb+UlQaFAYsei9jE
 ksvzBDuS59PyduJ7DPPw5plzJG9ltR2izDL+GoNEh14RNcYu+ReAzGivu4cR85Aag6s4
 vSmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JwkxM3Rr
Subject: Re: [Buildroot] [PATCH 2/2] fs/tar: add option for zstd compression
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



On 24/06/2022 16:07, vsvoboda@forkoder.eu wrote:
> From: Vladimir Svoboda <vsvoboda@forkoder.eu>
> 
> Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>


  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   fs/tar/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/fs/tar/Config.in b/fs/tar/Config.in
> index a4e375c68b..e88a5bb91e 100644
> --- a/fs/tar/Config.in
> +++ b/fs/tar/Config.in
> @@ -46,6 +46,11 @@ config BR2_TARGET_ROOTFS_TAR_XZ
>   	help
>   	  Do compress the tarball with xz.
>   
> +config BR2_TARGET_ROOTFS_TAR_ZSTD
> +	bool "zstd"
> +	help
> +	  Do compress the tarball with zstd.
> +
>   endchoice
>   
>   config BR2_TARGET_ROOTFS_TAR_OPTIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
