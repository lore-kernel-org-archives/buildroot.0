Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F1AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B10C6159A
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B10C6159A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F077B60E66;
	Wed, 29 Sep 2021 16:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BE9NeNMwPSJ5; Wed, 29 Sep 2021 16:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D3F560D94;
	Wed, 29 Sep 2021 16:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 997421BF989
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B1B40370
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xn3EUkW-4TTp for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 16:15:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62939400E7
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 16:15:39 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-198-luWJt3dkP1Kja5IdymotgA-1; Wed, 29 Sep 2021 17:14:21 +0100
X-MC-Unique: luWJt3dkP1Kja5IdymotgA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Wed, 29 Sep 2021 17:14:20 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Wed, 29 Sep 2021 17:14:20 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicolas Cavallari' <nicolas.cavallari@green-communications.fr>, "Markus
 Mayer" <mmayer@broadcom.com>, Arnout Vandecappelle <arnout@mind.be>, "Petr
 Vorel" <petr.vorel@gmail.com>
Thread-Topic: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
Thread-Index: AQHXtQuPceTzKlSKokSFPbfufhY0K6u7LvfQ
Date: Wed, 29 Sep 2021 16:14:20 +0000
Message-ID: <515fab0378614d93821aed6a95cbd16e@AcuMS.aculab.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a3acad98-edb0-1ac7-8d84-a3937a405646@green-communications.fr>
In-Reply-To: <a3acad98-edb0-1ac7-8d84-a3937a405646@green-communications.fr>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

...
> Meanwhile, 'which' is not standard, and right now, it misbehaves on
> Debian by filling the screen with warnings.

'which' is a shell script that is trying to emulate a csh builtin.
I've NFI why people keep using it :-)

The equivalent bourne shell command is 'type'.

As for 'command -v' no idea what the POSIX committee had
for lunch that day :-)
It was probably they same day they added 'fc' (from ksh??)

	David


	

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
