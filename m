Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C0C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 10:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B8A41688;
	Thu, 30 Jan 2025 10:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb6qSzRzPdS0; Thu, 30 Jan 2025 10:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B3C415C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B3C415C7;
	Thu, 30 Jan 2025 10:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD66129
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0723460A61
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmmhgGnQjzQJ for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 10:37:57 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 30 Jan 2025 10:37:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8AB8608CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8AB8608CE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=1185a0992=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8AB8608CE
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:37:56 +0000 (UTC)
X-CSE-ConnectionGUID: Y77ylMZtS0O9CDMZtCR9Sw==
X-CSE-MsgGUID: Ns6PISyRRF60O7Znub1KLg==
X-IronPort-AV: E=Sophos;i="6.13,245,1732550400"; d="scan'208";a="37710373"
Received: from mail-eastus2azlp17011025.outbound.protection.outlook.com (HELO
 BN8PR05CU002.outbound.protection.outlook.com) ([40.93.12.25])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2025 18:30:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJ7BDkC5ORIcssyCLhsKPqOhch+zYVQ+oHlzXXPQkAmDFdoBDrb4ohG3hER//wMBXu7/8gqqIt5eMNxPyBpSo47kMLgrNK/p+fAAdHcIWkeNjgGJY4wI0H6dcCnTGtwbWkvOSso90ZtFrGZPWSrO4e6B+2e8GKao5UkSiKZZxFBV6ISDP3fzjatjWcYPxucnoeWjHw2YoimFkFkYWZnmDgCCY3j16AEtUjggm4yUB3wAhTafkbK1kSNEyNxaaWWDU+WGGAZgwafi9NSx3oVm4CBdm+rkjD1iWhxXFsvI7KAZYCdsZ+4rjhLyGGOUu8usM5THTgUBm24VGfHubb34lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuZYLI9/NmykR6c/3Upn+F3eopG4ykEOGP0VCW1crxc=;
 b=U2vxiM/YflkZeuiEyCzWSMutNNdBJDRbuZRLCxWmxj0vuFgM3K3IzZfR46bKZ1/YBcjUXEooZUUuPOioTidVqQj7IdUyOy/z+pxK60QcTIbVUJ/AJChFg8fjBfliysc19E/53LUyDgI1myCuGIrsMoVTrXiPnahRnKWNESPqfhEx6sDP/apcVziIE0nGRwMY2z5zgQpe9HX0RcEHof2GSfeoOsXdWunOUl8/XvNs48PMdtAXRbHemPEIZjkJ66zqnzA4n8b9Aqr4hJ4aSEE+ebU3Ajlhrq8ltjqmX80Uul60jA8oFmnzBBArvexRlt2iLO7EMUvEcMVcifYEeDltcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM6PR04MB6284.namprd04.prod.outlook.com (2603:10b6:5:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 10:30:44 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%4]) with mapi id 15.20.8356.017; Thu, 30 Jan 2025
 10:30:44 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Romain Naour <romain.naour@smile.fr>
CC: Fiona Klute <fiona.klute@gmx.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>, Michael Walle
 <mwalle@kernel.org>, Chris Packham <judge.packham@gmail.com>, Sergey
 Matyukevich <geomatsi@gmail.com>, "dlemoal@kernel.org" <dlemoal@kernel.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work with
 newest kernels
Thread-Index: AQHbUGsRqPbDUb6lxUSES5Cpi1LCZrLsGPCAgAlDWoCANxVQgIABWZ6AgAGX+YA=
Date: Thu, 30 Jan 2025 10:30:44 +0000
Message-ID: <Z5tU0zCAiReVPvPY@ryzen>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
 <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
In-Reply-To: <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM6PR04MB6284:EE_
x-ms-office365-filtering-correlation-id: 62feccf4-d066-44dc-5b4d-08dd41192701
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aVAhcPdVGNzWMdAt6QPsynr36mGC+jA2ZpY8B8quEtE7mlMmFdG/p7SzDrZW?=
 =?us-ascii?Q?A4kEqrIZ/0YU5OH1dis8OZlNL1C7kfvfgEGh9H21cf5HR10DvZ4EBo1aJcTM?=
 =?us-ascii?Q?fTHDM/jkZBtbVinLXJ1vRSa+dBHCvoMJBUvRidilcrtH0NvfQwKzqx2BOWRq?=
 =?us-ascii?Q?tdIhfReJR8+BMnxlk/pbkFVy1+BpvLPQcsNk1I9f+SKtMKCPwa5QMMDDgs5v?=
 =?us-ascii?Q?G6FbLC2B4H3PTYC91i/ARYlaEdMzjNBh0yff+p0oDA6eYU+NpFS7FxjJc4IX?=
 =?us-ascii?Q?p/Xav7h+mNiNvJ2FyyjP2XQlSWo1Yw2ax8kM9BcrezkdN1Q5ibJDHenWZqLt?=
 =?us-ascii?Q?/lXLoV3/m7o0sv0QXiULBWk/KjJiai3wq4I/AY0cW7VeZ6qSOaHNpYpbdXTX?=
 =?us-ascii?Q?V7yv19h9xfMd7XMNVBBX5CeSNqXWgTxnVFgiGrxc2sMUx6+FdZPxr0OVYsVC?=
 =?us-ascii?Q?U28Soc1K0RF3DhrazoVmIWxYlvOmipuYlB9AHkkfRWyyYWNY93WlEHHmE3xd?=
 =?us-ascii?Q?aZJXwY0JeECTbmg8uFm47qRh5dkeUE9A4ujylrHAQgzi4U8PhfZJL3AzHmQP?=
 =?us-ascii?Q?erTPPF55z4Tzp9XN5VvESgvBHZzOg7mo4wcgktb8ZNcXjgTdVfCRrv0tZX1r?=
 =?us-ascii?Q?B2M7vXTkNzbyunQ2IaNKQxuLI4vFeALzvmJMcMmuOp0C57vC22K9+sNzEep+?=
 =?us-ascii?Q?1jl08JPecDmYpUE6KibGdxBeJyZmqP87Vjwb+7YyZmfnuH0JhbSfUYjq09wB?=
 =?us-ascii?Q?5dwq5pZBrHBqswWaOd07sJSqqKxWldg9YGaS9YmKSGV0IaIDo1AIUD47GDRB?=
 =?us-ascii?Q?ijolI+m0cFsIpYlYUjeh9bcspvaa7GPKtvgA4G2Br11OxPOOtLA3H5ZN8E6U?=
 =?us-ascii?Q?+qhio6KphEraTUc9ZCyAUkMaB6iqmWPMbHmLK5YPdpFUfWIDUgHh/q62zSQP?=
 =?us-ascii?Q?LK45BQETqSvkn9hz2UngCBhL9lp91dnNKtfa/S/zUtasA3DYWjQN6i0nNfsc?=
 =?us-ascii?Q?9X8mXd7bYcdeFA06gQtz1q4n1SrmNKzHVoG8vFvIWpobbTZzK2PCei1DI5Oh?=
 =?us-ascii?Q?rzQCzPx9VWDNdKTz0R+su353NLEpOe0ReA2ykjVS+CJWUof0tCUaIRhq4Zko?=
 =?us-ascii?Q?HtVgyASaq6FFp1EA2OuyphCgXFvb8mcc6B/cRDUNX6nIt2KEDlK34vHydbgg?=
 =?us-ascii?Q?Ku60CNAlmkBGQ7DweDBaCYYNbD1nCoLqKzyiVUpguA7rzBCxPZXvvoHNhUjn?=
 =?us-ascii?Q?Sm6qvWRTfifdoHN8QD7tbZZ07qfSd0j82v4OBw88TMV+VOka/GtXVcgxP6+U?=
 =?us-ascii?Q?IpLqf3TO6HyjMoQvMW8fYqNcbaJrooYskWn8eWfqnNCWtDG+3EvKu9H/uspC?=
 =?us-ascii?Q?ZJ6pgTePeCfIJPuldOCfva3rplH9Piih8DSSlba2dv+ZohaweA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lPQwqxXrJRIayKkGUzwbFXC1Yl2AK9knx+8kbGQo7aXwv68oVBPtxbycYRni?=
 =?us-ascii?Q?hEwOjFhcTdBDmzVQwrnNFJZhrqeyODIL6NIg45kTm2cIlwpAzmYm9qV4Zyhp?=
 =?us-ascii?Q?HpfCiaTwk5pYo+tTcdpQkfi0zW95yOzosn/4mO8+OS0T/+VtsM9qDZbfdYUs?=
 =?us-ascii?Q?FoCjGaZgucifVqPHpfLp7M/Hox56Y1/FGhbkinED8NBdgkCUp/MhoLtx4DXw?=
 =?us-ascii?Q?SVhgKZ/1ff0qwBU9A+y7bCP1f5Y7dzv1Kzqn8A3WgvwpP143y91uPPcQQjg9?=
 =?us-ascii?Q?hnoeKEz4jX9OtQMw33HUN1+aDn2raKSSKDu9yx32jTtJee9NQZNG+7KFdF8X?=
 =?us-ascii?Q?x/24SOEUqzbBLqRkKGVqvcBHaPl56bQRuDl118d9IvOE7dGF8C6t7Rfzw2hF?=
 =?us-ascii?Q?59GkBD3uJa/Ao5O/BYGKvbn7BJ4GwGAX5qBLuZ1IlMfzmBcjucSFKB7C/PTe?=
 =?us-ascii?Q?TN80gbsk97FAAh4ifa4RUBkEuXgOAYtKpqt9+FFNc1j73tukeGtJacsj2CYJ?=
 =?us-ascii?Q?U2TPC1Dp0O7tEuR9+1C4Ad0WnAMxduLVNWRrwEmEtX8v4PISR4nhneMcBe3Q?=
 =?us-ascii?Q?3kK5v89cIpYS0kfPWdJubWkL6G4zzManIPAKlyWwxQu1K4FHSFL7v0zNOpem?=
 =?us-ascii?Q?5QT9FBSx/VRdA64NbZbrboJpULzTlQ/AR35CGoThyxe3/pNOUsbq7Anr0nOn?=
 =?us-ascii?Q?8lpwM1UZ2Yhx1eXZesRjll8QNat2gUx+Bc13eeSatDjyiRIt2X7RBQ8VjNUH?=
 =?us-ascii?Q?KekCJ3YCDY3xP+0n/UiqfHP5X+3cXuaocO27nILmUagA1JCdP00L5uiQdF3+?=
 =?us-ascii?Q?CIXOFilbJvajM33vJqxYI1mivgncR4sVzK132U3e4Y7tJ+SKoCNzrVslv9et?=
 =?us-ascii?Q?EO0pqhKcOGYoau0HjqjK190uGqwvMImh0lV/trF0vRCESUihsSGLPG78gQTl?=
 =?us-ascii?Q?9r8HlvAZh8U14FExcbqpMlGo956ZTyBAHFcrv7cqDKoG8vS0v6yQjvuAeeRH?=
 =?us-ascii?Q?neEg6+NE1O901DqUyyRoYBWqxoUKkldsMhoDEHM6sXfW3Xm/Y3/4z+mt4MHw?=
 =?us-ascii?Q?QBiJ9zSrKFYCovRWQ5UscRVkd/BLFiv4NY25ahyFp913XcT/7xBycXXKeL01?=
 =?us-ascii?Q?6u4dnqN65SDuEMA7GEUEEf3jXVrN7HAcdXtQIGgKFZzfAcey8ZIkoIAARXtt?=
 =?us-ascii?Q?5vccCLRBvW5UgBMdAqjh6KFFz65fKC/qoSp4Vm7dwyXkNRb3eCLvg2dk0XeG?=
 =?us-ascii?Q?qJJPHeHt+mf32uHQ1Xf5RlPFS6UP7yoEDp4x6ZNXU5zRnhHxbXSPY/YMpdwF?=
 =?us-ascii?Q?S5JWc/He1dwuqvBQiNphfi0chvzNMLg1dvykTc1a5GI7QFeGZ12kRh8alS+M?=
 =?us-ascii?Q?UQZZFA9zt1IC7CdNGu4JAdm3R3hoOZPnvQ7NNXV+4uZOjAVpn899TG7usV6N?=
 =?us-ascii?Q?C7tOTdaOVajSLuKyKpMkPgT9ynR1YMaoPNmlQ3bRmJaYHsWFCLgswxFqy8j1?=
 =?us-ascii?Q?Yt7zI6MdAe5J6f0nAw+3YGP0wA7cH+0hwV5PKQUvOmHYrOT0DAzYObBfwls+?=
 =?us-ascii?Q?Yf7GW2fplYk/Vt5riTjmHCjUYXvT39gQZTvtTPQiUhUJ8xtahiig89CI/j9w?=
 =?us-ascii?Q?0w=3D=3D?=
Content-ID: <40EA9F884BE15148A57A6443AE72AD18@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PRClhHBOspa9mh44xoMPlrnQg11FX3Hoa5jPtrYCgokpW0i96BZmG7YqfRWQHOOCr6z1AuJ/oOKCG5Zcl9g2GwwYHEDs77KQ4P1A9IfMilRgeiQ2Ttkk1H3SRuFvwGruNhfPeHDS7c+oGHaOjZsTJhZUonUi1YK1shJswqbBaAH3kZag0Rq5Py9l4mNHFFIA/iOQaL3Cpf+9pvdX2eYkK0PqkK3KgnPAK+rKhYhUcQ+oMPdF9l2cA79cNPY03j0BN2cK8apBzw420AAwSBLd3rMe/IdHqi9/ynl5FV3SwjCyYP51yNvoOEvlZ3eph6V4bX0WyBPnDfNiDnG4a+UZyIzpP5ASpwmSV76sXJD2RUUTrhmDnqZ1JDhc2Nu+tcgEJwOaARSt9oYr2F+cd613OLDT1vn5F3R11bt+Zl0G8OK7aUX4YDciB2upnzuwEGqWe9QTip9dGzFd5UFPAjrx0QTMEq72WAgUnfNwJ9mbV5mSmxjfoGMPQq6Qk+TmcjRC7Vup2t2STSG0ILWk52zvLGZyTRZvW3TWPWtyswpBJwZRxXFsNadi2mWDgPNrK0J19NneC2CbhMdYc9YeHBIDV600mCIhssFn968XfXunztu/q/fxavHEoLkwM8OGBOF/
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62feccf4-d066-44dc-5b4d-08dd41192701
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 10:30:44.0770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkmq6lt4qyLXGwjCFZloiU3Ev47lWdQyXkRZJZfRiacPRc0u6GOfFq+1L+wbBl3/U72yWbSsGzts00P7LO/hhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6284
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1738233476; x=1769769476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=IuDJnnts4S26Q+DJ4DurXQV+CT0HpoRIe3PV8LbCGKo=;
 b=CX+HKlvSRo10ReAr1GZcJA5Nn81nbnQjJ8/C6RT7e2eB6Va9Kq1r6RGv
 BjvQDZUaN0DlUGfLPFXrbFOZwh92r8dBk4Ms4JYHaGqluUDHMcXohiGOf
 FFVQwtoD3ctOA3OIbL8ZPTZdRo+1MDm1ntOHdccp6h28mwlX/cTffRcDj
 tuaXtPJcuZ+2WkgEjBEksqg30IWTwkubNwYenxw2usHsJSKXL5uYn+F4n
 dzeCEqC3aiHDxB67o19eLe1gHqu2vGYHBm5vcVn05SaqdBde5OghRELWo
 /hL6wtMvGaoKzM/rc3IZLWQpY6/00PE5HBBetE28RjQh8OdetvE/MtTfQ
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuZYLI9/NmykR6c/3Upn+F3eopG4ykEOGP0VCW1crxc=;
 b=EyMyM9Sl1UeMVE+0GW3jkBib+ZRQuQIn+VxCIzuOuHS9axt7ZR/zjvIYFW4X/aoFfw09GYAa6UUi6URYDgasmJL0wDjoQsgcO95UtkjZNEakq+mwp9ad1ZnMg9nPj03S2UelFdKNdVEPycHbJtbHRk2dOT/h1cl2fqELAfv1us8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=CX+HKlvS; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=EyMyM9Sl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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

Hello Romain,

On Wed, Jan 29, 2025 at 11:10:31AM +0100, Romain Naour via buildroot wrote:
> 
> AFAIK, the current BR2_LINUX_KERNEL_CUSTOM_DTS_PATH option doesn't seems to take
> into account any external devicetree overlay files (dtso).
> 
> I've send a new version of this patch (but dtso are not supported):
> 
> https://lore.kernel.org/buildroot/20250129095716.2511434-1-romain.naour@smile.fr/T/#t
> 
> > 
> > Would something like that be interesting for Buildroot, whether as a
> > generic DTB build package or infrastructure?
> 
> While reviewing this patch, I had to take a look at how to build a dtb file
> outside of the kernel build infrastructure (like Yocto does) but it's not easy.
> Actually we are happy to keep this build process hidden in the kernel Makefiles.
> 
> Since the next Buildroot meeting is next week, this is probably a topic we can
> discuss. Feel free to send a patch (even a draft).

The patch series that you link to above only cater to out-of-tree device
trees.

I've send a patch for in-tree device tree overlays (.dtso) that has been
ignored:
https://lore.kernel.org/buildroot/Z2VBjTBKUkn9Mehr@ryzen/T/#u

If there is a Buildroot meeting next week, perhaps you could be nice to
bring up the use case of in-tree device tree overlays (.dtso).

I would be nice if either:
1) My patch is merged.
2) Some other patch that adds support for in-tree device tree overlays
   (.dtso) gets accepted.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
