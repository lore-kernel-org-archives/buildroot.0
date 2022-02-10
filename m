Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD7AC433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCA5408A3;
	Thu, 10 Feb 2022 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id og4p2Im7PEu3; Thu, 10 Feb 2022 15:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF0C40884;
	Thu, 10 Feb 2022 15:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B67021BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1D57402B1
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCZTZJttEqsy for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEA0040184
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkOb5dRWeAlUukTGS6h4h/io5ZWq3FCOJDEy1vCGqFMaMspD3UUv5Xt4bspG2EThZNN39SV4tI95lhOdtr4IsM10gP0BaMgKc43UqBKV6A60z7KtrqMDCUwOrBqmgyLPtvtCKV4dN7IgYsjya1GVNJTJHm671ODztUo6zuQY3l3nwIRRe+vB69LMjIBsDOCTE2TA3MVthPbdPziYnwNV2REOEh/5gK1kQy41dLpnRP5Q2FkZ7A8sadlcPpP2gRJ7cSL4d7AD8gwuxXS0wdVnAqN+Lvj/V4mATv512mEQJOSg+CHeHGhK8T+SlQmGPUXF9zz9qzroll/VEeBYXW35HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yjs6EwSO9hjQQZDXSIUX2yloBlogLi3vGtfLnYXDWcY=;
 b=L6MQZZc5wEoaQ7hrhD/XZi+1oDhvPVuKFQhLj8wr26+NLX0Bt1fcgP62qs1h9JybzTY9oEhGgfwgNX7fzPTff7ARndHyQQ5eJejMrmVut42PJ9IKL4wy1QrUY+DuPwQrMLQlfTq7FyfifvHm85pUQ4wEYSNJCSMMnrlJSeJocVwoc1i5QJEofS+Xb7d0pLCcbMFPS/wGkMbD6LBVqnwCszhYcaNSGjQ4KnJ/HZE8p4JbQtnFt4b5QqfGr9d9EpWjblEz4A8NplWOe1PSaCypj3XQI1m9dQ4HmfV5OPHmnYcJidcvFS6gwh9N0QOOEXBn80OeNxcUKSFIqAhAaVXMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjs6EwSO9hjQQZDXSIUX2yloBlogLi3vGtfLnYXDWcY=;
 b=iSFYgFBMYdAvazL9I7RtEat33BcRk+wqRIhZ8zUenCz3vlRSBP+jOi6VBNBodQ/2AbPOp2X20JpHZVdsEJIbY7qRA7nlGbUVnb9ElQxZGJQp/SqGi9AtZrjr2r+fYkIMJ18zwNxNYeMs/d9RpKYLOtpO0FvVJvotSA009tB/E8w=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB5432.namprd02.prod.outlook.com (2603:10b6:a03:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 15:46:42 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 15:46:41 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAATaQCAABfYgIADO7yAgAAGgPA=
Date: Thu, 10 Feb 2022 15:46:41 +0000
Message-ID: <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
In-Reply-To: <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9978ad4-5c0a-4da0-e204-08d9ecac8885
x-ms-traffictypediagnostic: BYAPR02MB5432:EE_
x-microsoft-antispam-prvs: <BYAPR02MB54327C4B67DDB0D14997FBD1D72F9@BYAPR02MB5432.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OK9ByNkFtbo5zmm5d2Z72agoozRKsxU0ShiuE0Ykjm1Tn5IQ52uIOZ6oeJPhjzY5s4iGjFit5OHNevmIn3NvWNecQyYo25zvJKBcSfUncE2CjAejPc4r2QlS51mmfgk6YBLueWslsyFzJBamrtGg6F0s1zH1xbzSmmnNJj0qg+bWyp53DE+E/7LqiowWIW4k4XHdMPChUIErciyAfmGSHiV8DxF7MF7vNlAvGVX1XbXKTy0SjmnZgJU9clEgzspLaa4iNIwIil7Bh31tupmQM/pQ87epOW+1lAMXcR1HgTa3zyO/9AMUHNp6ihlXNNxZZzxm2J6SrTrSCu0+Hx3a0GoDxgtyKpWNw9DN7FD6jT/FIMCqRDgkc/bzXJzXLKWtXyecCb2Ox/bpZAk3vWRMQJCcF6aInFK3qPt83qzEttQ4YEROd485pSOqBuYOthnjEh0iJRcP2APqQkhxaZRw7Afhn1+D0pb1ErzJojp09UtmkDn1nlaH4ZcMZWL7AmZnWVoVXiFZyvd8I94XVW/Uqwu9WxjDd8l35MAig1aNo/VhZpOF3tzk5hxUKWjEXvs7aScCM51bcTJRHUkwtffsfi+j/zTIb08G2KgmJ2ZwRrwML+1BZauR2DmLQaIhfhUbJC/0GTsHosIoCKA09le5ACYflbTihvm1uGRb9o+2PVdUOgfS4fKdALON/oqAslxi8C/ZLSwsjWe0CM9hKQRmjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(186003)(83380400001)(4326008)(52536014)(26005)(2906002)(122000001)(38100700002)(71200400001)(33656002)(7696005)(6506007)(8936002)(55016003)(66946007)(76116006)(508600001)(86362001)(64756008)(66446008)(66476007)(66556008)(9686003)(110136005)(107886003)(38070700005)(316002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekYxSEpmQXdGdjBNUURhRVZBa3hrNU1LVUlFQVBsd1ZnblJySVBvT3M4Wm1P?=
 =?utf-8?B?LytuNFBLZkhXbXI3a2luQlFMQy9vVk9hNEVjSXlkaDZ3UU9LRU5pc0ZUdmNE?=
 =?utf-8?B?OUIvZGErb1VZcjYwUFZrcGJ3Z0trd1MvU0V6MlROV0Y4QzJ4NE05VEhpUnVQ?=
 =?utf-8?B?K0NUNWt5K01DRzhBUDRzcnhDNENzbllua1VycXZQa3VCT0UxNUdONzlCNGZI?=
 =?utf-8?B?bmtHcFl1N2dGV3p1ekV1VEFXL2hDTUV5TW9xMDB0RmFUSHVZaGlnV2orZXFT?=
 =?utf-8?B?SHNoZVczUUpNc3pqZDdDZmdGOHlYaVNNUlhWVG1EU1NDQlpZVmNQK25EZU9x?=
 =?utf-8?B?NFNnaXJjVG0vTjVmOTYrKzZvTWdmN0UweVVzMmU0emE5VWgrSWJlSTB4VFEx?=
 =?utf-8?B?STFYMTdRUnllV1NaZWJ1TlBUVUFWWEZ5RDlPdGY5Y1JHYUswdHlDaGJhSDBz?=
 =?utf-8?B?S2t3T01sUUdvbnRDR25aTXNuckxhampUaXZ3eHV1TE96clJFVVppLzZkRFdk?=
 =?utf-8?B?Wk1ocGw2SEMybFEvRHRFWUdqbUxZdUZ5TWVPUXpGKzEzMXFrdk1NUVR1UGpi?=
 =?utf-8?B?dE1HZk5uTm12UG9NZWVEUUVhaUN3c1F3RlQvdEJOQW4rd09Hb3o4ZitjZ2lk?=
 =?utf-8?B?cmRDVlZadXFqc1VRUnNyOVcwZXRyc0xJSnRxbWRHZVp1TzFlUldzajBGL2pB?=
 =?utf-8?B?YkxXQVl3cDRoeDMyOU1UVFdPWE43eGdxY3VhSWY1QnBhaW5sUnVwNXBHbVE0?=
 =?utf-8?B?OHJUYTdYSEhqQndPZDZOZnBiMlRaVXEzeGx0RzlTQUs2NDhFVU03QzRweE1U?=
 =?utf-8?B?dWVIcmNOT2xIMTlJR0dUcWNPVVNrWjJmUGFTY0VqZkM3eHVSeVgrRDFud0RR?=
 =?utf-8?B?c1piV1g0YnVWQlp3T0w4czMyYTFHaVJjUVhlblo4N0FBLy9oVHBZdjFqeWxC?=
 =?utf-8?B?ZDBZbm9qUlUyKzBUclFidS9tajl0ajRINlpPV1A2OG41N2xwUkNXWGs5TmE4?=
 =?utf-8?B?bTVDS3BIanZRSVdLc21zRG8vTldOMGdHckxIbm9XV01BNnhJZWVxTitzMXE4?=
 =?utf-8?B?ODhtUTd0L3JyR0F3UHFGcVBCQVVsd3NhTnU4S3l2aFIzMUx0Njg0WTlmY1Vh?=
 =?utf-8?B?dk1nUEZWdFJTT1huanFBSHdtd2pDTTFMcnRsSGI2aDJsWnE3WDhjQy91TWNt?=
 =?utf-8?B?UUFXa3dKeVdicm5vUTBWMDh2R21uMVk5TURncGVaS0hZbjIzQTRadFN6Z2Qz?=
 =?utf-8?B?S2d2V2dvWkNWd0Y4VnRwTzdqS0U5dGpGWFRZdFFRai9nYjlkNlJnU3JyZmVK?=
 =?utf-8?B?cjFoRHQzQVZ0MjBxVER2MFhBMDVZbjViWW1wWE05aU5IMzRoM21NWW9VNVNr?=
 =?utf-8?B?KzlYcWpkdFEzZERrN1NNTjBHdFI0V09hWlNYWEl3Q3BGejRibjU1YS9vcHFB?=
 =?utf-8?B?WVNWSjQrenBwYUFxZGhyMXNWcXBWdWZad1NYTWxDKzdDNHpvT2lTSEo1Mnp1?=
 =?utf-8?B?U1FIVDZyK1dqdjlBdmlMTFRYRFdhVStMdHpaTE1ZZnNIMENJV29EREY3amJy?=
 =?utf-8?B?UnV1RHNvRzNoa0cySHV6NHU2UHNPZEZndWtDUzgxWldSLzhEbUtRZVppa0Rm?=
 =?utf-8?B?TkNNa25ZZ1Y4VkRRekE2UVNqTWlERzZkZ0lFdlJIb3FFd2dsUkhDWnUzTUp1?=
 =?utf-8?B?RTBCemlMb1ExdlFNTkRzV0U1dU9aUVJSbU8zOWpTMjF4SXh0YXp0RnFPVGxP?=
 =?utf-8?B?cjdPQlR5aGpiODZQUlAxSXJZanpRYnk3MWVDL0I0OTlBL21WK3N4SGZJbTRF?=
 =?utf-8?B?bVlTNnJ1bXpHSTFNeEhVTzlaUXZyUnNNZVVBV3VqSHA1RHh0c3BRT1JQNTR5?=
 =?utf-8?B?Nk1OZzRpYlF5alJPYWtEbk9BaFVvYk9heWJKMnNJdmx6WWxRV0NFU1BLYkk4?=
 =?utf-8?B?Z2NVTExySkE3QVp4VTVDb0I0UVM5WG1rQnJuWi85MW1lMGI5OU90OXk3c29E?=
 =?utf-8?B?ekpXTm9TZis2WVdoNUxUbjJGaVFkUU8vS0g0b0lLajRyK0ZBS05nY0lLU0xa?=
 =?utf-8?B?NFVDN3RuWitnQkVHM1FYOUJFZC9tamFhS2JrbnRZRVo2ZTZrcm9aRk1MV2xu?=
 =?utf-8?B?Z0tpd2I2cmhENzhaSzFvaHlrS28vVmpjeWFRcGlNclFDZmJ0MDRYVGppQnZG?=
 =?utf-8?Q?ioimFbat4ybqjaRh6h3N96M=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9978ad4-5c0a-4da0-e204-08d9ecac8885
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 15:46:41.7704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1yX09vU6iih+aFwWWBm4djzcIHBx0Da+gJfW+95R/ai2QJYhl9r9HOUVYfWBa7LZW9IPlNk43BMMLp4HbrHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5432
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
Cc: Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Interesting, I'm curious how this works. The pm_cfg_obj.c at the URL you provided, as well as in the patches you sent, has some peripherals
> disabled: USB1, ETH0/1/2, both SPIs, NAND, CAN0, VCU and more. Do current kernels implement enabling these at runtime, making appropriate requests to PMUFW? This wasn't the case last time I looked into that, it would be very interesting if it  has happened in the meantime.

> Otherwise one would need to provide a per-configuration pmu config or a "wildcard" config, but I'm not sure whether it would cover all potential use cases. Even though Buildroot has [almost] only defconfigs for well-known evaluation boards, it is really meant to be used by custom designs, thus we want to be able to use other configurations than those useful for Xilinx boards.

I took a closer look at the pm_cfg_obj.c, and I see what you mean.  What confused me is that Vivado does not generate this file when you create an xsa or hdf file for the hardware design like the psu_init.c files.  So I thought the file was always the same regardless of the hardware.

Instead, users have two choices.  They can either use Vitis to generate a FSBL which will have a pm_cfg_obj.c file in it, or they can modify this example file manually.  The pm_cfg_obj.c that I have included with buildroot enables all of the peripherals that are enabled on the ZCU102 and ZCU106 boards, so I think it is fine for having an out of box example for our customers.

Perhaps a good solution would be adding a readme file for the pm_cfg_obj.c alerting developers that they will need to modify this file for building designs for custom hardware.  In any case, we need to have an example pm_cfg_obj.c file in order for the buildroot examples to build and run.  And I think the pm_cfg_obj.c is only one of many things developers will need to modify when moving from an evaluation board to their own custom hardware.

What are your thoughts?  You have been working with this issue much longer than I have.  Thank you for your feedback and support!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
