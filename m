Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13732C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA2A61040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CA2A61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7545B60744;
	Wed,  4 Aug 2021 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_cs3tuTGTY2; Wed,  4 Aug 2021 20:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB55760705;
	Wed,  4 Aug 2021 20:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98FF21BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8648B402AD
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLusQHIbgm91 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27B7440203
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:39:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id c25so5651035ejb.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LVEPUTd7zP9legEUY1A0rsId9Ecgz9uMF2gsCDPQNMM=;
 b=IlacCEsXnL0cNfXHE+BGprL0r7wi9y7f4eCjeUqsemb+DVhrG+FsmZDFdwGPKTqDCi
 8YNprgREICPFZjtQXth9nF0Kzp/AWbYaHI6jjVFakisfQK7svbrMMy40DFC8EmQLIPzk
 dP9xx2Exg0ghdQjyRqIzgioRas95Rp9HOL4VJniOHY8P/VzGF9/Cp83OTQFCR98UBY71
 W3eW6qQv//Ru5m8xAzSUyLQNo7ebjPd/njxNOUyRdncnxXz4YUG8HLGCRBCqwlWN0bPm
 vDgQC2fJ5ZIolVOanxI2EanyDCLNCLidxXM4hrZSW9pCFLKVeQu83Bmw/LnPZvMDyEMR
 UNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LVEPUTd7zP9legEUY1A0rsId9Ecgz9uMF2gsCDPQNMM=;
 b=YC8dAfmZNxBaHQ1B5tvFM3+ypmyOYctsD+3xzSK3ryTl5ZEIMwwKD4t6x9Wa9Xq6VR
 okGJQbIUDPXPMjdfgLRzEbNekJ9s5dhPOrF5kZ9ds3JylQpjv1+XjYoFZLHnjzbhEONi
 OqubUDBIwxhi4ntQR5uyINIr3ybbycFywbG2o81z3fUxq/yGJWoTw7Ey1Kihcrp2pbRA
 ny2LsoXawNzapklVFeOOj0b4ku7S9BVQyLOVlwT+AFT7ugJA6xGFSBfQYZiFt+H4rAOH
 TAJ90Z/uL9f++w6wHflZougwdqmv33KWH/vfDejRyCSy/et+LDbXWiNDRZk5Dap11c1Y
 kcLg==
X-Gm-Message-State: AOAM533wXXKGPuug/sUyULuZNC4OJE2gydFxiNV3dy5uC1UU+aUJN5Bb
 vIf5aU57Awq2CVNfQrobCmvv3w==
X-Google-Smtp-Source: ABdhPJwkiF5Yf8/wZCpNjssI8LKmEVyGRDsZb8mdgW5Z8FtF0C9AeuzOOtGnDKWFssmaMqISABSPow==
X-Received: by 2002:a17:907:2667:: with SMTP id
 ci7mr1033953ejc.4.1628109573318; 
 Wed, 04 Aug 2021 13:39:33 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id w6sm1332241edq.58.2021.08.04.13.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:39:33 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803142347.168625-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4182852d-9191-d81c-3df6-f123fab20ecc@mind.be>
Date: Wed, 4 Aug 2021 22:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803142347.168625-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 16:23, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> /tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:211:43: error: argument 2 of type 'uint8_t *' {aka 'unsigned char *'} declared as a pointer [-Werror=array-parameter=]
>   211 | int hmacResult(HMACContext *ctx, uint8_t *digest)
>       |                                  ~~~~~~~~~^~~~~~
> In file included from /tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:13:
> /tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/inc/azure_c_shared_utility/sha.h:252:42: note: previously declared as an array 'uint8_t[64]' {aka 'unsigned char[64]'}
>   252 | int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize]);
>       |                                  ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/11a6eebd0deea679683a93a5c8355d00acdfe51e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...c-fix-mismatching-function-prototype.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> 
> diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> new file mode 100644
> index 0000000000..0c262e6c46
> --- /dev/null
> +++ b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> @@ -0,0 +1,35 @@
> +From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
> +From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
> +Date: Fri, 2 Jul 2021 20:47:38 +0200
> +Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
> +
> +The reported function raises a warning when compilers assert the flag
> +`-Warray-parameter=`, signaling that an array-type argument was promoted
> +to a pointer-type argument.
> +
> +While in practice in most C implementations this is correct, fixing the
> +warning (and, in this case, indicating the maximum size for the array)
> +would represent a best-practice for finding out-of-bound accesses or
> +identifying wrongly-sized arrays passed in the function.
> +
> +Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
> +[Retrieved from:
> +https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/hmac.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/hmac.c b/src/hmac.c
> +index 53f2411f8..160af9d2f 100644
> +--- a/c-utility/src/hmac.c
> ++++ b/c-utility/src/hmac.c
> +@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
> + *   sha Error Code.
> + *
> + */
> +-int hmacResult(HMACContext *ctx, uint8_t *digest)
> ++int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
> + {
> +     if (!ctx) return shaNull;
> + 
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
