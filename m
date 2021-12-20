Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB25C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D555F409B1;
	Mon, 20 Dec 2021 22:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVRb-ZJ-WkiL; Mon, 20 Dec 2021 22:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B425409AD;
	Mon, 20 Dec 2021 22:36:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 701091BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CB2960E39
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUUbsxoNSJLM for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:36:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2590605BA
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:36:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o20so44224239eds.10
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6tQ11Z2h0a742a2Ltu87NtVBygY0qQ1dGXrLesZcbLI=;
 b=CNOyrz05XsLCN0/Mhm3QIdc5geKiB2onzuSQofBap5lUxIoPfbqqVS2QsSon2K3Ivl
 qI817LOrbMSGXueuf7FevvwiC5qb9DZWZTB9D2i9fch7S/rkqywJyvzVH5NGP17pTtPs
 Eenvk/XORmitHKTikx6qXwQ4SqX52sJqdmeXPZFYCsQrK0joOdsbVc158NmM842JqtaL
 y4vscD41IyCLyDqOXhthr1aTi3UNUn+2o6d7G3oArHw0QoYka7+h3OpKgqvV9CrRYEIm
 PbIpoHzuzfOX2NcLQvi6fLlghEvi/xxfCjWw0924ZJhrjVWjNgA83vn8UWetS3gHJXss
 pu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6tQ11Z2h0a742a2Ltu87NtVBygY0qQ1dGXrLesZcbLI=;
 b=nG0xJO9xv3qkCcFJIT5ox6C1o/IHe2N2vCPOmjRbvUauBq2cp11Lrz7UKvAjtgskUE
 6yQjSNBTkbpLyYYRo/LVK2pe290DaMHq3wJt8d6d1pm0+SkcxSD4dP9rqAldqBBHelw6
 GSwADgND2/Jp1c7kJwuLg4b5QnnaQdXfQbzepC98uvShAVIw134ehkBoWVpB2cbG+0S+
 hXZbdxqaMrupKA8MN7ExyEN0dMW07BBcjHNO81uf/hXsgM7kBTmXU2KZ7fmRU7dP1vpB
 2PIZLsOcw36nUDyGBtF1oiae0xqFaqtrgFrCbOQqb/0v6P5LfwR+35m0IOty7cBaPxND
 G5sg==
X-Gm-Message-State: AOAM5308eHZAzUf/GQ4hwywZmY8gqhL8+wPmASQWJGTaFeh8TFU7hgex
 QFglPmqjhccjjdCcgmXliXDeig==
X-Google-Smtp-Source: ABdhPJxTss50aOjuQeA7H5ueuOs006MejsB2DoLgN+ezgN71p2zQ7xiNGOuLKTEMJPYtiNInK+Ef4A==
X-Received: by 2002:a17:906:249a:: with SMTP id
 e26mr252245ejb.492.1640039777964; 
 Mon, 20 Dec 2021 14:36:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk40sm5794109ejc.2.2021.12.20.14.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:36:17 -0800 (PST)
Message-ID: <a2e1594c-74de-7ca9-daa7-7bba53d3b61a@mind.be>
Date: Mon, 20 Dec 2021 23:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211217191340.30275-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211217191340.30275-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: add sqlite optional
 dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/12/2021 20:13, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/frr.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 3bd587a1cd..cc83016f9f 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -54,6 +54,13 @@ else
>   FRR_CONF_OPTS += --disable-capabilities
>   endif
>   
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +FRR_DEPENDENCIES += sqlite
> +FRR_CONF_OPTS += --enable-config-rollbacks
> +else
> +FRR_CONF_OPTS += --disable-config-rollbacks
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ZEROMQ),y)
>   FRR_DEPENDENCIES += zeromq
>   FRR_CONF_OPTS += --enable-zeromq
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
