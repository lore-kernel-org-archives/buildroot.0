Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03ACC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B3484158;
	Tue, 24 May 2022 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5B-t8W-ZKs6t; Tue, 24 May 2022 22:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55F3884151;
	Tue, 24 May 2022 22:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B18A61BF82D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FD074099C
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMn4LWvWql15 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 22:14:28 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id E943B40994
 for <buildroot@buildroot.org>; Tue, 24 May 2022 22:14:27 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tcgUnyHbCY1m9tcgUnEVpD; Wed, 25 May 2022 00:07:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653430043; bh=tlUMWtVS7p1viQal9GnEjQa6bi1nlygd5b2iMW5gBNs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NTpIgjYc0n9aGAZseM94SSMoCtK/a7uzAQp7GzXIym5Kr5DAmza1ZJdNClt1xfs6l
 iv7GwGBqm1iWzM9CJqCczj4oOhLH86EZwHfyGQo5Ja40AqCqTTMlxJYi34PMyGI3Ut
 N8wyKW41n5BnDyEXzGCemTKgQRM3Qo8s4mCKlLaGQ4lcqOhQ2O5PiEWRfPfqwQkiub
 LdqNljZNbV8TnMZ/TIbg2LmideVlwLTXwyO/dnhmGGmfmOt6bPCtjxspYiCTBVRaNr
 xEvgs80wjKetKQ9Vjx9v29fNkV/jQHpeWxCh/UDLFQDksU+obY4ByB3IsFpSf/ebpN
 esDOzLC60Ltaw==
Message-ID: <a2c0ce4b-27c5-8860-68de-b1e54eb697b6@benettiengineering.com>
Date: Wed, 25 May 2022 00:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
 <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
 <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
 <CADvTj4qRkBWM9Pv+bd8bPN-jJn0tXVzR3g7TfNLPq1uz3L=zsQ@mail.gmail.com>
 <b1c45001-9db1-7d36-15e6-630405d4a07a@benettiengineering.com>
 <CADvTj4q+dvDwsLFZv9KDVDmf8an9+Nn_j+xXCgLYkF49p0eRwg@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4q+dvDwsLFZv9KDVDmf8an9+Nn_j+xXCgLYkF49p0eRwg@mail.gmail.com>
X-CMAE-Envelope: MS4xfC5ejrqj5YKbZGtOXvtza+x4bQPBQH1bh/EGHjkVrCJUvDvyLf5vfvi07FemXSmzShJZb61uCkEN2/xHCwV1oFnIiIvqeoQiahYsjZWVqjjA5ixsDUkK
 2l0xlgspJT62GTezIE3Y1rEo2+asXbtGEMtbJeyQmM/Cp/AdQj5DUdjFD9B/DkuG1JV9AtLptmFD7NyfABOfxRnXKU66vf8OahKOLIS3TJNy4si3l2+GZE5W
 HRdAWhNdkodX+qrfHfDFe3uqvteGSsYyrCiFavrsTdo=
Subject: Re: [Buildroot] Can't reproduce libnss build failure
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/05/22 21:54, James Hilliard wrote:
> On Tue, May 24, 2022 at 8:55 AM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> On 24/05/22 00:08, James Hilliard wrote:
>>> On Mon, May 23, 2022 at 3:43 PM Giulio Benetti
>>> <giulio.benetti@benettiengineering.com> wrote:
>>>>
>>>>
>>>> On 23/05/22 02:40, James Hilliard wrote:
>>>>> On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
>>>>> <giulio.benetti@benettiengineering.com> wrote:
>>>>>>
>>>>>> Hi James,
>>>>>>
>>>>>> I'm dealing with libnss build failure with host gcc on your asahi-mini
>>>>>> autobuilder, the host gcc doesn't
>>>>>> like -m64 option when linking [1].
>>>>>>
>>>>>> I've spent many hours trying to reproduce it on various dockers and
>>>>>> finally on a VM with Ubuntu 16.04
>>>>>> 32 bits but in the first cases I can't have any build failure, while
>>>>>> with the latter I have a different error.
>>>>>
>>>>> It's an aarch64 host, not 32 bit x86.
>>>>>
>>>>>>
>>>>>> Can you please tell me specifically which distribution and distribution
>>>>>> version you're using on asahi-mini?
>>>>>> I'm on it and I'd like to fix it.
>>>>>
>>>>> As the name implies it's asahi linux(arch based) on a mac
>>>>> mini(https://asahilinux.org/).
>>>>
>>>> Aah ok. Thank you, I'm now building a docker container with buildx based
>>>> on ubuntu 20.04 for linux/arm64, let's see if it behaves the same.
>>>> I've tried with archlinux:latest but arm64 is not available, while also
>>>> agners/archlinuxarm gives me problems.
>>>> Crossed fingers.
>>>
>>> If that doesn't work send me your ssh pub key and I can just give you remote
>>> access to the mac mini for reproducing/testing, I'm not really using it for
>>> anything other than autobuilders at the moment.
>>
>> Thanks a lot for the proposal but after lot of trials I've been able to
>> build a linux/arm64 docker with Ubuntu 20.04. I already see that gcc
>> doesn't like -m64 option and I'm building(veeery slowly of course).
> 
> Yeah, figured it would be slow with emulation, FYI raspberry pi 4 is probably
> a decent cheap system for reproducing aarch64 host build failures.

Ah yes, that's a good idea

>> So if I start to get mad for the slowness then yes, I'll give you my
>> public key and access your mac-mini.
> 
> The mac mini is surprisingly fast at compiling for such a small computer,
> the apple M series CPU's are pretty impressive.

Cool

> I figured it would be good to run autobuilders on it to catch aarch64 host bugs
> in case I pick up one of the more powerful apple aarch64 based systems
> later on as a primary dev system.

Awesome. Fortunately I've managed to fix the bug. I send it adding you 
in Cc. Can you please give a go and add a Tested-by or Reviewed-by after 
testing is possible?

Thank you very much!

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

>>
>> Thanks again
>> Best regards
>> ---
>> Giulio Benetti
>> Benetti Engineering sas
>>
>>>
>>>>
>>>> Kind regards
>>>> ---
>>>> Giulio Benetti
>>>> Benetti Engineering sas
>>>>
>>>>>
>>>>>>
>>>>>> Thanks a lot
>>>>>> Best regards
>>>>>>
>>>>>> [1]:
>>>>>> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
>>>>>>
>>>>>> ---
>>>>>> Giulio Benetti
>>>>>> Benetti Engineering sas
>>>>>>
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot@buildroot.org
>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
