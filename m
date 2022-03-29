Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FAAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 16:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B008426D;
	Tue, 29 Mar 2022 16:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ErTb5KaCJGL; Tue, 29 Mar 2022 16:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684B28424C;
	Tue, 29 Mar 2022 16:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB8461BF30E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C88048424C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuLi_vXD1vSO for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 16:17:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28B1584229
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 16:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbdBB1C+NP/YMkWuKTao4Xwj0UT5zY7x/hwKUr6TzzYakLW+/ycHWFmKr300C+Fo7FRDWPmaN2e3ST52Zi1Ms//2ukltCizWIQ1KZeIPp9TZIGbGFlGIvlBYlJsyx9VvjJT4N+ErgVgR9/dZ59jVR2k/KPtAf/y5PhMZI38V40ED71l69thKNnO3W2zrmOoIZZ/xtbolCtZEqjsWTKHcQ//gVL/aqOdU7M1x94R0CJSxwUd/q2U7orRPHeEpmaQsZIWbo/hn11CJV6IhUfP3Aebhx0C4rAxbv8iV0o99NrskAFV4X3vpyVpPa1ueQJJVqdJ+sc2PqQUVlJFbPAUtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpWR9AWffXzdfmcVmilVE45+3sR0Utt5v3j2Yy5p0V0=;
 b=gO6cefYdSHYwNZTt9fIverOMXZEX5WlncgncD2WR3MERii1eGgeTz3b8cuPGT/+HamcEvu/xsB+H70g1W4bJwD5gRrDlwLuXWGleUSzzFSiVahyl7l6YykILZeVqJcjHrlV6EYMMsMiZbfN313NNvmuNBj5nOo2/b+NAJpIoJ1t54pWfR9DMU2o5wI5lb+s7mRhB5Za64w5c2lmtkOjtuGupseJtfnpgwZCsKh3+yiSoWXvwzt3ry7JNXsVeEWMYezVavrhhNJ7YweoDqAZSuEgzoH9ZBabvyPOcxUm6WDNFfsqP4MBZ0J34bmPgRzK26JN8p+BcQTG7ZriSNTcFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpWR9AWffXzdfmcVmilVE45+3sR0Utt5v3j2Yy5p0V0=;
 b=g+8wsa3c2XFn6bOCS0EPzQ7oBw0Wygrgc3VvQ876gZp6REZlTkv2IOrNzXjbs5ZyD7r7tPwDkwad7b3mjQVK5audn4z0bQhYGT+GtPVvjDRcUfklw58MiSQEXTsE/ojJ9RW/EIoKKmVuXAEUQP57XWbfE3hti9/cpZQMbqtkEd4=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by PAXPR02MB7485.eurprd02.prod.outlook.com (2603:10a6:102:210::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 16:17:03 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 16:17:03 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Andreas Ziegler <br015@umbiko.net>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AQHYQ1EGpCcDGFOvN0u2NbHmcspfi6zWS9xggAAspgCAAAxesA==
Date: Tue, 29 Mar 2022 16:17:03 +0000
Message-ID: <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
In-Reply-To: <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10afce2e-f67e-4029-0e0a-08da119f8fb4
x-ms-traffictypediagnostic: PAXPR02MB7485:EE_
x-microsoft-antispam-prvs: <PAXPR02MB7485F16C53C3C97DFB11196ADA1E9@PAXPR02MB7485.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gh0i/YZv3emyOzoL6PNdYQvlKZLjsjP/TxunNb1l5+qFeYojhCxbQPwW0hviyYfAbKMx1yzFiAI1LCrrqsKgDx8RqI0i6mV/es4cj0OK55IyS29vVYacTYXDwIsoNbup3eefJ+PUh92thqbDvuS6AK1uY6hI8yPV++Ni1A8QAG0cx7LIVaFOauAeqchL3Mcn11+M0QWCdsUcjUZJZ+Eh/ulUrLzUeINIlK8chRwUvcn7prXh6YaxyyisuBYmg56AuvAjN7n0TELowJ/4J/vJ052ucRNtVpPqqyKDeFVoEYVih86DPkFbvgFCKAKoRTJjCNqF9wMUA9ULbJXIf0mOX9+jMZkspsMB9HyMHXPk9gAACnbTnrktyfmcPIsFR2cTttZ9zg6yrejvn5Xn2XfEpFzdm3ebkWKrzNiXh3i7FjjL+UZdA2DWRVepNp/fQnSYCrUijS+0LaF9RDKdz1ET0BcBOstr+B9fprzwpWhP8J/WYdpgQ09dX8qPYqHRHXZZCDSrHH5mCFZaF/+tdp7+YNGOduGYe41ynJ1uYfFeTd4kjfEh24v2kmt2gVqlIUHelTnVLrsK/9upc03ba0cWDDDxWQ6NlOumfkNkMqMXGDVZH8Z0JrpVr9ryEFFjkBRPaVCrV07Sck/36gveCp2k7jqDwTI630E50Gqdfzk2oj+m+54kwwfNT9uUkSNlPJtFWLA6IQftzPWLLI+beAlakNjCsU5ApP1USzzZfMckDOAnIp/hzt/aFZKyUaPzuUfK0b8sG97NHX+JQT1BNHJwMmbjnHLaxh4x0RpUXA8prdg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(136003)(376002)(39830400003)(396003)(346002)(366004)(26005)(66476007)(76116006)(9686003)(55016003)(66446008)(5660300002)(52536014)(64756008)(8936002)(71200400001)(53546011)(66556008)(66946007)(2906002)(6916009)(7696005)(6506007)(38070700005)(33656002)(66574015)(966005)(83380400001)(186003)(38100700002)(122000001)(86362001)(8676002)(4326008)(508600001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LTD0N/8yeCG6kHy92sdpk5IjiUuNKPiZDoC0iJKwnCFzhBPdmXgctv7WPCF6?=
 =?us-ascii?Q?99jf9Sx6zax7+Pl4mx7WtsnauikgdmZfZdAPaF/UBle1qtKFhIpKrqzEBLb7?=
 =?us-ascii?Q?Kmqbbo3d3o3ifeldO2lzNXv7PNu3tNDUzZHQa22IMnWWbnkRl5TbEAhMFe/o?=
 =?us-ascii?Q?jQB6EGCJCMloYl/sY/K7jF+SAIE6OI5CZBnBezWpqvyh98TeWN8waDs8js8k?=
 =?us-ascii?Q?J1sEOYRV2jh88p3ZiY4focM6M4tUe0drlEI6NCPjvxjpLtvZ+3wqqZaT30gd?=
 =?us-ascii?Q?Uz1zOU9tMgMzTe+0B2NO9yUz0nqH5ImaeUGCwKxryv34GyiGuvp5DDjka7oU?=
 =?us-ascii?Q?Bb3w9/3B5HM6wo9qmDjAmWJk1FyxN5iVXbuivyKcCaoYrw6NoOM72fAMScR9?=
 =?us-ascii?Q?hWHOBgFyda9E+OjhgOA+D2Q69pCvrwHxqbfJtpLnKjFBwwliXUqkhF/jrL/X?=
 =?us-ascii?Q?AgGxzipAI9zBdwrkWs7FCzudl8sOOY/Ss6nKXHK9XLUuc1x547+imIfFaJyB?=
 =?us-ascii?Q?l67kaBil0QJ7tl3+w1B4K3D1lBNPPXTLm7R3U3tJ/GCr852kDO0z20GPOd6Z?=
 =?us-ascii?Q?ql3jqnWvX8uKJ9e0Fm+/QsLyvJw9OjbIb9RWsSghC2aoiVA1sijYodpsgdCA?=
 =?us-ascii?Q?ow+KhSg5v2o+8lsa3vKKNBzyGbF4qhmKCxuog74i7h5944kRov106yKXCf8/?=
 =?us-ascii?Q?tJfMe1RY6DwTByJqEoGjs+EEyQG6jeMPq3H+a91AwzgNxIqNNpVb5Pum0Vaj?=
 =?us-ascii?Q?1uRfPY5IY3u7Ah5v4G6qi8FitfrpKGNQUxIfg8W/8Tj7SCNjQeGFcfex7o/7?=
 =?us-ascii?Q?OfeoJkH+IayTtESMi2D/LnY5IlrZRrRa9+NmxaFaw5e6wo7nUs1XE9jSC3Uo?=
 =?us-ascii?Q?IBSNwvESf+Vfyl96VF5bBhOGYcZ4XLqNpl6wbnn6Oe93XLwzUDz2xQscgk2C?=
 =?us-ascii?Q?+ZicCr6r0zQ5dc42BmDmMq3MyXcIsnYbb6aBfUXPDctpIyIncGZHcyOcOZWV?=
 =?us-ascii?Q?SIa2AX0miZ6q22DmN9HuwgDdTj3V0L4ah8Ud5e+mkfz0H2q0DWLRJ1OBtbdU?=
 =?us-ascii?Q?82LZZTYLrFmC5vksqv528Lb2RaoEO50XolntDN9vMQNi8YsxmZaRy+uGaMpp?=
 =?us-ascii?Q?C77LevC49ke07rNrX26VYO3s1fJs4GIzO8vZiDux6JVx1XePz56gQqeTBPbk?=
 =?us-ascii?Q?4wLppIsdoiNNcfpP4IpHaMlVjr46CNo6fw0hM09REYbey6zzZCLhDeG11fP2?=
 =?us-ascii?Q?EroAqk7bOHEg7caDaidpzjZADBA63XppEhcCp/dswZvGAhByK3vRYwTarvX2?=
 =?us-ascii?Q?MY2wvmQeuqlbQYJg+jDQnYb5r0KqJeNMf2qpnqalsODtpYrsiGeKHR/J5EBO?=
 =?us-ascii?Q?hOzlSL0Ei6LcdSY/rCOdc5bX/JKVvqeb3WyUS8XBIKR4p+Ht9jW0SSTbDVK+?=
 =?us-ascii?Q?DfzWSN0FKZI/bWMMq9oCDRM+pthSwmsbq9MOZcssnwS0od0NT+kMc6s22EYG?=
 =?us-ascii?Q?Vd8Fp/FLsBWB666hzTzMz+88BPb8Lq8iKa6oMEfI0CBxZlct/bbkgNZGswhO?=
 =?us-ascii?Q?k2Pg6CXMfpvZEQ+t7X4z25Ef5yTuqRSJS2WFY/2Yir6HfDQaRtBcnHTB6b/M?=
 =?us-ascii?Q?o9T/kcL+heYO/OtFWqtdtYLbNLmJTa6H2WthHOKYlIjogRWhCUbvEHA1ocFv?=
 =?us-ascii?Q?PrkblH7PIeTMmsP4CiKySa/PErQcGR9abxPPy/lKAkQ0mWUYOafH/H0HZoSm?=
 =?us-ascii?Q?gufd12HRXw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10afce2e-f67e-4029-0e0a-08da119f8fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 16:17:03.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z84qiwyrQS6pmZMv4UMOjp1SJJS0NoO6l0CAfScIRXtqGLVcRhWZJllo3NONzwLoDxOURdAxzGfiOMV1Awh1Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7485
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Andreas Ziegler <br015@umbiko.net>
> Sent: 29 March 2022 16:14
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: buildroot@buildroot.org
> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel -
> possible?
> 
> Hi Dan,
> 
> On 2022-03-29 12:48, Dan Jackson wrote:
> >> -----Original Message-----
> >> From: Andreas Ziegler <br015@umbiko.net>
> >> Sent: 29 March 2022 10:40
> >> To: Dan Jackson <dan@thejacksons.uk>
> >> Cc: Buildroot <buildroot@buildroot.org>
> >> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel
> >> -
> >> possible?
> >>
> >> Hi Dan,
> >>
> >> On 2022-03-29 05:58, Dan Jackson <dan@thejacksons.uk> wrote:
> >>
> >> > Hello,
> >> >
> >> > Sorry once again if this is a silly/noob question.
> >> >
> >> > If I have an existing router device running a 2.6.39.3 kernel,
> >> > which has a USB port and is capable of supporting USB devices, but
> >> > the manufacturer has removed/not installed the necessary kernel
> >> > modules, can I use Buildroot to recreate the missing modules and
> >> > thus re-enable the missing USB support?
> >>
> >> It might work: the driver is contained in the USB module, so building
> >> and loading that module could do the trick.
> >>
> >> > If so, how would I do it?
> >>
> >> Supposing the Linux kernel source contained in [1] is the one that is
> >> running on your device, you need to configure Buildroot to build a
> >> Linux kernel (BR2_LINUX_KERNEL). The manual [2] has some information
> >> about how to do this for a Kernel source tree (see chapter 8.14.6).
> >
> > It looks like I got that part to work. The buildroot build process
> > definitely seems to be able to see the kernel source tree which is in
> > /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src.
> >
> >>
> >> You then need to enable USB support in the kernel (Device Drivers ->
> >> USB support), probably
> >>
> >>    CONFIG_USB=m
> >>    CONFIG_USB_EHCI_HCD=y
> >>    CONFIG_USB_OHCI_HCD=y
> >>
> >> is enough, otherwise try some of the hardware specific (driver)
> >> options.
> >
> > This is where I have fallen down. I did "make linux-menuconfig"
> > expecting to be able to configure the kernel/modules (as I couldn't
> > see any options for that in buildroot's own "make menuconfig").
> >
> > However, at this point it seems like it went off and tried to build
> > the whole kernel from a default configuration.
> 
> 'make linux-menuconfig' needs a working build system. If they are not
> present, all dependencies of the Linux package get built. First step is the
> installation of the kernel source; if Buildroot tries to install a default kernel,
> something is amiss with your configuration.
> 
> > This eventually failed, so I tried "make linux-reconfigure" at that
> > point but that did not work either.
> >
> > Here is the error it gave upon failure:
> >
> > /home/danj/buildroot-2022.02/output/host/lib/gcc/armeb-buildroot-
> linux-uclibcgnueabi/11.2.0/../../../../armeb-buildroot-linux-
> uclibcgnueabi/bin/ld:
> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-
> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
> > error loading plugin:
> > /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-
> linux-uclibcgnueabi/11.2.0/liblto_plugin.so:
> > undefined symbol: _onload
> > collect2: error: ld returned 1 exit status
> > Makefile.in:114: recipe for target '../utils/getconf' failed
> > make[3]: *** [../utils/getconf] Error 1
> > Makefile.in:455: recipe for target 'utils' failed
> > make[2]: *** [utils] Error 2
> > package/pkg-generic.mk:380: recipe for target
> > '/home/danj/buildroot-2022.02/output/build/uclibc-
> 1.0.40/.stamp_target_installed'
> > failed
> > make[1]: ***
> > [/home/danj/buildroot-2022.02/output/build/uclibc-1.0.40/.stamp_target
> > _installed]
> > Error 2
> > Makefile:84: recipe for target '_all' failed
> > make: *** [_all] Error 2
> 
> This error is from the uClibc build - do you use an internal or external
> toolchain? Maybe you have conflicting static /dynamic library options?
> Again, probably a buildroot misconfiguration ...

This turned out to be that I had some wrong environment variables set from a previous attempt. Logged out and back in and now I am past that error.

> 
> Maybe you could post your buildroot configuration (the result of make
> savedefconfig)?

It's quite short as it turns out:

BR2_armeb=y
BR2_STATIC_LIBS=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="2.6.39.3"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_37_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_9_2=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="/home/danj/localoptions.h"
BR2_PACKAGE_JOE=y

I can see I have got a USE_ARCH_DEFAULT_CONFIG in there which I'm guessing is part of my problems?

> 
> > Looking at this error message, maybe I need to select an older version
> > of gcc, in my buildroot configuration? Is it that the kernel can only
> > be compiled by gcc versions that existed at the time?
> 
> Older kernels used to have a include/compiler.h which had predefined
> includes for specific compiler versions. Use the oldest compiler available in
> Buildroot and try to either get a compiler-gcc9.h from a newer kernel or
> make your own. I believe this schema changed somewhere between 3.x and
> 4.x For newer compilers, this file is comparatively empty.

GCC 9.x is the oldest option available in current buildroot so I have switched to that.

I found a compiler-gcc5.h in kernel 4.1, newer kernels do not have any numbered files of this type at all. I downloaded this one and symlinked it as compiler-gcc9.h and it looks like this got me past this error.

However, now I have a new missing file error, and I can't seem to locate a suitable candidate:

In file included from /home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/system.h:165,
                 from /home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/bitops.h:27,
                 from include/linux/bitops.h:22,
                 from include/linux/kernel.h:17,
                 from include/linux/sched.h:55,
                 from arch/arm/kernel/asm-offsets.c:13:
/home/danj/buildroot-2022.02/output/build/linux-custom/arch/arm/include/asm/memory.h:19:10: fatal error: mach/memory.h: No such file or directory
   19 | #include <mach/memory.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
/home/danj/buildroot-2022.02/output/build/linux-custom/./Kbuild:81: recipe for target 'arch/arm/kernel/asm-offsets.s' failed
make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
Makefile:1009: recipe for target 'prepare0' failed
make[2]: *** [prepare0] Error 2
make[2]: *** Waiting for unfinished jobs....
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
make[2]: *** wait: No child processes. Stop.
package/pkg-generic.mk:289: recipe for target '/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built' failed
make[1]: *** [/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_built] Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

I think maybe I am still doing something wrong because it sure seems to be compiling a lot of stuff instead of letting me configure things.

> 
> >>
> >> Copy usbcore.ko from Buildroot target/lib/modules/{kernel-version}/
> >> to the corresponding location on your device and load the driver with
> >> modprobe.
> >>
> >> Depending on which functionality (e.g. USB_STORAGE) you want on your
> >> USB port, additional configurations changes may be necessary.
> >
> > Yes, USB storage functionality is what I would like to add back in.
> > Incidentally, this is a newer router than the one I was experimenting
> > with before; this one has a Puma 6 CPU. Though, oddly I found it
> > necessary to select an armv5 CPU type in buildroot in order to get
> > binaries that work, despite /proc/cpuinfo on the device claiming it is
> > armv6.
> >
> >>
> >> Kind regards,
> >> Andreas
> >>
> >> > This time I successfully managed to build other binaries (e.g.
> >> > dropbear, busybox) which run OK on the device.
> >> >
> >> > Thanks,
> >> > Dan Jackson.
> >> > -------------- next part -------------- An HTML attachment was
> >> > scrubbed...
> >> > URL:
> >> > <http://lists.buildroot.org/pipermail/buildroot/attachments/2022032
> >> > 9/4
> >> > 3c49a2d/attachment.html>
> >>
> >> [1]
> >> https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/
> >> [2]
> >>
> https://buildroot.org/downloads/manual/manual.html#_advanced_usage,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
