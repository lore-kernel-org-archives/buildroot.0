Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37FFC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9FC40EB2;
	Fri, 14 Aug 2026 14:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHnvw1iAN_rH; Fri, 14 Aug 2026 14:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D710E40ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717195;
	bh=rYv2je8iJ/Fo/kzjM1Ix0lzMsV9qq0nA8rxtIIzynH0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QNrS9GTTaIhYWOC2m8iTsuYF6ICDa3+pAaT+Lsl1m2P2AgSFg+LpArm5W8gPfbdRF
	 E4SHUkalVzTZl/R5yP4GExyePImE0S8+rjuJmaQ5nXuBVp2+2TQBHq2W9zpnUSgEmt
	 tacXurx26t9aXqjLvRAYQa9iLaTzQ51iKP4PfAd1jqZCsAP9XEgYCLRTp27DEyntmd
	 DtUSbNDzUSCseISi2PhRaxVgdKfFt+xRd/gVs9dZcoWAC4ufV1F0JoloTrhrRBHkBA
	 xOeeMvLZBK1BWsMPer6SLlaM8ohhrjUEyX0X0s1iSLcYipbLihgHxpX/obQLCY3FG0
	 hnVsQtaqGjGmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D710E40ECE;
	Fri, 14 Aug 2026 14:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB7523F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA9D81488
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxxLeQruVRB8 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6775C8143D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6775C8143D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6775C8143D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so14595805e9.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717191; x=1787321991;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g3P75zGaMqp+TBTGOtFIDDvXtK3qeb+tFpna8uuvuIc=;
 b=OWgwHWiyrJOmdUgIfkBljvq9bYckJhDqPT+RHoEXXGkMiOG0N80QvH7i6hOp8DpLrE
 HK7nCdkziIkq1JVFt95C+T8iuHalDKsyiWbRaBqZXCpVb97vm97nI7Fq0Vb2XPTZD+0/
 +5ZIMp2vwUxZb3ch+9kp4EO6RVQncErNni560gKNcEYQTtt2OQ080dVib82h+oW9C8CY
 qlpLE5epCbIdCZnf4NONP44XefcA8k7xxoDKiGPfi8BUXA6ec+BsUnp8UPMAm9rPi7o6
 sl8o+XU4hV1ne4MBRhbAIPwYTNKKk4jrrWY+u5iXoZ5Mi8Fd0EIDPqBH4nywlXBFAAYA
 gRwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqoLBTPeaUNOTBKvj/PLCkaa10vmO3m2p9mlt58oJNRvcVvHEpG3RrFVht/zhPRx4NlmGmhbvdhxPY=@buildroot.org
X-Gm-Message-State: AOJu0Yz7vxUnq35G+rUzELLMOTaopolkbNNsrq9LV2Ka9/37+zLqFen1
 aGvWgw/7ljN0bGlvjXLIKxVIJQV8nzZcTbhNohJDAd1C4JaY9VIb0AWJIpP6JLQ8c3Z6m1hGzrm
 0tphLKNI=
X-Gm-Gg: AR+sD13tqDyve8w8smFiqYTWMKK92mkcIBtiP5/o0Cch0VIoaSkGHDJkoQ9xViV/nQ9
 ki+Jd/bIyFnBn6qtuADDYG6o4EuZi708FR+B/i8DP21RPzYgCAzyLfi10OGYZI4sp0vm/NfZz9N
 5zMPAB/upVY3/3FWF3UWUmXbJ6agvAjZWEG1Rq+V8wac14baxmn6xw3WjfXdidF4X0FJNKWRVRg
 y++WiOaNFWzmyL7d/K60zhO96czwLlRsC9yr9G3bdHJ4Tn72jz+DtV/tCjaM5+efjjBueWqZ4N4
 MGSxaytX96eirG1DBX7dt1eZpz2aRGNdFCx8Et5jjkv0YD1yr3aTKYRYg34EGIFC/GsI3EV3+qG
 d9FTQXRoha/shv5bleU6PX0vKsrAKTxphO+VmIJPq1qPOK0dJVCN6757yDga16sMEgwopP+Me6l
 N0omHMYrhLT9s5dkLVzHS/eDJIjP3I524pWz69QVUkACqBr3+iR2PhFuHTqHHcUkPrHaQDquW7u
 cEkwB5NNwh3qKyq2DCzh87js6TicI2Prx2prYzvUjNB/s8u
X-Received: by 2002:a05:600c:228e:b0:495:4e1d:82df with SMTP id
 5b1f17b1804b1-499879774bamr64968195e9.10.1786717191154; 
 Fri, 14 Aug 2026 07:19:51 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b24746sm94774035e9.12.2026.08.14.07.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:19:50 -0700 (PDT)
Message-ID: <d1767913-e72b-4df8-9e58-c5452a80e8f3@mind.be>
Date: Fri, 14 Aug 2026 16:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260420084407.37993-1-chakrabortyshubham66@gmail.com>
 <20260420190748.181272-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260420190748.181272-1-chakrabortyshubham66@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/botan: security bump to version
 3.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/04/26 21:07, Shubham Chakraborty wrote:
> - Update BOTAN_VERSION to 3.11.1
> - Remove 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
>    as it is already integrated upstream in this version.
>
> Fixed in 3.11.1:
> - CVE-2026-35580: Resolve certificate verification bypass bug introduced
>    in 3.11.0 (GH #5500)
> - CVE-2026-35582: Resolve TLS 1.3 client authentication bypass (GH #5599)
>
> Fixed in 3.11.0:
> - CVE-2026-32877: Fix a heap over-read during SM2 decryption (GH #5450)
> - CVE-2026-32883: Fix an OCSP response forgery vulnerability (GH #5449)
> - CVE-2026-32884: Fix a name constraints bypass for DNS names (GH #5448)
>
> - Remove the --disable-altivec configuration option as it has been removed
>    from the Botan build system in version 3.x
> - Optimize the --disable-neon logic using the yx pattern.
>    In Botan 3.x, the --disable-neon flag is specifically targeted at the
>    arm32 architecture. Furthermore, Buildroot's BR2_ARM_CPU_HAS_NEON
>    variable is only defined for 32-bit ARM, which previously caused a
>    false-positive --disable-neon flag to be passed on AArch64 builds
> - Update license.txt hash in botan.hash due to the copyright year update
>    to 2026
>
> https://botan.randombit.net/news.html#version-3-11-1-2026-03-31
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
