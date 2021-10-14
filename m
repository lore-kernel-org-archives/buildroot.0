Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10533C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC9B60524
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDC9B60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7429140255;
	Thu, 14 Oct 2021 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0s3jwt9aIQz; Thu, 14 Oct 2021 21:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EEE940114;
	Thu, 14 Oct 2021 21:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42411BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B365540114
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id co3fG4pS_ekn for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:41:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1DE9400D9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:41:21 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z20so29925068edc.13
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sbG2CIQREf52LbX185fOgWllek+YDrTdOx+tQB5r6PY=;
 b=TSD4DY5RVXapuaB6DQNKupy3iN+1Faa+H2Vbw+2mgxE57yjJJdkrQQ0NlVsZr4Gv8i
 cLo9QK3q2VyHgmoYwJzwWpW62tTdOdJXBUGPRwl7+qH9HGxc5evi9hqg14v2ngxvM2mN
 Xk62QSNiJYswIfpW21m6fzuUn5okPlObqlhSpuO3/JAmE0yJVPysULASZIhczP9YhhrJ
 ggtaatUKuZit0JYcf0YRfSmTQi2VVdQgdEzyg2snwGeXXsv+MFofJ8STJ7C7DVdYZ8jn
 jCqlnQ/hcGeVEpMwo64epI+tEfzis4aRA6UMqUTJZN3rFqASeSMp58kPoh5I2cE+lonq
 ntOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sbG2CIQREf52LbX185fOgWllek+YDrTdOx+tQB5r6PY=;
 b=GghglvPKOxhQc8BU410qNfx5re9r9ChlHl6zSM1LDxXHvGW/G2kbUNEgrniRYr56TC
 Csb7287eAT3iXz7pHVt0bCFUEY7YXTKRzWIhpbIBm1G/HK2y6ROOwDNGKugqo0vGHYDA
 piOKqPpkjTYaUZR3JQ+QJSqjngyX2JBexhu3vkDET7P/gTkyZGqnZqLvnrqqwK1k1TEn
 KouQpLJubTDnFDKA6Z/cks03XC2+gWAADqOztFXX2H5/QKo1baFm9ehOe3IxCluYes87
 +3Fqivd9iRTupmPxRy66ac0KAG1+87iANlmuFFncHO8w2n0ek3kb4TN3XE1JnserFjUg
 j3Hg==
X-Gm-Message-State: AOAM5309I+V7zA4qBn6BUqJMTbQGBbw3Fx2Un+WIk3Tv+RHFqRrlBO9g
 zl5JoX2XbUEsImT+0xhX8q/bEA==
X-Google-Smtp-Source: ABdhPJxtRBxFGGFzeJ5PkDe6GOHHHHGyzRedLQocctRQOWdhsb0UImQ4gbDHyy2iKKQ8ZhkDwSBvnw==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr1947232ejw.236.1634247679922; 
 Thu, 14 Oct 2021 14:41:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y30sm3002706ejk.74.2021.10.14.14.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:41:19 -0700 (PDT)
Message-ID: <621e79ee-3986-855c-6e4c-38f5b1de2484@mind.be>
Date: Thu, 14 Oct 2021 23:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20211010094224.109154-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010094224.109154-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libosip2: bump to version 5.2.1
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



On 10/10/2021 11:42, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libosip2/libosip2.hash | 2 +-
>   package/libosip2/libosip2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
> index 400158cd7f..7a08bf26a7 100644
> --- a/package/libosip2/libosip2.hash
> +++ b/package/libosip2/libosip2.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  4fb48b2ea568bb41c6244b0df2bb7175849ca93e84be53ceb268fdf9351bb375  libosip2-5.2.0.tar.gz
> +sha256  ee3784bc8e7774f56ecd0e2ca6e3e11d38b373435115baf1f1aa0ca0bfd02bf2  libosip2-5.2.1.tar.gz
>   
>   # Hash for license file:
>   sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
> diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
> index b86a72479e..967602b426 100644
> --- a/package/libosip2/libosip2.mk
> +++ b/package/libosip2/libosip2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSIP2_VERSION = 5.2.0
> +LIBOSIP2_VERSION = 5.2.1
>   LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
>   LIBOSIP2_INSTALL_STAGING = YES
>   LIBOSIP2_LICENSE = LGPL-2.1+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
