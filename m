Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC2FECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 11:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D1CD41912;
	Thu, 15 Sep 2022 11:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D1CD41912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEwTWVnB8cFN; Thu, 15 Sep 2022 11:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F293441907;
	Thu, 15 Sep 2022 11:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F293441907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61D011BF414
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 11:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 474554190A
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 11:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474554190A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqC6hEWi7LQx for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 11:18:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6EBB41907
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6EBB41907
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 11:18:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,317,1654531200"; d="scan'208";a="216595622"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2022 19:18:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfu4vHKLQeg/ZWTF3wgMwnnBlyFOWVt6yuCVQ9E0QtY0GWy0ZLgS9Q7UJR2hDmumVtKMazGtS1aU+GcCg31baESnu1AY2K9qZqX4dJXTUSeGT0J0Hx9YNhh+o1C5B1QbhigTDkmKn2iJXcYbySMbhqvSl6CdXBjiVuIp8nyH6eLYkiVQBEfCjSKg42cb/7XX69zR8y++URc54UECziRj6CKuQ4YgT4GI7o1moZ1kQZ5xb6avKK1p6Vim2UsUcoTk9GiFgvWgE9CKsGecK0xh4/j5XAhNshhpk2QF5qx3se19esxr0hc4+AZiwMJUjLIrk/36aInTY1taiek2DRNxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3ELW1aQkSbgMvHZydWgPlnd2AOloip3DzvCMpmM5+o=;
 b=lI7WzDJST0O+n16ZrbmR0+29uh3yRw1/H7w74XhYdekX+xcEybALLHrhJGXK9biG4p5qdM+oQVcZR030ZNiPOB7cgJwpCbVs97lNsQDtfYVa3u4C+Cj0hR7jrGz+Uu5Wd4Kd/RFsTAosV8n5q/Ib3NL7cg3wWXWOtBCYEGhU5dE2IhVtsqhRLSYrS4ScMMqN5VXVgE0wKPYy1OkEE8z5rzKtOGvcj8XhSdDztgllXyuexPVF3CnCS6LHO2oc0+JD1qqUQPX+bG+0KulfEj+I5LegdLzxkYqP6Vjjz3lI+7XEEZ/dIed0pOFaDMleK1XlqQWjcOaqN+2SDGHUVFNflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by CH2PR04MB6679.namprd04.prod.outlook.com (2603:10b6:610:a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 15 Sep
 2022 11:18:47 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::e1e6:2455:e81e:726a]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::e1e6:2455:e81e:726a%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 11:18:47 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v2 2/2] package/elf2flt: fix fatal error regression on
 m68k, xtensa, riscv64
Thread-Index: AQHYrWZ4m8ztyjw9gU+ttXX13kx2mq3gTO1BgABCHIA=
Date: Thu, 15 Sep 2022 11:18:47 +0000
Message-ID: <YyMKFfqtZDAdUS8O@x1-carbon>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220811094049.798010-3-niklas.cassel@wdc.com>
 <87leqlm7an.fsf@dell.be.48ers.dk>
In-Reply-To: <87leqlm7an.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7158:EE_|CH2PR04MB6679:EE_
x-ms-office365-filtering-correlation-id: 43cf0383-cd72-43d9-54db-08da970c0ef7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GcAaQCySHelBvPVj8owYqsPpr+V6OUwwRfkit2RpEPXvPX/xrIj6j8E9kdoR5huj85GQ4VMXg/y8dc88JqvIbIKtzmJSv3vRo9hpKXTWxpH+031zdAXm/NCYLfkOOAqYHEDljauDL97jgi+3xVH1obtY/B6BghNpr8k2qWy3J2hVs9eVEVX2I1SQr+/0H06aihXDA4V/jNVc7Y4OLyHiSr8imTJa/J58RGruTNDHHohIV5JIo4wDuhf7/NaMW/uKtDD0b9EtWmUJfmy3lG3/62iD8SnV0X2U9H4LUxVPyCZxWreeuPkOQlp90tSl7by+QOMGZVZLkyClASk5X+HE4JdKQ3aZx626xORW7+euKzrbUD9o5bjyZczDVPA1l+35ZYc+rU3ln1FnOYN1wsscbSpG6z+jzZawlYnjqDJDAokEpth+C+JKQJWbQDdAKoV/Yx8iXENZ02UFdClNJYvwmXoHxV1K+tFrYKv0VUg91JwiUvJ0RYtXgdcqqn1YNspWDl5GUUMDgFEag7Hi1BjTVznUhY513k3hl9jkbIGOi4IZh6ndEckeu1jPG6Xra5B+aZMk47SVAJRofR96mYwr0BRwC9J7WHYLS5+7A+ZuzRvIUo/VpNDEX3IfUpTYbRIwVdzdpY46x8kXnhc4KyCcdSQeTl+JWNcdtc3zg8R6Jnu4VImSXDk+3ra+rip4kcedGUmtF/7cYWU34qzxxKODOM/JuePJ3EFV72KCBiARkeax3PCZCCvfFIJUZAmYpG+UmTRwBnrSHELOlbl6+Nj8MCWeTTDJ2pdlN0A1iXR92DC0IhSPQtm4MlToDoWV0IYMmBE2kaj3e0f6ZRoRlipv+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(26005)(9686003)(122000001)(316002)(38070700005)(5660300002)(38100700002)(6916009)(82960400001)(66556008)(6512007)(33716001)(186003)(71200400001)(966005)(478600001)(64756008)(4326008)(6506007)(83380400001)(2906002)(6486002)(66946007)(66476007)(8676002)(91956017)(66446008)(41300700001)(8936002)(76116006)(86362001)(54906003)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oy4JaiAFLWeLP4sBx+98o19sxRJNU74Yi9g3DG53RqsjC9W6f9NZ5qTVTmQH?=
 =?us-ascii?Q?B+DVjrPSLmAnKKkurDa5aYeaJC2zYXguWsZHitK9a+EJBIcjHx1avYN9gQ1C?=
 =?us-ascii?Q?Zjsp2puthjActRw0c+fUfQEYvCyhYTQhqP10fQnfmk8lpZ8nPtV2tfpSNx0J?=
 =?us-ascii?Q?5acrcQ0S3lbppoN27TzlfpcEnwRQRE5vtmFeSZlw5IT9yXh2TjFVyd7pYYC2?=
 =?us-ascii?Q?8uiLSRpdNuHWG3J7N7qS9cRviQJS1dU/nTlduss9RDQF7bKAuEIkdbEo42ro?=
 =?us-ascii?Q?NfCzILGqLOUnNJqeRlpc1yDM1JpxajPiwAtlg1wXyHGpygdgMglNSIZDue7Q?=
 =?us-ascii?Q?Cp5jDqXRm1JnpOQU24xG+mXsjbduwWr62G51P5sV+1W1MaUMTg6aknWGS/Ou?=
 =?us-ascii?Q?knxp4+4BG8b/bHUm6FTfcKjIb4zZS4PXrJSQMVl/uPlJrSFZbMFpd8qcNDDk?=
 =?us-ascii?Q?SCkIXyOWLUHMfJoJNGpjFzCB9YXkAfSgnbLJF12erPoJO6hWwCZwEVJzIgQa?=
 =?us-ascii?Q?VndQ9F+p/Tth2+3J/BO/vRXOsqGfLglwZfnd1NZppD825p+PfApN3KReaMxJ?=
 =?us-ascii?Q?w6Z1DLsV8EFBHVU14Mz6/ukfkT/PMb+FMMyc57dYm+Sexux5bP22X5PSl3qD?=
 =?us-ascii?Q?LLb05tg11GD/xne6UaQuin4bsJ+jhxXwWLo+bYeD8IylLavhdlbWQrn6eTUV?=
 =?us-ascii?Q?lLiiobWtcY4fiUl+iNVQcWKxFvOi4WkagbMTyEV0w7Xx2YeUVVBOESrONjIA?=
 =?us-ascii?Q?itPn1Ib3/djgTpPXLZmjNjiActG65vcWd57iSc4lC7FGjfQ/4SaR/X+pUFjj?=
 =?us-ascii?Q?phEIxGGRZWGYPYB51tWVR4PSdCd417nSy+hZlJyNBwdXSorT6BnLZYdN9DJx?=
 =?us-ascii?Q?fGO7L/G5fv6Wyo9h0C2j9/kXvp4IlTqd5ECt7ISYk7v6DY/QD4a0bjvGlwS5?=
 =?us-ascii?Q?dMe8rE2Udus/j25pbKLC7bgeIo7ejsDxTp7+FewHJPLGewMbI3Dz2EzxaF7l?=
 =?us-ascii?Q?9/lfqlL7jq/lrHYQKJlDXCgJ1IvwKH5YVuuruEILz1Xj+am2GtB16wkpwGQD?=
 =?us-ascii?Q?wR+3WcOkLyP3+tWxAEV7hxuVBG8VRt3nyJ88ol1f7kt3nrLEAsP5sa2hCUET?=
 =?us-ascii?Q?vxfOji5X3Zo2leoDh86knB0lK3YS4xRuL/ERQOWUg+16Zarf4mcyKzy4HbI9?=
 =?us-ascii?Q?IGAaX0+v15aY9E2PogI07hpbPiE6kg+30dZwzXXMJskehHaIsiPtqqb1JcZ0?=
 =?us-ascii?Q?nV2K0BIQs+oX1gXvbeAAN02MyuotgdMAytk5P535MdIpViZjXJAA0cwrRNyS?=
 =?us-ascii?Q?ZkwiVn1gy8Lpghayk0ifMoxbBSYCKFvR9fgmR/xksWH7eAM7X7O/ss563X1r?=
 =?us-ascii?Q?u0WiJ8Iqn+yJoQ5/g40OT9koo0h7F2lHk0WjyyJ1tb/0RF9s/uBeLcExOYP0?=
 =?us-ascii?Q?nE491kM2sT35WJLZNkZJ8I+4ZbhM3smDaPbJB+u1ktppZh/Ve1H/CeJK1LMU?=
 =?us-ascii?Q?ce3INBZAeIC4yAC3bOcKJAes7nmUK/y8pwAoxQUgOPulSmewsHx2Pu/nU7ub?=
 =?us-ascii?Q?KmWEznQePKfksldWAklJ/ZRobn/mDF3CHocxGc+gXwRU7k8ZJ+pTbb2hPDt0?=
 =?us-ascii?Q?wA=3D=3D?=
Content-ID: <48A8D6B9982F0C4E9A8C58BC68543299@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cf0383-cd72-43d9-54db-08da970c0ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 11:18:47.2213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JThCrG1984+L95LKrvAork6HFPIXvG07wMRBekts4Xyyrr71MZoLFQtmUISo4gggsEi6ly7pNOofsc7dNoFsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6679
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663240731; x=1694776731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=pC2K0nSAD+sHP4ZMFkCPCCPERX7wKJggCL/jmD/b/Dc=;
 b=c5BqEO2PSBW5MVjM3mQdrObDFo+TDIH1Y773fApTJSy4e2yeeBrNuFVg
 1zr6PipZ5NiOKBdyqQ/DWTeAPLWbAwtRb/6ab2VbfdoxSyIufLV+YmCzl
 3cWQapqO02HalzBuIF/AkwUPvFrGJJ27wfIylqq9Bc6vAYi92t+1S+h+w
 TovtFAirKa177+Eq3yhuWFsQ7kBnccXnv4IS0eoOzhkKslIRjvtTykZ+u
 Tj5ip5uQT1z43hylMlW41MLxtmrpd2tQ4ZynYw7oAhiyJbcSwwvGPGi2C
 OLM8YVwpkYkMBUQX+5cr6N/vv3A5BPb/G0lmXzzDD9imaHVWg/8gbkC7x
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3ELW1aQkSbgMvHZydWgPlnd2AOloip3DzvCMpmM5+o=;
 b=AaRK0ATGKqjEOYJktquNw3PkZXx9K8GAfWm8ewIHO0TvshDJG0qGzFu9HElsohVT45VlIAnmDxarYcRqzHSTTTixbkjp36pO4+O10P8KnYw37IA8RmvAv6td+rFiZ0Ql9V2uHl/ieZ1Le24JTb/YI5KfeeVyxtiCRGuMepnvfUk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=c5BqEO2P; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=AaRK0ATG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 15, 2022 at 09:21:52AM +0200, Peter Korsgaard wrote:
> >>>>> "Niklas" == Niklas Cassel via buildroot <buildroot@buildroot.org> writes:
> 
>  > This series fixes a fatal error at link time on m68k, xtensa,
>  > and riscv64, caused by a bad upstream elf2flt commit.
> 
>  > Without this patch, m68k, xtensa, and riscv64 would result in
>  > a fatal error:
>  > ERROR: text=0x3bab8 overlaps data=0x33f60 ?
> 
>  > With this patch, qemu_m68k_mcf5208_defconfig,
>  > qemu_riscv64_nommu_virt_defconfig, and
>  > qemu_xtensa_lx60_nommu_defconfig builds properly.
> 
>  > riscv64 and m68k boots to login prompt.
>  > xtensa crashes when loading init, the same behavior as when
>  > reverting the bad upstream elf2flt commit completely.
> 
>  > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Hello Peter,

> 
> When was this regression introduced? With the update to elf2flt 2021.08?

While I didn't include the SHA1 in the buildroot patch,
the SHA1 is included in the elf2flt patch embedded in the
buildroot patch.

ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")

$ git tag --contains ba379d08bb78
v2021.08

So yes, the regression was introduced with elf2flt 2021.08.

> Are 2022.02.x and 2022.05.x also affected?

Buildroot branches 2022.02.x and 2022.05.x both includes
the patch the upgrades elf2flt to 2021.08, so these branches
should also be affected.

I've tried to upstream my patches to elf2flt:
https://github.com/uclinux-dev/elf2flt/pull/24

But maintainer seems to have gone AWOL :)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
