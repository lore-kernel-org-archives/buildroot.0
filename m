Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0735C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 535A3400FD;
	Sat, 11 Dec 2021 23:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMMVqQuiLmrf; Sat, 11 Dec 2021 23:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D7B84015F;
	Sat, 11 Dec 2021 23:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFB5F1BF426
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8357429C2
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08tFw6eSVRNR for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:49:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68853425D3
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:49:36 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wC7SmlNUgrmmOwC7Sm84pc; Sun, 12 Dec 2021 00:49:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639266574; bh=joboSjSjAZ+fYocBJ62pJuM3uOspZRRXWl5aVXNdFw4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ZiR7uGTdq5r3ylBRD69Ag+GFacu8GgxgmNKrUqmC4BBI0agrSG2tIeS4hpYuFYPoC
 wPtrjnVpgBywKelZIjHv9Ew1eW0wqcLp0kUJ5RhJxhPNrbWGN9n6vDgcIYAavg+vV5
 egXZszAJtgZjkHncny2zqfzRrkJgsBr+lIkw+e5paCShUxXdpb1TP5mAH9njWvAp00
 e0OaP5hZgFZ+VUn/4eKNtLCHKlAZBh4SeNYpJw/J2kFmPoRpLQ5zCNfMvQhGtHNo0B
 FtDQbeFPW2IyhQFOWCbxZ7+chK9IBlTeVdeWQLFTNegpMGIH521IfdJ72MvoON6jrU
 rMS/v3oN+ECew==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211124192006.646757-1-giulio.benetti@benettiengineering.com>
 <20211124192006.646757-2-giulio.benetti@benettiengineering.com>
 <101000b7-5b80-1f83-53c0-0e8a7b0f733a@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <bd276398-ad43-ae87-1502-65b5b2315d91@benettiengineering.com>
Date: Sun, 12 Dec 2021 00:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <101000b7-5b80-1f83-53c0-0e8a7b0f733a@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCvgBRbIvwlhi0IuyWcWYNDzaDS9lmYi3BTWojcMq1wfHhZ6vIqzeum1UsVIw5iBZO9txV4/SysuYeGLhlNxemSJD7bnQaGWrEBtLeCijxlh0O9HpfYi
 EfH2X5USBQOz2Fn9ORVC+T04E3ZofWnwDwSBkTp/2Ams3TaOIrS6RZpxGWcewMgU6TKBEUAf1zDd+oBUcx2B9+rcOcsnieYYWL4RYVyR52xKdH+Y5hdtN3+Y
 OlIxCSY3zj6CDcOridu3xN/am9HBxCWvNHsfLmBpNhM=
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

Hi Arnout,

On 11/12/21 21:13, Arnout Vandecappelle wrote:
>    Hi Giulio,
> 
>    I have a few minor comments on this patch. I would normally just change them
> while committing, but since I know you're very reactive and you would test those
> changes better than I would, I'll leave it to you!

Sure, it's a pleasure :-)

> On 24/11/2021 20:20, Giulio Benetti wrote:
>> Bump to Linux kernel 5.15.4, u-boot 2021.10 and ATF v2.5
>> Note:
> 
>    (nitpick) these two lines are not useful, just make the points. Also we like
> to have proper sentences, starting with a capital.

+1, now I see especially here it doesn't make sense to repeat the summary.

>> 1) now u-boot needs SCP environment variable specified that can point to
>> the or1k coprocessor firmware while if coprocessor is not used it must
>> be passed /dev/null as we do in this case.
>> 2) we now use the u-boot-sunxi-with-spl.bin instead of u-boot.itb since
>> it's not produced by u-boot anymore.
>> 3) u-boot 2021.10 requires python 3 and openssl so let's enable them.
>> 4) remove local patches for uboot and linux.
>> 5) remove global patches path from defconfig.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    board/olimex/a64-olinuxino/genimage.cfg       | 10 +---
>>    ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
>>    ...e-redundant-YYLOC-global-declaration.patch | 28 ----------
>>    configs/olimex_a64_olinuxino_defconfig        | 25 ++++-----
>>    4 files changed, 13 insertions(+), 102 deletions(-)
>>    delete mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>>    delete mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
>>
>> diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
>> index 44fcb3cb59..9606d26c02 100644
>> --- a/board/olimex/a64-olinuxino/genimage.cfg
>> +++ b/board/olimex/a64-olinuxino/genimage.cfg
>> @@ -16,15 +16,9 @@ image sdcard.img {
>>    
>>    	partition spl {
> 
>    Since the partition now contains U-Boot (including SPL), I think it's better
> to call it "u-boot". (Also nitpick)

+1

>>    		in-partition-table = "no"
>> -		image = "sunxi-spl.bin"
>> +		image = "u-boot-sunxi-with-spl.bin"
>>    		offset = 8K
>> -	}
>> -
>> -	partition u-boot {
>> -		in-partition-table = "no"
>> -		image = "u-boot.itb"
>> -		offset = 40K
>> -		size = 1M # 1MB - 40K
>> +		size = 1032K # 1MB - 8KB + 16KB(GPT)
>>    	}
>>    
>>    	partition boot {
> 
> [snip]
>>    # Bootloader
>>    BR2_TARGET_UBOOT=y
>>    BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>>    BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
>>    BR2_TARGET_UBOOT_NEEDS_DTC=y
>> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>>    BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>>    BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>>    BR2_TARGET_UBOOT_SPL=y
>> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
>> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> 
>    And here's the big comment: this is not actually the SPL image, it's in fact
> the full U-Boot image. I think that what you end up with with this is that in
> addition to this file, there's another file (u-boot.bin?) that gets installed
> into images but that is in fact useless.

+1

>    Therefore, I think you should instead set BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
> to u-boot-sunxi-with-spl.bin and remove BR2_TARGET_UBOOT_SPL.
> 
>    Does that work?

Yes it works, just tested on target right now and sent the v2 patch[1] :-)

Thanks for reviewing! Ah, I've bumped Linux to 5.15.7, before it was 
5.15.6 and I've realized only now I didn't put it on V1->V2.

[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20211211234447.538121-1-giulio.benetti@benettiengineering.com/

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
