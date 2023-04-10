Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63AC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 15:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F6481E0C;
	Mon, 10 Apr 2023 15:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F6481E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BV0riqC-jvY; Mon, 10 Apr 2023 15:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DB881E0F;
	Mon, 10 Apr 2023 15:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DB881E0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43DA71BF2C4
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA0B40950
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA0B40950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cY5w4mphg46M for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 15:25:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F5C40939
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3F5C40939
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 15:25:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j1so8787358wrb.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MAReLx6cWmWQbJkqlJx1Y4Ahyzn/FvGxk50GQTJuZVI=;
 b=K50TgikvbzZZIWcAro37WcyUBtJVzxySysifKgpZKoenVZHaVG8ZBXAzs2bq9u76xD
 aUPhFWBzUS3tBPwPn8OUhCfjH9nIXRHlUr+DPyzy2570VfIKPpPEz1MPm2hPo5eXNvYH
 aqP9OADBSSTiZgZkj625f/MITvAL329DBzR7xLzJV9YXr7AHoHsNo+AMJRV2rcRp4R6n
 t+44zTaoQKmZ90YmHDxe5MZnMv9morlEIPKS4k7+JBxF+RXWkswKAnQxbrODRbZGBN38
 A0fXHv5mfNBSsqjDGD9T75wEmoSscH1Mf43mynKyK/bKEaM7o5fMSMKAZiV3pTP/TZd2
 1TXA==
X-Gm-Message-State: AAQBX9e2YyIMjWaqIunJZUCkzlnd/znhZhB05lGakVTh5FR6jDtnPYEy
 Nki343bVyCILabR0Sq6C/S719vekYKuHzezXVYM=
X-Google-Smtp-Source: AKy350awOMUn86yN9+mkghDV+uqHlDSUxHQZZGHyqENRHBQcTzopZO0CPWRMy8Gh0x/lIRFSRS0oXA==
X-Received: by 2002:a5d:6606:0:b0:2e4:c0b5:fdcb with SMTP id
 n6-20020a5d6606000000b002e4c0b5fdcbmr5207891wru.28.1681140301738; 
 Mon, 10 Apr 2023 08:25:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a5d6301000000b002efb31d3c24sm8584902wru.32.2023.04.10.08.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 08:25:00 -0700 (PDT)
Message-ID: <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
Date: Mon, 10 Apr 2023 17:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230407141930.694756-1-ovlevin@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681140302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MAReLx6cWmWQbJkqlJx1Y4Ahyzn/FvGxk50GQTJuZVI=;
 b=De6zAxQDCLh66u0OBPholvGgtMoYsuhdRlQZtSX43zugkxYfRREUKrQL84rTDuO1c5
 xahyRsB3a+9/Ysvb88mMqFtFlHC8M0Cu/h4w++bI81aRdCeDUlxGrMVXuSmk5j3g7lPE
 Hbsge5p5hGmat1I5vWrjDbWH7nUDRCmQULQiG/p/W8wT1Q979lzzKfsA2mZyS4INa0Ih
 afIo5SJ6YdFgSlXwgT21+h1drO/ji1hIpMcQgFeTbkRMvzNjzDpkWpT/Ncu8IKq6ff/i
 keeqPbWKhlk9ex8xi7Km+EHX5X6c02nE1D6189aFj4X4jKIzRSQXzz/OnkBds7zAbTqC
 8KOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=De6zAxQD
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2023 16:19, Oleg Lyovin wrote:
> GNU make package from the host machine may be too old,
> so use the one built by buildroot.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>

  Applied both to master, after reworking the commit messages to reflect that 
this was introduced in Linux 6.2.

  Regards,
  Arnout

> ---
>   package/linux-headers/linux-headers.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index e2a0b7a7c9..439f003530 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -125,6 +125,8 @@ LINUX_HEADERS_INSTALL_STAGING = YES
>   # linux-headers is part of the toolchain so disable the toolchain dependency
>   LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
>   
> +LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
> +
>   # For some architectures (eg. Arc, Cris, Hexagon, ia64, parisc,
>   # score and xtensa), the Linux buildsystem tries to call the
>   # cross-compiler, although it is not needed at all.
> @@ -137,7 +139,7 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
>   # of "its" headers
>   define LINUX_HEADERS_CONFIGURE_CMDS
>   	(cd $(@D); \
> -		$(TARGET_MAKE_ENV) $(MAKE) \
> +		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
>   			ARCH=$(KERNEL_ARCH) \
>   			HOSTCC="$(HOSTCC)" \
>   			HOSTCFLAGS="$(HOSTCFLAGS)" \
> @@ -148,7 +150,7 @@ endef
>   
>   define LINUX_HEADERS_INSTALL_STAGING_CMDS
>   	(cd $(@D); \
> -		$(TARGET_MAKE_ENV) $(MAKE) \
> +		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
>   			ARCH=$(KERNEL_ARCH) \
>   			HOSTCC="$(HOSTCC)" \
>   			HOSTCFLAGS="$(HOSTCFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
