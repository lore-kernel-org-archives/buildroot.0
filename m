Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF2CC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EEF60A47;
	Mon,  5 Dec 2022 12:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55EEF60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7cFYsvwHox5; Mon,  5 Dec 2022 12:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885886068D;
	Mon,  5 Dec 2022 12:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885886068D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCF4A1BF4E2
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA2A4816F5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA2A4816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8xgPnPt-Kd3 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 12:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B098149C
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::61d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19B098149C
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 12:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICN86urLxfCgdTp4hWB7CWWXrLDsIb8tAjTprfbsxK5RNDtPpapJluOui6ui1/ZmFclNAPlKbOyfX4cGPP4Bvb8aIbqqWbUWGqYSN8sDzS4sgCiaLYIoybYB3WmvNhBXShPZ+p8gvtB3qoD+LQJcd2aVYLfkAvGI0KMU+OfJmXVTsiSNrQ884odmmLa0bQY+7ZUksQW01iiFfsiOlXcz8Ji4vdfsssHuhNq6SuMFuCot8gxf2TBcYwNJRTUeovwNwQ8bHfradTsBboWnhFbppQOsc7W5U5P2/6yid/0fvOqRX85vTWOkQtJsSyMu0/yi45Yx301Ex3HDFPLv0pbr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZVxr6SWvQ9ZtL9j0c/aDqv0+s7Kfy9279p9+DSEsRI=;
 b=PxkwzvACphLnO6pLd5AkxgQ2A35gV2TMEuPnmgs0L5te+AxguiL0esEyZndX2RibG6q+K2Mtre6j08oqrDdOuKyI3JLq4huVIIMuntNRO7M08XztaibZAQhUUTNxKeHGBmw4Vt3/nEFEresmVOks91XlGULe0NPJzX5TZO8sHNMebUXUprTQEKicfgcY8XPXJZP8bw27xj805jVFwMI7KuGmLPew7H3LDkgJ/i4n4CqfuQiCLygFQthMyZOibf5c64Vtv1nDm04l8KimiSS/6r28+Ddj6OfIVP5hgaBn+F1jcFpaA/OCTRI119llg5xA9dkK8RNLiVr/RnAQWsmpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 12:36:30 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%9]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 12:36:30 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: R: [Buildroot] [PATCH] support/download/dl-wrapper: make the
 whole dl_dir writeable for the group
Thread-Index: AQHZBMHgD6bhKwuAQkW/uxKBP8W5/65ZfLoAgAEa0+KAAGfEAIAEQmJf
Date: Mon, 5 Dec 2022 12:36:30 +0000
Message-ID: <AS8PR08MB6870B0AB64BA09B2EA3C73D081189@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
 <20221201202558.GB978091@scaer>
 <AS8PR08MB6870CBA6B56FA36972D523AA81179@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <20221202192938.GA3302@scaer>
In-Reply-To: <20221202192938.GA3302@scaer>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|DBAPR08MB5573:EE_
x-ms-office365-filtering-correlation-id: f9c31ac0-4eb9-4110-28d6-08dad6bd55f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d3kJFKqsc3+R46hpCJcOBp3D5emkb1d4bWDa4bXYg+Rpefrap4R3nzY4DhtVvxVTVfo7LGbu4rJSOhSAJboPXI8OfTIAJSBuHQrEHVRpIfFOmfFA4y96lr7yxG6v/LmAHCxdcAmavnq7viSoVav3NwwxZdQbRchiSk0B2Oh9ZtO+Mmr92iDTmTH8vYe4CpIAlUxPfXLGdPcXkP+u3/BEDs2Ce071ezYcncx8daE6tHnOEc8kEhPXazDbrOGwRpCOdkEdevZlxEp8w4IN15wV08ZUpAfNgnMU8w3ofPN1f23VPVVmJ31xmrzuWaU1iYd4RwUoYFEhDojeBqSTdT34tqcXcBhSdEc7zyyhpXnaGS7+Q8FupXslGsP4orncXw83ttaEHuTGyGxPu14WC+OllsctLlsbbZladFNmPEbgDXhSvXvFsT5sWDHfZxI8gSsh1/kD/q2clX4BzBEqhyJNEpsCVGALtKGREDVj2i+2XKYi0GrMndeJYme0hkva4d7aF7jmcZ4nwNh1B0V5ol8ASokpFaODLS4fzMWQTIVHUja6qEU/VC4EHm3tNzHxeyUZrkodXgoyApr0EYuRNy99j3KeXB1yrgKik4bsB5LOZ+g/6iyY68cVXbH3btKyljpttR4hKRrizVJA6NIAx7ufq2tQlhNEJ/Bs5pWbhpkyOeQqdGvvvH1i5tfJS+FTJFbk36j+++S4j2XhjWlE7pRwsp8rC/deRa11rmR1eT5ODWngich/MXW8ivchm0TtIwbCun/2CWPXuWKfrZ23wnpaHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199015)(38100700002)(86362001)(8936002)(5660300002)(4326008)(2906002)(38070700005)(41300700001)(122000001)(83380400001)(33656002)(66476007)(76116006)(478600001)(66556008)(316002)(6916009)(66946007)(71200400001)(55016003)(91956017)(52536014)(66446008)(8676002)(186003)(7696005)(6506007)(64756008)(9686003)(26005)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q8JkZmXRv833lz/QSYhdY8bZbZDGBV6c8RAZ20T/BaX0amVlEb7n8fg5NP?=
 =?iso-8859-1?Q?szRRWHWE705PRrgk3cFpNLcR8czdDMijtZg00I7rXrTLGxWmC3QKYn9lZd?=
 =?iso-8859-1?Q?uZfLqRcSoN1enfBl7LuqpVIZ6mE90eLMZtAM58GjHdL4uL5mDWL88wvCIn?=
 =?iso-8859-1?Q?ORVclDz45xVIO93hLqAgT3rceB9fV0YYq3mgoEKNi7eFgAtJRKCBy0Z3fq?=
 =?iso-8859-1?Q?quHkm3roL+JjJC9FNvVihmkQBQr/prxVWv41bgDnWaS57WYn3BVkFVr/SQ?=
 =?iso-8859-1?Q?mRJJhm34HCIWcGWzRPhQe88G10Vxs0cyJvEGG6cKccZivVH/3mhLR1q8zZ?=
 =?iso-8859-1?Q?XdNsEV7l3rz7vZlynnPLsdlzCk8Ppnf87FfG5hN4b7SobcYb6qzmGvDzv8?=
 =?iso-8859-1?Q?f5ekPzRAWXOGoTttb0OXlomATrUnLYDO8ZnSsE6dOFh4LsGZvDRxIGNeKY?=
 =?iso-8859-1?Q?lW0scuWeZsDmTjkPwSGcxQoRqlhF4Jt80aKiFZtcX2Ns7Tzvy6Fvs8t6Y9?=
 =?iso-8859-1?Q?Ia7W2qNNON3gnVXc4n3hItGEpd9NNPapGCPm2mLBX76T0wsonxL5jAh5QM?=
 =?iso-8859-1?Q?smjSOThtxRoaN97uQgYGQsbGgpQgptnJWntI1upWc3tS713+fm9DgSPRuC?=
 =?iso-8859-1?Q?bX64W01hqvqtR2tL8WCLZeNbzhVIRv31CBT95gvgHnhkE80+VjIOLYAZCF?=
 =?iso-8859-1?Q?ooL0vD+r1FhgnWFYaB/JZS1B2Vrdb8bAxT+W+4XdKZxF4pBNFAR5ENxCTX?=
 =?iso-8859-1?Q?+2nXtgz3f6sJfFYylSnN7nHeZ4+m6tObeKA/gy9v0LKhxs0lpOXrXXRtjM?=
 =?iso-8859-1?Q?1RO1mBBEpyHfrCzf2qizawfdJkxgUFuEie08KwnDZIbKtR4dPkAjs0z2D7?=
 =?iso-8859-1?Q?X8AnoPlKnkjcOKtrkFwIA4SM9WYIgXellkSRb6Y7Pr9cFEYCxi+goGILPg?=
 =?iso-8859-1?Q?5BguPRTBO/WRxhtIJ/Ywtc71z64lfTx3Tia0SP+XtX/caoHFGwRViUWM6k?=
 =?iso-8859-1?Q?ka/6yvo+TvhJiZF4g9MOjWHFBi1yS9nQsdQbW8qCIqWcA3CJ41tvJ2+6CK?=
 =?iso-8859-1?Q?2fOAkDqlI4NBEtxcWxrVgWTIlINdx0PpX2Q2fU+N60hj2mRowcO1DUK/Hd?=
 =?iso-8859-1?Q?oc8M3iZPODI298OocvHS1yS5R1xjw3dcjZkZN74O5+C2UZYFAwN57RdS8n?=
 =?iso-8859-1?Q?B9d8UnIngdaM/tPoABCkH9NErtbd9aMw85h7p/XsJBAmdrxgtf7Vn9kghD?=
 =?iso-8859-1?Q?ML9KETO1+y6lG9bPx3XE9OJBJmAE+g6r95fIFVyhHBnFPL0KDscypkkfFz?=
 =?iso-8859-1?Q?9PuLAXilR1tUqL/DAQlu3cPBaECi/pP8TFSpum+yfcYkV8lxHkfyNZ6Jox?=
 =?iso-8859-1?Q?L5hbgHbmQOI2nO56i223KOCCVaiHhPFy93GBb2AXDtAJ6gAReOel16Kh82?=
 =?iso-8859-1?Q?p+NeIChZkh4IX6YhEwuIw0/u7cTsdO4yASKuE8Cg8aqgVtgY77dATmhpeT?=
 =?iso-8859-1?Q?+zr8ebzuxp6tSz9CklVrUMo2vcYXZP7aecyzqP39YwbV237L1P+ERzgQ/m?=
 =?iso-8859-1?Q?cTPqEphSj7W0ee+f3V0ZjSssB2hA6iGOr6ATCOt0M6bRCBRW4KwuU7V2F3?=
 =?iso-8859-1?Q?k8A8/Sk7ZCDh9TPtdorDRAq+HwjSTk2ATB?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c31ac0-4eb9-4110-28d6-08dad6bd55f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 12:36:30.5155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HnjXdkrgzx8JUrqTc9uUm5BCXU/clgiYJ4WpeHBxgg8w62+rVq3x5kb3McQ6BDii3VMIdiz6iVTFm9t643yGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZVxr6SWvQ9ZtL9j0c/aDqv0+s7Kfy9279p9+DSEsRI=;
 b=noC7joZRDJUq6mtNJyfjDfaNdfaqdpT289zN7nQDtTXVa9ZT1yzFV9logMTrl5Byo9oW/IQw0Ffi0/mJob9gVK+ic2iZcb7E2nZsJNiPUmiJq4np3ThfMotUsgznrMQKoBT0YFFakv525OIpGF2ezdvy3iIuxHRNob3CGkfobcU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=noC7joZR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: R: [PATCH] support/download/dl-wrapper: make the
 whole dl_dir writeable for the group
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

> ________________________________________
> Da: Yann E. MORIN <yann.morin.1998@free.fr>
> Inviato: venerd=EC 2 dicembre 2022 20:29
> A: Pesce Luca
> Cc: buildroot@buildroot.org
> Oggetto: Re: R: [Buildroot] [PATCH] support/download/dl-wrapper: make the=
 whole dl_dir writeable for the group
> =

> Luca, All,
> =

> On 2022-12-02 13:47 +0000, Pesce Luca spake thusly:
> > > Da: Yann E. MORIN <yann.morin.1998@free.fr>
> > > Inviato: gioved=EC 1 dicembre 2022 21:25
> > > A: Pesce Luca
> > > Cc: buildroot@buildroot.org
> > > Oggetto: Re: [Buildroot] [PATCH] support/download/dl-wrapper: make th=
e whole dl_dir writeable for the group
> [--SNIP--]
> > > > +    # Make the whole dl_dir writeable for the group, so other user=
s within
> > > > +    # the group can download new versions and update any vcs cache=
 in it.
> > > > +    chmod -f -R g+w "${dl_dir}"
> > > But what if the user initially had umask 0022 to begin with? By forci=
ng
> > > the group authorization with the chmod, you are overriding the user's
> > > umask settings, which is not good... I for one would not want to have
> > > group-writable directories (or files) created when I would have not
> > > expected it.
> > Yes, I can agree with this. However, BR already overrides the user's um=
ask,
> > and, at least in my case (umask=3D0002), this changes the user's defaul=
t,
> > denying g+w by design.
> =

> Yes, but the reason we do enforce a known umask, is to guarantee some
> kind of reproducibility in the generated target image. See commit
> bee5745ccc20 (Makefile: don't depend on the umask) which explains,
> albeit only briefly, why we do it:
> =

>     Some packages and BR itself create files and directories on the target
>     with cp/mkdir/etc which depend on the umask at the time of building.
> =

> Doing the fixups in target with an explicit chmod or whatever is not
> possible. Indeed, some packages also do their own chmod, and we have no
> way to know.

Ok, now I see the reason for the imposed umask, thanks for the explanation.

> =

> So, we can only resort to using a known umask. We chose 0022 because it
> is sane by default, and usually, packages that install files like
> executalbes, will want those to be world-executable (a system would not
> be very useful is only root could run programs).
> =

> > > Instead, what about something like:
> [--SNIP--]
> > Yes, this looks good to me: you honor user's umask in the whole download
> > phase, and keep the 0022 for other files created by BR. So a better app=
roach,
> > for sure!
> =

> Could you handle refining this change, test it, and when/if that works,
> send it as a proper patch, please?
> =


Yes, will send something soon. Do I have to ack you in some way in the upco=
ming
patch?


> Regards,
> Yann E. MORIN.
> =


Thanks and regards,
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
