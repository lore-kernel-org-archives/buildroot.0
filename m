Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D132D404EF;
	Thu, 10 Feb 2022 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2R4MAmuQ-7r; Thu, 10 Feb 2022 21:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB2F44013D;
	Thu, 10 Feb 2022 21:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 165631BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 130D440351
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTveyi51Jwrw for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::620])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D1B340337
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM90GROzZvstlO2cpmFTAHNAQYJTf1GrXPf34NJ6UCu+lxOXFR+ZpZp6ZNncvXW/QdrSaSGSRLh0oHu3ZlONHv3nqQ+RL/OCTV8Wr1wP4m7Qchu5v9/pMps8RySa7qpaVDCu0rK2S1iHHcW3Mmh4PGv/FYXRfRVHhDJuRuE25dVsgo3U0egnbpAA6QLQ14QWUb1hxH5WxgOHioeuF/ygBYkoj2EJmQI9BWz3tW4zVRIBvAfEc+a0mZv1W7WEtME89/wQS1xPmSPP2JUUUv96QLaopE8JOyxzowOdXos38koJC9+dFqgf2JV1L/AAR5K4iAk47INxQPdWPXEFPbU3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdvlUDtXyA3UCfu0OHj7ncxEJlxwDC0Mt5EL+hGNVOQ=;
 b=DwJITYG+cgtUVoEL9aSb5thYs6CQQLOn4qIYDFYSrAHLCseyM8pqlqabtRwuDV68wvFWAtw/jEuILIREfUV61FFgIEy6ZbL+9BKiUhdYOJ9FNUd1JjFmX4TqS1CEkVAn6blzNdoPvY6NmhHrSbWRAIKX+S3aER15Kt2DL4NI8eoP/XCQSSWtwq3Cy28izyh8hsggk9iEOMLuBZAO4pU1Kk5Mxyea9v+YvKdo6344TyKQ8qhWt+2aI5Q7l9FqTR0cCc/JEBu+7vgg8efhTCsH+U+7fq+J6OBrfS8RLYc9zsf70W68FUR/+oFxmZFmutGFYOXrs3o79wNJwtAx8Sfufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdvlUDtXyA3UCfu0OHj7ncxEJlxwDC0Mt5EL+hGNVOQ=;
 b=JrDL8h7NSuLQTHHEEp3+8D4bPq4zOBldpQsNYOOOWAsLsan1qmHQBNP5rznzbuFUSz/URQVCEc5rbYuSPJdxLhuUgK1Lv7lnKhMStsJlz3zH3CoPU8T5iq0xiEVVdx6DCrKMJfBUBBX1jweEcCOYm74ZPVB6JGWPYl5rr1nmJ0E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4682.namprd02.prod.outlook.com (2603:10b6:5:1a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Thu, 10 Feb
 2022 21:36:27 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 21:36:26 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAATaQCAABfYgIADO7yAgAAGgPCAAA8RAIAAA4zlgAAQOICAAEF7rA==
Date: Thu, 10 Feb 2022 21:36:26 +0000
Message-ID: <C0EDCC73-0092-4084-BDF3-D2C50304E6BD@xilinx.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
 <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
 <1EC54279-220E-4043-AFBA-953D2CF5E54A@xilinx.com>
 <1f0c37e0-6d9e-97d7-0421-58228d52405b@lucaceresoli.net>
In-Reply-To: <1f0c37e0-6d9e-97d7-0421-58228d52405b@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d103d38-e01c-4284-bb85-08d9ecdd6489
x-ms-traffictypediagnostic: DM6PR02MB4682:EE_
x-microsoft-antispam-prvs: <DM6PR02MB4682B17FC107EDAAAA34566DD72F9@DM6PR02MB4682.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a5lF+xrjT22F50Yglqf/mHqSQE/GFmU3fkYEGaboi7/XpcTdiDKFYqk7twn6E3aC+SGTiucvRVavjHBX39nIehMsWkn9+2ZEwpXJQXnR5Nf4+x1pKR7zzxNiNvMyOYFFB90aF4AmRqJkuNi2NZdHmbGzdCTxncyz1lvlpYEKYu+KptUzi78aCXrMKSCFCdr9C/BqNNqRxidKHyMzITnFHBvb4pOIHEmPpkAQ8bI8huZRaRTQ1ayKToqkylisXvt3X7mJb2Za+rMgtX1G5zzbZUQnrEh4E2W4gak8Gl4UrEHbeCZq3x/Jz5zw68ikMhJ3LfvkdPzSRovJL9JhugkBYWv02zi5qWYv1iemGcXrNIJ2MKGvxLudPkiP46OzrDnw8yW8qw+XgooFOhHYLbHex2RNDLkwsGTLDqHimGZtlRG7v1Byqwk3OggU24OBxWgnrlW95vuRTA4OSEYTvzx/mnhX6YCfIAApZtH36xcFzVr/FPj5nSbGm0eESdbO143/P4tFmL3QziNIg7nzrI9GanqXBOzaVVB2ukafl44b7r8teuBKGBuFydeG4933xXldgmkBTVrPxnyn+Bo7gkhdw/7w377tRTkNrU4dWipkmBZPJVBhXohybHNTzQ/NyV5sjKuPN7gSEqkoGYo2KFeYMYHa78Q9Evl921CLpaUvMdZufKNZVF5/SiP/ynXm8HE4PrceyUjO4b3hhTogaEiITfkIT5ukzsr7SjQT+gqQa2kZ23Az6GijBi5TOc9Z65zl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(83380400001)(8936002)(6506007)(508600001)(66476007)(71200400001)(2906002)(86362001)(36756003)(26005)(2616005)(107886003)(33656002)(186003)(6512007)(316002)(4744005)(122000001)(38100700002)(5660300002)(64756008)(8676002)(66446008)(38070700005)(66946007)(54906003)(76116006)(6916009)(66556008)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jeRwhAfXJb9OOOF7xH4+1VPJ5gdk19VUQ+JhGm3/cDJ+dRprRDApeHbOBanr?=
 =?us-ascii?Q?aWh5/AoVYu/c6SGeLe+Zo/Bm78oyUWxITRhrWx/UVvZpKBBVZzJjAWNJdOmv?=
 =?us-ascii?Q?RAlLjzl5+vR1zZzRw2o8fTTym1Gx1sJFxPr5x/4bXpR4wLNUATOKeBJiBTZY?=
 =?us-ascii?Q?dZD/CIqKhy6SNz/Bs8X6PNGFhjebsOQwHkEVMm0Jnk/dcpAST5Dzkdl7GydT?=
 =?us-ascii?Q?g04ZGQVRGKefJyL6nkglndOo7wPk5ayyXBtQ9m5X46GwPM/12Tf8SP0HyaM7?=
 =?us-ascii?Q?rXP9rLZ5ppcbR3+IAp0G4Ujeoz6nAN+7ZAm31XxHfSnYKNy1F4LC6rtWGFT+?=
 =?us-ascii?Q?/d60jfq21IqDDO1uCVXh0rbSgRMHAqn3V0NdU68SvV8kJXBesU2/aFtDrCET?=
 =?us-ascii?Q?pM/zZGr6bCr2MaZfx/FjoeM3JxqtgaSbJztYYoxQJCqUY2bR84DIq532S4wV?=
 =?us-ascii?Q?dh579N6LtIN28Tv6K3GVK90GpSgLaWPiuybrBa3sQCzKsPP5nNWWVLbQqv4c?=
 =?us-ascii?Q?+NFzLsedIFjNMjiQNzA44EqlrxK4OtnJ75oeeQy2NHzG4aDnLmpOeQv9s0Dm?=
 =?us-ascii?Q?9w181mGMLIH1T/4M5WUoxcuGGlwiejNeFf1YRS0Hd3oxxWivlTnHlvId5BIN?=
 =?us-ascii?Q?ky4FttHFxvmbnijJf6XBs1NNYA5DRfp7m2kqJg827dw5mZ/cEkn7PaHwSWT5?=
 =?us-ascii?Q?Kz+3reEmp0MSLCFB+Wi7sO/nnLZzcBSZjoXZT9rhp73Kw9qQFhKwnXO3xd7h?=
 =?us-ascii?Q?rLGsoBgioYh0YgCMBf7zILWWwfA/mo/To0HpvbJa3oXQPHmGuvhGJyq5xt9o?=
 =?us-ascii?Q?c6dM+t/sRpWyP2mm6Z+IsjiynBidhjsCgJrKA85bxkQlkrtQlyU7GjNDGbXc?=
 =?us-ascii?Q?2JDFNXrDC834SPa2mIVbDajTMVQNlYGOpXe/6SsYbZVeAtRSWavbFTVRycBx?=
 =?us-ascii?Q?nzJRZrMs5hregZPns7oxCvtZpJgoox9yvbmsu/lfJ43wwuK57a6nNxKMGPEH?=
 =?us-ascii?Q?shP6P4Vp8nhVzMgtwbrmlZJ5NuV84iZ22QPoN/sXWWDbgys+aOt/wls6CAuB?=
 =?us-ascii?Q?VMuXZ9BgCw47jVrdtALYGGBUeutQgLzf2C1VgXf6IVqQKemnyl97IyKwyLWT?=
 =?us-ascii?Q?TCAyMHR9/APFwcFuyWHYQ2GQcPl55hB1aU1EoVOxK1bUk4dZTOR2fIsSltkh?=
 =?us-ascii?Q?ANAJSRLuMXmejqF6dQRIXs86I3hI2Ef/qOX1F0eCjnpoFevNzJ0pSPd89JKd?=
 =?us-ascii?Q?D4KyxTKSqPXefZcqcOuhhf9es45gthbkUpVkb+x6cZ4yG4HygafOWwTJtA1p?=
 =?us-ascii?Q?78GeEm0JEJLRuUVp6dRa/Z/RpdzTYDbpOlphbHJVtGvoSDxLrF6Fa9Btm9ko?=
 =?us-ascii?Q?dAmUc4BUkhS0AbBf12LnvZxVOIYtdtkt443X55hPxJb0s7XHC/x5RquaWlUI?=
 =?us-ascii?Q?7sa0VOh80WXoNIvh7rBg5uP13Yuaz7AdHEEY9fyctpbermtfIH0uZwSETGGg?=
 =?us-ascii?Q?jtp+8aYstYQm20xt2wn6ZCEj/8qc5mJVF/ITxVWm9h4Fcxoh5FlYg2m+JK87?=
 =?us-ascii?Q?d3FMQJdIhkW9I7x1qiJFipXrsSprt5RgOYE1cGo26ZGdjPZ1WUQ5XNknd7pY?=
 =?us-ascii?Q?i6ebpz7BLdDQkDARLuwDORI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d103d38-e01c-4284-bb85-08d9ecdd6489
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 21:36:26.7530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWzFuJx0bEKss5uyk0bn/Bn/+0oV/TGBIjwtpbo6f5gtBzoWtmdjpvkHya5DbEfhTIw51HHqfwXJ7FtrmQ18zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4682
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> 
> OK, but it's better to use a subdirectory per board and leave the
> filename as is, as per
> 
>  board/zynqmp/zcu102/pm_cfg_obj.c
>  board/zynqmp/zcu106/pm_cfg_obj.c
> 

Good idea.  We actually do agree on the purpose of buildroot.

The whole point behind updating the zynqmp_zcu10x_defconfig files is to give buildroot users a better example to start from.  
In addition to evaluation boards being common and available, they are usually where developers get their starting example.

That said, I will update the patch using Vitis 2021.2 generated pm_cfg_obj.c files for each board.  
I like your directory structure idea and will add the files this way.

By having two examples, it should be clear for developers that the pm_cfg_obj.c file is something they will probably need to modify for their target hardware.

All of this being said, I will make another version of the patch to incorporate this.

Best regards,
Neal Frager
Xilinx

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
