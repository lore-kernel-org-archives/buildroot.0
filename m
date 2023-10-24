Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED60DC00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C2494EE16;
	Tue, 24 Oct 2023 14:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2494EE16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1t_vEAe5ql7X; Tue, 24 Oct 2023 14:52:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9172E4EE85;
	Tue, 24 Oct 2023 14:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9172E4EE85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F38E11BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE36B7039C
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE36B7039C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqRFgb_VR-Tp for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:52:16 +0000 (UTC)
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0723.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::723])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6E3D6FB91
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E3D6FB91
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sPrg7TGwXdbEn3Ku7TyR4M2M8pGNNAq37chM+p6U4mp5XEu4AVtQQXU51ZTZi21OZgv1IKgglID1nDCzcvItW15oEXvP0eLQCguixLQjYUOT49olaraZi1FU6A+wu5fG874YzSkaCfG2REv9dWffJYycMyWtTF3DziYY1NbEiCShBZXINUs8gSMm559UDCOKmeaJaUndgPAFsm/1dIBAWcKfAfoa4U8Ebsup/Fd2sXeYrdhlkK7EbsEKUo/UVCBUw7UPhvrAPvWTdrsek2+t2DLuVtRGgpJd9NEKMwFVpEKWQT7+LRhtjnel14qrpkKok3bOphmV0qDHNihNNvsuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iPQg+W5/9VRDUh9+4/C7H2N7aePh3SFioPNJSOmVdo=;
 b=BeSEP3YuRVmuFtn/y7pwyXrFTGzUxsi0aLGpVNwoWwHTYroiEKzSD6tDAyCY0LDru18Ghdmw0h9fHLsSsFnyaxuNXu9Hb+8blVoCf1Bx8kIttUeDwoZzwB4zjbwk9hl4Q9TdQIMkvOiuvBw0BmO9l8d+0IEZxbrnGrqtQVR4BlN+oZhKsoWRH8nbj/F2J1MGP4JWP+pAhY+oqK3+/qXnOi5cftxT3L/UTuIhwrz2NJQcLi37xfzFBqj8BjxT+QnpeJrr6lBpmuzZevjuA/5Ef2GeGzQLbjZZl3GrQrfWFqH4dBDWDu1j6PC98DWbj1VzA2zLSSzqFJ9vzw9RrXUrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1052.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.51; Tue, 24 Oct
 2023 14:52:13 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8c5a:5252:71ce:59b2%6]) with mapi id 15.20.6863.051; Tue, 24 Oct 2023
 14:52:13 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Marcus Hoffmann <marcus.hoffmann@othermo.de>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
Thread-Index: AQHaBGbwkOetTmJV/Ee/cQHuI7LAIrBXU3WAgAA+tACAAEK5gIABI4/QgAALhQCAAAJBwA==
Date: Tue, 24 Oct 2023 14:52:13 +0000
Message-ID: <PH1P110MB16038C63A3D4037B53F502499FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
 <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
In-Reply-To: <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1052:EE_
x-ms-office365-filtering-correlation-id: 4f7470fa-67dc-483d-5a9b-08dbd4a0cec2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Ee4cWmNC9IxrPCA6qV9XUTZjYQj30OmfCLWAbOxDRaBqyzjrdoy3iPPsU8XSwyO8CCF2zP1iovsI/D1wr6CJP6bG1WgvlcjWurAQaaBNtz3OMdUy4g6BuDqCpFUEY9BnDnsFZYykB49va3yoZf9EARd9zIfAjmDAgc20rRubHH8xb8oXlq44T4s1KsE1DXX5RjsIlPrc5i2cMp+lgL3n4A9YerE+c42JlpoVUACj1jpf7WqHbePiKmTDuplmCEFxO18UheEjdh5QnooIcAIJebv5Z3VC4nr827gy0820cpiZ7ScjRV1mSaFQuy7dZqPNpszdwN/X/1+9CtuQ16Bk7s1V3c7xnDnluLuKmzmxqGvv3UoWRlPJGdSKRZ54J5AkSLbLT9ZF4invQJVqKzML57aXoPuN6bZUyZ/evcO7VEbrOr0mv3DT8oK0CURDdsuc0L+QWmurU1mSLF/glPk+Z565L3A3gMOdAju3md1UJiHJD3TfVc1FgaWy3+8LyrdURIx8s/jG1RWT1Avrc895q5WN5rAXxR2lCp7y+41uXzI7VtuOGYLWrYdo5gkf5sfGYy+w70eiat/OKrOVVjybrqQVLGPRGEmbQgV4ZClbcGOTTX0VVr78zNJQugy/L/4yXPzhoWJvCgVZ/08B8iXtT9gGVkoGl/KtN/OZyVW+MrEJUQ3mJvg7FFcmtOHrBnm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(366004)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(55016003)(2906002)(38100700002)(54906003)(76116006)(64756008)(66946007)(53546011)(66476007)(122000001)(66446008)(71200400001)(66556008)(508600001)(110136005)(6506007)(7696005)(9686003)(83380400001)(52536014)(5660300002)(41300700001)(86362001)(4326008)(33656002)(8936002)(8676002)(26005)(38070700009)(41320700001)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: OxTk/bdzGgGhKt1XidIA6PV/d5Qp2Ae9D5cCDtk/GJnHA8l6MZ/B1jMf0/C6U9+aecmkTEtqGcI9BnZZpLhhkKolMoGJEO8VgzC6Pi3a9y9Xhjzre+XDZATR9Lp0DRLElt1zh0w27yy+uSjl81hfvNB3q1ZYwayZEpYeor0Eicakgis4Wjra3dAtRMPL0ckXCh1VlY046TTayIm0x++DZt3cHnbXNa/qZri6SRoOGXNwSkSsCHiA+tvQ1BVdbHtX0PE2wvfOPmaTxKJ7R1lE4wUqGN9kSZBmzjL/jACvAMj2lhU1+mE8ibNhGt9+3T+h+pS4jiVTMjNla+HCGMOfKqhVGlHZDVPbPY1OPy3SNkF+qpZ0u5v4gQdVlI+hZjHssNpkFE37cz4686x1yr8quxKAg9F5sqfFn8eelvvQli4=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7470fa-67dc-483d-5a9b-08dbd4a0cec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 14:52:13.1668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iPQg+W5/9VRDUh9+4/C7H2N7aePh3SFioPNJSOmVdo=;
 b=noTQ7pfHu2P1lZPeT5IYO9u+13zRV+Wy8ROUwwOgEnCa7WisEtmpQEPdnDadWvYojZqx1HLg2GHx8e/RZVJdGO4xcm4YsxVGNA7DeALRFAmZl4ePprYl9fwjD8EZu0WhezNjd5wJ+JrdakOTF03FIfkd0Ti11KwmVUdkLcnRa+DT5U8r03EMTXHQfmgnZUM4lvUgvYRVJ2C0LgOpTNVzVVzVL0Zkgq+O54Lhq+nUlXF1sdhHiF9sFWYKc/ZB+MsKc6fLJawcTs8+4mvAaUOc5VN4yL5Hb7ZHjNRAWrysjFzTshTNhXLNOSdeijgUxXk2cJxa5YlJ0LV/sXl80nmNzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=noTQ7pfH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> -----Original Message-----
> From: Carlos Alberto Lopez Perez <clopez@igalia.com>
> Sent: Tuesday, October 24, 2023 9:29 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; Yann E. MORIN
> <yann.morin.1998@free.fr>; Marcus Hoffmann
> <marcus.hoffmann@othermo.de>
> Cc: Martin Bark <martin@barkynet.com>; Julien Grossholtz
> <julien.grossholtz@openest.io>; buildroot@buildroot.org
> Subject: Re: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
> stop setting powersave as the default CPU governor
> 
> On 24/10/2023 16:01, Vincent Fazio wrote:
> > Per Phil:
> > We default to powersave to allow boards to be booted successfully when
> higher clocks speeds are causing problems, e.g. with an inadequate power
> supply.
> >
> > I have personally had issues booting CM3+ boards with ondemand
> governors with ethernet plugged in when the CPUs don't have heat sinks on
> them.
> >
> 
> I don't know why the rest of users should inherit a default that is meant to
> address a corner case (CM3 boards without heat sinks) and that slows down
> everything for them.
> 

RPis can be deployed in numerous ways, such as being seated in custom carrier boards,
so I do agree with upstream when it comes to "playing it safe" and if your situation/design
 proves out and isn't flaky, then you can opt-in to a more "aggressive" governor.

I think the problem we can all agree on here, however, and it's a point you made in your
upstream PR, is that it isn't advertised or clear that by default all RPis will be running on
the powersave governor so people don't even know they may want to change it.

> What is worse, they likely won't notice they are running with the lowest
> possible frequency.
> 
> On the other hand, if we default to the Linux default scheduler
> (schedutil) then the (minority of) users with overheat problems will notice
> something doesn't work as expected (board stops working or the kernel-log
> prints errors) so they can change the governor or put a hetsink if they
> suspect overheat issues.
> 
> >> I have argued with them that the place to do this change is not on
> >> the Linux Kernel defconfigs but on their repository for RPi-OS
> >> because other projects (like buildroot) depend on them. But they are not
> willing to change this.
> >>
> >> So I think Buildroot should undo that change in order to keep the
> >> Linux default CPU governor to the Linux's default one (schedutil)
> >>
> > Can't this be done by one of the following:
> > 1) provide your own kernel defconfig file
> > 2) fork the RPi kernel with your own changes and use that ref
> > 3) add a kconfig fragment to switch the default governor
> > 4) adjust the kernel commandline in config.txt with your chosen
> > governor
> > 5) use a startup script to change governors post boot (obviously
> > doesn't fix the "must boot fast" issue)
> >
> 
> Yes, I know how to fix this on my build.
> 
> But I'm trying to do a service to the community and change the default to a
> more sane option. I'm actually not changing the default, just resetting it to
> the default Linux mainline option (undoing the change that the RPi-OS guys
> do for their product)
> 

It may make sense to update board/raspberrypi/readme.txt to call out that the default governor
for the upstream RPi kernel is powersave and that if users want to change it how they may go about
doing so.

I, personally, see value in the cpu governor kconfig fragment to "revert" to the default linux-stable
governor if consumers want to opt-in so everyone doesn't have to reinvent that wheel.

I obviously defer to the BR maintainers about whether the rpi defconfigs should use it by default.

> The RPi-OS guys do option 5) for this, so its ok for them to default to
> powersave. But Buildroot doesn't have anything like that and I'm not going to
> work on it.
> 
> The reality nowdays is that all buildroot RPi users are actually running with
> powersave governor by default and I bet 90% of them don't know it.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
