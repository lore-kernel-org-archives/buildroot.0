Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473D4C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 10:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7AA40189;
	Fri, 11 Feb 2022 10:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pwPLwegwPk0; Fri, 11 Feb 2022 10:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85C5C40120;
	Fri, 11 Feb 2022 10:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 592921BF336
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 10:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A4082FE4
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 10:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZMYIWWwb0z2 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 10:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86AE482FB1
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 10:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3F2ksl8h5Q9LXnk1peNcLNE0N5FKfMgJLXt6bA/7SdmMvG5z4+dYuKJ7JIr5X5RR6qOp251l+IaOudKCXdMfuuV2RrnGLBPhhQkmfERudqLXIEW0/y4zO0/JAHS7/56qU+5Hyq7LIYwL/bnCoIdyR1Wy4Jv+ff2XC0vhN5MoCHDUQSInkPMxVQmZfJuXJqOV1N4IPiD4ILJbfamJIImJbWyfBPyO64EDdtcQy4YqDsoTPQUGHVDyd2vzJ/zW1b36xmlAGsqmmSiBW3e392o5ofKl4b3uKbqeE/H7PlrqQHQgb4Dqjttt2r45CEAGIV5RL0iZ32BTNdBgpKvqjAzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3ZJVU2c9X09bHfo3iToAv1kK61SSQBYnr0fwJgUYG8=;
 b=Pwo/SmtIdKalWkjpVvbPyFiqb4Yq+NUkqCl/5N+30nhtvwC+lgoYeeDQCOQBlG3iw3YTxPoXp0QieYHtGlslnqI0mMFMOeMtePPkbpdq2ivfuJLP9238hhkEcrqUcG+iVpIzFJEe/2kdvejdOyB3AOhLwsi4/8AKmInx5ATFFaxHgcAwtI2LYc8OUm65ndzx1vptC/D6IaMyd2IE9GFeb0MGF4FH1f41Nh2ETcQelgJiBtYvlYqDQhPRvDYliZYlNXPFl+drzGkShtGnIMHiv3WJQJWQGmLyChbKpb/WY8H4pTsK5Uww9Ah29w3ND4tIbgemcKO2nv32m8VSfnc2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3ZJVU2c9X09bHfo3iToAv1kK61SSQBYnr0fwJgUYG8=;
 b=mlFPy7RvTHaIaxqbNoLZSO8+3g+3p2X/0XSLZtvFzQHfaN8Zo5nmcCNS9LEzphB3EBRbApzAFVDOhz8RBVJOcXlQ1nRuxG8cbDfFuMHcUWwZsrtWsuhQBRPDVMNBjZJNavmoEotGUsvPH4Uu+RJUPguxg+kthgilz7sXMvqMUyU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB3947.namprd02.prod.outlook.com (2603:10b6:5:9d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 10:37:38 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 10:37:38 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAATaQCAABfYgIADO7yAgAAGgPCAAA8RAIAAA4zlgAAQOICAARnfEA==
Date: Fri, 11 Feb 2022 10:37:38 +0000
Message-ID: <SJ0PR02MB775869C33F4F03D906391748D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: ae502db6-207b-4fa0-a56d-08d9ed4a8630
x-ms-traffictypediagnostic: DM6PR02MB3947:EE_
x-microsoft-antispam-prvs: <DM6PR02MB3947A00255DA2B30E71110F2D7309@DM6PR02MB3947.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wLM1ggQGRAXa4f1dMLLaIQ5HX3Z3hotuJKmxjWd/LTw381YTMKEOjD9ojNNNnGOkeUkXUa2TezNlSdTZ2h5egLmqDTnJ1HBCMVU75Cu4NI8Z/RmDUMIoDSSIF+Wg246wey8afUFRX0HHOFcK/XtGK1bupbPTuBXJAmA7c9HS6qzv8L0ZU3pDEJ15NVBX9w/8mvBYaIA2yrNl9b7UnP2Df9fcBTrz4s3GFodeQWKweEv0kKPe4wiwKmHuPMoSBPhSiJT1/ORUbFvY8A8fiUhGWg3v4SUKV7fXfXt6dY3gTWmgOexcqQVsCVLF6up8HDjBlV9K1qLoPRPHilymRzm79ZrDMDMC6Ml3N3pa5xXTUaHflI7TC2XIrL5sGjr0iGDGjW56/GvEzA1y11fmpW4OQ4IVj+CLDv74jbx654beZ6R86nC4kU2TsYPYLR93UGqLUNQ5OtmfhBh8Yvf9Ugi/XYREaLBT/9lb76seSbbPnFNwmhvEtfICtatMNBi7jU/AmZKO+qpALu3R2V6U3XJeHywX3FvkYzQ8j4gkLR32LuvnF3G8/P9pFAm+jPVWISYpZ/9RPEJvNpCHrzNIapvFz+6vSXI5iLaaS8IABgGdxZNC7060lifV6ndsGiH5AiwyX/BR4Nnsmx26yxVbeTvQnsSU2GlMOg6D/IxZFEEqe8NZHUKE8Cu9RuOuKiScOTTcnOZtaymcYSjLfPoELzFoRiJ0fg1iwcESpyLMtlzBorNykPyu74oagbuOZuFO0bfD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(107886003)(186003)(86362001)(33656002)(7696005)(9686003)(26005)(508600001)(5660300002)(71200400001)(52536014)(4744005)(64756008)(66446008)(8936002)(76116006)(110136005)(66476007)(66946007)(38100700002)(66556008)(8676002)(4326008)(122000001)(2906002)(54906003)(38070700005)(55016003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1Zla0JKTEJYazBFM3pROE9oRUQ3eEJXSGNRMjRJMTJncE1oS1AxM0h5TUxi?=
 =?utf-8?B?aEhQaStxcHhLU3pOYWhNekNLT0lPOWRGZkx0dnNMY0JQc3M2YmtJUDRYWGdN?=
 =?utf-8?B?QzdlR1RzNWgxcUJhRkFDNkZEWXEvWmJCMHFsVFhvT0YzWVlJOSs1YjNFaW1t?=
 =?utf-8?B?Z2JxY1U5eFB0OTRPWFNSTVBGS05VZS9KZFNrZEtWSUVTNldyZ3FFMWZWdDdy?=
 =?utf-8?B?T2xwY0trSFdMdXVCdUlhWHcySDdEK3IwQXJ1a0ExL3Z1UDR5cWZuN0ZQcXU1?=
 =?utf-8?B?UWtVTVBpdk1FbDU2Y0pGTVZURWhod1pPaUNUL0toaFBBemlUK3FQbG8vWGta?=
 =?utf-8?B?bER4Z2FYbTlVRzZDc216Q3YwQVdzajM5NkdsUHFnQ0FkQ0tjbXJ6Y1YvaXoz?=
 =?utf-8?B?NGxsMXAzcUp4S0JFRzNjZUZ0M0xLMi9nOGVTNVY2S1FiSVl0ZEc0QjVqb3FU?=
 =?utf-8?B?MjhNSy8rWE45YnJHcHg0Q1RsUVhsWnNpMUR1dzNxeVdkTjJ5Y1ROZll2NjNY?=
 =?utf-8?B?SC9XVUFaSFdqQVUxZkg5dmpMb1dBUHBzK21vaS9DRDNiL2hDNUh3aml5algw?=
 =?utf-8?B?S3REN1ErajBOUFQ1b0gwTVZCbmpjRG1tOFdrWXl1a3dEamVQV0pHTTA2MkJj?=
 =?utf-8?B?YTNZeTkxb1p2VUpWL1MxL3pxSzBoRENMZmJzNFpMNnAzbmN2TityYW5UM2ZG?=
 =?utf-8?B?cVpQRTloTjM4RFN4alFzWCtram1IVXB6ZVB2TjlmUkt5SHBMaVB5ZEVHZ0lt?=
 =?utf-8?B?cHRKZ01qeHdpT2c0N3AxOTN0L1JpU3BEdStBeVZiMm9LUStEY3pYaitQdVE3?=
 =?utf-8?B?VWlMaXpsTkVKdWlmTU5aMlVJcWtwK0lUR2dlWnNwYWFOb29WdndBbVpUeFpi?=
 =?utf-8?B?aGtWUUJuWVlYZVVka0JnajRhYVBLTFlvV3BaVDBVMmlIVnhseFJaNXhMY3Jj?=
 =?utf-8?B?Q2ZoeWJpTzBBM09RMlFDZ2NJT1QzaFhJczJYMjQ3TkpaMTV6enRnRGpybjc0?=
 =?utf-8?B?d0pYSThuUCszd3N2ZXZMMC94TnZMU2crUlQ5d1QyaUN6eDZtQWl6a0laZE8r?=
 =?utf-8?B?aURHTEJ2dm5jdGNIUFpycldaVEZINm9xa0xXVWZXWkdjOVB5My80aThyUGxl?=
 =?utf-8?B?Y0ZQNkdxcy9LdWpBRFF1TzJVVElaWTR1RE94TmoyMlA5ak1CTEowOHN1NFpi?=
 =?utf-8?B?RC9tT3RkOTBqT1F3aUIzSm96UmhBa1hWTWM1N294M0JIVks3SzVlVWx6ZFcy?=
 =?utf-8?B?eEZDcUdhd1Z3VzNHaVBpd3FYUHExM3d5UDQyc3NoalAwaWJFYkdldGJONmJN?=
 =?utf-8?B?NmhqSG5ScHZPQS82L1VQZGNjL1RKZ3E3ckVkdVpjV20wcllWN3pJUUJvdXox?=
 =?utf-8?B?aFprckJTNlluTFhSV0o2OFYyYXQvTFIwaHRNL2FQbnRqWmNYT2h6U1grajVQ?=
 =?utf-8?B?c0ZMVEdoK2VNcm4wSmRybG5IdzJCVXZkYnpiOE9xcWtFb1V6SlFGdC9IQ2hl?=
 =?utf-8?B?MHRpZGFRZnBOUlB3d0ExL3JOaUJMNmxRZlBCd3VTNUZ3M1U1Z2xibUNGbHVr?=
 =?utf-8?B?MExiN29rRWZ4TUpLaktLalk5SmV3L2ppQTQ4ZzUrOFUrR2ZGY2FxRzN6RlZp?=
 =?utf-8?B?SkVqc1hxbVljdTMwV0pnbWVpWHE4OUUwalAwSklTQnp1NmNONkM4ci9HTmdq?=
 =?utf-8?B?Y2txOE5PQmZSMThEZHRUbHQvTi9xdWgxdVJzWE5ibmY1aWQwU04rYTVScVZ5?=
 =?utf-8?B?WFB3L1JaNnptODNlS2VsSVVlazRCOTZ5ak1DRVVQOVNoR0ZnbEhIc2ZlYlhh?=
 =?utf-8?B?TGlkVWRTeFYycW5LZUV0R1NPTG9ycjVJRUYxbnNYdUVqNWcwcTlPYjhyS0x2?=
 =?utf-8?B?c0d3eWFVTXBmWU9NckhmaU15aHU5d0ZWR3lQNk5lM01GajcwZFNneTlsR0Uy?=
 =?utf-8?B?TkF5eGE4UXpsNUJ2N28zTE5ESllicnp1SFFMZGlRaEN6NFE1Y2t3ajdSODly?=
 =?utf-8?B?cGRMTWRHOFRGQWQ3MDBlRFN4VUMwc0JTVk5JU2FwVFhVek50SjNmWHZCcTNB?=
 =?utf-8?B?c0dreHpGL0RFa2hjNkx1ZDlKeVVVYW1OWVl3Y1FmK2FpVHFpSWU1Mll2bjA4?=
 =?utf-8?B?ZGJ2Y05FUitmdjBqS3U2RnlvWDhmcm5yVzJFWlcxYjQ3SHd0M2lNRjBxVCtX?=
 =?utf-8?B?a3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae502db6-207b-4fa0-a56d-08d9ed4a8630
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 10:37:38.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJkxb95Sj8lJFFN/3Dlxc3YptJMnuJY1BEcNobP49XzHhMhYcNUiKc26YRnW1Od97EfXuYgAL+q8QweBU0fp8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3947
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
Cc: Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

I used Vitis 2021.2 to generate the pm_cfg_obj.c automatically for the zcu102 and zcu106 boards.  
You are correct that the files are not completely identical, so I will make sure to use the Vitis generated files in each case.

  board/zynqmp/zcu102/pm_cfg_obj.c
  board/zynqmp/zcu106/pm_cfg_obj.c

For reference, there are 3 differences between the two boards when it comes to the pm_cfg_obj.c file:

1. zcu102 has pcie and zcu106 does not.
2. zcu106 has vcu and zcu102 does not.
3. zcu102 pmu uses gpio1.2 and zcu106 does not.

While the two boards are similar enough to run from the same pm_cfg_obj, if these 3 features are not used,
I agree that it is best to use the Vitis generated pm_cfg_obj.c files in each case.
That is what I will use for these files in the next patch release.

Thank you for catching this!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
