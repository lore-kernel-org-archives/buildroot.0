Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15676C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6EE740342;
	Sun,  6 Feb 2022 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kvc05-bYYL04; Sun,  6 Feb 2022 11:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B6740338;
	Sun,  6 Feb 2022 11:34:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE5E1BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B542814AB
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqamWKrWDBb7 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:34:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43AF181352
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:34:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Gfo4nrHKMXmFAGfo4nUoRb; Sun, 06 Feb 2022 12:34:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644147252; bh=nuFl6r3R+7d59ehOHRn4hGR9l4LEE7CO9Hs0PYkjOlE=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=fxyWULJ+g5yQIiHesQXO6XcogzwCPW4CP6+xA7aKd4oag+CaSTcrWiPrunI3iAUkK
 y21qxmxg4oS4bk7pSEQrbN6TBrjHcvdT1sjnT3kXemURcO7BFTHCpT4wW9dLxsoDwk
 vfsT10RYqlBA0nzJXmW6i7JpTmmeH1C1XBcOfOGdcspt2YIWXpV05gJHlZGFZs8k+r
 ZVw76e4hVzHFgzDR9I6TJPyT+k/IbrMQPls/bDECB4lu+bBFMysTgM2Fn3pyLsb6u8
 PFlnue6VhbRV37xc6SEEN66cRa4sjPCtcHaW80lL9pA/Ln8OJa6lqubfodRKR8hpRh
 2XZwrrJUH395A==
Message-ID: <2fec6210-3811-197d-45a7-1ece869f49e0@benettiengineering.com>
Date: Sun, 6 Feb 2022 12:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
 <bf7f8c67-a1b2-e912-7579-780ef99d180e@mind.be>
 <578d1d13-7b6c-6c99-098c-a831800fd492@benettiengineering.com>
In-Reply-To: <578d1d13-7b6c-6c99-098c-a831800fd492@benettiengineering.com>
X-CMAE-Envelope: MS4wfJIK+NWlHomMO3q6/reIrzQZ7Sy7c0BdgdS84OARJoEAbb9DBZz3X1ZdNxhoLnyy/QXmVqZTFbMpmnq7zbgNf4n7k+/TzeiHW1q1l1lhFLrPNs9R/dOz
 ZyRBnk3sQf9b6tS9uEKkx4iytGFTstaKcCXIK3xh+8pthqnKUlLNwm749hhfnqLEPns4xVXST8o6h+jHslnOLNSyMw+Mbvny1BiLpvGcLRGT6bmyr7EcC0+Z
 W6cJXWbksR4olG5x23IEgM2egqCz0mpubKk1SJuxpF8RxBvT6H7BRJQAgyqCok1HpzD8IuH0Oz0uoOhec2VQhi5l+oLSKXU1aBKLU23eFTkuNOFedQqIWQcg
 /emCCjkh
Subject: Re: [Buildroot] [PATCH] toolchain: update gcc bug 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/02/22 12:33, Giulio Benetti wrote:
> Hi Arnout,
> 
> On 06/02/22 12:14, Arnout Vandecappelle wrote:
>>
>>
>> On 06/02/2022 10:08, Giulio Benetti wrote:
>>> Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
>>> fixed on gcc 11.x, so let's update bug conditions.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>     toolchain/Config.in | 4 ++--
>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>>> index ccdf62503d..aed8f393a3 100644
>>> --- a/toolchain/Config.in
>>> +++ b/toolchain/Config.in
>>> @@ -185,11 +185,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>>>     # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>>>     # Error: branch offset out of range on Nios II. This bug
>>>     # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
>>
>>     If this statement is true...
>>
>>> -# fixed on gcc 10.x.
>>> +# fixed on gcc 11.x.
>>>     config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>>>     	bool
>>>     	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>>> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>>> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
>>
>>     ... then this should be
>>
>> 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
> 
> but it's all negative options, so I thought I needed AT_LEAST_10 to
> cover gcc 10.x as having the bug. But it's not needed. So I only need to
> modify from !BR2_TOOLCHAIN_GCC_AT_LEAST_10 to
> !BR2_TOOLCHAIN_GCC_AT_LEAST_11 and that's it.
> 
> So I send a V2 for this.

Not V2, I need a new one to fix it since it's already been applied.
I send it now

>>     We don't have a nios2 GCC9 toolchain in the autobuilders so we'll never
>> notice, of course.
> 
> I've tested it locally with buildroot built toolchain.
> 
> Thank you!
> 
> Best regards

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
