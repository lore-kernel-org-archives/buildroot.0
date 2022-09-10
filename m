Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67798ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFDD41607;
	Sat, 10 Sep 2022 18:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFDD41607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jnj8T_3-TX0Q; Sat, 10 Sep 2022 18:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 011DB410E8;
	Sat, 10 Sep 2022 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 011DB410E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1A81BF37A
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 18:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E552A83F2A
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 18:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E552A83F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLQBgs4WCV5N for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 18:33:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A196983F29
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A196983F29
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 18:33:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u9so11327463ejy.5
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 11:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RxY8C4RWmX1yy4A5v+ZtiFg5x7Ms3VDrO2r8fHhcwoA=;
 b=hj5Sqhr3qJqAzh6Hmf1/gmXIFTc0o5+OimBo8lQG85dxHXq/wnBHanqilO22rLZ+VU
 J6B5l0MyA7sQjG75u31clTfLWbtkmpkVNiCvYgqrlA9GPR1P0dE3He36I2aedeKp92i6
 +LuvqFPCNpoknniTB4ATW7UH6zr+Uzkh6xoxECTLboVKuaU+WVD4U9rGMTjqoQDszMDA
 oRxQG8HzbCwY71hh1/q2vFMtueSz1Wt98XEaje/lJ0liYOuBKmiNDCymh266hFVh7Pqb
 DeJKuPxFPjkKizi1hcdkc9idgdOMQBUW35aocf2vi+anOFO9cqJ9aaZ16psdavN+Alk3
 6vxA==
X-Gm-Message-State: ACgBeo3ahrV4jGszn47cD2P59HERm9Y0tWBfKXAY5U7bnX8ms6xBG/q4
 sQt7q0tkuuRRpLfWyc5nEibQVfFBNeW6qg==
X-Google-Smtp-Source: AA6agR4x0iupnvf/v13zV+YFZyNgUbC8sjT8EOOPGOLqfGOzHeSVgvGbg1x7sfin+8Al2XYyA+0V9g==
X-Received: by 2002:a17:906:c154:b0:733:197:a8c with SMTP id
 dp20-20020a170906c15400b0073301970a8cmr13933928ejc.483.1662834797942; 
 Sat, 10 Sep 2022 11:33:17 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a?
 ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a50fc88000000b0044e9e5ce396sm2559306edq.95.2022.09.10.11.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 11:33:17 -0700 (PDT)
Message-ID: <f424c29d-f6b3-735d-a90e-8df128e8d789@gmail.com>
Date: Sat, 10 Sep 2022 20:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: Christian Stewart <christian@paral.in>
References: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
 <20220904125359.18844-1-raphael.pavlidis@gmail.com>
 <CA+h8R2rReW+jaQLWObg7HEbhjtA9TKwTexMeK2=38aQXheASrg@mail.gmail.com>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <CA+h8R2rReW+jaQLWObg7HEbhjtA9TKwTexMeK2=38aQXheASrg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RxY8C4RWmX1yy4A5v+ZtiFg5x7Ms3VDrO2r8fHhcwoA=;
 b=arOGQPBWBaeir34ZDxQEWPc8t/vWX27Xt5h99BBKCQ8UHs3zR8OigJTYgTuOr5dWgU
 t8a8P85vvrgogJ5WXnX2yT6pidSFWlwXyPzVGco3nrz/e3vhSE7vTSvFBE0/r4alYL53
 yarhSfekgTEWZpCuyuTjQ/SJB7xnyzfvYiMjdK2dhMpuzfDvzN0elSoC7ND3TwB9iijR
 bW1wOjoAn+PmXLmbSnw9XmOUxYGnT02pPsz7uRhtIDjzOZazgkogCenMvhaa90wbRCj6
 Mq030y8IgQGSWNZYwkQgCX4lpj7ssBa51hYrQcBTYI/p36mF2ipLLhvbnsSBS+wzgc5h
 VzNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=arOGQPBW
Subject: Re: [Buildroot] [PATCH v3 1/1] package/cni-plugins: new package
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
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian

On 04.09.22 21:06, Christian Stewart wrote:
> Hi Raphael,
> 
> On Sun, Sep 4, 2022 at 5:54 AM Raphael Pavlidis
> <raphael.pavlidis@gmail.com> wrote:
>>
>> cni-plugins contains some reference networking plugins, maintained by
>> the CNI team.
>>
>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> 
> I guess this is a follow-up to my cni-plugins submission?
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20220821053547.667311-1-christian@paral.in/

No, I already started with this patch series since June.

https://lists.buildroot.org/pipermail/buildroot/2022-June/644972.html

> 
> You're missing a few things:
> 
> +ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
> +CNI_PLUGINS_DEPENDENCIES += libapparmor
> +CNI_PLUGINS_TAGS += apparmor
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +CNI_PLUGINS_TAGS += seccomp
> +CNI_PLUGINS_DEPENDENCIES += libseccomp host-pkgconf
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +CNI_PLUGINS_TAGS += selinux
> +CNI_PLUGINS_DEPENDENCIES += libselinux
> +endif
> 

Yes, you are right, thanks.

>> ---
>> Changes v2 -> v3:
>>    - DEVELOPERS: add Raphael Pavlids for cni-plugins
>>
>> Changes v1 -> v2:
>>    - change BR2_PACKAGE_CNI_PLUGINS from config to menuconfig
>>    - turn on all plugins by default
> 
> Was v2 submitted before?

Yes, see:

https://lists.buildroot.org/pipermail/buildroot/2022-June/644974.html

> 
> I like adding the options for the plugins, but you're missing some -
> here is the list from the other submission:
> 
> +
> +CNI_PLUGINS_BUILD_TARGETS = \
> + plugins/ipam/dhcp \
> + plugins/main/bridge \
> + plugins/main/host-device \
> + plugins/main/ipvlan \
> + plugins/main/loopback \
> + plugins/main/macvlan \
> + plugins/main/ptp \
> + plugins/main/vlan \
> + plugins/meta/bandwidth \
> + plugins/meta/firewall \
> + plugins/meta/portmap \
> + plugins/meta/tuning \
> + plugins/meta/vrf
> 
> 

Oh, I see I forgot the vrf plugin.

>> +
>> +if BR2_PACKAGE_CNI_PLUGINS
>> +
>> +config BR2_PACKAGE_CNI_PLUGINS_BRIDGE
>> +       bool "bridge"
>> +       default y
>> +       help
>> +         Creates a bridge, adds the host and the container to it.
>> +
>> [snip]
> 
> Thanks,
> Christian Stewart

Quite funny, I also need this package for podman. :)

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
