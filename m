Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7317CC004D4
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 02:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025B441C96;
	Fri, 20 Jan 2023 02:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025B441C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdi1uKLgd90I; Fri, 20 Jan 2023 02:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDE841C80;
	Fri, 20 Jan 2023 02:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDE841C80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 615E91BF329
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 02:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365AB41C80
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 02:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365AB41C80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id es62uDvf6TOs for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 02:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB2B41C78
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAB2B41C78
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 02:41:19 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q9so3115469pgq.5
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvCMdWyISJayGaHCi1oZ4pbKOIlZQ1ha2lDeOEY81t4=;
 b=U1Z7AQJEgxwWIZo1v5FRkZj0b698Xlg0ZrjefQr9hAyrWMovH/rqddg29jWb87Y9pD
 E2uIHwHM++J6g+a+Hk7Gqoc/PB48AzEvDYBsWxe3FpI0Wp3PAayCvL0PinTBvRJj5TWT
 pH9EObW7MkdKEgMYRZY6zdUT/944kmM5ArDUwlbTF3aZRfZ5BZ9yTXLkIOfOe0KAXX00
 BfwNx+Qy4By4GEMC0dkSkzJtyxtM5BK+CgiJnLhuacGv+XF8aqyi0nQFeXKo4wQubq4J
 +ck6NTZC0i0461evOYWqERxi1ZZ6InWwke/H0si6L5JHZHJDn1I8hXNn5jZcts0xCVy4
 Ypsg==
X-Gm-Message-State: AFqh2kpyebuZrxiLid9bp2cudEWw+28t2gfNzVbX/jvGe3FT2Rd47hmo
 eEt2R89Z5UM2z0LaKEXQIx0=
X-Google-Smtp-Source: AMrXdXsKCu25JbtgsD9iYxcNv6etNa8Yg/UmMh7XffwurDe4jLZVuXYrtEm+yDA6zU1yl8oG2HuwkA==
X-Received: by 2002:a62:79d2:0:b0:582:b089:d9be with SMTP id
 u201-20020a6279d2000000b00582b089d9bemr13857131pfc.13.1674182479305; 
 Thu, 19 Jan 2023 18:41:19 -0800 (PST)
Received: from [192.168.43.80] (subs32-116-206-28-45.three.co.id.
 [116.206.28.45]) by smtp.gmail.com with ESMTPSA id
 w11-20020a627b0b000000b0058b59c81a29sm16425681pfc.220.2023.01.19.18.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 18:41:18 -0800 (PST)
Message-ID: <d80df4f7-d2c4-7a1f-43b8-c7e50d421ec1@gmail.com>
Date: Fri, 20 Jan 2023 09:41:15 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <20230118213517.5946-1-ps.report@gmx.net>
 <Y8j63Dj9XcD56e5n@debian.me> <20230119214216.60f572b0@gmx.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230119214216.60f572b0@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LvCMdWyISJayGaHCi1oZ4pbKOIlZQ1ha2lDeOEY81t4=;
 b=aaMqCvqnItUK1x3iF6hvR58NbpXTrDlNV37NHpOPfAhmuS3RIa5Liai8gm0VAy/FdT
 5r0bjv6OWkfky8On+xj053PvZHuczB30M3GJxqCkkSWO/DWfS7T6LunmD+rp++X5SBA8
 TMxthr5BFvwJSdxj7DXhp/GyXqPE2YPVNKMZ9IqdYoscXOwI44cxb2rnfwcHCAdI8ZR6
 STwYr9pQshSBucNDJjnB3wuqi8qpNadf/K0k65Qgc1FBaQHe1gbwbGgtXijQPlfvAOBe
 h+PfYdat7/gTav3uWcbB1105yXxa/5rxG9dnW1d6Cqb5/RzV9PQPr22w2TFiBESAdEoS
 1rwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aaMqCvqn
Subject: Re: [Buildroot] [PATCH v1] package/git: bump version to 2.39.1
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/20/23 03:42, Peter Seiderer wrote:
> Hello *,
> 
> On Thu, 19 Jan 2023 15:10:04 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
>> On Wed, Jan 18, 2023 at 10:35:17PM +0100, Peter Seiderer wrote:
>>> - fixes CVE-2022-41903 and CVE-2022-23521
>>>
>>> For details see [1].
>>>
>>> [1] https://lore.kernel.org/git/xmqq7cxl9h0i.fsf@gitster.g/
>>>
>>
>> Ah! I'm about to submit the same bump. My bump builds fine, so I think
>> it is also applicable to yours.
>>
>> Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Thanks for confirmation...
> 
>>
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> ---
>>>  package/git/git.hash | 2 +-
>>>  package/git/git.mk   | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/git/git.hash b/package/git/git.hash
>>> index 57a77b2810..75398896e5 100644
>>> --- a/package/git/git.hash
>>> +++ b/package/git/git.hash
>>> @@ -1,5 +1,5 @@
>>>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
>>> -sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b  git-2.39.0.tar.xz
>>> +sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
>>>  # Locally calculated
>>>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>>>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
>>> diff --git a/package/git/git.mk b/package/git/git.mk
>>> index 9918d4c1ef..1d728e1964 100644
>>> --- a/package/git/git.mk
>>> +++ b/package/git/git.mk
>>> @@ -4,7 +4,7 @@
>>>  #
>>>  ################################################################################
>>>
>>> -GIT_VERSION = 2.39.0
>>> +GIT_VERSION = 2.39.1
>>>  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>>>  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>>>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
>>
>> The package patches apply here (with fuzz), so you need to refresh these
>> against v2.39.1:
> 
> Matter of taste (?), but for my taste unneeded code churn... as long as the
> patches apply unchanged...
> 

The fuzziness when applying the patch is due to commit 48050c42c7 (pretty:
fix integer overflow in wrapping format, 2022-12-01).

IMO, in any case, when a new upstream version is released, any out-of-tree
patches (like ones Buildroot ship) should be refreshed in order for them
to be applied cleanly.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
