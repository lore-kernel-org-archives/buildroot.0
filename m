Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5573E7718A
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D05380F0D;
	Fri, 20 Dec 2024 09:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDL7c8Gk5B2E; Fri, 20 Dec 2024 09:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACE581253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACE581253;
	Fri, 20 Dec 2024 09:22:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB89920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AEA7416DB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKUzalsFvZXb for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 09:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::61a;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58F0C416DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F0C416DA
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58F0C416DA
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuYFqh9xaneH/rA06LzAavbQHB5bS5iw0gBx9ClMbNKkEAHdQgbZJrP+NIHi2+7oCT3Ggb4XmKv4yucY8kMIWJRD1vTT4GIBsEpd1WzOGKYDiqMcPhJbOPswM5SJFU7ntFD1R4lUSddzmfmEHipMr4ZDh1k9dBTkJw51ce9bujcX/AyVRa9ZwhRSf+VMlqtGKLVUWs1QnPRMpWPI4iAE+u7VODCPcq/LkM2CbX8J1tp+aX90x+K4yrWpo8LgYkSwGNRAUTc/dvZzNsIdZjKyVWpZBvq/f5r7Syk76Am10VZ+RHHWK5pPdTtg8mqFdex5zvHGCMwmm/E+FXltnOHehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFB/eEoNy+bFltWOtosiIEP/iQ8HDL+k6amir0xSW2o=;
 b=terhy8ADDeGnSbzs2x0VPoHf2MaRdWuZ702Ak/NVt90aCsx/IsWqQtZTPQGLOnwu0l/L75yalSgIjZJHclXugKFdayPi0lB2z3EjlbqiLN5+t6aOP8NU1eGPOWnx+jYmK40syK+WCtfhJ8TKsGiCZUurJKMMhjWWgvOPd5meCnHBLVXFyyyrGRsmpQVZIM7wFHDG7xrujtzQvVAtMOnarvdmqIW6V95nPFC7CmqzcErrDcmaiTZ0+nw/nW1rU1G2prUddafqk/6hqkFGpJ96wDCgVkTgbvgF2JYd3MiDilOSBZNegipTbPPz1kU7+eVIAWk1cKsCmDKJEURga2ucPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 09:22:13 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 09:22:12 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/2] boot/uboot: add qspi.bin file support
Thread-Index: AQHbURl1Wc/g90dfEU6WgDAfGix1ELLtWUGAgAADmMCAAC6WgIAAFbWggAATaYCAASlr0A==
Date: Fri, 20 Dec 2024 09:22:12 +0000
Message-ID: <CH2PR12MB5004FB16882C12871E8F946BF0072@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241218065239.503162-1-neal.frager@amd.com>
 <20241218065239.503162-2-neal.frager@amd.com>	<20241219110653.37083055@booty>
 <CH2PR12MB5004A6A41AFB5D27366A93F6F0062@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241219140629.38e4e37a@booty>
 <CH2PR12MB50045BEDF784061973EA5A58F0062@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241219163339.53201f66@booty>
In-Reply-To: <20241219163339.53201f66@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6099:EE_
x-ms-office365-filtering-correlation-id: b27d1e52-58ba-4d8c-ebf7-08dd20d7c980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nyFzLIZm5sjL2+azsyomu/aD3iLKkjxP+4VCT0e9ebWLjULn+AfUu2p0Nc9D?=
 =?us-ascii?Q?8GfaXCTjGg5+nZ5MNCdia8tJTHsvKNCSLlEG9aAQj4MvTdGJ9D3wFdBEX4EF?=
 =?us-ascii?Q?PRYOnirME3LTGxUhtc0r1tiYHRbd7GAjwLd1yZEaOlI/xTRZIsyGDd2QNXFr?=
 =?us-ascii?Q?6ibdy+8p6fzP25c9rFRtj1pkHGSVcldDpcNhbewRUUelCC64WGHehiFV2PVf?=
 =?us-ascii?Q?yG0EtB0xRKIw+briGmo0hkT7G5OXy73zOgDBF+8HbEqk5dH841nTAYyFBmag?=
 =?us-ascii?Q?ZygPgeCTthDb0eqAOrqij3UgQEgJHMx5b/FG+/1mtDPIVeWEiCxo6vf+l0ph?=
 =?us-ascii?Q?NZCvTa+cd4yjxrwpPdLCIinIHKsnSNMDAmDeUvnXcBBchQmNgCKwNFdd8lD5?=
 =?us-ascii?Q?jP3//dMXaLny5KjQgG79GMZMWzBX8q/ZZA957Y1UwmT0IutVNbWVuihS9ct3?=
 =?us-ascii?Q?XoQSUI7RqA1xLqRfK4rLpSaPnbIwRrRwFLlCS6W+u6rlZbEywmCPgPE89ZVA?=
 =?us-ascii?Q?IVi7RLMH46dc2q+ER9vS1GZzIVK1qRvFD6Ey8J4bkBvXm0gW95lZaMR+Kcv6?=
 =?us-ascii?Q?cIvuMPov7Z299srGbbf/6uAQzwypaiqRly8FAkU/bTqKzpqzogLLevM/JHsS?=
 =?us-ascii?Q?6h2Hh7WtlygRodTwuXhNonLeFZBe6u0wp1RXA9HwGM2nNk5XQEe7csSmgE/q?=
 =?us-ascii?Q?dIMlg9RzDPN5/OLG0zuOe7el72eHbRYschkwxi7mcKTIpZ8qMfvOy21t6lrC?=
 =?us-ascii?Q?8UWYkHe9tAhmQonTQE8OZsg3gcAhNx4eCdoR/+D2UupCPMpXKdy/HRSVGL1q?=
 =?us-ascii?Q?kz8BGz0DTvNfzTqhZC87Hcfwf5rBoVN4pL26HC/MtMA4TjuUW6HCDAgnJ9Qx?=
 =?us-ascii?Q?HzAGY/0UkJPnpOuli7khm8ssOjwxOLgFtTfR+mRR/XC38qhIyCM9onW0VoFs?=
 =?us-ascii?Q?8FGSeW6TxrYa8DMtJvi3dDYMAISccjH+b7Az9WYy+V0rUntlQFaeVvj5Y0Bx?=
 =?us-ascii?Q?EO6v7ecH0P2+klvVhQBobak+RIqKGpy7AzInKp8S1CM0K1oGcTsdWleSgSbE?=
 =?us-ascii?Q?h1kQ85DzYwuM2iDPn/MIY+Q4fyGQelPwuCPGm/38Q/fTt0K0lu5NbWOLsbHW?=
 =?us-ascii?Q?X/tExNbZsslrQy0OwfQNqTan+Z4K7BsGUCFfQ8UHST3S91rYhHQtlrhRvoZN?=
 =?us-ascii?Q?6/bdL254j4X76nRxjb5b3Qj54XNi3EcM8wHp9/YigqzXAv9arcXpIPoCGOyB?=
 =?us-ascii?Q?0oPS1ifGrr0433dPJJKNagaz8+Ykex4QZ7K7B+D4xwbxumASk2s4keu0YTdB?=
 =?us-ascii?Q?e53nqYBeAhuFdDuCvErQq5QCgFTdEW4XGJ3/f+Czlnup9VPIIOexpPF6INIR?=
 =?us-ascii?Q?3h4sINF1T4JJqPM39PUXPmSZ/vt3JWdQM5RuZ1bXAFkpqS6fWGpxNRu+hpni?=
 =?us-ascii?Q?gAKNn5n+tl8+6KJLMA4nk7rH4wTZKG8ogmXFIF2Zl6T5pnp9mnLK8A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OM6v2nnghQLE9DfwOUcJlMUfbm0Jg4ZIByZFZ6Ua8TRylvtzW328hmn8aSR6?=
 =?us-ascii?Q?+F2SzVJJPhSCqv+WmfIpvSIYe8lnQs5dsKmngW65I72QL1rMNUavURQ3PihQ?=
 =?us-ascii?Q?MHQA1n07NJL1yo+piIpqivs7UIcGlF6d8Zc3/A9SaWqVe0JjLHRtHgnid54y?=
 =?us-ascii?Q?ktr4rBtWVkg6mJfraQNk3qASjUn4CjUpqqUSPsbvtlMBMGQCvIEPdaZ/Xx3R?=
 =?us-ascii?Q?6XhLKeJMk3i6WbmS493eXC/b515+tN/lHDB+KNOFAtzEOt44oWFp/U61AXr2?=
 =?us-ascii?Q?Q0+il9Me0pDsAIrfIMeU5SkHyt8IlqIR01bvqKd+nxqeqDiulpzVZrclgWdI?=
 =?us-ascii?Q?KZwXdaXa2sPo4I4l6hcxTwxRyhb8O0lyp5Pcjw+KqpmBNQYfiizuKB400rvn?=
 =?us-ascii?Q?z3b0BuGEQhJJ1VXabeHMbz00h6LFAO+NnjFhLoc7zQylsEnuVCL51+8X8Cqp?=
 =?us-ascii?Q?QsXXY9FHKnDbHsoa86b4FLuQpScVqfTm89v1EAKC6Nne6OxmTC1jrVb61wA8?=
 =?us-ascii?Q?H7JwIWRVKjhOxDkeP7Zz8AX/qaEtHzVbmLgXaZs3fhIRGMvIM3dmxseWpXj4?=
 =?us-ascii?Q?JoiUuHRFUi0MpY1QIzc42XRYp+zDfbzSCExNMgOwpx40yVauwbgbk0vU+8bx?=
 =?us-ascii?Q?0PhlMl6yfZuEpO7n+Owlpo9Q+akBDkZs8SUx/xAimHRqvNn35YmhrPQrohtE?=
 =?us-ascii?Q?yijbR3cudHpTjgCaPx3x94WzJeODzlyRGiUMrjNi1oR6S+0zzRNVT9/M9dxa?=
 =?us-ascii?Q?3Kned5WBB1muPd3BeY4Q0oiH5vot1RmeelYw0/r5vkKgxT/LtV85nVj0EVaR?=
 =?us-ascii?Q?zxXFzlQYkVrNgY4wWjYknzPp2c6NR0s+sGvhOhrthfGlt7Ndh38thJkMpuyS?=
 =?us-ascii?Q?lgybloiFbWANKGlF5SI6Nnl4jLMC578UPoRZD71tiMiTVMXeaH5kY1vuHvpa?=
 =?us-ascii?Q?HKPmMmhvLDVgqpTTQ5rAXWmlDbS/jcZnOh8in6ZnEOFt2lKmGSQYP0y3oVX3?=
 =?us-ascii?Q?18ffmTDKiacEShJNnnYTtQ7uYMqRDL0xmMFfcxqQ59UdWaDWqGqUVhrbksvj?=
 =?us-ascii?Q?p8zsNRtscwzypT70LV/Kl7hmAdLMAdqB0KudMvJx2N1Mn1/AA04Pvys2XFdw?=
 =?us-ascii?Q?iwtM9KGvVcamfMUyxpU7JAAdykCEPpJALP8szndW8UckYmjZP+mMc9Cx5UZU?=
 =?us-ascii?Q?0Armsk3UTMac7QH5CfsNVMELTnxMMloN3iEcwc0kNh58I/qeAlSBx1NyhdoX?=
 =?us-ascii?Q?dEQz0zKdh9pOOtidAlJhJHAnL/pAYQ/G1BQh8RfdNk/WahRnlvxZ44CB41uz?=
 =?us-ascii?Q?LzZbzfuTQvWL04qxuCA9UNq35pKm++vjC7zWV0GLUyrHI/0+yT+Hd/fvFEkj?=
 =?us-ascii?Q?Ke+aEyUyypxJDozRnzAOBqEwUAEPnMOnX6iATVbbidqKg2nkN426DjbVW7eJ?=
 =?us-ascii?Q?/b41cr1wyQUzGARXQKv0IfbQyqh5OrCaYAGQw3SsXYi+H/7PL4oDoxQ6LsHt?=
 =?us-ascii?Q?KEboOgqQ96+N4BTHglxoY0UcBp0bnL3XT/O0omrDduq5Rnp55ZtJ+wgIp0S7?=
 =?us-ascii?Q?pGwiBMV0OVopoMRBlhw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27d1e52-58ba-4d8c-ebf7-08dd20d7c980
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:22:12.6884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCd3zjFiiZEIjRtKAE4nR0DOD1JISAkaiszJ91VJR47I1+x6LzAsl+1hWvTFzA9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFB/eEoNy+bFltWOtosiIEP/iQ8HDL+k6amir0xSW2o=;
 b=5t5nTpFGnw1Af53+ZCuvBLSmcFQWiahUBqaw+sYUcZ364ceeXGwti3SRxxCG0G9vcQIBxoqW2RFPPfrW/tHDRoMWPDrUEtjNoDNH0/jeLTDGXJIKtzYLR8pASb/nI9UfPokY9zPNM2BgVQIdbKB7gyXpCvfkHz1mOi7l8ZFEt3o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5t5nTpFG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] boot/uboot: add qspi.bin file support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> > Or, at your option, wait until the next U-Boot release so you don't
> > need to carry any patches. After all it is just a new feature, not a
> > bugfix, so it can wait. Not sure how good it is from a Buildroot
> > perspective to add a patch to support a feature that will anyway be
> > available in the next release.  
> 
> It appears the next u-boot release tag will be xilinx_v2025.1 which is not
> coming before May, 2025.  I am ok with waiting, but do you think your issue
> with SBIRT reflashing can wait that long?

> Indeed I think you have a point here. Even though on my side I'm OK
> with running 'cp+dd' to generate a binary for sbirt for a new months,
> that won't apply to all Buildroot users. And we are kind of officially
> supporting the SBIRT workflow because it is mentioned in
> board/zynqmp/kria/readme.txt. So you are right, we should implement it
> somehow. Taking patches queued for the next upstream U-Boot release
> would be fine to fix this workflow, yes.

I agree that it is worth cherry picking the binman support from upstream.

> > Uhm, but it is possible that no vendors other than xilinx will adopt
> > the qspi.bin filename. I think it's better to add the new option with
> > 'depends on BR2_TARGET_UBOOT_ZYNQMP', and the 'depends on' can be
> > removed if/when other SoCs start producing an qspi.bin file.  
> 
> You are right that it may be a while before someone else adopts the qspi.bin
> file name.  That said, I agree with adding a 
> 'depends on BR2_TARGET_UBOOT_ZYNQMP'.

> OK. I'll be glad to test a series with the patches from the U-Boot next
> branch + these two, with the improvements we discussed.

> Luca

Great!  I have completed preparing the patch set, and I am just doing the
board run tests now to make sure I have not made any mistakes.

You can expect a patch set to test sometime today.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
