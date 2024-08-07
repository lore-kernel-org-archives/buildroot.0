Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55799C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D0F80569;
	Wed,  7 Aug 2024 10:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU_xg-DIMNse; Wed,  7 Aug 2024 10:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3281380C4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3281380C4A;
	Wed,  7 Aug 2024 10:25:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B30941BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FFBC40547
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOKz2l0Ygv0D for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12210401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12210401FC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12210401FC
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:25:08 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C50842C8021C;
 Wed, 07 Aug 2024 12:25:06 +0200 (CEST)
Message-ID: <33a1bd7f-1050-43f5-880d-20cb07db2de7@bubu1.eu>
Date: Wed, 7 Aug 2024 12:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
 <20240216131815.318315-2-buildroot@bubu1.eu>
 <20240805120206.6da2d1a9@windsurf>
Content-Language: en-US
In-Reply-To: <20240805120206.6da2d1a9@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723026306; bh=ARErNY1AVHJTGu8hxYi7hToiMby+NBOguuxD8FvS+os=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=r06bifIua34IykQVoQCuMZAIInLXioLeW73LrQ6NG6aUM/BZsuNLJ79AZD0mwLZQM
 AtT5pIOYC9Fhldioj7XQYJqw5ovbi+QPs7SXOJ1t+UvFQ4AVTmsuIsBWvdvMVQfSUx
 AFYFpjqWQum2ukE+iaatPOKgAJeyDh7UEnuBEhg9rI6I+tioZG2WtTGduZ/G/yoe+l
 xkNjQozlz2pJ5EjwDhu5Ikz5q8MzYsZZClVkrUjdkHdM2VMGw0xzxgxo1y1+6hl2j9
 x/gcZ/NBasXXZMB28VSSRKUzAEYQIjgwIiGzKnta4ASH3HQsgX+NqYiXRP2UaUwmlV
 bhQukX8Sghu9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=r06bifIu
Subject: Re: [Buildroot] [PATCH 2/2] package/python-whitenoise: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 05.08.24 12:02, Thomas Petazzoni wrote:
> Hello Marcus,
> 
> On Fri, 16 Feb 2024 14:18:14 +0100
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
>> index 0973467a2a..ac1dc81359 100644
>> --- a/support/testing/tests/package/test_python_django.py
>> +++ b/support/testing/tests/package/test_python_django.py
>> @@ -36,6 +36,7 @@ class TestPythonPy3Django(TestPythonDjango):
>>       config = TestPythonDjango.config + \
>>           """
>>           BR2_PACKAGE_PYTHON3=y
>> +        BR2_PACKAGE_PYTHON3_PY_PYC=y
>>           BR2_PACKAGE_PYTHON_DJANGO=y
>>           BR2_PACKAGE_PYTHON3_SQLITE=y
>>           """
> 
> I'm confused about this change. How is this related to whitenoise?

Not at all related and can just be dropped. This was a leftover from 
some Django debugging I did around the time I sent this patch.

Django (and this the django and whitenoise tests) were broken in 
February with out default .pyc only install method.

This has been fixed upstream in django and django has been updated to a 
fixed version in buildroot since then.


> 
> I see in reply to PATCH 1/2, you mentioned:
> 
> """
> The django test (and the whitenoise test introduced in the next patch)
> actually both currently fail because of a problem with django 5.0 and
> .pyc only installations. [1]
> 
> This now has "release blocker" priority at django and a proposed patch
> (that I tested locally but hasn't been officially submitted to django
> yet) so hopefully this will be fixed with the next django point release
> in a couple of weeks.
> """
> 
> But now PATCH 1/2 is merged, but not PATCH 2/2. Could you clarify this
> aspect? Is master broken because that snippet of PATCH 2/2 should have
> been in PATCH 1/2, or?
> 
> Thomas

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
