Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C15EECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 08:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3B38198A;
	Wed, 21 Sep 2022 08:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3B38198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsmPX2VzxKlC; Wed, 21 Sep 2022 08:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 653948194A;
	Wed, 21 Sep 2022 08:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653948194A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F26411BF3AE
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB6F8818EC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 08:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6F8818EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKk0d7S3f_Li for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 08:24:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1794818E8
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1794818E8
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 08:23:59 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-167-omfnA2uzPJ6uu8PSJLcVqg-1; Wed, 21 Sep 2022 09:23:56 +0100
X-MC-Unique: omfnA2uzPJ6uu8PSJLcVqg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 21 Sep
 2022 09:23:54 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Wed, 21 Sep 2022 09:23:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnout Vandecappelle' <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>
Thread-Topic: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
Thread-Index: AQHYzTEkeyC04pHYkEeFBAyDpmMKza3piujA
Date: Wed, 21 Sep 2022 08:23:54 +0000
Message-ID: <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
In-Reply-To: <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Arnout Vandecappelle
> Sent: 20 September 2022 20:49
...
> date +%s
> find host/*bin host/lib* -type f |while read f; do
>          if printf '\x7f\x45\x4c\x46' | cmp -s -n 4 - ${f}; then
>              printf '%s\n' "${f}"
>          fi
> done | wc -l
> date +%s
> 
> 1663702312
> 111
> 1663702338

Think a bit further and you can remove the exec of cmp, eg:

$ time find /usr/lib -type f | (ELF="$(printf '\x7f\x45\x4c\x46')"; while read f; do read l <"$f" && [ "${l#$ELF}" != "$l" ] && echo $f; done )| wc -l

That takes a few seconds on my system.
I gave up waiting for the one that runs 'cmp' to finish.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
