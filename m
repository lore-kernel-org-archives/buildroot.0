Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FDBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 11:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 824FC40435;
	Tue,  8 Feb 2022 11:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ELaraETYKjg; Tue,  8 Feb 2022 11:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2762040550;
	Tue,  8 Feb 2022 11:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4AD1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BC540345
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTShWUKpqbVh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 11:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id C660240632
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 11:47:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HOxbn7SelroAhHOxbnYGuc; Tue, 08 Feb 2022 12:47:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644320824; bh=Qbqg2vXjJ6XNp7hQYA4NamnVCsoiR1BL+Rvzgso7Ra8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=bZc7k0X5eVqm2VwCnLrDNGQy3pL9cI9oHbM8b8tKGM20nLIlU+QC95/NxVMS3Xa/M
 jqWU0fTwE6QX7acVWBLqQtk7pi3R+arWQg1a6FT1wYnpOB8T7neEeuWRC95Pmn6fPH
 dYCOJociXsdebABYgj3Iwoo+g7kNZ+gDhn641B9MwUJ1GU9qnHTmmyXn2c+qEkibKL
 x14cc/5V+Qx6mkVA7QSkej3ESlc18H0KZ7Fyox/H+25XutIer5vHQlN4cZUu3STj5k
 1OUl98o8VOJUj2WN3VHkq7FoiGt69Dm+gpU290UZB/ImYvP38RO6/2WZ8Kb/X6P0HF
 w9TjePSRqiiLA==
Message-ID: <ec93ac94-a7ae-3448-800b-88de7615e675@benettiengineering.com>
Date: Tue, 8 Feb 2022 12:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220206084334.1900252-1-paguilar@paguilar.org>
 <20220206103040.1704ef40@windsurf>
 <784201902.75253.1644311953307@email.ionos.it>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <784201902.75253.1644311953307@email.ionos.it>
X-CMAE-Envelope: MS4wfHfUZ+jCl0U2RKfkglfNbWvQ00YkLrR1GsQkzJU8sstBz9zmDPQJ/WOvDB2k87l6DrchuI5MD1h4U/HFXmO4RJuEV7r02ZwkeBxgOiIo90uLwF7mc5lK
 qJEj1iaEz8utuzTgS02bfsPnvQ+fDrnZGtMsCFPjmZSQxgod1Acakq1mdMjZP2LYXZqiQiNS2LNw8w/g3HLyzZC69oMktRe847RmGiUvnitJ5mXCNchbrhSZ
 JzZOaHNuZYoP3WnWJt59+z2Jcps4kgxH3Sq9RjEwWHtfTFEgDjoal41Fo8avmuG+
Subject: Re: [Buildroot] [PATCH v1 1/1] package/guile: Guile 3.0.7 requires
 libiconv.
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Pedro, Thomas,

please don't top-post, answer in-line.

On 08/02/22 10:19, Pedro Aguilar wrote:
> Hi Thomas,
> 
> I added libiconv based on the error I got while building. The attchmnt has the output error and the config file I used.

Please send your changes as patches, or otherwise paste here the last 
lines of logs or in the case log is very long use pastebin and point the 
URL here. So please don't attach anything.

> However, I was not aware of BR2_ENABLE_LOCALE, so I selected it and removed libiconv and it also built correctly. The other config file shows this configuration.
> 
> May be a correct solution could be to add the dependency on BR2_ENABLE_LOCALE. But if it's not present, enable libiconv.

I think this is a good example of what you're trying to do:
https://git.buildroot.net/buildroot/tree/package/libcdio/Config.in#n4

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Thanks.
> 
> Regards,
> 
>> On 06/02/2022 10:30 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>>   
>> On Sun,  6 Feb 2022 09:43:34 +0100
>> Pedro Aguilar <paguilar@paguilar.org> wrote:
>>
>>> This fixes the error reported in the daily results.
>>>
>>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>>
>> libiconv is normally needed only on toolchains that don't have
>> BR2_ENABLE_LOCALE. But the build failure of guile happens with glibc
>> toolchains, so it doesn't make much sense.
>>
>> Are you sure that your analysis of the problem is correct? Could you
>> provide some more details?
>>
>> Thanks a lot!
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> 
> Pedro Aguilar
> https://paguilar.org
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
