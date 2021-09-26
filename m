Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8BFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD1460F9C
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AD1460F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B39281A73;
	Sun, 26 Sep 2021 19:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDIMgFhBX-Dh; Sun, 26 Sep 2021 19:52:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6580281A3E;
	Sun, 26 Sep 2021 19:52:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21E511BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121E681A3E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG3-eP2NmndY for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BE1080F24
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v18so24767059edc.11
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=OnthlfaLHw1cm/DD9MzfouZCZuVSkSHCclIK7OFnKk0=;
 b=Pm4aPyZfmRji72DjqCQTE39uSJpGpOJtqy79ZjgQhBC8f5aggrN078mP96fDRcShQG
 wl58UqYVSICjPki2t5ZpJvTqrsYJJZnyIsoViHB1PHQcJr3rjZGKVWy0pPW2yheAJpSa
 62LMo73ZI/WuxuU5U09OLqHGaD3oy+gE6mvgdZVXX1V2VI9JSJnOAumV9Sgd5NKoss2I
 o26Pb42yYDx4P3r/TMqyaSuyRB7BGRtkDSwoGplUzVVkhisueQu6N9bzoDeMe7vpP7tt
 tJqGKLmA7V3sNi4g0unyzO/C4cvHzSGesHc0kEsATFjayt730D5yTq0a+i+WifBPB/Wd
 6TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OnthlfaLHw1cm/DD9MzfouZCZuVSkSHCclIK7OFnKk0=;
 b=NiNagsrLuA8lN0q2enG25dXewMLuKM8TUNwRXXxnDMm6Dqhb7KCMLhok66yyKAkzLc
 w3DEIZhm/gB9WnIFAg/fHHB+CkvpNJ7RIxdM8Xg9qAAtZ6VkQZbubsXp2ZBlr6oYgZV8
 DPn2N6oWWUaOpT/4iVlTCVwMuszyjEjCxURm1Pk+iE9wcJpIOsvf6S5s0MmwdE7icN7s
 8VoualCZl2GzxYN3t10Prvy+YHL84+VkrbKjGhto0pm+RZCfN3GXODT9XY9PURQhKCff
 UjgolvYxHmUiyf0icwLLNZbYrMwF1rLy2fedmeSz1xyfx6dydo+TcCb2sB9SbcujfKsh
 801w==
X-Gm-Message-State: AOAM530OUccs33AjJUEQ6ThA32DTXNpvqoi1FGwYtx2ExaeD9vhl0f6T
 C9D43/CW/MU7eBuglD3oqkO/OA==
X-Google-Smtp-Source: ABdhPJyaEQ6qvmHS3zrLJF85gppGN1ehRT9TKNzMncpm6rYCVCpGF4yNj0cjneBT4D8QxdDPq9f9Iw==
X-Received: by 2002:a17:907:2cce:: with SMTP id
 hg14mr11780329ejc.255.1632685935659; 
 Sun, 26 Sep 2021 12:52:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i6sm7519607ejd.57.2021.09.26.12.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:52:15 -0700 (PDT)
Message-ID: <3c203d54-0589-6f57-73a8-4a8ab1604cf5@mind.be>
Date: Sun, 26 Sep 2021 21:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210926140826.3460762-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926140826.3460762-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-screensaver-rsxs: fix
 build with gcc11
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



On 26/09/2021 16:08, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   ...01-impSurface.h-fix-build-with-gcc11.patch | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
> 
> diff --git a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
> new file mode 100644
> index 0000000000..4bc127b860
> --- /dev/null
> +++ b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
> @@ -0,0 +1,30 @@
> +From fb23e136f88a94aa497e8eb4369bb06435c2aaf8 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 26 Sep 2021 15:59:29 +0200
> +Subject: [PATCH] impSurface.h: fix build with gcc11
> +
> +lib/Implicit/impSurface.h:44:9: error: 'size_t' does not name a type
> +   44 |         size_t vertex_data_size;
> +
> +Patch sent upstream as PR 52.

  I've changed this into the URL, which is easier to follow than "PR 52".
  And applied to master, thanks.

  Regards,
  Arnout

> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + lib/Implicit/impSurface.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/Implicit/impSurface.h b/lib/Implicit/impSurface.h
> +index 388701aa..3319820e 100644
> +--- a/lib/Implicit/impSurface.h
> ++++ b/lib/Implicit/impSurface.h
> +@@ -21,6 +21,7 @@
> + #ifndef IMPSURFACE_H
> + #define IMPSURFACE_H
> +
> ++#include <cstddef>
> + #include <functional>
> +
> + #ifdef WIN32
> +--
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
