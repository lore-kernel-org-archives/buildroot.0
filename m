Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558D0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34398137C;
	Thu, 10 Feb 2022 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef5uvkNdoqIu; Thu, 10 Feb 2022 16:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE7581356;
	Thu, 10 Feb 2022 16:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 744F01BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62CDD402DC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCSKDcNONnUf for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 16:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::605])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D8164040B
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 16:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbkIszSoNoX4Vd6qp58L1Ixma8vVPRi2cekvo9TE6xuy9LZUse7whKoOZrPpRtU6ZAhLgAgX/VmnSXAonChTiphphuaGc9PFTY5X6TOItsBlF8jkxdtb/hSXTvX6nPCc2szSI9vjA+68V2ZgD1+/9vMFJIXGEt8eNm3tz6qg6F1OaJ1sY0mpcgbagcWJzCZHcXogeutgmfYoUgGMOJam9zG3TTHkuCmYbKAgtoCJVPOJIJtfYEHtiRO97KSwlNM3KvgdIef6Ieo2y1m8lW5XCKdcWFvhiTxm4RlGctC9MBj+qqd8wPYlHX6YpBbz5W4jTZHA3uw2vAmbcNWkzEsQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtimNATIpobGLIb8w44jigc9xMoqmYKrIhxYJJQURHI=;
 b=cJ5nylERaaKVKgqNiTT1f93eBzRY5RPzVF6iTSGPdPKQ2VQz68MixL/c4zmUliR9YmHn693Mv3MeG7xf7tdXaOLWqviFWh9KooOrmQvS7utfsMVKVN758bbQ1Y3qFqsWfUaOw6B08NKz4DaeHTP6HDSQqYomY1v+5SYLJ08rd6xvzQEisUxKczD1Qupql8zYDoyTgi8c2JBHCNPpyJuhK47am9RMfrMalWBJFR8ETxuzFEaOTA4avWj+bVxz1Krkdmi5TZH79NyYisHJJ9XityzarhThE06zx1q2N/J3tb836RrI5WS0GGCQCBqazQWb1oNUyZzNAU3txa45J7YdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtimNATIpobGLIb8w44jigc9xMoqmYKrIhxYJJQURHI=;
 b=K2hZsdLKWaz/L9Ghr61pwZ8YSxy1KlOv+T/SRHUtNKpTxe+NJJjuxwjn4FS+19cf7JiYj6EZx9rZ6c23BYXO55qQ+b81hVheevMa733U2ViPb9mY7wAnhmYl8S8TY/Wvdp45ho0WlKm7qNDs3RG9ZfRBfhfnzSEDaUEWmcmt+Gk=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5947.namprd02.prod.outlook.com (2603:10b6:5:17c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 16:44:02 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 16:44:02 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAATaQCAABfYgIADO7yAgAAGgPCAAA8RAIAAA4zl
Date: Thu, 10 Feb 2022 16:44:02 +0000
Message-ID: <1EC54279-220E-4043-AFBA-953D2CF5E54A@xilinx.com>
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
In-Reply-To: <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b74775d4-b321-4630-3059-08d9ecb48b64
x-ms-traffictypediagnostic: DM6PR02MB5947:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5947AA5A96795AB9589E3FECD72F9@DM6PR02MB5947.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IHAbY63XxucJyTV1t6GbrtLrSidmXB3ipW6S8m91c+THJBNmjuJYxd5cBZebcT+VUx8MApHXKwxv3NetTD+HWzGCQWSxr9ScryyBZ5hiza1lt7bdIjI1AhuMvX+kBnoClwXIJ4bYwEkVEufHfHFgOco80QuMI8w2hB2hXjtnHdvWSclALi3pQYjuiO0n2kbmX7sbiUm4+3hxN4wCId5iGs20onNwJKp99syGKGt8ILe6wbQgp8tJVDPyWlP5a36UxA9r+GPPIhyJyjv9Zor54NFOVlvhW9dtBenSp884AeKyPiYc58arTpulB3ZcLPM56fIkoV6Ujoz+Kcg2ig4g04yEdn3ehy9XiAE9S09UiH6b/Y0a9VZ1srMnZYwtFlvNdKD8WXCZtsFO/wWqMcZbALDTfsrwMKSW5wgIMldqKBebOMunrRJ5K1cpGaORM5/bGoLbonlg8gt3L7jmuFH7pGR1msXZTvt3HFsrfQ6dWJIYLRGJQfb+i21bzc50gk/g/CBpBHHaA/hLQ1gVX9I8FjLgXKBdwT44Ka90+zjJdLL+giXfSipiXRtHBgNc4YR4leIF0R7o7Lrjp+tfISegLn9wf5ljT3P4CRHFWAfqiNBDJ6Wi7CWHmSMU08ob4fXTAHMfvCEpwW5OrE//yL189sahWKC7wAPmz4IYpIxHm0jJziEYwlOPkPdWO0shjxPTkpJSLPAcAR2vGxXLqRFgg/jMJHtBtASoy0Qr+1NLGilgQj+pVdbEX9LU0Pg3szc4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(64756008)(66446008)(6506007)(71200400001)(508600001)(66476007)(8676002)(8936002)(36756003)(6512007)(316002)(33656002)(54906003)(4326008)(66556008)(26005)(66946007)(2906002)(76116006)(83380400001)(2616005)(38070700005)(86362001)(186003)(107886003)(6916009)(6486002)(122000001)(38100700002)(4744005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sde8YC+1A+2g4RTKKpe2/OO+mCuZFONr+3PAwOFyE3fLdm774SNzK/ugWheY?=
 =?us-ascii?Q?L2+c9w+dSypKc3gX/udES8AWwiz0i7s8YbtEVCty893SF+kIIWvb4HV6pdJa?=
 =?us-ascii?Q?8FbeQuaK0MaMY9NpxIBaFNdP39PYt0+vF562lmnHHr9xO/IzHvweg7+HJqXD?=
 =?us-ascii?Q?GROWVnARe8YQ2Lts74LmY6XJz+KRezkJcLo7e96fjBunSCFErC2V8L4nnPCV?=
 =?us-ascii?Q?CPHi1/XhVfy66KfCoqXi5dbNOdI+6EOYuljoMEjNeVgK/q5rak/MXSs8hgfT?=
 =?us-ascii?Q?f17r+Q8CfnowcNEDPgy9h+TiGNAtQwCIqs5vGq46oOmgJaiZh7mo070aUzKx?=
 =?us-ascii?Q?YMkAasEocft8q7r73Re33JBPprrZA9TH2SsfngIssZfjCYyo/eoBzsfRIexI?=
 =?us-ascii?Q?LQC7yeo2EnMeYk+g1EABncCEnDIZq8N2Mp2/bUig5jGGXoyZrr9Fbv1GrVaM?=
 =?us-ascii?Q?qOAqXvaahOAtbPDajPaYK8d4vUozOhHvvQWy061zRQOzGlALGsaDHXpJaVkW?=
 =?us-ascii?Q?1kqqhqozJP2f4Yc+sP+AAQ0MFeWhTNA6zTWq6RRXGYfJyYFGgeouVAx1hwqa?=
 =?us-ascii?Q?PejmoBzbs1Uy4T98r4cG7n6e54V0eNs9DTGdLYvVe2iiVjDm0W2Xm2ArBHVX?=
 =?us-ascii?Q?14aL/8sjUotD9KjEgSuXZVl/7aST1R7Laai8DV9+T76/XKflG+1fZwZEAnDb?=
 =?us-ascii?Q?wPdXNoZiE1j0t+DQK4VUEwmX+N4RKK4Legd9hxpHRvRScUCryj+MD1/cBVsX?=
 =?us-ascii?Q?GM5EchRHjRKCaNh3CTlXZCJTS4mYjKUkBPT4JDe8Q3gKskDmaylN2YT7bs/H?=
 =?us-ascii?Q?Ws7+YVifAPaz2QqZDoHvQxP1e3G1crEfthI6Tqk1MYwRRcYgrh+T3wbXgq+b?=
 =?us-ascii?Q?+kcH5b4iQ6phQa3lpnDLGwybJwRvED/XM7QwmaIFWHTzVtlLsD1pL1BHkG6+?=
 =?us-ascii?Q?QGEk89lJlTt51fApmKPZOkbKsXWpLe+fpIiTarViuv9rjaeoRxYb89eDIFPn?=
 =?us-ascii?Q?FYg7fj4cuiIRyKfG77Jy0xpnz5F1hjLVEa3MLwW6kbP/+7zXkSmtjBaG6L7v?=
 =?us-ascii?Q?y+8umbTYOi2HUJPK0eMfCH+6S6lbddaMFJXwJZOAS/jgsndtWONWOpgIsmHt?=
 =?us-ascii?Q?pPOSLaCJwAw+bN6mBIKveUG7akpDJHEXpIYSFH8iUzngnWj7/7tygqitNzxC?=
 =?us-ascii?Q?q9DLY96coFXK9mxvL4utnBAMnujE8MsSTEzbzQ1pO9KOzHFJBBxkcp+CY5Gk?=
 =?us-ascii?Q?duI0FHGp4ZBhuTHbTtVUUo6Ng2UuGA8RN2uWPH+LtTKQhPYbA2K/Vo3UsZfT?=
 =?us-ascii?Q?T3Y+1UFDDnpuy788AFBsE64ltH3QKJ0N+/wvywu+1dI+tXpMM5SjcXNQ71qp?=
 =?us-ascii?Q?5vb/9Kb1E1g/Pi9SYal2CaFNmyD1s7edgVM+HqPjcYgdiMTQDUY9KeknCfqT?=
 =?us-ascii?Q?J0VKoxDp9oeqwW9+1JEkxmqypufu0Fsn6GzLEAwuILqINOxR/Z8WKyu2nY48?=
 =?us-ascii?Q?lyyOV4pOllKm/nBqbLZvOK4QLkA3d0JciwqZESuWQvPNnKyAh+ELXa3nIrEl?=
 =?us-ascii?Q?2QcDaRjJ1ryVzJSijCDejnHezORm7Vnoep5irfxduW2Dv6/uTvoZ+Pi9H+lL?=
 =?us-ascii?Q?WEKwDreO0/j8kJah1rouiOs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74775d4-b321-4630-3059-08d9ecb48b64
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 16:44:02.5409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrR6eSDWjzRZo1oiVf631uGxUsF3nIrWrliYNNkPNf2SbYiMuKl/TTOEn+Yxm8c7F8nOQAZyhM3FoYO2Hc1k2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5947
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, Luca,

> 
> Neal, can you reply about this ^^^. At least, are USB1, ETH0/1/2, both
> SPIs, NAND, CAN0, VCU present on those 2 boards?

I confirm that the pm_cfg_obj.c file provided is correct for the ZCU102 and ZCU106 boards.  These boards use USB0 and ETH3 for these respective peripherals.  The peripherals disabled are not connected on either board.

To clarify things, I may send another patch with two separate pm_cfg_obj.c files including the board names in the file names.  One thing that is different is that the ZCU106 comes with silicon that supports the VCU whereas the ZCU102 does not.  So I could create a ZCU106 version of this file which enables the VCU.

I think this would be a good example by having two different boards with different pm_cfg_obj.c files, so developers know they will need to modify this file for their custom hardware.

Best regards,
Neal Frager 
Xilinx


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
