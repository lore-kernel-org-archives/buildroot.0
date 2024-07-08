Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06791C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F938104F;
	Mon,  8 Jul 2024 12:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvhDHv5Z7ycq; Mon,  8 Jul 2024 12:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20B4880F0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B4880F0D;
	Mon,  8 Jul 2024 12:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA501BF357
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37731607B2
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVgNxjPR65XA for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouanchristophe@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F70B607A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F70B607A1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F70B607A1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 12:12:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso13622195e9.1
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 05:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720440731; x=1721045531;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Kvm+GKnLtRwHGIwPmJ/IFZ99AaJ8uSWSp71StK3lvs=;
 b=H0I6YDaXX8UJ30B3MXfYRB7fSakh+UnIEF69/DC2XIiidAXdl74qZr6HZ4muXwXc9B
 35lxml2x2G+l+18yHsno4x3fTjyTX5b3XpV6GX2OXSIWOa6+T2ss6wu7HS+eVhfRgsyG
 pM9ZtyROk/OFs86a987TIKsU/e4uh6WC7GaXn2JxS+XMHBB5ymZo8UOLZTpYw4Em3Dj6
 thR1mkxVBuddHP1Ls8gUVuEknVTbLTeBYCDF5GCcZWOqmcN00yxLBuselPzDcJw7paRO
 sJa7d/eREL3z4tMCTFbrmQUgCEVSIImMyOk7CxAtDNdZ9Y+yxHKpHkmz2lN47cZ1zd3J
 5iQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlb+rx1ZQr7+HU9n5jNmFT+6k3afr7L2t4wwjPcUBm1V7qkvLb/tsXo8UGHrkUucthtniUbDH3tv5i9TSExKQKP2x0P8/Q6w==
X-Gm-Message-State: AOJu0Yymb8hOi+UbTfF35nGU3q69kOytVUYhAR7tYQKBVobHUo/0bq1a
 ukTUfimU/m+ldHBLgOwVrS3MgHVsrXLfAjkwApigSiLxb+4FrgeW4Yn8hw==
X-Google-Smtp-Source: AGHT+IGuQQ8qv99uS8+FKdOKsJAkORT9MHg+29da5XfNoD+X5UkbWZQ6kk6fdEHu2CNZIsz+6UoLRg==
X-Received: by 2002:a5d:44c9:0:b0:367:938f:550 with SMTP id
 ffacd0b85a97d-3679f75c689mr10204135f8f.25.1720440730690; 
 Mon, 08 Jul 2024 05:12:10 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:ce00:593:31b:ac47?
 ([2a02:a03f:639d:e501:ce00:593:31b:ac47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4265fe7130csm87556355e9.8.2024.07.08.05.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:12:10 -0700 (PDT)
Message-ID: <289cfe2d-97e3-4c2b-a2f2-c41959107264@gmail.com>
Date: Mon, 8 Jul 2024 14:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240707124110.4049936-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Titouan Christophe <titouanchristophe@gmail.com>
In-Reply-To: <20240707124110.4049936-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720440731; x=1721045531; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Kvm+GKnLtRwHGIwPmJ/IFZ99AaJ8uSWSp71StK3lvs=;
 b=DlWL6XliDfTLwNCNgd0NkQJhp5pysJKJJ1i1ysW9UPwdZPnqJkRi07E4aL4nTekkXU
 9fP/zn/pFBekgVUvnmvI+yrSChYghbw3cBOcksWzphoz+J68DTZgRHNBCOOTsE2e54o/
 1dgrKvv79Fpla+YhkpQnDwtkjgD+myaCqVl8g44ZTnB05GXVFUmoKFxgrLCBaqxBnsZU
 wmnFTntVboXts0cEhqaRN2pFN0QU3tAKAjj5+JgfYywYWeNmnQlIuWMEIPQPqC6YAVxl
 0q3ay5Ihn87Oyk92ETlh0V4rWAkGJxuohANKBfbUFF5k/gAr23EXWCWyIBTz0lw4YMEn
 Tgfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DlWL6Xli
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: update the patches to be
 applied with fuzz 0
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
Cc: Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario and all,

Thank you for fixing the Redis build !

On 7/07/24 14:41, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
>
> Due to this change, redis fails to build with output:
>
>      Applying 0002-largefile-conditional-define.patch using patch:
>      patching file src/fmacros.h
>      Hunk #1 FAILED at 42.
>      1 out of 1 hunk FAILED -- saving rejects to file src/fmacros.h.rej
>
> This commit refreshes the package patch on the current package version.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Tested-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>   package/redis/0002-largefile-conditional-define.patch | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/package/redis/0002-largefile-conditional-define.patch b/package/redis/0002-largefile-conditional-define.patch
> index 747e0552b379..685a30cc5b72 100644
> --- a/package/redis/0002-largefile-conditional-define.patch
> +++ b/package/redis/0002-largefile-conditional-define.patch
> @@ -12,13 +12,15 @@ Avoids:
>     <command-line>:0:0: note: this is the location of the previous definition
>   
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   
>   Index: redis-2.6.11/src/fmacros.h
>   ===================================================================
>   --- redis-2.6.11.orig/src/fmacros.h	2013-03-25 22:09:15.000000000 +0100
>   +++ redis-2.6.11/src/fmacros.h	2013-03-25 22:09:40.000000000 +0100
> -@@ -42,7 +42,12 @@
> - #define _XOPEN_SOURCE
> +@@ -55,8 +55,13 @@
> + #define _POSIX_C_SOURCE 199506L
>    #endif
>    
>   +#ifndef _LARGEFILE_SOURCE
> @@ -29,4 +31,5 @@ Index: redis-2.6.11/src/fmacros.h
>    #define _FILE_OFFSET_BITS 64
>   +#endif
>    
> - #endif
> + /* deprecate unsafe functions
> +  *
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
