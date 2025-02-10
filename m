Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32715C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 12:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6587403E0;
	Mon, 10 Feb 2025 12:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNjJqjoLx4BG; Mon, 10 Feb 2025 12:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F56B403DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F56B403DE;
	Mon, 10 Feb 2025 12:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2619DC2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 12:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0445C40AB8
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 12:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5BJPH1L16PR for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 12:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=1292f9273=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87000409FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87000409FF
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87000409FF
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 12:47:23 +0000 (UTC)
X-CSE-ConnectionGUID: JyDZkVypR5aFegxWDw3JRw==
X-CSE-MsgGUID: yXJwR6viRKGXhCT8pSeuaQ==
X-IronPort-AV: E=Sophos;i="6.13,274,1732550400"; d="scan'208";a="39290926"
Received: from mail-southcentralusazlp17011026.outbound.protection.outlook.com
 (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.14.26])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2025 20:47:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOembA6CRRN9dVrlUbpUf3csW9yUJBOX0fjLRDWJvgpUaa+S6NJokztpQP4DhamBP/pifWXxFf5S3qJjBP2pfIAZv4EpYscGmnaUKJoUU0SkhWIfBMgGdewqmJFkfYXC9gDiyFCIXbyGUNhr9p4uDv3i1CVGiqfzv8W2XeRDX1ZrNd/gIwBS0ArohBPDka2BloEedaET6KU8kwynaWno/So0fQgYnsjKUs1xvdSoMC9rA8xRjUmprQfXrmb0KsZSwNXsrxmmIpBEJ4vpL6pK2yXv/FvGwPJozmTivWzrhDrke62B+LoIajVyoPT7F+84VnW6QhyDow7Q0mq7Grfs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4c8OYMnhq1zZSmae4J46GiEJNElM62lG7OSGW3mURY=;
 b=jJDJF8XvSi9bvK7R6OS5NRLWun0/saJlcyME9WSD9bewNVjjbQAAAgQIGZDuXj3QMI0psDE9mnQybhf/ZGNZg5IZJDY+PtAOebG5n3+apwI6559vCo4kGi5XOt68plnM4TFB36MX2rwYwdlhamBCi+2SugoDICSRfnHS6m/mD7H5rPIaTDL6J7rJxvOuS3+mrTRH2wZkcaGDh9DGehYOGqzv2YxmsK+ZYR/4a9y9EHIDhEqcebOf7GqCwG84I9bkPXtZwmakRey5AxkiuVYLavgrUYZUzypUmbGgGQbfuaUWRRP0E64YJ5E5PwvWH9nzdkWSqAp4FU4Dh3w6L3bwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6375.namprd04.prod.outlook.com (2603:10b6:a03:1e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 12:47:20 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 12:47:20 +0000
To: Fiona Klute <fiona.klute@gmx.de>, Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?Ga=EBl_PORTAY?= <gael.portay+rtone@gmail.com>, Julien
 Grossholtz <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>, =?iso-8859-1?Q?Jos=E9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow non-matching
 globs for DTBs
Thread-Index: AQHbeYPmJeZLkqwz20KkKsFWC4YpwrNAgM+A
Date: Mon, 10 Feb 2025 12:47:20 +0000
Message-ID: <Z6n1V0BQyoJjbn4u@ryzen>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-3-fiona.klute@gmx.de>
In-Reply-To: <20250207171458.1127620-3-fiona.klute@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6375:EE_
x-ms-office365-filtering-correlation-id: 2632c737-bcc5-4502-2de9-08dd49d10ed1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?DYrAKcc4A+26YbhA4kNJsvri0b5ePMujvW3SEHwyBGJdXQTIsZV/gF3edC?=
 =?iso-8859-1?Q?QYtQPBf1JdxhOhUFTqniJMdmYvUTpkRJ+w1RvllT98U5koGoMTWT65j72g?=
 =?iso-8859-1?Q?C0cctX6DLXHPGLgwH+8zTMpcheCWQPp1OVdmE1k8R20k5/ovGRhtKf1I+O?=
 =?iso-8859-1?Q?VmYnhKJFkjgohPPgEvpTpfQIE3Je9ysXeGcAKCSuLQyAWhaOhTMnliNmSk?=
 =?iso-8859-1?Q?XTATARAV05si1xT7kSKSeAzQmMFs74mDQ2A/5y7RpmcNRAK9Or4ApC8VHF?=
 =?iso-8859-1?Q?5KBdY2OGKihozTY0mD1PrDaB+1M2MrouVfNRHedMScHnXNoUr118bLa1HB?=
 =?iso-8859-1?Q?03S9oJlMLHYnstont7czY05W5cN8Onx37YpUtrlDsB8nLAwr09lnQ+gCX9?=
 =?iso-8859-1?Q?1ZqjLLDdvkJeJGuTKZv9xuOF0rlsQtvkIoJDMODfQtaaw+rl64jp2WLXCL?=
 =?iso-8859-1?Q?gl+d+uYbb4ql7KyTXjtmhOfoAP/P0EUGp8AV/IjsVD6AH33vU1Pxv1ZApe?=
 =?iso-8859-1?Q?ETRngni3qfFM4CHOQa2am15J0DyyTw9qYWu7R6FRexVA0wnKMEQ0JkPFB2?=
 =?iso-8859-1?Q?D4NKgZ9UV2gtZb/aDNx9Oo8R/F5+gecKgf4O1VamGkyRIwnc6TmWTI8B5W?=
 =?iso-8859-1?Q?A1VBHdWCh9X8KnazPVF3sgdRO0+f+VRR/rKK05uC6ksJMn+tQ4NXt5gBaI?=
 =?iso-8859-1?Q?riEpko4hPUZ+voKwv/Z4MehJDhmnGkygA/RDgoHIlkmjDg5C+/GnzVjavu?=
 =?iso-8859-1?Q?yBCnAO/2P65Pm7ljDOhphMHq5zsf87dcsQ3TqdrHiJWM5yNLy6xBIkQPNw?=
 =?iso-8859-1?Q?1ZJbYmMsMjUlDlshkE2TL3/LVEoPHtyMELYrtjEFlGtU854qKx4Sf+KSSK?=
 =?iso-8859-1?Q?Yxx+FJewUsT6XbBTp4XgYhKWf1D3Yym6HabvOWJaHzT6CFV/Ryv7kj379d?=
 =?iso-8859-1?Q?M0GyNZ0oWQsoLEWr/lex1KnOoyBsrHt+N7bJfktrh4g8miatxkjXY9+BpT?=
 =?iso-8859-1?Q?70KP+mSqwlzxSNFcJXxq2EgrDYXOTd4yftPfW7hkSnj0AxTRHTMofJaR0H?=
 =?iso-8859-1?Q?bkHiG2EICWGy1KNLNKd3QtPW581dpHnQH1ityqxfUDfV1WSWV8vQKYve/m?=
 =?iso-8859-1?Q?bE+NDSt5KTOIob9GzCOuMvUArO0nEjWA6uNCQ9FxQIPD1u4brrtIeXRXrZ?=
 =?iso-8859-1?Q?cS7naiwjgQVzqTOuTQ4f41Q9jORNlbKm+Wt8Os/7h6n+z5Yr31VKax/i0I?=
 =?iso-8859-1?Q?3L0w8VlVv/xvAOK9JvFz5QR8fH/GSeaoV6DujfkMDFLEfYmHYQJdKwL5QY?=
 =?iso-8859-1?Q?Xh6EcT2PtH2z0gn4mwpoHD/EMApgEUUlcY9aqHjs1Drya7FLdTC7mqkG/F?=
 =?iso-8859-1?Q?iWKFtPZJ4+gLGAa63kXb/AvnQgV48oEsKVj4QeYKsE0hWZDipV/Gpnvj7U?=
 =?iso-8859-1?Q?8JWSbaAR2mC0sTKeNLXL6a25798Fb/fwTS11GUCFMphW/7OeZtCGTAYsxz?=
 =?iso-8859-1?Q?F2edh/eRFz5Vo5ykkflQNtnT9M6hsTXnzOy5jhCTIkpC7E0cYOTJlpMd0d?=
 =?iso-8859-1?Q?9oH5CjI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LZfzKjVeyBZkrE75m5bEDMeMbGjiwogwp/+zm6mIUUayHs8rQubTrP4Y8S?=
 =?iso-8859-1?Q?hQRaEyizjeQFnZm1n0+URXv1KIpIst6gtZZMEFsqXy31tqQLq31ZfOO3q8?=
 =?iso-8859-1?Q?RLMt3i2sewzN8fHHTMl9Oclbhn9bFND1i2r9LnhhQEsLx1eRlNJo5V5sm9?=
 =?iso-8859-1?Q?FCFJfKQ0igYFezIFmOrdORGbMewOrMdi35gUEhpebiD0ymS7ojMerj6Vr8?=
 =?iso-8859-1?Q?b5j78p8xYgBFCRxA1gFQTTqja4uRTJbb0wkqvSOe6KzyL4R+nLoA+EEfBj?=
 =?iso-8859-1?Q?X1SJyZCKb3K8+7N04j/f0/mSpMee8Q1OWYqvJVDqGbfS7+wRELCflihLq3?=
 =?iso-8859-1?Q?U+iZJrtlRsrUxbG5Urb+XJwHoBaVT/2o78TjgfapuW+6gPTQsN2Ikj9i+b?=
 =?iso-8859-1?Q?27lw0OEK0INNUNVIgW6I23pCChO/tiT96tqGWqhzZA6Sl4rk4cNb96ytfp?=
 =?iso-8859-1?Q?DtaZpFAkTQ1/ckA2XHP/pRXfo47i5u+qLOOs2glVsOgSAy9RAu36uzQ1qS?=
 =?iso-8859-1?Q?VCUD1XNonOsJUTn0Jj9FX1fIq2zk/zSJLS2IiuZQmQU4XDrFCuGQGQRAAs?=
 =?iso-8859-1?Q?ntt+u+16IUW0OQSJfrjBU2QS/XI02CqT0+NQ30AxqHmEH75z9HzeciPZFp?=
 =?iso-8859-1?Q?UqxIgCEZwgxwF9gII/GbfImnXq7CST/KZggyyli4bevlq4a+Uy0EGgxps2?=
 =?iso-8859-1?Q?WiaOe9MdXcS5n62H0XYaUTEkTZj2z5/l6d3qmrcUUom17gToZ06C6p4K3a?=
 =?iso-8859-1?Q?xDFNiptJ2rn+sjDAVmOvRlnSCIeA+d83aWkYe/nWSWetyPcqiqcSN0Eb4q?=
 =?iso-8859-1?Q?Vz0gKeW+HBijwZYIdBGfAG+uiD1FugfCqeYPz9UsCKGXvEFc+ImWxd/zla?=
 =?iso-8859-1?Q?eFvgxF8Qq6Ey3u6yNGdipRxsRsE70r2TMdsoBjsfJzgDrrURwmemkdYJ6q?=
 =?iso-8859-1?Q?BECeZ6htr4k6jJrUtH6vPmLy7A+lMIBHqqntbzbF8zdZP8g6A8VWg1WuLH?=
 =?iso-8859-1?Q?3bX68mi34Cl78h6LV2nLAsA/mBdUPLjscsY2wK0H0YeGu2ZJLb9Z5RIs/e?=
 =?iso-8859-1?Q?YcHHdrfjOoGUbt2i3XZqk3ySUto3Ol6HdzcoDi4iogpBkRQhL/rMtLri32?=
 =?iso-8859-1?Q?PmuZdeVKgSyVPDZ48pt1JUYNfvYL1eqHCN7bZZWo5KkS2JQwCNHW4EvCMa?=
 =?iso-8859-1?Q?b44Jeo57+XuwRfn3u3WtuD7+Pqb0gT8TTUumTGeeh500wrz+D0SYs276X0?=
 =?iso-8859-1?Q?as/PGUBtQRUvAOrh83QS2qDBsM9dzljE8Ow1NP4ZfvOOHiIne+iX1659NZ?=
 =?iso-8859-1?Q?NbhLXoTP1uiP3833zODJ1XWzIBvJaIDeafPpkTZJ8mUQRf5mjl7qq2tQ6P?=
 =?iso-8859-1?Q?/aUIizL6cwBiwyvNyZSmJ+oy2GXVuA9sqzleALpO5drOvn8UHRVKDn3zYt?=
 =?iso-8859-1?Q?FBxeChiC7K3OpQTl040VA62ndAbYwR0NSjj/GhMtFAChKtuzQ9WOjjU7d1?=
 =?iso-8859-1?Q?3St2ZjwaKeo00U8tVt4UzklDuxkYgz/AGnGAl6uKluaRrIWhQsah2c90Qr?=
 =?iso-8859-1?Q?5LUjq0nY9Glyocgz4PNsClygJcMXM2SYuaPkbz5emkzzo+1Rdlrr07mpUN?=
 =?iso-8859-1?Q?7BrRqpsMvQnf4Ubq/1G14GZDDuDd08Rof+xd/dY4cYGlP3TTSoTzBB1g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <4805DE3EE742424FA3E9B150F01F87E5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PK13D/L7hNgKcinWGPiZwRdS+JXceWwMPaDHEO5iJItO7F4opr4cNqSJEnHGKP5+iFT8d0VCYqEk6f/ecz8SzJyvkrCEByoN4mBqb4gY39MearXWXu2FIRUZcfRum+O6Wz1ltfM9xyLhlXOnyzw3c5TlKElyuWe/85fFjK3qWIiJ/sTjcuA+sFWVTTHQxxru7JxpS82qHXbdYmVgWh1S9ylgSCI2o8GF0GsWPHyjyQ154ra9qcCO3NSOjRp3e07p5iE30o/TyZwYnejOhaFrFEBnvV+AHoVQndsPJx4dQv3eAiTCRGOTu187hTQKYfYI9Qx1JzKagNGhq4KYMA3uTrYDuz/A6FWtaMA/qX+oGzGuiSJV96RjYZUimIt9YeyeYIQC22wNPNUtf81RT73NEmp/NV3ajBGWbpGdQP+JiWQr64w141Lhsf1TbfiUfSFbvwFKkFM5sawrCfhnaSxnr3CZj1bCjqm//ghoWrDTVu8GyQOsZ1z6GcCWiD3QqcfBVeMEseN3QlpkuyDD6mKaGE9uWwEudRdyec1/gyoH+fSjUnYUpJ8KGutP8Elb2WXPJAC6vF+cZHBkYPcDmImXGLr4bOJwdGoJikLIy6YGIDiaFIZ18YmyLFon8A17aA8F
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2632c737-bcc5-4502-2de9-08dd49d10ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 12:47:20.1890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38y9vy342QiKWNDnl57iUOmmzN3uxpXI/6QJ0nbF0NDucHXpkW6wgs8lUpLTIZlnQBd22qdOEN8zXV7HwO32DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739191643; x=1770727643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=V4c8OYMnhq1zZSmae4J46GiEJNElM62lG7OSGW3mURY=;
 b=jDmIfDYvIPLwIIBYSc8jjR7lLF6ak8/gh+KlIKRaOqAdPE64IMNGcty0
 i6M3rujqx3YJQ0u2pfCBHseGbpkBhyXlm6UapJ8itfNVHf7DSe4VxlGwi
 ZIuy1uDW3BNeQTQfdUoDXCK+i4EJj945wT7LjUlbU3AEAW7+7uzvN0Pkq
 Kyq3YW85kHmviyrACmAm9/kcIw9fUYkrSTlblGi2KNvDGhIQ8i+x7bRHh
 ZbyIbTbW03Cjuk5w3QmrQXMC08MD+RgdddQg2UWE2sQxU0FUJY7rVdUg3
 fc6QNc0M8Uk9bHV0aORliLmX7ZYPJYhGfs882tqyTfwysWQFXa/7N7xcv
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4c8OYMnhq1zZSmae4J46GiEJNElM62lG7OSGW3mURY=;
 b=iSmWUCncyaCe7/RfgoKMC8NvJjWzszCK3lZ9DJmoPRNbNsB1+Cj0NMltV4vOqkp33tDLNkPN5CLp/gt8OO0zHruXMNDMvS+WTeDdNUxL6Ow9IbNaWxd0S9qfU8GkbIa7VRw/MhFYmjgLwwEzHR7vHX0gssO6GJtWvmi4xzaW/aQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=jDmIfDYv; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=iSmWUCnc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow
 non-matching globs for DTBs
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

Hello Fiona,

On Fri, Feb 07, 2025 at 06:14:57PM +0100, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> When installing DTBs from the rpi-firmware package
> (BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y), there's no DTB directly in
> the images directory because the kernel build doesn't provide one.

Your new defconfig does not seem to have BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
set. What am I missing?

Regardless, perhaps clarify/rephrase your commit message.


> 
> Using pre-compiled DTBs is discouraged, but useful for using mainline
> kernels until suitable DTS can be merged, or to provide U-Boot with a
> DTB (via the firmware bootloader) independent of whatever kernel DTB
> is in use.

I don't really understand which pre-compiled DTB you are using, since
your series is not adding any DTB, and your defconfig does not have
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS set.

However, wouldn't it be much better to rebase this series on either:

1) Romain's series:
https://lore.kernel.org/buildroot/20250204163622.192932-3-romain.naour@smile.fr/
which introduces BR2_LINUX_KERNEL_CUSTOM_DTS_PATH

or

2) Your own series:
https://lore.kernel.org/buildroot/20250207183455.1468220-1-fiona.klute@gmx.de/


Then this series could provide a DT source file (.dts) instead of a binary
blob (.dtb). Having a DTS file would make it easier for other buildroot
contributors to make changes, and once upstream has a DTS merged, you can
remove your DTS file provided by buildroot.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
