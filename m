Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B6FC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 15:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 838C16060A;
	Mon,  3 Aug 2026 15:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pv8S1ZfKfkIB; Mon,  3 Aug 2026 15:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B316060D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785771555;
	bh=Sbk16hQE7wm7T6SgHyIMKr9K9jHhRQGiaSNp9BQRhjw=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BRYbcoRi6VnoTk1dzyShgFD907nEqeJ2oCHJTCgOTyVKHREsxjPDxlhtcOC2HlLt1
	 oi2Z9b5Uqbw99nwVCbb3fuIwK8f9bkDoVPcAtq+0xzqnWwPuPZmsTcQs15TEPYfdRx
	 AqXgO89RBQWhPN/S5unANUE5vkhBnvcKRg2E8PPU02owwhE7FwrJ7NxkcxWzy4pMVE
	 5ihoxIR09AbWrvg8kFoGVAqt35VRzWkdopoXF+2cj8GE003UJX+s/1S+4Ej1UjFmd1
	 n/ywPRt8k99Ufw6kr7i5XjwQ/hZM+5dVKb0gmpI6Ey7lVyGcxgIm3ntOFfJQDpZIqT
	 94pfgHdeYXRgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B316060D;
	Mon,  3 Aug 2026 15:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BDD22AA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DBAA40573
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nwEstL4SuaW for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 15:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2176540571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2176540571
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2176540571
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuEXqzRT2FwiVT/89V4757lttw2QLfA9UwYcHn8eqFNVwSvEvMqs2MSeov7hMzRKVnKz27n+aYdMxM3qj7bDGk2zNGK5p8ZmevQar9LUmts9sNYqOwBxrjuGPvw4o4KThA7QCV2kXgujJ++VYWowd3QibwVDDiIyY6fGKDRFvUcsexrkDe0Ido1wJpZ4rnpdkt6GsEiO+EXxneHviTmY32w1I3eAhaRF0QOD/7HinBUMzDBFLAbvKyECtudO+BvwD2eDNWuJ2NIJzBEW02TS3ExhUjGV/Vg/YDL+jFpMVs51luIzKzQ8SfkKotwRUrSxvlW8zOuwDQPxFsPqszZCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIC/6ulaqarXY3IGIkJVInPi33dtYtfUy6gDvVkqxQs=;
 b=IqUk/O/z06w7crFbteJD+KFihh/vjcNkTRaoEpngR9F876S12o9pxFrRWibkZhrQ1SXHL7w+WoKuXZjV6BUPOq3sCeMwWXWP6MpSVRFH5a3uv3nNtdNNlk0yJ7liMz3r6eoh6aZkf4REiw0iy5M6WKney8Ls4x7NK26etJsbrMggYNDSbBjCz5vOOVwazj89apUXFrHCYW4j8diYCI4zpnLsEIFwA+p6wsLXZm8+x6yvPkQfjlB/gJdmvx+sxOKzpGpDQxhiWWYgff5qjA0RwEHIRUlpXms4cUgWwDiVV1D98juuXdNsZWfF1Ft21s6Y3MFVaH7y/f7EVY29lY3EZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 15:39:09 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 15:39:09 +0000
To: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, Matthew Weber
 <mathew.l.weber3@boeing.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "john.ernberg@actia.se" <john.ernberg@actia.se>, 
 "Wood (US), Brian J" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [EXTERNAL] [Buildroot] [PATCH v4 2/4] package/xen: add custom
 version support
Thread-Index: AQHdI1fE7w5qe47bn0WwEfPH+8We27aMcOSAgAABXlA=
Date: Mon, 3 Aug 2026 15:39:09 +0000
Message-ID: <BL1PR12MB5032D537E06564043D25A16DF0D52@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-2-neal.frager@amd.com>
 <BN0P110MB20672AF5339439D6D7AD3013F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB20672AF5339439D6D7AD3013F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-03T15:26:36.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|LV5PR12MB9803:EE_
x-ms-office365-filtering-correlation-id: 1faeb849-cde1-40b1-6d3c-08def1755c2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|6133799003|56012099006|4143699003|11063799006|5023799004|10067099003|18002099003|22082099003|41080700001;
x-microsoft-antispam-message-info: IlXBkVp4utYX2VL9LEl819c0nVrWn96n3NWsJOhEQt0wAK+r7Pav1qS7r3c4/F7dE6jbcKj98C2OCx3XE26WvZ5cbe+ixW/lIMYkdq96kyhMPGF/OiLDrymKyR83jScWSKQUhABkrhlBUgc/PjCxJPa+gzKB8FXUZJkpNYloqKz1V3+bpJBfZ8aeLPFJYKu3QoLSYpfLJUZzGJyb+hUeH93qnKJfugnE31ITKXqqjwpuYr93+ZT0ULoJLSYAFL8nsoCLUmRmIBIglToRINUnyyB7LEVmdxZLkJxz9N6OM7qEDCvU8RtBTq3FD6GQy8UkYfeKkqeW2CqJhhYoUdCjO+IF1MLZqAATCX3x3YQlOylbmFi7+APWnmCQLLU5d4YoBS2bkQX4UJvb1T++TV1g4uxka8PbvmCtfu6i5pItBq/zIn4GWNfYiA47iUPjyvOdO733l+rRnd87nQUrK34QG6sXCLvmMaXZr4Vjo/5OdhrV9O+zpAX57xf6NWgAjJDdJ8YYj251cdaPgkxhm4GZdBXuzRNb8lPvI2L5rdAUxda+M8NeQ2x2g1I0LGu3hsKQ43uta6ZlHxcha6EjCQQQNYNvcBgnJUkwj1Sx9E85IrUsIfhRLK5gTwvIfX//rEBjVQTtb4bsZbd74rbaMvV3iTKCCWPFdS5nxbG03hjaIeK/04WQVVLFtdP706BYT2ggGtw9UxhctW4UvTd7SqmdeT8x3XDXXt3MmBS/BDuCdCK8tTE7mcMRPoQkUU319lQO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LQjTZYusTcQ8vSLVSf2xH1HMiN2oT8MSyYXY2ShyYVpRg4QbMjjh9zATc490?=
 =?us-ascii?Q?T0J9vCyqftcrse+VGGJ0q+O6zO8E+2gKdt0JMsyUCyKFoC7hlE7K+Ioe6xHT?=
 =?us-ascii?Q?GuEWc2WqYVWzhChq49JWWEDNiSmYguyrzr1kD3BnHRlpn+o68XF74moE7qTb?=
 =?us-ascii?Q?Q3Dc4mgJVbMKzLyi5tIVQzjVzURNxHvWPS1XJmD/jzNVlm5wUptRbo3h+y0L?=
 =?us-ascii?Q?ERb00RMHnXWi+5blofkt7Yi97djsQu6nPecFFJLarNvJroZT6KVX56zVHBsH?=
 =?us-ascii?Q?tYWMeghsj+un+3RqFfGfMfKUO/asqWP3UYWpUB03buaa1Mm2SBRsvGHfjFKs?=
 =?us-ascii?Q?xOiAAa3mnS0sL4v10aNEI7Vlyz1aLEFhrLS7dGLakBU1hcUauDfW1zT+yGR3?=
 =?us-ascii?Q?U7/Ca+h18mkWdq/q6XHaZ3ocP4Q1/6aZTh6Ad1StyaQPqBQu0hCEH2oHFt28?=
 =?us-ascii?Q?uV8iL/OqZ9fB8pwlnRK2xtQcargiKaOCHB1OzjXHiaSn24/iMtTZK4vu5L/u?=
 =?us-ascii?Q?1NbTTdJT4jMI4DCoRZcxI5cYO9r6kkbSQOFkIq/ZVngaccsqg8V4w87ZcSF7?=
 =?us-ascii?Q?I+0J2HcEUmsScs9TOjh/pl2zX7Bc+rrxaexEkRX+onWP+u0d/irlWnHSdOiH?=
 =?us-ascii?Q?B0QpYQXxZQnCMuyTcjBvVOkud9sOL7QaJjZq9qtzLEK0pIWm/IOiqQML94Un?=
 =?us-ascii?Q?N317IUG3sb5Q7hCIhXqguI8Cq0LJltBVFebvR/bKhsfAL3ARVzeD5Q+Nkejj?=
 =?us-ascii?Q?HkbI5qAQBmVLYIFFqWk4EUp7j1IbRAUD8eDe+OzdARsZfCL5tVdGfWHjm2Zg?=
 =?us-ascii?Q?yX6rQDQHrGbk+pKn8+fSzUjRF2y4zHCxozpbcTOe/6zMZIVkI4PA531dlN0y?=
 =?us-ascii?Q?p2LNhQsNO3Xx9dxCTxRcGoaSr7QJ4uBuiUPPZQSXl4K8L7w3xAO5dJhCPLQx?=
 =?us-ascii?Q?gMw6MV6FY9JikQDtsqiDJIZ8eAnzlJUq6wKfcPyoUsdKTqsJuGlrK8Gm8AbQ?=
 =?us-ascii?Q?SmxPSscbMwbOJyoOOqFFjSJtkyyvoZiBHYNHQVZbZdktDJ/bDyavHuUuyFqf?=
 =?us-ascii?Q?VX0EPAB8/nLNE85wNLxISTRJ5SK5aperzzXW5xt2oTcrSixlv0oQJ3KMCcLp?=
 =?us-ascii?Q?6hSnaYB+OaitjWWTfEgYx2bkt4w2tos6+C3WptScQ/Duv4gx2rJ6PUR0SzFV?=
 =?us-ascii?Q?sbExvkgG+0FSR69UL4GPemuuxzy1pcP2e/41l+zXwLrcW0gtgGSXjXHE2fwi?=
 =?us-ascii?Q?hEWkHuOIou/IuQuxMQdM6cNsDJ+ZfpOk6vXoMjvfW0SmEbjw0QUsLC19qzYe?=
 =?us-ascii?Q?fvGx004n3yHrhaIuTQ+k61YBAYI6Qr3/+OPODNy+hbWPt8whK81x945ZwZMx?=
 =?us-ascii?Q?GHmVqwGf11xnxpF9BG8eJn8MeC0Mq+Ke2RQa4silZ83svH+bLoFbHKu9qBXR?=
 =?us-ascii?Q?PO/hJFg/O1w0yiRSq/rVMAR1Y90Qg+AT3G1zFJuT8U2H0ysFk6nMnCAxd+T5?=
 =?us-ascii?Q?Rm9zSGoxznFWyTAqaZS0BrmVWTAZxAJK9zo3G1FwS6Y2L/o89UpKdeoEy3At?=
 =?us-ascii?Q?xOA9zh+ayAU2EWHQyp8UMKLqYGV4AczrqTRRNab/6IqvePwwZ/JGVynyyP++?=
 =?us-ascii?Q?egh3GWHxeirgN0tJ7qaya1qTLrZxNwXGejoGkqOHgI2oACmFqjjsFsUNSK1a?=
 =?us-ascii?Q?xO4oy+Ct0xh2pfrYQFkH3QdxVKCcRDwP+bfkRew6RdzuA1Gx?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1faeb849-cde1-40b1-6d3c-08def1755c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 15:39:09.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAqv7CF6lxxdw+61BKo59OMrdEeXcjmVPjI/dHTe+JWk3irjaSRlrrYKdmxYROvZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIC/6ulaqarXY3IGIkJVInPi33dtYtfUy6gDvVkqxQs=;
 b=IerCnIjsB11qr+V+BZqayMAuZs8yeaVWdrXoIuNE3KUl+Y9BLwueuCkL2si18huYhLIpe+6e9NLpEZ8jKkMeelHQRSR8Ybmw2bTsHSdk9VBqK51RpzM6dY4npm50KxYOtdsyIfJZkmzkvyKyR0SYhja5ylEWrzgyTGXsKGgOINw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IerCnIjs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [EXTERNAL] [PATCH v4 2/4] package/xen: add custom
 version support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Matt,

>
>  Add the ability to configure specific Xen versions while leaving the default version unchanged to avoid breaking any builds already using Xen 4.21.1.

> I think there is an edge case that if the user's custom tarball or GIT repo selects XEN_TOOLS and contains the qemu-xen folder with a cached set of files those won't be used.  We currently unconditionally do the following in xen.mk.

> define XEN_INSTALL_QEMU_XEN_SRC
>       rm -rf $(@D)/tools/qemu-xen
>       cp -a $(QEMU_XEN_DIR) $(@D)/tools/qemu-xen
> endef

> I don't think this edge case is worth considering at this point and if someone runs into it, they could add a new check for existence of that folder and fail out.  Or determine a better option.

I thought of the same potential issue.

I do have a test case with mixing versions.  At the moment, Xilinx has a
vendor/custom xen repo, but there is not a vendor/custom qemu-xen repo.
In my testing, I verified that a combination of the Xilinx xen repo builds
properly with the upstream qemu-xen repo from the qemu-xen package.

I know this is just one test case, but the fact that the xen and qemu-xen
repos are separated, it should mean that we can mix and match the versions
between the two repos.  In other words, if someone builds xen with a cached
qemu-xen, it will probably still build and work when the xen package wipes
the cached qemu-xen version and replaces it with the buildroot qemu-xen
package version.

Before we overthink it and add code that might not be necessary, I propose
we wait and see if a user ever does run into a case where replacing the cached
qemu-xen version with the buildroot qemu-xen package version causes a problem.

Perhaps we can try testing some older xen versions without touching the
qemu-xen package as a sanity check?  Is this something you could do?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
