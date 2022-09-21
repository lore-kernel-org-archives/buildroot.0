Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C647ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 09:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB996101B;
	Wed, 21 Sep 2022 09:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB996101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIRQpbhoxTV8; Wed, 21 Sep 2022 09:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC5F6100C;
	Wed, 21 Sep 2022 09:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC5F6100C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6C01BF5DD
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FEF24187E
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FEF24187E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNb-c1SW7KX3 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 09:25:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F46403B8
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37F46403B8
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 09:25:35 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-186-F741UVcPPxCp6z0QDL8gtg-1; Wed, 21 Sep 2022 10:24:21 +0100
X-MC-Unique: F741UVcPPxCp6z0QDL8gtg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 21 Sep
 2022 10:24:19 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Wed, 21 Sep 2022 10:24:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Petazzoni' <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
Thread-Index: AQHYzTEkeyC04pHYkEeFBAyDpmMKza3piujA///8ZgCAABQDUA==
Date: Wed, 21 Sep 2022 09:24:19 +0000
Message-ID: <c402c15ae7c14279b16136690c6e349e@AcuMS.aculab.com>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
 <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
 <20220921110500.5128d0b9@windsurf>
In-Reply-To: <20220921110500.5128d0b9@windsurf>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni
> Sent: 21 September 2022 10:05
> 
> On Wed, 21 Sep 2022 08:23:54 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
> 
> > Think a bit further and you can remove the exec of cmp, eg:
> >
> > $ time find /usr/lib -type f | (ELF="$(printf '\x7f\x45\x4c\x46')"; while read f; do read l <"$f" &&
> [ "${l#$ELF}" != "$l" ] && echo $f; done )| wc -l
> 
> Thanks for the input and proposal. Isn't read l <"$f" going to read
> each file entirely in memory?

Probably until the first '\n' - which might be quite a lot!
But usually the fork+exec is what kills shell script performance.
(Avoiding cmp/expr on a SYSV shell took lateral thought.)

> > That takes a few seconds on my system.
> 
> On my system, your command took 19 seconds. When doing this kind of
> test, make sure to drop the contents of the page cache first by doing:
> 
> echo 3 > /proc/sys/vm/drop_caches
> 
> Before each experiment. On my machine, with the page cache contents
> dropped, it takes 19-20 seconds to run your command the first time.
> Subsequent runs only last 12 seconds.

I suspect that slows down the find as well.
The file reads may be small compared to the directory traversal.

In any case the 'read -N 4' will stop the shell reading more than one page.
Which should get the whole thing about as fast as it is ever going to be.
(Although bash isn't exactly the most spritely shell.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
