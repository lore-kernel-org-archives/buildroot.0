Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D44C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EBC6104F
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76EBC6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED68E4023D;
	Sun, 19 Sep 2021 11:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTCL09mr8WOi; Sun, 19 Sep 2021 11:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A627402BA;
	Sun, 19 Sep 2021 11:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57E001BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545FA80E5C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6RSHeBrnM5q for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D7880E40
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:49:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v5so48733819edc.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iubvlBgRwY4wcU2Vz1ISG7XXT2qxaZJIt9hAT9EA47Y=;
 b=L4YOHh4s+/VNkrS08+sS1SZ1GewLicBrb6nn25XsZ9KojmEHVFWUnLJ5Di5SmasrUb
 /0Szz+qgQma61k7lsF/fKG94E44TSTU/ctAeF3AKKPQlVE85IbW9xq4cf2gRzcdX8hNF
 Dsx8e8oRHkcrbrSwrdYADUw81Dl7+zHgnO7wtLgHwV+p7ZITzbChBK16IyKjRgp9obba
 46D5kvmHGZkHdizOZggu+2TfwqfTtqeuyYlQJiR/3S33btZrlPSLa5eqqLyytCs8kYWi
 oG64d0p9dZjH+1MbnRACREuGZM0LDtaujMYZp9xsUR6uHlEC5VNNby2xwZsiMLW1dQgi
 LS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iubvlBgRwY4wcU2Vz1ISG7XXT2qxaZJIt9hAT9EA47Y=;
 b=4Hq9dQFJIsS/46sQvRbtF8qIQ5vJKZVfZUueCJ1LzaAL94ySbQg0/sWJ3NBFyrGSXz
 zN54M4QOHNT/txIuv6h3ByPMyWOf15EEUq6VYJFsTiMdH7MEXpvdMqvM1Eb6ECY7SVPB
 DBLWdpdLpCpj09c6aoW27bqZ07EuYqIm8aXCUVJ2TT75eYFqCs4ADYpOqG3HxLrRW8tJ
 ffmAZvBcc+OfQ9/1rEJYXlYlYWyUgMAU90S2BRrELdJUsrycBA0IxiqhE5k3qvLb4xuE
 IWI7wZANJfUmxHdiTT5/fqQsCz9uhHbe3OPKbV5SqhcM56oK+HJy3eqhrQdwXyIDgAsr
 EVLw==
X-Gm-Message-State: AOAM532UlWIdlhXrgWlgVqw4XRtegrZj6I0m3PVK5KbOK2l21+d728Jv
 hyVlMl8sK+7Y6fApU0PDJIBq8A==
X-Google-Smtp-Source: ABdhPJwrUdGa7cYHexQUQ713b1yY5fOgSrusY04uMGBawV2EcXkmRJJ3vkHQY+qu8Vlz1zzya4JluQ==
X-Received: by 2002:a50:cc48:: with SMTP id n8mr23199708edi.304.1632052144326; 
 Sun, 19 Sep 2021 04:49:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id br21sm4881371ejb.112.2021.09.19.04.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 04:49:03 -0700 (PDT)
Message-ID: <fdda838e-e64b-d3bb-8745-260443d61122@mind.be>
Date: Sun, 19 Sep 2021 13:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
 <20210918124739.GN1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210918124739.GN1053080@scaer>
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build on m68k
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 18/09/2021 14:47, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2021-09-15 00:10 +0200, Giulio Benetti spake thusly:
>> To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
>> since 'switch' blocks are pretty wide and lead to build failure. This way
>> 'switch' blocks will have a 32-bit addressing by default instead of the
>> standard 16-bit.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/mesa3d/mesa3d.mk | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>> index 54b50f684f..809a7d8e88 100644
>> --- a/package/mesa3d/mesa3d.mk
>> +++ b/package/mesa3d/mesa3d.mk
>> @@ -259,4 +259,13 @@ else
>>   MESA3D_CONF_OPTS += -Dzstd=disabled
>>   endif
>>   
>> +MESA3D_CFLAGS = $(TARGET_CFLAGS)
>> +
>> +# m68k needs 32-bit offsets in switch tables to build
>> +ifeq ($(BR2_m68k),y)
>> +MESA3D_CFLAGS += -mlong-jump-table-offsets
> 
> That option has only been added to gcc-7 [0] [1], which makes gcc >= 7 a
> pre-requisite for m68k, while mesa3d currently has no such requirement.

  It's been merged, so OK for now, but I think this is exactly the reason why we 
decided some time ago to just pass -O0 to work around compiler bugs for niche 
architectures...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
