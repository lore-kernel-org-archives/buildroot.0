Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A219FC021A1
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 09:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0447D40635;
	Tue, 11 Feb 2025 09:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnmawjtaCGYE; Tue, 11 Feb 2025 09:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D27C24057B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D27C24057B;
	Tue, 11 Feb 2025 09:53:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2186194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC5940FE4
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWMhzkoDIMCn for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 09:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=13030e94e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F9C140151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F9C140151
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F9C140151
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:00 +0000 (UTC)
X-CSE-ConnectionGUID: mvVCgVfxTC2/vH4e1X+4zg==
X-CSE-MsgGUID: QtJFLoGES1GQqLkJw2G2RA==
X-IronPort-AV: E=Sophos;i="6.13,277,1732550400"; d="scan'208";a="38119825"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2025 17:52:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lK3/CW6dxKLsQ/DTBd//QoVq8EvqbYafcqOQwoAeGs6ed22FxLGpEX4fKU2qTGfCvRWTxVDHfJTk5L79aYYvyBQ2VsV7BsI+1BSuCbb7daj1QTE35iwyBIWudr0r+ZXoQCZdyZS69l9ykQahGttfYT/fL0rH4ZcEUqJyG067/Lj7UH8Q39NvfxttEaeaItFPtiKASTVdjw/cYIWuj6URlPZjbDNXb4oYCjOU8rJru5Ojkym6VuCVvK7rV9q2VCy3lRpOuSoa79pQ+VeN09V/r8EMr51NbScMpDQGSnwC4HD/QrVofn1fyMVNscutzOYgIZ6dKz2IdNSzJxSzwwZTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfiOEqqzGb1hA158Um+13J7bpYICUg126wrxZuqBVSg=;
 b=QX6E2MCE1cztjslMSCvLruLki/ldfQsbMu74b/L2vWUJLxXoY7OJg4GvvUkCyzla0Eo9GLeheJ5vZY5eJsQ48usWOxy/YhKRQ9E4eJaqy0vMnWfw7SsvNWEQp6ntO8puv/NWj/WTwT26abvz5OJPdjJGqHvglWMzlQqGAhSavVoeeRb4vMtAwNjSK+oXDaEjcr+gM9/9lkx6pd7kQNqskFLHGRt8acRuj+TSVLMWOR/GngyHY+Ph9B6X/JOqWC2st1KLNXC00dlDLjCZ1N40dbehIFpA5GESdicqToY+HmuiSYFNMSP0lDWq5Z8bd94Hnh/I3r3PX6MUVV9wUEjSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM8PR04MB7877.namprd04.prod.outlook.com (2603:10b6:8:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:52:56 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 09:52:55 +0000
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Javad Rahimi <javad321javad@gmail.com>, Marcin
 Niestroj <m.niestroj@grinn-global.com>, Sergey Matyukevich
 <geomatsi@gmail.com>, "linux-amarula@amarulasolutions.com"
 <linux-amarula@amarulasolutions.com>, Julien Olivain <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
Thread-Index: AQHbfGgeIWGf+9VagECBtuYRdrcM77NB2tOAgAABzoA=
Date: Tue, 11 Feb 2025 09:52:55 +0000
Message-ID: <Z6sd97YCGqHvWT7K@ryzen>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
 <Z6scc31LdTE21rU1@ryzen>
In-Reply-To: <Z6scc31LdTE21rU1@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM8PR04MB7877:EE_
x-ms-office365-filtering-correlation-id: a8484a8f-8128-4c86-bdf7-08dd4a81dc00
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Cc3u4PSObAXm17bZnWUTj2j06uUG3ahbBKtzKV2QAf2MVpmmTccMXHHy7BKI?=
 =?us-ascii?Q?fKiSNXUWGUq/U0uoSHjuXHtruM4q57MasEQiMPFFbtUnyqpiX4efns01pSb5?=
 =?us-ascii?Q?0chaNQvocB/3lbrboIHWpmu+Nx+cClGyBfbFJLJvLknMq+AtqPt37WJ6Ti+d?=
 =?us-ascii?Q?jJEAFpF1IFvwObOzOpuqfRuXqjilu52Tc4fiVG+TMA1ltyqYcWA5620AWKy3?=
 =?us-ascii?Q?LZOz3vhLbWzVZ5EcaHa7tE8FKTqWnAZ0RpKjn1PSexspAgPe5EysLILRhylR?=
 =?us-ascii?Q?nIZBQZhBKCZVIW4kv0stzJxrRaiyNs7BptgBXfoqB+m1xjyOUNOpaa+vmscV?=
 =?us-ascii?Q?zbfNzBEmjATb1uBysRe3hf691/CdANS5uoWIBj5OCp3kT3F/48Y4fQ8XFLGd?=
 =?us-ascii?Q?MVfLfEnxGvonbzcGmPh5mCTAQqG4XO67Dx+On2JpnwPRYmXqM+5JXLi2WbQx?=
 =?us-ascii?Q?dbdwNNXT9Afak7cBCJgcjGHA9v/Nb7RnpAQLJgn/NE1g3FaKjc1d4R6RxRkp?=
 =?us-ascii?Q?AYfPx6R6UCJr/IErzp54NYO01m/BDzI33Z5nHVBi+4gYu13BcNUS2MPyEpOB?=
 =?us-ascii?Q?n8LVrbyZZz7eAD7iUTbBi8lDXtzn6t4zUEmG+0YbpNJiEnlxmyPnBfxc8pul?=
 =?us-ascii?Q?o0xGJIlD/U52mLeOTDOlUmp5g+Mzou95ANR7b8RTVL/QJHhU3wOWQRKcdjG7?=
 =?us-ascii?Q?L5vavc4c1OwzcgW9KNsBbps5wk69rb/iSzA7oyuPC6V6MqEa2jG0iFPpYUBW?=
 =?us-ascii?Q?B8zmCSW+boUgT6Q3xb9I8y6tlrNRd5Fj5rRTtEAlO0xXvia6e2EfR9r7E8Og?=
 =?us-ascii?Q?a5dd+qbVGmEr/cAK5BMl/IyqRgxRoHitbqxmH9dJaAjGhtnWeG+GwGLViEuw?=
 =?us-ascii?Q?TPdo21MHdu+SoV9m1ox2ZjcFAOMtqpXWUpoRiklwQcvvthhk9zC/eI/H7XrR?=
 =?us-ascii?Q?3HgmuiEpb4h83q8Wx1nJVTXf6NBbIThmz6vjkh0UYMGJ/oHo60/CXIQuwd9X?=
 =?us-ascii?Q?LTeJfkgwH91Gj/dUfxKfODvfMBkyieru8b6p+Tygb3r9kIq5KglAD8Omzjkr?=
 =?us-ascii?Q?ICq6yhZBtWDzD1+IZsrsMsEv3/KXabz3Ei5n1gHsVVv9i+oQSQxjmndEpEn8?=
 =?us-ascii?Q?EtIxqZU30mFUtux5qCFaKizfa0di4z2NIQ/KoTQ9+5Ju++Hg2wqf3jYyglje?=
 =?us-ascii?Q?QyTF9l4ouugoAG7nEzwJ8CS/lqaax8hnSOJ9zSlczueerZt1WikmKpB3+gb1?=
 =?us-ascii?Q?JDfTGPaPCOeTaXjCo7Q/EZVwtDbdSH7zqM8zjQjl1q04WaqJv2ybkgmDRBR3?=
 =?us-ascii?Q?aYkUX2KvHt/vVojfqBuTHAfkX+k9MNkjxlgKaL5Vzq/Ffx8RPtK83oWUgovx?=
 =?us-ascii?Q?oK1Z9kdlWl5JuHW8K4ojJpq+ruYcCGGIjekliLDfpCt7xy/yHyStfOzAfB3k?=
 =?us-ascii?Q?YnhGTysX80qMcCCJRirCknBVb26X/O7mL2e6OJFgJf7vJSsQDTPvgg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S0XI8pLq8h2ccrJoC5JtoLrY7k2iPTs+7xL4WQWIQ9KE2kUnEcGA9EXS63H+?=
 =?us-ascii?Q?6P0DuqAEy6GZi4PXHx2yvChNHPsVYIWDKqsV8so/CkF/C6qXYVGDqvmOWMEb?=
 =?us-ascii?Q?k4lndIZzYTRrqqDyeToz/6foomju5Tj2AEGe74YnJb916/rV3Ox8JEYZ6fFi?=
 =?us-ascii?Q?VK1ru8cd6O+Mvjc8KAAD1KsP7VCbg7hF1CQ+n2fZCc6MRrenv/3TydmwZXjC?=
 =?us-ascii?Q?PdvCHNYKJMZA7DHj1jHtsW1d9a5Bdm50VfxspK7XpRJitblLQHYjfMUWjWvc?=
 =?us-ascii?Q?3jZTTPO0x+F+j3k/HVDo6gApABtKpaXd1S7YECqTu/SXMPpMMBwzWK6pr31M?=
 =?us-ascii?Q?8WgYvVkvjvDCgdB1MwojTtJKrUhsZZ8HGnZ/TpzXMuDsnezDue+0+U/doNi3?=
 =?us-ascii?Q?F5gPPXVdTkeA2waALHtQTxhIiAPJpzpaPInXNYjOmPhPBMAH4NI7YcwJR8l5?=
 =?us-ascii?Q?P0SQXO7ztyMtjXyEtCEpVqBdYQH/TvGx4wB0xEglmQCzP1Y/CI3cVITIjXkh?=
 =?us-ascii?Q?XDnXoV2DxxUXOgMUM475l/RW64YUHMcNuSMscHiz1TUdrjKPk8Jd7K2MXZ74?=
 =?us-ascii?Q?VdDt6D69tC2Z1w/ak9NYwiEC4sjn+0hrJcIpf3X51yRr6m1NqjWWqyGCqOuj?=
 =?us-ascii?Q?e7bHbnEss1+8Tg23QkbEqKkZh33N5hpWqWiYnO/QT+jWq1+3vfIldfRqvpOy?=
 =?us-ascii?Q?xEGKRswGwV6A0HPjAwcNiA7pfFQ+7SeAVYedheeou48+GG0HYjyeUsjNb+ie?=
 =?us-ascii?Q?r3SGSa0GFVT7c9vmmdk7U12X6HxW2GCxlWGkqW1iMwQBw5gYTBBSq8MIKWZn?=
 =?us-ascii?Q?0iD8OvuAlY7ipN0whDORa1ob04si02/RCWvskdh9/+Qjkr0xhjUGQWuOymq8?=
 =?us-ascii?Q?eSC7AoNwI6N5rrUHoePhzurBnDWMRPVPjQqlt/p2ocF7yyKsj82BpEy6k7++?=
 =?us-ascii?Q?ghusK+J84E2gNOLE80Tp/E+dedahjiuXBqd4fQ1M+9x6qfHpvmBff/aR07Qd?=
 =?us-ascii?Q?1WfYw9VNn0tvKuk8gXairHwTfxF3vC8THsLOYVvL5r0U2Lsp4k1h7F/6hTFx?=
 =?us-ascii?Q?4v5siytDvDvyC3Wcsf21RlurpAJpis5IYhUXvoVLa/Mw255lLMlaHaKZ5Z4I?=
 =?us-ascii?Q?Xi6aIAVpTfeNcmJx5A9tg/HoP3E9FJF2GfKrUDTE6eNcKU7W4rPmv1wfEbW4?=
 =?us-ascii?Q?gPyLa+5DDOTW+d4CRfUq49wPfsTqKjKB4jSTyXJlodzV0lC6t5XvLOnQc+eM?=
 =?us-ascii?Q?u8ENRky8pWoj4FQPxwxscWeCUpTCbdNduFLIqjw6G6OSJdYEeyQhAFrqqgMy?=
 =?us-ascii?Q?25umxyfpOs9wAQOhht5BR2Yc5w8An4D/t8U5m7auOYN2DXIYwv6GW54OE/On?=
 =?us-ascii?Q?zXXAufdaN4hWZ80OaiYh1uEEQZfGHMFrFpoXizKWMQDEpXZZbaEoZmQaQX4h?=
 =?us-ascii?Q?pzGeS1DzMJVdHumM24ZM4kwBKBi7ZubK8I9Pq0FjAoGUOi5VRmMy+Yk7ZasP?=
 =?us-ascii?Q?6A6lUgLtqutYdnmMZrzTzr1fdI9SpD+xq/TE5cKc4nT+lkfWi9lDZGv3r4mx?=
 =?us-ascii?Q?Epkos74FVgPEf088fUvb9xcrU6+1/njZ9ZN27jhDKWeqSHu0aO9MLrYxDq7l?=
 =?us-ascii?Q?EA=3D=3D?=
Content-ID: <7B87519F43E21540B4D6C34D2C0615B5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: D7Hbd/v8bAYvn+yvQsaZ9EmqwK4TUL0cULg7gv5TpFwlcGGxTY70uvmKNyxs9ws0v9XqPxd5osVDe6p/mABIVdf+mRsPT8mFc8kGPTAlB5L0gQUU9np8vf+LVC6w0HPKA5GDp1UUjLb3+/Sreotn909lgQDsmiTZ8OdYfDfBBrBKhcPHwANJREZHLnM2xlFyenFp8D66V3IszuICFNhHAKr3APlexM6j23igNS1N6eDRmBDxl11dNE0w5T14qUpPW8V+3KgWmf7DWo1N+oV94/sPYyAxvL6Uk5kNl1viOpzRTHHodoRD03a1DR/TWLOubvuvrkmpLfMFy43y1+WKJeQcUlwL8sqgdouOtLICT15HOTlLPKoTJ7ZOMkr9F2EkU4ZpG5N9fsmZ08cc8olGMhtDi+lnnRZG9INwwCacgkmYfr83zIe0rtrp1kXEeLpf4qQIWl9o+ObvToVEjBzLVX8Qb3dCIuxXm/woLogQyxWiFHSScVPjw85u6PCDsidCiYxKXBWWm24Dkaw+XJj1KI8629o+V+DkHvdLNWwLkyGciL8NXJK6eowmQtGXn1GD7XalkQUYpbK1ORZmGUF9/86/cESNF6R7joPeNPTqHfPMIup8Ibk54z0AS8awcb9u
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8484a8f-8128-4c86-bdf7-08dd4a81dc00
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:52:55.8230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /G7YKvoIS9xq9VaMh9bIhEuTh6h7MuRRtPqjVym1OQ+uwYefN4UhRJqRNHp9uLWPmVXyN2nhDpNDjbpa3H1YHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739267582; x=1770803582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=WfiOEqqzGb1hA158Um+13J7bpYICUg126wrxZuqBVSg=;
 b=V8P68k0O+FzG5EiwPgHeoS/9ONa4KU9+rZ9/V9QLvynsHf167kbPq8R4
 zfzAYMI6kqpiLNPmoLr7tlcELggL8jAdPVOOfJQbndooJgvar8Cn2bi6w
 uNMTEzY9gr42VR6Bp8cFthL7G1EJyJrVzjW9Hd6vudlQ1dg191di+ATmP
 5uVInb8U9rFCF4BFKSUPg0tRANefLiJyA9j3FfV5XPv/MWRIwD3U5X+9e
 anLqm7NiIEMV9SyX4yHTG4nbGXisHKZL5h/4XPF3YXDd2PVcwoqEu+wiq
 BEWxYqSv99iQ4UK2BAzOptWmd1bL/dxGJVgL6UXTlTiGQDUO0N3h6hdf9
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfiOEqqzGb1hA158Um+13J7bpYICUg126wrxZuqBVSg=;
 b=eFE2SuNB2vc3yrAgGXC9gx2rsIom//IZ+ftCNfFZuG2d53H6lP3Gjt2v9g0PnSajlZGScQ7T05YJRhr4rJiE+bZgk4JT0jjdnlBMZ+hHSxeYXePa7u+HP8teiWUETuXOdJ6PPEdxeK/vdyYmDj2ukyxzrwck3Ua3aZ87T0Wnm0c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=V8P68k0O; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=eFE2SuNB
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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

On Tue, Feb 11, 2025 at 10:46:27AM +0100, Niklas Cassel wrote:
> Hello Dario,
> 
> here:
> https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/
> 
> Julien said that it does not need to be /dev/null,
> and that it works fine with just an empty string
> (if the default is the empty string).

Here is an example of a config option where the default is the empty string:
https://github.com/buildroot/buildroot/blob/2024.11/Config.in#L189


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
