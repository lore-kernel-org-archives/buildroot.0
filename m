Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA4CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 17:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6802F406BE;
	Fri, 15 Aug 2025 17:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzZdBgCaGQwi; Fri, 15 Aug 2025 17:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69406407F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69406407F2;
	Fri, 15 Aug 2025 17:02:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24CCE223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0365760BE5
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id matpgy5txQZA for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 17:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::614;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CACB260B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACB260B17
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CACB260B17
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+qsmgFskl8thm0qPp6j6kJarhK3U7AqtZkrwOGQLAp11wncASXW4OQK+4IIEdn8WSBUt2dIKXr6OifaCmRnfpelb8glb0n+T/gQaH0hV+nQfEsu5KRByizeq6QSgWro7Z4LQl8Wu66HiuoPaMMvO35/Ij3Hbb4ZwLKFZos0pFANTXLhQHK6EY3FZ4brYKnrEC5ngBaNm+7ym/Wus4BQ7E6AiFKlVJvPn1qr8XknjHG9CJ3qrSktqkfUJUwZPnxFOj1eD5WXffWLtb5Sdq4LOFf/peEw/hU37IZk3W2a/GLQE4ILObVpYeppPDGDe3xQjMIpqBsFTj34rvN+EAZDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBMLR7tqdpD1zTRboIk555WE2CGk1noY+6JqVwie7uM=;
 b=OoAWdr5X+PLa4oshH1oGtGSwsMCsxrOCtlZ9KJWCUxA1iZXfSN1UxDGZpxQ1cmS9FPlnEuUnEwYMB3OiKZJ70EnD27AWNf+/xtjifz+7D7mZFOpM3WYSGZeQBsnsZCWiEsZPVmFgaXgHeXt3fCDFEC5A9iw5QCxoRNwXrJ31Wat6DjiFQk7GBMN5Kts7QbI6ee+h85wyQ51UuSe1OXSyrCoFLNcD14ptA9RxqW0hblefExfE5uPPH21py8X2Pe76k+RGpu5rG1hZ2f7gf5hqrQ4csc1LmETA7ipBfJtzU5/fom4PLI4FU+8NDsbEhqh0+4ZlcrjxlPe5QqQr3aCedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH0PR12MB7839.namprd12.prod.outlook.com (2603:10b6:510:286::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 15 Aug
 2025 17:02:06 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 17:02:06 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Olivain
 <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH 1/1] package/gcc-bare-metal: bump to version 15.2.0 to
 fix build
Thread-Index: AQHcDfk7NJeQg2tNQE+twuWibsCkgrRj1zYAgAAXQfA=
Date: Fri, 15 Aug 2025 17:02:05 +0000
Message-ID: <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
In-Reply-To: <20250815173050.1cc70ac9@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ju.o@free.fr
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-15T16:54:03.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH0PR12MB7839:EE_
x-ms-office365-filtering-correlation-id: 4a2d165b-dac9-4ca8-221d-08dddc1d76b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VLSHUaSvnzBzYlb8isIHHWqR7CMsT+QFLULT3uV17wDVJdmfUjm83HN7VwDp?=
 =?us-ascii?Q?XnEx4XmTPZGKXTvL3Qn8wgRWQjW7FWWf7La6dKWJA40sF4VlHx4Ux6Gpaud0?=
 =?us-ascii?Q?RolwR1TK1dJmu/FflWa4CUDUlXFclx8uUfelV0tMVqQ3WQwqJID7urgg4FGx?=
 =?us-ascii?Q?CW/mzvT+peNj86wM014g4BqHseJ7sUz/UnGc1lFN3xIoTaB2hwRh+c/cQVzO?=
 =?us-ascii?Q?ceB4y+fUDS9aMn7jBv04fLSqUCRfce5QwLcaNM/F9bf7BwPP+tHEu/ngSjw7?=
 =?us-ascii?Q?qpG0AnIHtJNOPhngHE+g4QK8Qb6wIFI2DZd/Se9nlTGNgOxf2mzY+8j1kHBL?=
 =?us-ascii?Q?3VlJPa56FVdX/HRvx8kGixep/7AuNWbcTrV4ifcywGaQ2c7luiRtw/ArrC3L?=
 =?us-ascii?Q?Z10R8l2wsEMSAP/dv8h7O9Q1QqYK/2Y+4lMyabo1HGzXiq2oWM8LBK0kMs8h?=
 =?us-ascii?Q?HO8aak7T7U37xojYQth/Lk8UTsGAZfb8xB5V1sdgIQ/qNoTSedNb36aDMlZn?=
 =?us-ascii?Q?iPo6qsOC8B/QVuUfPvF1vSKQ1kWakz9wwTi/KLsDU83LBPsfIK/EpTHdKpy9?=
 =?us-ascii?Q?EviT4ieiW5QAym+2SlhcsjNLxCZ1Pp6TP+lBfrgNH1gNqskh8n1YoV7lYEyq?=
 =?us-ascii?Q?ufBPFQWvmXwDpL2trpPbUxFzmLrzfVCTgu2ce1pjmKKDAjwa6K5qBt/UPKB5?=
 =?us-ascii?Q?qVnFWJpAHK7SzMIiH3T7brb7EO/73+o4bK1uMpn43MGmlC4GnfwBktEka5Vv?=
 =?us-ascii?Q?/0q368Q45oL1yz+4mfe2LVwYVGdUl9Y/ev7LPPoLyB+eNAocajgAehaoepNb?=
 =?us-ascii?Q?iK0cOTjEB7v8IEy31eIiqf98W47aIp1YfqdlhHa6hyw0OnVDRwplsIPPocBe?=
 =?us-ascii?Q?mOv6Q9pYH0jGereKrERqsDWizH4agwt2IBbj1Vp9dLKa5mYQieW8FhGe3l+D?=
 =?us-ascii?Q?hypqdF5rwMwN5CxnpD1v1/sZ8/YoflVxxqVRmC6EXVdizdf6ViA1xJh72pF/?=
 =?us-ascii?Q?s5gVB900rfwUtVPMv/gpF79MfzP8Fw5dmzqdQWOXKlfiV4ZHqbXHvmV5HIJm?=
 =?us-ascii?Q?9D83qyjUXRSheAsioYGI8RqhJKrQINdKRsq25DoouR1Oc6qcQFk/s9fZAyxc?=
 =?us-ascii?Q?rsD7mSGUaVaxMzMIN4Fku+BZGoCkkU7egeh7hEXdoHOVHw66RCU6/IfR4/bs?=
 =?us-ascii?Q?bS2iIUy1jmC5NjoUgR+rNdWT7wE1KF9qeQXrFHQvIRVUg8CNTh+3r+GRRo1u?=
 =?us-ascii?Q?Ugs1oGecxVO304YjaExBie9uhbBewPwbTF0OKDVFN0U2BjKrwiB+f8kBaT+z?=
 =?us-ascii?Q?D0US21IpO8tUtAhmiXSVDqio56a1JTxnGxpBEWCgGiodjNuqMUDJ9r2ivPMP?=
 =?us-ascii?Q?VZgDIe5X9dn2uTXH5GoHiqcIh7zOZnlY23y7oszwvEu/1kSJOl5wjpekqDoS?=
 =?us-ascii?Q?pp1gWBxlW2VUuFaSGwqmXV43X853iTjZZHgOprn0p/T/Ozr2swuAe2zFzrh3?=
 =?us-ascii?Q?seKKF2UxXi//PUcx4n8otyiOOoQzUf34nwFs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+JmxVY313+XKxzoG07sQUBfHUv8edvhweturXKpM/z0JR/2tynzJWdQQaMwB?=
 =?us-ascii?Q?Jypu8mLixDmtoVmx9OuYiQFEsT6pHSc9UVVIvDZU/Q4o0+Fw9dy8JcfbnILm?=
 =?us-ascii?Q?evaXQulQRL82NTESTBAhUVwTa1YAQCAEsSHj59qQ0tDMArOUyR3nLF1TZsEx?=
 =?us-ascii?Q?+xWbkrk/vwaRZoWGeSW2v+KBQuyoPEq2JACinkOcC2iClv2jYId8YrhTCP7v?=
 =?us-ascii?Q?NAgq9docaaHW+fZrv1M5GdTHk/SyeiyrIsYwN2IIBIdth+YJVcZ1Dom3AhhQ?=
 =?us-ascii?Q?HsrGsuZ28tOSCIH3yWq8OOS+rUdISEqo5qwEHOTdIXPaCFL2QEOwiodRBMwN?=
 =?us-ascii?Q?R0GdrqM2/8nICl1a0tKSr3P1SRjT25ycJAyJg3mBI/4Btu8ycTKzr28uBRPW?=
 =?us-ascii?Q?EFiEZC++VwJXW+k4pMLKB0SL06KLy/AfwzUFa3HBjmbgYcfF7/rgu2uLsfZb?=
 =?us-ascii?Q?wp9GeTXIS11kM0sllfaDfLGWC27l0cOaVl8E6SDCo/VVrVPttGGfRHCFciD0?=
 =?us-ascii?Q?Scd9gV7PR7Ymp7EaY+tLxSy3Vo+R0Hkap0yqpHMPuunLzcwfq0I+MdvfvzM/?=
 =?us-ascii?Q?1OAXA0i3lsCusQbKaI+5ep9uexbEfQZ3/Eu1KdR+kvIvNBcsLR+DHsHb2P/u?=
 =?us-ascii?Q?qjeDFJZ4OaWr1XM9QM/Eb5FwrQkoQ2W6MUHmvrQABsk+I+hlqKcwZUOjZx3F?=
 =?us-ascii?Q?NXBr9OQt03FEzcFW78OgSF1pctgtlNNhzTc9kef1MHNeZMwbIxf5nt8FvzMw?=
 =?us-ascii?Q?ViVn6zO/v3Mp2q+HHuTKI5UbV4Lz+D4Q4OCYSCcBzU9VNX3jD4ALgJ0uGJT8?=
 =?us-ascii?Q?/authTKeMIs9093jMmWvANC2a+lyU7ayIn4kAleiVBPrHSPL+DPqoA5FmsIy?=
 =?us-ascii?Q?BqGAsDCeEYEUjuucCDb/dsyZtuGlP41UnbtK6ZutXiZGRD2ix3tFQJo77owy?=
 =?us-ascii?Q?UEFlCseou90qrG4zOdOtCQCnne6dQ8gw/vk3t4LMPJJx9Gx9vkrezoDGqEUq?=
 =?us-ascii?Q?tzhS+as33owTp8j0hyJg1ZZSN80Pt5ZqVzcMUz205PaM8ee16QhJQeoVNDkt?=
 =?us-ascii?Q?tLqjzSIjubTomJ6Xq/yMyknGf90I5CjEg0VMObZ0z6fusZyynGSYEYd1pY5f?=
 =?us-ascii?Q?JteWZGrXdqWVUDZ7SfUG9XeHpmXtLkAVup/zcctDIVcSwi8Fnwm5YdKoGnFK?=
 =?us-ascii?Q?nIcHJ8TfIPLXIyS5f07dzxbS8pzmNqXKDf8CKGXgpPVm5fBtWOo1hfv8IYNl?=
 =?us-ascii?Q?UFNBJ5BrR6UgkVb7qTW+uvC+wNdV06kfPIovLzy0zAXAdR3EaIRKWcSrkV/2?=
 =?us-ascii?Q?xXoI7dTNKIi+CeGyQNyvABsSRS7MVnSwPmmfGowx5/5SmrQ8oivfYcmVodxR?=
 =?us-ascii?Q?/n1R5rq070oWyAmqes/v8eFB+jIfAn+g7EU3YK/oh56IpuR9Ti3Pi5JhO5GI?=
 =?us-ascii?Q?bjg+obBbIAAEHXDLbDLs8UzD3F8QVlJaB6uWioq/nJH3RIuGDpbRrk/wxhV0?=
 =?us-ascii?Q?+BIZNShhMB6Q7zgBAXE5VacLuizL7LZtXpmwmfI9atzo1O2+T2oa9TbTIom9?=
 =?us-ascii?Q?+58+pJINSghUSpUkXIE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2d165b-dac9-4ca8-221d-08dddc1d76b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 17:02:06.0242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: faI+G09VVlSNduKeTWQCdq1VXpPg3leinqiMorD5Wxv3Zp8cY/73NUKUyauFz/xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBMLR7tqdpD1zTRboIk555WE2CGk1noY+6JqVwie7uM=;
 b=UhSq5CS7qAI3LhqGUFvB66deyDnCGrA0XCm0SRs5JBChKd54YJ2c7Zh2orCWjDssSiKgDIOui2Kof2e2ueGL6Kf8LPdy0yHtVIRhcOFH7WIHlK/rMTDc/ijmWBDkqDB00Xt+hOT59pwZnRKgHCtgGOpG0MNOdm7dfvdQOO3aE6o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UhSq5CS7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> Since Buildroot commit [1] "package/gcc: bump 15.x series to 15.2.0",
> gcc-bare-metal fails to download its sources. For example using the
> commands:
>
>       make zynqmp_kria_kv260_defconfig
>       make source
>
> fails with error:
>
>       ERROR: No hash found for gcc-15.1.0.tar.xz
>
> This is because the gcc-bare-metal package reuses the hash file and
> the 15.x package patch directory from the gcc package (which was
> bumped to 15.2.0), but still defines its _VERSION to 15.1.0.
>
> This commit fixes this issue by bumping gcc-bare-metal to 15.2.0.
>
> Fixes:
> https://autobuild.buildroot.org/results/eda879fb8e1ccd696f01927087713b88a4b1a2c5
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/b1dd235ad0dd91e1919a167a17cc9cd20a3695b2
>
> Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
> Cc: Neal Frager <neal.frager@amd.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

> Dammit, I always forget about gcc-bare-metal. Maybe we need to add a
> comment in package/gcc/Config.in.host saying "if you change since, also
> change gcc-bare-metal".

Don't be so hard on yourself!  This type of error just shows you're human... :)

By the way, ever since gcc 15.2 and binutils 2.45 were released, I was watching
for Buildroot bump patches each day to make sure that gcc-bare-metal and
binutils-bare-metal get bumped as well.  You just happened to pick the day I
was leaving for a long August 15th weekend to bump gcc.

I do like your idea of adding a comment to the gcc package.  But one way to
fix the issue better would be to not immediately drop the old hash from the
hash file when you bump gcc.  This way, we can then bump gcc-bare-metal
later without build errors happening because of the missing hash.

Since the binutils hashes are not immediately dropped in the same way, we
do not have this issue with binutils-bare-metal bumping after binutils.

> Otherwise:

> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

@Julien, thanks for taking care of this!

Acked-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
