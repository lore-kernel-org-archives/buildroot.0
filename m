Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4CBC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365A8820CE;
	Tue,  2 Jul 2024 13:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fMHIhbplSRM; Tue,  2 Jul 2024 13:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04FE38210D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04FE38210D;
	Tue,  2 Jul 2024 13:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69B9D1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B2398210A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ym9_OmLldWeL for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0255A8146D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0255A8146D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0255A8146D
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:53:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so2449954f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719928398; x=1720533198;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScUfq0i+GARZ8RlYEipiZllNhFm9dYDYaVIYEm0RgBI=;
 b=owHj5xBTddFJbyO6Zq6A6Oli1js+YoMI1sl82sgQUNGTmYb85HjKbN9KAbzEeG+fY6
 LLz5udPboFAQoHtsCI614a7RcM0GxAu6qvpycFmdJnA7xns7k0X67MgUnNBQQfKcrOP6
 2pJuz65HrnnhQZmGPMLm8e5DHKb/yGR6LX3EsKJ6XxssBImTOcFqFvDfOPl9PECF1HR6
 XNns1IyzGYlnrZnNmDJE12bFercD33kkkY3ASrmaNQYpkQLhe3kwH+/OzWkAe9o61tad
 qucdJ/s6v1SPNm8DblAvDn2mVPh3FWUACX9LeIKaY7HotLNjYvPwF299JujfXYkjbNbK
 kLpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpv3ZXAi0Es+cy4SChN9ZnBTnIAHJgnIxzP5QdkuGIdl3Ivp7T4KAxImh3iY7Vdso9GHJryYZtswDP5p/5QD+XgUS8f/NCpg==
X-Gm-Message-State: AOJu0Yw9+GMzLuUboEQR7ixnzmPaUlM1CqdYVkWLBU56DMlduRP7NC3o
 tzDmBcuielh4w8Yr0zOQ9Qq29gUXifdooRc59Mwuqt3XBT7Oy7a1/Ko6r9zRyIg=
X-Google-Smtp-Source: AGHT+IFuAfRA08JPLX1xhtZLQ+ruN9LtBKbcdXhDeZSnlbXdg8Vzpa183Hb9nAP/vywzaVTi+1ng/A==
X-Received: by 2002:a5d:47a8:0:b0:366:ee84:6a77 with SMTP id
 ffacd0b85a97d-36760a63045mr13586641f8f.3.1719928398141; 
 Tue, 02 Jul 2024 06:53:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55d0fsm197445845e9.19.2024.07.02.06.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 06:53:17 -0700 (PDT)
Message-ID: <558cfeb1-fdfd-4863-a737-ea5b5caaafb7@mind.be>
Date: Tue, 2 Jul 2024 09:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702074423.2380064-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702074423.2380064-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719928398; x=1720533198; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ScUfq0i+GARZ8RlYEipiZllNhFm9dYDYaVIYEm0RgBI=;
 b=RfWWK0uLRjB4CvKr2YwGzj/Mb0YWzKvldJcyXtif4iJKM7O52VMxR6U2Dup0AfyNHc
 KCHeEjnXUTSgCfdRnMulYqb2bBHMUOVPm127my0dVgQwqUK0J/RnNmwtEkYtEGclZ1Db
 RJJCcrEQOS1DLlptgtyyO9+Ltd9u5lfatNuxuqynmIlFcGbCPpIjSuZ38HGumzAiCTeX
 UfVrkwdv/OjsEKFNuDr+Z+yOuLTGNapjsYqthAKZBvV9O1WrKGYgOGyrvsuMv8mfeg0X
 gdlxsChMMYYU241KQK/5++Jg8UdihMfThJpHQuGE02zzdF2wYEpxAwt0xDvMVK+ixBxa
 LKlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RfWWK0uL
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-kobs: update
 the patches to be applied with fuzz 0
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, linux-amarula@amarulasolutions.com,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 09:44, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, imx-kobs fails to build with output:
> 
>      Applying 0001-Fix-musl-build.patch using patch:
>      patching file src/mtd.c
>      Hunk #1 FAILED at 31.
>      1 out of 1 hunk FAILED -- saving rejects to file src/mtd.c.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
> index ce123de9cc49..373b34ffce0b 100644
> --- a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
> +++ b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
> @@ -1,6 +1,8 @@
>   [PATCH] Fix musl build
>   
>   Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   ---
>    src/mtd.c | 1 +
>    src/mtd.h | 5 +++++
> @@ -17,6 +19,7 @@ index 1edc441..6d2264c 100644
>   +#include <stddef.h>
>    #include <sys/types.h>
>    #include <sys/ioctl.h>
> + #include <sys/utsname.h>
>    
>   diff --git a/src/mtd.h b/src/mtd.h
>   index bd21add..debfc84 100644
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
