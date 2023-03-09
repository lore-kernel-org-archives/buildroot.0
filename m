Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E684C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0334F61153;
	Thu,  9 Mar 2023 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0334F61153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtLS19BYmVxc; Thu,  9 Mar 2023 20:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C0D60BCE;
	Thu,  9 Mar 2023 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C0D60BCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E93481BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C39604053F
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39604053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFbDSHewcPYw for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:38:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC2C40386
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BC2C40386
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:38:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u9so12163451edd.2
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678394311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfbHlOzL4+1jvL3nLOToD8wpy5otDwUd3zDpcZLoyO8=;
 b=11CQtRN1rjQuqLVSERubTGxEWmWwQJqejhKz8dLEZHN9ePfKjJlSC1S8zYh7WZc2ED
 42ea2KjWuWeI5Cco3ZjmGC9QvF/WF2oc6BiS/kIv066sOKrAM0FsNjcIr8mCxO+cAvzs
 CkUi24ELv7LwP1EKAjDTNYnSKbtPMknOFBy7d1izLstLCy4iElOH9rb02Efs0c4W2wEC
 bLEGE10nstMNe8tPGGHRe1INjm6KgUkvi2Trs9r4girhb7+rSs9Fqy7LlhyPISUzsLUy
 w9Z1Fe7kGZgvUa8mWtrQ4xFPs7yPyP2j9uIq3t97nGylhMbvJx0MGSabkobo1M2o/6pU
 F5Rg==
X-Gm-Message-State: AO0yUKVFlW0ttLHIe1UoWM7PAVPzULYvRZ58McTmFyodqCc6X7fh+0h9
 iU/d641ilvpS9Lm1FrW685kQFg==
X-Google-Smtp-Source: AK7set++3/v3StFo9Ax3T35w9dvvsaDwo2xZ01yQVFFhtwLg/HBIgxvkxcd1qHFoYLLAvUScAaqB4Q==
X-Received: by 2002:a17:906:408f:b0:8b1:7968:7fb8 with SMTP id
 u15-20020a170906408f00b008b179687fb8mr24582286ejj.62.1678394311034; 
 Thu, 09 Mar 2023 12:38:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170906078f00b008ea8effe947sm9264582ejc.225.2023.03.09.12.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:38:30 -0800 (PST)
Message-ID: <c5468831-c16c-841e-c3f3-be1a76202093@mind.be>
Date: Thu, 9 Mar 2023 21:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB04936D7377E09CA3A3AA93A49FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <87sfermacm.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <87sfermacm.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678394311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GfbHlOzL4+1jvL3nLOToD8wpy5otDwUd3zDpcZLoyO8=;
 b=QlargyyF6VI+tG+wVpGGP43/DZyjH9U/SwVA5mNuetwAScBVT40h/M8f2HZ+rVEgFe
 a4i1/uZTDQRVTR71M7S50w23Yn7SqsU1XpEme0m2DGFTVM55pKhFrtL4omquha0DKODh
 2ZoOeDiMk1oU2IqlEngeDYfXTGlRlKEEXmVdfd8N5TvMf9uHiKRj2l+NuOLR81Naxty9
 tARiEV3ELQGI7Owp0cxmNltkUyQhVZlHjNmxFlVQbalp6sAlgDcTju6dUr45jT9LSlFR
 NFZMszvlH7e6FXL1IMgrahHD0NXaUxDlmwm31MFjTpU+6ktzpOIFGTiEYnRtzIUC6Tbw
 Ciog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QlargyyF
Subject: Re: [Buildroot] [PATCH 3/3] linux: bump _KERNEL_LATEST_VERSION to
 6.2
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/02/2023 15:50, Peter Korsgaard wrote:
>>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:
> 
>   > Signed-off-by: Daniel Lang <d.lang@abatec.at>
>   > ---
>   >  linux/Config.in | 6 +++---
>   >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
>   > diff --git a/linux/Config.in b/linux/Config.in
>   > index 5cbef197ab..495fc48997 100644
>   > --- a/linux/Config.in
>   > +++ b/linux/Config.in
>   > @@ -28,8 +28,8 @@ choice
>   >  	prompt "Kernel version"
>   
>   >  config BR2_LINUX_KERNEL_LATEST_VERSION
>   > -	bool "Latest version (6.1)"
>   > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
>   > +	bool "Latest version (6.2)"
>   > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2 if BR2_KERNEL_HEADERS_AS_KERNEL
> 
> Given that 6.1 is a LTS kernel I would prefer to wait with patch 2+3
> until after 2023.02 is released (E.G. in a few days).

  I agree about this one, but wouldn't it make sense to add the *option* to 
build 6.2 kernel headers or use them in an external toolchain still make sense 
for 2023.02? I.e. patch 2 without changing the default kernel headers.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
