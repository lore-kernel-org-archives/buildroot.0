Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A8AC77B7A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2CC843E9;
	Sat,  3 Jun 2023 19:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2CC843E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBxbDbkhzICL; Sat,  3 Jun 2023 19:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2407A83487;
	Sat,  3 Jun 2023 19:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2407A83487
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD74F1BF489
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C398A611F3
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C398A611F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4drXFGVLz5AT for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7489B611E0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7489B611E0
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:00:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9700219be87so490878566b.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685818843; x=1688410843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1AMHFNAgsik9OH53JfEmZV0Y3M1/43lj02M1nZHxOKY=;
 b=J4tqwAWOGaHe33+Q4BbZuPV0EUYDP6aYCLUSxmjqVx3kNPXiWc8ua4PIqtKlWX6Gj3
 U9oAhTThDKgi9Or2LKBvtze9VVcBnFlhVAEniySydD+dHhqUwL5417fUYYXRtpN1/6qu
 3tlG+4y3lSIOs9Xy7/XuyHBzObBihZyAinORMyCuPP20YGqjwXHIkQFEJoNlSxwkj9ov
 31YcRv9lDrX1YN3SNzO5dMW7ISbJ00EvOOsgTtl1lkkVDOhDZKGT8cXqmUkgRAlxpD6T
 aprRQ47eklE/tJzN5DuRk3ahUgyJkr3tv7STcvuLwBvvTOJ2cyS0gMv1TeQEGqqNehpZ
 ZulQ==
X-Gm-Message-State: AC+VfDzdIJDIs4lvUBPsh+JvAUiWx5LJp9BZlneUU7cBeeyFv4CE+vDX
 91B4Q0R9WeSz2vHkdFdw4gCWBQ==
X-Google-Smtp-Source: ACHHUZ7yZDYHJhCsvY09aEf9qat5PRMZh4LsozJ3nbDnxX/woL8zH/Iz1qwEYNnD26A5Ryx7XvGHEw==
X-Received: by 2002:a17:907:6d86:b0:957:2e48:5657 with SMTP id
 sb6-20020a1709076d8600b009572e485657mr2390627ejc.68.1685818843452; 
 Sat, 03 Jun 2023 12:00:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 oy12-20020a170907104c00b0096f82171bdesm2188157ejb.215.2023.06.03.12.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:00:42 -0700 (PDT)
Message-ID: <44bc7985-970c-f5ed-1086-3d20d7082448@mind.be>
Date: Sat, 3 Jun 2023 21:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20230531114008.1634631-1-neal.frager@amd.com>
In-Reply-To: <20230531114008.1634631-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685818843; x=1688410843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1AMHFNAgsik9OH53JfEmZV0Y3M1/43lj02M1nZHxOKY=;
 b=BozUAezZT8/AXOePhmFqSbLmWvVM8gs6cyfd26APPYDkCDoj8PjayqZfr69vGXQ+2h
 V7M87eqB95UUT5xyAvnZ5NteTg/i2arLmCdXcirfXkghiGAjqe2FhOJzPxf82jl0cTFi
 7Y0/BUpDWVq+kSUmLLMDt1GEoWZJoRczZzBZSVurpn459MDvoNtl2PUJzA1k2vGrVTHb
 fJC7l8FF6q2uAaB381w1MZR7je2LjlC1eeaSvYcKOcrtWMjn1iWCSF48Del9M16Lqi/b
 Se/QWcOXM6WsZaP3LU8/QXg3ozLkt+aRWIAFuX6BXW6xtQxMRb3LEj7+eAEJLc2aj7yS
 AVYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BozUAezZ
Subject: Re: [Buildroot] [PATCH v1 1/1] board/kria/kv260/kv260.sh: remove
 trailing spaces
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/05/2023 13:40, Neal Frager via buildroot wrote:
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/zynqmp/kria/kv260/kv260.sh | 4 ++--

  You should also update .checkpackageignore (with "make .checkpackageignore).

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
> index e3467f3068..e03d67d8b0 100755
> --- a/board/zynqmp/kria/kv260/kv260.sh
> +++ b/board/zynqmp/kria/kv260/kv260.sh
> @@ -1,8 +1,8 @@
>   #!/bin/sh
>   
>   # This is a temporary work around for generating kv260 u-boot.itb.
> -# The problem is there is no way to currently configure u-boot to apply
> -# the carrier board dtb overlay during build, so all kv260 carrier board
> +# The problem is there is no way to currently configure u-boot to apply
> +# the carrier board dtb overlay during build, so all kv260 carrier board
>   # drivers are missing.
>   # This will be removed when u-boot can build the kv260 u-boot.itb natively.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
