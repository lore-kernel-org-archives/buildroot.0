Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC112C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7475E4193B;
	Thu,  6 Jun 2024 19:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAFmNAryWi6H; Thu,  6 Jun 2024 19:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8145741929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8145741929;
	Thu,  6 Jun 2024 19:40:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D38901BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B8D6084D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aomu4_feovwx for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BE8E607E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE8E607E1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE8E607E1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42158db02c3so14465765e9.2
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702843; x=1718307643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7BcCMfoVmrIfPSkZCQHQ1og2tGnOS3wAo1afyPjQtuU=;
 b=QaX2h8q7kPscb+FK8J/LbV2DVWMAL9jJBB+zB1avhJOhJpDeNtLFaX5seIIAwzOZha
 uheaZ1ZZqPaymjXuuiCXgLyb+N3PvJa0oyv1PBKZTZGcmnTGTZDD4JoYIrSRggxO0DuN
 u2frOMSwuAYKdejetdnIDBgAYSOS3D7PAFT+rCmvZPccHDoPsvvwJU0G0juV1eluaD/s
 7rO8SsLC4bP0q5748K/HrLU6WBOPdVjDkc/lG6N3gvt+k8o17iufxULmV91xUBy4ErWx
 auq0HiJfJkDzOk4a5RtRLuEMp5Mhj7o8LULbXidtizD7jgoB9bcs+CCPVS5CaDYe/qqg
 X6uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOa2Lz5CmolP6p7aAPapwwhFKiiuaGMByrfuDQxE6jBLEyXFbwN1pgqlBMutc67OmpeUMVt+BBjZQosDZM7mUCd94nFAjS3w==
X-Gm-Message-State: AOJu0YyO74OgvJM5OR7YRKMikQ74U4wT+Uhy9dCD514L12ag9rsOx1dp
 3XlfIBuFeUau8o5RQ37t60aHkFBYZRE0W81IBjvt2VuSfd91Wq80K4daJo/2cj9PT2IPGxreIe2
 U
X-Google-Smtp-Source: AGHT+IGaFYFCB+/zzFbvlf13GhOZCPIGQxtglvZTOuqmnYAUyIzrRMxS6AvZWXecc/w4DNt/onpNGw==
X-Received: by 2002:a05:600c:4fd2:b0:421:7ad:daab with SMTP id
 5b1f17b1804b1-421649ea52amr4915745e9.7.1717702843402; 
 Thu, 06 Jun 2024 12:40:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm31051965e9.26.2024.06.06.12.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:42 -0700 (PDT)
Message-ID: <3096e0c5-fd54-48c5-bba6-a3320e5a7494@mind.be>
Date: Thu, 6 Jun 2024 21:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZkSRMq/yXayXrO3S@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZkSRMq/yXayXrO3S@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702843; x=1718307643; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7BcCMfoVmrIfPSkZCQHQ1og2tGnOS3wAo1afyPjQtuU=;
 b=bNtMtCwRzl4wvBbNTC0878mt8VkM2yT5pK4j7k+uS9hKyhb4O0tY7nwB7BeZZaIv+u
 t++pGnrxLhxR8rNxZ54TXo+ziZNBDQjR5LNwU9TYc9G/A5H5YpV7jetwKIw24V+di6wl
 g/YQeJjdlV+4s5iDenKTMIuJiWTi+UlukHbqqPLU0/C6C7WGT3Jo9zCCcBzlnTe9pB1r
 jqUAxwVmbtZm+sFc3r3pnWKCFOUFoRd0d9gVfvDHC3R47T0VhG3if0ZWuaf+cfw+p44b
 LmKGDg+PKbRZZrYQ0eKq4LPfAAdJhPx7e5vqjQo3eT6asYBXDMCUdGK36to5Dc4g3j3A
 p6HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bNtMtCwR
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix compile issue with gcc
 14.x
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



On 15/05/2024 12:40, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/d9b924bdea3fd61060fa0e961c12534c1fff80de
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-fix-kernel_stat64-definition.patch   | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/uclibc/0002-fix-kernel_stat64-definition.patch
> 
> diff --git a/package/uclibc/0002-fix-kernel_stat64-definition.patch b/package/uclibc/0002-fix-kernel_stat64-definition.patch
> new file mode 100644
> index 0000000000..5a87586af8
> --- /dev/null
> +++ b/package/uclibc/0002-fix-kernel_stat64-definition.patch
> @@ -0,0 +1,35 @@
> +From 186878405324e96f61d896a149f623e0c792c972 Mon Sep 17 00:00:00 2001
> +From: Max Filippov <jcmvbkbc@gmail.com>
> +Date: Tue, 14 May 2024 23:18:56 -0700
> +Subject: [PATCH] fix kernel_stat64 definition
> +
> +The commit 74ca8d6f5d2e ("remove UCLIBC_HAS_LFS") removed conditional
> +compilation dependent on __UCLIBC_HAS_LFS__, assuming it to be always
> +defined, but removed the wrong branch in the definition of
> +kernel_stat64.
> +Fix kernel_stat64 definition to be stat64.
> +
> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> +Tested-by: Chris Packham <judge.packham@gmail.com>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=186878405324e96f61d896a149f623e0c792c972
> +---
> + libc/sysdeps/linux/common-generic/bits/kernel_stat.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
> +index 7a97bb4d7..e874a4a9f 100644
> +--- a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
> ++++ b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
> +@@ -18,7 +18,7 @@
> +  * However that requires more #ifndef in relevant wrappers,
> +  * further uglifying them
> +  */
> +-#define kernel_stat64	stat
> ++#define kernel_stat64	stat64
> +
> + #endif	/*  _BITS_STAT_STRUCT_H */
> +
> +--
> +2.30.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
