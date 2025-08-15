Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D07CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 18:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726F540DFE;
	Fri, 15 Aug 2025 18:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYK9YJ4H--cP; Fri, 15 Aug 2025 18:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E44411DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E44411DA;
	Fri, 15 Aug 2025 18:39:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9005D196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C644091E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7CzPf1J9-yE for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 18:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62b;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABA4A41259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA4A41259
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABA4A41259
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7nJgYUOQdm+WR/9V/BIrtX7rcy6AC7dIK7H9rJtqPtBhSoYQ4RwKOjNLrC+ihS8ihSqmLdxlx5O0onNGzkym8LlqkSdJ8AoFN/q2yeEVBl2cI86hoz0vVM+NN/ghg0gojaeyDXdjamZni+NuNfOa/Qr7cuSWIzbSuXHpxwDjjcnrJkjzAyiUcLcwfFliIbwgm26Wa4QqkYxnDACXQZr563wqEVv5GeAcL55Zw4JQHMdkrh5D0tCP3pUGUBTPKtdGtCnuWT8f89i/mLD28nFQYm+Ft9iiTTzw+jQt6tAN4ftvRAoSWaoNOM74ueqdIc0qMczmgiZnR0KRw50REWEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4MBoRR4HOuDIvS4GyQY7/CMxOHLhM+YGo0Y+BuOleg=;
 b=A4hB1JouZZnc1h6v96wCzK+8l4oJGC8b5mvJ6SXhBafhbhpEJyF5QTGGCdqWRzshmGz6KDWDUX0IEiDtBl3UXWHyt5RI/KdAf2dth+oQi5vJcRz1fS+NWXfxxx64VvRsT70TfqQkwlWeeb4XpR8YTt+tN3DmI7cewIeKf5Z+WO8TwfQy9xsLIN0QyFwQ2hNBCRfepcde9xFOkZAQaUbu7Pf7HGDNMbEY74CnrcF4tGk2362KMO0Ji75hyaq9D/yO7y+bFq5TjQJwiJMLfFeGVHXaRVlj9ZAY4qhyzGK35yJk3JSlaX2xKxXVA0Gh6npu3NsMV4zgZe1juhWtqzRijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 15 Aug
 2025 18:39:00 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 18:39:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH 1/1] package/gcc-bare-metal: bump to version 15.2.0 to
 fix build
Thread-Index: AQHcDfk7NJeQg2tNQE+twuWibsCkgrRj1zYAgAAXQfCAAAP+oIAAFqaAgAABS8Q=
Date: Fri, 15 Aug 2025 18:38:59 +0000
Message-ID: <SA1PR12MB5615109970A6666176138370F034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
 <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250815202925.42d1667c@windsurf>
In-Reply-To: <20250815202925.42d1667c@windsurf>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-15T18:34:02.4848622Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MN2PR12MB4142:EE_
x-ms-office365-filtering-correlation-id: ffaf3588-cad0-4867-b0a8-08dddc2b0023
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018|8096899003|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?GURO3BelhOIISW16dt32qa/Ulv2/j9s2kwHZMKgD5vC+CydF+5BaRCjRUEND?=
 =?us-ascii?Q?IhYgbRXabtlF1rM70cNEXyvlvvmyKiSjL0rxjpu9bsE/GLGNbCRCcX6w0dOo?=
 =?us-ascii?Q?+E1FKU8fZR1nv1wLXh/IARDOSPMvovzl9ixzm3ARTo0UVZEqyQGrdlClOC54?=
 =?us-ascii?Q?Y8k166pt8r+0O+D0lrPn3QLJqm2Wm6gIhwNvtSKH/0WNQmB248sHcrIIUfgP?=
 =?us-ascii?Q?ar6cSd3oXymaf+sUz1mbkDH/9kdFnB+ixy6lRvngNderq07Erab1BvIknEWG?=
 =?us-ascii?Q?SmGJFEjMRb51To0cKKBYLxbfqDYxpYZ4n0dMaSsXG4KznlY+JafPjSNVlyc+?=
 =?us-ascii?Q?aDPmnckqFJHhseb209VoXL7ZzJmVWmJZiE9HtjFD0vaJpOTywbUNZQfuBWYL?=
 =?us-ascii?Q?zR4ExybhWvDAScaHTmCWkr6nKMe5djOyq7ax8LemB0mSHgUuzr5ga1h6fUi9?=
 =?us-ascii?Q?TxxeAge9VET7hYYZxfSUaVKPRPHniphLVRkloJnkJmE0OeZVE5Smhiw3ZPtI?=
 =?us-ascii?Q?naeSvo1LFSKWAUhbZpTWSKOIz37l3ROvX5LD9WEk90X/gf5PGiUEYUbyA1x+?=
 =?us-ascii?Q?vKGov0Xp38jJHPi7Da2fXKmfWMMAS5SGMBe2XJ6IZA6guM0eBPGleJ0ab6XV?=
 =?us-ascii?Q?g7/WHt6giNczAvNSv8BC3zFTvTxssE2hlguj6bfqyieLnq+aaKEEPy/Wq+32?=
 =?us-ascii?Q?vAOgIP46KnM5kHF7Fp/DglFHSnz2IsHJafFdKzLwU0QfEpIeIdC/75ecuBkf?=
 =?us-ascii?Q?Klf15ndEY3zLHNk7zGkRTaBPu9ZihGOgwulWiR+pxbNAvXrD2Sn/ECmGWEDg?=
 =?us-ascii?Q?v5jQhVkAEmT7GoiPGT4s0QcuYGI71RLQMgOZe/nQhpU4kfZQfMCgn/7z4Teq?=
 =?us-ascii?Q?ikOKrrJSTFrnkc1C60x1hFxxzvbbKfgcifMdeKzUWmeIhMO/oHykNpF7b3u+?=
 =?us-ascii?Q?6fQf+ugXaxZ/ymFLN098uJTIB+KTYh0ut8vsDwUHM2SyEYufPi2nm/J4U0gb?=
 =?us-ascii?Q?3aF2Vt+A/fLkwVM4gp6XXaNREYouBfMzazChkTQoE3xUXToJmliSRcf3A5yE?=
 =?us-ascii?Q?us5hl3bNUzHe11xM7tDSRk1Wd4Qkl7jBPaXsza9lDJJWI3bCTgU9k4kb4Sei?=
 =?us-ascii?Q?Rt5qhrxNr64ldPSdSn236FB/dlsNLCGKz6yXq3ks/LQeQV2pJyQkOG9L7/Jw?=
 =?us-ascii?Q?RkcwaSC4n2asONTx60TDIlgu1hzvM+uSMMcLyyTpz/sqvVqNrv26OMcD8SZt?=
 =?us-ascii?Q?TwE6sVgWMxX3PNv8l4VesDBxvKT4eeA1pgmwuTrkld6S51F8Sl6wVn0NenSC?=
 =?us-ascii?Q?4IvBcbtWuwRUu6ZSWnOByAizm0eaPSFn7kVfggas+BMum5hFPE5plGaFBQU7?=
 =?us-ascii?Q?7i3Kw0xC56aEz+W2naddH2aaypkkvncC4i2KuMuOcMMtnKmWj/8XBAX1vjUI?=
 =?us-ascii?Q?nKQAhFj+5xuiTb8xt539MC7U1UcyRH4rVcw6d5qz5VWpuEOQV1yqECEX762I?=
 =?us-ascii?Q?O2Fla60YQDLkYPVjWjbyJtu5f5UVDCjhjM10?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018)(8096899003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AV0YAw8GwqODeAQTeJrOVJXscl0lAcVes5D4pCg7u58J6olCaEMrORkoq11B?=
 =?us-ascii?Q?gMG8yJqnbSft7jbRg98sXdKsedwtL5rWfmy0nAfJWgF6yIoRToHqyyaSScxw?=
 =?us-ascii?Q?k6lE9Kexx/5XIqvPdKBXNQm5O7GAR3sdK3tCMS/pFlwAPQN6t3sbVV+S49d8?=
 =?us-ascii?Q?rVBNFSXhLEfAYJENRjpkfN6WDk/RY6Hw31AeUueQSA0TzNtDY5OOFCP5dDWQ?=
 =?us-ascii?Q?qJpmCyj8JOezjnGFNlY15w0sk1hSPXQakhqOwk4WtFDmCtOdkhkOAJX3lQA/?=
 =?us-ascii?Q?wXOp2uOSjPQpZbxqjZyDHnSpBb5dAP1SewwuJqJen3gNXNFdhphEDSWHiVvz?=
 =?us-ascii?Q?wXZ9Hyk8IZqiCelQFU1t/erwwptYkdVdI6OYH9Ux3TBO/Vg5BuuaEuV+Epdx?=
 =?us-ascii?Q?PZGDyhFAPNTbBo3sEgDAiYdv8uqOYaDxxpImBZLySuK41q7uZFJMex06FCuB?=
 =?us-ascii?Q?wsIzvCU6jU9c9MoWoKsc/i/XKmT2tg83xsy/J1sHiLSoNJKhAMwJ7hKt1krd?=
 =?us-ascii?Q?0PoA/Qe+kPU56PErlMXwjMAhLqWAOocgGEHg4aar/Pt4D46eEs7eJs+YzdSr?=
 =?us-ascii?Q?c2IIh/8GBBzbLBU1XAHB5Q+ZTP+wMCYkW1grKjzPrzcXE/cth6aV648ntko9?=
 =?us-ascii?Q?2L72eAFnGpEfyqLdHwr/ZlKSrZ7z/fejijucvJVVbA8LFZF2sFrP29XvPlXy?=
 =?us-ascii?Q?xLs3MpZZpEKNr9A6TQD6E20wOM3a98i2TZe+MAQ0FHNiO2U29ZfP2n4eOF9F?=
 =?us-ascii?Q?bbyaoZXAKR4qZzMmeKPTw5y7ShQj0YRPp3wkadtTebcav3ULGjuULjlOIl3d?=
 =?us-ascii?Q?9+/7UgL3pthhTDisFB8PMHWWAC8ddN+Td9nUdEwS9NHl3RycYYlKcyN73mwM?=
 =?us-ascii?Q?IEFlqzgiksucmHtMUsSuDhk5ZJPIy+bVAhzFGXkml4iRwcsZ9ci9Exf08iRO?=
 =?us-ascii?Q?hzfeBsvlYnNFsPEw8uoeYzDQfgNNKGykvymJRqcMF+1BDExPsMXBmeF/Mvt7?=
 =?us-ascii?Q?aDUkLQg/ZI4mz4gz1MYxnR9Ajifjnx7GuoaqZKKBa1UvxqmAVCrbfFWlIRkk?=
 =?us-ascii?Q?/WugbOGhv29BnDzrNGb/d5u9mT6gvTVSOuZP9in7LQPBgHABnnZOw0drQvjv?=
 =?us-ascii?Q?PZoCAMX5yvAicH7WSXs4VB9JEsCtOua+DzrxhPH2WaQyuGGUOrrlqJk/IZjg?=
 =?us-ascii?Q?1fUIACLAzy2enbP3K3NG1QFBmuWxWlFiAuVtxDkJZ5Mk9awXEuzIth6Bz4yl?=
 =?us-ascii?Q?YRlCZxvlzD/z84TpOi5JPVCZS0DSQPO4cVg5+ppwIUq/nJABM864wRfjTE56?=
 =?us-ascii?Q?kdJxNr+YcwKR/Omn6/U4rgDHuf4no0+5ncX7swSv/Dod03hUomMYJUwTuIz/?=
 =?us-ascii?Q?9X+XuI84Eztzd4WhODnAMeyPCESUHZbi3fO3R8FLTK5Akv+5N+pLlDP/KJ4q?=
 =?us-ascii?Q?s4/MpxTk+HU+lpp/AX0cgtVUPpkFhmbA49lHvPwtQvWNwNt7FO42nxJyOIiU?=
 =?us-ascii?Q?JO4s9aVH2KZxDmQ5uVeunh7Y8zBNxzxSXePbv7eo7NxKOy4jQ6ERs2ADZlSU?=
 =?us-ascii?Q?/R3g+55zFIiBNtoI94xuTtQirqRjq8P49EFq3KFQw2savU3qpFsHL9//itZa?=
 =?us-ascii?Q?ntcMRZW4Ck0iidXX5svTdaBcwduInsmikDHaWVnWObqm?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffaf3588-cad0-4867-b0a8-08dddc2b0023
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 18:39:00.0043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RGMdCfZf325Y7wbnSOlCd4dw08KYCHR5+9Co0FA/UjYSt6kT42j0H3breSXZ6DYf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4MBoRR4HOuDIvS4GyQY7/CMxOHLhM+YGo0Y+BuOleg=;
 b=SCHwJTGMzxM9UZzscBuSil9/kSErvP4zUStUMvRvbu/4pO8PnGJueeb9MhR6RWz4pK9uqEEJdAX34IfBzXFsmjcIgl8TBIbJZhvzSzeMv2gkcRkAp30+i9/Eduz4iTRRF8o3IbG7yDXZjH3DER0YkK4cazbR06JkB39C3Pyr/SE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SCHwJTGM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
Content-Type: multipart/mixed; boundary="===============7594585258864613208=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7594585258864613208==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_SA1PR12MB5615109970A6666176138370F034ASA1PR12MB5615namp_"

--_000_SA1PR12MB5615109970A6666176138370F034ASA1PR12MB5615namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> I just thought of a better idea.  How about we create an actual hash file=
 for
> gcc-bare-metal instead of soft linking to gcc.hash?  This would make the
> gcc-bare-metal package 'Thomas-forgetting-proof' for future gcc version b=
umps.

> What about the patches symlink? Perhaps we can decide that the stack of
> patches doesn't need to be shared?

At the moment, gcc-bare-metal does not need any of the 3 gcc 15 patches.

We could just delete the patches symlink and cherry pick
any gcc patches we might actually need in the future.

Then we would truly disconnect any dependencies between the
gcc and gcc-bare-metal packages.

Best regards,
Neal Frager
AMD

--_000_SA1PR12MB5615109970A6666176138370F034ASA1PR12MB5615namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Hi Thomas,</div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"ltr"></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><br>
</div>
<div style=3D"font-size: 11pt;">&gt; I just thought of a better idea.&nbsp;=
 How about we create an actual hash file for<br>
&gt; gcc-bare-metal instead of soft linking to gcc.hash?&nbsp; This would m=
ake the<br>
&gt; gcc-bare-metal package 'Thomas-forgetting-proof' for future gcc versio=
n bumps.<br>
<br>
&gt; What about the patches symlink? Perhaps we can decide that the stack o=
f<br>
&gt; patches doesn't need to be shared?<br>
<br>
At the moment, gcc-bare-metal does not need any of the 3 gcc 15 patches.</d=
iv>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">We could just delete the patche=
s symlink and cherry pick</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">any gcc patches we might actual=
ly need in the future.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">Then we would truly disconnect =
any dependencies between the</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
gcc and gcc-bare-metal packages.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Best regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Neal Frager</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
AMD</div>
</div>
</div>
</div>
</body>
</html>

--_000_SA1PR12MB5615109970A6666176138370F034ASA1PR12MB5615namp_--

--===============7594585258864613208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7594585258864613208==--
