Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB480CD98D2
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E817820E7;
	Thu, 11 Jun 2026 19:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nKDfUgiRdM9; Thu, 11 Jun 2026 19:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E726820D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781204533;
	bh=ZBjD0mnkVv4T40tvF+yoWE7/JhPvT1jQf2TmjmM3vNg=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V59tiVWuJtKCGq1JSLnMMGS5BAMLHLP8/l0pfiqg64/ApSN99jZD8opsM68Uo5h2E
	 gxmtO9tdwHd4R8j4z+/y1TAyK9kWDA8asTYBBPdVm1ekZRO+JcLdtpLFYasd6oMilh
	 ibTgU5fGQK4yj8vPCK7s3mzYmivhFE5etaWsa6kOS+vIbgc1DKOcx7UBfJWY6b3QIt
	 CCZEd5+vvTlxYZYpOzqSX/V14axz6i30h1Zg+K65fOAozBRbw/r6VdoH4cLpd4yoYa
	 BJbdTkCJn/oKN/zKaTHo2VYUTehnSmCOdS/TLRhpJru3beTWMsUP+7zIjKAHv9suWX
	 vLZ5PGq+CHplA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E726820D9;
	Thu, 11 Jun 2026 19:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB32712F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB8F54043E
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlnObNcO0Yn1 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:02:11 +0000 (UTC)
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Jun 2026 19:02:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB05A403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB05A403D2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.20.195;
 helo=ewa-mbsout-02.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB05A403D2
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 65BIux6E051919; Thu, 11 Jun 2026 11:57:04 -0700
Received: from XCH16-07-06.nos.boeing.com (xch16-07-06.nos.boeing.com
 [137.137.111.39])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 65BIusNg051884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Jun 2026 11:56:54 -0700
Received: from XCH19-03-06.nos.boeing.com (137.137.111.45) by
 XCH16-07-06.nos.boeing.com (137.137.111.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 11 Jun 2026 11:56:53 -0700
Received: from XCH16-07-01.nos.boeing.com (137.137.111.34) by
 XCH19-03-06.nos.boeing.com (137.137.111.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:56:52 -0700
Received: from XCH19-EDGE-Q01.nos.boeing.com (130.76.23.13) by
 XCH16-07-01.nos.boeing.com (137.137.111.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61 via Frontend Transport; Thu, 11 Jun 2026 11:56:52 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.23.13) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 11:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=wbhRKKC+iXqKUE4ZRUx6kKl+6mDM6kBIyzTPi22SYdosqCoOSGeta6kf1fxwtyni7dZ8rYfNPthS6LzyVoemISmeOoQrTwkc1SIBolK6sCMlmW5oe2OAAFgWmUjCB9khQD2PWkzdp7EXC2xvpgOGTncu/Sl6BoB4TdKOGXVnkSDZ59o+V7sh6peU6uPA7U5tOm/vItRAwGFp1vAzEymHJAdR+DMfax4cBoXxeLYqGMkK6YH/FsQRta3hPxyRqHPd4sVcAnePonLfhV3BXli+MaNLqHDzsiZ7m6TsbmzQykV3dF2W4R6sVp/dFGt7zLCy1odXFZZPrrKx2VqzD+NUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpgpobMZv6zKgUGSM9hB+7W7rHvKNJLzIXykJa5khs0=;
 b=EW4h8hFnYRwlaNNeUON3Odez/GBidgoOgevVKMNDmrQ4MCURwLZS4aYiKVR5bpASMhG501Ui9fusp9CGduAvZ4muzaX/f8KX+Iac9C4Qyf2nuAfGHGsnKoX/ZmEiJ2mpNeeRNapd5WKQnPbU+DMjuv72kgH0C/cT/20ZBQfkLiKOnSvrbCQFHxVjLtp+xzRTSFtZ6FgJO38E6nQbwtixzfKEkYj25gau9A1h5ahHLsF+Q3l6nnvcuOwKm3AiuO88ldQHU4RizXlqG100V6gFuFvpVjIywKTxGxEQpYEAUdqKweYpuD/n4eX6BF9qm+Jyu4hJP68ul9MBDl3p2LfbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BN0P110MB0952.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:56:41 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 18:56:41 +0000
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>,
 "Wood (US), Brian J" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "michal.simek@amd.com" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [EXTERNAL] [Buildroot] [PATCH v1 3/3] package/xen: add custom
 git support
Thread-Index: AQHc+YwT8SSMwtjjBkGmMPhSjK1QWbY5tKAA
Date: Thu, 11 Jun 2026 18:56:41 +0000
Message-ID: <BN0P110MB20670D05F9D07C9A05508CBEF31BA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <20260611101734.1968785-3-neal.frager@amd.com>
In-Reply-To: <20260611101734.1968785-3-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BN0P110MB0952:EE_
x-ms-office365-filtering-correlation-id: 7c1f25df-ab8a-49e6-2c6d-08dec7eb2cae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|7416014|56012099006|4143699003|6133799003|38070700021|13003099007|18002099003|22082099003|15866825006|41080700001;
x-microsoft-antispam-message-info: 8yEoCZXnPtnnoSFP75M8tIpdOd24xMz2O2L3DyVzH0ARknbKsgTL6zW18H8L74CDa3QIEfnW+ioupJzV7u3Q4fU6aADffMVFROVs+DVAB1TFvFoEhamveYQMiPL7nILs1zcaqLYQIEXbUC2i4CO+nk9CI7nAeykZffmb2oglXFQz5HCWH0LG1um2iilI4SiHbTpOX7LPl2pLPef5v6fBRGvcq8zbRnI+hi2+caz36eBnOfuPNGgCRHYcCWLovRH3mOEjzyD78n46qIqTrv7+bBYW54Nz2MCf8g0x0qHgTaJ5FQ3vnDDThZyvpSmJO87SOXhgHZ1dfoEpFBxFF0HGzkSHsR+12g83c8r+fwtiB3BXbOgzOYZlDzfJFCNKcdW4lsx8s7Fc1eJlpR4vxlfl5X7khqG4uTas6Vq9YpSBkDZ+6wKMNK9QC6MQ/7qodut7LliUQynWX9Lm2AKRcm2yOiqXoC3MTHzVDHwwD5bMT60Q07OoZCyam+lucMWE3jpxA2OAxJGHjFU1TxxRzDZXNgsR7VLOYH9kS3bdP3kgwQDGxyCQcogJ0M8PrsMAbxaRs5b9v7psrHYaMVBm48jhND2iZIA91LHnkgILlWzF8sUTDP8gW1vJoFRZOVcQ/FHPNRXMVCMllDQ2y0rXfN51jI8m/X6HWrAO0Ofci3nL0XdNUo5bGUKQmDZZ/u8C7pK6h5oHLdXgkFcSDhG3Xu0nBqOc6PECEfegt/Ah7iyBLLsycXYYECx6uxmwOQSuQ83biE+JwBQeJ5MPpJDICnOLwY1OuE8jl554YhLclq21+sMP+98/KdvkD55y9DDNbFkp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(56012099006)(4143699003)(6133799003)(38070700021)(13003099007)(18002099003)(22082099003)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M/K7Pg+n7UayFZgLWHi8ggRH31SR1D+ZeV5xk5NRXBp6m2v/AupS9AF08nD4?=
 =?us-ascii?Q?sKU6Gk4wx4o2uhxDXePWISjefUEpiGeQ8pm9wNJ7YSwFizFlfovtIdKwaGRE?=
 =?us-ascii?Q?Qv9eU+sbuKLEbGRUOiRk3zYLG6KGrJxK5qLQ/5Zx/XQdYir/i6AlXFYNlF1A?=
 =?us-ascii?Q?M54ZosNcE61M6zZr0IIadDcz9ihP+G7JJ1kkFH6Ug15XcKcb8hlj7WHsKt1O?=
 =?us-ascii?Q?1cjV5B+ct8XE3XoCU+TpSbHGKO+BogvNNS82awg5p+GiB5ldLnOYtN2OeGjd?=
 =?us-ascii?Q?nUzfZaqkbFT9KsD6mXVrkgDAIh2tf7fzxFyxrEDF8vRElO3RdBNNXclgPmdF?=
 =?us-ascii?Q?2iU2fVVqcXBB4hxsJsAg0WhePZJ5ipTmzRpuXDdLI579il56on4HQxY7KOh8?=
 =?us-ascii?Q?/hwmanlAcrvkTv8d5FeHx/XDAV1+SsGMlnqjlYhZ0pQMHkEhiGvdJWu64cSN?=
 =?us-ascii?Q?Z+AWqMk+ZdxZeEv1ykjjR7P5ksQUDo5rb7F8ZtUfoiYlg7YzFIWwDC3oGghh?=
 =?us-ascii?Q?7+1Scx77JwVrktX5mnZTWnMGBujvxR+di3e1LnB7E+11rlt4VlFZpyH/kwsn?=
 =?us-ascii?Q?XJ47tmNvtlNizYQYSfd33mzs6zL0Hoo/CDk3FtNjdfJfrrC0Z4u+I8gL1su7?=
 =?us-ascii?Q?VbsWahp0+hvYnuhSBJJeoxgqHXgJVXospmsr0hZMQLdV24ESqmAUXNh6atbp?=
 =?us-ascii?Q?WWIcP/zKHghPu4AfZcFjE19C5wGWHfAkbET/BBQviJ2i9jrPazJ5DiOucsr9?=
 =?us-ascii?Q?GXvSvj8nUFW8sFlevmu0d8ptHGhOP2itnM+C5SKieNSuRioCzdwPBkupknmV?=
 =?us-ascii?Q?QG51+Kx0NyLI5P0JqInX1auZEMhGMFbBevDKU6Hy61peI8EqWcneo40d53MN?=
 =?us-ascii?Q?GnpshwLwwJhkmDoMnIguFCL+WjSsIZamZ/VltWxCFV9k2QGdpFHyVdjl1IQY?=
 =?us-ascii?Q?g10nrc9CFYyAdTXEjBlF5A3bmqVijQIG4RDZYrrAHg2WKJXWJqhNE0lbhU8T?=
 =?us-ascii?Q?Sx/qoAIfU6Z8ImnWdnu46hkFlXgwUeZmq6/FIbxRdQgn/rTl/1zQcZaVj5Jf?=
 =?us-ascii?Q?JznSjxKDN+tIbSbwX1SWGKdPw5qnW4ZW0JJ90N/CDSOPAAgATRDOjCGCUVXD?=
 =?us-ascii?Q?OaqRi8uQIkG/WMgMWq4ceifVt1SEnP93Rp/9rRxaP+RNC4fmSbNe4fRYSMy1?=
 =?us-ascii?Q?CDokeVhxPFC1lj1ojf7NVQ3PRgD5Oasp4oT7VGlFCGKXneptvMuoj+weM9Xs?=
 =?us-ascii?Q?r+9olHseH4HqSCfK6QTfnF7vkp5YpSP9hEdLK1pYP/z9K0DxmjOMCG9kvHv6?=
 =?us-ascii?Q?4K0TzbtGQ7EDZw2mS+lJ1OxUZ6ancM982poLEv4V4rdV3Kb3rsCTnDgb1VOg?=
 =?us-ascii?Q?58i70LunhbFIoAaF/nzMVXpWQoxgVo6c4DnJeXvk2hht0J13RxH6hCwHSl0r?=
 =?us-ascii?Q?wsbQvE0Hg99FRruGHQDZNCQwsr2COd8u2kYG0t57jJpVRBhvqtlpyk3K9v7G?=
 =?us-ascii?Q?6vjB9QALKRQX56KTL/iwVOMv9NrhpUDOicHxftWrsTSNwQiSeJXbu+bcpzL8?=
 =?us-ascii?Q?Z6jTsyYQJPuFdTnkg1qZzHm3konppFgTt2+i9XWvjtk/+netSMhPQlYLBzHc?=
 =?us-ascii?Q?DVVpHihK/TgcAOWQ2LNkZjy0gVvftT8KeF6oJE8tvT7PYq8g10TTXMVJKg7h?=
 =?us-ascii?Q?yFRM7g=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1f25df-ab8a-49e6-2c6d-08dec7eb2cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:56:41.3927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0952
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1781204224;
 bh=NpgpobMZv6zKgUGSM9hB+7W7rHvKNJLzIXykJa5khs0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=nZ4PGAlA9q5PZ4V1fZsbAc8AOvXZ5T9D4Dylu/Kkw+iScB9ZONUr6oI5H50nj0oTO
 aNG4n/09QzJ/bSIOoWbqxApR1gY6vP5BFjKy3g83A+YE+f2qOcr8jdTJApkcIyaBs7
 gGpuDF+J/KUT1I1ponsIEDVvG9ipdd9WntD2nHxUWVknALgRKx1LI1UziQs1SEDb/W
 2HyjzBSCFfAIte/00ZP1cXRdP1W6jHo6aSZlFBhjfeNghjayVxqASEiO5lszRLiDpu
 yaWyNE29lmdN3irm6K75qipC+qAQ4tcKXdaj34vhIkYzvxBjGE39/UxVkMt2nSM1cy
 u3FcuI/OnjzYA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpgpobMZv6zKgUGSM9hB+7W7rHvKNJLzIXykJa5khs0=;
 b=V3IqtVk0MsPJccmNisAKAvdSlPh4Q/9gKIddAA0NoqTU/0VKD8JMJQU4SoTg36Y46o1UZulvKNBrLsiBoUNbEhzXj0bJcJ+tBAdlvVnS17FDibQTtz4xsWOWh7jHOnWXeona9qsxMel+pKBBoUp5avIFNiDoNCCZZgq69H/00gw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=nZ4PGAlA; 
 dkim=pass (1024-bit key,
 unprotected) header.d=boeing.onmicrosoft.com header.i=@boeing.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-boeing-onmicrosoft-com
 header.b=V3IqtVk0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
Subject: Re: [Buildroot] [EXTERNAL] [PATCH v1 3/3] package/xen: add custom
 git support
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
From: "Weber \(US\), Matthew L via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber \(US\), Matthew L" <matthew.l.weber3@boeing.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal,

> 
> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Neal Frager via buildroot
> Sent: Thursday, June 11, 2026 5:18 AM
> To: buildroot@buildroot.org
> Cc: alistair@alistair23.me; stefano.stabellini@amd.com; ibai.erkiaga-elorza@amd.com; luca.ceresoli@bootlin.com; micheal.saleab@amd.com; yann.morin@orange.com; Weber > (US), Matthew L <matthew.l.weber3@boeing.com>; brandon.maier@collins.com; Wood (US), Brian J <brian.j.wood2@boeing.com>; ju.o@free.fr; Neal Frager <neal.frager@amd.com>; > thomas.petazzoni@bootlin.com; romain.naour@smile.fr; michal.simek@amd.com; romain.naour@gmail.com
> Subject: [EXTERNAL] [Buildroot] [PATCH v1 3/3] package/xen: add custom git support
> 
> EXT email: be mindful of links/attachments.
> 
> 
> 
> For completeness, add custom git support to match the capabilities of other packages such as Linux, uboot or ATF.
> 
> To test this feature, add the following configs to any zynqmp or versal defconfig, so that they can build the latest release of the Xilinx Xen vendor tree.
> 
> Add to zynqmp_*_defconfig or versal_*_defconfig:
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_GIT=y
> BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
> BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="646d6c883ef433c1a9ee1145f80a4262986698af"
> 
> Add to package/xen/xen.hash:
> sha256  834b1834a31d79e91e7943457d8c78ef8bd95c142ca5f347ab1c4aeaa4b60192  xen-646d6c883ef433c1a9ee1145f80a4262986698af-git4.tar.gz
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>

Tested with:
  BR2_PACKAGE_XEN_CUSTOM_GIT=y
  BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
  BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="646d6c883ef433c1a9ee1145f80a4262986698af"

Source cloned, checked out at the specified commit, and tarball hash
verified successfully. check-package passes without warnings.

Test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
