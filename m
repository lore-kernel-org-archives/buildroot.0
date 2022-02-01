Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC4881ADE;
	Tue,  1 Feb 2022 18:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrDjZbxbAZr9; Tue,  1 Feb 2022 18:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C1D80B6F;
	Tue,  1 Feb 2022 18:18:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9851BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE46401DD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lehfK_2KYzH9 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:18:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F286400C4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:18:53 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ExjvngY4IQUuPExjvnjiEY; Tue, 01 Feb 2022 19:18:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643739531; bh=yO90fZvUjz72IEqTDtSebMR05Opp4Lkk0ocwyfgsTJQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Quge3jRhlDjx1XLrwkpgD7SwiY9fEGC69ibAt6qR7N0jWGFiPtplIcxrLQGPWO+RW
 C+ylZqeEzgQsZgT0AwEjAbY/WQq5el5gog/aONRA9DiCOoc8ei0oYO6NTTcs4hpEP4
 0x2xxsxSnSr06BXDRqJk1PhR/m0BQYnOSbXljBySx2KWOG7q6Ir5ibNeRVnjqqHhZo
 6KeDYRJ+KaD2XFdzqI+LUjLyR6zYY9WvnPk7ResmvW5Z27qHmAFZAkyjKyAckxjZLg
 tOFMHM/nHQb+eaibTOSzjP1HxHR8yOoPNsq0NaYntddL1Li6akvj07Za0eSejEhC1b
 1zE6d++RwTJCQ==
Message-ID: <260964d9-46f6-cb5d-8779-9559f0a2d0a8@benettiengineering.com>
Date: Tue, 1 Feb 2022 19:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20220131212456.3176156-1-geomatsi@gmail.com>
 <df90dc24-b44e-fcb9-ed82-7b517604f4b0@benettiengineering.com>
 <Yfl3z9eL3D9nmplt@curiosity>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <Yfl3z9eL3D9nmplt@curiosity>
X-CMAE-Envelope: MS4wfD4PJ6xpFlPkroEmyn/QgGc7jSUmGiSBwHbLxhNi62Rg/LOFabQSzwLLciYCdW9AU8nA4iccyHEgG72Zz8VdeUptktgxIpkXL1cXHYd61x/4FxEhayUz
 x0Z2K3X0/9RV8JA/rlEPn7xXIaBn8qBAeUD6zFwLgQusBXIlcm7pK1SiXRE82raU4OZqcCWNGztUKfcpEBWsDX+cVz+d4gfZOh5aMEqQpGa/UnkIV6+4BqY1
 SQZciJ/Qgo00uuY+6NE7Y/sMO4VQjIPlWjEoJQVTfXU=
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/22 19:11, Sergey Matyukevich wrote:
>> Hi Sergey,
>>
>> On 31/01/22 22:24, Sergey Matyukevich wrote:
>>> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
>>>
>>> To fix the first genimage error report, change 'partition-type' entries
>>> to the appropriate 'partition-type-uuid'. Then genimage starts to
>>> complain about overlaps:
>>>
>>> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
>>> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
>>>
>>> To fix the second genimage error report, update the size of bootloader
>>> file. Do not reserve additional space for GPT partition table since
>>> new genimage is able to keep track of it.
>>
>> Here we need a:
>> Fixes:
>> url where you point the failure
> 
> You are right. But I don't have a CI report for this. I noticed the problem when
> building images locally.

Check here for this patch:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478371

for the other you've found it locally.

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
