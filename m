Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8779C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 748CD41730;
	Wed,  4 May 2022 08:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoAI5xmTxssl; Wed,  4 May 2022 08:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8ED41506;
	Wed,  4 May 2022 08:53:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C06E1BF475
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 08:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0C241506
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 08:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbKoDTrl0FCR for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 08:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::605])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33E3410E6
 for <buildroot@buildroot.org>; Wed,  4 May 2022 08:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skl+D+3HK8YF1C8K8UVcepd9Yf9hpjajTISujIyDT7SQR2s6Rf/COceYJsZcuOmHz3IBQnX1EU8NLGiftbkibquG7fcfoyNZyzKg+qIo5X7MqSQE7GIOz3ITOmrCztmgiTvUe6RfMSWt6gj34HOLAgB4GxQlRmsE4eKSYmeSI9oT5CB5UGzkk+AfNzC+u/1lCeBoWx78TXHQ3VJwY7/vk6wirNb6aKOoylFFYWsWXfR+LFIdGJ4NuHmbwn4FMKIq1YBSQ8jTWE7Z+sDrVW7E9RaZvbJ3roaHOzuM//L6RkqqmHe/Ee2I2DWYQwt8MvoinpTpvrf31dtPOeURPJROng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvQqWHMcS6I97bzaXU6WWBoBlVng0jJKM0cczz2SR3I=;
 b=SIIzCvjB+rGiwcpZ5N9rFBjQsLZrzWzr5EmrezmRXJ+DUntU6Zlp5Kb1z7a8oLCPhziiJiRCQFO8X1z297dFln1YY1bmjGLGjJTb2CP/WWlK7qOe+zwwJusfy75f7ALSOb9kb+g/g9E14iTFKrDyUIJAcHhjgeLBCzzHwqzA8XIpA/QfJuKXj5w1b43MPuIbP91ldcYY8MlbDCroLau9cKdSWdzMJBcE/7KRZ4pf1OtrQJbsz9KsRC2v76gxueGjNBW5N+uBkNuwxvvImUf+td1iM310hx0L3DfNfnPG7Y3PA0r+K2tjZ5RU38S8xYoIKNvlFHbWg7MuC46LSIXpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvQqWHMcS6I97bzaXU6WWBoBlVng0jJKM0cczz2SR3I=;
 b=hu8mMZs2Xf0gTGXOJu9SJ5vi4aH+LSP7AGHCouonapbq6+JS+LxSARPs7SqqcPh7b8UVU+bDu9g6FgXrqqmPmCw5PNM6v2/AKn7QUhw6FIojyYnx5k/H1LiFMZIYJOZA6T37eUBoJJ/gM0ecHBiFi3eQqvhHtxBXLislLenK4To=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB6332.namprd02.prod.outlook.com (2603:10b6:5:1d6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 08:53:02 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 08:53:02 +0000
From: Neal Frager <nealf@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>, 
 Michal Simek <michals@xilinx.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CAAAIFZoAAAYeAgAAYOnA=
Date: Wed, 4 May 2022 08:53:02 +0000
Message-ID: <SJ0PR02MB775868320C331FE1CDF57217D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <878rrh3gvx.fsf@dell.be.48ers.dk>
 <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
In-Reply-To: <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88d298a9-4d2e-4347-b167-08da2dab7f2a
x-ms-traffictypediagnostic: DM6PR02MB6332:EE_
x-microsoft-antispam-prvs: <DM6PR02MB633244EA9208727A3A8A8A0DD7C39@DM6PR02MB6332.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SAnxweAkfrbx2iDnyCNGt7LpKRwjh/LuIZW9cnwAvfqHE68Kvxq5yA/cC5dIpNLssfnDJGWBKK9Sk5R26U9PvfRAZtNa6tiZ4tcXRP1Ex6LgOediiHPyOIua3clz/e8X8jPCu8Vkb36njvstmsHProqPmbgq2REKhylfcwwhDPoCJfVPM5yIUiHZCMcu6WNhZl+OmpzJPfoUNiqEncsxClLhXLazhospNjFlZOZEDnu9kMtaGdpmTxzjTgKMjinqLmm+VhYjL8pU/EZWhJ2k9Ci69xwFV7BXkBhqURnlYfn3lcCjEYK9Fe3k6lVnzO80q3NeOJZ+XUZZcJaTaekmgq6JcUCEl6UKIE4E+Nh+7XmVQrahEYwG5U30s+q018gfk2yEJpDy/TBWQCuunEHINBBiTRqn3auNCVEPio5tpeC+6JNm3NBwC6mu8Bbh+epcXkAvXxes0pe5Z0CEDQDdf4hL99d8Zdm+Es8BqysBJmK9o+ovpnVW5KZosnWxI+a+/iYLMxGC8nePFQqp9lN6FCLUtlHTwaCNjkgFGxKPDc5U2n3k7pF+FwVbU3XNO1hD8i+VBZaELiSErULLS3kIDkogTXggt6Rgxx306ZHX1o0ixIUIefVQ7fjyth7K6blsKBPEQZ4TltGUl1mXlTeHi3rf4gh66DkM4LqYeyhSvt5JNNfj7URsfNfDlign2bCeBkTpgj1lJVRLwrVZXUdG3SrU+v8lE+M/xNSFU5oT3Exo+UzrL42YkTXD7U1DWiO2Xt+uzRbvR+XT4uFL4/49cO2iXLAVlR9rzFUyJbjusvY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(7696005)(9686003)(33656002)(122000001)(86362001)(38070700005)(38100700002)(55016003)(83380400001)(110136005)(5660300002)(508600001)(54906003)(6636002)(316002)(66946007)(76116006)(4326008)(8676002)(66556008)(71200400001)(66476007)(52536014)(8936002)(966005)(66446008)(64756008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blVoV1gyYWN3M3paNVBjSXk0SkZabkNNZE1EQm93c1lVYWErRStHYmJwd1J3?=
 =?utf-8?B?QjZ4d0NvVkhPMlYzNWR5T3RtUFliU1dQZGFCR1loRjd4WlVMTDM5QzdCcGdr?=
 =?utf-8?B?TVhCN1FCMWZrSEloVEtXUFhMMWZrOUR6aXZZakpQTTU5dllXbnE2REY2Y0Rm?=
 =?utf-8?B?enA5UWJuSkJTMlJ2Z2N1cXA3MTFvTkhweHJSUG9QK3VtTUhkb1RFTG1aaUtr?=
 =?utf-8?B?ZlBKVXhxM2I2V3lnL3NoUDBSNXNBNUtOYnBvd2pPWG1qeEZyQ2lnak14bWtm?=
 =?utf-8?B?c1dZRGhMSWtnQ0E0c3pMMExrdjd3TFhGMWU4SFpxN2NEd3E5U0tZRUowU3pp?=
 =?utf-8?B?N2c4Sll5L29nS2JYazFpMEhrd3VuRys0Z1FYdkk1a2xJdzk3K1dSdHN5dFVh?=
 =?utf-8?B?QVY0dEhvbEV3NGlCczh0c0pSdmtLbHZXMVNUbWlUTWRHaHF5bUZLY1QwWUdN?=
 =?utf-8?B?UzVTT0Y4WktLNi9VSkJxRUdkUktlOEJoU3NjMXJrSUVLKzgrdEVzMmFkbDg0?=
 =?utf-8?B?MWVFRE55cnlHaWVGaHhsWVYxSUJiS0FlbTlOVTFUWXpUVUU5RkV3ZHpoTFN4?=
 =?utf-8?B?K0U0Q2lsQ2ZxdlB6azZWNTl5L1FZZmN4U2tKWWZLZzloL1RBN1ZVc3BVSnpK?=
 =?utf-8?B?NFpYT056NERURlY1d283WWRiU09wOUhPV1JZcVI1Z25jNExHZEdacUtnRCt1?=
 =?utf-8?B?RDNQWFVHWm9USFNxbm1TUGY5dWEzYzFveFhqc0dYMU1EZkVSK3NZOVR4c04v?=
 =?utf-8?B?cFB3WGl1ZUp1SmxhV1MxQ1RTNzlteDRsN2F6eVQyRlQvY0thMnlZYjc2TjBo?=
 =?utf-8?B?K2hPMGx1VFZSaVBVS1NJZmkxTkpEREczYzlrQXpsRkpXVjVoQmRYTTFZUXM3?=
 =?utf-8?B?MHQ0cnZ6a0FNbGpZMFUxVlI0RXdqdTB2WmFwU3JKUm1kWHJrbXZvSWpyTWpU?=
 =?utf-8?B?emEzOXNpNVZuVWlrcDJ2TG5zNkNlazFVRjJiN1lKMDZkbVJXc25LNDV3aTVm?=
 =?utf-8?B?bENpT3lPWURRWnk3OFpPU1FlcDZmWjNVNlRza1JpUCtXcFBvWXp3dXVnb2hT?=
 =?utf-8?B?aktnUlFvc2dEOUx0cm91TVZwL1J5T09uOUZBSU9zc2xkeElNYURDSXg0YjJL?=
 =?utf-8?B?Z29YNURJRm1JeElmdklxQWRBQjlYcVQzanZjQUkxTll0V2s3OVlPempyNXpC?=
 =?utf-8?B?QzJUeCszOTFtMEJFV1hPNjkwYzl4dExTcndHb0hTdzc5TDBiTndoZFBvK1BP?=
 =?utf-8?B?RkNKRWdvWHo3SnZJR2cwZzNRR0VBNmM2Y1FpY3FvQnhrOFVmdnpQUXlHRXQ4?=
 =?utf-8?B?ZUNMbWZOVWhTY0xPYmJCdTZrai85U2VGS1hBeUdUSTJvUnE1UUJZOUhGenYy?=
 =?utf-8?B?UGppazJ2WVhYVVZsRGd6Z0JLbHRJc05FRis5TWtjSEpVSzRKMzVMakJEb2F3?=
 =?utf-8?B?ZCsrU0NYTmkrdnJXUGJ4Y2JZbm5CZnNOd2dVTWhFdTY2dDhiekp2dlJ6M3F4?=
 =?utf-8?B?NGhWZ01qSm1OcHBJbkc0SVlLb0wxN3dSYWh3T2FjTzRGVTRiNzJuWDhlck1M?=
 =?utf-8?B?MGQxeENIemFQRXhmV1JxaVN2Wnd5M1lOWUR5ZWZmVUZiWG84c25Ld3J6YVcw?=
 =?utf-8?B?anZudXBKQ0xnL3NvaThCUTNWMnhISW1EVDhzZGEvU0VxNnhKK2Vid25xcnBi?=
 =?utf-8?B?OUFzakdLRXNuT3FPdWlIaEcvMUxmWnE0bVRXcVp4aVoxMWxEQW96Z3J5MWlw?=
 =?utf-8?B?VXFJWjhPZ0Q1WjkrZjNVcmRKWXRmdzlrSFp6MUpMdk0vbFlNWis2VGtObC9m?=
 =?utf-8?B?UlQxMGV4cUxCSFlTS2NtV1lIblVoU1BNcDc0eU5XMUhtS1lkVTYyU3E2Y09v?=
 =?utf-8?B?QXpEQ0RrU3lqUGVTYVlvejZDTU9UWFN0L2REU0ZLbWJjMmE5RkFkd1FNelVm?=
 =?utf-8?B?TThNRmFLdmsvLzFYVk9Fc2x2S0xKYmhmZjErc1J1c2pUWFpvUThQRDNrdzNh?=
 =?utf-8?B?ZFRNVFFzVi9uZTBvTDl5NzBCL2wwOHF3a2VTcU53U2JSUTA4RUM1VHloUnZY?=
 =?utf-8?B?ZURlZ2JXb04ydHFycjk5Y1pvVE5DQ0J6bHJSUzVBaHdZQTJOR0hUb0tpeHF0?=
 =?utf-8?B?ZEVVT2czaDBHU2pJMlllbmo2UUFNa2FQVzR4eVJNaFZwVk0yN2ZQcWhkNTMz?=
 =?utf-8?B?WDJSV0FDeXZoN3M3MUpSbkw0ZldBOE5zc29tSEMrOGlSSitRNjZOcTB3L2di?=
 =?utf-8?B?SDl6eFF1MnprRzZ4emhqV1ZNTXVlRlRDblpMV0dlZ2JYU2lCRzRKcVIxTTA5?=
 =?utf-8?B?aGljWGFtVWZiT1o5YjcwTExIbG1hNzVJdzNJcU8yVC93NkxzMDFZbDFSMVN6?=
 =?utf-8?Q?6Xw6KYKU/3ECah5SZVgdELDvUy4Cvvi9MPnH7KCSXlTqh?=
x-ms-exchange-antispam-messagedata-1: 9bGdHR1fd3dilA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d298a9-4d2e-4347-b167-08da2dab7f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 08:53:02.2040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87fW+wPqfCJIKq2tLCn8+JuMA4lkhowlN4pQTnX7dEaW7DljjJwy6WVvj1RVSh7xZRB0zTPtmr3vZAAisKjX7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6332
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

>   >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
>   >> not present
>   >> [    4.393156] ------------[ cut here ]------------
>   >> [    4.397776] More than allowed devices are using the vpll_int, which is forbidden
> 
> 
>   > This is caused by not proper psu_init which setup PLLs incorrectly.
> 
> This is using the psu_init_gpl.c in U-Boot:
> 
> https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2022.01_2022.1
> /board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> 
> And the pmu configuration object from Neal:
> 
> https://git.buildroot.net/buildroot/tree/board/zynqmp/zcu106/pm_cfg_ob
> j.c
> 
> So what exactly needs to change?

> I don't have this board here that's why likely taken from any old design before this check was added to Linux.
> U-Boot psu_init_gpl.c should be updated.

Could you please share exactly which register writes in the psu_init_gpl.c need to change?
Perhaps you can point me to a known good one, so that I can compare those specific register writes with the zynqmp-zcu106-revA file?

Thanks,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
