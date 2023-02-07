Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FC3C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6A7418CF;
	Tue,  7 Feb 2023 17:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6A7418CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlsA2yDxh4B2; Tue,  7 Feb 2023 17:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85945418CB;
	Tue,  7 Feb 2023 17:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85945418CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40F1E1BF976
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17ADF418C5
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17ADF418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sf0QjR0Oey43 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A97418BD
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78A97418BD
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:14:02 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 bg10-20020a17090b0d8a00b00230c7f312d4so6309682pjb.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iIqFn/p++pkTFoH7wlKnkTppeec20uFqxYSekJMF1Ak=;
 b=UOcm+aoA7asbN/2NvASM5Elcpuzyf/qFs6KVhLBmB4AUcPlsuc0aJU8w4lq084hPlz
 cCisnnOW3p5QUMbypPACVA9iLMFZZ/uCTjDJbUAsPaa07aSCknuPXB2stnmK8WYQhvbm
 QX0HoW37iMsv227CWd3tj4CWBCgrn9fcSHZySf5AZe7MIUoHi5pF7alPHpqowvJDdqUE
 FxTai2lyt2IB3DBSHAdOo0nizj8tFk/eailkHIoFmg4zHXSg6Cm+E7RdWNKXJYKahCXJ
 DViQRcvp+jkjQJ2w2AEH+clefmHRsF4TyfxNyQSNA//W4fr43vTmNb7oH0i+e6E8RFWR
 OEUQ==
X-Gm-Message-State: AO0yUKWw2jiEn+lGU+Dz6WviSJdUAi5l4K7GxyHs87iLSBFFVcWGmPDn
 PsBKoeYL+wqLoEm8J7C1RT2oLvEg0ANjjQDt
X-Google-Smtp-Source: AK7set8KcwhkdbiQpyaqBpBwkjJtqt19V1DXpn8Ch+P3XdFnwQMDqGl2S0GeNhGdbifHonDSeMZ6HA==
X-Received: by 2002:a05:6a20:54a0:b0:bc:6df2:70b5 with SMTP id
 i32-20020a056a2054a000b000bc6df270b5mr4205268pzk.27.1675790041739; 
 Tue, 07 Feb 2023 09:14:01 -0800 (PST)
Received: from [192.168.0.164] (S0106f875a4344b41.gv.shawcable.net.
 [70.67.112.211]) by smtp.gmail.com with ESMTPSA id
 b25-20020a63a119000000b0045ff216a0casm1836738pgf.3.2023.02.07.09.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:14:01 -0800 (PST)
Message-ID: <aa2d5bd6-f826-1dec-2286-d66838419690@threespeedlogic.com>
Date: Tue, 7 Feb 2023 09:14:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
 <20220519160214.214701-1-gsmecher@threespeedlogic.com>
 <20230207163803.GI4124@scaer>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20230207163803.GI4124@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iIqFn/p++pkTFoH7wlKnkTppeec20uFqxYSekJMF1Ak=;
 b=QoxzQ2OlrntiuKhCOvTTkEAZmxdy+1CWvW+Ch5/RhE7m5goNBMKlSuCuYhca1TQRE+
 zJzNAlvP454ogTFgvBw9fsdovE55Rh2rGcT0yx+ROwlj1jk6xthfg5VcK7d9N/gC5uRq
 rVeF5JBVOgNlLcw6RfAGoRYsyHjbSvRbEciqQuAs9WAe2sKV7YABKCgxHcbEFTYhIHjV
 gweeP3TQy5rD6+WtxhJNGKbdYc6jdry/+0tpWZmWJ48KVE0s+xtWQkG0uBzFPfZr8ShS
 k/0mIzUGMfLZLrCYkulNj1VhNPa+iugsTht2ngpqjVZfhx1+wV1zWIClL7qWmESSxWuI
 iV4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20210112.gappssmtp.com
 header.i=@threespeedlogic-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QoxzQ2Ol
Subject: Re: [Buildroot] [PATCH v2] package/python-orjson: disallow build
 when using musl.
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,
On 2023-02-07 08:38, Yann E. MORIN wrote:
> Graeme, All,
> 
> On 2022-05-19 09:02 -0700, Graeme Smecher spake thusly:
>> The python-orjson build bails as follows when using musl libc:
>>
>> 	error: cannot produce cdylib for `orjson v3.6.7 (...)` as the
>> 	target `i586-unknown-linux-musl` does not support these crate types
> 
> I could not reproduce such an error wit the following defconfig:
> 
>      BR2_TOOLCHAIN_BUILDROOT_MUSL=y
>      BR2_TOOLCHAIN_BUILDROOT_CXX=y
>      BR2_PER_PACKAGE_DIRECTORIES=y
>      BR2_PACKAGE_PYTHON3=y
>      BR2_PACKAGE_PYTHON_ORJSON=y
> 
> Since you submitted this patch, pythn-orjson was bumped multiple times,
> and we've also bumped rust to 1.66.1, so maybe that was fixed now.
> 
> Could you have a further look into this, please?

This patch is obsolete. I used to receive orjson build failures associated with musl on a regular basis - they have tapered off since mid-2022.

Over the past ~6 months or so, only the mips autobuilds have failed with the following message:

- maturin failed
   Caused by: The architecture mips is not supported

http://autobuild.buildroot.net/results/7291d123479411e632b8380f0045a18814dc23ae

I am happy to drop the patch.

best,
Graeme

> 
> Regards,
> Yann E. MORIN.
> 
>> It's not machine-specific (it occurs on i586, s389x, and arm platforms),
>> and is tied to what appears to be relatively arcane details for
>> rust/musl:
>>
>> 	https://github.com/rust-lang/rust/issues/59302
>>
>> At some point, it will be possible to remove this restriction - but not
>> yet.
>>
>> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
>> ---
>>   package/python-orjson/Config.in | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
>> index 420e023b0a..b2ad9062cc 100644
>> --- a/package/python-orjson/Config.in
>> +++ b/package/python-orjson/Config.in
>> @@ -1,6 +1,8 @@
>>   config BR2_PACKAGE_PYTHON_ORJSON
>>   	bool "python-orjson"
>>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>> +	# doesn't build with musl until rust's cdylib targets work with it
>> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>>   	select BR2_PACKAGE_PYTHON_CFFI # runtime
>>   	help
>>   	  orjson is a fast, correct JSON library for Python. It
>> @@ -10,3 +12,6 @@ config BR2_PACKAGE_PYTHON_ORJSON
>>   	  instances natively.
>>   
>>   	  https://github.com/ijl/orjson
>> +
>> +comment "python-orjson requires rust cdylib support, which musl doesn't have yet"
>> +	depends on BR2_TOOLCHAIN_USES_MUSL
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
