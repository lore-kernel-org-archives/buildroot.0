Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC4E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 331F56077D;
	Thu,  2 Jan 2025 11:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g-o6T3yi1-X; Thu,  2 Jan 2025 11:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B3860782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B3860782;
	Thu,  2 Jan 2025 11:49:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F8BF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1E03403F8
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff6Bf8fRTgvJ for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=0904f608e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE3B8400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE3B8400DA
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE3B8400DA
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:49:00 +0000 (UTC)
X-CSE-ConnectionGUID: 4vHH59/oR1KE4eytrX692g==
X-CSE-MsgGUID: b7EhEZYtTn2njKvu3zgoKg==
X-IronPort-AV: E=Sophos;i="6.12,285,1728921600"; d="scan'208";a="36229866"
Received: from mail-centralusazlp17011024.outbound.protection.outlook.com
 (HELO DM5PR21CU001.outbound.protection.outlook.com) ([40.93.13.24])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jan 2025 19:48:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaSncCU9PCPiw30OGS36YGt3+vekb8/tdp6x6kc8mTxs4uea/H3o03dfSNjuVjuC47AsF1wdV8828yYcFpUG36jX1vbOZ+mzqg0joZMir3iBuW8QtqrLH8pDRsN0LdyE79JrU15cv9hY3sOZwaT6vJ+mqWyex9Ymf+2MOqr0Xhs41R387yHHBvN9qZFL9B+sDtwktP1upvP294IaNIUaXVSoNArty9ocE531isfkRwvQKl7FRlbnmssmioisgK6MkdWFw+aZJjCjwglc2rcVqA9uk4Xc6Bjl21Z2pqgc4SnqSNcputYWhB5iLxFVgyjToMZJayLnfF9NSb+roO70OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=yoG4C4KYAyYliP4U9f67wryxcK1NV3Iip2FuZZoReGz2Ap2I1nlV31U7maWBw/rx5AX9cMrA5uEOB2835XDX1S+RuURAay19IY8xfUBwnhxXcAaa4xbXcO0FlGyPVyKo2y7h2wy1ylT/zie2mN4AWN/bXLoza1n3ubVKIa9o2wNei1oLgIWSkNWd+vm+3Fg26Zy6V8lazR4IlhsXY1qNHtF0+BbzNE3Lg/8etDFGu+I13jwpN0+pyT/64pSV+vCNfaBlRPI38vDo72amJll6XMaTkZihNZwuMC3sVptVXcW8BarfX4BnLab/VocefGxFtuDCkbUZuBMkOxGvTku2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA0PR04MB7403.namprd04.prod.outlook.com (2603:10b6:806:e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 11:48:51 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%4]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 11:48:51 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>, Michael Walle <michael@walle.cc>, Niklas
 Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
Thread-Index: AQHbTTn1efpR2iFQaEi1SL/lHYjlVbLu8xyAgBSLBYA=
Date: Thu, 2 Jan 2025 11:48:51 +0000
Message-ID: <Z3Z9I9BSRBS9dIxV@ryzen>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <Z2VBjTBKUkn9Mehr@ryzen>
In-Reply-To: <Z2VBjTBKUkn9Mehr@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA0PR04MB7403:EE_
x-ms-office365-filtering-correlation-id: df6a7560-14c3-4508-497d-08dd2b236d83
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HdgKQ/u11S7MmO5xK7tsQebuhQ/28MWM8I2AaGZAx0AjWYq/GWKaSvxmEAS9?=
 =?us-ascii?Q?Vm1/jx6RE+L87vssR1GYyk+IIc3jjYZaQ+dL9JjVNQkLM5wV+cFDrPVtG+vt?=
 =?us-ascii?Q?dhgiQujX2hHK8jjypTfOHxWjq6m2kXzkJPMxK3J6tSrEOSj4Z+QCF/Hkd6r7?=
 =?us-ascii?Q?VTtXrvZ49whXr5Kbd6OUi5Z64IXmLKm0xCqd5fUhBqUSonkkdkaZbbPVipOo?=
 =?us-ascii?Q?pPuZHCr4aCkSvo+73WAxjiS38U6TcNGhckkshVKakNah78dNRWNsqoMf5Cnv?=
 =?us-ascii?Q?nuSEIvVDsQNwQsWj+tWgTi6oxx/Nc07Asfo6cRj8XN/jwXPN6JU4KzeY5OeU?=
 =?us-ascii?Q?67A3+HWnxmbXHmHKk5FttZv1aPCJNx8vz07Vz/RdOqmJdLwHScNwpzoRPgQ3?=
 =?us-ascii?Q?DBP/j/ByIOvWtvz9InZZw+OXnhPJUh0Dq1vOgJzkPYSkdlSOiU9qHHBdbpk3?=
 =?us-ascii?Q?3tOM4fXXj8d85Bu5Z1YvY5NaZlO6mOig2fPrniVGQ67iOy78PsR+rwMrRVLr?=
 =?us-ascii?Q?DV0mOEn/0kjgx6bQbV3hUAlu6aDaPde4WiTRxK/0TcFPJX+8AQ6OVBveFpV5?=
 =?us-ascii?Q?etVO8OX3zdBVzjqIODPIGg9+6jj9+AxtPGIRWkjo6nNkuI8GfwY+/6170hxA?=
 =?us-ascii?Q?BXVUavMUpJu17dp/sU9K3E1Jmz/ii5ow/Z43jYpvhv3B1Q8Eg7iiv3lVHtKC?=
 =?us-ascii?Q?5zX5hCL6uojrenmadNA9LoYcjM31/pabsl6EA3FB1gtvAvGLYjtarly2kp13?=
 =?us-ascii?Q?wtKWFZmSM9HEgGpnBtDXL4Tu4OvSLesTECxntbvdEXSU3V/bWvrMm1SOWoyj?=
 =?us-ascii?Q?Xx6x9JZ/JCjjEvCwr1htpqViLIyf/GRq1uJ7O2paOX6tbuAkA5rDl0Qjr0kZ?=
 =?us-ascii?Q?Cbsoa5faiAjdXtOL7sBsaWWhFOl/4b7eQpOBUv8zUIhCKD4j/5wwIZTVIGBU?=
 =?us-ascii?Q?al4THZuUp/SZ86LokofbmfY/OL3av3R70A/3Pll6+vEWbg8q+VfYuf3VLkMT?=
 =?us-ascii?Q?8WQQBHb/Y8zKm6HYodv6jPb+jJR1fJCxxyp1gyZ/snKAyj64C659PfVNMAMg?=
 =?us-ascii?Q?jXd5ZqYycEjYICva2D0u94KH3CYoDaLkJewJu0EnkcEc/XoGB/j90G9OGREZ?=
 =?us-ascii?Q?IPiGmJeRhMdyFy3trsoE+6DNPjRUbp3CIfJTcOcH6jv/JdJ2NKr8Js0GEij0?=
 =?us-ascii?Q?lbb7hKvEr4mmVvwdWGl426ANaQ7+c9ZsVYnB/GoFnceuXDzchJK9GNusKwp3?=
 =?us-ascii?Q?sC8FsQzwrJMizSC7MMx4xymWVvcE85mBJrdkYNZp5IgM4XQL6iWfosMof9h7?=
 =?us-ascii?Q?A6z0NHZV84PEVdCfUgDyPS5ej0HAp8cUBzgBPobPMvWpYPwYa2RUfIeB7OE0?=
 =?us-ascii?Q?yCeTdvM5i2xqHK0Jr2dl3HWsLuwmyPmZpox4YuJRTKT5U4iRD68q3zr39mUp?=
 =?us-ascii?Q?MSr8FYpOsuFP/dNCoBKNJ1FqLUumdTxf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/8yaYuvIGVFmjrtY/L9hm1gsUqAZ/aacwcBXDLCYx4WTkPDiiGyBaNLJEKSi?=
 =?us-ascii?Q?XevR0UKfETIwPCi2JZLXp8XyqvdRU3zKSqASsCTLioc0FiCVFC1wpHuF6wPf?=
 =?us-ascii?Q?lOFf9jAptSI61aPJSgfEAFdXJlG30vmEy65YDcbrynnRT2piYxyw8T1g44oP?=
 =?us-ascii?Q?3E4cvVHf2wvuUb0PG5Qshjtk85WeR3HAg9kTwjuAm4ZP82EwbNi9XcKG9OPs?=
 =?us-ascii?Q?HmIpUROTrVJZWwGT/U4sjCDqCm+TAVUcTwVRgZ6njGO7mA35sQcQrY/HC18u?=
 =?us-ascii?Q?IchoPUFpnzLicpATYPTDgxEkvsufglKEzP/dOK4lK/iWoLeh4rsykrUQdlpb?=
 =?us-ascii?Q?TB2O5qgQKQMtWzBtRPUlLjI0fAWlL8UGrbpi35Wc7fLgnC+tC6J5dlFZetJE?=
 =?us-ascii?Q?V5nLfXGsGFaHHKrXU5dSkHWENHUXj48zqhjfp8t93qGJAII8tnn5ajC14o8k?=
 =?us-ascii?Q?8Bd42tB91Yu05cJtgXwa6qDMLLcJt7MtDfaor7RypS4mTuJyPuiPMCGX4gmL?=
 =?us-ascii?Q?6mnzAuUZ6BuXjD6bF29x4FibhgLkssAb6kvGwLhiue+D4qs1SdH72x5+gkCX?=
 =?us-ascii?Q?oUdFyFs+Xiq7MxkCUjtlK9IKt4N6hdnD0xx6U7VpFsjzjVLE6njz6aXtvxE3?=
 =?us-ascii?Q?3a6UBaLlSTy5njoA2YAoqtXm6iHavITF0q8IQ5//SG5upDpJOulmUT34EHzT?=
 =?us-ascii?Q?hqOsqzF8E14Xkhw2j887o6R3XNXOyVeXWhHNk46qp6VLuIBArZnJJYgjxE4u?=
 =?us-ascii?Q?eb9iSvz5nQc4K3GcePzGs1wenJMeszZnyOY1jV7xsGRPOR3/owd1NCOhNIbF?=
 =?us-ascii?Q?iH71p71Bf4bapRLyacLnU0aVBDa8o7wxUOTAjpnFzs1MqAC17HNb6BBV2UvM?=
 =?us-ascii?Q?/6puwJW3Pl77tESnm5DAJd6IF0tUBbqBUhGVAPw3UlzXx6gw5x4nFU92u1dh?=
 =?us-ascii?Q?CkFLazLnJDq+33PWSDP24vEtSYMO5Ns/7KE3u6G8u3UHNDCvP0+mUHKbhPtq?=
 =?us-ascii?Q?Geh3uneJbYH6DVWcQ3OAH8mRH02YE8XYzQjtA1cryiZFHEE/yCeFn1F3aOqw?=
 =?us-ascii?Q?18OLSw6xX8gZbeld5tAEvQvHL1xQG2GAB8dZMKMo3YcTBGCTq2VQDgjiPm21?=
 =?us-ascii?Q?Rw7EH+pklnNINcSrXqjgTbUqoiwbkJonh6aOsHIg2+M34zkGVtWo78u4hYVp?=
 =?us-ascii?Q?OP3oMQ03oXNm9SnPQaNoBfAQV1Inxu9szb8Wa1yi1SHkfUrdu4rI1toKmY8e?=
 =?us-ascii?Q?JPYVs8CTLYYOHW+XvaszJW5Ml4fRTdydVc1QgVtwkRY1/fPk+5Xdbts74sZj?=
 =?us-ascii?Q?/twhWrsKLt22KkiBmMJ0i+NWmippXodEs8Cg+/jLOW0Nwy/hlfNvtS1wXILR?=
 =?us-ascii?Q?A36lrQ4kFogwCU4k3Zn/cGu+2GdDmpe9zq4ywxbDbOddjPmqSusG2HRyaXMy?=
 =?us-ascii?Q?/hoOFmK53FRbhsKbreSbgsPB2NjkGLErL/G31bs6yQrMQcT5WoA6AGRlWifY?=
 =?us-ascii?Q?RSGd9kBMN7nqZZrRi0+jWvm27l8OwG3e5aGG+sItPXN0fFZAqyu8f+ZqBJr9?=
 =?us-ascii?Q?H/+T/FYLeD2EVZZhtTNgqi54wGhmryLbQFV6+PSLY/Aowixd7CLoGOwm/WDm?=
 =?us-ascii?Q?4g=3D=3D?=
Content-ID: <DFFF587CE0137E4B899D8A5CA1072E25@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OfpktwEp7G6NPhIMzurehGjC0yGcByjtBaeuTvxZEHx+n+Qh1ReXiLkhDnajnrytBBs+cnt610tB40H+Z/cin5L5cB29RlEQTEXMtFMhvMwrv4JhAq8m7GX2PQ9027gFrioq0bHI14Btzhx4GcgNC4j58oFVAWEQYrCvy9PK0axclqU1PkCARUOd4WqvMyOO6cmsfPEnJuou+YKyfBFVcZRgkJmR5dJu5z1sAzUTDKaw3mByiY01m+hsUejGm5bInI9lR0V8MQyMf1WKBPK8+vDx/avsMIvEZ54pc6PRHjiWgokyBHkTQtPgSIPQkHnMTxH5aeu9Bf7NqLQ9cq2QWjK90sLjE9EUW9uQk+6s3wn5eakzOTGFm8gHKtDIz5jmm0p26k59ALyJM94x6kRtq3s8T5x3nilYZFuuq/ypusWUERG98XKv0DKTIyIgasPyxanSTQGSvg4i8tTHG0tdWJjiY7VNbvQ6j/8qO/asv6s/RdkVXf90q7+Istls7QQCcPoy9HZIa5Ke8AkT7lggS0HJ5mySxor0HmMKwtfkUXAUXJPIGl9BK219F+JH+syMQzcw/muL6jP/0ksuvLmEDCrwlmyybm4LTspHa7PfvEHYWovB9ZhhC3as9J+4qrCe
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6a7560-14c3-4508-497d-08dd2b236d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 11:48:51.7470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCS3gz+wW8+V6qLsIrFl/tmEGHIKtELg5x8kKORWAFsRVO26b0b3bWFF5bp/8Zh/gAUkjPyMUyMr0lkULsdpgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7403
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1735818540; x=1767354540;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=VjXYc1xSJFKS9QLi7QrPAn4BzYJ4fIM/XtmGNecPQSx/NxYgAAtWqEkm
 qn8BRvdYWXDJsWNzcr0uJSWGyqVka+eYQb11Pa4B6tVe1dqzH/s2qkkTp
 ughm0Ktizt6AjGI6C+CnjuZdxG/AI6VvOkvJkhKbm7nlVCN97IonkNqmQ
 xifk6Bnfujim4fa0tXbZ0UyPU+OYSvYtjysXPzTpK7S/F23u9M+/RdBYA
 zyNdUcuxdq93GiGBIgt3i1Tdu5SU+iC9ceDktnzeGa4SQjWOWikluV53g
 AKeyERDAyMQ4Jbgu7ENAhLGia6ABRxo1Q6C3H32OP/1thwZJ+j0sgN4m0
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=UmVRbOLJiALtyoiSRralETt/vjVONNp03CuzUEX9/THvfrn+TklC1PFay0/KcKDArEElgmymg8JI5aRL82szB1CsMER1c4gXG/uEL6F1JQrMYGsYSivBW+UL5ZO61vh6jRnznseS7jUpYlNF1EqysjDTjoqutlx6PPCileCrlUg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=VjXYc1xS; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=UmVRbOLJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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

Hello Thomas,

Any chance of this series getting picked up?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
