Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E70CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 10:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF0E4155F;
	Wed, 23 Feb 2022 10:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1ScIG4jIM9p; Wed, 23 Feb 2022 10:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E3941559;
	Wed, 23 Feb 2022 10:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3771BF3FF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 10:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B42340275
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 10:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QK9YlBQmAG6u for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 10:45:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8B740195
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 10:45:16 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Mp8ynawejQUuPMp8znPmkV; Wed, 23 Feb 2022 11:45:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645613114; bh=Z7eB40gXJVdnGUe5GBtD6BeFEgUPQJ7umGGV8GxBbx4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BJMLWjXac5xVmE9HZLEKXjZWrfMYPYWcTsm9quGWD3S1eKLntKpgE0F/ndEE44UsH
 h/Le5Jmw4xj2yIsxymLj4CKICDT1RmRZSFcjYydLpsHRQmnv7X+C6kB8S7A8L9J5Y2
 A+WEhG9qDFgzc8wrkiT1bxfqq9ydSXtKvDTICUI6vJPJw2itiji5QSoLH0dMxkhw8M
 LjZlcuUwb2JV6nDY8BvhtgCwk8ALthnJ9G56kO51BrxTSzRIS8JuhmbTqs9VeM5+Si
 wtco7YssWVkIu645U3CoWLj6f0SHJKDukNfq3JUjSnnhPWyIODZAEXlKL0ame1gO3M
 N9CiJ68Kfy07g==
Message-ID: <dcb73632-8dda-4314-838f-2db1c9f91102@benettiengineering.com>
Date: Wed, 23 Feb 2022 11:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20220223071049.21153-1-peterlin@andestech.com>
 <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
 <YhYHxAZuz+wY4Nl+@APC323>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YhYHxAZuz+wY4Nl+@APC323>
X-CMAE-Envelope: MS4wfFlNEuS21WLhQX3QjwprrrFi5QuOKU2RaYNUoxxA4luioKRxxRcznLujvwh7By5aHd65cjSgwTlxgcR6TX1RXaGp8Bdi4Pbpz0h3TcPiN4gbTup7Bsa4
 KLy2PbrWo8GXJk+0gWglP/nVgNWjj16EpYo2YaNxeXQRJmK6hOQA5YV/dxeH30Megu9DR0YAsNoOhsadpIfn5M0tEVjj3m2qwM+wnru9eI9GUmMdNlxmv0eJ
 uqWfZ9mZGUFD3mtcX6n2JS6KlH1NwF1525HwVmGx6Z8=
Subject: Re: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 23/02/22 11:09, Yu Chien Peter Lin wrote:
> Hi Giulio,
> 
>> On Wed, Feb 23, 2022 at 10:19:08AM +0100, Giulio Benetti wrote:
>>> Hi Peter,
>>>
>>> On 23/02/22 08:10, Yu Chien Peter Lin wrote:
>>>> Rename ae3xx to ae300 for nds32 architecture and add ae350 platform.
>>>>
>>>> AE300 (NDS32):
>>>> - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
>>>> AE350 (RISC-V):
>>>> - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/
>>>>
>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
>>>> Signed-off-by: Alan Kao <alankao@andestech.com>
>>>> ---
>>>> Changes v1 -> v2:
>>>>      - move linux source code and its patches to AndesTech Github repo
>>>>      - rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
>>>>      - change C library to uClibc
>>>>      - remove OpenSSL package
>>>>      - remove rootfs.cpio and rootfs.tar
>>>>      - update DEVELOPERS
>>>> Changes v2 -> v3:
>>>>      - specifiy branch to download from AndesTech linux repo
>>>>      - change boot.cmd to extlinux.conf
>>>>      - add post-build.sh for extlinux.conf to retrieve Image and DTB
>>>>      - fix format and update genimage_sdcard.cfg
>>>>      - update readme.txt
>>>>      - add packages (python3, pylibfdt and openssl) for u-boot binman
>>>>      - reorder item in DEVELOPERS
>>>> Changes v3 -> v4:
>>>>      - rename ae3xx folder to ae300
>>>>      - rename andes_ae3xx_defconfig to andes_ae300_defconfig
>>>>      - update readme.txt and item in DEVELOPERS
>>>
>>> Some of these change ^^^ must have been moved to the single patch, like
>>> DEVELOPERS is updated in patch 3/3. I've also forgotten to point you to add
>>> a --cover-letter, so keep in mind both points for next time.
>>>
>>> I've built tested both defconfig successfully, so:
>>> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> [Giulio: build tested only]
>>>
>>> And the other patches of this series is all reviewed, so to me it's ready to
>>> be committed, but this will happen after Buildroot 2022.02 is released,
>>> since between rc1 to the release Maintainers only accept fixes. Another
>>> possibility is that they will commit these patches to next branch.
>>>
>>> Please remember to tag V3.
>>>
>>> Thank you for your effort!
>>>
>>> Best regards
>>> -- 
>>> Giulio Benetti
>>> Benetti Engineering sas
> 
> Thanks for reviewing my patches and the guidance.

You're welcome.

> I will make a new patch for the Config.in,

Which one? I only see:
toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in

Do you mean you will add an entry in DEVELOPERS for it?

> The last question, is it tag V5 for the next submission?

It depends if you need to modify these patches. Or if you add a new 
patch that depends on these patches, then yes, please send a V5 with all 
changes moved to the different patches, including adding the patch if 
this is your goal.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
