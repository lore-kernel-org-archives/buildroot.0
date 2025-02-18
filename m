Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ECC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 14:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6611361049;
	Tue, 18 Feb 2025 14:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdGIJdcO9UXE; Tue, 18 Feb 2025 14:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7311761047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7311761047;
	Tue, 18 Feb 2025 14:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B0AC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6366540C89
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFXeSbYqgHMi for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 14:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=137393274=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 513F240CD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513F240CD2
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 513F240CD2
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:00:00 +0000 (UTC)
X-CSE-ConnectionGUID: HrqznWsvReOgJL+dCEqarg==
X-CSE-MsgGUID: ohDUm+1lSwutGt95yI/PFA==
X-IronPort-AV: E=Sophos;i="6.13,296,1732550400"; d="scan'208";a="38573080"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2025 21:59:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOslzWmvTqbm8PigStfI3mDsG382ozu8UGx/SVlR9RX/sahzaG8isKDElwdBD+LngzctVVybmOsjJ4ldORulRTy0KOlt6xHEKJSzIi2In9XWwiRHyHsQPOl8kCNtL4uU5mPnBx/iQb8fMlt6R7mdpd5gBZvP6gU0escq/xMS1bxLZiBY/aEDXK3NEaNJpm7YkIehuLjuRyqJgPCVNHttsxwnu/dEofrtNa/QFrGkPIHbZMIb6kBljs4vviyxRfwyLALvfHBjzjMcsOYXqDvrggVPDxqNJVxq27JH3HKQ++5dhc65O2vNvbqnrn9lnvKHIIlz0Rpc0n7UjkiLWNBc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am6cdXTjzfPYR1lMfMKZA+nf8pdw9IogWYrizYB/Scg=;
 b=ReWLdYthfGrZoYuFdzZcqFWP6Yx/hj7EeJDR0dsizt6+PLLSCK62p62hORa+X7Gn2QX5ji8lU5zPjH/4kjkc5xIOnSDeduo7cmyCnK+PFm/hcJbwJ0SCjK9q3LYPMJ5e8sS7A+KlgQqtqSm5EniMaNYxGRz23cyFFDpx9pV7N5BecspQPdO5bhkQ2lZ9g9WtELS8nRTIF9c3HDyq0UdJIfsMUrQuieW27KPW0YWTYt4ooiozLgFGaRAWhRVKrOy1hMsfUqs3J6DwfljYQDuDhu5D747A+g+5zVsYpIRBy8YG5llYx43xIZZ9m/nitdEk2HQkyL1p1txqugeb60xXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by LV8PR04MB9113.namprd04.prod.outlook.com (2603:10b6:408:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 13:59:57 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 13:59:57 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Michael Walle
 <michael@walle.cc>, =?iso-8859-1?Q?Ga=EBl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Chris Packham <judge.packham@gmail.com>, Edgar
 Bonet <bonet@grenoble.cnrs.fr>
Thread-Topic: [Buildroot] [PATCH v5 3/6] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
Thread-Index: AQHbdyL796qolJU2WEy5edw0Qcpse7NNLIEA
Date: Tue, 18 Feb 2025 13:59:56 +0000
Message-ID: <Z7SSXM7bSGmshmtp@ryzen>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-3-romain.naour@smile.fr>
In-Reply-To: <20250204163622.192932-3-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|LV8PR04MB9113:EE_
x-ms-office365-filtering-correlation-id: ee7d5ade-8f3d-4e69-00dc-08dd502486fd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Zb7RDb0Cc9UON+QjBd1eMVvP2XacewNZE6GHbsJ8xhkSI7WPQ7HowwCbqS?=
 =?iso-8859-1?Q?5Az0V/zu9qC/xxfLKRE8m9Q7KWMgn5eBkNSNSyR8zRtUJevvvA8jJkIKfY?=
 =?iso-8859-1?Q?ETJYkkB4xvXGHFg76Qg36cHyevEKSvurB4nIgfSI8PAMUAnRxIylHshj4Y?=
 =?iso-8859-1?Q?QvP6rh3/CEHl3hz7Z62CeJvV+3JVGBtqDeHa//8cua3bnctaExoOkgTMzt?=
 =?iso-8859-1?Q?fl1tGEfw7D8ScHwz8exszqPRsn9ojT92U8xvYquptrCKa0G/Ke7f/nbh+4?=
 =?iso-8859-1?Q?+CWCCB/GGrVXc/X/oxEQMbU7kHoUqfQJvIfIyItP5E0FXEqLAWbnvMH2Qf?=
 =?iso-8859-1?Q?6ylIRzDeQVlAwSVt71PChAFsRDUDUKENbQy4AOx9hu1cfFWwXX2x5p3WLO?=
 =?iso-8859-1?Q?t9i8yYvxCeZNtRKgc/ezd1tBQSsLuVvvOofRr+RdVHxPnYWxqSvL9Gvmpb?=
 =?iso-8859-1?Q?70G5qTBHYnCPJ42Q8KFT36FcM4cfu88XrH9Cy+c1ApbscTHxZy7Os58YUO?=
 =?iso-8859-1?Q?bJB0knfN+8VQCJc9fN13uCbtaE0hYnfNulP/kUpQsGwpw+GQIdoQA8mhVD?=
 =?iso-8859-1?Q?jTbUmoCnc3lhSNZfKW8woRsPc9rLO9OOUX9FFhtwi5srF4JjgE2DIQxl8x?=
 =?iso-8859-1?Q?UvU5a93W8J4ov9igyZ9kGki/OomDGKnbJV3sWo+ow3QjLaB/HYnW81bMaA?=
 =?iso-8859-1?Q?IgtDMBYXtsYdmRnYGJemfENgAxEzIt0wGw8ZpSp6ai+MeiSSNoHeRlbn5U?=
 =?iso-8859-1?Q?+teYLUbi96gJRfXzeCbe+UVEUbRsj5yLYxeipILiy07ZxeoTdJsHITuq4R?=
 =?iso-8859-1?Q?Uk7BU5puLPQs6Ak9qE3fkaUcbEXxswu2w4563ubhjxzd+WKABk5VuX765m?=
 =?iso-8859-1?Q?o93dr/KhWfhocWtmABRZCTsYZc6uShe26ETvWUbuZQzwUtIVlb6zBoqAGA?=
 =?iso-8859-1?Q?wtuCOJxwGVydG113VvhFfhoSnRqDu+O+s+SaQ4ACODqxqmThXsMANq68aM?=
 =?iso-8859-1?Q?PZNWdU6cy+kCb2rzJUXqV5LB+18nXfLY6KuYkvedIPE9LA1NIOuxSsQYA9?=
 =?iso-8859-1?Q?Tr4MeTI9SrCDPJBXViiyWb2fbU1+1EXd6Qmp+VQyI62RG/GOpU8Vg0R12f?=
 =?iso-8859-1?Q?LDBAtax0BbFDeiG4J6D26ceyTiAlcH+5kXuugInOaIAb9oaCKoe8P/5N+8?=
 =?iso-8859-1?Q?5ZHag/A0uG4KjCR9Qje4umZmDSMeuXqPgwIHSfLmK3J3lyiO+iQS/aWZJc?=
 =?iso-8859-1?Q?F+jM6nEgfJv6Y5kH9Vf2HLlr1srV0klapSHtkAVNkFOrE135AP5HjLE5xu?=
 =?iso-8859-1?Q?ddQ8Y8YFBa2G1DEZoBaS8kHq1+Y6lb+a51ZNMjtlG/A49rVhXZH2QypMM6?=
 =?iso-8859-1?Q?2a2gxIuS72dZWoU9JofFSmxQIu/tiKkgib+4Iqlj2sfFRDfwlgE8jNux+3?=
 =?iso-8859-1?Q?oOXlbp+GVwM/8sTZTzoDfHPcJDHK8PlCzQmhLY3gAzk3tWbsOB4H7Brixq?=
 =?iso-8859-1?Q?O/EBYedRfScwL9FundSBJe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JV5TlLegFHyTXJZZcF6DH7yLDxTpSXseocA1cTsBp5RnVnYJ2bDeUrqlqB?=
 =?iso-8859-1?Q?bQcfdOVX+mXovu/Q8JxRuGuefqkOnf7Ez5qxm9eiLBsK/89jmU5F7U+6yR?=
 =?iso-8859-1?Q?qEK+LP06BDqtt14dsEraatYBh2FYYw2dlWQGfWR94Si8tSWmdUKTmBiw8d?=
 =?iso-8859-1?Q?D2uKjXDwUApWM4gFDzjhDqfklAPrt2+axyrZuzjBLerCRtzVgvthWhApCE?=
 =?iso-8859-1?Q?vHfnmPdBRgn5p286luLvNHbV8855zvW7vceeTRSnXx+t6/J6/Wdru1GT6H?=
 =?iso-8859-1?Q?OoQ0kCUQ3CMiaeOp3mJqA6xAneMh9ZxnFrtJhq9BnqAoETjO1+yf1IFUXl?=
 =?iso-8859-1?Q?1Fh8Tigb0D7rLT4SMYtyxOB7Gvbae1NIYovVw9Io2s3T8VWzL++VNnIuLO?=
 =?iso-8859-1?Q?9Wg4cUGq1I3llql1JniJnJY6av6y78efPqQJOkGWLRISj+uMWZZ54/C3t/?=
 =?iso-8859-1?Q?WB3407W+zVmd84WIHIpk6nw3BEDkN/unefIdq9+9zY88h1oDGePl9ZxTYf?=
 =?iso-8859-1?Q?qPJx6DDz52xc/4v7dCqlt5shGTjo8we1FzNDy15W3P95U0Vu1jKbj+b1Kt?=
 =?iso-8859-1?Q?SpmDABwWXFp1UUSVuj7IK2qfYQRmLsCVcRMJ9BATEsN8dMkpl1zZNKffIa?=
 =?iso-8859-1?Q?DuyjHr2jrvxfX7G8E8lBlZ6sNFpelgtL1aueI/93hSo5qzFvi1jCHNAxSu?=
 =?iso-8859-1?Q?eAwckTeQcFZC+27H/M1/Hjiwzm+3urE1yUYl9BZ91OZSoI3yajqw+re8pY?=
 =?iso-8859-1?Q?ELP118pGTlhxe8pZ/G3A6eO7JZc4dlW9kK/4u2t71E+g7YgkmlAeYTumnp?=
 =?iso-8859-1?Q?tXxobZuHleklXZxROONCU8VJ+pww0OEVMGYdp4IKejDckA8AGWe3Gpc0Yc?=
 =?iso-8859-1?Q?YF4Z+pjNOx7/vfvHp2cJrE+a8CpiJgvpzgnfk7n7EvglTvINpW7K7lG8Ah?=
 =?iso-8859-1?Q?Xo/X7+raftKSslFEYv/eL2GL+DksCPuXsGihAhLas5A7zt3rkgGK2IOlD2?=
 =?iso-8859-1?Q?wYoIxB+BPbMeCBgY+5w0eA0Wp1XVzlCwHvtGQT1lpXUkskBmVtCUED2x6O?=
 =?iso-8859-1?Q?bJxFmMWscJ+AMSwhC13tcRo6sABFEAdgfkkflnQt6YITGpXUAARdvxG9eV?=
 =?iso-8859-1?Q?3dTr3v+LHSTs40ZcOaa061mWJxA7E8d4zZoKpau8OLqxyIUM3L9QIK6/+r?=
 =?iso-8859-1?Q?EUI2k09uoJgo46qDodCOibU1CFHWFLZuydJ8Zx4HcwAYMlbH1KjvMt2AR7?=
 =?iso-8859-1?Q?f1V4mXj5xvGA+DrnvQ4Sq409X2RBo2sL9nrRVJ8ER7eIuNTXaJNGWFn3HH?=
 =?iso-8859-1?Q?lMLkoOLeqM6HNTW20r636boqkFoJM+azi4fjQ79aqaj6EptVYiabPQLK11?=
 =?iso-8859-1?Q?ec3H2YePL7Bu9oPJQvXIaqAEIz+kaxnURmEOqze+WJaU/H7DL14k7B5zoo?=
 =?iso-8859-1?Q?h9Ld9rAdNbZJOvas06gBci5/3Bfc5SKMMOaB/T4nyKNCCMYsbfywuC7kDS?=
 =?iso-8859-1?Q?YZeh4ni9U9AhuBmJf1/gDln2srtp80Inzlshqg+HBgCYkploUK10WATisZ?=
 =?iso-8859-1?Q?oTD3i6jt+5YHTlEGt4weEPQs8pHR+qcCrllTx+QbuLOk3PZJk0dBAoubD9?=
 =?iso-8859-1?Q?clWIOZgbLPrBgGGYvoIAdU9e4akoOYsLRxlEsmC189I9X16/UypsZlrw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <FDCACD200406024FA48F6AF51EF4E60B@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4QmHKizWzReUDIVH00K6IZnxVF4GAzr/ruMJoDbZ5tcSN++cua0pp3DRyvmS3zbG2ovQyLivHlYNBAqDel/BNRGux22e3YLLdjex2tvm3oCdbw3yzo5TXLJo3RYVHYYcQXcNvkpz5mrGOnI66FuLxHUd9Fbb7lo+0JdlLI+k/5DnQUYudyXFNmKWyfZmX2wbDCV+YzoXMhjQXJniGw0eVk5QGppy376n/ieOww1Rx/vgVItf9wbYVNSzceaSQaiwglrL74huZRLBqMwprYkYg0+2hBiEVkg6uYsmQCSp+q6HbNS1VfoPz1q4OSN6Oa71WhYr3qakhymuQhL5ccQCs515R2VZG68v9wYIYkUWQhumprC1CczttCYPYnk0dC17AH1PxXo57BraHWAXGtha/yn9FrXXzlncALu+L0TLsq5lVbOtMV1clVZtzXbp7WB6pyAHj8Gs/7SsfTV2PM3AicjUbeT5JnIhBIOLS3r3I5eOy8qPfxq4t4ETm4zUm5d5/i4sD+HKY4/VqgSZ3CAeRj6KIGPMGmWIpZ312VZvBeBgPRJGOV1R5NM3hjSSRWVpOdqdP2mrjQRyMZErPEk95zPXVQb8NhfvZqbTrYrzxteQ2R+AsnXXv/DfJOlN9M07
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7d5ade-8f3d-4e69-00dc-08dd502486fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 13:59:56.9652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lmAyCJ5YyKdVXUM7v+lkiVSWzD5O6e4yhBoMeC8HS761XqfQN76APkn0/eHv17v8n0bPA2qRQ2PxToV/O9RBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739887201; x=1771423201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Am6cdXTjzfPYR1lMfMKZA+nf8pdw9IogWYrizYB/Scg=;
 b=VNyMeJc0IpMIydVaJKRAZXJ1mBlE7bk7H+DL0w2zu1ikdOVRNgeDhkJf
 d9nu6AcLeDqrizETsDaV+0DAADGpNwDesFpiaBTCxE8EewDcERr6kIe6S
 hn21TBScPIZMk0W1nkpvrplLUeNcYqDjgVCz/7toFVu94y1dwShMlhAmF
 95M+yjlzv4GBBfl7lFawMG/BDwlOx9Xn/FprTql2PJZ+lHHIorWdVeVqc
 DYMDIywh1Chg55K7jWuqhYqnffueflUAk1pJASDtd1tCwBNdYpOeMP1Eu
 Xh5vw2rqzjsEFTsLwnXmOfrDAaneYxC1a4P169RjBG+NlLtAbVpMPB86r
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Am6cdXTjzfPYR1lMfMKZA+nf8pdw9IogWYrizYB/Scg=;
 b=dG8wBOgYc+igdRQAGh0fAWCaVu33RMiVT/FtNvi/i4ZYORtZpj48JIUTcq1mKdV1JF4rrpyYmGwMoNh1I7tnHOfiHDb07wWfZGKL4QIa5AdjUWXF8wx4DI+NClgrursrH+8Q2Mx0BF1VKr4tqlZLKCgiwzXcCmZ1KJA1QZ+BQMM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=VNyMeJc0; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=dG8wBOgY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v5 3/6] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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

Hello Romain,

Any update on this series?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
