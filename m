Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C44EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA4960D91;
	Sun,  6 Feb 2022 11:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rd1bjQRtszT; Sun,  6 Feb 2022 11:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C7F60D77;
	Sun,  6 Feb 2022 11:33:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB8B31BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA35E4014D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79cESsEBVQ6y for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:33:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61B914014C
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:33:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GfmwnrGQuXmFAGfmxnUnrw; Sun, 06 Feb 2022 12:33:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644147183; bh=Nx9pjRQ1iQfyh2TdHgye4G0aUEvtZXnjjZe66+Ju42M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=c1qMUl/H5w7UudKCZfzQKwdcE6BEXgrvBDzI3CBcnvY4fxD+zS8BxKCO6aE7wXkET
 0g2Prr9r0eOyC5g5DVgOKCY4o5D5LGti0jJTk0FoqMUeXEzrwb8uLp5gd0BQEq2K3n
 CgbiDR3atrALnvslbvnuJgf7dy/hYFirUh4XsDxDg/THN4cH0m8A8H997c4rQMTRcw
 cTHteVgFOad61M+Aw6BI3y/AsS5VjMEOIohvDPIGrtvHeTrHyF5oE3JlXneEO7kIQz
 rxKgFadtcyuEAg2iJaTF4FtcJXuTvF3YOc9+RrT92jW4XDHspO+tpEpxNtuqjdQ8yt
 YsDab/ElSQ9Ag==
Message-ID: <578d1d13-7b6c-6c99-098c-a831800fd492@benettiengineering.com>
Date: Sun, 6 Feb 2022 12:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
 <bf7f8c67-a1b2-e912-7579-780ef99d180e@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <bf7f8c67-a1b2-e912-7579-780ef99d180e@mind.be>
X-CMAE-Envelope: MS4wfCre0WO8T4KRj91hF/KsUY/4xxPOuJLdE5g5dSD47V54AE58TxvEiMkzZpxMBGd3X2lgqDfw5Clwx6wYGb86M9P0pqIGdDAhA43DED4zbH2zNImPhpke
 fKulx91xWcjIL9hApm/mU8aukVOeS5KkI4HK4/wRJREld6ZQ6+rSUYdNGfazYvPxXyknE0f8wns5hOeuoH+c8IiYAp+GNW42SXmhLLxCJFdmREfiFNNWcFxa
 qXQkq97LBK+ulRcvJGYKPqcPUFv2RwiXAZaXJ2xrI3n/ba2b+xOiVBUHPc+BL9IJonqzZ9jTyRHFJNHaGN1DIdMVJRT7KxkIS5MllsM4CMBSVpAQksxoy00w
 JB/T4w61
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On 06/02/22 12:14, Arnout Vandecappelle wrote:
> 
> 
> On 06/02/2022 10:08, Giulio Benetti wrote:
>> Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
>> fixed on gcc 11.x, so let's update bug conditions.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    toolchain/Config.in | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index ccdf62503d..aed8f393a3 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -185,11 +185,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>>    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>>    # Error: branch offset out of range on Nios II. This bug
>>    # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
> 
>    If this statement is true...
> 
>> -# fixed on gcc 10.x.
>> +# fixed on gcc 11.x.
>>    config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>>    	bool
>>    	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
> 
>    ... then this should be
> 
> 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11

but it's all negative options, so I thought I needed AT_LEAST_10 to 
cover gcc 10.x as having the bug. But it's not needed. So I only need to 
modify from !BR2_TOOLCHAIN_GCC_AT_LEAST_10 to 
!BR2_TOOLCHAIN_GCC_AT_LEAST_11 and that's it.

So I send a V2 for this.

>    We don't have a nios2 GCC9 toolchain in the autobuilders so we'll never
> notice, of course.

I've tested it locally with buildroot built toolchain.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> 
>>    	depends on BR2_nios2
>>    
>>    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
