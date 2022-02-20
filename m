Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B54C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 17:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D92540890;
	Sun, 20 Feb 2022 17:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THu0pkd83EQK; Sun, 20 Feb 2022 17:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D28A240880;
	Sun, 20 Feb 2022 17:56:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDA021BF20F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B99D140886
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZdKsGMITNG6 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 17:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A5E34087B
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 17:56:27 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LqRcnn5xaroAhLqRdnS5v4; Sun, 20 Feb 2022 18:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645379785; bh=P0wHTc/mTfOTZK6fxVRGINVMmOfU1RF9ECdqoqu8xVs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=cLh03xujXlgXXToAFGsGuwg0M+g5VlU2DFucX19HKiAd50dvJo8zCgVroc/Yp4GBF
 +ZrVw8J1HUQ1HuvpRkVhNQRu6Oo7kL9XTdC58/4Yl7zS+eu3wa02z3+ypTKlfmBYGl
 WZViCAks9XCvHSAWopxvi8Kqn1vYp19p5v0fI+akJLYMgnCjpWfW2ZH/elzgAxNrhC
 9qS33S52YGm+eQr8fG5ee5OO3PqVN11exfNvxXdt8YdPJ7no5rn2ibWJMzEDlJkyo5
 F0lw9l9NeKUfIkG65bFM5zu21MyjVHH318W/hSdcq1l49ukFdZVAMKz6NYsOmLc4KG
 cFPp2PHJBKc1g==
Message-ID: <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
Date: Sun, 20 Feb 2022 18:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
 <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
X-CMAE-Envelope: MS4wfD3uOZ6rAj2l7kxqo9D2TdtLTQpVLBxCUJwvQwklRxb+RB5wpkexd0WS9trpZw3OWnGXsku2h1NEu+D3ru+SD0z/2hNATTbngTc14M+flJAD6jXY7a/0
 ZChzTtwnL37Y0Kq+k43kcmYgbdufWgK8G4DmpoZU/7lkSOnhXJ3WGPPTm1XRVLeQEt+jT7uPPY4CjWR0l1qLUqbk/LSvQarsbVUPt4xCMtpE2awTEDIEioRC
 teb8hiSQPfkbkE406Fdd7rJsHfcYMzQFxTER6cKht7s=
Subject: Re: [Buildroot] Issue with login
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
Cc: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Edgar,

please reply to all in Mailing List, I add Mohd in Cc,

On 20/02/22 17:18, Edgar Bonet wrote:
> Hi!
> 
> In his config file, Mohd wrote:
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
>> BR2_LINUX_KERNEL_VERSION="4.4.155"
> 
> This may cause problems. C.f. docs/manual/configure.txt:
> 
>      If you use kernel headers that are more recent than the Linux
>      kernel you run on your embedded system, then the C library might
>      be using interfaces that are not provided by your Linux kernel.

Good catch Edgar!
So Mohd, what you need here is a toolchain with older libc.
https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain

But again, do you really need to use so such old versions instead of try 
to use buildroot's beaglebone_defconfig?

> In the same config file, there is:
>> # BR2_PACKAGE_BUSYBOX is not set
> 
> When disabling busybox, you should have seen the message:
> 
>      You may need to enable other packages to get a working system
>      You better know what you're doing!

Despite of what I've written on my previous e-mail(my test was wrong), 
he has BR2_INIT_SYSTEMD=y that works as Init System, so that's ok.

> And then:
>> # BR2_PACKAGE_SYSTEMD_LOGIND is not set

Good catch again Edgar! This ^^^ should be the point. Because it's 
exactly the systemd login dameon.

>> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set

This ^^^ is not selected by systemd, so I expect 
BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a systemd 
expoert at all).

But as Edgar pointed linux headers don't match so you have 3 choices:
1) find a toolchain with linux-headers <= 4.4.*
2) update linux version
3) start from scratch using buildroot beaglebone_defconfig

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
