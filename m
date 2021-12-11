Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E8EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1791560C30;
	Sat, 11 Dec 2021 23:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rKnJmxCZDk9; Sat, 11 Dec 2021 23:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6982660C2E;
	Sat, 11 Dec 2021 23:51:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54B0B1BF426
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43569429C3
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvV9BLsVnU4G for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:51:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA33429C2
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:51:41 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wC9TmlQcVrmmOwC9Tm85Zz; Sun, 12 Dec 2021 00:51:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639266700; bh=HojW3BS+acLuaByE9Dk2sHgD1J6tGZT56/UG/hf6gHE=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=jA7X53s+E9vWYaMrFSVEgDR47exV3X+GPmtKLdbppc+B7gjn1mu4I5WU5hGzMFJ3L
 UYyC4sS+djOO74YzJDkck+yRtPe/KGUtylaV8mlXWqZ7UGojYYNdi9sfdLmourRBHE
 1XKEiUSen2gMguThdLt5QFD3gJogSOzIWw8Yfj9A/xL/EpdVn6bQNttMsSQMRh3ZSV
 Z7NRFvOLOOwMK37WHoJdAlO8sNdvcle/3FuDHlc148qqOmbCb9gPkKbfXURJIAV/Fg
 YWErPdqfxUw74kGixTGnkjhDLIi/w1nXYykuZEekI6CkuXWn98tlFC0aU24PtUoq/c
 tfa5/XFA4HWIg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211124192006.646757-1-giulio.benetti@benettiengineering.com>
 <20211124192006.646757-2-giulio.benetti@benettiengineering.com>
 <101000b7-5b80-1f83-53c0-0e8a7b0f733a@mind.be>
 <bd276398-ad43-ae87-1502-65b5b2315d91@benettiengineering.com>
Message-ID: <1be3063a-3f36-7579-d423-106395d599fc@benettiengineering.com>
Date: Sun, 12 Dec 2021 00:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bd276398-ad43-ae87-1502-65b5b2315d91@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOpsClWRm7vivY5jN5q9ScyayscSFkCHPeNw4PUl1jDfWqfbsplKsnx2lDJZCqB2/z6bimqJaN0vB53vy19JJCDI7SvzEb5j1l689z0w2bV2enLRtE47
 PmIAfXtVLQEt30gnYeS0FXjS/FgOwkQekdeDni1GP+2TRPEPHgERAr92azD7Adra2tK1Hf+4xwyajPCtEzzT6mqAyh2dGCuyD53lBCa816YgnvZ6eFegbjZw
 1SbZ8OLo0PWuTcLSFSvX98mkd76e+pHzut3lYrfBF7Q=
Subject: Re: [Buildroot] [PATCH 1/1] configs/olimex_a64_olinuxino: bump to
 Linux kernel 5.15.4, u-boot 2021.10 and ATF v2.5
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/12/21 00:49, Giulio Benetti wrote:
> Hi Arnout,
> 
> On 11/12/21 21:13, Arnout Vandecappelle wrote:
>>     Hi Giulio,
>>
>>     I have a few minor comments on this patch. I would normally just change them
>> while committing, but since I know you're very reactive and you would test those
>> changes better than I would, I'll leave it to you!
> 
> Sure, it's a pleasure :-)
> 
>> On 24/11/2021 20:20, Giulio Benetti wrote:
>>> Bump to Linux kernel 5.15.4, u-boot 2021.10 and ATF v2.5
>>> Note:
>>
>>     (nitpick) these two lines are not useful, just make the points. Also we like
>> to have proper sentences, starting with a capital.
> 
> +1, now I see especially here it doesn't make sense to repeat the summary.
> 
>>> 1) now u-boot needs SCP environment variable specified that can point to
>>> the or1k coprocessor firmware while if coprocessor is not used it must
>>> be passed /dev/null as we do in this case.
>>> 2) we now use the u-boot-sunxi-with-spl.bin instead of u-boot.itb since
>>> it's not produced by u-boot anymore.
>>> 3) u-boot 2021.10 requires python 3 and openssl so let's enable them.
>>> 4) remove local patches for uboot and linux.
>>> 5) remove global patches path from defconfig.
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>     board/olimex/a64-olinuxino/genimage.cfg       | 10 +---
>>>     ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
>>>     ...e-redundant-YYLOC-global-declaration.patch | 28 ----------
>>>     configs/olimex_a64_olinuxino_defconfig        | 25 ++++-----
>>>     4 files changed, 13 insertions(+), 102 deletions(-)
>>>     delete mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>>>     delete mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
>>>
>>> diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
>>> index 44fcb3cb59..9606d26c02 100644
>>> --- a/board/olimex/a64-olinuxino/genimage.cfg
>>> +++ b/board/olimex/a64-olinuxino/genimage.cfg
>>> @@ -16,15 +16,9 @@ image sdcard.img {
>>>     
>>>     	partition spl {
>>
>>     Since the partition now contains U-Boot (including SPL), I think it's better
>> to call it "u-boot". (Also nitpick)
> 
> +1
> 
>>>     		in-partition-table = "no"
>>> -		image = "sunxi-spl.bin"
>>> +		image = "u-boot-sunxi-with-spl.bin"
>>>     		offset = 8K
>>> -	}
>>> -
>>> -	partition u-boot {
>>> -		in-partition-table = "no"
>>> -		image = "u-boot.itb"
>>> -		offset = 40K
>>> -		size = 1M # 1MB - 40K
>>> +		size = 1032K # 1MB - 8KB + 16KB(GPT)
>>>     	}
>>>     
>>>     	partition boot {
>>
>> [snip]
>>>     # Bootloader
>>>     BR2_TARGET_UBOOT=y
>>>     BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>>     BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>>>     BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
>>>     BR2_TARGET_UBOOT_NEEDS_DTC=y
>>> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>>>     BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>>>     BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>>> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>>> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>>>     BR2_TARGET_UBOOT_SPL=y
>>> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
>>> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>>
>>     And here's the big comment: this is not actually the SPL image, it's in fact
>> the full U-Boot image. I think that what you end up with with this is that in
>> addition to this file, there's another file (u-boot.bin?) that gets installed
>> into images but that is in fact useless.
> 
> +1
> 
>>     Therefore, I think you should instead set BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
>> to u-boot-sunxi-with-spl.bin and remove BR2_TARGET_UBOOT_SPL.
>>
>>     Does that work?
> 
> Yes it works, just tested on target right now and sent the v2 patch[1] :-)
> 
> Thanks for reviewing! Ah, I've bumped Linux to 5.15.7, before it was
> 5.15.6 and I've realized only now I didn't put it on V1->V2.

s/5.15.6/5.15.4
I run too much

> [1]:
> https://patchwork.ozlabs.org/project/buildroot/patch/20211211234447.538121-1-giulio.benetti@benettiengineering.com/
> 
> Kind regards
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
