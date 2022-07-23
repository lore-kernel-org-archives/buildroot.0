Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D99AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA027418AD;
	Sat, 23 Jul 2022 11:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA027418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8yD-Wowpl_e; Sat, 23 Jul 2022 11:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D8B418B8;
	Sat, 23 Jul 2022 11:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D8B418B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82E3B1BF2F2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 662968496F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662968496F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmgelhkC24xA for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 11:34:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346548496E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 346548496E
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 11:34:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b26so9687691wrc.2
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 04:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LqOQ8yAwbLLn6JJ0CUudpGDYcAmNbf+U4gh4z1AMtWw=;
 b=UGI2VEbFObEKeu0V1ai7QnUBL2d2mRoWZ0AkgiprAWurrq7Hoxv2/g3O0dkcNIV4Ph
 G2Ph9D5pW7ofvkKse3tqtBaJ4FzzEP24LHJAPacR8fwtyb+/ZUOW933O6MFWuOA56z6G
 uzPlbD1PET72Qxbh8wxpVrDCWFBg61jUdaWyV8YUkGmRVsrzeDcHolFJ00v+kMQff9gB
 UwzDKnOSypJ4QbMescS47LoR+TCTJJOUVwcSWji5sfjpeS7lpx8hVQSasHXT37+0VqJ0
 g2k1kKjCXq5Ow3IsM50339V5BM4C0dkOeuc6PS8eFvR/2iPoY1er8LQJvR47Q9HhwSOi
 xi7A==
X-Gm-Message-State: AJIora8AXaYN1GKB6OkxI3CUoC41DvSMhgBSagpy+lN9KYANz98b5M/g
 X+M9oOn+hHStW571BxWgQC/OeQ==
X-Google-Smtp-Source: AGRyM1uGk0+ehlg/i2u7HwU1JuYXOJnrEliCbaqFDnmia3VZ04p5H0Q8clsunI4l2wQrSQmxWUHTwQ==
X-Received: by 2002:adf:f14b:0:b0:21e:4fab:cf1d with SMTP id
 y11-20020adff14b000000b0021e4fabcf1dmr2591736wro.712.1658576073961; 
 Sat, 23 Jul 2022 04:34:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003a046549a85sm12587152wmq.37.2022.07.23.04.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 04:34:33 -0700 (PDT)
Message-ID: <041efe45-383c-7043-c35e-4a42cd088f45@mind.be>
Date: Sat, 23 Jul 2022 13:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220722110008.3294552-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722110008.3294552-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=LqOQ8yAwbLLn6JJ0CUudpGDYcAmNbf+U4gh4z1AMtWw=;
 b=NmMRqO5nzyVc3bI0OsUrJ4FjoIHUL+O37EmX/ealDH2020jUhecXP6/MbNIxrpuIPx
 xl391jrIh8g4pURQJ5XKEER4iBZJSWt+PkKuMAd5xygbZxyxpORImro0tuhWWJgU4mVT
 7nIQsJCNr3P7pEUKzeRdLgypBjaEuXfZbuE5wWstAUXktc4uiKj2xdUDfXJOx//l7p+9
 qR2N95NlrZ4RzVwOMX4a1sCpiY2l1ay7V9YZL+LW/2nNkXyHohafPO9ulKBXCRgBX0CZ
 /Y1SuwfSnx6yKtBf6qC7tdKD2b5Cfgd+rtV5M8qQM1ZbtueN8XJ6OpuQGS3ION9G888d
 f0Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NmMRqO5n
Subject: Re: [Buildroot] [PATCH] package/open62541: disable Events when
 minimal Namespace
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



On 22/07/2022 13:00, Francois Perrad wrote:
> the option UA_ENABLE_SUBSCRIPTIONS_EVENTS is enabled by default,
> by not compatible with UA_NAMESPACE_ZERO=MINIMAL
> 
> see http://autobuild.buildroot.net/results/d8e34b8bddf0f3568e64705c6618b17bce70d210/
> 
> CMake Error at CMakeLists.txt:1120 (message):
>    Events require at least the reduced Namespace Zero
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  This also applies to the previous version 1.2.4, right, so it should be ported 
to the stable branches?

  Regards,
  Arnout

> ---
>   package/open62541/open62541.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 594243c8a..5f46703c1 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -34,7 +34,7 @@ OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=OPENSSL
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
> -OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
> +OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=OFF
>   else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
>   OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
>   else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
