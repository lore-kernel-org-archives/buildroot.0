Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E2AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2EA140BB6;
	Tue, 29 Mar 2022 19:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cd9WzYKf5eyY; Tue, 29 Mar 2022 19:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D81D4019C;
	Tue, 29 Mar 2022 19:20:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E704F1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA95D8432C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0Ewtz_wD_l6 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::614])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF9168432A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxNJY76mA6hf3yj3xEr+gtJU7juadiqru18uvXeVcTrt094tGhZB5Ab8rF5DsWvEzMZKfWJLeHbxKxzWVAXIAMzvhS+TXESVL3J9TV+GFMC3blJz4VFF53yYe9tpqFTKgCanHZfzwOmDMp/zP95/OyW43UugThGla8pJ5MjHCBgm/2W4cVC6JX2x+fcRTQQdvOx3YaiMGjB/fIb0vAjnXNJFEY4EkfWVkT0ePogEmL+qO+ZxABtxpVZSNWdalO26CmTUu8ldCLsmGK1UJlvYqCA73AHSPnVTEDyP3AQDrN/iApoigxa04ztc1y83B7/Ui5UMUBe27boT2zHHt8bJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOZzl63OkrIazBE4jSSXrFlGOGG1oa6VONVPR5B/kPk=;
 b=TNbii77KXnfKmwRBipC3k79Gw7PHQOOW8CyMdkWMlpLH3xGbU0AVr/BfTVM1BpwLVi2Duj04Ahse5EcGaiiklg2dyClQZUUZe4kbJxd5+qU/VSC6LM1OzSYvmN3FPKazrfheLvUGGHPGBcVnEp7wlA56oybz4O/84J975Mj2rJ4ShOzvYKUKND31Ph/r/cZMkK8uQ+NUv2HWojeKmbQ7VwBTYbOi00wSU/0mkY9E9O7oupev7r6DvDWQVqSVF8z3Fy7H9oJxz1RaCt95JMDXlBi7nbHJ7YhSFawJRGvNq3p2tbeANydn3v7vWsK+LhH7lJpv0PeYqLGDPH4HzhX1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOZzl63OkrIazBE4jSSXrFlGOGG1oa6VONVPR5B/kPk=;
 b=sDe+BwGoyDT03wVZp8ilM7+4P/X6A8cVmRFftCWCpHMgg3mpUdcR9JL9mvchaXn5ZsIFtsm7hkJCTuqzZnLQZ36RUW96+2Rvku5y9ozIWxpxeURcl+CIC0r65KwPNsdOEWKiXgekqbJ0amaqIrs90aJBBYzxVjUV1Nvipx9U1XY=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by VI1PR02MB4336.eurprd02.prod.outlook.com (2603:10a6:803:81::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Tue, 29 Mar
 2022 19:19:52 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 19:19:52 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Andreas Ziegler <br015@umbiko.net>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AQHYQ1EGpCcDGFOvN0u2NbHmcspfi6zWS9xggAAspgCAAAxesIAAH+8AgAAVopA=
Date: Tue, 29 Mar 2022 19:19:52 +0000
Message-ID: <AM6PR02MB4884A6522909A9322C4C9E2EDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
 <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <54f87d03a99935fb452424992a81409c@umbiko.net>
In-Reply-To: <54f87d03a99935fb452424992a81409c@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e94702b-e776-4676-1cd3-08da11b919a1
x-ms-traffictypediagnostic: VI1PR02MB4336:EE_
x-microsoft-antispam-prvs: <VI1PR02MB4336DB1891FCB86C3ECC45F6DA1E9@VI1PR02MB4336.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jGBldzRFjs+O2SiQ18iu/Q1oAjmFUi8y1qCQLMDYrwouDOmwW4EREjXICLJ100gbZs+LeQ/kDaVc0eMx6CQ3uWGIJ7rMZ5KM3n/6jTGNsyGsQGd/eKayK6yfAg9kDAYieHxllvlGm3wm12HbMC1zHU8A2NHzf/mTIxoc5ZTlNGU2/F6InFzz8ig4YawDJYvIFJbuBez49CQfqLZacWk1tfN5Rm5EgMJzQECkOVQJiaS4NIIeK84uiQfW3Vc6EJPsu6rb9zH7hhdLD2niIJVldGA7xtUOLtHpAovFAOG2t6jKtKpBaYfbQLIJdzoFmlhhea75g+wVbkyYvuZSJuuBsKa1+qNzq6dxBPerlAZyJlJw/0bQZOtn4pmjtmKFrVB8JtM4Pli9JYOGSWXo6F969a8D0e38D6zMI/gjPpfEvV44KREDWMfzoQEF6KFtU7uz9tLr6+69hxkJP6AyaXTgYPt20JLTGzhWDW8CG0fe+OEJjl7ki07+nwg87WfuKHpZRKpqAVEVLpDIGzC9XWo6rHdIlnmgKitJRQX94torSIgqdyrC1yQSrGkZ4/mZkwLI8qWarI2/J7Y5wmXJgSXAiVIfnrHIeZdeQcLAeQnMpoVxw3SyNtLKOfxeYCXOAVggA65oeAF7n+95E99wgFuuuc6I18JK3KKyhZ7iGx6mQT9WltSgxDM9HrkNB9vN+z4kS03Ykl4h4xu75zBTKctr65HlXIGNwIHT+IjYlBknelNkqVQTrPLw1OjbyGw5wFgaVJqN7CEF6LSejpBB5SFAlECbiuyYrDlq8Hu3Ob3W1Ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(346002)(39830400003)(136003)(366004)(376002)(508600001)(8676002)(4326008)(99936003)(64756008)(55016003)(966005)(66946007)(2906002)(83380400001)(33656002)(66556008)(66476007)(71200400001)(66446008)(76116006)(8936002)(30864003)(7696005)(5660300002)(38070700005)(86362001)(9686003)(52536014)(6506007)(186003)(66574015)(26005)(122000001)(38100700002)(53546011)(316002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zA8H6tzOy1nh1q4GG/cnqYvWZP5ITK5uRU47mTkY4xjlPcBWc0/nLfmrQPcJ?=
 =?us-ascii?Q?C1kIWikpz1OkjXzP54k7U7KhJDx23KWlbYRkb60w7rahnDx91fGpoGBhd25t?=
 =?us-ascii?Q?3U30uO3ojm06SKCJ9umRwW8RH4PnptWn7QLu2SG3SPpG3/TL9V+yvi0D6oPP?=
 =?us-ascii?Q?rY0h+2mMTqpYN/YqUKnivyL4tAeAZHmGV2IL6BGMcRMzN0axBNIkJ1vnyTdb?=
 =?us-ascii?Q?ksa/vJMH2OuCb/ZZXGjXvXvcdkb0p3+hrrErSRoFAorBUjz+x98cZe4Gqs79?=
 =?us-ascii?Q?PuZDMZsRm6pq72LIGEkgIo+buzufUyjZkcvKjRQv11t1/tNjfmL5oy0IRkZc?=
 =?us-ascii?Q?1zhdUJ9jguQGta2uX9VHs6wm7TkSjdc2nO4ofWpfObAZlwlX5bQrlFLJEybl?=
 =?us-ascii?Q?1CMRcyxxvq/My5+IGFuDZA38MB3L/9qXtLJMsEaoTArb6tZF4bgUIqDDVQau?=
 =?us-ascii?Q?5oOwewOQa9zgTlpQPcDb4CUSEOr0qS0ILUA2xhzHUkV0PEnu6TS1hlfTUTEy?=
 =?us-ascii?Q?tZHCF0TZyjnTIJrlkLdSeXAleEPd98V4+3H4NR/yrYCqN/VQVWH8DliM8idl?=
 =?us-ascii?Q?l+qwlWMV8Z7UhN6xstW+nHyU9aXJ8rW9fDjLP3cj8gCQNNuEoiPGCaVa6N8I?=
 =?us-ascii?Q?y8U6Kqra4CA4FfWmGZdRH11ts+RWJFPmRhLpjZBS2XcjdX8ynhMOAvglqh0r?=
 =?us-ascii?Q?HVYig/T/1FJutGfClRbRq/RYME2JyJrENtBb/ABYqUP6PqWOSZkF5Q5jD/HS?=
 =?us-ascii?Q?NX6FWSB1oCMUj9lTE0E4ougKWUCoTyJncVXrdy4wEZix/mr09NY8P2xMyIBM?=
 =?us-ascii?Q?xdCfILh3I1fP06ANEADGiXTOp/iHUV8fiW8aemGFj5Y3ACt7ertHdNqQdcan?=
 =?us-ascii?Q?oaqtifOH4tXowx1g6WXO8M5Egy+183t/edOVtNnqjHHobbO3L24nsyAVZ0QH?=
 =?us-ascii?Q?wSQjR6lCDOBIYNnXVSm97ZvODcjeDjSD+BCB4I9SbzQjSlswJXW6u4BvAXs7?=
 =?us-ascii?Q?PiET7Smp88KRViyR1s2an3q/bpP0ljglO95ZET/AGvtTjkPbh9ziawBShiLP?=
 =?us-ascii?Q?aTTulqMAnBFBKEVz7t7iNNvJNB3tB89i0bFmEzoSxAwPv4qhjl2I/b84XLyF?=
 =?us-ascii?Q?l+ue3XSTIdIdJWraIo6vUXVRUIxnHkING55ibPrAolHAe61oClj7SKLbPYfj?=
 =?us-ascii?Q?YSP+h9jDrg3UZwEaflkGlkwcgMXZp7pRuVXOExREle/ieNzibZkpAUdAFffl?=
 =?us-ascii?Q?CFzKqOFuQahlviQ74+KlGapBZVoM8CB9ajBo0t5qeaOlv9S+vppTqV/w095E?=
 =?us-ascii?Q?scpsweD/PLGZ/luk+zRbDGvItn4QjnHn7nfLX2/xQMFFFxMqNpCye3ZcS+pG?=
 =?us-ascii?Q?rkf8z2PeOUNXk03+TEYWBiU34jErWdCVzFEfHU+St2GCa4B2zSmbN8kMl/rx?=
 =?us-ascii?Q?iYfr+xjGPHKcxx2PhYiAbWOTBvaWrvJXUdGwHESySeizWBxF7/oS6KdG2/2/?=
 =?us-ascii?Q?pk/ln2x6+X8T9KRfjbQ6OXGg2vihAELucx7Z02QlFg+efQHPlgtgD6U5O7kw?=
 =?us-ascii?Q?4Hbp0Vn5wQmixnYMs/XBkPTXLTbCvTbALYja8S+6miyyP0dRr9SMm4nDHt7Y?=
 =?us-ascii?Q?fe9unnpevfG7UUsf6bVrQcJgrVldK9Y8evJO6cEGS0c+1i/GP7Fv2ujLHmKA?=
 =?us-ascii?Q?rNmaAAxn/4mJOnUVwi1nuqADFWUMX+Nqs/I+obtEwumRKW7chIIB4gJvCG40?=
 =?us-ascii?Q?TEbhY4N6wA=3D=3D?=
Content-Type: multipart/mixed;
 boundary="_002_AM6PR02MB4884A6522909A9322C4C9E2EDA1E9AM6PR02MB4884eurp_"
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e94702b-e776-4676-1cd3-08da11b919a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 19:19:52.2332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7XuviXk/bzceIof3gI4PN4vKJOemkd0I0KWn31Y5aGBR/qU6vrhZGrcUqfkpLx+V4sx/5Iz9Nk06ASNv9ok2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB4336
Subject: Re: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_AM6PR02MB4884A6522909A9322C4C9E2EDA1E9AM6PR02MB4884eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Andreas Ziegler <br015@umbiko.net>
> Sent: 29 March 2022 18:52
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: buildroot@buildroot.org
> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel -
> possible?
>=20
> On 2022-03-29 16:17, Dan Jackson wrote:
> >> -----Original Message-----
> >> From: Andreas Ziegler <br015@umbiko.net>
> >> Sent: 29 March 2022 16:14
> >> To: Dan Jackson <dan@thejacksons.uk>
> >> Cc: buildroot@buildroot.org
> >> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel
> >> -
> >> possible?
> >>
> >> Hi Dan,
> >>
> >> On 2022-03-29 12:48, Dan Jackson wrote:
> >> >> -----Original Message-----
> >> >> From: Andreas Ziegler <br015@umbiko.net>
> >> >> Sent: 29 March 2022 10:40
> >> >> To: Dan Jackson <dan@thejacksons.uk>
> >> >> Cc: Buildroot <buildroot@buildroot.org>
> >> >> Subject: Re: Adding USB support to existing device on 2.6.39.3
> >> >> kernel
> >> >> -
> >> >> possible?
> >> >>
> >> >> Hi Dan,
> >> >>
> >> >> On 2022-03-29 05:58, Dan Jackson <dan@thejacksons.uk> wrote:
> >> >>
> >> >> > Hello,
> >> >> >
> >> >> > Sorry once again if this is a silly/noob question.
> >> >> >
> >> >> > If I have an existing router device running a 2.6.39.3 kernel,
> >> >> > which has a USB port and is capable of supporting USB devices,
> >> >> > but the manufacturer has removed/not installed the necessary
> >> >> > kernel modules, can I use Buildroot to recreate the missing
> >> >> > modules and thus re-enable the missing USB support?
> >> >>
> >> >> It might work: the driver is contained in the USB module, so
> >> >> building and loading that module could do the trick.
> >> >>
> >> >> > If so, how would I do it?
> >> >>
> >> >> Supposing the Linux kernel source contained in [1] is the one that
> >> >> is running on your device, you need to configure Buildroot to
> >> >> build a Linux kernel (BR2_LINUX_KERNEL). The manual [2] has some
> >> >> information about how to do this for a Kernel source tree (see chap=
ter
> 8.14.6).
> >> >
> >> > It looks like I got that part to work. The buildroot build process
> >> > definitely seems to be able to see the kernel source tree which is
> >> > in /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-
> 2.6.39.3/src.
> >> >
> >> >>
> >> >> You then need to enable USB support in the kernel (Device Drivers
> >> >> -> USB support), probably
> >> >>
> >> >>    CONFIG_USB=3Dm
> >> >>    CONFIG_USB_EHCI_HCD=3Dy
> >> >>    CONFIG_USB_OHCI_HCD=3Dy
> >> >>
> >> >> is enough, otherwise try some of the hardware specific (driver)
> >> >> options.
> >> >
> >> > This is where I have fallen down. I did "make linux-menuconfig"
> >> > expecting to be able to configure the kernel/modules (as I couldn't
> >> > see any options for that in buildroot's own "make menuconfig").
> >> >
> >> > However, at this point it seems like it went off and tried to build
> >> > the whole kernel from a default configuration.
> >>
> >> 'make linux-menuconfig' needs a working build system. If they are not
> >> present, all dependencies of the Linux package get built. First step
> >> is the installation of the kernel source; if Buildroot tries to
> >> install a default kernel, something is amiss with your configuration.
> >>
> >> > This eventually failed, so I tried "make linux-reconfigure" at that
> >> > point but that did not work either.
> >> >
> >> > Here is the error it gave upon failure:
> >> >
> >> > /home/danj/buildroot-2022.02/output/host/lib/gcc/armeb-buildroot-
> >> linux-uclibcgnueabi/11.2.0/../../../../armeb-buildroot-linux-
> >> uclibcgnueabi/bin/ld:
> >> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-
> buildroo
> >> > t-
> >> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
> >> > error loading plugin:
> >> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-
> buildroo
> >> > t-
> >> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
> >> > undefined symbol: _onload
> >> > collect2: error: ld returned 1 exit status
> >> > Makefile.in:114: recipe for target '../utils/getconf' failed
> >> > make[3]: *** [../utils/getconf] Error 1
> >> > Makefile.in:455: recipe for target 'utils' failed
> >> > make[2]: *** [utils] Error 2
> >> > package/pkg-generic.mk:380: recipe for target
> >> > '/home/danj/buildroot-2022.02/output/build/uclibc-
> >> 1.0.40/.stamp_target_installed'
> >> > failed
> >> > make[1]: ***
> >> > [/home/danj/buildroot-2022.02/output/build/uclibc-1.0.40/.stamp_tar
> >> > get
> >> > _installed]
> >> > Error 2
> >> > Makefile:84: recipe for target '_all' failed
> >> > make: *** [_all] Error 2
> >>
> >> This error is from the uClibc build - do you use an internal or
> >> external toolchain? Maybe you have conflicting static /dynamic
> >> library options?
> >> Again, probably a buildroot misconfiguration ...
> >
> > This turned out to be that I had some wrong environment variables set
> > from a previous attempt. Logged out and back in and now I am past that
> > error.
> >
> >>
> >> Maybe you could post your buildroot configuration (the result of make
> >> savedefconfig)?
> >
> > It's quite short as it turns out:
> >
> > BR2_armeb=3Dy
> > BR2_STATIC_LIBS=3Dy
> > BR2_KERNEL_HEADERS_VERSION=3Dy
> > BR2_DEFAULT_KERNEL_VERSION=3D"2.6.39.3"
> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=3Dy
> > BR2_TOOLCHAIN_BUILDROOT_LOCALE=3Dy
> > BR2_PTHREAD_DEBUG=3Dy
> > BR2_BINUTILS_VERSION_2_37_X=3Dy
> > BR2_GCC_VERSION_9_X=3Dy
> > BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
> > BR2_PACKAGE_HOST_GDB=3Dy
> > BR2_GDB_VERSION_9_2=3Dy
> > BR2_LINUX_KERNEL=3Dy
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"2.6.39.3"
> > BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> > BR2_PACKAGE_DROPBEAR=3Dy
> >
> BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=3D"/home/danj/localoptions
> .h"
> > BR2_PACKAGE_JOE=3Dy
>=20
> The configuration uses a kernel downloaded from kernel.org, not the vendo=
r
> kernel. You need to configure Buildroot to use a custom source directory.
>=20
> > I can see I have got a USE_ARCH_DEFAULT_CONFIG in there which I'm
> > guessing is part of my problems?
>=20
> You need to configure Buildroot to use your existing .config with
> BR2_LINUX_CUSTOM_KERNEL_CONFIG_FILE.
>=20
> >>
> >> > Looking at this error message, maybe I need to select an older
> >> > version of gcc, in my buildroot configuration? Is it that the
> >> > kernel can only be compiled by gcc versions that existed at the time=
?
> >>
> >> Older kernels used to have a include/compiler.h which had predefined
> >> includes for specific compiler versions. Use the oldest compiler
> >> available in Buildroot and try to either get a compiler-gcc9.h from a
> >> newer kernel or make your own. I believe this schema changed
> >> somewhere between 3.x and 4.x For newer compilers, this file is
> >> comparatively empty.
> >
> > GCC 9.x is the oldest option available in current buildroot so I have
> > switched to that.
> >
> > I found a compiler-gcc5.h in kernel 4.1, newer kernels do not have any
> > numbered files of this type at all. I downloaded this one and
> > symlinked it as compiler-gcc9.h and it looks like this got me past
> > this error.
> >
> > However, now I have a new missing file error, and I can't seem to
> > locate a suitable candidate:
> >
> > In file included from
> > /home/danj/buildroot-2022.02/output/build/linux-
> custom/arch/arm/include/asm/system.h:165,
> >                  from
> > /home/danj/buildroot-2022.02/output/build/linux-
> custom/arch/arm/include/asm/bitops.h:27,
> >                  from include/linux/bitops.h:22,
> >                  from include/linux/kernel.h:17,
> >                  from include/linux/sched.h:55,
> >                  from arch/arm/kernel/asm-offsets.c:13:
> > /home/danj/buildroot-2022.02/output/build/linux-
> custom/arch/arm/include/asm/memory.h:19:10:
> > fatal error: mach/memory.h: No such file or directory
> >    19 | #include <mach/memory.h>
> >       |          ^~~~~~~~~~~~~~~
> > compilation terminated.
> > /home/danj/buildroot-2022.02/output/build/linux-custom/./Kbuild:81:
> > recipe for target 'arch/arm/kernel/asm-offsets.s' failed
> > make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> > Makefile:1009: recipe for target 'prepare0' failed
> > make[2]: *** [prepare0] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> >   HOSTCC  scripts/mod/modpost.o
> >   HOSTCC  scripts/mod/sumversion.o
> >   HOSTLD  scripts/mod/modpost
> > make[2]: *** wait: No child processes. Stop.
> > package/pkg-generic.mk:289: recipe for target
> > '/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built'
> > failed
> > make[1]: ***
> > [/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built]
> > Error 2
> > Makefile:84: recipe for target '_all' failed
> > make: *** [_all] Error 2
>=20
> This seems not to be the defconfig from above? It now uses linux-custom .=
..
> The failure may be due to the default kernel configuration. Try to config=
ure
> the correct one and see if you get further.
>=20
> > I think maybe I am still doing something wrong because it sure seems
> > to be compiling a lot of stuff instead of letting me configure things.
>=20
> It gets better once everything necessary is built.

Still no luck I'm afraid. Same error with mach/memory.h as above.

Buildroot defconfig now looks like this:

BR2_armeb=3Dy
BR2_STATIC_LIBS=3Dy
BR2_KERNEL_HEADERS_VERSION=3Dy
BR2_DEFAULT_KERNEL_VERSION=3D"2.6.39.3"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=3Dy
BR2_TOOLCHAIN_BUILDROOT_LOCALE=3Dy
BR2_PTHREAD_DEBUG=3Dy
BR2_BINUTILS_VERSION_2_37_X=3Dy
BR2_GCC_VERSION_9_X=3Dy
BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
BR2_PACKAGE_HOST_GDB=3Dy
BR2_GDB_VERSION_9_2=3Dy
BR2_LINUX_KERNEL=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"2.6.39.3"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"/home/danj/DG3270_9.1.103FB/sourceco=
de/ti_linux/linux-2.6.39.3/src/.config"
BR2_PACKAGE_DROPBEAR=3Dy
BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=3D"/home/danj/localoptions.h"
BR2_PACKAGE_JOE=3Dy

I forgot to mention this before but the buildroot manual page you mentioned=
 said to create a local.mk file in order to use external source, this looks=
 like this:

LINUX_OVERRIDE_SRCDIR =3D /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/l=
inux-2.6.39.3/src/

For the kernel configuration I entered the kernel source dir and did "make =
menuconfig", I left everything at the defaults except for enabling the USB =
related items.

The resulting configuration file is attached as a text file. Unfortunately =
it's been literally decades since I last actually compiled a kernel, so I'm=
 afraid I have no idea what bits would be suitable to disable/remove to get=
 the results I want (I'm guessing this will be the most likely way to elimi=
nate the error I'm getting?)

>=20
> >>
> >> >>
> >> >> Copy usbcore.ko from Buildroot
> >> >> target/lib/modules/{kernel-version}/
> >> >> to the corresponding location on your device and load the driver
> >> >> with modprobe.
> >> >>
> >> >> Depending on which functionality (e.g. USB_STORAGE) you want on
> >> >> your USB port, additional configurations changes may be necessary.
> >> >
> >> > Yes, USB storage functionality is what I would like to add back in.
> >> > Incidentally, this is a newer router than the one I was
> >> > experimenting with before; this one has a Puma 6 CPU. Though, oddly
> >> > I found it necessary to select an armv5 CPU type in buildroot in
> >> > order to get binaries that work, despite /proc/cpuinfo on the
> >> > device claiming it is armv6.
> >> >
> >> >>
> >> >> Kind regards,
> >> >> Andreas
> >> >>
> >> >> > This time I successfully managed to build other binaries (e.g.
> >> >> > dropbear, busybox) which run OK on the device.
> >> >> >
> >> >> > Thanks,
> >> >> > Dan Jackson.
> >> >> > -------------- next part -------------- An HTML attachment was
> >> >> > scrubbed...
> >> >> > URL:
> >> >> > <http://lists.buildroot.org/pipermail/buildroot/attachments/2022
> >> >> > 032
> >> >> > 9/4
> >> >> > 3c49a2d/attachment.html>
> >> >>
> >> >> [1]
> >> >> https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103
> >> >> FB/
> >> >> [2]
> >> >>
> >>
> https://buildroot.org/downloads/manual/manual.html#_advanced_usage,

--_002_AM6PR02MB4884A6522909A9322C4C9E2EDA1E9AM6PR02MB4884eurp_
Content-Type: text/plain; name="kernelconfiguration.txt"
Content-Description: kernelconfiguration.txt
Content-Disposition: attachment; filename="kernelconfiguration.txt";
	size=49514; creation-date="Tue, 29 Mar 2022 19:19:51 GMT";
	modification-date="Tue, 29 Mar 2022 19:19:51 GMT"
Content-Transfer-Encoding: base64

Iw0KIyBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBtYWtlIGNvbmZpZzogZG9uJ3QgZWRpdA0KIyBM
aW51eC94ODZfNjQgMi42LjM5LjMgS2VybmVsIENvbmZpZ3VyYXRpb24NCiMgVHVlIE1hciAyOSAx
OToxMzo0NSAyMDIyDQojDQpDT05GSUdfNjRCSVQ9eQ0KIyBDT05GSUdfWDg2XzMyIGlzIG5vdCBz
ZXQNCkNPTkZJR19YODZfNjQ9eQ0KQ09ORklHX1g4Nj15DQpDT05GSUdfSU5TVFJVQ1RJT05fREVD
T0RFUj15DQpDT05GSUdfT1VUUFVUX0ZPUk1BVD0iZWxmNjQteDg2LTY0Ig0KQ09ORklHX0FSQ0hf
REVGQ09ORklHPSJhcmNoL3g4Ni9jb25maWdzL3g4Nl82NF9kZWZjb25maWciDQpDT05GSUdfR0VO
RVJJQ19DTU9TX1VQREFURT15DQpDT05GSUdfQ0xPQ0tTT1VSQ0VfV0FUQ0hET0c9eQ0KQ09ORklH
X0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQ0KQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURD
QVNUPXkNCkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQ0KQ09ORklHX1NUQUNLVFJBQ0VfU1VQUE9S
VD15DQpDT05GSUdfSEFWRV9MQVRFTkNZVE9QX1NVUFBPUlQ9eQ0KQ09ORklHX01NVT15DQpDT05G
SUdfWk9ORV9ETUE9eQ0KQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15DQpDT05GSUdfTkVFRF9T
R19ETUFfTEVOR1RIPXkNCkNPTkZJR19HRU5FUklDX0lTQV9ETUE9eQ0KQ09ORklHX0dFTkVSSUNf
SU9NQVA9eQ0KQ09ORklHX0dFTkVSSUNfQlVHPXkNCkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElW
RV9QT0lOVEVSUz15DQpDT05GSUdfR0VORVJJQ19IV0VJR0hUPXkNCkNPTkZJR19BUkNIX01BWV9I
QVZFX1BDX0ZEQz15DQojIENPTkZJR19SV1NFTV9HRU5FUklDX1NQSU5MT0NLIGlzIG5vdCBzZXQN
CkNPTkZJR19SV1NFTV9YQ0hHQUREX0FMR09SSVRITT15DQpDT05GSUdfQVJDSF9IQVNfQ1BVX0lE
TEVfV0FJVD15DQpDT05GSUdfR0VORVJJQ19DQUxJQlJBVEVfREVMQVk9eQ0KQ09ORklHX0dFTkVS
SUNfVElNRV9WU1lTQ0FMTD15DQpDT05GSUdfQVJDSF9IQVNfQ1BVX1JFTEFYPXkNCkNPTkZJR19B
UkNIX0hBU19ERUZBVUxUX0lETEU9eQ0KQ09ORklHX0FSQ0hfSEFTX0NBQ0hFX0xJTkVfU0laRT15
DQpDT05GSUdfSEFWRV9TRVRVUF9QRVJfQ1BVX0FSRUE9eQ0KQ09ORklHX05FRURfUEVSX0NQVV9F
TUJFRF9GSVJTVF9DSFVOSz15DQpDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTks9
eQ0KIyBDT05GSUdfSEFWRV9DUFVNQVNLX09GX0NQVV9NQVAgaXMgbm90IHNldA0KQ09ORklHX0FS
Q0hfSElCRVJOQVRJT05fUE9TU0lCTEU9eQ0KQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15
DQpDT05GSUdfWk9ORV9ETUEzMj15DQpDT05GSUdfQVJDSF9QT1BVTEFURVNfTk9ERV9NQVA9eQ0K
Q09ORklHX0FVRElUX0FSQ0g9eQ0KQ09ORklHX0FSQ0hfU1VQUE9SVFNfT1BUSU1JWkVEX0lOTElO
SU5HPXkNCkNPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQz15DQpDT05GSUdfQVJD
SF9IV0VJR0hUX0NGTEFHUz0iLWZjYWxsLXNhdmVkLXJkaSAtZmNhbGwtc2F2ZWQtcnNpIC1mY2Fs
bC1zYXZlZC1yZHggLWZjYWxsLXNhdmVkLXJjeCAtZmNhbGwtc2F2ZWQtcjggLWZjYWxsLXNhdmVk
LXI5IC1mY2FsbC1zYXZlZC1yMTAgLWZjYWxsLXNhdmVkLXIxMSINCiMgQ09ORklHX0tUSU1FX1ND
QUxBUiBpcyBub3Qgc2V0DQpDT05GSUdfREVGQ09ORklHX0xJU1Q9Ii9saWIvbW9kdWxlcy8kVU5B
TUVfUkVMRUFTRS8uY29uZmlnIg0KQ09ORklHX0NPTlNUUlVDVE9SUz15DQpDT05GSUdfSEFWRV9J
UlFfV09SSz15DQpDT05GSUdfSVJRX1dPUks9eQ0KDQojDQojIEdlbmVyYWwgc2V0dXANCiMNCkNP
TkZJR19FWFBFUklNRU5UQUw9eQ0KQ09ORklHX0JST0tFTl9PTl9TTVA9eQ0KQ09ORklHX0lOSVRf
RU5WX0FSR19MSU1JVD0zMg0KQ09ORklHX0NST1NTX0NPTVBJTEU9ImFybWViLWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmNnbnVlYWJpLSINCkNPTkZJR19MT0NBTFZFUlNJT049IiINCiMgQ09ORklHX0xP
Q0FMVkVSU0lPTl9BVVRPIGlzIG5vdCBzZXQNCkNPTkZJR19IQVZFX0tFUk5FTF9HWklQPXkNCkNP
TkZJR19IQVZFX0tFUk5FTF9CWklQMj15DQpDT05GSUdfSEFWRV9LRVJORUxfTFpNQT15DQpDT05G
SUdfSEFWRV9LRVJORUxfWFo9eQ0KQ09ORklHX0hBVkVfS0VSTkVMX0xaTz15DQojIENPTkZJR19L
RVJORUxfR1pJUCBpcyBub3Qgc2V0DQojIENPTkZJR19LRVJORUxfQlpJUDIgaXMgbm90IHNldA0K
Q09ORklHX0tFUk5FTF9MWk1BPXkNCiMgQ09ORklHX0tFUk5FTF9YWiBpcyBub3Qgc2V0DQojIENP
TkZJR19LRVJORUxfTFpPIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NXQVAgaXMgbm90IHNldA0KQ09O
RklHX1NZU1ZJUEM9eQ0KQ09ORklHX1NZU1ZJUENfU1lTQ1RMPXkNCiMgQ09ORklHX1BPU0lYX01R
VUVVRSBpcyBub3Qgc2V0DQojIENPTkZJR19CU0RfUFJPQ0VTU19BQ0NUIGlzIG5vdCBzZXQNCiMg
Q09ORklHX0ZIQU5ETEUgaXMgbm90IHNldA0KIyBDT05GSUdfVEFTS1NUQVRTIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0FVRElUIGlzIG5vdCBzZXQNCkNPTkZJR19IQVZFX0dFTkVSSUNfSEFSRElSUVM9
eQ0KDQojDQojIElSUSBzdWJzeXN0ZW0NCiMNCkNPTkZJR19HRU5FUklDX0hBUkRJUlFTPXkNCkNP
TkZJR19IQVZFX1NQQVJTRV9JUlE9eQ0KQ09ORklHX0dFTkVSSUNfSVJRX1BST0JFPXkNCkNPTkZJ
R19HRU5FUklDX0lSUV9TSE9XPXkNCkNPTkZJR19JUlFfRk9SQ0VEX1RIUkVBRElORz15DQojIENP
TkZJR19TUEFSU0VfSVJRIGlzIG5vdCBzZXQNCg0KIw0KIyBSQ1UgU3Vic3lzdGVtDQojDQpDT05G
SUdfVFJFRV9QUkVFTVBUX1JDVT15DQojIENPTkZJR19USU5ZX1JDVSBpcyBub3Qgc2V0DQojIENP
TkZJR19USU5ZX1BSRUVNUFRfUkNVIGlzIG5vdCBzZXQNCkNPTkZJR19QUkVFTVBUX1JDVT15DQoj
IENPTkZJR19SQ1VfVFJBQ0UgaXMgbm90IHNldA0KQ09ORklHX1JDVV9GQU5PVVQ9MzINCiMgQ09O
RklHX1JDVV9GQU5PVVRfRVhBQ1QgaXMgbm90IHNldA0KIyBDT05GSUdfVFJFRV9SQ1VfVFJBQ0Ug
aXMgbm90IHNldA0KIyBDT05GSUdfSUtDT05GSUcgaXMgbm90IHNldA0KQ09ORklHX0xPR19CVUZf
U0hJRlQ9MTQNCkNPTkZJR19IQVZFX1VOU1RBQkxFX1NDSEVEX0NMT0NLPXkNCiMgQ09ORklHX0NH
Uk9VUFMgaXMgbm90IHNldA0KIyBDT05GSUdfTkFNRVNQQUNFUyBpcyBub3Qgc2V0DQojIENPTkZJ
R19TQ0hFRF9BVVRPR1JPVVAgaXMgbm90IHNldA0KIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBp
cyBub3Qgc2V0DQpDT05GSUdfUkVMQVk9eQ0KQ09ORklHX0JMS19ERVZfSU5JVFJEPXkNCkNPTkZJ
R19JTklUUkFNRlNfU09VUkNFPSIiDQojIENPTkZJR19SRF9HWklQIGlzIG5vdCBzZXQNCiMgQ09O
RklHX1JEX0JaSVAyIGlzIG5vdCBzZXQNCkNPTkZJR19SRF9MWk1BPXkNCkNPTkZJR19SRF9YWj15
DQojIENPTkZJR19SRF9MWk8gaXMgbm90IHNldA0KQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpF
PXkNCkNPTkZJR19TWVNDVEw9eQ0KQ09ORklHX0FOT05fSU5PREVTPXkNCkNPTkZJR19FWFBFUlQ9
eQ0KQ09ORklHX1NZU0NUTF9TWVNDQUxMPXkNCkNPTkZJR19LQUxMU1lNUz15DQojIENPTkZJR19L
QUxMU1lNU19FWFRSQV9QQVNTIGlzIG5vdCBzZXQNCkNPTkZJR19IT1RQTFVHPXkNCkNPTkZJR19Q
UklOVEs9eQ0KQ09ORklHX0JVRz15DQpDT05GSUdfRUxGX0NPUkU9eQ0KQ09ORklHX1BDU1BLUl9Q
TEFURk9STT15DQpDT05GSUdfQkFTRV9GVUxMPXkNCkNPTkZJR19GVVRFWD15DQpDT05GSUdfRVBP
TEw9eQ0KQ09ORklHX1NJR05BTEZEPXkNCkNPTkZJR19USU1FUkZEPXkNCkNPTkZJR19FVkVOVEZE
PXkNCkNPTkZJR19TSE1FTT15DQpDT05GSUdfQUlPPXkNCkNPTkZJR19FTUJFRERFRD15DQpDT05G
SUdfSEFWRV9QRVJGX0VWRU5UUz15DQoNCiMNCiMgS2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBB
bmQgQ291bnRlcnMNCiMNCkNPTkZJR19QRVJGX0VWRU5UUz15DQpDT05GSUdfUEVSRl9DT1VOVEVS
Uz15DQpDT05GSUdfVk1fRVZFTlRfQ09VTlRFUlM9eQ0KQ09ORklHX1BDSV9RVUlSS1M9eQ0KQ09O
RklHX1NMVUJfREVCVUc9eQ0KQ09ORklHX0NPTVBBVF9CUks9eQ0KIyBDT05GSUdfU0xBQiBpcyBu
b3Qgc2V0DQpDT05GSUdfU0xVQj15DQojIENPTkZJR19TTE9CIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1BST0ZJTElORyBpcyBub3Qgc2V0DQpDT05GSUdfSEFWRV9PUFJPRklMRT15DQojIENPTkZJR19L
UFJPQkVTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0pVTVBfTEFCRUwgaXMgbm90IHNldA0KQ09ORklH
X0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQ0KQ09ORklHX0hBVkVfSU9SRU1BUF9Q
Uk9UPXkNCkNPTkZJR19IQVZFX0tQUk9CRVM9eQ0KQ09ORklHX0hBVkVfS1JFVFBST0JFUz15DQpD
T05GSUdfSEFWRV9PUFRQUk9CRVM9eQ0KQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQ0KQ09O
RklHX0hBVkVfRE1BX0FUVFJTPXkNCkNPTkZJR19IQVZFX1JFR1NfQU5EX1NUQUNLX0FDQ0VTU19B
UEk9eQ0KQ09ORklHX0hBVkVfRE1BX0FQSV9ERUJVRz15DQpDT05GSUdfSEFWRV9IV19CUkVBS1BP
SU5UPXkNCkNPTkZJR19IQVZFX01JWEVEX0JSRUFLUE9JTlRTX1JFR1M9eQ0KQ09ORklHX0hBVkVf
VVNFUl9SRVRVUk5fTk9USUZJRVI9eQ0KQ09ORklHX0hBVkVfUEVSRl9FVkVOVFNfTk1JPXkNCkNP
TkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15DQoNCiMNCiMgR0NPVi1iYXNlZCBrZXJuZWwgcHJv
ZmlsaW5nDQojDQojIENPTkZJR19IQVZFX0dFTkVSSUNfRE1BX0NPSEVSRU5UIGlzIG5vdCBzZXQN
CkNPTkZJR19TTEFCSU5GTz15DQpDT05GSUdfUlRfTVVURVhFUz15DQpDT05GSUdfQkFTRV9TTUFM
TD0wDQpDT05GSUdfTU9EVUxFUz15DQojIENPTkZJR19NT0RVTEVfRk9SQ0VfTE9BRCBpcyBub3Qg
c2V0DQpDT05GSUdfTU9EVUxFX1VOTE9BRD15DQojIENPTkZJR19NT0RVTEVfRk9SQ0VfVU5MT0FE
IGlzIG5vdCBzZXQNCiMgQ09ORklHX01PRFZFUlNJT05TIGlzIG5vdCBzZXQNCiMgQ09ORklHX01P
RFVMRV9TUkNWRVJTSU9OX0FMTCBpcyBub3Qgc2V0DQpDT05GSUdfQkxPQ0s9eQ0KQ09ORklHX0JM
S19ERVZfQlNHPXkNCiMgQ09ORklHX0JMS19ERVZfSU5URUdSSVRZIGlzIG5vdCBzZXQNCg0KIw0K
IyBJTyBTY2hlZHVsZXJzDQojDQpDT05GSUdfSU9TQ0hFRF9OT09QPXkNCkNPTkZJR19JT1NDSEVE
X0RFQURMSU5FPXkNCkNPTkZJR19JT1NDSEVEX0NGUT15DQojIENPTkZJR19ERUZBVUxUX0RFQURM
SU5FIGlzIG5vdCBzZXQNCkNPTkZJR19ERUZBVUxUX0NGUT15DQojIENPTkZJR19ERUZBVUxUX05P
T1AgaXMgbm90IHNldA0KQ09ORklHX0RFRkFVTFRfSU9TQ0hFRD0iY2ZxIg0KIyBDT05GSUdfSU5M
SU5FX1NQSU5fVFJZTE9DSyBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVfU1BJTl9UUllMT0NL
X0JIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9TUElOX0xPQ0sgaXMgbm90IHNldA0KIyBD
T05GSUdfSU5MSU5FX1NQSU5fTE9DS19CSCBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVfU1BJ
Tl9MT0NLX0lSUSBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVfU1BJTl9MT0NLX0lSUVNBVkUg
aXMgbm90IHNldA0KIyBDT05GSUdfSU5MSU5FX1NQSU5fVU5MT0NLIGlzIG5vdCBzZXQNCiMgQ09O
RklHX0lOTElORV9TUElOX1VOTE9DS19CSCBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVfU1BJ
Tl9VTkxPQ0tfSVJRIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9TUElOX1VOTE9DS19JUlFS
RVNUT1JFIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9SRUFEX1RSWUxPQ0sgaXMgbm90IHNl
dA0KIyBDT05GSUdfSU5MSU5FX1JFQURfTE9DSyBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVf
UkVBRF9MT0NLX0JIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9SRUFEX0xPQ0tfSVJRIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9SRUFEX0xPQ0tfSVJRU0FWRSBpcyBub3Qgc2V0DQoj
IENPTkZJR19JTkxJTkVfUkVBRF9VTkxPQ0sgaXMgbm90IHNldA0KIyBDT05GSUdfSU5MSU5FX1JF
QURfVU5MT0NLX0JIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9SRUFEX1VOTE9DS19JUlEg
aXMgbm90IHNldA0KIyBDT05GSUdfSU5MSU5FX1JFQURfVU5MT0NLX0lSUVJFU1RPUkUgaXMgbm90
IHNldA0KIyBDT05GSUdfSU5MSU5FX1dSSVRFX1RSWUxPQ0sgaXMgbm90IHNldA0KIyBDT05GSUdf
SU5MSU5FX1dSSVRFX0xPQ0sgaXMgbm90IHNldA0KIyBDT05GSUdfSU5MSU5FX1dSSVRFX0xPQ0tf
QkggaXMgbm90IHNldA0KIyBDT05GSUdfSU5MSU5FX1dSSVRFX0xPQ0tfSVJRIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0lOTElORV9XUklURV9MT0NLX0lSUVNBVkUgaXMgbm90IHNldA0KIyBDT05GSUdf
SU5MSU5FX1dSSVRFX1VOTE9DSyBpcyBub3Qgc2V0DQojIENPTkZJR19JTkxJTkVfV1JJVEVfVU5M
T0NLX0JIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lOTElORV9XUklURV9VTkxPQ0tfSVJRIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0lOTElORV9XUklURV9VTkxPQ0tfSVJRUkVTVE9SRSBpcyBub3Qgc2V0
DQojIENPTkZJR19NVVRFWF9TUElOX09OX09XTkVSIGlzIG5vdCBzZXQNCkNPTkZJR19GUkVFWkVS
PXkNCg0KIw0KIyBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMNCiMNCiMgQ09ORklHX05PX0ha
IGlzIG5vdCBzZXQNCiMgQ09ORklHX0hJR0hfUkVTX1RJTUVSUyBpcyBub3Qgc2V0DQpDT05GSUdf
R0VORVJJQ19DTE9DS0VWRU5UU19CVUlMRD15DQojIENPTkZJR19TTVAgaXMgbm90IHNldA0KQ09O
RklHX1g4Nl9NUFBBUlNFPXkNCkNPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk09eQ0KIyBDT05G
SUdfWDg2X1ZTTVAgaXMgbm90IHNldA0KQ09ORklHX1NDSEVEX09NSVRfRlJBTUVfUE9JTlRFUj15
DQojIENPTkZJR19QQVJBVklSVF9HVUVTVCBpcyBub3Qgc2V0DQpDT05GSUdfTk9fQk9PVE1FTT15
DQojIENPTkZJR19NRU1URVNUIGlzIG5vdCBzZXQNCiMgQ09ORklHX01LOCBpcyBub3Qgc2V0DQoj
IENPTkZJR19NUFNDIGlzIG5vdCBzZXQNCiMgQ09ORklHX01DT1JFMiBpcyBub3Qgc2V0DQojIENP
TkZJR19NQVRPTSBpcyBub3Qgc2V0DQpDT05GSUdfR0VORVJJQ19DUFU9eQ0KQ09ORklHX1g4Nl9J
TlRFUk5PREVfQ0FDSEVfU0hJRlQ9Ng0KQ09ORklHX1g4Nl9DTVBYQ0hHPXkNCkNPTkZJR19DTVBY
Q0hHX0xPQ0FMPXkNCkNPTkZJR19YODZfTDFfQ0FDSEVfU0hJRlQ9Ng0KQ09ORklHX1g4Nl9YQURE
PXkNCkNPTkZJR19YODZfV1BfV09SS1NfT0s9eQ0KQ09ORklHX1g4Nl9UU0M9eQ0KQ09ORklHX1g4
Nl9DTVBYQ0hHNjQ9eQ0KQ09ORklHX1g4Nl9DTU9WPXkNCkNPTkZJR19YODZfTUlOSU1VTV9DUFVf
RkFNSUxZPTY0DQpDT05GSUdfWDg2X0RFQlVHQ1RMTVNSPXkNCiMgQ09ORklHX1BST0NFU1NPUl9T
RUxFQ1QgaXMgbm90IHNldA0KQ09ORklHX0NQVV9TVVBfSU5URUw9eQ0KQ09ORklHX0NQVV9TVVBf
QU1EPXkNCkNPTkZJR19DUFVfU1VQX0NFTlRBVVI9eQ0KQ09ORklHX0hQRVRfVElNRVI9eQ0KQ09O
RklHX0RNST15DQpDT05GSUdfR0FSVF9JT01NVT15DQojIENPTkZJR19DQUxHQVJZX0lPTU1VIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0FNRF9JT01NVSBpcyBub3Qgc2V0DQpDT05GSUdfU1dJT1RMQj15
DQpDT05GSUdfSU9NTVVfSEVMUEVSPXkNCiMgQ09ORklHX0lPTU1VX0FQSSBpcyBub3Qgc2V0DQpD
T05GSUdfTlJfQ1BVUz0xDQojIENPTkZJR19JUlFfVElNRV9BQ0NPVU5USU5HIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0DQojIENPTkZJR19QUkVFTVBUX1ZPTFVO
VEFSWSBpcyBub3Qgc2V0DQojIENPTkZJR19QUkVFTVBUX0RFU0tUT1AgaXMgbm90IHNldA0KQ09O
RklHX1BSRUVNUFRfUlQ9eQ0KQ09ORklHX1BSRUVNUFQ9eQ0KQ09ORklHX1BSRUVNUFRfU09GVElS
UVM9eQ0KQ09ORklHX1BSRUVNUFRfSEFSRElSUVM9eQ0KIyBDT05GSUdfUFJFRU1QVF9CS0wgaXMg
bm90IHNldA0KQ09ORklHX1g4Nl9MT0NBTF9BUElDPXkNCkNPTkZJR19YODZfSU9fQVBJQz15DQoj
IENPTkZJR19YODZfUkVST1VURV9GT1JfQlJPS0VOX0JPT1RfSVJRUyBpcyBub3Qgc2V0DQojIENP
TkZJR19YODZfTUNFIGlzIG5vdCBzZXQNCiMgQ09ORklHX0k4SyBpcyBub3Qgc2V0DQojIENPTkZJ
R19NSUNST0NPREUgaXMgbm90IHNldA0KIyBDT05GSUdfWDg2X01TUiBpcyBub3Qgc2V0DQojIENP
TkZJR19YODZfQ1BVSUQgaXMgbm90IHNldA0KQ09ORklHX0FSQ0hfUEhZU19BRERSX1RfNjRCSVQ9
eQ0KQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVD15DQpDT05GSUdfRElSRUNUX0dCUEFHRVM9
eQ0KQ09ORklHX0FSQ0hfU1BBUlNFTUVNX0RFRkFVTFQ9eQ0KQ09ORklHX0FSQ0hfU1BBUlNFTUVN
X0VOQUJMRT15DQpDT05GSUdfQVJDSF9TRUxFQ1RfTUVNT1JZX01PREVMPXkNCkNPTkZJR19JTExF
R0FMX1BPSU5URVJfVkFMVUU9MHhkZWFkMDAwMDAwMDAwMDAwDQpDT05GSUdfU0VMRUNUX01FTU9S
WV9NT0RFTD15DQpDT05GSUdfU1BBUlNFTUVNX01BTlVBTD15DQpDT05GSUdfU1BBUlNFTUVNPXkN
CkNPTkZJR19IQVZFX01FTU9SWV9QUkVTRU5UPXkNCkNPTkZJR19TUEFSU0VNRU1fRVhUUkVNRT15
DQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxFPXkNCkNPTkZJR19TUEFSU0VNRU1fQUxM
T0NfTUVNX01BUF9UT0dFVEhFUj15DQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVA9eQ0KQ09ORklH
X0hBVkVfTUVNQkxPQ0s9eQ0KIyBDT05GSUdfTUVNT1JZX0hPVFBMVUcgaXMgbm90IHNldA0KQ09O
RklHX1BBR0VGTEFHU19FWFRFTkRFRD15DQpDT05GSUdfU1BMSVRfUFRMT0NLX0NQVVM9NA0KIyBD
T05GSUdfQ09NUEFDVElPTiBpcyBub3Qgc2V0DQpDT05GSUdfUEhZU19BRERSX1RfNjRCSVQ9eQ0K
Q09ORklHX1pPTkVfRE1BX0ZMQUc9MQ0KQ09ORklHX0JPVU5DRT15DQpDT05GSUdfVklSVF9UT19C
VVM9eQ0KIyBDT05GSUdfS1NNIGlzIG5vdCBzZXQNCkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FE
RFI9NDA5Ng0KIyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgaXMgbm90IHNldA0KQ09ORklH
X05FRURfUEVSX0NQVV9LTT15DQojIENPTkZJR19YODZfQ0hFQ0tfQklPU19DT1JSVVBUSU9OIGlz
IG5vdCBzZXQNCkNPTkZJR19YODZfUkVTRVJWRV9MT1c9NjQNCkNPTkZJR19NVFJSPXkNCkNPTkZJ
R19NVFJSX1NBTklUSVpFUj15DQpDT05GSUdfTVRSUl9TQU5JVElaRVJfRU5BQkxFX0RFRkFVTFQ9
MA0KQ09ORklHX01UUlJfU0FOSVRJWkVSX1NQQVJFX1JFR19OUl9ERUZBVUxUPTENCkNPTkZJR19Y
ODZfUEFUPXkNCkNPTkZJR19BUkNIX1VTRVNfUEdfVU5DQUNIRUQ9eQ0KIyBDT05GSUdfRUZJIGlz
IG5vdCBzZXQNCiMgQ09ORklHX1NFQ0NPTVAgaXMgbm90IHNldA0KIyBDT05GSUdfQ0NfU1RBQ0tQ
Uk9URUNUT1IgaXMgbm90IHNldA0KIyBDT05GSUdfSFpfMTAwIGlzIG5vdCBzZXQNCkNPTkZJR19I
Wl8yNTA9eQ0KIyBDT05GSUdfSFpfMzAwIGlzIG5vdCBzZXQNCiMgQ09ORklHX0haXzEwMDAgaXMg
bm90IHNldA0KQ09ORklHX0haPTI1MA0KIyBDT05GSUdfU0NIRURfSFJUSUNLIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0tFWEVDIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSQVNIX0RVTVAgaXMgbm90IHNl
dA0KQ09ORklHX1BIWVNJQ0FMX1NUQVJUPTB4MTAwMDAwMA0KQ09ORklHX1JFTE9DQVRBQkxFPXkN
CkNPTkZJR19QSFlTSUNBTF9BTElHTj0weDEwMDAwMDANCiMgQ09ORklHX0NNRExJTkVfQk9PTCBp
cyBub3Qgc2V0DQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFBMVUc9eQ0KDQojDQojIFBv
d2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0aW9ucw0KIw0KQ09ORklHX1NVU1BFTkQ9eQ0KQ09O
RklHX1NVU1BFTkRfRlJFRVpFUj15DQpDT05GSUdfUE1fU0xFRVA9eQ0KIyBDT05GSUdfUE1fUlVO
VElNRSBpcyBub3Qgc2V0DQpDT05GSUdfUE09eQ0KIyBDT05GSUdfUE1fREVCVUcgaXMgbm90IHNl
dA0KQ09ORklHX0FDUEk9eQ0KQ09ORklHX0FDUElfU0xFRVA9eQ0KIyBDT05GSUdfQUNQSV9QUk9D
RlMgaXMgbm90IHNldA0KIyBDT05GSUdfQUNQSV9QUk9DRlNfUE9XRVIgaXMgbm90IHNldA0KIyBD
T05GSUdfQUNQSV9FQ19ERUJVR0ZTIGlzIG5vdCBzZXQNCkNPTkZJR19BQ1BJX1BST0NfRVZFTlQ9
eQ0KQ09ORklHX0FDUElfQUM9eQ0KQ09ORklHX0FDUElfQkFUVEVSWT15DQpDT05GSUdfQUNQSV9G
QU49eQ0KIyBDT05GSUdfQUNQSV9ET0NLIGlzIG5vdCBzZXQNCkNPTkZJR19BQ1BJX1BST0NFU1NP
Uj15DQojIENPTkZJR19BQ1BJX1BST0NFU1NPUl9BR0dSRUdBVE9SIGlzIG5vdCBzZXQNCkNPTkZJ
R19BQ1BJX1RIRVJNQUw9eQ0KIyBDT05GSUdfQUNQSV9DVVNUT01fRFNEVCBpcyBub3Qgc2V0DQpD
T05GSUdfQUNQSV9CTEFDS0xJU1RfWUVBUj0wDQojIENPTkZJR19BQ1BJX0RFQlVHIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0FDUElfUENJX1NMT1QgaXMgbm90IHNldA0KQ09ORklHX1g4Nl9QTV9USU1F
Uj15DQojIENPTkZJR19BQ1BJX0NPTlRBSU5FUiBpcyBub3Qgc2V0DQojIENPTkZJR19BQ1BJX1NC
UyBpcyBub3Qgc2V0DQojIENPTkZJR19BQ1BJX0hFRCBpcyBub3Qgc2V0DQojIENPTkZJR19BQ1BJ
X0FQRUkgaXMgbm90IHNldA0KIyBDT05GSUdfU0ZJIGlzIG5vdCBzZXQNCg0KIw0KIyBDUFUgRnJl
cXVlbmN5IHNjYWxpbmcNCiMNCiMgQ09ORklHX0NQVV9GUkVRIGlzIG5vdCBzZXQNCkNPTkZJR19D
UFVfSURMRT15DQpDT05GSUdfQ1BVX0lETEVfR09WX0xBRERFUj15DQojIENPTkZJR19JTlRFTF9J
RExFIGlzIG5vdCBzZXQNCg0KIw0KIyBNZW1vcnkgcG93ZXIgc2F2aW5ncw0KIw0KIyBDT05GSUdf
STczMDBfSURMRSBpcyBub3Qgc2V0DQoNCiMNCiMgQnVzIG9wdGlvbnMgKFBDSSBldGMuKQ0KIw0K
Q09ORklHX1BDST15DQpDT05GSUdfUENJX0RJUkVDVD15DQojIENPTkZJR19QQ0lfTU1DT05GSUcg
aXMgbm90IHNldA0KQ09ORklHX1BDSV9ET01BSU5TPXkNCiMgQ09ORklHX1BDSV9DTkIyMExFX1FV
SVJLIGlzIG5vdCBzZXQNCiMgQ09ORklHX1BDSUVQT1JUQlVTIGlzIG5vdCBzZXQNCkNPTkZJR19B
UkNIX1NVUFBPUlRTX01TST15DQojIENPTkZJR19QQ0lfTVNJIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1BDSV9TVFVCIGlzIG5vdCBzZXQNCkNPTkZJR19IVF9JUlE9eQ0KIyBDT05GSUdfUENJX0lPViBp
cyBub3Qgc2V0DQpDT05GSUdfUENJX0lPQVBJQz15DQpDT05GSUdfUENJX0xBQkVMPXkNCkNPTkZJ
R19JU0FfRE1BX0FQST15DQpDT05GSUdfQU1EX05CPXkNCiMgQ09ORklHX1BDQ0FSRCBpcyBub3Qg
c2V0DQojIENPTkZJR19IT1RQTFVHX1BDSSBpcyBub3Qgc2V0DQojIENPTkZJR19SQVBJRElPIGlz
IG5vdCBzZXQNCg0KIw0KIyBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cyAvIEVtdWxhdGlvbnMNCiMN
CkNPTkZJR19CSU5GTVRfRUxGPXkNCiMgQ09ORklHX0NPUkVfRFVNUF9ERUZBVUxUX0VMRl9IRUFE
RVJTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0hBVkVfQU9VVCBpcyBub3Qgc2V0DQojIENPTkZJR19C
SU5GTVRfTUlTQyBpcyBub3Qgc2V0DQojIENPTkZJR19JQTMyX0VNVUxBVElPTiBpcyBub3Qgc2V0
DQojIENPTkZJR19DT01QQVRfRk9SX1U2NF9BTElHTk1FTlQgaXMgbm90IHNldA0KQ09ORklHX0hB
VkVfVEVYVF9QT0tFX1NNUD15DQpDT05GSUdfTkVUPXkNCg0KIw0KIyBOZXR3b3JraW5nIG9wdGlv
bnMNCiMNCkNPTkZJR19QQUNLRVQ9eQ0KQ09ORklHX1VOSVg9eQ0KQ09ORklHX1hGUk09eQ0KQ09O
RklHX1hGUk1fVVNFUj15DQojIENPTkZJR19YRlJNX1NVQl9QT0xJQ1kgaXMgbm90IHNldA0KIyBD
T05GSUdfWEZSTV9NSUdSQVRFIGlzIG5vdCBzZXQNCiMgQ09ORklHX1hGUk1fU1RBVElTVElDUyBp
cyBub3Qgc2V0DQpDT05GSUdfTkVUX0tFWT15DQojIENPTkZJR19ORVRfS0VZX01JR1JBVEUgaXMg
bm90IHNldA0KQ09ORklHX0lORVQ9eQ0KQ09ORklHX0lQX01VTFRJQ0FTVD15DQpDT05GSUdfSVBf
QURWQU5DRURfUk9VVEVSPXkNCkNPTkZJR19JUF9GSUJfVFJJRV9TVEFUUz15DQpDT05GSUdfSVBf
TVVMVElQTEVfVEFCTEVTPXkNCkNPTkZJR19JUF9ST1VURV9NVUxUSVBBVEg9eQ0KQ09ORklHX0lQ
X1JPVVRFX1ZFUkJPU0U9eQ0KQ09ORklHX0lQX1JPVVRFX0NMQVNTSUQ9eQ0KQ09ORklHX0lQX1BO
UD15DQpDT05GSUdfSVBfUE5QX0RIQ1A9eQ0KIyBDT05GSUdfSVBfUE5QX0JPT1RQIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0lQX1BOUF9SQVJQIGlzIG5vdCBzZXQNCkNPTkZJR19ORVRfSVBJUD15DQpD
T05GSUdfTkVUX0lQR1JFX0RFTVVYPXkNCkNPTkZJR19ORVRfSVBHUkU9eQ0KQ09ORklHX05FVF9J
UEdSRV9CUk9BRENBU1Q9eQ0KQ09ORklHX0lQX01ST1VURT15DQojIENPTkZJR19JUF9NUk9VVEVf
TVVMVElQTEVfVEFCTEVTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQX1BJTVNNX1YxIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0lQX1BJTVNNX1YyIGlzIG5vdCBzZXQNCkNPTkZJR19BUlBEPXkNCkNPTkZJ
R19TWU5fQ09PS0lFUz15DQojIENPTkZJR19JTkVUX0FIIGlzIG5vdCBzZXQNCkNPTkZJR19JTkVU
X0VTUD15DQojIENPTkZJR19JTkVUX0lQQ09NUCBpcyBub3Qgc2V0DQojIENPTkZJR19JTkVUX1hG
Uk1fVFVOTkVMIGlzIG5vdCBzZXQNCkNPTkZJR19JTkVUX1RVTk5FTD15DQpDT05GSUdfSU5FVF9Y
RlJNX01PREVfVFJBTlNQT1JUPXkNCkNPTkZJR19JTkVUX1hGUk1fTU9ERV9UVU5ORUw9eQ0KQ09O
RklHX0lORVRfWEZSTV9NT0RFX0JFRVQ9eQ0KIyBDT05GSUdfSU5FVF9MUk8gaXMgbm90IHNldA0K
IyBDT05GSUdfSU5FVF9ESUFHIGlzIG5vdCBzZXQNCiMgQ09ORklHX1RDUF9DT05HX0FEVkFOQ0VE
IGlzIG5vdCBzZXQNCkNPTkZJR19UQ1BfQ09OR19DVUJJQz15DQpDT05GSUdfREVGQVVMVF9UQ1Bf
Q09ORz0iY3ViaWMiDQojIENPTkZJR19UQ1BfTUQ1U0lHIGlzIG5vdCBzZXQNCkNPTkZJR19JUFY2
PXkNCiMgQ09ORklHX0lQVjZfUFJJVkFDWSBpcyBub3Qgc2V0DQojIENPTkZJR19JUFY2X1JPVVRF
Ul9QUkVGIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQVjZfT1BUSU1JU1RJQ19EQUQgaXMgbm90IHNl
dA0KIyBDT05GSUdfSU5FVDZfQUggaXMgbm90IHNldA0KIyBDT05GSUdfSU5FVDZfRVNQIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0lORVQ2X0lQQ09NUCBpcyBub3Qgc2V0DQojIENPTkZJR19JUFY2X01J
UDYgaXMgbm90IHNldA0KIyBDT05GSUdfSU5FVDZfWEZSTV9UVU5ORUwgaXMgbm90IHNldA0KQ09O
RklHX0lORVQ2X1RVTk5FTD15DQpDT05GSUdfSU5FVDZfWEZSTV9NT0RFX1RSQU5TUE9SVD15DQpD
T05GSUdfSU5FVDZfWEZSTV9NT0RFX1RVTk5FTD15DQpDT05GSUdfSU5FVDZfWEZSTV9NT0RFX0JF
RVQ9eQ0KIyBDT05GSUdfSU5FVDZfWEZSTV9NT0RFX1JPVVRFT1BUSU1JWkFUSU9OIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0lQVjZfU0lUIGlzIG5vdCBzZXQNCkNPTkZJR19JUFY2X1RVTk5FTD15DQpD
T05GSUdfSVBWNl9HUkU9eQ0KQ09ORklHX0lQVjZfTVVMVElQTEVfVEFCTEVTPXkNCiMgQ09ORklH
X0lQVjZfU1VCVFJFRVMgaXMgbm90IHNldA0KQ09ORklHX0lQVjZfTVJPVVRFPXkNCiMgQ09ORklH
X0lQVjZfTVJPVVRFX01VTFRJUExFX1RBQkxFUyBpcyBub3Qgc2V0DQojIENPTkZJR19JUFY2X1BJ
TVNNX1YyIGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVFdPUktfU0VDTUFSSyBpcyBub3Qgc2V0DQoj
IENPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgaXMgbm90IHNldA0KQ09ORklHX05FVEZJ
TFRFUj15DQpDT05GSUdfTkVURklMVEVSX0RFQlVHPXkNCkNPTkZJR19ORVRGSUxURVJfQURWQU5D
RUQ9eQ0KQ09ORklHX0JSSURHRV9ORVRGSUxURVI9eQ0KDQojDQojIENvcmUgTmV0ZmlsdGVyIENv
bmZpZ3VyYXRpb24NCiMNCkNPTkZJR19ORVRGSUxURVJfTkVUTElOSz15DQpDT05GSUdfTkVURklM
VEVSX05FVExJTktfUVVFVUU9eQ0KQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX0xPRz15DQpDT05G
SUdfTkZfQ09OTlRSQUNLPXkNCkNPTkZJR19ORl9DT05OVFJBQ0tfTUFSSz15DQpDT05GSUdfTkZf
Q09OTlRSQUNLX0VWRU5UUz15DQpDT05GSUdfTkZfQ09OTlRSQUNLX1RJTUVTVEFNUD15DQpDT05G
SUdfTkZfQ1RfUFJPVE9fRENDUD15DQpDT05GSUdfTkZfQ1RfUFJPVE9fR1JFPW0NCkNPTkZJR19O
Rl9DVF9QUk9UT19TQ1RQPXkNCkNPTkZJR19ORl9DVF9QUk9UT19VRFBMSVRFPXkNCkNPTkZJR19O
Rl9DT05OVFJBQ0tfQU1BTkRBPXkNCkNPTkZJR19ORl9DT05OVFJBQ0tfRlRQPW0NCkNPTkZJR19O
Rl9DT05OVFJBQ0tfSDMyMz1tDQpDT05GSUdfTkZfQ09OTlRSQUNLX0lSQz1tDQpDT05GSUdfTkZf
Q09OTlRSQUNLX0JST0FEQ0FTVD15DQpDT05GSUdfTkZfQ09OTlRSQUNLX05FVEJJT1NfTlM9eQ0K
Q09ORklHX05GX0NPTk5UUkFDS19TTk1QPXkNCkNPTkZJR19ORl9DT05OVFJBQ0tfUFBUUD1tDQpD
T05GSUdfTkZfQ09OTlRSQUNLX1NBTkU9eQ0KQ09ORklHX05GX0NPTk5UUkFDS19TSVA9bQ0KQ09O
RklHX05GX0NPTk5UUkFDS19URlRQPW0NCkNPTkZJR19ORl9DT05OVFJBQ0tfUlRTUD1tDQpDT05G
SUdfTkZfQ1RfTkVUTElOSz15DQpDT05GSUdfTkVURklMVEVSX1RQUk9YWT15DQpDT05GSUdfTkVU
RklMVEVSX1hUQUJMRVM9eQ0KDQojDQojIFh0YWJsZXMgY29tYmluZWQgbW9kdWxlcw0KIw0KQ09O
RklHX05FVEZJTFRFUl9YVF9NQVJLPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfQ09OTk1BUks9eQ0K
DQojDQojIFh0YWJsZXMgdGFyZ2V0cw0KIw0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9D
SEVDS1NVTSBpcyBub3Qgc2V0DQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DTEFTU0lGWT15
DQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DT05OTUFSSz15DQojIENPTkZJR19ORVRGSUxU
RVJfWFRfVEFSR0VUX0NUIGlzIG5vdCBzZXQNCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0RT
Q1A9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSEw9eQ0KQ09ORklHX05FVEZJTFRFUl9Y
VF9UQVJHRVRfSURMRVRJTUVSPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX01BUks9eQ0K
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTkZMT0c9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfTkZRVUVVRT15DQojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05PVFJBQ0sgaXMg
bm90IHNldA0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkFURUVTVD15DQpDT05GSUdfTkVU
RklMVEVSX1hUX1RBUkdFVF9URUU9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVFBST1hZ
PXkNCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVFJBQ0UgaXMgbm90IHNldA0KQ09ORklH
X05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTPXkNCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJH
RVRfVENQT1BUU1RSSVAgaXMgbm90IHNldA0KDQojDQojIFh0YWJsZXMgbWF0Y2hlcw0KIw0KQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9BRERSVFlQRT15DQojIENPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfQ0xVU1RFUiBpcyBub3Qgc2V0DQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTU1F
TlQ9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OQllURVM9eQ0KQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9DT05OTElNSVQ9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05O
TUFSSz15DQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5UUkFDSz15DQojIENPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfQ1BVIGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVEZJTFRFUl9YVF9N
QVRDSF9EQ0NQIGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9ERVZHUk9V
UCBpcyBub3Qgc2V0DQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RTQ1A9eQ0KQ09ORklHX05F
VEZJTFRFUl9YVF9NQVRDSF9FU1A9eQ0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0hBU0hM
SU1JVCBpcyBub3Qgc2V0DQojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSEVMUEVSIGlzIG5v
dCBzZXQNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSEw9eQ0KQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9JUFJBTkdFPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSVBWUz15DQpDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX0xFTkdUSD15DQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X0xJTUlUPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRVZUTElNSVQ9eQ0KQ09ORklHX05F
VEZJTFRFUl9YVF9NQVRDSF9NQUM9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9NQVJLPXkN
CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfTVVMVElQT1JUPXkNCiMgQ09ORklHX05FVEZJTFRF
Ul9YVF9NQVRDSF9PU0YgaXMgbm90IHNldA0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX09X
TkVSIGlzIG5vdCBzZXQNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUE9MSUNZPXkNCkNPTkZJ
R19ORVRGSUxURVJfWFRfTUFUQ0hfUEhZU0RFVj15DQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X1BLVFRZUEU9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9RVU9UQT15DQojIENPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfUkFURUVTVCBpcyBub3Qgc2V0DQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX1JFQUxNPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUkVDRU5UPXkNCiMgQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9TQ1RQIGlzIG5vdCBzZXQNCkNPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfU09DS0VUPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RBVEU9eQ0KQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9TVEFUSVNUSUM9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9N
QVRDSF9TVFJJTkc9eQ0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9UQ1BNU1M9eQ0KQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9USU1FPXkNCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfVTMy
PXkNCiMgQ09ORklHX0lQX1NFVCBpcyBub3Qgc2V0DQpDT05GSUdfSVBfVlM9eQ0KIyBDT05GSUdf
SVBfVlNfSVBWNiBpcyBub3Qgc2V0DQpDT05GSUdfSVBfVlNfREVCVUc9eQ0KQ09ORklHX0lQX1ZT
X1RBQl9CSVRTPTEyDQoNCiMNCiMgSVBWUyB0cmFuc3BvcnQgcHJvdG9jb2wgbG9hZCBiYWxhbmNp
bmcgc3VwcG9ydA0KIw0KIyBDT05GSUdfSVBfVlNfUFJPVE9fVENQIGlzIG5vdCBzZXQNCiMgQ09O
RklHX0lQX1ZTX1BST1RPX1VEUCBpcyBub3Qgc2V0DQojIENPTkZJR19JUF9WU19QUk9UT19BSF9F
U1AgaXMgbm90IHNldA0KIyBDT05GSUdfSVBfVlNfUFJPVE9fRVNQIGlzIG5vdCBzZXQNCiMgQ09O
RklHX0lQX1ZTX1BST1RPX0FIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQX1ZTX1BST1RPX1NDVFAg
aXMgbm90IHNldA0KDQojDQojIElQVlMgc2NoZWR1bGVyDQojDQojIENPTkZJR19JUF9WU19SUiBp
cyBub3Qgc2V0DQojIENPTkZJR19JUF9WU19XUlIgaXMgbm90IHNldA0KIyBDT05GSUdfSVBfVlNf
TEMgaXMgbm90IHNldA0KIyBDT05GSUdfSVBfVlNfV0xDIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQ
X1ZTX0xCTEMgaXMgbm90IHNldA0KIyBDT05GSUdfSVBfVlNfTEJMQ1IgaXMgbm90IHNldA0KIyBD
T05GSUdfSVBfVlNfREggaXMgbm90IHNldA0KIyBDT05GSUdfSVBfVlNfU0ggaXMgbm90IHNldA0K
IyBDT05GSUdfSVBfVlNfU0VEIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQX1ZTX05RIGlzIG5vdCBz
ZXQNCg0KIw0KIyBJUFZTIGFwcGxpY2F0aW9uIGhlbHBlcg0KIw0KIyBDT05GSUdfSVBfVlNfTkZD
VCBpcyBub3Qgc2V0DQoNCiMNCiMgSVA6IE5ldGZpbHRlciBDb25maWd1cmF0aW9uDQojDQpDT05G
SUdfTkZfREVGUkFHX0lQVjQ9eQ0KQ09ORklHX05GX0NPTk5UUkFDS19JUFY0PXkNCkNPTkZJR19O
Rl9DT05OVFJBQ0tfUFJPQ19DT01QQVQ9eQ0KIyBDT05GSUdfSVBfTkZfUVVFVUUgaXMgbm90IHNl
dA0KQ09ORklHX0lQX05GX0lQVEFCTEVTPXkNCkNPTkZJR19JUF9ORl9NQVRDSF9BSD15DQpDT05G
SUdfSVBfTkZfTUFUQ0hfRUNOPXkNCkNPTkZJR19JUF9ORl9NQVRDSF9UVEw9eQ0KQ09ORklHX0lQ
X05GX1RBUkdFVF9UUklHR0VSPXkNCkNPTkZJR19JUF9ORl9UQVJHRVRfR1dNRVRBPXkNCkNPTkZJ
R19JUF9ORl9NQVRDSF9XRUJTVFI9eQ0KQ09ORklHX0lQX05GX0ZJTFRFUj15DQpDT05GSUdfSVBf
TkZfVEFSR0VUX1JFSkVDVD15DQpDT05GSUdfSVBfTkZfVEFSR0VUX0xPRz15DQpDT05GSUdfSVBf
TkZfVEFSR0VUX1VMT0c9eQ0KQ09ORklHX05GX05BVD15DQpDT05GSUdfTkZfTkFUX05FRURFRD15
DQpDT05GSUdfSVBfTkZfVEFSR0VUX01BU1FVRVJBREU9eQ0KQ09ORklHX0lQX05GX1RBUkdFVF9O
RVRNQVA9eQ0KQ09ORklHX0lQX05GX1RBUkdFVF9SRURJUkVDVD15DQpDT05GSUdfTkZfTkFUX1NO
TVBfQkFTSUM9eQ0KQ09ORklHX05GX05BVF9QUk9UT19EQ0NQPXkNCkNPTkZJR19ORl9OQVRfUFJP
VE9fR1JFPW0NCkNPTkZJR19ORl9OQVRfUFJPVE9fVURQTElURT15DQpDT05GSUdfTkZfTkFUX1BS
T1RPX1NDVFA9eQ0KQ09ORklHX05GX05BVF9GVFA9bQ0KQ09ORklHX05GX05BVF9JUkM9bQ0KQ09O
RklHX05GX05BVF9SVFNQPW0NCkNPTkZJR19ORl9OQVRfVEZUUD1tDQpDT05GSUdfTkZfTkFUX0FN
QU5EQT15DQpDT05GSUdfTkZfTkFUX1BQVFA9bQ0KQ09ORklHX05GX05BVF9IMzIzPW0NCkNPTkZJ
R19ORl9OQVRfU0lQPW0NCkNPTkZJR19JUF9ORl9NQU5HTEU9eQ0KQ09ORklHX0lQX05GX1RBUkdF
VF9DTFVTVEVSSVA9eQ0KIyBDT05GSUdfSVBfTkZfVEFSR0VUX0VDTiBpcyBub3Qgc2V0DQpDT05G
SUdfSVBfTkZfVEFSR0VUX1RUTD15DQpDT05GSUdfSVBfTkZfUkFXPXkNCkNPTkZJR19JUF9ORl9B
UlBUQUJMRVM9eQ0KIyBDT05GSUdfSVBfTkZfQVJQRklMVEVSIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0lQX05GX0FSUF9NQU5HTEUgaXMgbm90IHNldA0KDQojDQojIElQdjY6IE5ldGZpbHRlciBDb25m
aWd1cmF0aW9uDQojDQpDT05GSUdfTkZfREVGUkFHX0lQVjY9eQ0KQ09ORklHX05GX0NPTk5UUkFD
S19JUFY2PXkNCiMgQ09ORklHX0lQNl9ORl9RVUVVRSBpcyBub3Qgc2V0DQpDT05GSUdfSVA2X05G
X0lQVEFCTEVTPXkNCkNPTkZJR19JUDZfTkZfTUFUQ0hfQUg9eQ0KQ09ORklHX0lQNl9ORl9NQVRD
SF9FVUk2ND15DQpDT05GSUdfSVA2X05GX01BVENIX0ZSQUc9eQ0KQ09ORklHX0lQNl9ORl9NQVRD
SF9PUFRTPXkNCkNPTkZJR19JUDZfTkZfTUFUQ0hfSEw9eQ0KQ09ORklHX0lQNl9ORl9NQVRDSF9J
UFY2SEVBREVSPXkNCkNPTkZJR19JUDZfTkZfTUFUQ0hfTUg9eQ0KQ09ORklHX0lQNl9ORl9NQVRD
SF9SVD15DQpDT05GSUdfSVA2X05GX01BVENIX1dFQlNUUj15DQpDT05GSUdfSVA2X05GX1RBUkdF
VF9ITD15DQpDT05GSUdfSVA2X05GX1RBUkdFVF9MT0c9eQ0KQ09ORklHX0lQNl9ORl9GSUxURVI9
eQ0KQ09ORklHX0lQNl9ORl9UQVJHRVRfUkVKRUNUPXkNCkNPTkZJR19JUDZfTkZfVEFSR0VUX0dX
TUVUQT15DQpDT05GSUdfSVA2X05GX01BTkdMRT15DQpDT05GSUdfSVA2X05GX1JBVz15DQpDT05G
SUdfQlJJREdFX05GX0VCVEFCTEVTPXkNCkNPTkZJR19CUklER0VfRUJUX0JST1VURT15DQpDT05G
SUdfQlJJREdFX0VCVF9UX0ZJTFRFUj15DQojIENPTkZJR19CUklER0VfRUJUX1RfTkFUIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0JSSURHRV9FQlRfODAyXzMgaXMgbm90IHNldA0KIyBDT05GSUdfQlJJ
REdFX0VCVF9BTU9ORyBpcyBub3Qgc2V0DQojIENPTkZJR19CUklER0VfRUJUX0FSUCBpcyBub3Qg
c2V0DQojIENPTkZJR19CUklER0VfRUJUX0lQIGlzIG5vdCBzZXQNCkNPTkZJR19CUklER0VfRUJU
X0lQNj15DQojIENPTkZJR19CUklER0VfRUJUX0xJTUlUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JS
SURHRV9FQlRfTUFSSyBpcyBub3Qgc2V0DQojIENPTkZJR19CUklER0VfRUJUX1BLVFRZUEUgaXMg
bm90IHNldA0KIyBDT05GSUdfQlJJREdFX0VCVF9TVFAgaXMgbm90IHNldA0KIyBDT05GSUdfQlJJ
REdFX0VCVF9WTEFOIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JSSURHRV9FQlRfQVJQUkVQTFkgaXMg
bm90IHNldA0KIyBDT05GSUdfQlJJREdFX0VCVF9ETkFUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JS
SURHRV9FQlRfTUFSS19UIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JSSURHRV9FQlRfUkVESVJFQ1Qg
aXMgbm90IHNldA0KIyBDT05GSUdfQlJJREdFX0VCVF9TTkFUIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0JSSURHRV9FQlRfTE9HIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JSSURHRV9FQlRfVUxPRyBpcyBu
b3Qgc2V0DQojIENPTkZJR19CUklER0VfRUJUX05GTE9HIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQ
X0RDQ1AgaXMgbm90IHNldA0KIyBDT05GSUdfSVBfU0NUUCBpcyBub3Qgc2V0DQojIENPTkZJR19S
RFMgaXMgbm90IHNldA0KIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0DQojIENPTkZJR19BVE0gaXMg
bm90IHNldA0KQ09ORklHX0wyVFA9eQ0KIyBDT05GSUdfTDJUUF9WMyBpcyBub3Qgc2V0DQpDT05G
SUdfU1RQPXkNCkNPTkZJR19CUklER0U9eQ0KIyBDT05GSUdfQlJJREdFX0lHTVBfU05PT1BJTkcg
aXMgbm90IHNldA0KIyBDT05GSUdfTkVUX0RTQSBpcyBub3Qgc2V0DQpDT05GSUdfVkxBTl84MDIx
UT15DQojIENPTkZJR19WTEFOXzgwMjFRX0dWUlAgaXMgbm90IHNldA0KIyBDT05GSUdfREVDTkVU
IGlzIG5vdCBzZXQNCkNPTkZJR19MTEM9eQ0KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0DQojIENP
TkZJR19JUFggaXMgbm90IHNldA0KIyBDT05GSUdfQVRBTEsgaXMgbm90IHNldA0KIyBDT05GSUdf
WDI1IGlzIG5vdCBzZXQNCiMgQ09ORklHX0xBUEIgaXMgbm90IHNldA0KIyBDT05GSUdfRUNPTkVU
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1dBTl9ST1VURVIgaXMgbm90IHNldA0KIyBDT05GSUdfUEhP
TkVUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lFRUU4MDIxNTQgaXMgbm90IHNldA0KIyBDT05GSUdf
TkVUX1NDSEVEIGlzIG5vdCBzZXQNCiMgQ09ORklHX0RDQiBpcyBub3Qgc2V0DQojIENPTkZJR19C
QVRNQU5fQURWIGlzIG5vdCBzZXQNCg0KIw0KIyBOZXR3b3JrIHRlc3RpbmcNCiMNCiMgQ09ORklH
X05FVF9QS1RHRU4gaXMgbm90IHNldA0KIyBDT05GSUdfSEFNUkFESU8gaXMgbm90IHNldA0KIyBD
T05GSUdfQ0FOIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lSREEgaXMgbm90IHNldA0KIyBDT05GSUdf
QlQgaXMgbm90IHNldA0KIyBDT05GSUdfQUZfUlhSUEMgaXMgbm90IHNldA0KQ09ORklHX0ZJQl9S
VUxFUz15DQoNCiMNCiMgVGV4YXMgSW5zdHJ1bWVudHMgS2VybmVsIEV4dGVuc2lvbnMNCiMNCkNP
TkZJR19USV9ERVZJQ0VfUFJPVE9DT0xfSEFORExJTkc9eQ0KIyBDT05GSUdfVElfVU5NQU5BR0VE
X0JSSURHRSBpcyBub3Qgc2V0DQpDT05GSUdfSU5URUxfS0VSTkVMX0RPQ1NJU19TVVBQT1JUPXkN
CkNPTkZJR19JTlRFTF9LRVJORUxfQkJVX1NVUFBPUlQ9eQ0KQ09ORklHX1RJX01FVEFfREFUQT15
DQpDT05GSUdfSU5URUxfTkZfVFJJR0dFUl9TVVBQT1JUPXkNCkNPTkZJR19JTlRFTF9ORl9HV01F
VEFfU1VQUE9SVD15DQpDT05GSUdfSU5URUxfTkZfV0VCU1RSX1NVUFBPUlQ9eQ0KQ09ORklHX1RJ
X0lQX1BLVElORk9fU09DS09QVD15DQojIENPTkZJR19USV9NRVRBX0RBVEFfQ09OU09MRV9EVU1Q
IGlzIG5vdCBzZXQNCkNPTkZJR19USV9ET0NTSVNfSU5QVVRfREVWPXkNCiMgQ09ORklHX0lOVEVM
X0RPQ1NJU19JQ01QX0lJRiBpcyBub3Qgc2V0DQpDT05GSUdfVElfTDJfU0VMRUNUSVZFX0ZPUldB
UkRFUj15DQpDT05GSUdfVElfTDJfU0VMRUNUSVZFX0ZPUldBUkRFUl9URVNUPXkNCkNPTkZJR19J
TlRFTF9MMlZQTl9MMkNQX0ZPUldBUkQ9eQ0KQ09ORklHX1RJX0RFVklDRV9JTkRFWF9SRVVTRT15
DQpDT05GSUdfVElfTDJfU0VMRUNUSVZFX1BBQ0tFVF9IQU5ETElORz15DQpDT05GSUdfVElfRE9D
U0lTX0VHUkVTU19IT09LPXkNCkNPTkZJR19USV9EREhfR1c9eQ0KQ09ORklHX1RJX0dXX0VHUkVT
U19IT09LPXkNCkNPTkZJR19USV9FR1JFU1NfSE9PSz15DQojIENPTkZJR19USV9JQ01QX0VDSE9f
UkVQTFlfTkVURklMVEVSX0JZUEFTUyBpcyBub3Qgc2V0DQpDT05GSUdfSU5URUxfTlNfREVWSUNF
X0ZJTFRFUj15DQoNCiMNCiMgVEkgUGFja2V0IFByb2Nlc3NvciBTdWJzeXN0ZW0NCiMNCkNPTkZJ
R19USV9QQUNLRVRfUFJPQ0VTU09SPXkNCkNPTkZJR19USV9QQUNLRVRfUFJPQ0VTU09SX1NUQVRT
PXkNCiMgQ09ORklHX1RJX1BBQ0tFVF9QUk9DRVNTT1JfRVhUX1NXSVRDSCBpcyBub3Qgc2V0DQoj
IENPTkZJR19USV9ISUxfREVCVUcgaXMgbm90IHNldA0KIyBDT05GSUdfVElfSElMX1BST0ZJTEVf
SU5UUlVTSVZFIGlzIG5vdCBzZXQNCiMgQ09ORklHX1RJX0hJTF9QUk9GSUxFX1NUQVRJQyBpcyBu
b3Qgc2V0DQpDT05GSUdfVElfSElMX1BST0ZJTEVfSU5UUlVTSVZFX1BQMks9eQ0KIyBDT05GSUdf
SU5URUxfUFBfVFVOTkVMX1NVUFBPUlQgaXMgbm90IHNldA0KQ09ORklHX0lOVEVMX0lSUV9USFJF
QURfQ0hBTkdFX1BSSU9SSVRZPXkNCkNPTkZJR19JTlRFTF9ERUZBVUxUX0lQVjZfQVVUT0NPTkZf
RElTQUJMRVNfSVBWNl9BVVRPQ09ORj15DQpDT05GSUdfSU5URUxfTUFYX0JSSURHRV9NQUNTX0xJ
TUlUPXkNCkNPTkZJR19JTlRFTF9NQVhfQlJJREdFX01BQ1M9MTAyNA0KQ09ORklHX0lOVEVMX0tF
Uk5FTF9WT0lDRV9TVVBQT1JUPXkNCkNPTkZJR19XSVJFTEVTUz15DQojIENPTkZJR19XSVJFTEVT
U19FWFQgaXMgbm90IHNldA0KIyBDT05GSUdfV0VYVF9QUklWIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0NGRzgwMjExIGlzIG5vdCBzZXQNCiMgQ09ORklHX0xJQjgwMjExIGlzIG5vdCBzZXQNCg0KIw0K
IyBDRkc4MDIxMSBuZWVkcyB0byBiZSBlbmFibGVkIGZvciBNQUM4MDIxMQ0KIw0KIyBDT05GSUdf
V0lNQVggaXMgbm90IHNldA0KIyBDT05GSUdfUkZLSUxMIGlzIG5vdCBzZXQNCiMgQ09ORklHX05F
VF85UCBpcyBub3Qgc2V0DQojIENPTkZJR19DQUlGIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NFUEhf
TElCIGlzIG5vdCBzZXQNCg0KIw0KIyBEZXZpY2UgRHJpdmVycw0KIw0KDQojDQojIEdlbmVyaWMg
RHJpdmVyIE9wdGlvbnMNCiMNCkNPTkZJR19VRVZFTlRfSEVMUEVSX1BBVEg9IiINCiMgQ09ORklH
X0RFVlRNUEZTIGlzIG5vdCBzZXQNCkNPTkZJR19TVEFOREFMT05FPXkNCkNPTkZJR19QUkVWRU5U
X0ZJUk1XQVJFX0JVSUxEPXkNCkNPTkZJR19GV19MT0FERVI9eQ0KQ09ORklHX0ZJUk1XQVJFX0lO
X0tFUk5FTD15DQpDT05GSUdfRVhUUkFfRklSTVdBUkU9IiINCiMgQ09ORklHX1NZU19IWVBFUlZJ
U09SIGlzIG5vdCBzZXQNCkNPTkZJR19BUkNIX05PX1NZU0RFVl9PUFM9eQ0KIyBDT05GSUdfQ09O
TkVDVE9SIGlzIG5vdCBzZXQNCkNPTkZJR19NVEQ9eQ0KIyBDT05GSUdfTVREX0RFQlVHIGlzIG5v
dCBzZXQNCiMgQ09ORklHX01URF9URVNUUyBpcyBub3Qgc2V0DQpDT05GSUdfTVREX1BBUlRJVElP
TlM9eQ0KIyBDT05GSUdfTVREX1JFREJPT1RfUEFSVFMgaXMgbm90IHNldA0KQ09ORklHX01URF9D
TURMSU5FX1BBUlRTPXkNCkNPTkZJR19NVERfQVI3X1BBUlRTPXkNCg0KIw0KIyBVc2VyIE1vZHVs
ZXMgQW5kIFRyYW5zbGF0aW9uIExheWVycw0KIw0KQ09ORklHX01URF9DSEFSPXkNCkNPTkZJR19N
VERfQkxLREVWUz15DQpDT05GSUdfTVREX0JMT0NLPXkNCiMgQ09ORklHX0ZUTCBpcyBub3Qgc2V0
DQojIENPTkZJR19ORlRMIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lORlRMIGlzIG5vdCBzZXQNCiMg
Q09ORklHX1JGRF9GVEwgaXMgbm90IHNldA0KIyBDT05GSUdfU1NGREMgaXMgbm90IHNldA0KIyBD
T05GSUdfU01fRlRMIGlzIG5vdCBzZXQNCiMgQ09ORklHX01URF9PT1BTIGlzIG5vdCBzZXQNCg0K
Iw0KIyBSQU0vUk9NL0ZsYXNoIGNoaXAgZHJpdmVycw0KIw0KIyBDT05GSUdfTVREX0NGSSBpcyBu
b3Qgc2V0DQojIENPTkZJR19NVERfSkVERUNQUk9CRSBpcyBub3Qgc2V0DQpDT05GSUdfTVREX01B
UF9CQU5LX1dJRFRIXzE9eQ0KQ09ORklHX01URF9NQVBfQkFOS19XSURUSF8yPXkNCkNPTkZJR19N
VERfTUFQX0JBTktfV0lEVEhfND15DQojIENPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfOCBpcyBu
b3Qgc2V0DQojIENPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMTYgaXMgbm90IHNldA0KIyBDT05G
SUdfTVREX01BUF9CQU5LX1dJRFRIXzMyIGlzIG5vdCBzZXQNCkNPTkZJR19NVERfQ0ZJX0kxPXkN
CkNPTkZJR19NVERfQ0ZJX0kyPXkNCiMgQ09ORklHX01URF9DRklfSTQgaXMgbm90IHNldA0KIyBD
T05GSUdfTVREX0NGSV9JOCBpcyBub3Qgc2V0DQojIENPTkZJR19NVERfUkFNIGlzIG5vdCBzZXQN
CiMgQ09ORklHX01URF9ST00gaXMgbm90IHNldA0KIyBDT05GSUdfTVREX0FCU0VOVCBpcyBub3Qg
c2V0DQoNCiMNCiMgTWFwcGluZyBkcml2ZXJzIGZvciBjaGlwIGFjY2Vzcw0KIw0KIyBDT05GSUdf
TVREX0NPTVBMRVhfTUFQUElOR1MgaXMgbm90IHNldA0KIyBDT05GSUdfTVREX1RTNTUwMCBpcyBu
b3Qgc2V0DQojIENPTkZJR19NVERfSU5URUxfVlJfTk9SIGlzIG5vdCBzZXQNCiMgQ09ORklHX01U
RF9QTEFUUkFNIGlzIG5vdCBzZXQNCg0KIw0KIyBTZWxmLWNvbnRhaW5lZCBNVEQgZGV2aWNlIGRy
aXZlcnMNCiMNCiMgQ09ORklHX01URF9QTUM1NTEgaXMgbm90IHNldA0KIyBDT05GSUdfTVREX0RB
VEFGTEFTSCBpcyBub3Qgc2V0DQojIENPTkZJR19NVERfTTI1UDgwIGlzIG5vdCBzZXQNCiMgQ09O
RklHX01URF9TU1QyNUwgaXMgbm90IHNldA0KIyBDT05GSUdfTVREX1NMUkFNIGlzIG5vdCBzZXQN
CkNPTkZJR19NVERfUEhSQU09eQ0KIyBDT05GSUdfTVREX01URFJBTSBpcyBub3Qgc2V0DQojIENP
TkZJR19NVERfQkxPQ0syTVREIGlzIG5vdCBzZXQNCg0KIw0KIyBEaXNrLU9uLUNoaXAgRGV2aWNl
IERyaXZlcnMNCiMNCiMgQ09ORklHX01URF9ET0MyMDAwIGlzIG5vdCBzZXQNCiMgQ09ORklHX01U
RF9ET0MyMDAxIGlzIG5vdCBzZXQNCiMgQ09ORklHX01URF9ET0MyMDAxUExVUyBpcyBub3Qgc2V0
DQpDT05GSUdfTVREX1NGTD15DQpDT05GSUdfU0ZMX1NGST0xDQpDT05GSUdfU0ZMX0ZBU1RfUkVB
RD0wDQpDT05GSUdfU0ZMX05PUk1BTF9SRUFEX01PREU9eQ0KIyBDT05GSUdfU0ZMX0ZBU1RfUkVB
RF9NT0RFIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NGTF9EVUFMX0ZBU1RfUkVBRF9NT0RFIGlzIG5v
dCBzZXQNCkNPTkZJR19BVkFMQU5DSEVfU0ZMX0NMSz00MDAwMDAwMA0KIyBDT05GSUdfU0ZMX0VY
VEVOREVEX0ZMQVNIIGlzIG5vdCBzZXQNCiMgQ09ORklHX01URF9OQU5EIGlzIG5vdCBzZXQNCiMg
Q09ORklHX01URF9PTkVOQU5EIGlzIG5vdCBzZXQNCg0KIw0KIyBMUEREUiBmbGFzaCBtZW1vcnkg
ZHJpdmVycw0KIw0KIyBDT05GSUdfTVREX0xQRERSIGlzIG5vdCBzZXQNCiMgQ09ORklHX01URF9V
QkkgaXMgbm90IHNldA0KIyBDT05GSUdfUEFSUE9SVCBpcyBub3Qgc2V0DQpDT05GSUdfUE5QPXkN
CkNPTkZJR19QTlBfREVCVUdfTUVTU0FHRVM9eQ0KDQojDQojIFByb3RvY29scw0KIw0KQ09ORklH
X1BOUEFDUEk9eQ0KQ09ORklHX0JMS19ERVY9eQ0KIyBDT05GSUdfQkxLX0RFVl9GRCBpcyBub3Qg
c2V0DQojIENPTkZJR19CTEtfQ1BRX0RBIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JMS19DUFFfQ0lT
U19EQSBpcyBub3Qgc2V0DQojIENPTkZJR19CTEtfREVWX0RBQzk2MCBpcyBub3Qgc2V0DQojIENP
TkZJR19CTEtfREVWX1VNRU0gaXMgbm90IHNldA0KIyBDT05GSUdfQkxLX0RFVl9DT1dfQ09NTU9O
IGlzIG5vdCBzZXQNCiMgQ09ORklHX0JMS19ERVZfTE9PUCBpcyBub3Qgc2V0DQoNCiMNCiMgRFJC
RCBkaXNhYmxlZCBiZWNhdXNlIFBST0NfRlMsIElORVQgb3IgQ09OTkVDVE9SIG5vdCBzZWxlY3Rl
ZA0KIw0KIyBDT05GSUdfQkxLX0RFVl9OQkQgaXMgbm90IHNldA0KIyBDT05GSUdfQkxLX0RFVl9T
WDggaXMgbm90IHNldA0KIyBDT05GSUdfQkxLX0RFVl9VQiBpcyBub3Qgc2V0DQojIENPTkZJR19C
TEtfREVWX1JBTSBpcyBub3Qgc2V0DQojIENPTkZJR19DRFJPTV9QS1RDRFZEIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0FUQV9PVkVSX0VUSCBpcyBub3Qgc2V0DQojIENPTkZJR19CTEtfREVWX0hEIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQNCiMgQ09ORklHX01JU0Nf
REVWSUNFUyBpcyBub3Qgc2V0DQpDT05GSUdfSEFWRV9JREU9eQ0KIyBDT05GSUdfSURFIGlzIG5v
dCBzZXQNCg0KIw0KIyBTQ1NJIGRldmljZSBzdXBwb3J0DQojDQpDT05GSUdfU0NTSV9NT0Q9eQ0K
IyBDT05GSUdfUkFJRF9BVFRSUyBpcyBub3Qgc2V0DQojIENPTkZJR19TQ1NJIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1NDU0lfRE1BIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NDU0lfTkVUTElOSyBpcyBu
b3Qgc2V0DQojIENPTkZJR19BVEEgaXMgbm90IHNldA0KIyBDT05GSUdfTUQgaXMgbm90IHNldA0K
IyBDT05GSUdfRlVTSU9OIGlzIG5vdCBzZXQNCg0KIw0KIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBz
dXBwb3J0DQojDQojIENPTkZJR19GSVJFV0lSRSBpcyBub3Qgc2V0DQojIENPTkZJR19GSVJFV0lS
RV9OT1NZIGlzIG5vdCBzZXQNCiMgQ09ORklHX0kyTyBpcyBub3Qgc2V0DQojIENPTkZJR19NQUNJ
TlRPU0hfRFJJVkVSUyBpcyBub3Qgc2V0DQpDT05GSUdfTkVUREVWSUNFUz15DQojIENPTkZJR19E
VU1NWSBpcyBub3Qgc2V0DQojIENPTkZJR19CT05ESU5HIGlzIG5vdCBzZXQNCkNPTkZJR19NQUNW
TEFOPXkNCiMgQ09ORklHX01BQ1ZUQVAgaXMgbm90IHNldA0KIyBDT05GSUdfRVFVQUxJWkVSIGlz
IG5vdCBzZXQNCiMgQ09ORklHX1RVTiBpcyBub3Qgc2V0DQojIENPTkZJR19WRVRIIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX05FVF9TQjEwMDAgaXMgbm90IHNldA0KIyBDT05GSUdfQVJDTkVUIGlzIG5v
dCBzZXQNCiMgQ09ORklHX01JSSBpcyBub3Qgc2V0DQojIENPTkZJR19QSFlMSUIgaXMgbm90IHNl
dA0KIyBDT05GSUdfTkVUX0VUSEVSTkVUIGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVERFVl8xMDAw
IGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVERFVl8xMDAwMCBpcyBub3Qgc2V0DQojIENPTkZJR19U
UiBpcyBub3Qgc2V0DQojIENPTkZJR19XTEFOIGlzIG5vdCBzZXQNCg0KIw0KIyBFbmFibGUgV2lN
QVggKE5ldHdvcmtpbmcgb3B0aW9ucykgdG8gc2VlIHRoZSBXaU1BWCBkcml2ZXJzDQojDQoNCiMN
CiMgVVNCIE5ldHdvcmsgQWRhcHRlcnMNCiMNCiMgQ09ORklHX1VTQl9DQVRDIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1VTQl9LQVdFVEggaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX1BFR0FTVVMgaXMg
bm90IHNldA0KIyBDT05GSUdfVVNCX1JUTDgxNTAgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX1VT
Qk5FVCBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfSVBIRVRIIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1dBTiBpcyBub3Qgc2V0DQoNCiMNCiMgQ0FJRiB0cmFuc3BvcnQgZHJpdmVycw0KIw0KIyBDT05G
SUdfRkRESSBpcyBub3Qgc2V0DQojIENPTkZJR19ISVBQSSBpcyBub3Qgc2V0DQpDT05GSUdfUFBQ
PXkNCkNPTkZJR19QUFBfTVVMVElMSU5LPXkNCiMgQ09ORklHX1BQUF9GSUxURVIgaXMgbm90IHNl
dA0KIyBDT05GSUdfUFBQX0FTWU5DIGlzIG5vdCBzZXQNCiMgQ09ORklHX1BQUF9TWU5DX1RUWSBp
cyBub3Qgc2V0DQojIENPTkZJR19QUFBfREVGTEFURSBpcyBub3Qgc2V0DQojIENPTkZJR19QUFBf
QlNEQ09NUCBpcyBub3Qgc2V0DQojIENPTkZJR19QUFBfTVBQRSBpcyBub3Qgc2V0DQpDT05GSUdf
UFBQT0U9eQ0KQ09ORklHX1BQVFA9eQ0KQ09ORklHX1BQUE9MMlRQPXkNCiMgQ09ORklHX1NMSVAg
aXMgbm90IHNldA0KQ09ORklHX1NMSEM9eQ0KIyBDT05GSUdfTkVUQ09OU09MRSBpcyBub3Qgc2V0
DQojIENPTkZJR19ORVRQT0xMIGlzIG5vdCBzZXQNCiMgQ09ORklHX05FVF9QT0xMX0NPTlRST0xM
RVIgaXMgbm90IHNldA0KIyBDT05GSUdfVk1YTkVUMyBpcyBub3Qgc2V0DQojIENPTkZJR19JU0RO
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1BIT05FIGlzIG5vdCBzZXQNCg0KIw0KIyBJbnB1dCBkZXZp
Y2Ugc3VwcG9ydA0KIw0KIyBDT05GSUdfSU5QVVQgaXMgbm90IHNldA0KDQojDQojIEhhcmR3YXJl
IEkvTyBwb3J0cw0KIw0KIyBDT05GSUdfU0VSSU8gaXMgbm90IHNldA0KIyBDT05GSUdfR0FNRVBP
UlQgaXMgbm90IHNldA0KDQojDQojIENoYXJhY3RlciBkZXZpY2VzDQojDQojIENPTkZJR19WVCBp
cyBub3Qgc2V0DQpDT05GSUdfVU5JWDk4X1BUWVM9eQ0KIyBDT05GSUdfREVWUFRTX01VTFRJUExF
X0lOU1RBTkNFUyBpcyBub3Qgc2V0DQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBub3Qgc2V0DQoj
IENPTkZJR19TRVJJQUxfTk9OU1RBTkRBUkQgaXMgbm90IHNldA0KIyBDT05GSUdfTk9aT01JIGlz
IG5vdCBzZXQNCiMgQ09ORklHX05fR1NNIGlzIG5vdCBzZXQNCkNPTkZJR19ERVZLTUVNPXkNCg0K
Iw0KIyBTZXJpYWwgZHJpdmVycw0KIw0KQ09ORklHX1NFUklBTF84MjUwPXkNCkNPTkZJR19TRVJJ
QUxfODI1MF9DT05TT0xFPXkNCkNPTkZJR19GSVhfRUFSTFlDT05fTUVNPXkNCkNPTkZJR19TRVJJ
QUxfODI1MF9QQ0k9eQ0KQ09ORklHX1NFUklBTF84MjUwX1BOUD15DQpDT05GSUdfU0VSSUFMXzgy
NTBfTlJfVUFSVFM9Mw0KQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9Mw0KIyBDT05G
SUdfU0VSSUFMXzgyNTBfRVhURU5ERUQgaXMgbm90IHNldA0KDQojDQojIE5vbi04MjUwIHNlcmlh
bCBwb3J0IHN1cHBvcnQNCiMNCiMgQ09ORklHX1NFUklBTF9NQVgzMTAwIGlzIG5vdCBzZXQNCiMg
Q09ORklHX1NFUklBTF9NQVgzMTA3IGlzIG5vdCBzZXQNCiMgQ09ORklHX1NFUklBTF9NRkRfSFNV
IGlzIG5vdCBzZXQNCkNPTkZJR19TRVJJQUxfQ09SRT15DQpDT05GSUdfU0VSSUFMX0NPUkVfQ09O
U09MRT15DQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NFUklBTF9U
SU1CRVJEQUxFIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NFUklBTF9BTFRFUkFfSlRBR1VBUlQgaXMg
bm90IHNldA0KIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9VQVJUIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1NFUklBTF9QQ0hfVUFSVCBpcyBub3Qgc2V0DQojIENPTkZJR19UVFlfUFJJTlRLIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0lQTUlfSEFORExFUiBpcyBub3Qgc2V0DQojIENPTkZJR19IV19SQU5ET00g
aXMgbm90IHNldA0KIyBDT05GSUdfTlZSQU0gaXMgbm90IHNldA0KIyBDT05GSUdfUlRDIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0dFTl9SVEMgaXMgbm90IHNldA0KIyBDT05GSUdfUjM5NjQgaXMgbm90
IHNldA0KIyBDT05GSUdfQVBQTElDT00gaXMgbm90IHNldA0KIyBDT05GSUdfTVdBVkUgaXMgbm90
IHNldA0KIyBDT05GSUdfUkFXX0RSSVZFUiBpcyBub3Qgc2V0DQojIENPTkZJR19IUEVUIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0hBTkdDSEVDS19USU1FUiBpcyBub3Qgc2V0DQojIENPTkZJR19UQ0df
VFBNIGlzIG5vdCBzZXQNCiMgQ09ORklHX1RFTENMT0NLIGlzIG5vdCBzZXQNCkNPTkZJR19ERVZQ
T1JUPXkNCiMgQ09ORklHX1JBTU9PUFMgaXMgbm90IHNldA0KQ09ORklHX0kyQz15DQpDT05GSUdf
STJDX0JPQVJESU5GTz15DQpDT05GSUdfSTJDX0NPTVBBVD15DQpDT05GSUdfSTJDX0NIQVJERVY9
eQ0KIyBDT05GSUdfSTJDX01VWCBpcyBub3Qgc2V0DQpDT05GSUdfSTJDX0hFTFBFUl9BVVRPPXkN
Cg0KIw0KIyBJMkMgQWxnb3JpdGhtcw0KIw0KIyBDT05GSUdfSTJDX0FMR09CSVQgaXMgbm90IHNl
dA0KIyBDT05GSUdfSTJDX0FMR09QQ0YgaXMgbm90IHNldA0KIyBDT05GSUdfSTJDX0FMR09QQ0Eg
aXMgbm90IHNldA0KDQojDQojIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydA0KIw0KDQojDQojIFBD
IFNNQnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzDQojDQojIENPTkZJR19JMkNfQUxJMTUzNSBp
cyBub3Qgc2V0DQojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNf
QUxJMTVYMyBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNfQU1ENzU2IGlzIG5vdCBzZXQNCiMgQ09O
RklHX0kyQ19BTUQ4MTExIGlzIG5vdCBzZXQNCiMgQ09ORklHX0kyQ19JODAxIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0kyQ19JU0NIIGlzIG5vdCBzZXQNCiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qg
c2V0DQojIENPTkZJR19JMkNfTkZPUkNFMiBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNfU0lTNTU5
NSBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5vdCBzZXQNCiMgQ09ORklHX0ky
Q19TSVM5NlggaXMgbm90IHNldA0KIyBDT05GSUdfSTJDX1ZJQSBpcyBub3Qgc2V0DQojIENPTkZJ
R19JMkNfVklBUFJPIGlzIG5vdCBzZXQNCg0KIw0KIyBBQ1BJIGRyaXZlcnMNCiMNCiMgQ09ORklH
X0kyQ19TQ01JIGlzIG5vdCBzZXQNCg0KIw0KIyBJMkMgc3lzdGVtIGJ1cyBkcml2ZXJzIChtb3N0
bHkgZW1iZWRkZWQgLyBzeXN0ZW0tb24tY2hpcCkNCiMNCiMgQ09ORklHX0kyQ19JTlRFTF9NSUQg
aXMgbm90IHNldA0KIyBDT05GSUdfSTJDX09DT1JFUyBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNf
UENBX1BMQVRGT1JNIGlzIG5vdCBzZXQNCiMgQ09ORklHX0kyQ19QWEFfUENJIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0kyQ19TSU1URUMgaXMgbm90IHNldA0KIyBDT05GSUdfSTJDX1hJTElOWCBpcyBu
b3Qgc2V0DQojIENPTkZJR19JMkNfRUcyMFQgaXMgbm90IHNldA0KDQojDQojIEV4dGVybmFsIEky
Qy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMNCiMNCiMgQ09ORklHX0kyQ19ESU9MQU5fVTJDIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0kyQ19QQVJQT1JUX0xJR0hUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0ky
Q19UQU9TX0VWTSBpcyBub3Qgc2V0DQojIENPTkZJR19JMkNfVElOWV9VU0IgaXMgbm90IHNldA0K
DQojDQojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVycw0KIw0KIyBDT05GSUdfSTJDX1NUVUIg
aXMgbm90IHNldA0KIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldA0KIyBDT05GSUdf
STJDX0RFQlVHX0FMR08gaXMgbm90IHNldA0KIyBDT05GSUdfSTJDX0RFQlVHX0JVUyBpcyBub3Qg
c2V0DQpDT05GSUdfU1BJPXkNCkNPTkZJR19TUElfTUFTVEVSPXkNCg0KIw0KIyBTUEkgTWFzdGVy
IENvbnRyb2xsZXIgRHJpdmVycw0KIw0KIyBDT05GSUdfU1BJX0FMVEVSQSBpcyBub3Qgc2V0DQoj
IENPTkZJR19TUElfQklUQkFORyBpcyBub3Qgc2V0DQojIENPTkZJR19TUElfUFhBMlhYX1BDSSBp
cyBub3Qgc2V0DQojIENPTkZJR19TUElfVE9QQ0xJRkZfUENIIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1NQSV9YSUxJTlggaXMgbm90IHNldA0KIyBDT05GSUdfU1BJX0RFU0lHTldBUkUgaXMgbm90IHNl
dA0KDQojDQojIFNQSSBQcm90b2NvbCBNYXN0ZXJzDQojDQojIENPTkZJR19TUElfU1BJREVWIGlz
IG5vdCBzZXQNCiMgQ09ORklHX1NQSV9UTEU2MlgwIGlzIG5vdCBzZXQNCg0KIw0KIyBQUFMgc3Vw
cG9ydA0KIw0KIyBDT05GSUdfUFBTIGlzIG5vdCBzZXQNCg0KIw0KIyBQUFMgZ2VuZXJhdG9ycyBz
dXBwb3J0DQojDQpDT05GSUdfQVJDSF9XQU5UX09QVElPTkFMX0dQSU9MSUI9eQ0KIyBDT05GSUdf
R1BJT0xJQiBpcyBub3Qgc2V0DQojIENPTkZJR19XMSBpcyBub3Qgc2V0DQpDT05GSUdfUE9XRVJf
U1VQUExZPXkNCiMgQ09ORklHX1BPV0VSX1NVUFBMWV9ERUJVRyBpcyBub3Qgc2V0DQojIENPTkZJ
R19QREFfUE9XRVIgaXMgbm90IHNldA0KIyBDT05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0DQoj
IENPTkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0DQojIENPTkZJR19CQVRURVJZX0JRMjBa
NzUgaXMgbm90IHNldA0KIyBDT05GSUdfQkFUVEVSWV9CUTI3eDAwIGlzIG5vdCBzZXQNCiMgQ09O
RklHX0JBVFRFUllfTUFYMTcwNDAgaXMgbm90IHNldA0KIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0
MiBpcyBub3Qgc2V0DQojIENPTkZJR19IV01PTiBpcyBub3Qgc2V0DQpDT05GSUdfVEhFUk1BTD15
DQpDT05GSUdfV0FUQ0hET0c9eQ0KQ09ORklHX1dBVENIRE9HX05PV0FZT1VUPXkNCg0KIw0KIyBX
YXRjaGRvZyBEZXZpY2UgRHJpdmVycw0KIw0KIyBDT05GSUdfU09GVF9XQVRDSERPRyBpcyBub3Qg
c2V0DQojIENPTkZJR19BQ1FVSVJFX1dEVCBpcyBub3Qgc2V0DQojIENPTkZJR19BRFZBTlRFQ0hf
V0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0FMSU0xNTM1X1dEVCBpcyBub3Qgc2V0DQojIENPTkZJ
R19BTElNNzEwMV9XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfRjcxODA4RV9XRFQgaXMgbm90IHNl
dA0KIyBDT05GSUdfU1A1MTAwX1RDTyBpcyBub3Qgc2V0DQojIENPTkZJR19TQzUyMF9XRFQgaXMg
bm90IHNldA0KIyBDT05GSUdfU0JDX0ZJVFBDMl9XQVRDSERPRyBpcyBub3Qgc2V0DQojIENPTkZJ
R19FVVJPVEVDSF9XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfSUI3MDBfV0RUIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0lCTUFTUiBpcyBub3Qgc2V0DQojIENPTkZJR19XQUZFUl9XRFQgaXMgbm90IHNl
dA0KIyBDT05GSUdfSTYzMDBFU0JfV0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lUQ09fV0RUIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0lUODcxMkZfV0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lUODdf
V0RUIGlzIG5vdCBzZXQNCkNPTkZJR19IUF9XQVRDSERPRz1tDQpDT05GSUdfSFBXRFRfTk1JX0RF
Q09ESU5HPXkNCiMgQ09ORklHX1NDMTIwMF9XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfUEM4NzQx
M19XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfTlZfVENPIGlzIG5vdCBzZXQNCiMgQ09ORklHXzYw
WFhfV0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NCQzgzNjBfV0RUIGlzIG5vdCBzZXQNCiMgQ09O
RklHX0NQVTVfV0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NNU0NfU0NIMzExWF9XRFQgaXMgbm90
IHNldA0KIyBDT05GSUdfU01TQzM3Qjc4N19XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfVzgzNjI3
SEZfV0RUIGlzIG5vdCBzZXQNCiMgQ09ORklHX1c4MzY5N0hGX1dEVCBpcyBub3Qgc2V0DQojIENP
TkZJR19XODM2OTdVR19XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfVzgzODc3Rl9XRFQgaXMgbm90
IHNldA0KIyBDT05GSUdfVzgzOTc3Rl9XRFQgaXMgbm90IHNldA0KIyBDT05GSUdfTUFDSFpfV0RU
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1NCQ19FUFhfQzNfV0FUQ0hET0cgaXMgbm90IHNldA0KDQoj
DQojIFBDSS1iYXNlZCBXYXRjaGRvZyBDYXJkcw0KIw0KIyBDT05GSUdfUENJUENXQVRDSERPRyBp
cyBub3Qgc2V0DQojIENPTkZJR19XRFRQQ0kgaXMgbm90IHNldA0KDQojDQojIFVTQi1iYXNlZCBX
YXRjaGRvZyBDYXJkcw0KIw0KIyBDT05GSUdfVVNCUENXQVRDSERPRyBpcyBub3Qgc2V0DQpDT05G
SUdfU1NCX1BPU1NJQkxFPXkNCg0KIw0KIyBTb25pY3MgU2lsaWNvbiBCYWNrcGxhbmUNCiMNCiMg
Q09ORklHX1NTQiBpcyBub3Qgc2V0DQpDT05GSUdfTUZEX1NVUFBPUlQ9eQ0KIyBDT05GSUdfTUZE
X0NPUkUgaXMgbm90IHNldA0KIyBDT05GSUdfTUZEXzg4UE04NjBYIGlzIG5vdCBzZXQNCiMgQ09O
RklHX01GRF9TTTUwMSBpcyBub3Qgc2V0DQojIENPTkZJR19IVENfUEFTSUMzIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1RQUzYxMDVYIGlzIG5vdCBzZXQNCiMgQ09ORklHX1RQUzY1MDdYIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX1RXTDQwMzBfQ09SRSBpcyBub3Qgc2V0DQojIENPTkZJR19NRkRfU1RNUEUg
aXMgbm90IHNldA0KIyBDT05GSUdfTUZEX1RDMzU4OVggaXMgbm90IHNldA0KIyBDT05GSUdfTUZE
X1RNSU8gaXMgbm90IHNldA0KIyBDT05GSUdfUE1JQ19EQTkwM1ggaXMgbm90IHNldA0KIyBDT05G
SUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQNCiMgQ09ORklHX01GRF9NQVg4OTI1IGlzIG5vdCBz
ZXQNCiMgQ09ORklHX01GRF9NQVg4OTk3IGlzIG5vdCBzZXQNCiMgQ09ORklHX01GRF9NQVg4OTk4
IGlzIG5vdCBzZXQNCiMgQ09ORklHX01GRF9XTTg0MDAgaXMgbm90IHNldA0KIyBDT05GSUdfTUZE
X1dNODMxWF9JMkMgaXMgbm90IHNldA0KIyBDT05GSUdfTUZEX1dNODMxWF9TUEkgaXMgbm90IHNl
dA0KIyBDT05GSUdfTUZEX1dNODM1MF9JMkMgaXMgbm90IHNldA0KIyBDT05GSUdfTUZEX1dNODk5
NCBpcyBub3Qgc2V0DQojIENPTkZJR19NRkRfUENGNTA2MzMgaXMgbm90IHNldA0KIyBDT05GSUdf
TUZEX01DMTNYWFggaXMgbm90IHNldA0KIyBDT05GSUdfQUJYNTAwX0NPUkUgaXMgbm90IHNldA0K
IyBDT05GSUdfRVpYX1BDQVAgaXMgbm90IHNldA0KIyBDT05GSUdfTUZEX0NTNTUzNSBpcyBub3Qg
c2V0DQojIENPTkZJR19MUENfU0NIIGlzIG5vdCBzZXQNCiMgQ09ORklHX01GRF9SREMzMjFYIGlz
IG5vdCBzZXQNCiMgQ09ORklHX01GRF9KQU5aX0NNT0RJTyBpcyBub3Qgc2V0DQojIENPTkZJR19N
RkRfVlg4NTUgaXMgbm90IHNldA0KIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1JFR1VMQVRPUiBpcyBub3Qgc2V0DQojIENPTkZJR19NRURJQV9TVVBQT1JUIGlz
IG5vdCBzZXQNCg0KIw0KIyBHcmFwaGljcyBzdXBwb3J0DQojDQojIENPTkZJR19BR1AgaXMgbm90
IHNldA0KQ09ORklHX1ZHQV9BUkI9eQ0KQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9MTYNCiMgQ09O
RklHX1ZHQV9TV0lUQ0hFUk9PIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NUVUJfUE9VTFNCTyBpcyBu
b3Qgc2V0DQojIENPTkZJR19WR0FTVEFURSBpcyBub3Qgc2V0DQojIENPTkZJR19WSURFT19PVVRQ
VVRfQ09OVFJPTCBpcyBub3Qgc2V0DQojIENPTkZJR19GQiBpcyBub3Qgc2V0DQojIENPTkZJR19C
QUNLTElHSFRfTENEX1NVUFBPUlQgaXMgbm90IHNldA0KDQojDQojIERpc3BsYXkgZGV2aWNlIHN1
cHBvcnQNCiMNCiMgQ09ORklHX0RJU1BMQVlfU1VQUE9SVCBpcyBub3Qgc2V0DQojIENPTkZJR19T
T1VORCBpcyBub3Qgc2V0DQpDT05GSUdfVVNCX1NVUFBPUlQ9eQ0KQ09ORklHX1VTQl9BUkNIX0hB
U19IQ0Q9eQ0KQ09ORklHX1VTQl9BUkNIX0hBU19PSENJPXkNCkNPTkZJR19VU0JfQVJDSF9IQVNf
RUhDST15DQpDT05GSUdfVVNCPW0NCiMgQ09ORklHX1VTQl9ERUJVRyBpcyBub3Qgc2V0DQojIENP
TkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVMgaXMgbm90IHNldA0KDQojDQojIE1pc2NlbGxh
bmVvdXMgVVNCIG9wdGlvbnMNCiMNCkNPTkZJR19VU0JfREVWSUNFRlM9eQ0KQ09ORklHX1VTQl9E
RVZJQ0VfQ0xBU1M9eQ0KIyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQNCiMg
Q09ORklHX1VTQl9PVEdfV0hJVEVMSVNUIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9PVEdfQkxB
Q0tMSVNUX0hVQiBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfTU9OIGlzIG5vdCBzZXQNCiMgQ09O
RklHX1VTQl9XVVNCIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9XVVNCX0NCQUYgaXMgbm90IHNl
dA0KDQojDQojIFVTQiBIb3N0IENvbnRyb2xsZXIgRHJpdmVycw0KIw0KIyBDT05GSUdfVVNCX0M2
N1gwMF9IQ0QgaXMgbm90IHNldA0KQ09ORklHX1VTQl9YSENJX0hDRD1tDQojIENPTkZJR19VU0Jf
WEhDSV9IQ0RfREVCVUdHSU5HIGlzIG5vdCBzZXQNCkNPTkZJR19VU0JfRUhDSV9IQ0Q9bQ0KQ09O
RklHX1VTQl9FSENJX1JPT1RfSFVCX1RUPXkNCkNPTkZJR19VU0JfRUhDSV9UVF9ORVdTQ0hFRD15
DQojIENPTkZJR19VU0JfT1hVMjEwSFBfSENEIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9JU1Ax
MTZYX0hDRCBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfSVNQMTc2MF9IQ0QgaXMgbm90IHNldA0K
IyBDT05GSUdfVVNCX0lTUDEzNjJfSENEIGlzIG5vdCBzZXQNCkNPTkZJR19VU0JfT0hDSV9IQ0Q9
bQ0KIyBDT05GSUdfVVNCX09IQ0lfQklHX0VORElBTl9ERVNDIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1VTQl9PSENJX0JJR19FTkRJQU5fTU1JTyBpcyBub3Qgc2V0DQpDT05GSUdfVVNCX09IQ0lfTElU
VExFX0VORElBTj15DQpDT05GSUdfVVNCX1VIQ0lfSENEPW0NCiMgQ09ORklHX1VTQl9TTDgxMV9I
Q0QgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX1I4QTY2NTk3X0hDRCBpcyBub3Qgc2V0DQojIENP
TkZJR19VU0JfV0hDSV9IQ0QgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX0hXQV9IQ0QgaXMgbm90
IHNldA0KDQojDQojIEVuYWJsZSBIb3N0IG9yIEdhZGdldCBzdXBwb3J0IHRvIHNlZSBJbnZlbnRy
YSBvcHRpb25zDQojDQoNCiMNCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzDQojDQojIENPTkZJ
R19VU0JfQUNNIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9QUklOVEVSIGlzIG5vdCBzZXQNCiMg
Q09ORklHX1VTQl9XRE0gaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX1RNQyBpcyBub3Qgc2V0DQoN
CiMNCiMgTk9URTogVVNCX1NUT1JBR0UgZGVwZW5kcyBvbiBTQ1NJIGJ1dCBCTEtfREVWX1NEIG1h
eQ0KIw0KDQojDQojIGFsc28gYmUgbmVlZGVkOyBzZWUgVVNCX1NUT1JBR0UgSGVscCBmb3IgbW9y
ZSBpbmZvDQojDQojIENPTkZJR19VU0JfTElCVVNVQUwgaXMgbm90IHNldA0KDQojDQojIFVTQiBJ
bWFnaW5nIGRldmljZXMNCiMNCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90IHNldA0KDQojDQoj
IFVTQiBwb3J0IGRyaXZlcnMNCiMNCiMgQ09ORklHX1VTQl9TRVJJQUwgaXMgbm90IHNldA0KDQoj
DQojIFVTQiBNaXNjZWxsYW5lb3VzIGRyaXZlcnMNCiMNCiMgQ09ORklHX1VTQl9FTUk2MiBpcyBu
b3Qgc2V0DQojIENPTkZJR19VU0JfRU1JMjYgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX0FEVVRV
WCBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VT
Ql9SSU81MDAgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX0xFR09UT1dFUiBpcyBub3Qgc2V0DQoj
IENPTkZJR19VU0JfTENEIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9MRUQgaXMgbm90IHNldA0K
IyBDT05GSUdfVVNCX0NZUFJFU1NfQ1k3QzYzIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9DWVRI
RVJNIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9JRE1PVVNFIGlzIG5vdCBzZXQNCiMgQ09ORklH
X1VTQl9GVERJX0VMQU4gaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX0FQUExFRElTUExBWSBpcyBu
b3Qgc2V0DQojIENPTkZJR19VU0JfU0lTVVNCVkdBIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9M
RCBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfVFJBTkNFVklCUkFUT1IgaXMgbm90IHNldA0KIyBD
T05GSUdfVVNCX0lPV0FSUklPUiBpcyBub3Qgc2V0DQojIENPTkZJR19VU0JfVEVTVCBpcyBub3Qg
c2V0DQojIENPTkZJR19VU0JfSVNJR0hURlcgaXMgbm90IHNldA0KIyBDT05GSUdfVVNCX1lVUkVY
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1VTQl9HQURHRVQgaXMgbm90IHNldA0KDQojDQojIE9URyBh
bmQgcmVsYXRlZCBpbmZyYXN0cnVjdHVyZQ0KIw0KIyBDT05GSUdfTk9QX1VTQl9YQ0VJViBpcyBu
b3Qgc2V0DQojIENPTkZJR19VV0IgaXMgbm90IHNldA0KQ09ORklHX01NQz15DQojIENPTkZJR19N
TUNfREVCVUcgaXMgbm90IHNldA0KIyBDT05GSUdfTU1DX1VOU0FGRV9SRVNVTUUgaXMgbm90IHNl
dA0KIyBDT05GSUdfTU1DX0NMS0dBVEUgaXMgbm90IHNldA0KDQojDQojIE1NQy9TRC9TRElPIENh
cmQgRHJpdmVycw0KIw0KQ09ORklHX01NQ19CTE9DSz15DQpDT05GSUdfTU1DX0JMT0NLX01JTk9S
Uz0xNg0KQ09ORklHX01NQ19CTE9DS19CT1VOQ0U9eQ0KIyBDT05GSUdfU0RJT19VQVJUIGlzIG5v
dCBzZXQNCiMgQ09ORklHX01NQ19URVNUIGlzIG5vdCBzZXQNCg0KIw0KIyBNTUMvU0QvU0RJTyBI
b3N0IENvbnRyb2xsZXIgRHJpdmVycw0KIw0KQ09ORklHX01NQ19TREhDST15DQpDT05GSUdfTU1D
X1NESENJX0lPX0FDQ0VTU09SUz15DQojIENPTkZJR19NTUNfU0RIQ0lfUENJIGlzIG5vdCBzZXQN
CkNPTkZJR19NTUNfU0RIQ0lfUExURk09eQ0KQ09ORklHX01NQ19TREhDSV9QVU1BNj15DQpDT05G
SUdfQVJDSF9HRU4zPXkNCiMgQ09ORklHX01NQ19XQlNEIGlzIG5vdCBzZXQNCiMgQ09ORklHX01N
Q19USUZNX1NEIGlzIG5vdCBzZXQNCiMgQ09ORklHX01NQ19TUEkgaXMgbm90IHNldA0KIyBDT05G
SUdfTU1DX0NCNzEwIGlzIG5vdCBzZXQNCiMgQ09ORklHX01NQ19WSUFfU0RNTUMgaXMgbm90IHNl
dA0KIyBDT05GSUdfTU1DX1VTSEMgaXMgbm90IHNldA0KIyBDT05GSUdfTUVNU1RJQ0sgaXMgbm90
IHNldA0KIyBDT05GSUdfTkVXX0xFRFMgaXMgbm90IHNldA0KIyBDT05GSUdfTkZDX0RFVklDRVMg
aXMgbm90IHNldA0KIyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0DQojIENPTkZJR19J
TkZJTklCQU5EIGlzIG5vdCBzZXQNCiMgQ09ORklHX0VEQUMgaXMgbm90IHNldA0KIyBDT05GSUdf
UlRDX0NMQVNTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0RNQURFVklDRVMgaXMgbm90IHNldA0KIyBD
T05GSUdfQVVYRElTUExBWSBpcyBub3Qgc2V0DQojIENPTkZJR19VSU8gaXMgbm90IHNldA0KIyBD
T05GSUdfU1RBR0lORyBpcyBub3Qgc2V0DQpDT05GSUdfWDg2X1BMQVRGT1JNX0RFVklDRVM9eQ0K
IyBDT05GSUdfSU5URUxfTUVOTE9XIGlzIG5vdCBzZXQNCiMgQ09ORklHX0FDUElfV01JIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0FDUElfQVNVUyBpcyBub3Qgc2V0DQojIENPTkZJR19UT1NISUJBX0JU
X1JGS0lMTCBpcyBub3Qgc2V0DQojIENPTkZJR19BQ1BJX0NNUEMgaXMgbm90IHNldA0KIyBDT05G
SUdfSU5URUxfSVBTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lCTV9SVEwgaXMgbm90IHNldA0KDQoj
DQojIEZpcm13YXJlIERyaXZlcnMNCiMNCiMgQ09ORklHX0VERCBpcyBub3Qgc2V0DQpDT05GSUdf
RklSTVdBUkVfTUVNTUFQPXkNCiMgQ09ORklHX0RFTExfUkJVIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0RDREJBUyBpcyBub3Qgc2V0DQpDT05GSUdfRE1JSUQ9eQ0KIyBDT05GSUdfRE1JX1NZU0ZTIGlz
IG5vdCBzZXQNCiMgQ09ORklHX0lTQ1NJX0lCRlRfRklORCBpcyBub3Qgc2V0DQojIENPTkZJR19T
SUdNQSBpcyBub3Qgc2V0DQoNCiMNCiMgRmlsZSBzeXN0ZW1zDQojDQpDT05GSUdfRVhUMl9GUz15
DQpDT05GSUdfRVhUMl9GU19YQVRUUj15DQpDT05GSUdfRVhUMl9GU19QT1NJWF9BQ0w9eQ0KIyBD
T05GSUdfRVhUMl9GU19TRUNVUklUWSBpcyBub3Qgc2V0DQojIENPTkZJR19FWFQyX0ZTX1hJUCBp
cyBub3Qgc2V0DQpDT05GSUdfRVhUM19GUz15DQpDT05GSUdfRVhUM19ERUZBVUxUU19UT19PUkRF
UkVEPXkNCkNPTkZJR19FWFQzX0ZTX1hBVFRSPXkNCiMgQ09ORklHX0VYVDNfRlNfUE9TSVhfQUNM
IGlzIG5vdCBzZXQNCiMgQ09ORklHX0VYVDNfRlNfU0VDVVJJVFkgaXMgbm90IHNldA0KIyBDT05G
SUdfRVhUNF9GUyBpcyBub3Qgc2V0DQpDT05GSUdfSkJEPXkNCkNPTkZJR19GU19NQkNBQ0hFPXkN
CiMgQ09ORklHX1JFSVNFUkZTX0ZTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0pGU19GUyBpcyBub3Qg
c2V0DQojIENPTkZJR19YRlNfRlMgaXMgbm90IHNldA0KIyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qg
c2V0DQojIENPTkZJR19CVFJGU19GUyBpcyBub3Qgc2V0DQojIENPTkZJR19OSUxGUzJfRlMgaXMg
bm90IHNldA0KQ09ORklHX0ZTX1BPU0lYX0FDTD15DQpDT05GSUdfRklMRV9MT0NLSU5HPXkNCiMg
Q09ORklHX0ZTTk9USUZZIGlzIG5vdCBzZXQNCiMgQ09ORklHX0ROT1RJRlkgaXMgbm90IHNldA0K
IyBDT05GSUdfSU5PVElGWV9VU0VSIGlzIG5vdCBzZXQNCiMgQ09ORklHX0ZBTk9USUZZIGlzIG5v
dCBzZXQNCiMgQ09ORklHX1FVT1RBIGlzIG5vdCBzZXQNCiMgQ09ORklHX1FVT1RBQ1RMIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0FVVE9GUzRfRlMgaXMgbm90IHNldA0KIyBDT05GSUdfRlVTRV9GUyBp
cyBub3Qgc2V0DQpDT05GSUdfR0VORVJJQ19BQ0w9eQ0KDQojDQojIENhY2hlcw0KIw0KIyBDT05G
SUdfRlNDQUNIRSBpcyBub3Qgc2V0DQoNCiMNCiMgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcw0KIw0K
IyBDT05GSUdfSVNPOTY2MF9GUyBpcyBub3Qgc2V0DQojIENPTkZJR19VREZfRlMgaXMgbm90IHNl
dA0KDQojDQojIERPUy9GQVQvTlQgRmlsZXN5c3RlbXMNCiMNCkNPTkZJR19GQVRfRlM9eQ0KQ09O
RklHX01TRE9TX0ZTPXkNCiMgQ09ORklHX1ZGQVRfRlMgaXMgbm90IHNldA0KQ09ORklHX0ZBVF9E
RUZBVUxUX0NPREVQQUdFPTQzNw0KQ09ORklHX05URlNfRlM9eQ0KIyBDT05GSUdfTlRGU19ERUJV
RyBpcyBub3Qgc2V0DQpDT05GSUdfTlRGU19SVz15DQoNCiMNCiMgUHNldWRvIGZpbGVzeXN0ZW1z
DQojDQpDT05GSUdfUFJPQ19GUz15DQojIENPTkZJR19QUk9DX0tDT1JFIGlzIG5vdCBzZXQNCkNP
TkZJR19QUk9DX1NZU0NUTD15DQpDT05GSUdfUFJPQ19QQUdFX01PTklUT1I9eQ0KQ09ORklHX1NZ
U0ZTPXkNCkNPTkZJR19UTVBGUz15DQpDT05GSUdfVE1QRlNfUE9TSVhfQUNMPXkNCiMgQ09ORklH
X0hVR0VUTEJGUyBpcyBub3Qgc2V0DQojIENPTkZJR19IVUdFVExCX1BBR0UgaXMgbm90IHNldA0K
IyBDT05GSUdfQ09ORklHRlNfRlMgaXMgbm90IHNldA0KQ09ORklHX01JU0NfRklMRVNZU1RFTVM9
eQ0KIyBDT05GSUdfQURGU19GUyBpcyBub3Qgc2V0DQojIENPTkZJR19BRkZTX0ZTIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0hGU19GUyBpcyBub3Qgc2V0DQojIENPTkZJR19IRlNQTFVTX0ZTIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0JFRlNfRlMgaXMgbm90IHNldA0KIyBDT05GSUdfQkZTX0ZTIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0VGU19GUyBpcyBub3Qgc2V0DQpDT05GSUdfSkZGUzJfRlM9eQ0KQ09O
RklHX0pGRlMyX0ZTX0RFQlVHPTANCkNPTkZJR19KRkZTMl9GU19XUklURUJVRkZFUj15DQpDT05G
SUdfSkZGUzJfRlNfV0JVRl9WRVJJRlk9eQ0KIyBDT05GSUdfSkZGUzJfU1VNTUFSWSBpcyBub3Qg
c2V0DQojIENPTkZJR19KRkZTMl9GU19YQVRUUiBpcyBub3Qgc2V0DQpDT05GSUdfSkZGUzJfQ09N
UFJFU1NJT05fT1BUSU9OUz15DQpDT05GSUdfSkZGUzJfWkxJQj15DQojIENPTkZJR19KRkZTMl9M
Wk8gaXMgbm90IHNldA0KQ09ORklHX0pGRlMyX1JUSU1FPXkNCiMgQ09ORklHX0pGRlMyX1JVQklO
IGlzIG5vdCBzZXQNCiMgQ09ORklHX0pGRlMyX0NNT0RFX05PTkUgaXMgbm90IHNldA0KIyBDT05G
SUdfSkZGUzJfQ01PREVfUFJJT1JJVFkgaXMgbm90IHNldA0KQ09ORklHX0pGRlMyX0NNT0RFX1NJ
WkU9eQ0KIyBDT05GSUdfSkZGUzJfQ01PREVfRkFWT1VSTFpPIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0xPR0ZTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSQU1GUyBpcyBub3Qgc2V0DQpDT05GSUdfU1FV
QVNIRlM9eQ0KIyBDT05GSUdfU1FVQVNIRlNfWEFUVFIgaXMgbm90IHNldA0KQ09ORklHX1NRVUFT
SEZTX0xaTz15DQpDT05GSUdfU1FVQVNIRlNfWFo9eQ0KQ09ORklHX1NRVUFTSEZTX0VNQkVEREVE
PXkNCkNPTkZJR19TUVVBU0hGU19GUkFHTUVOVF9DQUNIRV9TSVpFPTMNCkNPTkZJR19TUVVBU0hG
U19NQVhfQkxPQ0tfU0laRT0xMzEwNzINCiMgQ09ORklHX1ZYRlNfRlMgaXMgbm90IHNldA0KIyBD
T05GSUdfTUlOSVhfRlMgaXMgbm90IHNldA0KIyBDT05GSUdfT01GU19GUyBpcyBub3Qgc2V0DQoj
IENPTkZJR19IUEZTX0ZTIGlzIG5vdCBzZXQNCiMgQ09ORklHX1FOWDRGU19GUyBpcyBub3Qgc2V0
DQpDT05GSUdfUk9NRlNfRlM9bQ0KQ09ORklHX1JPTUZTX0JBQ0tFRF9CWV9CTE9DSz15DQojIENP
TkZJR19ST01GU19CQUNLRURfQllfTVREIGlzIG5vdCBzZXQNCiMgQ09ORklHX1JPTUZTX0JBQ0tF
RF9CWV9CT1RIIGlzIG5vdCBzZXQNCkNPTkZJR19ST01GU19PTl9CTE9DSz15DQojIENPTkZJR19Q
U1RPUkUgaXMgbm90IHNldA0KIyBDT05GSUdfU1lTVl9GUyBpcyBub3Qgc2V0DQojIENPTkZJR19V
RlNfRlMgaXMgbm90IHNldA0KIyBDT05GSUdfTkVUV09SS19GSUxFU1lTVEVNUyBpcyBub3Qgc2V0
DQoNCiMNCiMgUGFydGl0aW9uIFR5cGVzDQojDQojIENPTkZJR19QQVJUSVRJT05fQURWQU5DRUQg
aXMgbm90IHNldA0KQ09ORklHX01TRE9TX1BBUlRJVElPTj15DQpDT05GSUdfTkxTPXkNCkNPTkZJ
R19OTFNfREVGQVVMVD0iaXNvODg1OS0xIg0KQ09ORklHX05MU19DT0RFUEFHRV80Mzc9eQ0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzczNyBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
Nzc1IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV84NTAgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg1MiBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODU1IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV84NTcgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg2MCBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODYxIGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV84NjIgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg2MyBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODY0IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV84NjUgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg2NiBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODY5IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV85MzYgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzk1MCBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfQ09ERVBBR0Vf
OTMyIGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV85NDkgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg3NCBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfSVNPODg1OV84
IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUwIGlzIG5vdCBzZXQNCiMgQ09O
RklHX05MU19DT0RFUEFHRV8xMjUxIGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19BU0NJSSBpcyBu
b3Qgc2V0DQojIENPTkZJR19OTFNfSVNPODg1OV8xIGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19J
U084ODU5XzIgaXMgbm90IHNldA0KIyBDT05GSUdfTkxTX0lTTzg4NTlfMyBpcyBub3Qgc2V0DQoj
IENPTkZJR19OTFNfSVNPODg1OV80IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19JU084ODU5XzUg
aXMgbm90IHNldA0KIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBpcyBub3Qgc2V0DQojIENPTkZJR19O
TFNfSVNPODg1OV83IGlzIG5vdCBzZXQNCiMgQ09ORklHX05MU19JU084ODU5XzkgaXMgbm90IHNl
dA0KIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNldA0KIyBDT05GSUdfTkxTX0lTTzg4
NTlfMTQgaXMgbm90IHNldA0KIyBDT05GSUdfTkxTX0lTTzg4NTlfMTUgaXMgbm90IHNldA0KIyBD
T05GSUdfTkxTX0tPSThfUiBpcyBub3Qgc2V0DQojIENPTkZJR19OTFNfS09JOF9VIGlzIG5vdCBz
ZXQNCkNPTkZJR19OTFNfVVRGOD15DQoNCiMNCiMgS2VybmVsIGhhY2tpbmcNCiMNCkNPTkZJR19U
UkFDRV9JUlFGTEFHU19TVVBQT1JUPXkNCiMgQ09ORklHX1BSSU5US19USU1FIGlzIG5vdCBzZXQN
CkNPTkZJR19ERUZBVUxUX01FU1NBR0VfTE9HTEVWRUw9NA0KQ09ORklHX0VOQUJMRV9XQVJOX0RF
UFJFQ0FURUQ9eQ0KQ09ORklHX0VOQUJMRV9NVVNUX0NIRUNLPXkNCkNPTkZJR19GUkFNRV9XQVJO
PTEwMjQNCiMgQ09ORklHX01BR0lDX1NZU1JRIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NUUklQX0FT
TV9TWU1TIGlzIG5vdCBzZXQNCiMgQ09ORklHX1VOVVNFRF9TWU1CT0xTIGlzIG5vdCBzZXQNCiMg
Q09ORklHX0RFQlVHX0ZTIGlzIG5vdCBzZXQNCkNPTkZJR19IRUFERVJTX0NIRUNLPXkNCiMgQ09O
RklHX0RFQlVHX1NFQ1RJT05fTUlTTUFUQ0ggaXMgbm90IHNldA0KIyBDT05GSUdfREVCVUdfS0VS
TkVMIGlzIG5vdCBzZXQNCiMgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1IgaXMgbm90IHNldA0K
IyBDT05GSUdfU0xVQl9ERUJVR19PTiBpcyBub3Qgc2V0DQojIENPTkZJR19TTFVCX1NUQVRTIGlz
IG5vdCBzZXQNCiMgQ09ORklHX1NQQVJTRV9SQ1VfUE9JTlRFUiBpcyBub3Qgc2V0DQpDT05GSUdf
REVCVUdfQlVHVkVSQk9TRT15DQojIENPTkZJR19XUl9PQ0RfREVCVUcgaXMgbm90IHNldA0KIyBD
T05GSUdfREVCVUdfTUVNT1JZX0lOSVQgaXMgbm90IHNldA0KQ09ORklHX0FSQ0hfV0FOVF9GUkFN
RV9QT0lOVEVSUz15DQpDT05GSUdfRlJBTUVfUE9JTlRFUj15DQpDT05GSUdfUkNVX0NQVV9TVEFM
TF9ERVRFQ1RPUj15DQpDT05GSUdfUkNVX0NQVV9TVEFMTF9USU1FT1VUPTYwDQpDT05GSUdfUkNV
X0NQVV9TVEFMTF9ERVRFQ1RPUl9SVU5OQUJMRT15DQpDT05GSUdfUkNVX0NQVV9TVEFMTF9WRVJC
T1NFPXkNCiMgQ09ORklHX1NZU0NUTF9TWVNDQUxMX0NIRUNLIGlzIG5vdCBzZXQNCkNPTkZJR19V
U0VSX1NUQUNLVFJBQ0VfU1VQUE9SVD15DQpDT05GSUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9eQ0K
Q09ORklHX0hBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkNCkNPTkZJR19IQVZFX0ZVTkNUSU9O
X0dSQVBIX0ZQX1RFU1Q9eQ0KQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VfTUNPVU5UX1RFU1Q9
eQ0KQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQ0KQ09ORklHX0hBVkVfRlRSQUNFX01DT1VO
VF9SRUNPUkQ9eQ0KQ09ORklHX0hBVkVfU1lTQ0FMTF9UUkFDRVBPSU5UUz15DQpDT05GSUdfSEFW
RV9DX1JFQ09SRE1DT1VOVD15DQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkNCiMgQ09ORklHX0ZU
UkFDRSBpcyBub3Qgc2V0DQojIENPTkZJR19QUk9WSURFX09IQ0kxMzk0X0RNQV9JTklUIGlzIG5v
dCBzZXQNCiMgQ09ORklHX0JVSUxEX0RPQ1NSQyBpcyBub3Qgc2V0DQojIENPTkZJR19ETUFfQVBJ
X0RFQlVHIGlzIG5vdCBzZXQNCiMgQ09ORklHX0FUT01JQzY0X1NFTEZURVNUIGlzIG5vdCBzZXQN
CiMgQ09ORklHX1NBTVBMRVMgaXMgbm90IHNldA0KQ09ORklHX0hBVkVfQVJDSF9LR0RCPXkNCkNP
TkZJR19IQVZFX0FSQ0hfS01FTUNIRUNLPXkNCiMgQ09ORklHX1RFU1RfS1NUUlRPWCBpcyBub3Qg
c2V0DQojIENPTkZJR19TVFJJQ1RfREVWTUVNIGlzIG5vdCBzZXQNCkNPTkZJR19YODZfVkVSQk9T
RV9CT09UVVA9eQ0KQ09ORklHX0VBUkxZX1BSSU5USz15DQojIENPTkZJR19FQVJMWV9QUklOVEtf
REJHUCBpcyBub3Qgc2V0DQojIENPTkZJR19ERUJVR19TRVRfTU9EVUxFX1JPTlggaXMgbm90IHNl
dA0KIyBDT05GSUdfSU9NTVVfU1RSRVNTIGlzIG5vdCBzZXQNCkNPTkZJR19IQVZFX01NSU9UUkFD
RV9TVVBQT1JUPXkNCkNPTkZJR19JT19ERUxBWV9UWVBFXzBYODA9MA0KQ09ORklHX0lPX0RFTEFZ
X1RZUEVfMFhFRD0xDQpDT05GSUdfSU9fREVMQVlfVFlQRV9VREVMQVk9Mg0KQ09ORklHX0lPX0RF
TEFZX1RZUEVfTk9ORT0zDQpDT05GSUdfSU9fREVMQVlfMFg4MD15DQojIENPTkZJR19JT19ERUxB
WV8wWEVEIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lPX0RFTEFZX1VERUxBWSBpcyBub3Qgc2V0DQoj
IENPTkZJR19JT19ERUxBWV9OT05FIGlzIG5vdCBzZXQNCkNPTkZJR19ERUZBVUxUX0lPX0RFTEFZ
X1RZUEU9MA0KIyBDT05GSUdfT1BUSU1JWkVfSU5MSU5JTkcgaXMgbm90IHNldA0KDQojDQojIFNl
Y3VyaXR5IG9wdGlvbnMNCiMNCiMgQ09ORklHX0tFWVMgaXMgbm90IHNldA0KIyBDT05GSUdfU0VD
VVJJVFlfRE1FU0dfUkVTVFJJQ1QgaXMgbm90IHNldA0KIyBDT05GSUdfU0VDVVJJVFkgaXMgbm90
IHNldA0KIyBDT05GSUdfU0VDVVJJVFlGUyBpcyBub3Qgc2V0DQpDT05GSUdfREVGQVVMVF9TRUNV
UklUWV9EQUM9eQ0KQ09ORklHX0RFRkFVTFRfU0VDVVJJVFk9IiINCkNPTkZJR19DUllQVE89eQ0K
DQojDQojIENyeXB0byBjb3JlIG9yIGhlbHBlcg0KIw0KQ09ORklHX0NSWVBUT19BTEdBUEk9eQ0K
Q09ORklHX0NSWVBUT19BTEdBUEkyPXkNCkNPTkZJR19DUllQVE9fQUVBRD15DQpDT05GSUdfQ1JZ
UFRPX0FFQUQyPXkNCkNPTkZJR19DUllQVE9fQkxLQ0lQSEVSPXkNCkNPTkZJR19DUllQVE9fQkxL
Q0lQSEVSMj15DQpDT05GSUdfQ1JZUFRPX0hBU0g9eQ0KQ09ORklHX0NSWVBUT19IQVNIMj15DQpD
T05GSUdfQ1JZUFRPX1JORz1tDQpDT05GSUdfQ1JZUFRPX1JORzI9eQ0KQ09ORklHX0NSWVBUT19Q
Q09NUDI9eQ0KQ09ORklHX0NSWVBUT19NQU5BR0VSPXkNCkNPTkZJR19DUllQVE9fTUFOQUdFUjI9
eQ0KQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVfVEVTVFM9eQ0KIyBDT05GSUdfQ1JZUFRP
X0dGMTI4TVVMIGlzIG5vdCBzZXQNCkNPTkZJR19DUllQVE9fTlVMTD15DQpDT05GSUdfQ1JZUFRP
X1dPUktRVUVVRT15DQojIENPTkZJR19DUllQVE9fQ1JZUFREIGlzIG5vdCBzZXQNCkNPTkZJR19D
UllQVE9fQVVUSEVOQz15DQojIENPTkZJR19DUllQVE9fVEVTVCBpcyBub3Qgc2V0DQoNCiMNCiMg
QXV0aGVudGljYXRlZCBFbmNyeXB0aW9uIHdpdGggQXNzb2NpYXRlZCBEYXRhDQojDQojIENPTkZJ
R19DUllQVE9fQ0NNIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19HQ00gaXMgbm90IHNldA0K
IyBDT05GSUdfQ1JZUFRPX1NFUUlWIGlzIG5vdCBzZXQNCg0KIw0KIyBCbG9jayBtb2Rlcw0KIw0K
Q09ORklHX0NSWVBUT19DQkM9eQ0KIyBDT05GSUdfQ1JZUFRPX0NUUiBpcyBub3Qgc2V0DQojIENP
TkZJR19DUllQVE9fQ1RTIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19FQ0IgaXMgbm90IHNl
dA0KIyBDT05GSUdfQ1JZUFRPX0xSVyBpcyBub3Qgc2V0DQojIENPTkZJR19DUllQVE9fUENCQyBp
cyBub3Qgc2V0DQojIENPTkZJR19DUllQVE9fWFRTIGlzIG5vdCBzZXQNCg0KIw0KIyBIYXNoIG1v
ZGVzDQojDQpDT05GSUdfQ1JZUFRPX0hNQUM9eQ0KIyBDT05GSUdfQ1JZUFRPX1hDQkMgaXMgbm90
IHNldA0KIyBDT05GSUdfQ1JZUFRPX1ZNQUMgaXMgbm90IHNldA0KDQojDQojIERpZ2VzdA0KIw0K
Q09ORklHX0NSWVBUT19DUkMzMkM9eQ0KIyBDT05GSUdfQ1JZUFRPX0NSQzMyQ19JTlRFTCBpcyBu
b3Qgc2V0DQojIENPTkZJR19DUllQVE9fR0hBU0ggaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRP
X01ENCBpcyBub3Qgc2V0DQpDT05GSUdfQ1JZUFRPX01ENT15DQojIENPTkZJR19DUllQVE9fTUlD
SEFFTF9NSUMgaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1JNRDEyOCBpcyBub3Qgc2V0DQoj
IENPTkZJR19DUllQVE9fUk1EMTYwIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19STUQyNTYg
aXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1JNRDMyMCBpcyBub3Qgc2V0DQpDT05GSUdfQ1JZ
UFRPX1NIQTE9eQ0KIyBDT05GSUdfQ1JZUFRPX1NIQTI1NiBpcyBub3Qgc2V0DQojIENPTkZJR19D
UllQVE9fU0hBNTEyIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19UR1IxOTIgaXMgbm90IHNl
dA0KIyBDT05GSUdfQ1JZUFRPX1dQNTEyIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19HSEFT
SF9DTE1VTF9OSV9JTlRFTCBpcyBub3Qgc2V0DQoNCiMNCiMgQ2lwaGVycw0KIw0KQ09ORklHX0NS
WVBUT19BRVM9eQ0KIyBDT05GSUdfQ1JZUFRPX0FFU19YODZfNjQgaXMgbm90IHNldA0KIyBDT05G
SUdfQ1JZUFRPX0FFU19OSV9JTlRFTCBpcyBub3Qgc2V0DQojIENPTkZJR19DUllQVE9fQU5VQklT
IGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19BUkM0IGlzIG5vdCBzZXQNCiMgQ09ORklHX0NS
WVBUT19CTE9XRklTSCBpcyBub3Qgc2V0DQojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90
IHNldA0KIyBDT05GSUdfQ1JZUFRPX0NBU1Q1IGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19D
QVNUNiBpcyBub3Qgc2V0DQpDT05GSUdfQ1JZUFRPX0RFUz15DQojIENPTkZJR19DUllQVE9fRkNS
WVBUIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19LSEFaQUQgaXMgbm90IHNldA0KIyBDT05G
SUdfQ1JZUFRPX1NBTFNBMjAgaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1NBTFNBMjBfWDg2
XzY0IGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19TRUVEIGlzIG5vdCBzZXQNCiMgQ09ORklH
X0NSWVBUT19TRVJQRU5UIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19URUEgaXMgbm90IHNl
dA0KIyBDT05GSUdfQ1JZUFRPX1RXT0ZJU0ggaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1RX
T0ZJU0hfWDg2XzY0IGlzIG5vdCBzZXQNCg0KIw0KIyBDb21wcmVzc2lvbg0KIw0KIyBDT05GSUdf
Q1JZUFRPX0RFRkxBVEUgaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1pMSUIgaXMgbm90IHNl
dA0KIyBDT05GSUdfQ1JZUFRPX0xaTyBpcyBub3Qgc2V0DQoNCiMNCiMgUmFuZG9tIE51bWJlciBH
ZW5lcmF0aW9uDQojDQpDT05GSUdfQ1JZUFRPX0FOU0lfQ1BSTkc9bQ0KIyBDT05GSUdfQ1JZUFRP
X1VTRVJfQVBJX0hBU0ggaXMgbm90IHNldA0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1NLQ0lQ
SEVSIGlzIG5vdCBzZXQNCkNPTkZJR19DUllQVE9fSFc9eQ0KIyBDT05GSUdfQ1JZUFRPX0RFVl9Q
QURMT0NLIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NSWVBUT19ERVZfSElGTl83OTVYIGlzIG5vdCBz
ZXQNCkNPTkZJR19IQVZFX0tWTT15DQpDT05GSUdfVklSVFVBTElaQVRJT049eQ0KIyBDT05GSUdf
S1ZNIGlzIG5vdCBzZXQNCiMgQ09ORklHX1ZIT1NUX05FVCBpcyBub3Qgc2V0DQojIENPTkZJR19W
SVJUSU9fUENJIGlzIG5vdCBzZXQNCiMgQ09ORklHX1ZJUlRJT19CQUxMT09OIGlzIG5vdCBzZXQN
CiMgQ09ORklHX0JJTkFSWV9QUklOVEYgaXMgbm90IHNldA0KDQojDQojIExpYnJhcnkgcm91dGlu
ZXMNCiMNCkNPTkZJR19CSVRSRVZFUlNFPXkNCkNPTkZJR19HRU5FUklDX0ZJTkRfRklSU1RfQklU
PXkNCkNPTkZJR19HRU5FUklDX0ZJTkRfTkVYVF9CSVQ9eQ0KQ09ORklHX0dFTkVSSUNfRklORF9M
QVNUX0JJVD15DQojIENPTkZJR19DUkNfQ0NJVFQgaXMgbm90IHNldA0KIyBDT05GSUdfQ1JDMTYg
aXMgbm90IHNldA0KIyBDT05GSUdfQ1JDX1QxMERJRiBpcyBub3Qgc2V0DQojIENPTkZJR19DUkNf
SVRVX1QgaXMgbm90IHNldA0KQ09ORklHX0NSQzMyPXkNCiMgQ09ORklHX0NSQzcgaXMgbm90IHNl
dA0KQ09ORklHX0xJQkNSQzMyQz15DQpDT05GSUdfWkxJQl9JTkZMQVRFPXkNCkNPTkZJR19aTElC
X0RFRkxBVEU9eQ0KQ09ORklHX0xaT19ERUNPTVBSRVNTPXkNCkNPTkZJR19YWl9ERUM9eQ0KIyBD
T05GSUdfWFpfREVDX1g4NiBpcyBub3Qgc2V0DQojIENPTkZJR19YWl9ERUNfUE9XRVJQQyBpcyBu
b3Qgc2V0DQojIENPTkZJR19YWl9ERUNfSUE2NCBpcyBub3Qgc2V0DQojIENPTkZJR19YWl9ERUNf
QVJNIGlzIG5vdCBzZXQNCkNPTkZJR19YWl9ERUNfQVJNVEhVTUI9eQ0KIyBDT05GSUdfWFpfREVD
X1NQQVJDIGlzIG5vdCBzZXQNCkNPTkZJR19YWl9ERUNfQkNKPXkNCiMgQ09ORklHX1haX0RFQ19U
RVNUIGlzIG5vdCBzZXQNCkNPTkZJR19ERUNPTVBSRVNTX0xaTUE9eQ0KQ09ORklHX0RFQ09NUFJF
U1NfWFo9eQ0KQ09ORklHX1RFWFRTRUFSQ0g9eQ0KQ09ORklHX1RFWFRTRUFSQ0hfS01QPXkNCkNP
TkZJR19URVhUU0VBUkNIX0JNPXkNCkNPTkZJR19URVhUU0VBUkNIX0ZTTT15DQpDT05GSUdfSEFT
X0lPTUVNPXkNCkNPTkZJR19IQVNfSU9QT1JUPXkNCkNPTkZJR19IQVNfRE1BPXkNCkNPTkZJR19O
TEFUVFI9eQ0KIyBDT05GSUdfQVZFUkFHRSBpcyBub3Qgc2V0DQo=

--_002_AM6PR02MB4884A6522909A9322C4C9E2EDA1E9AM6PR02MB4884eurp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_AM6PR02MB4884A6522909A9322C4C9E2EDA1E9AM6PR02MB4884eurp_--


