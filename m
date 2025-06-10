Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF00C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 05:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19D783B96;
	Tue, 10 Jun 2025 05:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saDorBXwNTnE; Tue, 10 Jun 2025 05:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0556A83B8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0556A83B8E;
	Tue, 10 Jun 2025 05:07:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E2BCD
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 634A34006D
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU1a8YIzyYjT for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 05:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::605;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57AAF4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57AAF4004E
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::605])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57AAF4004E
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unO+zpmA864qSQ8pwMuAZUzwA6XvhQgygLs87Io3j5OJXqS2GsHr5iirKLnDa9DzYREwcEJ2scUFEOO/9Z3yRACG+ouckkdllOhQ0a/M3s00gMCdDsCeNvu1U+yLPDmuXFsDLk97PlTrhdvyXjCnyWKQdfggSgIv3642rlcev+w6GnixQpustrKGOPaQ96AL/X3zBzI7P58ZzbGVnzdZqnNq6oRa2lrtJLRUc5LHLSLB/pavLN4KGV7TSSBxRQSbnmAP1qmdcWJvy14N0JcA6B9VfB0cv/vAodAWdxQYzfHWtvMeeLldnRzM3LFKL+KLIdpoNzS3O1vY9oP3ncI7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRXxR8GuZ3KEwfJ3dkQSX+KbwHbKwt2PGocWGdaaDVE=;
 b=EAn7tB5dMzjdJ4AfF9RUgMVq4DFTuwHZfTwYOGcl3aA+663h/KH3QDnC8WzvL9MHbJWP770aDf/COfYVJN/BxTKkAWOc2qoV4glvKTyKk455PoxEnYL+Gjws+nTyF1dSo/M0D5H5PocRiGLbap+aIVWPqd4C4pS/MjLazN9ZFgPuk+lxIwHxVRsP4/6mOG7Y0g3Z0X1NaH37ZQLE2EoymMbyqv65oa6eY9fsqMdALHHyyjMsafFq/kMwM06aBdpgWlTeGcBTTX4KzhZbNu8O9pfhx1vw6tEKJAxTo6mKZojXbL8Ag4TbiPoMDHh0oMPO4+fqzUEfFyaMax+EuBtFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW4PR12MB6851.namprd12.prod.outlook.com (2603:10b6:303:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 05:07:13 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 05:07:12 +0000
To: Julien Olivain <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support for
 xilinx_v2025.1
Thread-Index: AQHb1d17/RoIx/yLCEit50h80i1Fk7P7a4+AgAByhJA=
Date: Tue, 10 Jun 2025 05:07:12 +0000
Message-ID: <SA1PR12MB5615986440801C15CDA4C0B3F06AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
 <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
In-Reply-To: <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c80f43f3-c02b-4eff-9e1f-12eb1c8f1abf;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-10T05:02:45Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW4PR12MB6851:EE_
x-ms-office365-filtering-correlation-id: 83ba2db1-b451-4f94-871b-08dda7dca91d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Kod9u/VjObxsyzrGS4qfzj2XiXfSMD/WdbUpfjB3MYpZ/0DOJ50s0JEAS7Sx?=
 =?us-ascii?Q?3j5Vqw8xqMhaIx+ABDDztqN9xFYhmUc2SrinBBGyAPLWHTjwfF44BQDh/DxG?=
 =?us-ascii?Q?Ua+0VW/OjX8cJByWYkCtsU+u0XAtNk1sRMg24et31shIChwe2nSpreAGfy3c?=
 =?us-ascii?Q?NQvacs+GFSTlph5GVlX8zxZN+MZcG5lTI4I35jjFHfM/XVnrk0E21plqrTm7?=
 =?us-ascii?Q?qkXmcVsLO99dE2EYRtqiWJtkrtsSNTQ1ufg35c9OfZgmUSbQFiLrqBrKCprw?=
 =?us-ascii?Q?DBGdFje46alhgZwl+vHA6XnZruLkcXfIoIhnW/VEoGSzt5L7EXN0fpHp/Y2u?=
 =?us-ascii?Q?n6kUahT+YFohMtr7KQBPNqnEKKfyDsTDXMbJN0+kW77Fuf+dPhGTgb09XHXL?=
 =?us-ascii?Q?Zjixjx860nZpbgeB64OGk3DHTSuPBBLWVqRuU5c/rui335X3rWP0MRJt2o+e?=
 =?us-ascii?Q?22+N4uGByFizMMO809x8VRKjVFMxy5Gk61bvGL17G635ht78qeqDXjpvp63H?=
 =?us-ascii?Q?T43890QrJh167LEECcRYFwoLW3dncEjN60qMyghAisuzBVkQRbE5FqPH0C4L?=
 =?us-ascii?Q?bxgW5m5tbxH7LMzdfVJFNZ0BPpGq8jH8xRhXmc+gy9Z3KYD2FdOBlpCac9bh?=
 =?us-ascii?Q?MznWGJWmcmOMQVP/1iJ0k/yeYcbsRvJadaU0yBhxQlPN7FtSsRhO5Swb3m36?=
 =?us-ascii?Q?M4rfC2JUXnoHzMDJ4f64KMXc/hWB0H3alRK5eYuo+Gyr9Bv/+xOhvPIryclG?=
 =?us-ascii?Q?eCmaa9pMJVaNseY4ZBUZFADzQEWMuO3fnPLiBMi4Q45twpuI84YMRhi22zZJ?=
 =?us-ascii?Q?WXek/f0hQxBG8acQoCOhGNqCCGiQcED0te+GGFZjsd5IStzloK3UpTAH8tVe?=
 =?us-ascii?Q?7/L7ecaaHfL75n0eCLpV/AJtcFiyArDrYmgsUXF9Snuu2X8ODoqmX2IX1uns?=
 =?us-ascii?Q?KMHcvClUTs7OtFFMrheAcA5m3GWkCjYFcXXU47WhstLspZCyb1z3EAdZyGAA?=
 =?us-ascii?Q?XuuaxxH6okXYQLqL77KXoAZfjdqyonS5ZwP2G++fnNGx3T1rk9aDmJs+tqUY?=
 =?us-ascii?Q?knGPUwkx+1Vp3NbC1ZHTg2RnHyNFspioRQ0lp7qIxiI6fPky99vsaP2cV5Sh?=
 =?us-ascii?Q?LkVty793fEM9xXa97AquOyypIyMEkZ1IyZC2Ey9DkUhrmb/wBRgox+OmDjWO?=
 =?us-ascii?Q?jVV9Xi90xd7drE4gCggMPxgf1+qeHgmEc7p2gZjwi/fbRqtAetkVYVIq089T?=
 =?us-ascii?Q?j5pfTI5valb+1Sm2eVLJWZfFOd5x5KgK09+Tmb3uX8EqPlwzJ2a+oaGKMdpc?=
 =?us-ascii?Q?BT4PPbapgIRobeME9DYnCsTB3H/R7dOWj/R4KONrmxn4j+2VWCvywYhov+s/?=
 =?us-ascii?Q?gUL04cC7ygLZ+saAq487WE5XSGJ2dg8EQuxuNw7q7nEh5FohPkYQ4TttAJ49?=
 =?us-ascii?Q?y22JRMZp+InXFpmmOxVWg6bLPsGN2nCva7g0Xl1CCxk1w7mvVvsl5g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GLxGDh4p8KqLGq6X4jSyouqqBN83m7mSiEuRRzEGFJ/EQsQOPOaxvaOrb/xS?=
 =?us-ascii?Q?oabk3A5NZfKlbD0Hr3FQThd2ssPOcEpIeKFlorHCWDFMyK/hTsMK4UdA8+Re?=
 =?us-ascii?Q?Wg1UivAUb+bc63HpOAGasYp6zlDbzVTAZy/BlPwdPgkPSnoFxqLny9/P0mxs?=
 =?us-ascii?Q?K/HpyqEhZMar6qFtVisyay9yEy8Je4QjgvnM45SfWhvft5H8D3k945qdtACi?=
 =?us-ascii?Q?rqz1ufQL9iT+qJEnmXRWl8ONX/FqXkFuLK800lR1Ah3cnGu9OlNGjqFnY1zA?=
 =?us-ascii?Q?+vg4vSKOilJufh8ui9LuMoqGs5aGt+RmJjAe0iQxsu0t9NDXHhstGivoVAOD?=
 =?us-ascii?Q?wr0twMZ+NvMDrx/as8x+MpxdwdmeOyrgPjQSocIbDZECdO9XpJRv+KHKd5jl?=
 =?us-ascii?Q?uG0zcZZAhwlcU02+JBUUy0atw5d4Dh5qMVjLGRPSUT5gTiv01T/vRoBdpzN/?=
 =?us-ascii?Q?y/sAEMzpkOzsMVBHgME3aXZiOSeiNClGw2FHHhI9HWzUkbYTuCTgQ1/QbR5I?=
 =?us-ascii?Q?3r+eGxPY1/dVv34E1XpfRwYHd1bmEwrkphwsX/8ZexoOeUg6b8c3Ol0G/KWR?=
 =?us-ascii?Q?bIADipL9TSwG3lqAEjdnwDTY99xK59Ws7jwJW+Hb176WzPMJL5oARgYThhcr?=
 =?us-ascii?Q?IjcSvbRFRmv7/3ZggUvKpd5Xf4VoXVA5fTacUzHYyAVWnb0FfhgkiPfgL4kw?=
 =?us-ascii?Q?pAHlrXckxojk+0QaWmMKav3/3qzRhhg+2yEd/8eFYeOntU1sKd9oNDzUrwhW?=
 =?us-ascii?Q?LXQHhbO/vgJfLb4m2kS0Nqd7RbgR6PwWdBz7Fj16DKjlHkciuZYZF4kN2E/h?=
 =?us-ascii?Q?8ghdh3thIpK5YgO9vR0qi1dondPC3mzI43wU/0y4NG0+QdgQQyD14BGz5qDW?=
 =?us-ascii?Q?i3myNO/ZHFQZD/9X0PtArg1ODYWthhNAt5p0zca9gJbkBd2xAlMFf5n4eYFN?=
 =?us-ascii?Q?TY/pH5W6rJfn3h6jm0xW+viXSm5KVbLq6b1W2Bb3qlWWj+t1zfHg6m3yk8+z?=
 =?us-ascii?Q?GCgHLhvnBwMy4voDc3su7ofiLzV7f48lF0IZUgYcbVbAjpBM4nKJ/g1Kq9Di?=
 =?us-ascii?Q?NCSjCASr71S8g7gf5D9TXsS03e0AV5TMhZQjNVddPUmOm9NYA1QK4lwA2iRt?=
 =?us-ascii?Q?d0sF8Ex03ur2ry314oUfyyP1EjUssSEwG6tMhdAs9HSz2spacFbsZ3ij00Et?=
 =?us-ascii?Q?pv9aA3brA6NCSURXUu2U60gl3H25hDYNepI313+Kwj8pc8EFQRtIKi3Wh+nA?=
 =?us-ascii?Q?2WHyGwzzVuk81Uo6445ge7MtHNI/s64EWq7xc5+EYX0sfxNHVnee32X9xTFj?=
 =?us-ascii?Q?SvWxc1MmijZz3yISQj0xYs0jpZbb6neE8LTAUyFYieq4u9OLLZ3nWIeCnxyK?=
 =?us-ascii?Q?PekoEDx5w6rnh0DlTWnC2XwdxyJKuLHjb7cOuuJomH+y+cMDlYogzVZnOVcg?=
 =?us-ascii?Q?xVU1o7e97Gci83JBb5xnotSglM/D6QC9CFsI0Zjm6K6znpqMKFtOeqqoVRfM?=
 =?us-ascii?Q?UzXD0KniEmBpCanchdFscOdaBdhD9NCMX4R3WXJv10NhUJY1Lljv0w0r/TvB?=
 =?us-ascii?Q?JoeSrt/delVkRke5LVI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ba2db1-b451-4f94-871b-08dda7dca91d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 05:07:12.8283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+Ku8ZmOltc9+Jlx0aQt+NSRzTq/ZV+LsEsAnd2d/EeZlc7ObG/tWxzuzaYukOPk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRXxR8GuZ3KEwfJ3dkQSX+KbwHbKwt2PGocWGdaaDVE=;
 b=qcvyfYYCfZg9qx6VoQyKGR+JFIac1tWiPdnphlOsf0JOwZzH+U61OhUw5CqKcSyJlk075yBJeiDwikHm6pByMge51FRKYC4WfxDofIgyVJwLUCYEF2ak1jTC9PE5q2QeKZnaVnSxuL3k6WdvfnfVArwhjYXUNBPiB+HVdKKpqRM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qcvyfYYC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support
 for xilinx_v2025.1
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

Hi Julien,

> This patch adds support for version xilinx_v2025.1 without changing the
> default version.  This way, the zynqmp and versal defconfigs can bump
> individually from xilinx_v2024.2 to xilinx_v2025.1.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I merged this series to next.

> With all other Xilinx related series I merged recently, I resolved
> few merge conflicts; I also did few fixups. I quickly build-tested few
> configurations.

> If possible, it would be nice if you could do a quick review, and/or
> a runtime test to make sure I did not missed anything.

Thank you for handling the patches and resolving the merge conflict with the
change in the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH config.

Everything looks good, but I will do some run testing today to verify.

> Also, as a comment for future defconfig maintenance, we are trying to
> move the defconfigs to use a stable Bootlin external toolchain. See
> for example the commit:
> https://gitlab.com/buildroot.org/buildroot/-/commit/310ab7d53393288aba5c574c49a6cae1bf1e1a1d

> So it would nice to do this switch during one of the next updates,
> to make sure this change is runtime tested.

Thanks for letting me know.  This will certainly speed up build time by using
a pre-built toolchain.  I will start working on migration of the Xilinx
defconfigs.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
