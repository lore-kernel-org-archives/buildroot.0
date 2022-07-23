Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A32C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B75E61B00;
	Sat, 23 Jul 2022 19:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B75E61B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r11tezAbCckT; Sat, 23 Jul 2022 19:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB8B60FFC;
	Sat, 23 Jul 2022 19:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BB8B60FFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF661BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54FF360FFC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FF360FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgdgPTA16y4B for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4E760FB4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D4E760FB4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:37:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h8so10691053wrw.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4W+UuAtqp7ScKqGWDI0cfQNwJwGEzlZLBC/ftGVmEoo=;
 b=HhK7Z4VzL/IHOI52IPvaweprdtVEjBkLTpE7cJ3OIEDm0lE1tXo2BYo97sRNgoRz+O
 fAwoN459KWPq3FH9ZnLJO5op/+SgFIf/A70SNcYXSQ2brzrQPOv/21WFXGwIlvo80LRK
 XXqQdIcWk8Pvs+xx2VSW4DaIO12IwmUtZPyYeMSzf0KArfpWBmp4XzWNSD/r1xPX7DmV
 CeHcrSvj01iXxL7ZaprpnDRGWNeSuzHQ6u7isCB0oxG7CgNu8Eb33y6idnR570ZnE10H
 xsOFqwyB8PE1BKwjQ/lHlj3oZ750HzbBNvimJMVxdbBCLFE+0w9BghP6EE/lo39nqynv
 3ehA==
X-Gm-Message-State: AJIora9xciEd5is4MNvS0SKfUMMrC6CJ1pAHCUqh7fJdke3PdFFOan9W
 uOn+twsh9jjxO9NfAmFl/LeJ/Q==
X-Google-Smtp-Source: AGRyM1sOlEzGyxEUqhS8QC6t1LM3Xg+X+eTqLaBCw3wbKjMEvmn9Txq2uSpd7gSI1fg3dkGIS2jYWw==
X-Received: by 2002:a5d:470b:0:b0:21e:47f4:9a8b with SMTP id
 y11-20020a5d470b000000b0021e47f49a8bmr3514368wrq.173.1658605076311; 
 Sat, 23 Jul 2022 12:37:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a056000018200b0021e2ae4014fsm5914605wrx.35.2022.07.23.12.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:37:55 -0700 (PDT)
Message-ID: <cc6ddeb4-6a24-5602-c490-39cf8ca0176d@mind.be>
Date: Sat, 23 Jul 2022 21:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220621183813.1395626-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220621183813.1395626-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4W+UuAtqp7ScKqGWDI0cfQNwJwGEzlZLBC/ftGVmEoo=;
 b=WS1dlCvwD+jkW2JkcWhRvD2+EkkZbYcJQobCi7r5JuXCzrBjriYMWibNfRZ36kfI/G
 fraDXX9KJj8s8Rsf9S1ZtHu/BEjKYw5lAZMJ2RkwD800S5Vr5JLJIwaGHkqy3SybD/yP
 XK9UF2bdzJ7pjT8bcocrnXrdGJqEslxt/irmewWShO1h+3DB/MHwzxxqbJjj/q/3U+MS
 DsKnP0kuS0o+o3A6mH25i+BHpwsSwaaC9O3XOwFgsiTzRpu5XfngQarzOCL0TyAXHvw2
 lpYT+OtZrVJSm7N5U6bZv7Jz6yScFddUEZU+ZFlD62F8etS8mbqge4bJ+RIwqRuyDsYk
 2GJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WS1dlCvw
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build without
 libexecinfo
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2022 20:38, Fabrice Fontaine wrote:
> Fix the following build failure without libexecinfo raised since commit
> 66d7d3bec341188bcfd83fa70b44dd62e0073431:
> 
> CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
> Please set them or make sure they are set and tested correctly in the CMake files:
> EXECINFO_LIBRARY
>      linked by target "vcos" in directory /home/buildroot/autobuild/run/instance-1/output-1/build/rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1/interface/vcos/pthreads
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0b4b20e4eed1ed5120f22d29fc24038f268e6cc6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...rface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
> index e799c82418..6c596395f9 100644
> --- a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
> +++ b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
> @@ -1,4 +1,4 @@
> -From 220c37b496f5c883bbfa955ee7fee471e41c34d4 Mon Sep 17 00:00:00 2001
> +From c8270cea98bcce0d22ddc8e2f86eae2c9989efd4 Mon Sep 17 00:00:00 2001
>   From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Date: Fri, 25 Feb 2022 19:21:06 +0100
>   Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
> @@ -20,7 +20,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>    1 file changed, 4 insertions(+), 2 deletions(-)
>   
>   diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
> -index 1d81ca3..43aca03 100644
> +index 1d81ca3..100207f 100644
>   --- a/interface/vcos/pthreads/CMakeLists.txt
>   +++ b/interface/vcos/pthreads/CMakeLists.txt
>   @@ -33,12 +33,14 @@ set (SOURCES
> @@ -32,11 +32,11 @@ index 1d81ca3..43aca03 100644
>    if (VCOS_PTHREADS_BUILD_SHARED)
>       add_library (vcos SHARED ${SOURCES})
>   -   target_link_libraries (vcos pthread dl rt)
> -+   target_link_libraries (vcos pthread dl rt ${EXECINFO_LIBRARY})
> ++   target_link_libraries (vcos pthread dl rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
>    else ()
>       add_library (vcos ${SOURCES})
>   -   target_link_libraries (vcos pthread rt)
> -+   target_link_libraries (vcos pthread rt ${EXECINFO_LIBRARY})
> ++   target_link_libraries (vcos pthread rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
>    endif ()
>    
>    
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
