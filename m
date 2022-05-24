Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988C9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A3F160D96;
	Tue, 24 May 2022 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsxcp0Y7Iw5i; Tue, 24 May 2022 15:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375A760BA1;
	Tue, 24 May 2022 15:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 966521BF329
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E4660BA1
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87to53xMLeKP for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:02:34 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id C11C760B77
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:02:33 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tVwVnQpaLNP7ItVwVnPDHR; Tue, 24 May 2022 16:55:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653404127; bh=WjPSRhdUePvfAIVzTtvqPyb2R9/8wFXGIe7r+p6Xrnc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DkK0IdC5Twbgint4JX33V7Y+yERkUnD6tSJzbVpTtq4VeKcq7dAUwJbtWX0LbJe1k
 XLn3Al5eNYx6pmDtqTTyC5jnvhwYbpP2s8+Mxo8i5h9KZYa7X+KtYEzKBRt4yc0uK5
 XfVFqKwJNxzMcz4/jgnlYwZApDS+cr20aSRGmn8UH9+Y+6axeGJKWwsCjx0d1iPA1E
 mol+/jSlaZeB4WlhiqaalY7VpmBAb27rUjD5mIVFLU3+m+vZ+EPQg3JThLIiFr09oI
 i6r9M6AG887j4L9ifd1PMdioP0CHbn8YEf0WOGN6qD/0VKeI+p6nHfa0wwq4kxmBMP
 xTN0ogrIFRJRg==
Message-ID: <b1c45001-9db1-7d36-15e6-630405d4a07a@benettiengineering.com>
Date: Tue, 24 May 2022 16:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
 <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
 <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
 <CADvTj4qRkBWM9Pv+bd8bPN-jJn0tXVzR3g7TfNLPq1uz3L=zsQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4qRkBWM9Pv+bd8bPN-jJn0tXVzR3g7TfNLPq1uz3L=zsQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfO0kRwMG47t+y9prWqu0Rt3XLdYAz/rhRXBm6rtdVKVGArWMboydddJjZJ8lUvSXo1D2z5VYeVk45Y8INqlzLzXCQmkvFuubozlcA7WpIFK2mb8VzPC9
 L6w/3SmVIXcEqFB745iDOhHcXN7udNeMXYf/0kO/Z1fCEmwDqNxPDHA9cY3KiSYAM1foCxAHe+x3cy5lyfIvuTMboO8uvJNP10rfVD4pS56l9ql3TphHTWVX
 9qEJleOTegyfx1+5WVKnPZQhZrlzExL7/6u9YjCZHnE=
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

On 24/05/22 00:08, James Hilliard wrote:
> On Mon, May 23, 2022 at 3:43 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>>
>> On 23/05/22 02:40, James Hilliard wrote:
>>> On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
>>> <giulio.benetti@benettiengineering.com> wrote:
>>>>
>>>> Hi James,
>>>>
>>>> I'm dealing with libnss build failure with host gcc on your asahi-mini
>>>> autobuilder, the host gcc doesn't
>>>> like -m64 option when linking [1].
>>>>
>>>> I've spent many hours trying to reproduce it on various dockers and
>>>> finally on a VM with Ubuntu 16.04
>>>> 32 bits but in the first cases I can't have any build failure, while
>>>> with the latter I have a different error.
>>>
>>> It's an aarch64 host, not 32 bit x86.
>>>
>>>>
>>>> Can you please tell me specifically which distribution and distribution
>>>> version you're using on asahi-mini?
>>>> I'm on it and I'd like to fix it.
>>>
>>> As the name implies it's asahi linux(arch based) on a mac
>>> mini(https://asahilinux.org/).
>>
>> Aah ok. Thank you, I'm now building a docker container with buildx based
>> on ubuntu 20.04 for linux/arm64, let's see if it behaves the same.
>> I've tried with archlinux:latest but arm64 is not available, while also
>> agners/archlinuxarm gives me problems.
>> Crossed fingers.
> 
> If that doesn't work send me your ssh pub key and I can just give you remote
> access to the mac mini for reproducing/testing, I'm not really using it for
> anything other than autobuilders at the moment.

Thanks a lot for the proposal but after lot of trials I've been able to
build a linux/arm64 docker with Ubuntu 20.04. I already see that gcc 
doesn't like -m64 option and I'm building(veeery slowly of course).
So if I start to get mad for the slowness then yes, I'll give you my 
public key and access your mac-mini.

Thanks again
Best regards
---
Giulio Benetti
Benetti Engineering sas

> 
>>
>> Kind regards
>> ---
>> Giulio Benetti
>> Benetti Engineering sas
>>
>>>
>>>>
>>>> Thanks a lot
>>>> Best regards
>>>>
>>>> [1]:
>>>> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
>>>>
>>>> ---
>>>> Giulio Benetti
>>>> Benetti Engineering sas
>>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
