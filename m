Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937AC5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 05:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2192680C41;
	Tue, 10 Jun 2025 05:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZkEop3IBu_4; Tue, 10 Jun 2025 05:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C27080826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C27080826;
	Tue, 10 Jun 2025 05:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 467B6237
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 371CC60774
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odchieJ0gNSB for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 05:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::61e;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1601560619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1601560619
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1601560619
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngzge1PDvsw94N8sdrtCQ/opJORLOSK7/q52QNFUIXyP0Vk4fX1sGthUzzVNElxzW0YGzg/BAUsF7Fc5IkY9g4RQcSV80oEO/6S5ncatBxS8OGOPMQsBOL9dIYYFdFGxrdgX0cWMiQEvfkEn0IDuIj3gh5ROzau8cbHqqxWZYDoxe2Ckf1cydWQPGfn6LeEGWvzOeve9zl50542UuOsDg+/4Kk96/Xz1f5HXwFJSii7CQ+3qXiJDjp5HBPyaJSqJswHlMfS3w3hqkbATIKT08swrj3YLO1+YGRjHh8fHethSgQZYq+Ap+rSWyFoY7tYviA36t1qtQAtX2iuLhpbRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3XpxCm7PvGjlkKSQpCXdcaL8ZryNYTl1Lef2WJ3Lzs=;
 b=giXcwEM6rRIHahB4PzRq9KhgeKb1SNTebhn+nhLV7cIl8Rbzxa9AIsZzWJPPPbhzXVRAHsXhy0FhzHXgqi/1l1u5MOowv3LEkEPK0Q5nT4UzoTfgp2yYgTJ5OW86c50lAGFrk+a3yPnDrNFV0Dwi4c6gJLo/qwSYgep64M0/e6IEDq39zXBc4BieEqYCDy3kRZWGhk4xUk1s1bi3HXnOwLXTDBBk31wphIXCn0i6SRM9QYV6055vNcDacC+3QWwOuCLH/VkdllLJvkdtFQmfU7dqAJ1ANFUdwoYlSjxztyY9fI/m9LVnv5GZGVzrU7Gd4XiYMcqpJFHJdFDiCm473A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Tue, 10 Jun 2025 05:57:30 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 05:57:30 +0000
To: Julien Olivain <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>, 
 "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support for
 xilinx_v2025.1
Thread-Index: AQHb1d17/RoIx/yLCEit50h80i1Fk7P7a4+AgACAVnA=
Date: Tue, 10 Jun 2025 05:57:29 +0000
Message-ID: <SA1PR12MB56153CE78D06255C22A29513F06AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
 <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
In-Reply-To: <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0c575883-4edf-4e79-80ea-faffc1a5bae6;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-10T05:52:13Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM4PR12MB6542:EE_
x-ms-office365-filtering-correlation-id: c970a3a9-219d-490f-13bb-08dda7e3af7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TgGdDOyuq9HD6MtWxZ6oooHQttJjI5vXVh9wzbdiNLtqWP2cgRn3k+gzhK8W?=
 =?us-ascii?Q?NldWHfenRPAfp8MH1E7ekxBxxy6spCdLVjI9Davouf6glppMdZY+9qB5Smi2?=
 =?us-ascii?Q?w7ZFf57+DTpJTwTJ41ibjoNAjqI10fdNRRvCDr2DvScIlPZn5xqGuSHCjLRO?=
 =?us-ascii?Q?nhaybAMXSPmUOr7IxXygPT29sp/ftrPUsrRDkXbzRnxNgYztBXsrbBk30AO/?=
 =?us-ascii?Q?WT4XNNjTQ9C7E5hDHYZ/VseznKDMK6NL4mauFEmxUdVhQ86u21ebaiGUwbEy?=
 =?us-ascii?Q?ACzfrHas1+vE4VJlExQ5QCRt9YYlGmfK/cxR5yGE6P7vV6v/sXvDuCXvaGRY?=
 =?us-ascii?Q?g0c/pjSENoQplNvFdHmdfL5z0p4PBq3nAdrKq7bqeNcS+Sc/e5pQfxlcNOJn?=
 =?us-ascii?Q?EaC/l7zo6x+05UmY4tKTlaDOw2v+bhwQ2IQs6X73T2Ul8XojUxb1eWxTx+uE?=
 =?us-ascii?Q?ecIr3i9WDYSFhictdQbFjvfbXlFjC7P2LKt8DWob1skQE4CRx0HtwuwuBccW?=
 =?us-ascii?Q?cs1o4//jyG6llSlGvbyASXwnDbY+D3ZqQX4RhmCLC6gq92mVyc2qNalrrLKz?=
 =?us-ascii?Q?j1YjX2T3GhghiVflafT1O74plAMtOcvsq9nfRaOQbL/qVLEa8NZyb6Kyb/O9?=
 =?us-ascii?Q?8O9Qxu/IU1SvHSMcxkwiUe6MlkFl33bsSaD5VOLR+TvGd76+ApFxBEWQLFeZ?=
 =?us-ascii?Q?PT5kju/ooiK6UvGao3ES8Da3MRuFIRFFmuD69h47TdFXa5KFNBfTVhPuklJ6?=
 =?us-ascii?Q?Gy0mz7NhoGZi+Pfeg1VAMrtRaYOpBVHg4RLrB6DbTze2pVVtj/gIGUZLareo?=
 =?us-ascii?Q?57botQy4c+W7LZK3EwemNN/0uNu86yW2nGi6nTURuDrTjWASaMdG0VA3H8qV?=
 =?us-ascii?Q?2juLTSJtLaGq0zAF3FUmEEFrx8s/OP7BcteJPLRF3FqJJVC8W0VPAXrkJvOU?=
 =?us-ascii?Q?TRO+8+Y4c986DVK3y19hh2SOLJtfzVeFGEOxTpFUsE3g5RFdubRjN/mwKX6B?=
 =?us-ascii?Q?VWofgXSspWO96c4lQfI8HV+GyzAiFhqwVUwV4L7Sa+DfoeUef1z/Cm8YdXg5?=
 =?us-ascii?Q?noiQ3LywD/jHOp7+f5lW7LUrZ7RLyPKWp9NG1y8ZN4JsjbMEXCIe/xSIfGR/?=
 =?us-ascii?Q?5SID6uuJ0/D+pAp66geBEJ/rZizH8+ZcJBlf+XZ34MHbf4KntCpBvYUK3Wig?=
 =?us-ascii?Q?WziY1oqb6BbVwVpRckv1apPJ3y3j/vE5U08fH0KhOOKR14T/zx+5Vufb9bYG?=
 =?us-ascii?Q?+wgqSM3BoohxRlCW0MtUqxwjjv0VIpR8QxnryMKnGR+J6j47E4iJ5I5NVDAL?=
 =?us-ascii?Q?NAcW8T0qRmTipVZW9rRR5R5OI2lEEE8Ckh3O5fjxiEAbSZcb2ltZnQU+xL5K?=
 =?us-ascii?Q?ioS4BXspKWT8SjIValiWyrHL/NWRMiIEDiIpkpHWVvyDcK7B3SWtx6i5nQYO?=
 =?us-ascii?Q?8gROoZVb/cQMsqRJ5eK2sWLY2GiX4Jnr99OO7SLkFp4g9L80ylD/YA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BzovRhu48lFfbRzphbAzxLEKsYgMS04bQKtoQv4zIvUq401X7YnZm7ToZJPt?=
 =?us-ascii?Q?Dva6E0PYQLXng/3AKgmSKQY5fFKA97wCR+ak1ksipVx/CePf39Jgk+DHSToW?=
 =?us-ascii?Q?zV5lHhBhPfS1nm13BUT/C7Q38axH4BYlwBG8Amgfub0JFZTOAXH5GFbajF94?=
 =?us-ascii?Q?obpqXrdcudpmdGb4e5AjH2IiJ3iNEeoi/q7nDQIu+k09TYcxbjdCKS1x0Qvo?=
 =?us-ascii?Q?o0x4peoET9S8sLGE8nQrdj4qXZRv+l1lV0Cb3XQ4VJ5M10/miUZucfmmfI7S?=
 =?us-ascii?Q?2Le7t6+HHh9jEiZbWZrQCgBuBy3SogUAIm0Lub1PZ9zNIJ5t1j6XomNRVH6H?=
 =?us-ascii?Q?/kcS3nczYw6knmO64SFOj7CjwrrdVabw+6JjM9lcw0Ec9wXOLOXLbaRR+oZ2?=
 =?us-ascii?Q?qE8OWKcoqKo9HIGeh3uJ4V55VClegtgpokJlLanJF1dXMwsMsukwIBTdsTYd?=
 =?us-ascii?Q?vxu7oYGma5ZDjb4th66Zf6aWvZIJHe1tbtRSC49JEalx+blwr/pqyMynNmmF?=
 =?us-ascii?Q?Mrh+/TYvCA/AXeYJtvdLVj3SRVbUg5aYcwj1elLmF7bCsuLYfUuIxlQaZtRS?=
 =?us-ascii?Q?cHLcCcWN2Zzv/cHSgSeTODNYkRrXIq6qXv/nyNYLUp2hOJrZuHvVXCZnz8l6?=
 =?us-ascii?Q?tt7azOuVp4O69HPP/x/UC4qI8xMunV2hU5kvMqqde2UC9u20WJBLMz7ePLd7?=
 =?us-ascii?Q?j54qvvV663lYhbOr4K8YkP8IIqYEfaGlcJR/8SygOMcmIvnF6NFGth7n0X2W?=
 =?us-ascii?Q?YS5XcsuUbDFp/uSqkuyOtddW7Vbcsxa1izzWYHahW8myiVNrfw25tiSNtsZR?=
 =?us-ascii?Q?xbj1i79QisHKAG69+WiN33lAZgq5eGqGiVZ7h+sunI/9Q35OQ5E+trTCTGPM?=
 =?us-ascii?Q?9sKQRoZYQXBVA6gwQfarJMX8g7xd2DXpoXtJgQfXamLrQO1gugijbKDkqTL8?=
 =?us-ascii?Q?Bvl6tGf/K7QRHT+zx1AB+jcwWqtGKQwdc5oUtoot/nilFwgWqSzw3K4Fpueu?=
 =?us-ascii?Q?Py3v5Q2rQJM2GQRGl5Suuuwvd0zDBKrBZL1IOVaDAduWSh3C/d2e9c/umOF9?=
 =?us-ascii?Q?mXfAt+zSk32SAzWuxG1OFxyGqEDlNJ9rTGqQLYhA3WrVrWMUvVFGuwGBb2q+?=
 =?us-ascii?Q?gnLD1b1kPsZFV9VXO8RMUhSy14fA2yS5WPl333A0NW0cJ4ArdO8kq8ovXITq?=
 =?us-ascii?Q?vzLuo0fz5MZATBxPf8f5Yq0lGZMdijXc54GDhjzHpRLlFuIB6J1t8LsOYz/u?=
 =?us-ascii?Q?pB6WxJgIp+PRRegDWp9MwEkRidmgyuKdveFrbC5STMXqdpKQ5NNmXPiWafWj?=
 =?us-ascii?Q?NPwiYjCTjqkb+ThqbKXW/6TpTK55IPaOo4vvdUHECKs0oDv+Q6P0Iyvki4A4?=
 =?us-ascii?Q?buGDSEmnjITQPGx4djX69x2CClaRxsqH39Hs8Zlk/G7b6EHgQ9T3ipoM+Z/H?=
 =?us-ascii?Q?6SpOUxnC2dhFIRH8KHCZVxKgdYrOJwvHu9axO3E8A5DpYiqHwk0f/3KOkz8U?=
 =?us-ascii?Q?sfRClkyhoRpNNUfPDqTWwigjuEExsTArp9M4+MOTcM2ddtWNqyjaMHv4p6Nh?=
 =?us-ascii?Q?taCwu+0Qgscja89h5XY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c970a3a9-219d-490f-13bb-08dda7e3af7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 05:57:29.9812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16wjEDjcc9riv2OQFdZZUgWDU3lRw+XKIpc84+ue+t9jGII2WxHQEjgDpeTF7FC1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3XpxCm7PvGjlkKSQpCXdcaL8ZryNYTl1Lef2WJ3Lzs=;
 b=xJjwe5WOovHAUTs9CFeLkk/GW8y7/eu8bGTo6QUjrD3tIwE2HhIgsyTIrE5wnD4P5xGw8XJAMsKIJ+udijmPJoUGi7BKeS9Y1XwWrfgd45G8IaCdWSuiRxfAAT2k/FLEfqOIi7Xa5uVBisedYL5brpp0ZxiV/1MnvV3nS7Vw0Bg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xJjwe5WO
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

Hi Julien, Thomas,

--- snip ---

> Also, as a comment for future defconfig maintenance, we are trying to
> move the defconfigs to use a stable Bootlin external toolchain. See
> for example the commit:
> https://gitlab.com/buildroot.org/buildroot/-/commit/310ab7d53393288aba5c574c49a6cae1bf1e1a1d

I see that the Linux headers config is removed when migrating the rasberrypi
defconfigs from the buildroot toolchain to the bootlin toolchain.  I get that
glibc is already built, so the Linux headers are not needed for glibc, but
what about user space applications?  Do we really want to remove Linux headers
from the defconfigs?

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

I am wondering whether or not to keep Linux headers with the Xilinx defconfigs,
so I would appreciate your input.

Thanks!

> So it would nice to do this switch during one of the next updates,
> to make sure this change is runtime tested.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
