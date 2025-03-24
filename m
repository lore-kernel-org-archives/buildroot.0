Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B384C36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1921860B69;
	Mon, 24 Mar 2025 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaWzVg8njthj; Mon, 24 Mar 2025 12:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5214B60BBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5214B60BBF;
	Mon, 24 Mar 2025 12:15:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D50A5E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639F140BB8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcJH-87wRSSC for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 12:15:20 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::61e;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ADDB40918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ADDB40918
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on061e.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::61e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ADDB40918
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ATnBdMKo5ibAySW42YCv1v1S1o/LACqlRKb3ESjDzW/emn/22neC2KtARDdTU5Q3TgoGer4tVJH167zSoD86fgzROxhedr8eJ2XjJIzZKm7BVZAB+r05WgQtqDxWrtK/p39dIxGEss/d/4p8VU0gijAaLervVkVXhLf5mTpoBnsn0ln4vRy8Ug09niFLb2WHliosiHZ6YSfBPokaczdlyYOB8mFFXcHYKUQqFwaab2BTlHQZuo7pONAoc4r2Gu7gAwRIj7vft6fpdigLuoKvONg7GtGclVgA/sQlAyndaX48/iNoqTrpF3xiknPGXJ+96eBiLAWBOvDtoe2evpIk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChV1XPJzfrSLp91oCPmFxwCH5OTGEd3aFGNHHBnPpDQ=;
 b=sCtnBHePMpw+lWJNPPJdWnu9G3SXrdf8XB82rA2/T2IMUVmY3bfUok6jET+dqx0FlvrAWnYmP5faYrY1dNz5GiIbfO+Bh0jd6AiJ227EGEhSAVHIff6ay2+uDjuiKJJDRW/acIXWmTAeEtCwkKDSibHP3JFzP8Oagzw4yj6quUV6p3vYaU+ExuzZ71tcctBUWEbNHB5Ewx19gCYlG1qSub+yQnsgCqhRIXE0UmHCg9a6bAgGwzYnvQRipWq2a4IQOYz1B73wlcxX/y0mMBJfhIhpbB5SMYim2giTnID5Y4wPRQYZmepUZoccsOvJdnde0YR5g6CTM2spQw37lPDc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB1830.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 24 Mar
 2025 11:59:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8511.031; Mon, 24 Mar 2025
 11:59:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [autobuild.buildroot.org] Daily results
 for 2025-03-23
Thread-Index: AQHbnHPbn1adMOeMZ02o+HgoWjD/WrOCLjhA
Date: Mon, 24 Mar 2025 11:59:38 +0000
Message-ID: <PH1P110MB1603CBAE9E8E8AA1AF2696549FA4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <67e0dc6c.170a0220.1828d0.2f03@mx.google.com>
In-Reply-To: <67e0dc6c.170a0220.1828d0.2f03@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB1830:EE_
x-ms-office365-filtering-correlation-id: 3c99afc6-158c-4bbb-e3e2-08dd6acb5a96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iiG6K0tUJ1ix7zRvL6ZBDXuCOGskomCmrjVNVpWR6wE759z7s/LD56MGUfbY?=
 =?us-ascii?Q?XwwR4Vwc7CB9qQ1DvB9misxLPi40vNAB/VFyF63bffnzOmGO/rOICCBcW6do?=
 =?us-ascii?Q?igwQpA3OrQyBisj/HxoSue1n8CbYvJkddnWCROmOfJjIyoZOZlg8266cQDXY?=
 =?us-ascii?Q?V3jyO3u2HL4rMCSc4AFE6F2zBldmDN2AEb4se6rDBT0mdbpT2A3DhWIJpnGd?=
 =?us-ascii?Q?ZXHZ/xJomEU/rucIgh4D/6iuCGyWbjS9Q8H60p9CWlqyyAqxE6Z4xO99zALs?=
 =?us-ascii?Q?LGSQ2MTkGtnPeSQcuhUkfW+w9R+91rQwg6wsxU0YDaZDXXi7Z4F1DPjaXqu+?=
 =?us-ascii?Q?neLWIiD2KR/353s1D/QZ/5RiJe/V012oFvBuHyo+dnQEYolbB/EZRW47Yrsg?=
 =?us-ascii?Q?ICnAygFM/T1JEYgd686PspbhkMtcrIB9juuvqTARpKkWtdfo0zlN0qlQvpui?=
 =?us-ascii?Q?EDM6nkLX67s5mvXOJGYGVoU2B7RjDrfqH3KAqnNiUv1ToLEQ7DQHXYCNGLkA?=
 =?us-ascii?Q?88NkK/P60P572rWtGjmJ4yOdvCsVHHhNdRKh4WtnBh+Hpj/toZp7Yx3iiceR?=
 =?us-ascii?Q?aetX9AWpRaExCz3d8nI7jlg5S1Ut7by5cQf65xoEt9LdzwwX7H78lsjJYEDh?=
 =?us-ascii?Q?7SOH16KYW7lEZk0mOC7JnN2+mMfNXeP1NgNNPYZzgDxbz4tEGzd459M/zv9j?=
 =?us-ascii?Q?VD4tg5A6baFpPjk22GinBy9xvZT7PyfXyjGTPH1gxR8m7S3kYBS6JYNvw94x?=
 =?us-ascii?Q?cEyZF9RbSN6IxEvtz9NMd1qxxnbEsTQ4mXeiW7bV25EN8jyk4e1C9rvD+q8P?=
 =?us-ascii?Q?Pj2bBBC1wiOF/q03IcwjcNik+SrrHXQ29/CMi25m+LDMpBpwL7zZuqB3+1pF?=
 =?us-ascii?Q?0A9dkwGdIfwnneWdWFRtTZXB7rZloa6OyOR28I2iLeaYaSo+shSSNeBd6Yuw?=
 =?us-ascii?Q?MUikVugz/WmJZecMvihA4Ic/5eW8epsQSU4DgV+degsnWUkxkqp1LEAXFD0H?=
 =?us-ascii?Q?DThhF4L4kJlLMzAxbYfTY55FRq7WMW66vnsypLEfiuaM3xLNy+241FKjD3wB?=
 =?us-ascii?Q?GNznVvSEpbZO1mWJrvLmtfRPv3V0y8Tjx2W3gIxudzxjN+l7LisGgdwTzUMH?=
 =?us-ascii?Q?OA4nocbhU9ku28f6sfMsOrVxhcCcZ+328n9eXY/fZp4k6uc8L7kzCizVRO/d?=
 =?us-ascii?Q?7GwmdIe5Q+H7XVbMK+qR0Cs0h/CAg8tJ9jzgWTU826sAyTWUieT50tUR6aT4?=
 =?us-ascii?Q?r/ua1y6aPzfrQGm8dxTEMvDTacbFOc7lR93+C+71GRMUBCYSGzJesqhwasqA?=
 =?us-ascii?Q?GQCSbe2HIqAzk+iRxTx/K3NU03A/G7v1EdqmvcBKPej8bcreXZhsgB+33hlo?=
 =?us-ascii?Q?TGyAOiwFtFqyz+plQGc6dLWDipcy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GW74q379LL0TI+4y9wguo3ZnPYQDubNso5Ws/5qnbrXK/Q2/wsDUbEuX0KvD?=
 =?us-ascii?Q?NketS2gt40YpqpgD5bLvoDVXui1U6PsxzvfuVke0Kdrg1ZoOOAHOzccnb7UD?=
 =?us-ascii?Q?5x7yV/smVGIYENt5+qktyLYu6IPrqCrxxgsJNYIBoPYeGCguimZpVFPRqwcZ?=
 =?us-ascii?Q?YOsa1aRRbdqVRkAQxqXSxpn5/e9jRWHK5fGrf5XgLb5i2iCDBWAhQpcOCCoR?=
 =?us-ascii?Q?n1u+xLVxt1xx+zoFWS+MO4WKWB1P0pQFeYUqCerlHuQtZV439YwZmbJ6DEcO?=
 =?us-ascii?Q?DLZ3tmQDe8nktPnilhLuq3O/f7wkWptxwUW5ib4Htu5ENNPwyuVZBrfBS7bd?=
 =?us-ascii?Q?EpE/DeXySCthfaUSju9Y65DLxlEvwFpiZE/4Zvwl5gP6usSQOc8BbLHGUdvp?=
 =?us-ascii?Q?+YWomIlKWBtUYAYt60yW+/W8esRbFkNcNDNQ9Gv9m0Tlu6sFs9O1FNyNB4hD?=
 =?us-ascii?Q?9E5JLeUfH+mxH4VGx5lsPCvuhLEp5LUwqF6AKJ01iQnnAcbpl02vbdGgcjIm?=
 =?us-ascii?Q?enoPbcg5BAf0I4kGXpvdWMwb7zwo+p4ywhMODKBB1pqNtYXfmFTQkhi6aM9x?=
 =?us-ascii?Q?SmJm2D+CIvYSAd0K1OERIvGf4j1m1B4EBkB9S+8CTPcuHZ3mMfyAleTrPABJ?=
 =?us-ascii?Q?6m06Y5wnbd9XtIL7+FLLeDwh/W5AWhyy+ShWjbP3Qs33+dzzUfdpbp76+/ug?=
 =?us-ascii?Q?96BlPkhyP0xP/K9LGK2jl65WIHRefNseQWPaRpub6TxWqRVi3Jkf4Nzt5cDu?=
 =?us-ascii?Q?kDLix6eJQxJFeuPR90f4R+5KtHI6CKicWDkScBjVaK9kE1jLjzH5KjF1o0mB?=
 =?us-ascii?Q?ndhC2noP+UafXi9OPLAVBqamVAVtOUnXio+70eOc7XtRTExr71aJTj+5r8WL?=
 =?us-ascii?Q?xmyAOt3nkP/MO7g5aRISitwB9ZkoQa8Fs2D0sWhf4XKr2cALAC7PCoWiEc7e?=
 =?us-ascii?Q?okUBcIC+GPlrcZc+wD+vjzn+MW7aYqP6BVOlAjDpgFr+gdCuC9BZH0p4hb5P?=
 =?us-ascii?Q?Y05hCmgUcAUYVIX5+J4upLpn5Q1tmRVksBMLhGrZqtv9kGUvIMwwgKFMEWw4?=
 =?us-ascii?Q?wZn85ztlqgyxmU7254jYfZbjnZYoKkz/EEAXhZ/57lUDFYaMNok5Vb/i1MYQ?=
 =?us-ascii?Q?+rgZtM09no2dqpjjuEwdGYh2HZtZNRSJBZIR4rfVSGq1z+zKGCNdJdGWEiNu?=
 =?us-ascii?Q?LxBB7tA26ik/8KjjtxVHt9pNzMInuPVU2ga/KC+j4PwSswO0IYu4Yrlob2KI?=
 =?us-ascii?Q?BqUq0URCDySK0lWjyoQqaJmq/rH0TPpeZe6RZ4i9g05yh3vPaVmA7VZoeQu4?=
 =?us-ascii?Q?N7UNhFYUpBbdk+DZ8uduT5LwR0L2uYRqm6ouKT5I1Vco4gvCrJRtwJYu4p8a?=
 =?us-ascii?Q?RXLXwvHHbgVARdc4d8We2pcVlz5S/b5uDX2hN0czVrRnd+glGxf9tUjXnU0f?=
 =?us-ascii?Q?lYRUtC66lcFjQ8qaSTp4a4EVN9WLxQPIRFPDGboMLIlIfsUbxfQog7G94+3q?=
 =?us-ascii?Q?o1Y6GmiM40KuNQ4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c99afc6-158c-4bbb-e3e2-08dd6acb5a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 11:59:38.6958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1830
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChV1XPJzfrSLp91oCPmFxwCH5OTGEd3aFGNHHBnPpDQ=;
 b=GTIKpPwCxHlss6gjJ/iDOTXhWla5cBnPnNpA5FTV6jw2g3k630uZyFxHkKdUPNPXfm3XNRyQ5BLr67vWvlvqUGtqYJLPa7/LqFFCEtU/cpzSERMynwxyB1XsRk29JVamvV3axC+1BQ4UU+Z9dhrBJM+2wGjR6gBigG3pAIat3JriJBpkotcLONF7h8GscNgRX2HbgbNo4jMxvTn2phACb9UHxVAi86ITz3GaqrQwnKRXb5MRq2jBf7l2Hm0TnpUyYRHaGQ04CdvSBPSg1LspNMDM74HShudlJBoYxU9dQPB2ojH5SF+9DUkDXLhgPaVlPEO2ZiwVATJQsuCxaqbL9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=GTIKpPwC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [autobuild.buildroot.org] Daily
 results for 2025-03-23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of
> Buildroot Notifications
> Sent: Sunday, March 23, 2025 11:16 PM
> To: buildroot@buildroot.org
> Subject: [External] - [Buildroot] [autobuild.buildroot.org] Daily
> results for 2025-03-23
> 
> Hello,
> 
> Autobuild statistics for 2025-03-23
>    sh4aeb    |         python3-3.13.2         | NOK |
> https://autobuild.buildroot.org/results/443e34cfb49b53fe6d114bed62221
> d009ad984da |
>    armeb     |         python3-3.13.2         | NOK |
> https://autobuild.buildroot.org/results/0bc6586b21bd57f412109db3f3584
> 949334022e4 |
>     sh4      |         python3-3.13.2         | NOK |
> https://autobuild.buildroot.org/results/a757a42661d5efecaa91a8cc03a36
> 7e32f1d9483 |

I'm not sure what's going on with the sh4 builds, but I also haven't had a lot of time to look into it. It may be reasonable to disable that architecture for the time being.

The armbe builds I wrote an issue for here: https://github.com/microsoft/mimalloc/issues/1046

Whatever is decided will need to be backported to CPython. I can fix the immediate issue by using the standard ACLE predefined macro if that's what we want to do in the interim.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
