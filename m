Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C43C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC6340330;
	Sun, 13 Feb 2022 22:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK_do0XLkblh; Sun, 13 Feb 2022 22:25:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2D440325;
	Sun, 13 Feb 2022 22:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9211BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82EE040325
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 343Iv-ZNnF2f for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:24:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id C62DA40323
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:24:55 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNIani3AdXmFAJNIbnv0QN; Sun, 13 Feb 2022 23:24:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644791093; bh=Qpam2eIsHoerDpwnUo67tPORpUj7uhDPv7cNxGl5i04=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JPMQQ+c5yH3EI/sBXb8w5uZxt4iPWEw5NSDIhJ6fDywfvYQAvicNcsOfJw5CubC8m
 hwmLoOWT9l48i5f74pENx1L6zMMS0YR2b9520TUegNPOPPh50pnuibI80LmaCqYuwj
 r34ljWF8IJQUmRgsLaMHnGFB/QF+4+evFJL6nmhzaCEI0irFOGjtMnOuvCMWtmRteF
 WovLCuNxtm3UEGNMPWi4hlgFs3tUN5xm9ov4NajKZe+/jFivBjNa3ASxjnUQE5UERF
 5tyssia+eJagO9h+fiOyIPJ6YssMly8niKJjvKR3CNMs3lSzIv7evKD0WSS6DK8che
 0nVkgVP+wGjXg==
Message-ID: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
Date: Sun, 13 Feb 2022 23:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
 <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
 <20220206213657.GA457876@scaer> <20220207085517.5c13c097@windsurf>
 <20220207173751.GA2249818@scaer>
 <ad5fd860-5dca-f04c-3f1d-e64842c0b8f4@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <ad5fd860-5dca-f04c-3f1d-e64842c0b8f4@mind.be>
X-CMAE-Envelope: MS4wfNaZX8fqtSlXyfIOLn5MbrL8YOXUUs97GS9TBIMW6xPrSneMYQ0PGdVRvu2svVNg25pU3NCOtZ8pjB74+UsmQXha5VHO49QXvELNGIu2x45G23PRtksB
 GRw3rmpyO23DRNnTS+pDwjWniy6YdDbEejV6ks86Ge9smWu/V3iawVSuXMIBPYgZk96qrLgqN3ci/42UG8PJ6zYw85vkM5GPbpscCshFlph8GFssALEHk56B
 Ycnw4Xi6fvZ0iEPV+hBqTgxFxrs43L1lXZ8kb5Jpe8WlFzue8EwGRR1vw0H7UbLpRSg+9pREM1kDL0yDW1BezuITV9nohmpWZ9rNymYkiX23F8vpyRFZAVF/
 Ej8tzjHQ7Yz07uWS5ee3KAHMEHiucylpb2gjh/fFRdbiC8JTI3DJzwHHSOfNyl7qgSTuJ6IRDFY+Pt9mNkjf8S3Pz1OjHV1wxl84FfUzu0lsxZjxJB5B5CZv
 TidqtDrHSdZoVwcRB/tdtoe9p+5xD91hgxudTn4fuKydzxb4SCeee1UFXq8=
Subject: Re: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Yann, Thomas, All,

On 13/02/22 16:06, Arnout Vandecappelle wrote:
> 
> 
> On 07/02/2022 18:37, Yann E. MORIN wrote:
>> Thomas, All,
>>
>> On 2022-02-07 08:55 +0100, Thomas Petazzoni spake thusly:
>>> On Sun, 6 Feb 2022 22:36:57 +0100
>>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>>>>    	partition root {
>>>>> -		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
>>>>> +		partition-type-uuid = L
>>>> As we discussed on IRC, this is not the same thing. genimage will extend
>>>> the 'L' shorthand to the full UUID 0fc63daf-8483-4772-8e79-3d69d8477de4,
>>>> which is different.
>>> And? Is that really important?
>>>> So I don't think uaing the shorthands are correct.
>>> Why?
>>
>> I think that it is important that we do adhere to the expected values;
>> see below...
>>
>>>> The UUID assignments are available on Wikipedia:
>>>>       https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
>>>> But the systemd docuemntation has extra UUID definitions:
>>>>       https://man.archlinux.org/man/systemd-gpt-auto-generator.8
>>> Yes, but how useful are they?
>>
>> Why would we diverge from the specs?
>>
>>> Unless these systemd-defined UUID are really relevant, I would prefer
>>> that we use the shortcuts provided by genimage wherever possible, and
>>> only rely on using the full UUID for special cases, such as the
>>> board/sifive/hifive-unleashed/genimage_sdcard.cfg (PATCH 15/16).
>>
>> There are tools that expect those values, to autodetect partitions. This
>> is the case, of course, of systemd-gpt-auto-generator, which will lookup
>> the partition UUIDs, but other tools may expect these UUIDs too.
> 
>    At least for systemd-gpt-auto-generator, the UUID for rootfs is only relevant
> in case systemd is the one mounting the rootfs, i.e. in case of it running from
> initramfs and pivoting into a mounted root.
> 
>    That is not a scenario that we support in Buildroot, by a long shot.
> Therefore, my suggestion would be to use the default Linux partition type for
> the rootfs, i.e. L. Since this is actually the default for genimage, I would
> even leave it out completely.
> 
>    Giulio, that would mean rewriting this series and removing everywhere L is
> specified. Do you agree with that?

I'm going to rework and remove L, less code we have the better IMHO.
Also, this gives less ambiguity on letters, because we're going to end 
up only having:
F => Fat
U => Efi(that recalls UEFI(to me at least) even if it's not the same 
thing as EFI)

> 
>> I am not saying that we would cause trouble by changing our board
>> descriptions, but if we want to allow people to just copy them as the
>> base for their own development, then diverging from expected behaviour
>> is not nice.
> 
>    I think the cases where a non-standard (where "standard" means the actual GPT
> standard, not the additional stuff that systemd invented) partition type is
> relevant are going to be so unusual that the default we put in our genimage.cfg
> is going to be of no relevance whatsoever.

Yes, I agree too. At least for the moment I would use the genimage 
letters and if needed we can modify it later.

Thank you all!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> 
> 
>>
>>> This way, it would be pretty clear that we have the "common cases" (boot
>>> partition, rootfs partition) and the "odd/special cases".
>>
>> I think the "common case" would be "adhere to spec, use specified
>> values", while the exceptions are "the spec says nothing, use something
>> else and comment it".
>>
>> Regards,
>> Yann E. MORIN.
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
