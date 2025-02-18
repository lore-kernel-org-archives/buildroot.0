Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B2DC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 10:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F0F82EB6;
	Tue, 18 Feb 2025 10:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cse2LvTe8Rcd; Tue, 18 Feb 2025 10:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B83A482B34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83A482B34;
	Tue, 18 Feb 2025 10:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A86BE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE6D60754
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaT9LbAo6zMw for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 10:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=137393274=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FBD76059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBD76059E
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FBD76059E
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:20 +0000 (UTC)
X-CSE-ConnectionGUID: zdOOLU4SRUSKZm/SmjJ9Qw==
X-CSE-MsgGUID: 3uob3yiXQYKwlM8dN54jHQ==
X-IronPort-AV: E=Sophos;i="6.13,295,1732550400"; d="scan'208";a="40014547"
Received: from mail-westusazlp17013076.outbound.protection.outlook.com (HELO
 SJ2PR03CU002.outbound.protection.outlook.com) ([40.93.1.76])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2025 18:48:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZNmjHK4AfhX8VXIg8tWqKDAuh+lw/zZ6MwpdNP8a6QOEERLXuYddeKKflGkN+U15vPJYQmJKhcIJm4xXhpMTFRaXvdYfAiTRUPrn+OGC16m3q8Hmro74w8+coyEXjChhwkjcm/245gjwV2kgrI8qVikA8dCQa+zPTX5U0u0XpXkt079FcwkjkB/jvMBCXhJYtkkyLEKTSwJfS6djtgK3Iw7Vj/dQs48zg8kIM4Gjbvy/dikCf6lpzIy+ce4GTEthIxfrRQRqnBIKdMr49034eVCqOPTrXLE5pQ2g+xNH52xEzZBtEumGY3xVrh8a/wswgJ0+L0THq++qT/+gpcwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUtZA+bgFueCCA9HZHNhgTjGiDpYakUfu6rGFmULngI=;
 b=COPuhd55qv6sQXgM3CvIsz9AqmwMXWcS2pdYpwAS0wX4TiKWZxKHwAs7rfqIB1m4Jk2jsfG5tVabp8x4I8LGtlI6dRRBFrpVopWm9H32ImYcs3dHFxQ9soThk23sjM0yMp4KjL3TjT7T8XPMv9NBGeN5GTYw0jhpZONMUVEQKn7gOfxKKMZQBlbq5HjQz0r0nXd56jMgAyVqD2iZ0Hq/M5smym5hNZucp7uxeEnhZ6KYJt+yi8QUbEPZu3+JwHFCQUjbTW44cblbK0ku2+Z9hyXoROE2iI2pDX/GXewa5Okdrg65QbCz0LzXQOGEg6CO0k5eBfMEWaySWawqyUF5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB7247.namprd04.prod.outlook.com (2603:10b6:a03:29e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 18 Feb
 2025 10:48:17 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 10:48:16 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Yann E .
 MORIN" <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH 1/2] package/linux-tools: perf: Fix _BIN_ARCH_EXCLUDE
Thread-Index: AQHbgfKd+HnhM9TeK0CK3zJVMv5KAQ==
Date: Tue, 18 Feb 2025 10:48:16 +0000
Message-ID: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.48.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB7247:EE_
x-ms-office365-filtering-correlation-id: 2053f933-99d9-4e9a-33e8-08dd5009c060
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?+V69XmiLsK0QrK+b5fuy5M+ErS9WeaAiJDDFiRao86rxB1oRGwHGaM63lQ?=
 =?iso-8859-1?Q?4jpEkCuIuJuYoqJI6PJz0xS/JOYZ4EyW9GbQnFB0ZGcGbrdvoZxuNNHgQc?=
 =?iso-8859-1?Q?EemsauwOagWQFyPSCsOpTXAxKufokUbAeZt8i65RYnlURvPGnZfjWBoRZ4?=
 =?iso-8859-1?Q?LSxdkEvPLxf0zxIVA51GysAecnUgujZvcQS6LveS/P6Q+o1IyCu9Lz59du?=
 =?iso-8859-1?Q?7yOI7cSlgLmwGQ2zTfgdI3gSCQQqyATsVSMSYgT8xJ/X/UBucL8e3UF3Jp?=
 =?iso-8859-1?Q?YT54lCSYA5waibu90Ab41rmkwVdSHqBgI3HcCJbWcyqpXtIVZc4pVaxehm?=
 =?iso-8859-1?Q?rAHmTG30cfAO9MBE/j3ccsUls/bYPi6HkkR0NNBfLAfR9NRTr7R5xeMv4i?=
 =?iso-8859-1?Q?Hn+M6mCbE1/GW33c9T23YOhb1/I75a8/a+mT9IY0Ig8IJrXfldJhuafOj+?=
 =?iso-8859-1?Q?CDLPCuFamtFJ3NFdikzuhJ5i0qWL3rjjBIe87R6NGXrnYf8yFrFVwoAgdd?=
 =?iso-8859-1?Q?xBgoPJEhoNB2tMqPRNGWyXehQwl3F7PVIndWooAap8noVModBpeCS6waJj?=
 =?iso-8859-1?Q?+kusB0mYmpZB68ATab4on6Qy2WMcxE6n1tDfXlJy8RQ2g8Gvv+gu1hbbVB?=
 =?iso-8859-1?Q?4SW891mrvesRMGyHDTSq+P+WhPf612fOouZZ7RfLnCARuds5hbIZ4q7mEW?=
 =?iso-8859-1?Q?1m60NnAj7x+1+nD1UXLuKntpNQOd+mXDzQD0dbO5agg9jpnh07Yi5hTGxg?=
 =?iso-8859-1?Q?MgOXuJguLSnygL43ii3NZus0OAA57kOGmvyhxse6drclI9JPEYcPHYABom?=
 =?iso-8859-1?Q?TIWQkcju1EbiBX5JKYxaI4rBRtKtJy/2zLd+k3aRtZ6jO7G+yyx4BGyeho?=
 =?iso-8859-1?Q?gkj6vYwjvumWQeJJevCWOMrVTqX8SWCMwOhmJ+Z7ZP8fPbs6g3MhBMm2CZ?=
 =?iso-8859-1?Q?OLoKW0AChUcRJ8SNc03rWv3+DIL+gbOGcyYIXX6wrZkjY2XyV/rQpwCI8t?=
 =?iso-8859-1?Q?4U/En20yVeRGxLFvCxethhyiEogJcm7yMFmMJEtK+NcIuYSt1JpdDz6298?=
 =?iso-8859-1?Q?Ze316sPX2gZ8SPmK292rMuX2t6eALCbd/gOqW16riUSSsAQQkXlO04lWQS?=
 =?iso-8859-1?Q?V5SjFpQrDrzr2xI6xYZocJpDbFrW2xeyFL5ytlDXd9twWq+BdkdbcBb9G3?=
 =?iso-8859-1?Q?ULms6gN1fvTzp82hYMWQkS5MSEJIJsdhADfqW8zQstR7Bwqgk6SJBOZYy9?=
 =?iso-8859-1?Q?hrEk54QP8eOJ5GmlRWID+CiH3nbi9U27q2GAowVJamJdQhe4hOoaxPsF/X?=
 =?iso-8859-1?Q?juyOSKP2WiwL1X+rcCZUhoeSVKrc3OOM5S9k8aOxRqmDYw6aU8kp09lbOm?=
 =?iso-8859-1?Q?TJAYnd7+L2PoUCJy0HvQjPUZQ658DbcQ1FmaATFW+OXCeSh40Zlqg3RoRP?=
 =?iso-8859-1?Q?xfZhw2p/FKyL9M1nB9XSx4Ww+DeSuUbgLt7bSnBFEXm7l4kukKN3EmL1UW?=
 =?iso-8859-1?Q?nRiSBzWXS8rowWvYm8H/kKj5NpJ9OTKS9uEbx4yvzw2Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VYrOtVLfDdOa/lMHNh9eTFaDGj2QOQDBngOulkajNLiSfF36vRcuejPDwR?=
 =?iso-8859-1?Q?CQckeYwd+XmqZ9WRM69b/WR4auGBcUcfceoGtS6PMVeT7TjoljYrwYP0i+?=
 =?iso-8859-1?Q?fwDE3ZI9CZWMg/hJQhKuDYXVTvwIIUFEPWlSUtAkVBIaG+8NynpZ+AnfIO?=
 =?iso-8859-1?Q?y3bD+BkrdxOdQ31mVvjHoCm7gdB/uI7jx3tPA6+0fuvxEBeGh8kDaldmVc?=
 =?iso-8859-1?Q?6WeEPfW35WdFnODFPPLfcidHjCiFPnWpw36i+PZk4hsMIIOQSdeA0W119O?=
 =?iso-8859-1?Q?fTmdOXER1GHQaJt0vSb/bnzsBPY7/QqwIyoCBmddIAN0YK6mQO71OOSYJF?=
 =?iso-8859-1?Q?82SDaga6I011Yfzbo5YYtZDk9eVS4vh4NY75SN2AvTyKJY+2sMHXhVs0WV?=
 =?iso-8859-1?Q?h5KFRGLVFVzNRTGDpZibuVcAlHqTAfhnhG20S9pvbrLiGO+TZ1vbNGlNwm?=
 =?iso-8859-1?Q?9DUl6q65GGbnVlwZUVx3JQSfyv5xUjBpbV69akPkCReXjiKWdVEsZQxAK8?=
 =?iso-8859-1?Q?0/LXjX+4MmNMYlfQF2uqsr11VvSM7nZ2cpeXrMv0i7QOQOf3EvVcSY4g0B?=
 =?iso-8859-1?Q?8Of7/2RdUtHDVWkWR/c8cHRpkxsOpri08mBWf0Y2rj7tAOrHto6hwE4RFA?=
 =?iso-8859-1?Q?MMErgwJCWMwF1oJHoHXi3X740U3j7XTIl9Fa3y68sWQn03WboxbpfchtET?=
 =?iso-8859-1?Q?cTOSsLXENZjir7+9m2RAuoLX3KPY739xbDkVI8VDZ2wb9txGtg0IHK/yEz?=
 =?iso-8859-1?Q?K3EeezD0YQS7yjuy/GK5Ot7fkjKcSed5DRisnG8dw+l4H8BSByDGbJQWt3?=
 =?iso-8859-1?Q?08x0NosoSUqVsx0erUDc/5J8g8nJV23H8ucKUQQVRhK3osNcJxa8xYmi/q?=
 =?iso-8859-1?Q?THwU7PDVHfc9EkpZIPnKH8KoWrAdYhqClk2VaDN6e1LfigSgO+/7htFPUA?=
 =?iso-8859-1?Q?PjFJ2gvhmYgrfu1Vd4SmQZUeUOH5jDQ8WnXFQRU+keBEMOZxwjE5W32uhQ?=
 =?iso-8859-1?Q?O1JVWs9GDNObMIP+BBLykmrYRvfZc1ih5ElfZEWhy/+PGa9XcTRgl7+bSh?=
 =?iso-8859-1?Q?WQVbgTIZ+fCdFFpG1sP1XbfYvT4KgvbB3JFdqMjAAxjUwBDR9IlerF2Gvp?=
 =?iso-8859-1?Q?YM7XgpTmRgCh1p6sEnkGmiIxzJaf+iiJWVrUnqxBsZpUGRgO0wjFmPtNeh?=
 =?iso-8859-1?Q?Jv7EAyaVsxNZvfFaVeXou6O0Ook2T4kIZEctoMg6seke26r6eogd/zCEsA?=
 =?iso-8859-1?Q?by/47IO6wgPksHivA/vVPuO/iwfza33XO4WfmXE2oo40STxPX8V43EPy1e?=
 =?iso-8859-1?Q?fGZ6MmEu/a+7RdhtuLGljn81xfg+hRYdhZVp8zNL9weAf2cZdaJ6nsmWPI?=
 =?iso-8859-1?Q?st+vhFjj1j+7YdA+nX6zjvb3rPz+nJJbDyyfSURIYK32s7oYoKYyqbCW9n?=
 =?iso-8859-1?Q?CBr3mrZpc5AC9FyL/pr3wfAOdOOsR6SdlWRzyfuQzQA2Sh26yYgRIxxeTH?=
 =?iso-8859-1?Q?7NYlWIAnyPRqt+jWSJTCE5vRbc6Q5Wqx2XVy7eayYaXUb1I0lSMHyW8dtZ?=
 =?iso-8859-1?Q?UzseE35CtDUDGuzgAQUPTsS9Jj1MNWWuyfIwyl1Taqy5lSlYq9qeTOYuH3?=
 =?iso-8859-1?Q?7Sf5hPNpAlzS/jRNqKi05y2xPjhcWLBmOjvhcCQjHKyvjIkQo2YgkDAw?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fN1av8JM5EUemcwXPw9YEBBlZq+9QbgxZGedqdILdQ6/BodfVgIBsq0JLGN3kmYMY2gyAFHG6rny0+5r7mGX8F0PklyZKsm1qe9ULYdF2kzs6d/WYWAZcg2BGLMxLix9itqqqH/hhof1sUl6y2aLvWIQw+LqY9WvuNU3u1f5zcHgVFsf73QIuxc5GlAGCgpvCXIghVj7xhect2AaAvptxB4tnuIbaZaSOx/WZCaxzNo6NlNz2m9jSgKUVoa/Xu3Ag+wucnxq0F5cwL5DRWdzSFZLHzLVmtlu8BfXye6qeU7t+gIZQGuZE12qBHG/oF/Eu2HbU8yWmEoWD2Wg7b01QL0gQ5ohHTBir00HFdIUsXBcwZduB61exJqtNAhoIOREeRUW7wIqDS3hG5eIhqB0xkbfdKJp1+7wMqQkd+e7N8ZU51+RyfwMBqa5SW0Sjcc3oEvvGo61oo+l87d9pH+TOBTk7O881WHbRJCn7nkosHRkCabkC7ulMBmL8vlkmEo1TciuGN73CFOHmhAIhna0D6E/rZDsKTx/ec6wbxhYc0/B36MWeUnLg8PJFxygSTbKEwmXiGxzJ9yiBmvjz2zrL5Mg/YJZG5wpyasc6znRUhOTuvN0cuW5tnAXK4fCsFUM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2053f933-99d9-4e9a-33e8-08dd5009c060
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 10:48:16.8859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9ljSiqdWILN/Fn+Z+4T2CGO6plN1jI9FTpk5IM66r4K34y9A2GAN1m5jJOl5xInG2prc4LWmnewMcgAa3xc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739875700; x=1771411700;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9SPLrfOqfbJhEY1ZBeaWdc9OLnqup6xowkd7aZ5OZ9A=;
 b=SR+CbE/so3HMXsUN62coEQDsQXgjATspV6P8zkr6vDVTsxAjl5Wtfh5m
 FPkNzCfOc0wsXYZ2uR+ovqOgTlUt6QyUtvaaMXhmuNO70QILRjzZz2IgQ
 AMlpis5zJMYXze1fXQ7IIZ2RM4H14JXPMm9hlsa+6O2hjRKsCOlwiycPg
 GZBhWJMQYMFHThWBVeDDILjWkBKPh3g3ybIW90lZ46DvnXsgyh+SzKBxX
 g2vrGIpKBCCaTT9FeRsYDzxFbCDCHJDDNNcDv8VUY1s6lGeR50jCKaoXc
 2CWdptgCuQ96CBDjuPCOMEhUESqDc122WWZ6eAKt/XE/FfxpNFZNmoRrV
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUtZA+bgFueCCA9HZHNhgTjGiDpYakUfu6rGFmULngI=;
 b=P8e5HsKZZX4clEXfkmmXQlZMz2iUp1ZSF2ze4t7Fud/xAAvChwQZimdCAIhsj5yiUxIzQJT++gxeafjPxMrxxQnsP40R8kZGWrGtmvvbrmTKx25vvTw/OhNKcTxEkfXksWMHECfObdlOjgpq8JcPBhBqSC4V+dhTM0e8dWf4Wdo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=SR+CbE/s; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=P8e5HsKZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

support/scripts/check-bin-arch has an option -i to exclude a path
(or many paths by using -i multiple times).

This was implemented in commit 01d90f0d093f ("spport/check-bin-arch:
accept arbitrary per-package ignore paths").

Looking at this feature (which hasn't changed since being added),
we can see that check-bin-arch automatically adds a trailing slash
to all entries specified using -i.

Thus, specifying a path to a file, e.g.
"/usr/libexec/perf-core/tests/pe-file.exe" will cause check-bin-arch
to add "/usr/libexec/perf-core/tests/pe-file.exe/" to the IGNORES array.

When running the main loop, the file
"/usr/libexec/perf-core/tests/pe-file.exe" will thus not be ignored,
since it will not trigger a match the pattern that was added to the
IGNORES array ("/usr/libexec/perf-core/tests/pe-file.exe/").

This means that the -i option in check-bin-arch only supports directories
and not files.

Fix the LINUX_TOOLS_BIN_ARCH_EXCLUDE in
package/linux-tools/linux-tool-perf.mk.in to specify a directory, as the
existing LINUX_TOOLS_BIN_ARCH_EXCLUDE can never have actually worked.

Fixes: a7ad7816262d ("package/linux-tools: Exclude checking PE binaries from perf test")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index df3030439e..d67318571a 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -180,8 +180,7 @@ define PERF_INSTALL_REMOVE_SCRIPTS
 endef
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
-	/usr/libexec/perf-core/tests/pe-file.exe \
-	/usr/libexec/perf-core/tests/pe-file.exe.debug
+	/usr/libexec/perf-core/tests/
 endif
 
 define PERF_INSTALL_TARGET_CMDS
-- 
2.48.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
