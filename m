Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C841E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 13:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC116087F;
	Thu,  2 Jan 2025 13:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wlgYpSwnm_9; Thu,  2 Jan 2025 13:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF6D60880
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF6D60880;
	Thu,  2 Jan 2025 13:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13426F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E23680D08
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxZ2BFIAOEKG for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 13:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::601;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 959A680D04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959A680D04
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 959A680D04
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:58:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsAoO1wXmVzn2jLjm2hlL8RcRK39Wa4LjF8YvpeGSNv8n9ZmJIKvCxWefb8AXCNdm1i2+s13Iom4/IWc4mPD4/vrU1hO3SB5RNc+5u5dbI/X+5duisUi1XzhpBzPPQlEIdb+hI/A4rZrblLWqNbMStIVHtZxcHaZwrGMEgdW9BWE0wTy9ZK8TXk6KXAiIDFCFwmzk/HtxhkRrXxdJt2tu1qoFFz2WdYzN7B+Ygvyp0IRVDCqEkmfrkjQs8n1C+ygreBrN41NOyS9r6IArB0rNSa4a/N87GV1kMIXEEI8Wcta0dLzlchxY2Z3qEfQsMBVLRP3v86ZHr62+QwpcZf7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD7ZRATrY/C0e6qZ5B1Q0DvhFrm7eoDZoOw3TO9pEAI=;
 b=xVUSCmBg2rREokc0REIXL8/VyXL9wCeql58Tp54yu2b5usspQgOS5zrQhySV12ZkDGyJ28rsiHnXhTdjJBT3bqrhUqBnrbT5BX8C5d+IZWZ2fo+zTSbi7Hv6o3dLc33cw7YzNg0AVQD7ZoYR9LengleAttP9vddnkLZtQPMN+5k69PXwpIXbgFbRw/YRT2Wj8HI6DFrx7n3S85jk2Teaw/JTWsNgOFXHgu8pSSSPXS3nC/TUxhD0B4G2aJb8y5WVHyVfhu0dOFf19gphFkIjaOAGp4LFT7ZlbeUjekQm050yeH+LHjMNjhfu/Ou8l1Gg2v+OGJMABbTRIvFYEqL1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Thu, 2 Jan
 2025 13:58:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:58:08 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 6/7] board/zynqmp: add new qspi.bin binary to images
Thread-Index: AQHbUsr0Dr7PDGJmR0WOI523dEb3ybL1dOiAgAZJ5TCAB9XsAIAAAR9o
Date: Thu, 2 Jan 2025 13:58:08 +0000
Message-ID: <CH2PR12MB5004012DF0B588E1BE6EE7D3F0142@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
 <20241220103523.2301721-6-neal.frager@amd.com>
 <20241224150803.5813f481@booty>
 <CH2PR12MB5004080E8484A3744AEE994CF00F2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20250102144934.1f27883a@booty>
In-Reply-To: <20250102144934.1f27883a@booty>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8354:EE_
x-ms-office365-filtering-correlation-id: 20800be3-4431-4178-34fa-08dd2b357cfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|8096899003|38070700018|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?hAh+ocljI99xVBETDeGPImbSkOjthI+KtqTjUFlXV4XPmOhJjUPumtiy+FMo?=
 =?us-ascii?Q?ILSJschv/JotGk6vO5aYPzRa7S6TKcmgX23D8128hNeiZ8uNd1giYe/Xa+g5?=
 =?us-ascii?Q?5xaZDgAZNYgUkMcooB8aKYxepC/VdOIlxZmYKxWZKGY4SSEdtKCNFFfOfSMr?=
 =?us-ascii?Q?L/ja8gIwHEoKsatir2M4rEX8QmwYBYbS6gzuP+ZKidSYNdrjDxW097unl2DA?=
 =?us-ascii?Q?x1kzRb1IR95ogS6Sbm7qxbdKda1WFysxwyEap98U/3neHt6jGyeNkN5tLhjj?=
 =?us-ascii?Q?8poAHnCwNPghWt//wBxJfudEGI7eoIJnk5bLUr1fy81EPUlD7cS/z+HZIaMB?=
 =?us-ascii?Q?dCHILj2zxWCgYsTon7KZP6RY1c8gzc3VnTVw62rNw483j1yoZcVOM3GU7MH+?=
 =?us-ascii?Q?dueE08AnImQMye0zVXMNwUUkZrkrGMthpcnnyjyxAUdK18Icj1Qolal8EdM2?=
 =?us-ascii?Q?SiVEjEcMlyxEIcQ9/jQzrwbwvjxLi0r9VHq86kWucS+AQIybyGZmxoqBiMID?=
 =?us-ascii?Q?zsYMMG9IPmaJNUIdY2VMhuYai8SYwTzCYSUqXDsLCfWhZhCfJqGHUvoguqiI?=
 =?us-ascii?Q?7H+soJwoix1fhbxorGriIWKId2YqDb0x6jBDdToWnOwa6zIsvGB/rn/3wv4k?=
 =?us-ascii?Q?9euurPEEW8m79dmWPFndnnZf+S1ulJfsMVBy+GdhIIeb81Fyp0YxXQim4CZg?=
 =?us-ascii?Q?xB5xzQY0qZ+DsxSk5SA73O2o9d0H47N/IbK9tpAFOmw5syrbGjlocW9nRMJ5?=
 =?us-ascii?Q?PGBkhXcgOrUMSa0ehtGj2iWgimQcLCt5z75/lYfZngNoM2lMzReUql6lQ1C6?=
 =?us-ascii?Q?5qf8wZ2oUTuu1QdrxNCF9QW3GN2ScdLtuq2EjnR5p31+ksB1iIJTc0L44hDG?=
 =?us-ascii?Q?P1gXgUx7gx5LvRi895ORjgeqiEiK0uqBUczwQaHcJTovz8PlQTCx7ONlFlKb?=
 =?us-ascii?Q?+yCtfKo6RVArRp9YDRfEmS1+6pGHEqM89LRJh/1NHa6zFef6en8Hg/8brFV2?=
 =?us-ascii?Q?+CMXyVQbA/1WBvqBXhMKlAJuQt7DKi4fwfYRIexwghSYn6QAXF6644VEWdp2?=
 =?us-ascii?Q?jeMhoiyCj08ErvwA7I206sbgn8iwh/2umlJm8G380PR/0EbaNb9M1kk+ipNn?=
 =?us-ascii?Q?2gTAZIqOl3Mj0vc8QLQmfTBkYJE4alhIYQ0ZGOoAgDbmz+tUInsgqFuWI5LJ?=
 =?us-ascii?Q?hqjD6vjrQ2WEh8zIMOeDRNi+2hy7mfu3/U4vsY738PRni5Y/TOHJtbMgE0m1?=
 =?us-ascii?Q?po7JJnEswTLp1Qkzzfv159hAleWL867pnK4w7kMK6+vX/QPtYZsxP8MWJ1H6?=
 =?us-ascii?Q?MXzoT2uOrABiN6/efgwkoy7oGXiaMfLgNWeNIPFBv42y2+xXOtcoSicwRnAa?=
 =?us-ascii?Q?AV6Z80yaZdlj20CbNQrFX0JbWNRCYM2qKPp679qQwrAcLp45U6lrQOV3WPoz?=
 =?us-ascii?Q?iqVg9q9t+zHLCxvZBCVzuxGoZ3mk+Oxgh5+BAI4+t0ZflFtwJMGTQEXTIKC7?=
 =?us-ascii?Q?h4dQTiwO4ZRMA7M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(8096899003)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L0OEqDDh0qz1qfvyaUXC2IV8g3sUeSVt1foi65/AbiA2/Xhg2Mr/+u5oaF1k?=
 =?us-ascii?Q?kiwjC1MTcFo/0Z+oANi+CiHuiGtmzxpvAwz9OD3oM9Cfr2kYgrd63gte45cE?=
 =?us-ascii?Q?d/KnsJe7+OenkqWhS9fcKBijUASSs6X5giYhoVH25iFbrFxBK7qMOUj1Mq+H?=
 =?us-ascii?Q?X7K5qJJCb+m/fhW0p/s2hsxXEML6vgjhH0TQPavONos/nH9zg0QN/ogC+LFm?=
 =?us-ascii?Q?D2kGgng9JfMvmzQQ1ZqSEQhhKNHN0gLj1SXtFK19zXqLm2G2hhxBrOQ0/hDw?=
 =?us-ascii?Q?zBkvbblDjvTl0GxamNBZYLIqDaI6AByLon9oGJ+306//5IXIMYZMD/1uavPj?=
 =?us-ascii?Q?wEJK07hlOBCr4ijn96RZW6/wpIAzWnYBpN2532Cs8ZKqrqfmCgxlT+50ctR6?=
 =?us-ascii?Q?rBEK11Cayz8CwCpebOczexM5RIClnN/pAFEhpkT3gevtfXDgSpQdV+ushV+X?=
 =?us-ascii?Q?aXiKgbsIpPYknC4a+ZfC4XPrEzlLmVbi+mhaO2P09qJeSqbHcLz3VoIXlfZd?=
 =?us-ascii?Q?lJSdElWEJYbTh9D97k1g4A/WEZvqltbzBXuiDw0Tu89RSQvNLMGv2C1yPTSn?=
 =?us-ascii?Q?dgF0/Kgh+OhN5aFgQOFxvHxLu5LW7asCGrEbv75bVND66607VZBcpD25f+LZ?=
 =?us-ascii?Q?CswORNc6l/SkeRgGY4jcFvqOesGVf15i7Wi6lK6M/kpOy4d8mKvHZKz8am/3?=
 =?us-ascii?Q?i/XsXPeISz4yhpndr7tjQTHuoueUYTyiWhDEevplc5IdMSnak3f31Xyu1w0U?=
 =?us-ascii?Q?0jfhysmkxq7Ii9noe5+iMXx7jh+g1L9F0SufY0QNeWmz+En8hadjOyA4pH9z?=
 =?us-ascii?Q?5UzToYng2Q/y6NDAPeKfnLBp8ddBn1nC+C+7us/QStvEqmAuyE2keCb2hSI5?=
 =?us-ascii?Q?aMODyyLjrNoWIl2ZXEz/MofU4RlV90p8zGyoRl7BaOFv4cfGdLeVw7Mv3H7G?=
 =?us-ascii?Q?3YnTb5SdqOe+0+P5P/Ps20xKjjNQGS+sR7MpXt/6+gmP5p/Lfa97EKOmOeqU?=
 =?us-ascii?Q?GQ6JVR/QP6sSJABIPlHW5W2oucxanOf2NtbDigWhN4z4Cihst1stVqCMX12/?=
 =?us-ascii?Q?Qmx4v1ZcFleNvQPhOWapAdu5eFwdwMYIbH7GD+d8jBFIYwUyP3/D8zs29VBc?=
 =?us-ascii?Q?id3Ojzf1d6Z4LxPdPMcm8+304sPsRUXeh9fM8OmY0u6c8rPXIYhbM6iDelQ0?=
 =?us-ascii?Q?Pe7mPrK+meC+W6c9ImCwsVWzeVmox0/XNBpZCfpBfeMcZqcwSIwgPsUbfHOr?=
 =?us-ascii?Q?2QSyDFrZCD7uifb4kqib7aBYYUbt/6LLQXW73TD+QvCaCXCxAfKxBLuw+wGA?=
 =?us-ascii?Q?PnSg5/seBL/ij9ToYpnSa4ZUMPwYHoGToK2XVxcv7lmMZ7+ZbTw6g6p0csBb?=
 =?us-ascii?Q?CMS5r34LMipsMQXfEwTJYBXAF+WSWWItOekkWbSHLJp6ohv0BoFbJNgPXRSw?=
 =?us-ascii?Q?LhmTjjrLGh0tpZKU2Zu637B2r/TeuIzZLci6dj2jErbnpMBHACezKiIiI4xn?=
 =?us-ascii?Q?FhLEZjUJmm0Wbyhaq+6cRUH9k9mcXEK/jirwn8lzONfeidpSd8uyxXfHLBug?=
 =?us-ascii?Q?vlF35PIrfzAGgN3oaTz8uYz6AW4q6Ci2QvweHkuDU0ArgHxeXhJ33PoSPFLU?=
 =?us-ascii?Q?fIfI229eF4JOKquyfEDT03czC7JYf4r9BJfnShO5Cmly?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20800be3-4431-4178-34fa-08dd2b357cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 13:58:08.6254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBU4Efdbf/CuebBqt95gTIndFlI1Zpxldn4ffyovvEphfLuIIWaBOo4hU1KJyHfz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD7ZRATrY/C0e6qZ5B1Q0DvhFrm7eoDZoOw3TO9pEAI=;
 b=3uuSAB+c9I9PZaaZ3ziZOJpeShitAsSKSfMbVtw5zjBfPzHB5I9Tf+BoKz3/flWGycjmmLvXXONOPOJl5wDnN64/a6/qaJNYpFDrZedIA1mI1IxPO3cXl3rNzZudg7IRkOHC5oTZLyFFFzb4cZI8a5ET2IKMs7OYFn5tcy4+tcc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3uuSAB+c
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 6/7] board/zynqmp: add new qspi.bin
 binary to images
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2308638217910312200=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2308638217910312200==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB5004012DF0B588E1BE6EE7D3F0142CH2PR12MB5004namp_"

--_000_CH2PR12MB5004012DF0B588E1BE6EE7D3F0142CH2PR12MB5004namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> Hi Luca,
>
> > This patch adds the new qspi.bin file to the zynqmp sdcard.img.
> >
> > For SD card booting, the qspi.bin file is unnecessary and can just be i=
gnored.
> > For QSPI booting, only the qspi.bin file needs to be written to the fla=
sh.
> >
> > This patch enables the Kria BIRT tool for Kria SOM reflashing using qsp=
i.bin
>
> > s/BIRT/SBIRT/?
>
> > With that fixed:
>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Do you see the tool called "SBIRT" anywhere?  It appears our official nam=
e is
> indeed BIRT (Boot Image Recovery Tool) as described on all the wiki links=
.  Do
> you see the name SBIRT somewhere online?

> The web GUI shows SBIRT.

You are right.

https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/img_rcvry/misc=
/web_pages/index.htm

The title is SBIRT even though the text shows BIRT.

Not sure if we should include the "S" or not.

I will check internally for clarification.

Best regards,
Neal Frager
AMD

--_000_CH2PR12MB5004012DF0B588E1BE6EE7D3F0142CH2PR12MB5004namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Luca,</div>
<div id=3D"" class=3D""><font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText"><br>
&gt; Hi Luca,<br>
&gt; <br>
&gt; &gt; This patch adds the new qspi.bin file to the zynqmp sdcard.img.<b=
r>
&gt; &gt; <br>
&gt; &gt; For SD card booting, the qspi.bin file is unnecessary and can jus=
t be ignored.<br>
&gt; &gt; For QSPI booting, only the qspi.bin file needs to be written to t=
he flash.<br>
&gt; &gt; <br>
&gt; &gt; This patch enables the Kria BIRT tool for Kria SOM reflashing usi=
ng qspi.bin&nbsp;
<br>
&gt; <br>
&gt; &gt; s/BIRT/SBIRT/?&nbsp; <br>
&gt; <br>
&gt; &gt; With that fixed:&nbsp; <br>
&gt; <br>
&gt; &gt; Reviewed-by: Luca Ceresoli &lt;luca.ceresoli@bootlin.com&gt;&nbsp=
; <br>
&gt; <br>
&gt; Do you see the tool called &quot;SBIRT&quot; anywhere?&nbsp; It appear=
s our official name is<br>
&gt; indeed BIRT (Boot Image Recovery Tool) as described on all the wiki li=
nks.&nbsp; Do<br>
&gt; you see the name SBIRT somewhere online?<br>
<br>
&gt;&nbsp;The web GUI shows SBIRT.<br>
</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">You are right.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr"><a rel=3D"noreferrer noopener" href=3D=
"https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/img_rcvry/mis=
c/web_pages/index.htm">https://github.com/Xilinx/embeddedsw/blob/master/lib=
/sw_apps/img_rcvry/misc/web_pages/index.htm</a><br>
</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">The title is SBIRT even though the tex=
t shows BIRT.</div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;"><br>
</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;">Not s=
ure if we should include the &quot;S&quot; or not.</span><br>
</div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;"><br>
</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;">I wil=
l check internally for clarification.</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;"><br>
</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;">Best =
regards,</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;">Neal =
Frager</span></div>
<div class=3D"PlainText" dir=3D"ltr"><span style=3D"font-size: 11pt;">AMD</=
span></div>
</span></font></div>
</div>
</body>
</html>

--_000_CH2PR12MB5004012DF0B588E1BE6EE7D3F0142CH2PR12MB5004namp_--

--===============2308638217910312200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2308638217910312200==--
