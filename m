Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1998D1CA37
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B9D40294;
	Tue,  5 Nov 2024 06:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BGLnwsC_4W3; Tue,  5 Nov 2024 06:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA284028B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA284028B;
	Tue,  5 Nov 2024 06:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B2F723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6ECE80AD6
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVFGlET1WecQ for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 06:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::60b;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC2FF80AD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2FF80AD4
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC2FF80AD4
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFeh2H5JuxS88s3Qkp9tiZXLQ98FKSV6x2AOEJE20i6l2YI8g4foxHj/pS30qUIc+Xe1qPPNYDlI0NPfbq9SoLe4wbJeavi7xrGH74a9FsNsfUpxx2rM41L2c1fAitns7iFH5Ws82fG5/UwafUu7nvCOTRDGUTB/NXLcm+xszST3K79cEx3VftodGansT6Z6kK17tmZr+Lf6QjeR8nn/ByPmSx63tQdUkONAWZfLRtrT4oCLVt/ecl86JjIapFz2AuNlRLGIolZ4+DLYoXEqcr5uPowTrY+GovX0XuwzycspqSZbCTl3S60M5PuTxT1KYTqjAg6flJJuxuiu2BnYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iLiNtr3qobfMDWrEmIcY+iyersSyKasI0zI4ZwB5Fw=;
 b=Fox+U7r2KDWnHl79sommZmCdqXT1npL3KXnFqT/Uk909Jt2siD70X/2vOJN7dc/C5gjMX0IDvrM4Oaw/9vojKfxRaSJEGeNJZt8gsXeQJXcaS5hmyeImrBsV5IZBLtAE3O95NgBC5xd1fa5s8BetbmbyBbxB3mXBDbzcrbsvGc5KbaLFNzNHVx6p4lyBhC2J3mfGjwQR7+dEQsoSE0JiMawH2b/Qza/EbSDhWI9QTkwfQxpbOCFbVox4iEHKHE3cXQDU5fshWlZDnOgL+KZbv3kMzfuG8WWO22E1fa6GIE+rPtC7F6jykhN7kpPckdLQVl4AwVo/W2ypO+zmo3DDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 06:19:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 06:19:41 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnout Vandecappelle
 <arnout@mind.be>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
Thread-Index: AQHa7Hdz9f9A1ml8RUagC3Nu1R9UUrKoB2KAgAA06YCAAH/bQA==
Date: Tue, 5 Nov 2024 06:19:40 +0000
Message-ID: <CH2PR12MB50045B492083BE9F224A581FF0522@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240812052101.2920141-1-neal.frager@amd.com>
 <c9bfc18d-9590-40d1-8e77-15ae3f4dc85a@mind.be>
 <20241104234057.21de4c2c@windsurf>
In-Reply-To: <20241104234057.21de4c2c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6651:EE_
x-ms-office365-filtering-correlation-id: 5a6c248b-e258-4657-1bf0-08dcfd61d524
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Yb3QmX41z4K5/GWL6PC54Tg3k6eAzPxvfU1lyCJw4dlqUUyVKETeS5drU+g6?=
 =?us-ascii?Q?PYz1wMeIaUosHKS4Dw61fqeKlP1vhUCdSx+Y3kmuEl83E49kez9ncUcIWksD?=
 =?us-ascii?Q?wds5npwYQaMRENOP+BmUjRgd4eY0W89avf9Gr0niqc012sIH7m+QYTvSchjc?=
 =?us-ascii?Q?tz0rPbk94z4b6gxFXvraif+BjslDS+Vs4EODZi7n8mZwFp3/BdLnz01YFPXi?=
 =?us-ascii?Q?/O6hcNLR6nccvSe4kXR44jMfEtzoL4KygDbXAlp0sItjmqJzVEzuG8UHVybo?=
 =?us-ascii?Q?/6+NVO5BHAHM+xFUn5g5thkkvR2k06EhXIs7xPZz9ah1e8LI/KLPnf+37ZMf?=
 =?us-ascii?Q?FbNN2IooGW2X9iekpAfwjrV0aDmJlshmX+vSpX4FYmdU4GhCquuJEg2wyM3d?=
 =?us-ascii?Q?D5F6Ho9NjAjal4TMZ23FsP2px0ZkSy/i9y7ecm76AdFoEtKh1v0ahUoofluo?=
 =?us-ascii?Q?Xty5omFNp9LR/rXDNln3JEYUpYAG5oe7gckL3yhXJWvQ9GyJGAPBTM/sr5mA?=
 =?us-ascii?Q?zmmbmQDufCJFPuGTPyvjBDsy4EtQu0xY7lEvjJSUaLzwDdN5WM4BRBvThcke?=
 =?us-ascii?Q?r7/TNcR60qfKb6zfjOP0GlkY5um8l0RixzmkT07i3ECfAMq4WzQ6u6iDaKJ6?=
 =?us-ascii?Q?UpO8D7wlDJn4OoB7a7JR67VKzb3to/ZZDCMin7MlzEluhUT3AhlXwjycGARP?=
 =?us-ascii?Q?PSFGjOZX4jcVuUPXwXyrxPvfPhx8P6kcfhpw50vkr5SJZYmskLiPjSDCPxUN?=
 =?us-ascii?Q?ABlH9XErUu5Zeo5Uk6U3HmBRQECfrhuh6slR0gJ+++WLWRdd7XESV6M2eJMN?=
 =?us-ascii?Q?/IyDULuIctXSKP+Tt+MawD/6aavQE2v4zVa6x2qtSHHnFIJqXhtjiyO3gWqN?=
 =?us-ascii?Q?18A2202pSGEdHxZy1C7l7zymw/kdCM1b2MHPpPrz5BtMFncVPSJcUw9awfqM?=
 =?us-ascii?Q?bY1XE9cli41H5+ehTtStuhVTJKV5GMiLzMGKPA/2gVVf+jnXyn9mMVf0EfUx?=
 =?us-ascii?Q?IqkP7iraaO12C4t9eWxY2JwKicg14XAzpCxeMjjE69rL0WjztJArKgGXcNuE?=
 =?us-ascii?Q?IWejCq9pyPtbLmViHzxcVvYq7rgEeIINBp/6SF7W7+//7RQzF2ukBIdjj/Zs?=
 =?us-ascii?Q?ym1sg16O95yypjsENmeSmInbJ3qbjkkXWMxGth0M3K9MCm4SENtf5mZua9B9?=
 =?us-ascii?Q?aLU+ZJXd+egqvPjZD3kJZOWHHn66MR74gfvhtbPKS7TZRVsz7417JemkI1h9?=
 =?us-ascii?Q?KConxCZA30uMQKYOiIUTuiFbKjRfsp7esI+7o5aJD/aapLqA1ECR4chZAN3J?=
 =?us-ascii?Q?z3s3wZsQA1jbuxFT16awyCPcD4bW6E0zK0YYhLTGcH+GDSnP1yve8jxWrmA0?=
 =?us-ascii?Q?qRLBoR6ohur33dYYeF+rru/Xu+a++FByBG1FWA8ZE1g/5E2GAA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ECne1Bo++MHIDeJEHSy0GOWdCRMpLtdBlyRTkgwP+tuCJzFRxDUnaagvOPdj?=
 =?us-ascii?Q?uDtv9R1ZFJrSgIML6fXeIkBGOon1al95P5mvY16s1HdGiWKNUjHJFppLyKTq?=
 =?us-ascii?Q?/0MBYyDya8APXOaAz86COUA7V/+BY9IcpJ3+VhSniq2j0T63kAOxquK+9OKe?=
 =?us-ascii?Q?VgsgGPp6rix8F3bHAt+S3t3f5WOxBBPxTzWdrCzrUWVYxOpbHAzRoxlefaPs?=
 =?us-ascii?Q?w5EnETGwNhn1V5J/gBnmUZAHl8FGxi0F5nMrI14rfBuDH1UHLwhZE21qSz/H?=
 =?us-ascii?Q?KOx3/cs3fJTavlDCj/GotOVuMmCkd8xIe5qdg1DtHkvgfRyYF/hBxtuBTyld?=
 =?us-ascii?Q?rhZMQPraD+XzupBIGHRauXMAesXywPk1/Lz+o6WWpBCKrM837HIRTgPePjUG?=
 =?us-ascii?Q?07I9N7ouUVrFbPnu9+91uzZSmGDpK5II0gA5BxmYEYGIrjppEffzitlMZ5KW?=
 =?us-ascii?Q?zL/Ruko22fr5E9lP19TkHnXoc6/8+vJCwku7jc0LV2bqSmtDCty9e5K5yLaC?=
 =?us-ascii?Q?tRK4Ry851ZsUbUuJqWepr6PiCvs1T4/C4UiCl2ItosJ3NDr2gfFKcYTsTaMj?=
 =?us-ascii?Q?T269bi1qEaNCd0+kjDpdxcYAYLTUwAHn/wDnwvSmDAfHuPpdG8WTYp44Dn21?=
 =?us-ascii?Q?VNbnyKhsHjE/zPQhTsPga/pUIm0+jg8QUG8GA6pqag6asPY92UlLo0Klr3D7?=
 =?us-ascii?Q?xv4JrgUGsYWz5LWN3EsbiIUYlU/4HhgVMr8JBHMgDbI1FeQ7krxUbnr3rg8Y?=
 =?us-ascii?Q?hRglZL0aMNO4ah3Czh+rZbuQUOw+ZQUEyG8ocDBcw6MC1KIgmYIp1WJjbSxV?=
 =?us-ascii?Q?23kkhO1zQfWMAtp/QgjJn6OaPfy1pkJdcOt63VU6EfGfj8R0H6U9EEMKq29F?=
 =?us-ascii?Q?pVmxAMOu98QeTMfGnbo0JDneO4xkH70kTWfggKewdNutHGiztNTr8qo+SRiK?=
 =?us-ascii?Q?/e8S7Kgiq5UMZSnHWwYiilUTB2yyIBzJRXBFnYaK8xNLnMOFADedr7ki4+mn?=
 =?us-ascii?Q?Trz9YyvTCg18KrMxSQV1YO4s+RMfXqONoSkFerr6urOR8LnOD8bKSWZrHQPo?=
 =?us-ascii?Q?trNOejHXW6hzSGUVIX7iYWDd/IgaBmrJWbsMOCE84Rry0bsDSYkiV2OeC+7b?=
 =?us-ascii?Q?aQ7MFnTq1ALslrwV9ZYnGXffW2NOnf7x+GKhbLcLIW5VyobhBy/BPMkQa6VK?=
 =?us-ascii?Q?DwoK2UXfkj2mL4DQbKj6c8gg6vdLwc4jqcprxpFK9ZzJ4RIGo/+kCLGs/uH0?=
 =?us-ascii?Q?BOaJuEhwRXdfp6WRsf9CA3BGQEd8f4ytBibKUvB0c/NkAHpeuhkRezb1GY3F?=
 =?us-ascii?Q?jT2jcDRd03Z95D0v4eAKciCTTOPt8VeXKA6w2OJ3LSQhPGK4/B5w63p37/KS?=
 =?us-ascii?Q?dn0vmn3mEEVRbo9f0t8kQPPZAgap7WQHh5DIewsI5BsDBi2v0/s7lx4S8KZS?=
 =?us-ascii?Q?vMFh4tVx1v+HgR4X7nZtD/uglgjdvlft3LjopoKVTlTNcOIQACl3fbKqcweJ?=
 =?us-ascii?Q?8+AwEg7DensGL50IE7az5K45GWcZLLn/R432GSKfm+esNJfeZeZZBk/tEimZ?=
 =?us-ascii?Q?cwlnf5Nlvd6NXQYIymY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6c248b-e258-4657-1bf0-08dcfd61d524
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 06:19:40.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: doV7rCnGbJot1LZod8PoacgtGWlyuUTgDVHQyJZTGWxmtY7LJVC6AXkn/T/adRKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iLiNtr3qobfMDWrEmIcY+iyersSyKasI0zI4ZwB5Fw=;
 b=QB/tntvbY25Vju5FaGRESApsIfG1z6bSex9H8t3JWcoMsDbgr30lA3IacLt3EqkQ9nz9Y7OJdWJWOJwfDyO/IhLk3JJb2vZaoKpG2VdZT1Irer5mUrMax3+gGLmyFf+8FHRnIpCIK6ejubcJavh8Fy7/6GOaX3yvr2j0zJGSeLU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QB/tntvb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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

Hi Arnaud, Thomas, all,

>   This DEVICE_TREE= option is already used in 21 defconfigs (and 13 of those are 
> Xilinx defconfigs ;-)  Perhaps it is time to create an explicit uboot/Config.in 
> option for it? Ideally the config interface would be similar to the options we 
> have for Linux.

> It's indeed an option that almost always *must* be passed these days,
> unless by luck there is a board-specific U-Boot defconfig that
> references the correct Device Tree.

> So I would tend to agree with you on this one.

Yes, I agree with this as well.  I am sure Xilinx (AMD) is not the only
company who has elected to use a single u-boot defconfig per family, which
is why board specific device trees are not in the u-boot defconfig.

That said, my approach would be to match the Linux naming convention:
BR2_LINUX_KERNEL_INTREE_DTS_NAME
or
BR2_TARGET_UBOOT_INTREE_DTS_NAME

@Arnaud, will you take the lead in implementing this?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
