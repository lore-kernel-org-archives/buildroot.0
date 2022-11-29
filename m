Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA458C4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 909A3400DD;
	Tue, 29 Nov 2022 22:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 909A3400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMRC2fnwUXhg; Tue, 29 Nov 2022 22:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 994BD400EF;
	Tue, 29 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994BD400EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3C211BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD085415C7
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD085415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06fiJxNAcWND for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B141B4151D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B141B4151D
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:20:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q7so23431929wrr.8
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rghj6ZS6d5ZXUMGpExdPMuBLj3RjVbppoT/Jk8hwEAs=;
 b=aBT4mHY6sKG+q4wfneaGTLZ1lhISuuZDcACzo9LtWl+4+95faW7gw8Gvuecnodzo8l
 NtnJjTrCNsvRnjXeHv7mKj3h4q9Pa2j2BJBS4yYiZ6KtOoYgYVyLItbE6yFKW7HUQlOK
 BCDQP+XMn0RhrfEnmgF9/emJbC/v4vIJH02j6nnl+fGYPLVKjUG2mTOTuUBvTQVeU2Pv
 AI9cinTauLoYr7+rtXksPqL0LxF1diPmBGtxZuRd+82Y6QiwGidImSD/EIskMDHb35Iu
 UM4f4vBZF6xUvTVVb/AukUv1gixzI0YIbbI+1v3whuHNR07WjBvK50dkcdL4Lv8WOx5X
 X6pw==
X-Gm-Message-State: ANoB5pm5PbqAtLX7rq+aoF4Lu1pm6Bf2Q37WuRwKWo1l/eiufHlsOrld
 0irrE6ycLlv0JVaTdUZbdFTJ8w==
X-Google-Smtp-Source: AA0mqf405sFix6lfV5I2lSs5c1EEYeca65kJOGCeR5V2wUntIMNuQhwn66sI9lUV7wEvpjNtan74pw==
X-Received: by 2002:a5d:6e0e:0:b0:22e:ed53:771c with SMTP id
 h14-20020a5d6e0e000000b0022eed53771cmr37359135wrz.297.1669760421939; 
 Tue, 29 Nov 2022 14:20:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adff6c3000000b00241c712916fsm17694773wrp.0.2022.11.29.14.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:20:21 -0800 (PST)
Message-ID: <be923fdd-55a3-d7c6-c280-ce8de0a811f1@mind.be>
Date: Tue, 29 Nov 2022 23:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221128142347.536380-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221128142347.536380-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rghj6ZS6d5ZXUMGpExdPMuBLj3RjVbppoT/Jk8hwEAs=;
 b=PMp8vqeS+k11Un5C5BnrGniHIwXd8DwXXp2PlH5ec5xPFa3+S0z4zQtF8w+UqlIBx1
 omCutP+/tqo+cQ9xZX9odsxrNo6OY4rnbMb9ZB3rIzG9di4xn79vxkh+C1apKPiT5ujl
 ku9c/69NfKC3HbU8MCw9vzOPpG+icuks2bYxuMfMg420rE3oAhruvmqLxnMlltK6GTRo
 9FjDTd+HnZDF7t9+CizthVxmwV5QQk+Ys/EariEJrzEhSZ91CKGu6R9fQfXMXiDzblIN
 2yPwfjmxFNQqD3dl3uxgZf/A08FFRuucgqZwJEZdUQW5ohQQJbT5lpi0/PbVZLYaCrOQ
 A8Qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PMp8vqeS
Subject: Re: [Buildroot] [PATCH] board/freescale/imx6ul(l)evk: fix
 repeatition of "to" string
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
Cc: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/11/2022 15:23, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks, after fixing the "repeatition" typo :-).

  Regards,
  Arnout

> ---
>   board/freescale/imx6ulevk/readme.txt  | 2 +-
>   board/freescale/imx6ullevk/readme.txt | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
> index 90355f354f..5bc03771f2 100644
> --- a/board/freescale/imx6ulevk/readme.txt
> +++ b/board/freescale/imx6ulevk/readme.txt
> @@ -12,7 +12,7 @@ Build
>   
>   First, configure Buildroot for your i.MX6UL EVK board:
>   
> -In order to to do so there are two supported options:
> +In order to do so there are two supported options:
>   
>     make freescale_imx6ulevk_defconfig
>   
> diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
> index 77acec2615..dc7c5f3678 100644
> --- a/board/freescale/imx6ullevk/readme.txt
> +++ b/board/freescale/imx6ullevk/readme.txt
> @@ -9,7 +9,7 @@ Build
>   
>   First, configure Buildroot for your i.MX6ULL EVK board:
>   
> -In order to to do so there are two supported options:
> +In order to do so there are two supported options:
>   
>     make freescale_imx6ullevk_defconfig
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
