Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A6CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83F740D5B;
	Sun, 31 Aug 2025 13:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vewN4qtVielp; Sun, 31 Aug 2025 13:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF9740D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF9740D7B;
	Sun, 31 Aug 2025 13:40:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D17D310E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C249D814C2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YklHnHgYHIvF for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 13:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::625;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCE62813FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE62813FC
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCE62813FC
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BP5sDYTf5CUrh/Ygy2yWkpapRbqbP7ryn0OoKb7gm6g566I4cxEXot2QLGPi2Sv6s/UY1VoHpOW+jcoNY9bRhKmNvVEuuQuMKFej7bfruHoNFSv5XWh5xh7uyYSq21hkk6h4/3XTLCuHrbZ6AJoheCNHVmAxk++nVUaoL9n+1i3xzmj4myqQoh84/dpTI2nw3jC+F3ZgaECKWZ77wUUVfqnc7KhNyVQlm3tfKZ2NB8zaeCU7jXL/HNYqwDJjOB5mWefPO84Tdl6h8+QB0tc29ibZrc6fTb1jEu6Ga6vjNdbEGaznLywh+oXniznSHt85JjqSRM6ZNELP2Q4HfM3+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eqfga2wZqEeiXkNRLuXasexxAdkINNZDewXRUVDwa8=;
 b=vnFH10nXXNXhEWu/CMAaLa25xwkp8X5H11ymIrAdNdeW96/sPWEaClzNbAU1pcsPaban7fY//iCqndVY99oKXxgrl1vziRDPXZ8kI11xUGpTPPUO1AD6uh/4MQjHp/GJIPtKzDGlj2B6XeqCGtqI3oSBzup7YQmNvTVto50pdPXcyvI488MCquAR58qNaRO5mauDNRj1T+aDGB4oNkeIwhkmPuUYZy5sspgFoQc9ZxpuCBQnAwyy5OtprJwWElV3MpxboRez3C/PspVYNNyOkYtUaXTfqd0JDVGhBMXo6tkPT3nC1P67mIkVXcBDXLTMQoQilo22hR+xRK5x2ITEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::988) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Sun, 31 Aug
 2025 13:40:26 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 13:40:26 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v6 2/5] boot/xilinx-embeddedsw: only allow apps for
 device family
Thread-Index: AQHcDNwIHCIZgl8ARkCcYhDATJ26RLR5bYUAgANxr5A=
Date: Sun, 31 Aug 2025 13:40:26 +0000
Message-ID: <SA1PR12MB56156FB5946831EF8751BDA7F004A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
 <20250814052631.3412836-2-neal.frager@amd.com>
 <20250829110218.4d19bc9f@booty>
In-Reply-To: <20250829110218.4d19bc9f@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-31T13:37:58.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ5PPF09E5F035B:EE_
x-ms-office365-filtering-correlation-id: 8d5f45b4-b658-49fd-be23-08dde893f195
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pa+g9sgTSt0kIFS2zqZgCfoG3zVggrfKFbgcChTHGlJsbh1rRJxCIuGIDLhR?=
 =?us-ascii?Q?NWWgA3CBybLC7vQ1FXYojQIFYRCkg5bU7TkfOfeHXVc8XK18HbDWrnQYBKsH?=
 =?us-ascii?Q?d/pf8GqyMoOjzaK6r23ASFJnkAegJy9KqVhT1GcnV0syaTXJb6tDO/86k0B0?=
 =?us-ascii?Q?BFmHWEKAnyfWuhPVWVXXFJ2kt0qJ345AubpfGbbOJywqtEelxlCzO7W2Bw78?=
 =?us-ascii?Q?7GiXIMTxcIxTdKM4DX0p5KbZnyfC+nXWmgc9rdjonbEOsb8lj96JIe7KnxB4?=
 =?us-ascii?Q?0hDsXlqqKJ3KTXPRqBhVaTHKBNMRYAWMFLNH8NePnercb7w19UV9/8BkTUfw?=
 =?us-ascii?Q?DfxbnMOOpzpY+w1gx+9yNCVUywRCOGFSIedmjsrN2uiQCYaB2o0w4+P8DJMr?=
 =?us-ascii?Q?dripcp8FNBF0ZIFb49o6MDWRQT6ISA+aDqUjwjqr0DjLLvs5YY4Q3CgtMTjy?=
 =?us-ascii?Q?A5QyDS8WbPKlIWc4pgQ6H0oPzaY+JYS6DFjIyM7OayEFQuyVSEqTW89GHeLI?=
 =?us-ascii?Q?YaM3uLu27TMB7kkCliZrIszChWNB4HcyjFiwjJtjT2qycGrRAMVs1yhZ9/rJ?=
 =?us-ascii?Q?vCvlYkZZtizAreJI7eEIVXpy/Fyhvkk+pIW6Hm70a4OWPpSFFdNyzs60orze?=
 =?us-ascii?Q?FEnUiDEbbefs8T9rAfipAXqDCYf4RM1akNiUSvWV4V+RpJRbTgsx8e3dEE8K?=
 =?us-ascii?Q?/1PUwk4S+QpMe0N2RVOxteRgjM/Zv8GUnWvHi5rdFx6z69DRRTpZopfDoWq6?=
 =?us-ascii?Q?BA1k1euOnvusx8Pi6Bl8FUU1UwezUqM19aD/ckMod8bmIE75pGb4t+YT1gJa?=
 =?us-ascii?Q?xMtBaHSMIalUd5WxjNo3vxEljKaLLeG50ZRW4w25FkczOwejIlDOgvKp9r7c?=
 =?us-ascii?Q?49bxE1hKKD8DYLSIfvLhpzv+RmKRLuZmjV4KHFe3omz0VBidFsMIAwbMyVAt?=
 =?us-ascii?Q?hw82Z3Qv8T7GwiwrJ5yqrkGuCpym2DC1fqY0jHzcIZ5na90be7ki4tRD1PSM?=
 =?us-ascii?Q?imo2FA1uUJ7MDoWo/Y0lzL/7Ech4H4jRBqO7oHYirBTa8Wotmxa2vX6djIPa?=
 =?us-ascii?Q?18Y0uMySmHJmAapx5fgrKb1rWxUN8Ek0bPObJbPEAJjcY/sOy/fJRdtNLrwF?=
 =?us-ascii?Q?UvdMZ6SCKEX18GYpm8MJLRw8TnyEuNiGWq+MG7nGFs0qijuVty9WJZtI/bpa?=
 =?us-ascii?Q?lvYkPAHJRo2A7XlqeXDjoEURsBq2m2lh6oXl6G5KC0xXJOx/z/7kPkijquKW?=
 =?us-ascii?Q?6Gb2AEA97skGnr+j9WqghhswZIentxbGxibN9hTp9+7HWHVSe/3ObK3CNODu?=
 =?us-ascii?Q?wnPJTGOlKWXX/SrFpgQwLYrIFn6Qe66oQ0gHrTNqtlY4XeFC57KVtO8CHykt?=
 =?us-ascii?Q?dMz1Miny6Z8v4VnlIFWXmJkN7le+x/1epEl3ZaZ/WK8BMOJ+pR8SCorpXRsD?=
 =?us-ascii?Q?LeiweZTZ2DGzAQ6PLRC0xv6XgD4IT9hHH6XZPEFwio0YvDL2zRUeW+dJTdNv?=
 =?us-ascii?Q?67Bpz82FzWXfzc6xle6WcxV6VgyHHQbBqxHd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TqHBwFCtenN9MwtKmDL+UadwMr75gpfNohNW1wfk75sq/MAWaTj4xMlag4E6?=
 =?us-ascii?Q?vreFwtxPpEAGk5c7vdl8nmnq4BtwFMP3bZ/DHJaXfIX71LWotb/CC8Puh/qj?=
 =?us-ascii?Q?cyq2EV80xkVOy47R/tOLm/CU7HZF3+C/DW8fATDbDRwPJ5AFDQDJXbLp/0hG?=
 =?us-ascii?Q?hTndfZp9jNRUy9/gAzkiLE1AgR1oIZmWTEh05k2fRCelFq8y6lOyC3Z0+6JJ?=
 =?us-ascii?Q?lTzD0WFIkNvxoVjSASEmmFfC2Xy4gYx6dzz1nhLyCQ1znIuDX6+uU4lal+tf?=
 =?us-ascii?Q?g/13V+7llYCC8jz+3Xa4dlPSTRZqqsRkVIATO2IMdSMVqTibqFTMUNFbwx99?=
 =?us-ascii?Q?L9x5KMfJcNvSoDiT07d8glxH9dULfVe7y8QIribGbidF5r/8N2aznKJbTa1S?=
 =?us-ascii?Q?MWzUQKuh0NGIiJGlbqo2q57kIku9A8DBOyYb42D9E9a0AHjIuD7zkyGUD0M6?=
 =?us-ascii?Q?/yL8F5yQ11nUso2DSiW8foqKGolqsNrEMlyeBgMgcv0sEJKQZeFgl4Zx+JgU?=
 =?us-ascii?Q?89S/b6Vbefzz8cEu1HGl1TigIGD8ewX+V1v28PXkkdMrzCpDEIhMRj1EQM78?=
 =?us-ascii?Q?pjzemRvbBvCP74jljgq0ChliPylC+Yj2QvPJu+CeiwPdUzKFCoLOus5MzxFH?=
 =?us-ascii?Q?B7uikc4O3A2l0bWcciJR13K0HaQx7mMe/7Tjv0w/4zpil9xP3WcHIVfOj4bz?=
 =?us-ascii?Q?u7JAmhgZbwkjP8nNuW22ZInf4KeRgbVkS4EZGnq2F0ZrsU8lERgIU+EPafvB?=
 =?us-ascii?Q?qMnqj0ECdQszM6h4sF70E3UGcdGtdQnLSIUoK2XpghsHy6tnrzfzbxVLep6u?=
 =?us-ascii?Q?yZgiFsihrlKWMu0qT1KRddWkLskO5J9ZvYSShYNas3V7A+jQW7VCqAA+Dvx5?=
 =?us-ascii?Q?tb3QiWTbGGFY5nc4JoqiZUBG8iGKwZUyBYgGRmYVBinGMgJNIT7VB0IfEsPf?=
 =?us-ascii?Q?T1+xfa9+jZtrp5m3Q93YBZYsy9ulfmWnH5RgeUbGrq0ZbPlCrpXDqdbbHH73?=
 =?us-ascii?Q?rHDpUXjMT9RuR+VcDDHJs82tpk+DMMV9pImw3rEIbyDgEycQ/wbu4nJjpR9l?=
 =?us-ascii?Q?VeEi0qr9i2YtO7Yw+j3XK4EcVcI94MZgXyBCHYN6U9wjCWhhiIFSKQTzgq5q?=
 =?us-ascii?Q?xaMt22bNFloV3+iYKTyZ4EUcvwRfd4QK/iieuTCcuSamXxIShYcEkMuZ2qZp?=
 =?us-ascii?Q?8C7gyjRdYNL3Zz1Qt8WKTr19mflOZUIk6FE2dUFwIqChmp+xTmowH0zMpFUq?=
 =?us-ascii?Q?f3NhPEC3ZpNdo3/E59TBd21thlF59uZgUGSwVR5bSIjB2yM/s6tDINjHbePT?=
 =?us-ascii?Q?ud+McC9w0iGbfTtUfC0+HSNBtVG+Ofuao0YHEZUHTlGiNr9DL/94yjH/gZZX?=
 =?us-ascii?Q?acY7SQWY49P1ddeaXMcPbEs46pxhLZFTLp4iJjdmpB6FcxwE+kG1k8s4NsRf?=
 =?us-ascii?Q?Dm8ULjBQm04zSxmoq+4mIxzvvlqwaxNH55aRPA4ya9c/HFvU/9iS8N3x0HBq?=
 =?us-ascii?Q?9gGD0jX3U9eOCL6mPVmTc2hZILxcMnVhHIzLtouAIRWpL5nim8wZ6M0fqbaz?=
 =?us-ascii?Q?DX7S19KuJv37sFeOBxQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5f45b4-b658-49fd-be23-08dde893f195
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2025 13:40:26.6308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ObOOr/5atb1wTCBbUwgOcNI6quDbc5LR7VrA+wj7BuV7RsnyaQ78Jj6tbdJaRsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eqfga2wZqEeiXkNRLuXasexxAdkINNZDewXRUVDwa8=;
 b=zmjwktzKROdrzA9VAWGlpNzvNxy5HhKEYCsjO/XHWUH2QCS3RmjiD1qB/IkaHsNLUZr9epEW/ExreKf05SR2iNFh7FDr+yYy9ZQnrMBASA20a/vgxm66AP9yBRb1XX0cwL8m2Rc9keF/UHwe5XBvwgQCViP91IrrVOyS5HXTAwc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zmjwktzK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 2/5] boot/xilinx-embeddedsw: only allow
 apps for device family
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.

> Generally speaking, git commit messages should use imperative tenses:
> "This patch adds" -> "Add", etc.

> I won't be nacking this patch just for this, but it would be nice for
> the future.

Understood. I will do this in the future.

> The versal_plm and versal_psmfw applications are specific to versal devices
> which are based on BR2_cortex_a72.
>
> The zynqmp_pmufw application is specific to zynqmp devices which are based on
> BR2_cortex_a53.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Replaced new family variant config option with an architecture cpu
>   dependency, so no new configs are needed.
> - Updated patch title and commit message accordingly.
> V2->V3:
> - Changed package dependency to only appear if the cpu is BR2_cortex_a53
>   or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
>   appear with zero application options if another BR2_aarch64 cpu is
>   selected.
> V3->V4:
> - Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
>   dependencies are in one place
> V4->V5:
> - Replace leading space copy paste error with tabs
> V5->V6:
> - Take advantage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS from
>   boot/Config.in to remove dependencies on BR2_aarch64.
> ---
>  boot/xilinx-embeddedsw/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index 0dd6433608..3826f2e18e 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -1,11 +1,9 @@
>  comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
>       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> -     depends on BR2_aarch64
>       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
>       bool "xilinx-embeddedsw"
> -     depends on BR2_aarch64
>       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>       help
>         Build boot firmware applications from source for Xilinx

> Shouldn't these two line removals be in patch 1?

Good catch. I was originally thinking of keeping each patch focused on each
individual package, but you are right that removing the aarch64 dependency
lines are really associated with the first patch of the series.

> Otherwise looks good.

Thanks!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
