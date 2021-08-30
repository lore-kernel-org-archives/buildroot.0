Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDF2C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:59:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7504C60232
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7504C60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44D0E4022C;
	Mon, 30 Aug 2021 21:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAYhE8ZrcFfN; Mon, 30 Aug 2021 21:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECF340522;
	Mon, 30 Aug 2021 21:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 773EB1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7423C81886
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="QOX2RCjh";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="j+sbCNHM"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgriKQy76ib5 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8731A814B4
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630360777; x=1661896777;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=puO5BehiNnlFcresivD0zhgh5mkcT63ljFpl5hQ3O+k=;
 b=QOX2RCjhvL2zlXDZt0e1bIqgUWN9i/t4APkUrWUJFltBfLRzcKGz03KR
 ckzpvMqZiAROdaQGoH4bFm3Rbt/2TFlWoBo29rKYQyPMJjZFLpzUL1nq2
 N0gqVhs9rf2lKZjs3upm2glVr82mloMZCCuANfSYRXCth0z1WdNWauTbH
 28GzX8/I9jaIlC8D1poQHvePmXcI8cB22w0NkLQCMRnWxMBs+RpezS+Do
 xOrE0OGackXE3rEYGxo9pMIa+aBJI6/l7AeTLn2hAaBouSBucfIFqYqAq
 KuuoY9ON4q3ICGITkfTbw9bkhNiwQRo7PHt01Y4Cq8+Sc3jVejfbKY5th g==;
X-IronPort-AV: E=Sophos;i="5.84,364,1620662400"; d="scan'208";a="179348845"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 05:59:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYV5dm+FZJLqoXOY46C7YWNs2xEkMzU6xOerHU0xEk0z4phL3s4y0zuZqjy5A7iJkfaEgvDxb7Vg+4Q8M8d4aQaDGij5oHc2nhM2nRpXLl13cmMTQza8M+rwfXIS5ADaabtEi1z/GyCTobGZgvi2p+X3o2YDaREmYgsV/g0aMpay21HUujYcFBptsGcXtrSkE1/yg97y01xShW2jJHW3tvDzRtwQ2kMDtl333Xdgax/p8aCc0Bhy78OQeyoXdtIwEq0B/g7R654pnuHr/knveXCtcNoI4jeNpXpiNJJhUMQecnEk9qkWq+kPHl20+Htb4H/BS7fGpCkWLaGmdsSnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyC4D01/6YH0P4vRqDRN6/k1KQYf0+WLz9fsfePhiyo=;
 b=dB4qZdleceRhd25HTyNHUOJJ1z+4ZZzqzU9YBfnpJyCGx2lC3YeNXru8mASjaYFDPMaSh9JPusZCK/3sqRVexs3zeBxPJul2NAy1u9ib/jjbSX7BgG5wUwzN2pxTZiegUjhrhlXRaZJWEwxCZPakYqa9JI1mmG4psWYbRzVW3L2cKQIugQtyqsDji2E7RyqT8Jiolry7+wgfUj/e+b8WpTEIG9o254AaN2QzpnHKrBv8sa1mqrMy5jlukrNeEIpkJ8YgUWdBONyV2/ah8uAGy0/wQNaNcr+vS78xgq24nXpEGXT4kSkogf9Mum9oETnAIUonw2XwilRuoXQ7/DJI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyC4D01/6YH0P4vRqDRN6/k1KQYf0+WLz9fsfePhiyo=;
 b=j+sbCNHMLQhEIxAgix08cUfGVD1bGPkme1bqyso1orw1njHMNFV0TUF4U3vIf0plOgispOFebR6VajY08hIYJHbdQcZ1SaRT9v076umzqFIWPOTBKrUzKAvpkKkvKai0hfIitXdWTXtDXUQS3tYcB78cII6i7bXCbzYXBV2pRQM=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5162.namprd04.prod.outlook.com (2603:10b6:5:ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 21:59:34 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 21:59:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
Thread-Index: AQHXnVk/rzYzuQTHY06293XzqLXqqw==
Date: Mon, 30 Aug 2021 21:59:34 +0000
Message-ID: <DM6PR04MB708157B4BDC69B731D6D497EE7CB9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
 <20210830233204.2d8dcfad@windsurf>
 <DM6PR04MB70813B0A7EC96D8CE9D4B79FE7CB9@DM6PR04MB7081.namprd04.prod.outlook.com>
 <20210830235559.795cf97f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 101ed7e7-9060-4e51-878d-08d96c0173bc
x-ms-traffictypediagnostic: DM6PR04MB5162:
x-microsoft-antispam-prvs: <DM6PR04MB5162B0D0E109A782DA91CC8AE7CB9@DM6PR04MB5162.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z4bT6RcQASvBdW9JTBcNfpkzjwzAdz6TmjQ0savMgRmj8a6mBG1Oig4Du9E3ZIudboua1pVxH65wCbF4BAj2GrjSm8ulkn3YNyBzuQMwA0o3xfZU2DsW8aSUP1CMuiVO670zNHrANWFYp0zP1fWKgIwrViy4+NA4rMzG/UNehCgF+udlqhPiuHfZ/Qs+O+x7DQR5o4xYvROILzb8X9HzvRfrOsQ5f1T61aA+uan6RX7nGMDTOC0w29T5HmpRPI98sXWXb8I4AQXhKEM63t1L4T359zNsxpBNbddjHk0ehKFr2uDhghQWNIf0HcQWf4XL/+vCN2A4FjeOdMSMWXfSm/lmL35ak1Ur2rcHVeWet5bhjMn8gZmsTEsUOU/tIwcrcizgJ33UzlDtOfBGHzoVbVH9YHLnTjgMqwB08v89XlE04P4Iv1OFdkAwi8KnHs7Ju0B6Sb+3a3Udno2UCvWH+Pxdyh3SZC3/O+322r6P2nmHpVyTLzFYkSFuJKppqwv99tsVbCRp8+8t3FHEASyZfTZbObProJc1MBHnqfA5UI+O5ifPp+5cIoKqmU9a+Kn8R7dCmqydc/Obti64COI7XK53LV1H959ONksbXL5zu/YmcrL3viKVdE5dY1nDarHu//BZRwt66FXWEmo5+qIGwyPfnxm1DcwpjL7n1jlftsLgcLS9Jg/KFA2ea/0Rs8lNROQpcUCXkwkmcOT1bmGbrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(53546011)(6506007)(122000001)(316002)(38100700002)(478600001)(8936002)(186003)(8676002)(38070700005)(71200400001)(4326008)(66446008)(5660300002)(64756008)(66476007)(66556008)(54906003)(86362001)(33656002)(91956017)(76116006)(9686003)(66946007)(6916009)(52536014)(55016002)(7696005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?31c0ZHCA4YlXwPFHeb43MD1CFHPtJUVvcztED6dgVa7Ra9NxU/GOao7q0Y16?=
 =?us-ascii?Q?/w4zTXYlxrho60CzP8/nzdZasO1qqcwlx4XgbED1NLBTo4UdY6c8W6ebTMIJ?=
 =?us-ascii?Q?QJjL5tLhGRgy+5FmwltmB+qFSMpYmENEAwfQ+HdDzSTO1mo7cMAT6alc/XR8?=
 =?us-ascii?Q?gvMzNuRShcbTFhQ+SDMgY1Um7pNQy0pez44aflEqp91B16YVHT5NuqqpcCoA?=
 =?us-ascii?Q?3aqxEi1+Mj6uqCvurHk+E/lFkF7eXt8289MtMz47QnYD0u0wP//3AqV/r4z7?=
 =?us-ascii?Q?gYqdRHJuZecXkfnAZD2qAV6ERFhl+TQkfwsWGC3UxH7JBWd3FWL9zxDuJhlC?=
 =?us-ascii?Q?6IkarjShYiyxtRhQ+v/F1cY7Kvd4eMYjnd2Bhjp4D5CHzHb7pSL1u27zEddg?=
 =?us-ascii?Q?tq0uuyzsVpHtvkcp1zPMJyQLthNDwGzFoWw0lBbSpVSr2csbb68MVh0gOxs7?=
 =?us-ascii?Q?y3f4Dcbk2ce8gpcuZU3+q4Mgkf9VLz6J4Udk9VrQVEnecm7VBeGusdpYnlCA?=
 =?us-ascii?Q?EU8fhKcKUQJyp+g02pomU2x2CYuFH9RBycx3Qiw/l4jUX/kOVxZUFhQETrwV?=
 =?us-ascii?Q?neUmpJ5ZAm17xUmxkw0MzJwgLwhm5IpnZ12pipRXLeKVZa5oVmk1jvTZzsgw?=
 =?us-ascii?Q?8SLz+qxAPoHTQk3nKq/csC0WbjYKRo9dseeaPgErA3OZLy7qYZBM24bIMmaW?=
 =?us-ascii?Q?UdMMrpLR40kDkFCNaAC/98781J1pWVs8AYjT9jmYonxk1URrbpclzkKiGSr/?=
 =?us-ascii?Q?pZ57YIbcoDiT8EDlyLwZu0sVqJwo0/FGzUq8s5T6Kh5E1TH47XwKegEbgjsk?=
 =?us-ascii?Q?YHlBXXmzgQz933EUTaDJ87i9fCNOHk4JTntT7A4RIwxar6QWnkTA1+hzsEFo?=
 =?us-ascii?Q?/JozXgdj+/o4fzIYtTe4qidOZWGNiYXaTCt/U+qqz0jomub7GYWbPcFq9jZz?=
 =?us-ascii?Q?CK3l26heUTRmdk68t68mMzQZkmu3md8wl/h4cflhKQBKVBtedsK+pfbJ2A0m?=
 =?us-ascii?Q?+am+3wZJzlnu/tE6Jeht4S7k+mTv9nGdDtqtu56mne+HoqqGuFJ8tq5V43cg?=
 =?us-ascii?Q?tn6/Y/Pu2MTgBXRWc9MFtR5npBIafmfgOTRL6tf8Y1nSzs074TKIzyOF6rHr?=
 =?us-ascii?Q?L1CCovhzV3QdKdAKn7zO4WuobELE3gBAOEARcq/hNcPXxkXCtp7IQFusiWy7?=
 =?us-ascii?Q?eOK5DQEQ2QS1HT7EMeanqfZR24m0MqAQnoPtzT/55XmSbfZY0vOcLXqskgMq?=
 =?us-ascii?Q?iRysqLDPCRfCMqcMb27fZBetdX8b3pX3BrowcgRtM/rIhmhf+APdJ5KT6eHS?=
 =?us-ascii?Q?atojEn9vmrgG/CjEBwtgmzf2rxvaICA5GIqgnktLyjn9FNWTh8mC8eUihf2c?=
 =?us-ascii?Q?jDb9dOT0ZkRqirtGC7tvhKGfltXCUvbJ0e5r+i+3LSWWMRYD1g=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101ed7e7-9060-4e51-878d-08d96c0173bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 21:59:34.1351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GyXce8qeKuEB6ITsXr55ccN9mFs9ri+wGvBs59kxo5ZmilSKGLruHLkoKGJ1AkCcYnBMHagB6/7GWN2E0Dbcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5162
Subject: Re: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/08/31 6:56, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Mon, 30 Aug 2021 21:42:02 +0000
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2021/08/31 6:32, Thomas Petazzoni wrote:
>>> Hello Damien,
>>>
>>> On Mon, 30 Aug 2021 13:40:51 +0900
>>> Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>>   
>>>> Christoph Hellwig (2):
>>>>   package/elf2flt: add RISC-V 64-bits support
>>>>   package/Makefile.in: Fix NOMMU RISC-V 64-bits toolchain base name
>>>>
>>>> Damien Le Moal (7):
>>>>   arch/config: Make RISC-V 64-bits MMU optional  
>>>
>>> Just tested with the first 3 patches applied the following defconfig:
>>>
>>> BR2_riscv=y
>>> # BR2_USE_MMU is not set
>>>
>>> It fails to build with:
>>>
>>> /home/thomas/buildroot/buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt: Loading to RAM ('-r' option) 
>>> is required  
>>
>> Yes, this option is mandatory for rv64. The elf2flt patch checks for it, but
>> only for rv64. Other architectures should not be affected.
>> The following patch that adds the Sipeed MAIX bit board support adds that option
>> to busybox build. So I guess that build option should be moved to this patch ?
> 
> I see:
> 
> +CONFIG_EXTRA_LDFLAGS="-Os -static -Wl,-elf2flt=-r"
> 
> in your Busybox configuration file indeed. But what about other
> packages ?
> 
> If this is needed for all packages built for RISC-V 64-bit noMMU, then
> we need to have it set as part of the toolchain wrapper. Actually, the
> toolchain wrapper already passes -Wl,-elf2flt, so it would only have to
> be tweaked to pass -Wl,-elf2flt=-r instead.
> 
> See:
> 
> #ifdef BR_BINFMT_FLAT
>         "-Wl,-elf2flt",
> #endif
> 
> in toolchain/toolchain-wrapper.c

OK. Got it. Re-spinning with this.
Thanks !

> 
> Best regards,
> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
