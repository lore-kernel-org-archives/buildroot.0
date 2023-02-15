Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09594C6379F
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F4C80DA3;
	Wed, 15 Feb 2023 20:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92F4C80DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUXFP1AERrHp; Wed, 15 Feb 2023 20:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC8280F2C;
	Wed, 15 Feb 2023 20:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC8280F2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17B451BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2B6880DA3
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B6880DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQjZftAaJbg5 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:48:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248D180C50
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 248D180C50
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:48:40 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dz21so13673414edb.13
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 12:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9hICMT/ZzQX+Qot2g6sfQucvCLgT+WsCDDudOGGznk=;
 b=YtoBiaarTDxIrZaEic2JCGuZgNsVUraxsroH6uD+Xi0y5ZT4Hw05pReqF1N4U/0V+d
 Lq6I6zdEa1bFsJ0C12C+TJCkE22eC8ykpmd2Y552GEjYLtfspAq4a94CpqK4nG+ykUZH
 JSEeNflHuaQClVZ6XEgx402Vm5trhFChHWJHDuk6tfb7fAfG3gbDDhW0HoyRO1sMcipr
 Bw/gdXsAZsvWvBRIj39/oV7NodzF2sAydGCTg7aqe0DSgYIu8Qw2MQUEn+T4SbvB5fyz
 ac6TIfX0VABdFv9E2SAFSUU+eSPlIMxRFUSbc/1WDPDuQBqqwgpUM+mcIrMKV/PLSaDl
 AgAA==
X-Gm-Message-State: AO0yUKXNzynyTi9bGxXRoui5YC1h4QQfLch+eq0X/Y9ov/RgTl9PI58l
 UCT3D0NTpgcCKSgBhFdohWbGkA==
X-Google-Smtp-Source: AK7set/JeLj8OWmSSmyidYEJpP7H03vHVEg/7lW0rCfhgoNuFYpxCQICAUgtOaA3AFkui46+VxgAhQ==
X-Received: by 2002:aa7:c243:0:b0:4a2:51db:c7c6 with SMTP id
 y3-20020aa7c243000000b004a251dbc7c6mr4345765edo.8.1676494118887; 
 Wed, 15 Feb 2023 12:48:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a50d548000000b004ab33d52d03sm9025893edj.22.2023.02.15.12.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:48:38 -0800 (PST)
Message-ID: <a70284ec-03ae-3ec5-6ed4-473bd6f3377a@mind.be>
Date: Wed, 15 Feb 2023 21:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230208005343.2544457-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230208005343.2544457-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9hICMT/ZzQX+Qot2g6sfQucvCLgT+WsCDDudOGGznk=;
 b=CCnY8UNKpvMYZCYDyqExXSoQxR9xQBTxwSPtSj3Er+RzmZlJy2bckbkFmx6eO1iHzq
 awSGpACgtWrSQwxILUChOfVm50wKUxacDnLJN/xxvV6/uWfX1XuovwMXGQBjXRQaXJQR
 FKVuOo4llgQ66GLbSDbCjnn81hmKHEhqE0Zki1uR31xtZVFTsT6jtvHEzz6erNzXOgBC
 ixyHjD7nsYbHXGKQS6vWbCoYA2JYxx5ASV6WogyQvFkK7xE3zGNfyTm1wRQQMfRQCCYD
 iSJHNt+OxVC3xw72pCFZb1rpMpYnO96uUzMf/RimSFSwT72kAxLIrf6yEE+vtXVSstuP
 NlkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CCnY8UNK
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix relative
 toolchain_csv paths
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



On 08/02/2023 01:53, James Hilliard wrote:
> The default toolchain_csv path is a relative path to the buildroot
> directory.
> 
> If we run genrandconfig with a cwd that is not the buildroot directory
> the default toolchain_csv path will be wrong.
> 
> To fix this prepend the buildroot directory path to the toolchain_csv
> path whenever the toolchain_csv path is not absolute.

  Well, a typical use case for running genrandconfig with a cwd that is not the 
buildroot directory could be from a br2-external, with a custom csv as argument. 
In that case, we actually *do* want the toolchains_csv to be interpreted 
relative to cwd rather than buildrootdir...

  Since people may already be relying on that behaviour, I think it would be 
better to fix it by just making the default one an absolute path, not anything 
passed explicitly through the commandline.

  Regards,
  Arnout

> 
> Fixes:
> FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   utils/genrandconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index b3576f8a51..b96f2ee6de 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -115,6 +115,9 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>       toolchain configuration is itself an array of lines of the defconfig.
>       """
>   
> +    if not os.path.isabs(toolchains_csv):
> +        toolchains_csv = os.path.join(buildrootdir, toolchains_csv)
> +
>       with open(toolchains_csv) as r:
>           # filter empty lines and comments
>           lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
