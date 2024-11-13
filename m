Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77539D41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF35F81165;
	Wed, 13 Nov 2024 09:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54cQGllDm9Og; Wed, 13 Nov 2024 09:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A768118F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A768118F;
	Wed, 13 Nov 2024 09:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69939E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE8E8117A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5j89c19oYAHh for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 532678116F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 532678116F
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 532678116F
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:31 +0000 (UTC)
X-CSE-ConnectionGUID: phhUKDtJRLe5p6x8um4z8Q==
X-CSE-MsgGUID: jah8DHKvRPeBkRM5blBzFg==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 Nov 2024 10:48:25 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 344A5B5A87
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:48:25 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 288FDB5A86
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:48:25 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 10:48:25 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.110)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 10:48:24 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkA2yxlgLw2c7uXMwHMhKlDULb7pcLTAGWN/kCkve1Jta9uMlR9yOsIwgIJ2epsqMI/S99ejkgVQDPDMYNLlS+mICSqIiEOo8xzkaVh82EkMUCK9YGCPQ9kmo58eCd07Q1oARjWOmNpzm5ZJ9ocUd0U6nphV+9t3bei+kbMBeqJoDyY78iZORQNa+pzs0F3s4Gso8y3Fc+aS3DA+Rl/pBMwJstpS0Mv8nqsZqzfO+IpTY4rgilG6KjjfM1V/WWxMvFW8Pyby4KojCLmBncHx7tnuahxVa39MH/pOLGUlCkTVYrg3KT+pHLcFCyiSSGNKbKYt5f4y3u0qg77j6O0afQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtOPEscnuWQWaDPh5zOFFkJBzEyjqigWWNBbKW0Zk+0=;
 b=P3PxyEbv6ij32Rc4jhscunMEZZU0iwFw9bh8p4zyMLSAIRoADzohQzIu4N51NWJn9XJDJ8Gr468K4UJEFfWNXYvbxitgUIhS1z2vr1XL8xDZaXVT94ODixL7AUgts55EYQ4Oo/HbzEpTiAC0QsGXErYga2/UxMYdvYD1mP9v/A/6NbkIWs/Nc9NGMH39wE5jk5U5Sc95Z10CleL/a7RT/56QkOtEn7gxrT56LNRJoTdtaDYXCsYQVaiuZMBvKFk909XzdloSV8PSZQa7udadNflG7FttZmYR991uHqQSldTgVXpGXq8z0CHKR8ZMGqg9JKnXyvi5aCfUD3fXcdo3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by GV2P250MB0804.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:7e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 09:48:22 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:48:22 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.2
Thread-Index: Ads1sQ5SW8AGliHTS+OdfUZ7Rc4tYg==
Date: Wed, 13 Nov 2024 09:48:22 +0000
Message-ID: <AS1P250MB0608D1D68E767CD11726C376A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|GV2P250MB0804:EE_
x-ms-office365-filtering-correlation-id: 52bf87f5-5956-44b8-079d-08dd03c85014
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gSMDsTCB9j3cMBKsaTyYOwuD8KGcNPhW0flVLIeRuZ/Ddg370lvaRlR1zAoO?=
 =?us-ascii?Q?fa3Cn68ubQhNB3xriZrhHMrNqVNwJYinBH7fGBg1t9t8xa72CSyUOlNmZG6N?=
 =?us-ascii?Q?lgR7dVoKHfGGCa/CqVVRqJxhlDFkUJhfi5EulUgm5/LpJZAZ79HNLy85MS+N?=
 =?us-ascii?Q?/9a/hHS4f1Zu8j//+JvW6YuxBAhrmhRlnxHu4t2gGczECv5/Q0S36o3kUjZF?=
 =?us-ascii?Q?Cb12hN7l1Yvg3BfdcdeCI9fpcM0nUHJaa4BHSQcK12gos1kfb7+fBjocoxAI?=
 =?us-ascii?Q?cbRLSHDCEkUDfzeD1knLyI7QEvMotOLDnrUuMsdmE+WL/ZDb49jkAsxV1i9j?=
 =?us-ascii?Q?locTm+boIPUxFKdaOIrans8ZGg/lpDgtsk8XxEh6TGbCy06AWBpIbWWx7/YR?=
 =?us-ascii?Q?j/a/bH2WNrLC2xvTS9yE0cyTBrWzqjx2B13hl6xVRnw81iaawwW09bvquB6/?=
 =?us-ascii?Q?btcspCidG2W1CAaa9bGmncrmymH7HOu09BwDPz+vTYt6dxs+vsZJk9Hbut4K?=
 =?us-ascii?Q?JerLQyRqspO7qMhO7y8enGkNkAxsMhUxwRqUBwnNRgWs0mEiAzGs7fWNFNC9?=
 =?us-ascii?Q?iYtz1Ri0+trQddLMBl8kWyPQs2zMCvI0r6JEIvWhMFQc9bIUxjylxJH9eXWP?=
 =?us-ascii?Q?XRgLX/MeHo4ylSpEfqxaCgiBZTOtTK0L28FkaPvGWZtZ+OFTcw7IeUOZhpmi?=
 =?us-ascii?Q?gB6/Ijp7fmu6xHnPTiqzTGmgmhELZrg1NLbva+zhC83oCDdhaw5edwG9WJ88?=
 =?us-ascii?Q?K0FwIR7O2GKCBxM71Ryr+4BMWnTUEw3TYLu4nSbqpJSt+40/u9yu3SH0WqD9?=
 =?us-ascii?Q?fLVwakqD3O96Kv+Ng4wG+Vz24cR+2zQa9Tru4T6vy0A24+PQBPDgP5LyNPhZ?=
 =?us-ascii?Q?uow28O/6ic3UBO90xhEdT+OiKasf2qq5vEU7TtWt8eF2JiVEjaKisgq4LRAB?=
 =?us-ascii?Q?JOJDxUrQeDA6e+xcW5fA4s4cWEvgjU0+AUjLVzp1uBuiQ6nr1eASGMMU00HB?=
 =?us-ascii?Q?iewAejTE0Rqob/Y9OTOc+awo2s+p6itSs+9gO51yhHWXgYkBMcKbrb+BoOcn?=
 =?us-ascii?Q?5xp31EVT3aH380n6fDdWj1MT3uYh1FLXTXuT7f1TKDV3/CeEprT6IgkG6anv?=
 =?us-ascii?Q?jAbH7VfcHgAOjYjWg2/ZwA6sj3umf8QHeBzlWYXKZdXfx1Q/K5YJNlbjanJP?=
 =?us-ascii?Q?tdCv1rvbgX2rCPtJ4BAB1wts/tNTbTZ617kKlXiVlsCrAUFTf8n+5kjZVXH9?=
 =?us-ascii?Q?MtuD4YhsSYd6U7egHkVDatkSA5R2GSaB8PHmZ9hrWY6SkXziulELcUQn9j2g?=
 =?us-ascii?Q?vPEICv+J7pHFwWNw8HuYxE/OCLN378u4ezDj9Wxy9cD7B4A5Xo/vdlAxuNG4?=
 =?us-ascii?Q?qqLd9lnsdOD7AYBGXizzp9Ieeyvy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OlGzkzAiNwgRdiz/ZdLzOmgWjXq/xLD0UkiOh3cJUkqiOIrUU0WQ3IRxbGmq?=
 =?us-ascii?Q?KTBkNPqQP9/G89qUZ1oqnClXJIzvEWQ1I4aaL/+3Y1v5+8bozZUAavWKJzII?=
 =?us-ascii?Q?VuWzjxSvjrRE2kEiJSHr/yZsH1H9RbjJca2/lJ65PetVNS3eJks8Yf/sXRoR?=
 =?us-ascii?Q?ICzaU0z5dv5IMGM6AvaaiLpAXydPdV4AVaVw9MXuI/VI7SiTcCF2ZDg7VvmM?=
 =?us-ascii?Q?3XcLo4u7mCvwvDP73byGWLO5CDJatJX64YyLwssgnj7fp3tEc9LwPrccqenJ?=
 =?us-ascii?Q?hKsp0GF6C3LgYUkpZRNpFRvOVbV8EhLLcQJpcJvUA0/vVfkEmfZvgum6rucq?=
 =?us-ascii?Q?y30KzSqWBW6r88hmaZro1P1De2cLOYMCQQ2saYsVH9wu56d6euTElQYydVG5?=
 =?us-ascii?Q?251BucBSo5B7xNGP/zuoykDeNXpQIYXcSQ0M+oXQvJtkY9aEZruIrx8E6XP9?=
 =?us-ascii?Q?BzPdyhLTjpoQr5s+VJLT0iYy9X/qaVFhvRkKI/ypwHh6iT3ENGgvCzBvnmSI?=
 =?us-ascii?Q?BjnvYJgcfRWK1Ph4eCU6iiket4tqpCtfL3Iu79WhYOJ13hoMOzaf1RwbKQNO?=
 =?us-ascii?Q?Oqtx1u5NdlUpmC6YJgWd1TWJ1cI2Riig41sgigQ4EouACZVoVD/DrwNWks3s?=
 =?us-ascii?Q?Ke3xWCI2RH/BBhkSt375DXgtgZhwNQhgRL0nPSPgFKKQTbUH4DaVVv9OM+IH?=
 =?us-ascii?Q?VtOsXCsBgHVfpXyh4a8eMmnXtypFLeMl3Xp+CErOr/AU66wyC/vWGoNQeUxv?=
 =?us-ascii?Q?OF4L6xLU18QhE6Z5JqEwIB9ztyi3nerZqxAoB8vMntp/Mr7GWefV2p5O6uCl?=
 =?us-ascii?Q?55unrCGbPY4gjUFcclW3F1TVdVWFQJHpURF9Fnp3dzUy67uuEc4FBA72hEJw?=
 =?us-ascii?Q?Dg5ICOTvZDOV4HShYBgXhXsrsogiO+tqK1upZjM/op2on39P/zysCjvOsxM0?=
 =?us-ascii?Q?oizy5wzz5ekoh4z4BfffoArfgqSz71egS6GYNgP2emeXQT0YOAI47HLbfcLw?=
 =?us-ascii?Q?V2JwceS4yUFX80G9/TLu1x1QZSZ79Hz+7RK2azafZ/ioSwI/GOK21EdiF7rT?=
 =?us-ascii?Q?q9y0x3nS5G03udXpWCMpbkDl+Vlhgundom+tVvMs73Fmir7+A6M2SmxxJkJF?=
 =?us-ascii?Q?QIjyA+EFScgzGDRx9vHoJJv0t4Nw8cXYY+DMsx6Nh5I0pxDxytS6agZpPSvX?=
 =?us-ascii?Q?PU1CRSMmAa7xnj7O49bWo3RtZZSX3U61bwDk6I+b6nJegIxtpNwKLW4dxhUG?=
 =?us-ascii?Q?P/dWiuGb3AfFkFzrXmGsahb99VYVu3bP7zlKuDTYcQ5godzPUwced0VA4lAV?=
 =?us-ascii?Q?AGXpsXi4zYzS3LePdV1yVMlB3iM7kSvoJfH4txjAWUuqqfZQmW6FWSXy4TGq?=
 =?us-ascii?Q?7Kx30ykiQnCIrCff7V5yJ31oDXkYyu9oFQtEot0DnI8fbC+Dwv70sADtZQzM?=
 =?us-ascii?Q?nEvtvErjYJR1Myvg0JQtmnjbBFzKtTpK/SNYaeDlhtxlvJtaFg54CLc/rKBD?=
 =?us-ascii?Q?YGmewrsLEQ3OQVmDQS8u07fBZIvEMDBnnoSi0bAuCf25GdGpqUzaoumTS4DS?=
 =?us-ascii?Q?5LlZIKXEtDDm2NrBw/PUVscMNoSHkI5lCoz8NZ85NMNvk85nfAk1VMQfjydh?=
 =?us-ascii?Q?YQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PxXK0C3JY7q1hXyoMCA6+heoSO58Q5rKA5Pk0+gViPGsDYx5aVlG3bEQBqfVjs63YF80t7uqzAT29W6PeMsf7HOsUPtD12bXDx8+4/wcqxQntRSs1mX2k/2ZRiW4EjpUjMSKDuA7Og2gLPnLEXC9rFXNt3MqO1BukKtWDMKx3n6pND8HP05zPsnLqT15dYoRjerR420/oP/AdWgOGKPy2OlnQPSw7bPp7dIKMFHywql7sLq/yyJs5e1FEWsvk2562RkvVAn+pMryq/ovYO89qSsQySTnwA9D/Xr+qMy7fl3YF+9KwVxyM2lR14NxNdqDP9cmHHnWA3qoS+dGQR3L/5IwWPB3HfExh4vrKuowyZaD9/3DdNEYFrP9jjn6u3tXk7/MFTt6vSVSWBW6YoFPgqujdIi7HzTeQn+si6lkJQQ9DwoCkJSo6oKErUcqywZ3CPD+qdO5d3ScP5q/TfMab20ScINDeOvd1V/v/G0l1gkD1fNPbTX8VWzQquaOSkfw5W5t9BQooIUTupBvkmXBM/dTQtpo1m8ODW7FlaelEp0abW3mwHfKFBRS+r++Pauc6Sdu/9nROL6zNHsN43yH5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bf87f5-5956-44b8-079d-08dd03c85014
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 09:48:22.7758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqrATgElq6P7kHOlAPfwKeiI7dlvh1tKrSvm3B7VfnEbE8OjVownoUfyoRp0c75vsaWfzRtp2Y4LpeWiY7+Ed4kRBV0OLW+iqPW4sloF2tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P250MB0804
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtOPEscnuWQWaDPh5zOFFkJBzEyjqigWWNBbKW0Zk+0=;
 b=UEG6oiscTlPG0c5QgVxk3e15c4slVzjH5nOMEUz2NLdIitC/+zzNxTVrh+dobEJ3OT4ttUtR7kQXM/iAjUjMosX9VRpJZpYGZuRkHb85HuKaL3eGzOUKeuO5xYV/89bmXDigSoD80Rub/jFA9hmuaclXTUJIl81ZRHVUL4dzQFs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=UEG6oisc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.2
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.2

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 0462203223..11c9dc5fa8 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f675d72b1141ab844947ad3a2a4932f6469324c76cd819cb2724d5dabee7d93  libzenoh-pico-1.0.1.tar.gz
+sha256  b2c7645e023cd317a21f6adc0f8c50d71ab3b058a1a630ba4a0f29f9c0eacf3a  libzenoh-pico-1.0.2.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index eb82a7487d..28d702c459 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.0.1
+LIBZENOH_PICO_VERSION = 1.0.2
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
