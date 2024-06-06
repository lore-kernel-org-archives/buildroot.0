Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF0C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 496BF41933;
	Thu,  6 Jun 2024 19:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn6ApqZTXXJV; Thu,  6 Jun 2024 19:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050B741954
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 050B741954;
	Thu,  6 Jun 2024 19:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAC11BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396EB849BD
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeGmvuGvZ19H for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F38C4849B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38C4849B7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F38C4849B7
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42133f8432aso8709305e9.3
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702853; x=1718307653;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/wqfyjUOZMBZZ0suko6X9lOeqBuQpw4wHbyjUNE56U=;
 b=RHyKm2XqLS3OONrhmIcNb6P1AeQDV9pNNOK1NqxyTIf1BI+JC3ItNYKkgWoHzNdZer
 HzOl/Ug/vShpA00X4C+ytpBgfN3J33kWRJe/25bwtS9e5W7/r01qbMhtxQRnYMu3WHp3
 twb2XgtK24TxLi6IkHzMsEHOJC8lMf85Njz3NYjB81MwrrqY23Y5/HaFMtgAFS0dJwXK
 hE+yuStDWjRrmrhIyyPf4c9z0ElzlKjQQVQ91RGLxo4K8UY3Rq8Cza36cSneciaymddt
 EpRhF/eH8cxrHiwhR8wHpdIgF2z/C7XYUerBAdQnSTbeGa2yRh4im+QYxfn98zh/Z+jj
 zdPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4f/MG1QzLqtzI8GEe+eayxyg2SpmZU9BItMVfAtSa8xu+0R3ZWPkQEtlsnB/5mTTNCI+OIn1oAaGQkU5zo/QMd9RBT/jvew==
X-Gm-Message-State: AOJu0YwANtaxRCxLhqVYQB8mISVi3/FtvOVbtRY2dIPtq+KWYprp1XqF
 L9h6yjiKzfIHH5+oEkPh7ypocHhEQC8R0YNiOyG4T9gHuZ72bM9jpxECX+KA6aEn4g3C1x6qqKg
 Q
X-Google-Smtp-Source: AGHT+IFqVjW0ieR6Icq3g4TEaxqCqhA/67I6JwQCLlsg9qs2Jf79rQTXcwlTngyay/BBQg+/dm8WtQ==
X-Received: by 2002:a05:600c:5488:b0:41c:2992:a3be with SMTP id
 5b1f17b1804b1-42164a25705mr5206705e9.29.1717702852954; 
 Thu, 06 Jun 2024 12:40:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm31051965e9.26.2024.06.06.12.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:52 -0700 (PDT)
Message-ID: <9e8538db-d01d-48fa-8856-9f3dc74a533f@mind.be>
Date: Thu, 6 Jun 2024 21:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <1ed351b7-0e04-436d-9ce3-ca70f4d3ff74@grenoble.cnrs.fr>
 <a0b1ad56-0cf6-488d-aea1-6beaea88f6b0@grenoble.cnrs.fr>
Content-Language: en-GB
In-Reply-To: <a0b1ad56-0cf6-488d-aea1-6beaea88f6b0@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702853; x=1718307653; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/wqfyjUOZMBZZ0suko6X9lOeqBuQpw4wHbyjUNE56U=;
 b=DMJS45/Sai1XT7SDGZBtBh3dz7csPpnurPfhvn/6NyaEEblIlM0soAzmUraoLUTim7
 +HsCULAeujTKt2HTzcLNgRzUWgf3tvUjdNUc809vKLt3e+T2FTRRmNy6kD1MB4v25T7x
 sL/tSHVs9BbDc5H42CY2zwm/+2IBFfI7oT5NXc08pEfNaui5yhs/twsIbpHrt71tn4iP
 cBEpjJGMfwT9A9X7IXt2IaOcuNK3v2JWXht1a1l2NnIx8NZ6SJdKZJRvy8BXvVL3gPXW
 tf50XOHY6KSNI9jT9aHXrTXJG7hMnHnNhgPNDiLXjrNARn14sRQl5A1rUeu5cAVo01Dz
 /rZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DMJS45/S
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: fix compile error in
 configure script
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



On 21/05/2024 13:56, Edgar Bonet wrote:
> Hello all!
> 
> On 2024-05-16, I wrote:
>> Building with GCC 14 fails at the configure step with:
>>
>>      ./configure: error: libatomic_ops library was not found.
>>
>> The error is not caused by a missing library, but by an unrelated
>> "incompatible pointer type" error in the test program:
>>
>>      ...
>>      checking for atomic_ops library
>>      objs/autotest.c: In function 'main':
>>      objs/autotest.c:9:48: error: passing argument 1 of 'AO_compare_and_swap' from incompatible pointer type [-Wincompatible-pointer-types]
>>
>> This used to be a warning, but it is an error since GCC 14.[1]
>>
>> Fix this by patching the test program in order to use the correct
>> pointer types.
>>
>> [1] https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

  In the future, please include a Fixes: tag. You can find an autobuild failure 
with http://autobuild.buildroot.net/?reason=nginx%25

>>
>> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
>> ---
>>   ...ix-compile-error-in-configure-script.patch | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 package/nginx/0011-Fix-compile-error-in-configure-script.patch
>>
>> diff --git a/package/nginx/0011-Fix-compile-error-in-configure-script.patch b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
>> new file mode 100644
>> index 0000000000..2e719928ce
>> --- /dev/null
>> +++ b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
>> @@ -0,0 +1,41 @@
>> +From e1bcac837f6aeabc4ddece06ecbcf2bcca8dd651 Mon Sep 17 00:00:00 2001
>> +From: Edgar Bonet <bonet@grenoble.cnrs.fr>
>> +Date: Thu, 16 May 2024 11:15:10 +0200
>> +Subject: [PATCH] Fix compile error in configure script
>> +
>> +Building with GCC 14 fails at the configure step with:
>> +
>> +    ./configure: error: libatomic_ops library was not found.
>> +
>> +The error is not caused by a missing library, but by an unrelated
>> +"incompatible pointer type" error in the test program:
>> +
>> +    ...
>> +    checking for atomic_ops library
>> +    objs/autotest.c: In function 'main':
>> +    objs/autotest.c:9:48: error: passing argument 1 of 'AO_compare_and_swap' from incompatible pointer type [-Wincompatible-pointer-types]
>> +
>> +Fix the error by using the correct pointer types.
>> +
>> +Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
>> +Upstream: https://mailman.nginx.org/pipermail/nginx-devel/2024-May/LF5H73UPOIS64TVQUN5N6S2A4IACBRPT.html
>> +---
>> + auto/lib/libatomic/conf | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
>> +index d1e484a..0f12b9c 100644
>> +--- a/auto/lib/libatomic/conf
>> ++++ b/auto/lib/libatomic/conf
>> +@@ -20,7 +20,7 @@ else
>> +                       #include <atomic_ops.h>"
>> +     ngx_feature_path=
>> +     ngx_feature_libs="-latomic_ops"
>> +-    ngx_feature_test="long  n = 0;
>> ++    ngx_feature_test="AO_t  n = 0;
>> +                       if (!AO_compare_and_swap(&n, 0, 1))
>> +                           return 1;
>> +                       if (AO_fetch_and_add(&n, 1) != 1)
>> +--
>> +2.34.1
>> +
> 
> The inner patch just landed, with a reworded commit message,
> on nginx's mercurial repo:
> 
> https://hg.nginx.org/nginx/rev/f58b6f636238
> 
> Should I re-spin this patch?

  Yes :-)

  I applied after taking the upsream commit message and updating the Upstream tag.

  Regards,
  Arnout
> 
> Regards,
> 
> Edgar.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
