Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A900EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 22:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B36B40439;
	Tue,  8 Feb 2022 22:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1qoBUfCEDfh; Tue,  8 Feb 2022 22:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5EB3400F1;
	Tue,  8 Feb 2022 22:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA11C1BF3D5
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8E10825B9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvyqT5QO77SP for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 22:54:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E2182505
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 22:54:20 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HZNJnvS4ko6PDHZNJn1EK7; Tue, 08 Feb 2022 23:54:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644360858; bh=cgoBmycz1WU2r0ZR/+fAHq3E+xWjCozX+W2sqqlvdm8=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=TAtsZojdWnAqT9Wtw5rZw0vDHXueRZRRvVPS8oN0MGbv6b17pQW3yv5tmS0nu5WvV
 rza0AqZ0c21KNYcJyZDbsYagzWSItPWU8nvjnsHMUngHizEQSxWv0Qt4pE4bSV0WS7
 pNFJxCJu9CYYWvER5MWoYNMefwl4wP5njLlQFi1xgAq6veJ5EHRb8U55iXeB1xgJ7E
 o2PFS1YBcBn17cmZZDgJFdL4Zw/e2fJf32eNYcZ3jpUp5qctEk4O0VKaaXmPMRykJq
 dBzRWiMBTfXKdPZW+nQxvcDLrCDoQp5BqEz2nQ0kFuIdo3P8roTm1lfnMSjBBtMRzV
 Avp7+jdBSQDTw==
Message-ID: <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
Date: Tue, 8 Feb 2022 23:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220208213722.836257-1-paguilar@paguilar.org>
 <5f710ea1-3f98-9435-c033-e73e70e86342@benettiengineering.com>
In-Reply-To: <5f710ea1-3f98-9435-c033-e73e70e86342@benettiengineering.com>
X-CMAE-Envelope: MS4wfAnglbWRtJYZZ5L7DXSpGwpz6zv0/1zFiI4gJtx9hPmStj1jYfwagJjV3HyZWMDSJI88GOfdomC6P9PDj2zbR5PAyaffKCaySCDAtwobFYifhd0cBr/G
 10ypTM7fXURH3c3/F04tlOQn3SCCRLV4KfoqzoKvKgaDI935vRICjiBtEGz5uzVhsOALQCKQ6h+TUEGg8zezejYnMp6I4LIIKiRrZeRqTB9Haf6kGVy/5jCc
 gzFHvPcubr5Txcw2WFte0pmT/D2GLOOsck7m8neMYiO9wx+UDaqQN7S/5Xk6yVGS
Subject: Re: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE
 as dependency.
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi again Pedro,

I've reproduced the build failure with your previous attached .config 
file and this patch fixes it. So below...

On 08/02/22 23:06, Giulio Benetti wrote:
> Hi Pedro,
> 
> On 08/02/22 22:37, Pedro Aguilar wrote:
>> If it's not present, enable libiconv.
> Here it's missing:
> Fixes:
> URL to autobuilder failure

...please provide the autobuilder failure URL and if it doesn't exist 
than we don't need it.

So once done this I can give you my Review.

Waiting for V2 with improved commit log then.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
> And also I can't find guile failing due to LIBICONV.
> 
> At least, I only find:
> http://autobuild.buildroot.net/?reason=guile-3.0.7
> 
> But it seems to be about another problem(to be solved too).
> 
> Can you please point the autobuilder failure?
> Otherwise I can't test/review your patch.
> 
> Thank you!
> Best regards
> -- Giulio Benetti Benetti Engineering sas
>> Signed-off-by: Pedro Aguilar<paguilar@paguilar.org>
>>
>> ---
>> Changes v1 -> v2:
>>     - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
>>       as before (pointed out by Thomas and Giulio)
>> ---
>>    package/guile/Config.in | 1 +
>>    package/guile/guile.mk  | 4 ++++
>>    2 files changed, 5 insertions(+)
>>
>> diff --git a/package/guile/Config.in b/package/guile/Config.in
>> index b1182a4cee..f70e674018 100644
>> --- a/package/guile/Config.in
>> +++ b/package/guile/Config.in
>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
>>    	select BR2_PACKAGE_LIBFFI
>>    	select BR2_PACKAGE_GMP
>>    	select BR2_PACKAGE_BDWGC
>> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>>    	help
>>    	  Guile is an interpreter and compiler for the Scheme
>>    	  programming language, a clean and elegant dialect of Lisp.
>> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
>> index 0f245fca76..03420407f8 100644
>> --- a/package/guile/guile.mk
>> +++ b/package/guile/guile.mk
>> @@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
>>    GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
>>    HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>>    
>> +ifeq ($(BR2_ENABLE_LOCALE),)
>> +GUILE_DEPENDENCIES += libiconv
>> +endif
>> +
>>    # The HAVE_GC* CFLAGS specify that we will use internal callbacks
>>    # instead of the ones provided by
>>    # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
