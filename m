Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F20C4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 09:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C63410B0;
	Fri, 15 Dec 2023 09:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C63410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwlan18qKPNe; Fri, 15 Dec 2023 09:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27738410A3;
	Fri, 15 Dec 2023 09:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27738410A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D99B1BF842
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 09:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DDD3410A3
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 09:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDD3410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECJZoW6-1DFF for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 09:40:12 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86EE2409EB
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 09:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EE2409EB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRbIMb8m/BGVIUDmaNm0pV2ZaiSwmTUMLxucGBxiT4Hp2wt2jx+QL4LpkyXUIjjssMQTCl6Tz8/cJv1y+FEj1YyOKpspAG7rbbC4cLt1BcbHhEI1jO8/qmQm0JmE082sHKLRGsdH/Nq3pPNlTK5VoOs9eF2bRimNuPSwpxCRQqqnh7ivJPY4cRf9JMPx6Kmt9B1vdpv4Bt0kLHRDj8BVcXMLo9Uz01EiXow2snRvVwVg4p1tPiGQ9mC0CFsn82aivtP6K7YphhiC+bWi39DJJd0DbQAXBCAMFRduFd06RcvDE+bB7pUB837alvA5TWuQdUAIAxaf/QJ3+/z/Roo5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CkIxCynnaYAqAdw9EWiSMwLmlPKQLc6jMKhuCTG7sQ=;
 b=eTHIk+KLEX/7YCElRdEbxk7GDh8kaS2ITedwo+way+0VVkqCMLFskgwXRf38N8A5fE7vCewImys19eCerTwNW1OIpDwfP9mGb89VK2DffuuoFv+Gs3sTctPz5pJdX9TSdS/zvLPXdrYSX5jZ4pt6jXbaDh5fDlpcu6MOnLAQwiJIkpwhAY2WNIhJRIv/oanLRGpxHARLjB09q3sIvRKUJjlFJc9fhYdvVcSQ1OLfpKp/E3wo5TiCZTtOobgw9tdYYX/Bj/juYXmXgo9ilYk1XIZfPlNfSvoMqpABvQGGJemHpTF7MFQxhcMnOO0xMMNIrITgG7yIELgzVC8PmbnzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 09:40:09 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 09:40:08 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgAB1mMmAACS8AIABsckg
Date: Fri, 15 Dec 2023 09:40:08 +0000
Message-ID: <CH2PR12MB5004D370D47CC1F94A52456AF093A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
In-Reply-To: <20231214084116.48e04ecf@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB8419:EE_
x-ms-office365-filtering-correlation-id: b990d3c3-0b57-4ef8-1685-08dbfd51d38d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwExUOtLrXi1eC0hw8OHQsZlluhZGt3ab37IzdaSgu7oKkbQeXKFEYyly4fI805f5skD0+PX6+cM+mPMl+5M2Y0teqg9FsQf+3oDYLSyRKRtTF5sWnaC19OS1JV7FbOZK+kqwVERYx5gUcksDXUFsB0mXzBYUepUSLBrpZeeiwGdoqzZ93Zv8wY8n3ipDHSYRdUUQGIF2LRnTNH4F77M3e6XhqmPG28xTTVGVGrdozvQYbxbPsirtfuLI76ED0/IwBas9ntRkzgTFs08FoonElYjVfi7xqsPCILnixANpkH1mWJGUse27CEqTk3rxSeXPT+keY0xAlb1ubGAEe/4ZvXOKyzcGFtDTVdpOHXaTWx8wYkutYQCzzIh0tP5VcVShA21ODtIrheQ7hEFZZDdK4NPjiJ8XGgrgl1qx32QUl1FaNE5iCP+BIMw9Pr+5KeV8kbnnW+P00jAxKIQYeCnf/EMHh14LB+uQH071GFB/58yHQASUIc4PxnK8F8Bt052GcxDXdkOk8c1UhDKetkjIBmKJXmWiMW+Lft4VG7h0nGmuwuu5/qsP+AZkOWVeGmap9LCd5ELOz1SwRtvLmamafQZHqqFecu2ATqQ+zCU0yM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(71200400001)(9686003)(55016003)(66556008)(966005)(26005)(478600001)(86362001)(83380400001)(52536014)(8676002)(4326008)(8936002)(66476007)(66946007)(64756008)(54906003)(6916009)(316002)(66446008)(76116006)(6506007)(7696005)(5660300002)(38100700002)(38070700009)(33656002)(41300700001)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qlDxtedbnjicr00heYHcjP7Tg4rhjN9ftA4X89x66Zx6qaMT6A5E6Skol7bB?=
 =?us-ascii?Q?DAfCA39S7Mtz+0VdfqH3w8DHxpok5Inn5lUxn4KSBgDPDrglMGUmgXzpTn1x?=
 =?us-ascii?Q?7khEdqXQyG5SEx3j3yw5c+SoyMJz8fkAcMjn/uIIY7zdJcluG2yJ6mtO80l7?=
 =?us-ascii?Q?fvpfRAQaNy0x5QYr6GDBsvTITdQtCGspFstP/cJm6oW08KVFivK5mPScfWmG?=
 =?us-ascii?Q?tFGqZCNdoO/2xmHbo/wGRC9YBtxU3g6N+9YzQ78Omg95Au8M+ulQocVTzqIg?=
 =?us-ascii?Q?wyi5iiaEXzZLyV3RYnKQyZIbLtnIF7y7hC8K4UkmIBgIsN18NYvJRubM6u9A?=
 =?us-ascii?Q?N4L4hOzA15G/H/dUMumINaiMHvE1nyKA/74nR6KuPglJKV+xzT0m38z4OA1X?=
 =?us-ascii?Q?lBGlLkjKFXiz5ex9hFwv5R9OMSoBuzvE13C0n4gbtb610xbkwz10NRkp1Zur?=
 =?us-ascii?Q?/d+wB/vQ8JoAYMJ6ObiVs/pTK1wcobZNuh/4nCNXV/LmhfkJXXb6+xgmE42j?=
 =?us-ascii?Q?8F+MMB7S1lnI4NQrouVnMrMyujclVBsq5uG6LNGMnEBpk1YE54Vjg0K7Eg2B?=
 =?us-ascii?Q?G/cEtELrSxOWt6Fyf1qf2ALYC+ykaGHVroqFyBdgVVwd9ZvZU6qlRp8QJsxQ?=
 =?us-ascii?Q?NmhoMwVTr+aWYzLvmabS0GfcPsNIf6EhHzYYwxVvOUNBoct86MYcg0yXUKWs?=
 =?us-ascii?Q?cxUryUPtDXORHTEda/qAkKhWvoQ8rXTthnoi817Rwhzmx9tCCVQ9ponWQDSj?=
 =?us-ascii?Q?NXhnO2k/zINwT5jNd6fLaJqVzsEFuGthCzocTaKkgobeEeKj78JD/oBsbUxb?=
 =?us-ascii?Q?Z5FT0BVb5KR4QuQ3CvCtrg/cFYsRCBCf7lSLPEq9lNjTKp54e7eg9Rc1LoVO?=
 =?us-ascii?Q?LRBLVD1J9U/X04/kbJeW6M23sP584nhaDVplA6NdhBV3YkiUJsLt0/r5QrP3?=
 =?us-ascii?Q?cgJ14S8EnmaglL0lX2+fLmYYlNmeS7faieGgH4z3PuPaRly3YyqzgNqYNZUK?=
 =?us-ascii?Q?t1vAHdKKwMTS+oENV3iCKFf59lvXXhE2hg+AvYxM3Kr58mSeMWFkFdINHIPA?=
 =?us-ascii?Q?cuna12XiS96upsMVl5f+2szR/RMJQBrz2ZdJKARrfClBTsmN/YIv40MYKfqp?=
 =?us-ascii?Q?ioogsR74ek7G4eVrxqwe4s8gAappYLKwFSLWfuU+f7axGVI2bWyKp723kCrw?=
 =?us-ascii?Q?ScQmIAT1BN0MxIjffqMnlJ6Lw7JhMDZ0RYIe75djB3HqdrcsC4YB45pngNyP?=
 =?us-ascii?Q?Akzhxncw19gR6GpOhLJP0fQtg2+PRwUaM8lXurhJ/bomncfvW9XQtDdR35IA?=
 =?us-ascii?Q?iO0iy28DgYrzUVPsjZHKhuUdsSioo+/RmUPKWn5LLp/ErtLBKeKjRn8HQ3f6?=
 =?us-ascii?Q?WZvJv5oqO/NkyEM3mt4dea/bEJ3fGk3OdIPSDulyXTDYD8PFQ/yhlC4QVxPc?=
 =?us-ascii?Q?070k4pQ6FwEG8VSJo7Cx1vykvVRwubOFWnVEmbmKstNdJrrjPjz8U+klR4+l?=
 =?us-ascii?Q?AuqE2DPQlT5jqGV0UsPu+8LN4hbSrzVX02LGE+GPJlQZbDnn10peGEwFkJbk?=
 =?us-ascii?Q?0I6VofOTQH/00bhRs8c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b990d3c3-0b57-4ef8-1685-08dbfd51d38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 09:40:08.6398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztEiMyfcpgcwXWCRG0ozutEkekraiN17DjHVbfzA9QBBcDxZNvJVGZUXT+iI3jfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CkIxCynnaYAqAdw9EWiSMwLmlPKQLc6jMKhuCTG7sQ=;
 b=xGCf9uoIy/RSnfkiCxOMeND/MRBqu8xYJaL4hRtXd931EAhyCV1Tj2UKTt7aJdaNyZn0T7pOR49DmWr5C3g9PM3+OLWZ3wikOu19dieR03aTtfZwQztWTwCsGpWwyJhMcldUrCen9shl0WDHE1bQ3HvhJ/5SGjb5k0zzzemt/Yg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xGCf9uoI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Thank you for your research.  I had not looked into how to fix
> newlib, so that it installs to the correct place to begin with.
> 
> From my side, I think patching newlib is clearly better because we
> can try to upstream the patch to newlib.  Once upstream, no patch or
> fix up hack will be needed anymore when we bump to a newer newlib
> version.
> 
> I will test this patch with your branch as well to verify that we can
> remove my fix up post installation hack.  If this patch works, I
> propose going with the patch.

> Well, the thing is that there is probably a reason why upstream does
> not install headers/libs in the standard location and decides to go
> with this custom tooldir thing. So I'm really not sure changing this
> will be upstreamable. Or perhaps by making it configurable, so that it
> can be overridden using a ./configure option?

I solved my build issue and created a new patch which
adds a configure switch for the correct newlib sysroot
install directory.

Below is an updated pull request with the updated
solution for your review:
https://github.com/tpetazzoni/buildroot/pull/2

I have tested this solution and the patch does
indeed work as expected enabling gcc to find
the newlib libraries for building without my 
fixup solution.

From my side, your update is ready for merging with
the preference of patching newlib instead of using the fixup.

Also, patches 5-10 are good to go with the exception that
the following needs to be added to all of the zynqmp and
versal defconfigs in patches 7 and 9:
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Thanks again for your support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
