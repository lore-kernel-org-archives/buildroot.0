Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F432C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F5C8175A;
	Tue, 23 Aug 2022 20:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F5C8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_cD_ZxaQp0R; Tue, 23 Aug 2022 20:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 319DF81758;
	Tue, 23 Aug 2022 20:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319DF81758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAD81BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46EDE40531
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EDE40531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL2WSuH3xwx9 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:14:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8BF44011C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8BF44011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:14:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bj12so12577072ejb.13
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 13:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=k46f/tVN7GO9u3Jup3x3rvZTJJ+wfI1vjbkGhcde6Bk=;
 b=JSGxiLSL2zJDxYRmsV+N0QtFropjYAtGXv+/z5NiHKukZ1+qPWeNEGoZj3bcGpkmgY
 X/Idlohhl2LMifKMOxeeHd760R8GSkTNWfhT8f4/y+hc9OvLo3cAxrWmUJULOkcq2DYj
 oMUlgtNiMV3UdjQiUf9+1slVrGWqiPn66CdWooOar1JyOct9xQ0yZuGjghh+yOi45Gc6
 W58tA6WQ7J6FJjuBVmTHj3lNI5K17kJKX6j0gtG7cMzLyK9kGrNgR/5k3rKrsorqoSAC
 Wd+QE+1LXDjRbUHTFDysKR0eIHBUnJF/MY1bzknz0jA0E0H90ymwRmX4aj8xa+Om02dh
 doYQ==
X-Gm-Message-State: ACgBeo2J4TS3Iy/ISPc+SOECDqE8Dn8OmhnysF6sagMEGxIXDUapQODg
 sSN/TboEn+K9R2YEsR1Ua0PHEw==
X-Google-Smtp-Source: AA6agR7SkrpEvl1inCXNHbYO1yJ+D7aeO7XMMCrHC6f+3SJjTMCFCHr7in7qBCl5gf6Um6EseLshhQ==
X-Received: by 2002:a17:907:7e9b:b0:73d:8044:a5f1 with SMTP id
 qb27-20020a1709077e9b00b0073d8044a5f1mr796631ejc.721.1661285655723; 
 Tue, 23 Aug 2022 13:14:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a170906385b00b0073d732e440asm273795ejc.84.2022.08.23.13.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 13:14:15 -0700 (PDT)
Message-ID: <f75b663e-0584-3777-d61c-e9e4010ad3b9@mind.be>
Date: Tue, 23 Aug 2022 22:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
 <20220821094911.GR2775145@scaer> <20220821120304.GU2775145@scaer>
 <20220823093051.GA2775145@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220823093051.GA2775145@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=k46f/tVN7GO9u3Jup3x3rvZTJJ+wfI1vjbkGhcde6Bk=;
 b=JK+xYmzlhjD5CtkkKkaBp2cefeoXD8kemT4VDbHJwyHyB/5dR8sR0gNSrjr4HVgyCk
 MqeupAJf39zC1Fh3TQYiBedLon8W9Ab+9ceNYiWuoqrF46f8DqNxuGfv3IQspcSkVAeN
 k3wLEcmNJqvbxmcAtghxGdlERrQT7Lm99R0LBDLmbwVn+m6ffL4AvdwCI6QcWu6BUGGs
 iG1SPSZbncs+oQwdiQGVmR4attzBFIelTovsnSNgTYgQ2RCjZMQRaTXf7U2eLT9cA3ii
 /H5D9Ng/7UdZli5OpxLKwmodBrjoEg5hjTE507CgqBx3mHWqKvnQt2OO+/mBVWUytI6T
 ro0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JK+xYmzl
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 jquery-ui-themes handling
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/08/2022 11:30, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2022-08-21 14:03 +0200, Yann E. MORIN spake thusly:
>> On 2022-08-21 11:49 +0200, Yann E. MORIN spake thusly:
>>> On 2022-08-20 13:33 +0200, Fabrice Fontaine spake thusly:
>>>> Add a custom case to make sure that a random configuration with an empty
>>>> theme for jquery-ui-themes doesn't fail. It reverts to
>>>> BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE in that case.
>> [--SNIP--]
>>> I am not sure how we can end up with an empty BR2_PACKAGE_JQUERY_UI_THEMES_THEME.
>>> Indeed, it is filled from a choice, and unless there is a typo in one of
>>> the config options, there are as many defaults for it as there are
>>> entries in the choice...
>>>
>>> And if you look at the .config file, there is actually something
>>> selected in that choice, BR2_PACKAGE_JQUERY_UI_THEMES_VADER=y, but
>>> indeed BR2_PACKAGE_JQUERY_UI_THEMES_THEME is not even set. It's not that
>>> it is empty, it is not set at all!
>>>
>>> So, the .config file is not correct.
> [--SNIP--]
>> So, for fun, I had the following snippet run:
>>      while true; do
>>          ./utils/genrandconfig 2>&1 |grep KCONFIG_SEED=
>>          if grep -q BR2_PACKAGE_JQUERY_UI_THEMES=y .config; then
>>              echo 'Got JQuery UI themes...'
>>              grep BR2_PACKAGE_JQUERY_UI_THEMES_ .config
>>              grep -q BR2_PACKAGE_JQUERY_UI_THEMES_THEME= .config \
>>              || { echo 'Missing theme...'; break; }
>>          fi
>>      done
> 
> This has now been running for almost 48 hours straight, and there has
> been 10005 configs generated, 55 with BR2_PACKAGE_JQUERY_UI_THEMES
> enabled, of which none with BR2_PACKAGE_JQUERY_UI_THEMES_THEME unset.

  Isn't it simply fixed by commit f008c74061e604069d9716ac97d2a3f78c9f00b3 ? The 
autobuild failure didn't contain that commit yet.

  Patch marked as superseded.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
