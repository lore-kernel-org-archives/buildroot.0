Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB95C072A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Nov 2023 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1595F4010F;
	Sun, 19 Nov 2023 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1595F4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id styILfZ_xs-e; Sun, 19 Nov 2023 20:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE9D440189;
	Sun, 19 Nov 2023 20:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE9D440189
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 137881BF2C7
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED9C881E03
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 20:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED9C881E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_mcFgH3KZOX for <buildroot@lists.busybox.net>;
 Sun, 19 Nov 2023 20:43:56 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF6C881DCB
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 20:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF6C881DCB
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso489209966b.1
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 12:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700426633; x=1701031433;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7fV5QREEu2SpYuiSpqYXAu6eBNeEXfqBWTNciS0N3AU=;
 b=qZSXgkYyX4LgxOdh2CBvzg+WL77s+M9lyTDF8H9FBvXRMzq1RpuLTa6BmDX0gMYKQP
 szQ3ZEnNEy0g9XrzMuGqgb1zzmBy+DfZnCQZSegx7iu1jdQZs+72OA2t5DsqvdfyMz5A
 gOVFICfyz2eKqlPb3ROrGky0qLW127bHqEW7i08SF5yunimbdbLGZZSwBslKCWLkwrLV
 fFIyhLdwVVJXfyoaDEZpvvFePZY5guRDmmaiyKwqn+zJLLsLN8vMRqeGJ2Fi5gBB3Rrt
 Q5Lamo9jomT4/VRcTmAHkAL7HV7cEe2Vch6aSSS4Znn18Jd1WsuLvKsjn2eKwqj9LnD1
 uI0Q==
X-Gm-Message-State: AOJu0YxfjxOeCuWf8txk3dhWF4kxHKEjrFOthxxWO4YF6O+U9POcn1m2
 1IGFbOZBJGSutz9n5ZUlNAu86A==
X-Google-Smtp-Source: AGHT+IFsdQXRwVCq/AccaNZiH/cZrBcL+Sf9/3W20gETB9vLhyk5JdWV/CDE4C2oCSUP4om5j+LQuA==
X-Received: by 2002:a17:906:74d6:b0:9fa:54f7:b81b with SMTP id
 z22-20020a17090674d600b009fa54f7b81bmr4191246ejl.6.1700426633528; 
 Sun, 19 Nov 2023 12:43:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a170906a01400b009adc77fe164sm3158683ejy.66.2023.11.19.12.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Nov 2023 12:43:52 -0800 (PST)
Message-ID: <75d4ac75-ee6a-4a5b-af29-7eee2fa11580@mind.be>
Date: Sun, 19 Nov 2023 21:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
 <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1700426633; x=1701031433; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7fV5QREEu2SpYuiSpqYXAu6eBNeEXfqBWTNciS0N3AU=;
 b=F6JaBLMjjC/AAGLjFLodvotM5rLoKEPcg8chlD+XsozZl2i7TrtX8x23br6Uccw4BZ
 B5cZOVx/eYbQCTGpkwi1ot1qmRpuqfDRRBXLAHsE/2E4zoHMV0wKaINa7rykFbs83RVq
 rSoaasr04zDu9JPb6FsRiOO+xoSNETAl69OVI9uu69IO9CgH9+Ikrq2DzKdISyZTK/Yh
 OD5pt86La1CS8XXprM42GXf3CC8gULnzm93qyxkQg+N9ZzGXGQcoOqNH2xTpBLdIaI6Y
 8pviWb1gw2Zbm2RfFZjC6TqYBi9WCop/AVms5kqr1yES6DJYMLNj04TrzCtzp9x3x3yZ
 e8ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F6JaBLMj
Subject: Re: [Buildroot] [PATCH/next v2 5/9]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/11/2023 23:12, Adam Duskett wrote:
> When running the command "flutter pub get," the plugins are stored in the
> pub-cache directory along with their sha256sum hashes. The default location
> of the pub-cache directory is $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> While the above location is a perfectly acceptable choice by default, users
> may want to define an alternate location to prevent downloading all of the
> plugins on each fresh build of a Flutter application, and they may want to
> commit the pub-cache directory to their project.
> 
> Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION to the
> flutter-sdk-bin/Config.in.host file, and set the default to the current
> default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
>   package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
> index a48714ea7f..0e31a8e0fa 100644
> --- a/package/flutter-sdk-bin/Config.in.host
> +++ b/package/flutter-sdk-bin/Config.in.host
> @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
>   	  free and open source.
>   
>   	  https://flutter.dev/
> +
> +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +
> +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
> +	string "pub-cache location"
> +	default "$(HOST_DIR)/share/flutter/sdk/.pub-cache"
> +	help
> +	  Directory to store cached packages used by Pub with
> +	  Dart/Flutter.
> +
> +endif
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index 9461148dfb..6471c11d4e 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
>   $(eval $(host-generic-package))
>   
>   # For target packages to locate said pub-cache
> -FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> +FLUTTER_SDK_BIN_PUB_CACHE = $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))

  What about this code?

# Remove the cache, as we will run precache after setting up flutter and dart
# with the new config options.
define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
         mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
         rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
         cd $(@D) && \
                 $(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
endef


  Either this code is needed and the idea of a shared cache is void, and it 
really shouldn't be in DL_DIR at all. Or it is not needed and it should be 
removed, with an explanation about why this "setting up flutter and dart with 
the new config optoins" doesn't actually apply.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
