Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8CDCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 096234064D;
	Tue, 22 Oct 2024 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEuuB6jGn0ni; Tue, 22 Oct 2024 21:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BED40649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BED40649;
	Tue, 22 Oct 2024 21:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC1359F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89DBB4063E
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNsgWzxbJVa6 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=018cbd283=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FAA34064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FAA34064B
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FAA34064B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:10:16 +0000 (UTC)
X-CSE-ConnectionGUID: jSlfvxs/T3m5jreg7o7DIw==
X-CSE-MsgGUID: qP2UJGt6TRGA+hmZmlzMKw==
X-IronPort-AV: E=Sophos;i="6.11,223,1725292800"; d="scan'208";a="29022388"
Received: from mail-centralusazlp17011028.outbound.protection.outlook.com
 (HELO DM5PR21CU001.outbound.protection.outlook.com) ([40.93.13.28])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2024 05:10:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0vsE0+U+UBnD8zVK/h1+9bjtI7rTkhcjklSjJ8/4mLOFOiyhIw2QADh8g8bZhANnu5uqTous4bYKZpv5t0hqpMqpKUElpBPI8YtxoWhq5Nt0ZcOIoZ6UMpPZADHGt3vUOxT+Egu4aeE2N8iXpJeLMB06r7bQ/7CrXxvYrOXzfzIKuG8wR5gqZ9ZIKgfHtssBqAmPRvNN7Y53QP9Uiv0Z8rOqMiObKwbuS3lFfr3CjoJW3quiH8q2DsQW44evQx7lSTK4+M7M+sR8V4Vr7YWAXYGORNLyt27UPNfyG4sLt9WunYevcexCJQT805nOqHOSNNsCNcb1yTS0F7KAtrG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxYY0ip2C4NuLZCQQzalvwErTxT/90ST2uQ89po/iGo=;
 b=xQMYbbEusos4dmmX7/lfl4l0nu54az4LPOyaPWZ7llf8bWv6JeXyfxCQdV4Jrxr5HCNj4YXpqQLwy0PLuDaLamnbneP6zKVJuDaWntpGcNQ7LlAWTS26SxqcrRNKviBhbDRO8AEKlv1z3XauhKXkPv8nzpkXr0hnLCS9t0yRRmrri/TYnD52Ogk9tLuCIBKzPuoLF/WqVc1gl7U869wMr+3STY9RJfc8pqwps0uEpxUndiK5cKYFHODY/9NiiiTyu1xuQdFk7dWzDLNLansqo/3jtNGfPlHl4QE42fOQAhmAQy8pQVwoeJmI+R6UXl3tJuOuY1GKJq7YNr9N75Y5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6333.namprd04.prod.outlook.com (2603:10b6:208:1a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Tue, 22 Oct
 2024 21:10:12 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8069.016; Tue, 22 Oct 2024
 21:10:12 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux 6.11.3
Thread-Index: AQHbH87TgI17C4b5N0+SChXLoBJvcbKTR1SAgAAGDwCAAACOgA==
Date: Tue, 22 Oct 2024 21:10:12 +0000
Message-ID: <ZxgUs4WQOp70Z-IO@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-2-niklas.cassel@wdc.com>
 <20241022224631.3adcf661@windsurf> <ZxgUPHsMJYIf8S-p@ryzen>
In-Reply-To: <ZxgUPHsMJYIf8S-p@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6333:EE_
x-ms-office365-filtering-correlation-id: 883888f3-7a05-4a97-3cf4-08dcf2ddead3
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BkA7Yq5ItLQmGYpBpoOMDa+DfIYRpUvizLak9QtNQyG8UPYbPheeipSq8IXk?=
 =?us-ascii?Q?mmJnZYQ/9izyGfuf0dpnYbmqnkFVlA+1Z3Aenj7l4reoUEDZDnkAXQIwNC3u?=
 =?us-ascii?Q?iJvEcDm4dBzCVYXSoRZTu44egQ7zRhYbskrQKo2oTKnQwbYs++163bDcaWIa?=
 =?us-ascii?Q?J/2peqZFeiVZ7WDc1W8T+RIT8EO1X3Epo/CrPENsAkjZwNWVTT/axTZbkPXR?=
 =?us-ascii?Q?bnoIcgEsQccC/k9bc0dQH4UhKmBrRBJlCoE87RxakOBNak+nzsxRCzEW8UmW?=
 =?us-ascii?Q?ChtwFSnd4tKM8RdPET6jt2LJWy/5oCEYEx0Lr069/fv9/WHN0F+/Q/0JdqsE?=
 =?us-ascii?Q?q3/u89tiWww3bd6r1ixaS98nb+BXZTUMoU8tVwKuSZHCGXViwIJD6rUwVub3?=
 =?us-ascii?Q?9pjGiHTbTKZPV2SSxbPwQFePx7M9CsN7QUtB45ZYf97oQeXzFwOs8MXc9zoU?=
 =?us-ascii?Q?ZejabwuJe2F6ClQtZyGl77lEAdv+oJYdMGKcSP0bIkKhw9b07lLnuPKMK3Zf?=
 =?us-ascii?Q?dGJ1LpJIUZ0uddqK8zSwIU5f4S4GX+oIRevilsfe3wVZQOmSHFf17xqc2RoD?=
 =?us-ascii?Q?h+q2In+Z3XGkd8xhvxZ/Sx71OU9i2BubSxuwzFiE3ACc8pqxjts+voc9FN/L?=
 =?us-ascii?Q?kNrmViqr07iJxQp/BeHSnj0CCNpdklIUu5r/CYqSLXa1JHx7O550qDfx7Cws?=
 =?us-ascii?Q?kIMMADMB2Y6ZIDiv9af2xy1tJyXuhZglROL9EmUeqAxW7G3FP2HGg0zhzq99?=
 =?us-ascii?Q?taxIuji8iEW8a1XQzqJ2wY60SgBoqqBiTrBFnOp8E+CjMLvUC4Z8oRjsDEd7?=
 =?us-ascii?Q?w1bbnlBYsDJgrPW7qjGHIpKzlJcDbUvaKbDO/pSHGVtUZ36k4MhKSXRE+xwb?=
 =?us-ascii?Q?TnuwEugSzUP0oVwuBMWXH2LeVuEksGt05PtGjG3G9RUUbI42hzH/JpWL4ipn?=
 =?us-ascii?Q?ZqQlx5mz21gB1DYKfFy7ibjNBGJt5rNWOPXfRWUyfzdBMEFyTjHaxLvLEzpR?=
 =?us-ascii?Q?d0Drtm+m9ZeKOkmAMRQSzObv0glv2utYwagomsHVPGlvUavuy5dEf01zSt+i?=
 =?us-ascii?Q?fRgyC6FD9i5gp++yAr5lXFbiwVgxqPJLha+oUneBRpBiICr2HbkflhYghZoz?=
 =?us-ascii?Q?aKCEMwRlLOjC2kFL1/fY+ygizNWzlxE5YINZjfDU8I0yzxstaEWHJ3Al1nHa?=
 =?us-ascii?Q?W0awbZYQYqXjcuzUJwTpPXKb8BTHj3EDHrZQAIarg2TkGRIjsyUw1Rpk0eyr?=
 =?us-ascii?Q?KOzSRFbafmwHnxA/wS3qb71oBFTGNb4mkaAIFV+vCw3QH5zy7bSV1Y+QWm8r?=
 =?us-ascii?Q?hH7BAlyHnbs7hdYvX6PyvTeJljJImtdqDXCjn1K8GD0eR0J4nmpYnFmKZ/zL?=
 =?us-ascii?Q?jvbelMAhIplKRG3eXaJ0qwRt4PWQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mQr9OJV4Ki8M95xUPlfxrFiiG9ZiqR30XGynzYhy3jWLEdV0WClWSXfM/Xd1?=
 =?us-ascii?Q?eRgVGvqgEGmLzsl1TEUdgjpygOWK26BVEA1HzO5Zg3diEANmfyWNWHJXPnNw?=
 =?us-ascii?Q?qYQzD8m+dKOR9fCMB3pEKnYxCOBnr5yFqNqksQ0OPlqf1nlyyCgWRzj2CJfj?=
 =?us-ascii?Q?XTpfYXNlmddLtOdETScq81simg9cQehsNu1BqeHECTqCFu5uqJHK3wBxI8C0?=
 =?us-ascii?Q?jFvH8RKDBeO/aqHqGyyFfrSGp8/SA7LflqQqTzslfrKm3Y+GAajui3ggZqqW?=
 =?us-ascii?Q?PnfwwPfn0UURsi+tJVjh8rdRSgChvStU1awWQLsfggST3VBHNmZEJvGMEuzI?=
 =?us-ascii?Q?8+8WaI/Q7+f3Kljxd4dzJ/MTzHVNKCqi22/b7Y7gH1kPAWcXYmMGqQc4wYvb?=
 =?us-ascii?Q?UdDBiaDVqvis1h/IaR8nCCUHifN1JGuzbJqJ5TpCTYZkKiKVIdWbDhtg/Rwx?=
 =?us-ascii?Q?CgUgRBw1O24UbxZ5Zi0bD0fOyeGxJU8NW0/nQPqML/O04/H/drwDcA16jJmu?=
 =?us-ascii?Q?tznJA0+IS1vnQfaGKlrf5iDKpqueT5sMsyj+sLwrgbDxzZc3Y9Mn4jPCI2ta?=
 =?us-ascii?Q?WyY6D3w+cgVQbXZ8sPBo20V7CLwTne020zLY7HMxGyyqn0srvs4CgzWjZxMq?=
 =?us-ascii?Q?6SoomfC6TqTpXuNmRkl9yuTEOr/LoyPnpNVgYfWyikDJ9luT7RmyO76qooiX?=
 =?us-ascii?Q?BrHO+4GMLCTuLag2HSwhj7Euf+JQ48YwJ3lekcTsVZmypLo3rmTVp2WHww/e?=
 =?us-ascii?Q?P6PbsHtpC/MNbdVvMH38lJrrY9wrdU0z5whbyPe0bjBUg4nZMy0iX5tvK255?=
 =?us-ascii?Q?pzRkmffK5OzyShvkQxCWq+tJZTxIIieQA05Z9msYMa+oNdPU7o3beY9NgYpG?=
 =?us-ascii?Q?tTavYFFDfQBSoovGiP/IV3Rpq7SSQ6DzwppAdO7aUv2TEu4FE/VKV+65K0E2?=
 =?us-ascii?Q?YSxY++iVLmm6hGlyOo5Xj4MJJ3gO4VTyNckqp3TIoEOAgm1mWscANH9ib7D4?=
 =?us-ascii?Q?/4SjrHOjM1thFVJVWOVWtf80RRcw0uto4LUE/UD1+K7tGt7KbSjriQh4i+Nn?=
 =?us-ascii?Q?yDfl28wblb5GlNVo+yShHpKaUu1t0Cm7+IF/lpiDQndGnAvi8d/8T7qDoS8/?=
 =?us-ascii?Q?XhGj48gu9jl6bGgT4cWIN4aicpw9fuVRrX4GCIfCYMky0Hhq5i1UDyyiKgZN?=
 =?us-ascii?Q?+Cxc8C2RG6wJTQp9iG9lfdresJyecEefTLcuzTsnRZajsl/qV5ipHEYjR0sW?=
 =?us-ascii?Q?46tiiEBBBMl8r7pfMzZJ0hJHt3aqBtQG4AZLW4YvH5/Db6iFNLf2wSsyOKQX?=
 =?us-ascii?Q?ubXALyJPwIknSFF1VGhh5O/wTHA5JpdrApnWCKDNe77DbLjkelV+SPmqAInT?=
 =?us-ascii?Q?NyhebqWaHPZblfTmXz2ggeeFfAkO7HjKbmZ+fYj4hQQsMireLw0vNWJzNfzC?=
 =?us-ascii?Q?qDigyimr7A7498vSVV0oDFepxAlZoig+pSUK+UYT75J7+hD1r+oe0ph0LzEZ?=
 =?us-ascii?Q?dsPIIqFm0Ex8eIf3c0OBHJospc9AXybpOZjYwqkVD6DqkCuyOWPzsS1WGC64?=
 =?us-ascii?Q?L1ptEo+roloYhUg1N9u5Sp4PnvcukcQnSxLug5FTD3auyBEUZC+ypR1SC0JD?=
 =?us-ascii?Q?dw=3D=3D?=
Content-ID: <47648A8A3363984189A9C3D3AE36D882@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: g7+L4mF9dAD8Jy8YELRuf6V23TJSWSwldkG2bRghY9OxldNzvvDIF00MeXfAOukQemIibta/4irGww2mvYJUXuUSPLYtIO6ELdXOc6RXKGPunBpOywvLAtHGMtjx4R2HS+J/LOmxpfUQl0jUihwZGUvarquhbu1Trjy4VUUkrWhXRce9wOJxSZsSAxC2J/sEHklRM/PLbSZhJgPsnfuRR/glP4o14jFCRDmAUr5QpUM4JRUQO6mCAHAdYxZkg7vXFR7eRrOP8G/oIdrFYNgYWJ+Yr4REyrbRByayBmeXrUNo7cOBO3Zcje3zVwer82wEXTJui92VEjrY3UAAMcVoyezm0xKlZkEWg5EDyolQR92rzyIRzGrkv4RnI4tUWoLvM1M5q8821Uorj3sAbIKdAxLg7a+s8JaLr9xQKRnQASz0hi5j+sxUlBZatb7AhMzDTo1K8mXZ2pLCXiPosan+YT7c3xC2uLqmo5cn2GsW98yaEmNXGweUGpZu8KnNSJFGcqDD/kzZ5d5/Mzdv+VrR9kumC05xFHPNnybS8+0KDOQpiIq3M6PD9mZVkCJyTvG2BlZYbmpV25mVk54tid2KqutRRs4QckGqFgvzGcoX7YRaWr29/1UBu+RBs6Xc1neg
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883888f3-7a05-4a97-3cf4-08dcf2ddead3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 21:10:12.0871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmm8DwmvBUMM810+gGaEwsbmc3qKIZUDXN88jcClU+AbAB6AkOGv03L14+K698SKATolBSH+2ZwEYHPtRfV9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6333
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729631417; x=1761167417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=R5IoaFTDmk7avmiLczQeZeKb2QClz6Eb54eQHaeZCKI=;
 b=Q6lOze4lQ/fYugdYRd4MlllkSa1Odwdl7CV4JR0dDbjGcbGeLFHhzlU+
 sVMaXcjw1In2aeyB39obDO855SI/IRm4VlOuj8flZUGs54xdsUMAr8fPd
 85SWIe7pJO7oK/zE+CttkLCh/ZuPMbD0FwJ7NrQwTevn8u8Mnn6x2PAkn
 DOh/km6jnsK6vBzKOmfHxr5ejQIz1kYxMA4L3uqA8Gw+/N0jf3lxPyJ9D
 bODYaDiMMGjfxWEvE/q1YQqZI6+1DAmJypIENU1rLrMb7TijkkFIpeCwU
 ruVzsBKB3NZ0mw7bG1zDtniw1GZHtW50E69VC0Fr3k3rDPQ+sSxGiKWkQ
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxYY0ip2C4NuLZCQQzalvwErTxT/90ST2uQ89po/iGo=;
 b=vquRBa0GzmIXkUt4HOt7CwYY9uSbmeoWin6xsg1Vjsgpb4Rzb1ZWtaikMyxxUoGRyjYgwxjOS63jzKgmRYV7rGlC8pPgpZMMLEJkBX7A2ugrxwhCg7cT47KR275xqXiM9XpJXlYnNr0IQzwkHw3bCEhSUbPvwrdmhZ2vfM6NEnM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Q6lOze4l; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=vquRBa0G
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux
 6.11.3
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

On Tue, Oct 22, 2024 at 11:08:12PM +0200, Niklas Cassel wrote:
> On Tue, Oct 22, 2024 at 10:46:31PM +0200, Thomas Petazzoni wrote:
> > On Wed, 16 Oct 2024 15:24:40 +0200
> > Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> > 
> > > From: Niklas Cassel <cassel@kernel.org>
> > > 
> > > A bunch of new hardware has been enabled for rock5b in linux 6.11,
> > > most notably USB3 host controller support, GPU support, cpufreq
> > > support, and PCIe endpoint mode support.
> > > 
> > > Add the dependency on host python3 that is new since linux 6.10.
> > > 
> > > Also add the missing dependency on openssl (which has been needed for
> > > a long time, since we are using arm64 defconfig, but only shows up as
> > > an error if the host system doesn't have extract-cert installed.)
> > > 
> > > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > > ---
> > >  board/radxa/rock5b/patches/linux/linux.hash | 4 ++--
> > >  configs/rock5b_defconfig                    | 6 ++++--
> > >  2 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > Applied to master, thanks.
> 
> Hello Thomas,
> 
> It appears that you missed the cover letter for this series, which stated:
> """
> This series depends on:
> https://lore.kernel.org/buildroot/20241013103341.78501-1-bernd@kuhls.net/
> which adds support for linux 6.11.x.
> """
> 
> I do not see this dependency on master yet.
> 
> So I think you need to also apply the series that adds support for linux 6.11.
> 
> I don't see a reason why it hasn't been merged yet.
> Bernd's first patch series that added support for 6.11 was sent in September
> (2024-09-17), the series that I link to above is his V2 (even though he didn't
> mark it as V2) which he sent in October (2024-10-13).

And now just a few minutes later I see that you picked up the linux 6.11
series :)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
