Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73AEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B5581B48;
	Sat, 30 Apr 2022 18:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COEopLePV-AJ; Sat, 30 Apr 2022 18:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871CF81B14;
	Sat, 30 Apr 2022 18:52:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD141BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFEA860B6A
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5fLyN5DUX7t for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:52:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C56F60B58
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:52:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i27so21055251ejd.9
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vBiFQSVXFcRTTNPOq/svdjeMH3IELdCNbdXKBl9CFcc=;
 b=OCcwkwWtzsby7qVWCurkIrNjAawKqHZQNl44AfpATC0GdnPC05rXoLFR35QVLhk/CB
 9sGL73ccBYm5mzQwJzFME2UNcY3Lo2gyJhX3sj++NV+q1WZiG+GpXwtvkpr5PrpLrxGQ
 2g1E4cV/gitnnwKxpuoxg7wt2A6/t0nuwbrSfWllacJLd8aEXpOHVMSqtKQcIH/OMFL+
 R1/U9tUMvVlC3vQId9dL69c9J8TQ8XXsV5reiW/u4A6lLhfIjgV/4q4ojuGrdNLU8xKq
 KdknmYS5jmyDu95HsxYVgkE8ZTaA5zrg0yqdJLjQcOh0W1dhCdE9mVgXqbQEapuYsPSS
 usOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vBiFQSVXFcRTTNPOq/svdjeMH3IELdCNbdXKBl9CFcc=;
 b=T27xHR68j8+7OhFZ/p6s6FQdvLhcJUMO4qXeoMSqiMf1ZIyrmzjevfpyB51D+PkSeO
 2oH7F+oA4P36rTh1rzQxPhW2PtbYku3k/TTe5CUkk0mg7lRXqCbzV5SuOz8AEA+Prbps
 cD2ArfErHAiOr0v0elmPIBjmb08ai8DkFaxH7PuUnyY06FQn7KT5Dw6hHTy7A6PWNw8+
 fjACoBG4gVWPIAJfMUuJgYFKWRYLBYR7FCW6BFHeRp3qZ8+o3RZ2WLq3p6UInF58Zm4b
 liPMqGTxLDjOViC4mzNgFnjSEk2dQuVvAfD3ddtOXkihS4ZSfblLTSnOWQlfh7qi251d
 t1rg==
X-Gm-Message-State: AOAM5331vwpdUgOyQ3Yp4vMdTE4FW//EryMqyvtvEDLLPrZ3CUYMFOS3
 jk0IZjExbfqwX2xd23g+ERpb/A==
X-Google-Smtp-Source: ABdhPJxlenQGyzRVAYXkRmlwpRCFvdqpCoGdtOTVwAY/6U/xBchBe3AArnvGMs6DnjClpccPOb6vRw==
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id
 cw12-20020a170906478c00b006df6b35156dmr4743430ejc.578.1651344767261; 
 Sat, 30 Apr 2022 11:52:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gv1-20020a1709072bc100b006f3ef214dd2sm1868573ejc.56.2022.04.30.11.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:52:46 -0700 (PDT)
Message-ID: <35fa6666-418c-404a-0804-d46e3131d2b0@mind.be>
Date: Sat, 30 Apr 2022 20:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220430112333.414925-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430112333.414925-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/libosmium: bump version to
 2.18.0
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



On 30/04/2022 13:23, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.18.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libosmium/libosmium.hash | 2 +-
>   package/libosmium/libosmium.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
> index ccfd3b09b0..cb53a91c67 100644
> --- a/package/libosmium/libosmium.hash
> +++ b/package/libosmium/libosmium.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  ff85d55ca83d77fc41f6b7ae77f3d8d4337d299cbb4cc60c00e1f9d90d94e71b  libosmium-2.17.3.tar.gz
> +sha256  c05a3e95c9c811521ebad8637e90f43ab8fb053b310875acce741cc4c17d6f59  libosmium-2.18.0.tar.gz
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
> diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
> index 6510af4e77..f7ced04de3 100644
> --- a/package/libosmium/libosmium.mk
> +++ b/package/libosmium/libosmium.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSMIUM_VERSION = 2.17.3
> +LIBOSMIUM_VERSION = 2.18.0
>   LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
>   LIBOSMIUM_LICENSE = BSL-1.0
>   LIBOSMIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
