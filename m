Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06059CFA45C
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 18:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51F940137;
	Wed, 23 Oct 2024 18:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIr-XADzcNv5; Wed, 23 Oct 2024 18:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820F1402E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 820F1402E8;
	Wed, 23 Oct 2024 18:35:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11EB927F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4EE340436
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGhk4q1dhAMW for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 18:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=019871083=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E90640153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E90640153
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E90640153
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:35:24 +0000 (UTC)
X-CSE-ConnectionGUID: FABnaNv4T4ue6kvHI5jIQw==
X-CSE-MsgGUID: zR685XqdSVmbrutqRc7Kuw==
X-IronPort-AV: E=Sophos;i="6.11,226,1725292800"; d="scan'208";a="29105832"
Received: from mail-northcentralusazlp17013058.outbound.protection.outlook.com
 (HELO CH4PR04CU002.outbound.protection.outlook.com) ([40.93.20.58])
 by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2024 02:35:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2CpgL2eOAgths859DOBLZbKQh+skmyXh9wVbdlD/QV8TVunLyhUlF3WOYFFe6gRuadFLhkhQ/dartjiDc+lkLwY0hboWbAf+Sbmw3POj2vu6TYgrsN4SIO0jvQZ+4uqkXWLMQAyoZOHQlLrkEQPamECEZYh90vsbRfiFd5lm0bkvMqXLa+vqpacPiaX9CWSl0q4kCabZR3SXePGaJSppDCQZCy3YwL9wVMh7NwHnaTu0pRweOmEEwFZ15spscAIrvHrXU+0JOoI3P529CKwV1a2sB/m/vfzo25QKRP1aQWYQNQy+Q7STmQ8nhhspdPTBcxsAlBJgbzSf2wtu6qD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERPkYpEW+NLKNSfJWzHLEXS2XQ/7MYnjnLAx5dDgZPw=;
 b=YO6A+GT2sbeZ6st4CPPuqfdVNs89XLOqX8iP+g7pO8WFjp3FgE4YI6gPuClXlnfWqFzEXKMZ+r5bQpm/4E+7OAHKtMNvuN68ROAXdg9x5SNGiftUmjB7QB4Flt8Fs/tBCvjWMoawW9mV3ZIwgcyLO71O3cb6OUAp3XEEZU5DMzlZ+QQ8JX7ZSVznSTALW45dBs1ukJovpbC4CRWp6zpaoRaFP10BxYIeMqYM716AtnS5hBHdPIwn7sq7ZD7S+imA9I61Ov4dNQEg3KxlHI+z+rUkAuVuOKc2rW3wvtJ8S23e88lGMhwzIDvNkeqtvwQQkwTfN9ZJzpUqiLnkLVKXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB8359.namprd04.prod.outlook.com (2603:10b6:a03:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 23 Oct
 2024 18:35:00 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 18:35:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v3 4/4] configs/rock5b: enable uboot-env on
 the SD card
Thread-Index: AQHbH87ehnYOW2ksGUyZmuAUmX3f0rKTSH0AgAFsbQA=
Date: Wed, 23 Oct 2024 18:35:00 +0000
Message-ID: <ZxlB1N_gyS4wEhXL@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-5-niklas.cassel@wdc.com>
 <20241022225040.09c4ca7c@windsurf>
In-Reply-To: <20241022225040.09c4ca7c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB8359:EE_
x-ms-office365-filtering-correlation-id: 80cdd5f6-e6db-4a07-1683-08dcf3916738
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Se0/+T7uyTQcwIyHlDflzRTrCX1idK8GFB/M/Y45Kq3WH/kxl76X4XrS9Kya?=
 =?us-ascii?Q?/cr6gpLTcSsqfoYQnvDkwYl++W3mTdXRaZeCQxsPpiZApusV2O/HUE9fvDG9?=
 =?us-ascii?Q?QRgByUElt57T8bunvQhBw/StIuLWycfOGxiVRwEGa2qG4ix0Nomh6QDYwP6s?=
 =?us-ascii?Q?MO/a2COSoWLMT2fgBaoIeSbo33wSC5/uRUI8oc01eUO4j9OfPrzYzZtVpmdQ?=
 =?us-ascii?Q?JEqSEMbF6KMtzcZGqf9qLDHjfhYWqfvCTjrBuFJKWNZFfGnRVs2NXJxAtOJZ?=
 =?us-ascii?Q?9vgq7ca+5OJZxizW84KM9DPiHp6xwY22RD2Z5idMJldlqLwMbfSjgrNAWOOQ?=
 =?us-ascii?Q?iLOCz//xXZSlWAWvUvKo9epfiOAS+T6dbWfmsRjD+38ZS3AVgCKSeEyY5bfx?=
 =?us-ascii?Q?tGsTeB3uz7xd+6Fy+pSJvw+TcXfOOQiHvpK58PHwgTgEy7xn448LfC/yE0ri?=
 =?us-ascii?Q?eMu+TszM4+O1yfbhb8sKbKPB7YjjZ8Gbmz034BzJgNo7E5dBbOSjANav+rlx?=
 =?us-ascii?Q?KwwWlyOSU/cZ7yR+xFNTwhwOWV9l6B9HzA595vPgl0MlmRljvTYbFq2GleLf?=
 =?us-ascii?Q?aIWJoK51tN6MPFVt4MxSpr8oaMUwT0CH8UrRKVpEFcbFomkvTcfVK74bp7XW?=
 =?us-ascii?Q?lsy3i2MZZooNvQP8uZu8kKeP/esWq23Auwq/6hj2GJnL1HKv+GqdE/Kuxpb8?=
 =?us-ascii?Q?wtIccCMq54haPHFh53GnyW4GkNuRDFeNHtGPyTd9Q+4pYuTpoziCdto4EUea?=
 =?us-ascii?Q?M4resg6kfDHzX07giv0bMgtP0XSEHQIApj6v+2iGI7HMuLjdKcLd2XIHYVBS?=
 =?us-ascii?Q?YUIIe02rCVuG/HSszBCjBwVDbXDT/vxk8HiLbSyCB/u8EKCnbSXReYWQ+a4Y?=
 =?us-ascii?Q?CP7md+fZs1j4vSLUjiN/HF++BMFBAzdpwSby3qyCcVUZ/vnURIc2NiNFfS1V?=
 =?us-ascii?Q?cLwtuLWnMmAKzmDwCyKPU/pm5kHYkiJAN/mqOHVZjneWyP42vyRNndQrPrwo?=
 =?us-ascii?Q?dUCZHpWp52qgq6EijfYDL8PQAOKoxpneoXu5Br4Y4TN9ZexLt598yirGXqhp?=
 =?us-ascii?Q?4G8h6iR5fv4wPasL8P96Jwg+vUeKj1p2B6QYygpIgANYzrf7kTlbYyb85L9w?=
 =?us-ascii?Q?GMVVEkMbbWD1XJrkiq51xn2e8DTHMqsR196VFHIjZNbHMCfRMoIMgF9xWuO2?=
 =?us-ascii?Q?TVCcjHdgegqBxPpxHGJaMrxYhsvdly2zmQlLqIzMtAgTmamYBjwuoDTCBHhg?=
 =?us-ascii?Q?nAMcwR025PSfHPQ0nun3kG7i2ZYqZWCPiNhF3hyjWucozMX10zw/YbNdjqmb?=
 =?us-ascii?Q?s8tguXF+rzDmtBpacKtGWYGMssXAXhaRocx+3/5YWF31zYudK0wswZ2TqswX?=
 =?us-ascii?Q?G64jeF+hEiMMIekqsuHnYGmFTbJ1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tbv9ToXlwMkDADRLQ1o9KT67W4qz3ZOPaTOS+Q2crasWHaBZoQVlxYkktK9a?=
 =?us-ascii?Q?bdn/DPXcnhlZCGazRy1VXSJGL4+6YqzPz/6ozKf83ocyINj/dwdlsU/TgeDw?=
 =?us-ascii?Q?Zg3KBWyDR3DFFCg0m8ykZleI3lA8mUycU6HR9n7SUzriZTMlKUaBH3TGw2/G?=
 =?us-ascii?Q?a6rfiDCgZ1fkqXeRKJXPUnU6h1UyZhe6/nTEyyk7iUmGkbctvnOGANLgoYAK?=
 =?us-ascii?Q?VvtJkX8v+RE0duFKxjaydsOBmrR9CSS8yRvZNmxChVTJAvdJ3Bk/V+uEY83E?=
 =?us-ascii?Q?73RCxosfmKjBVIfA6x6TfK/ehMh7A6HB4XMQT+6LRvTtPn/w/jDghnoWCfoA?=
 =?us-ascii?Q?kO+heoSgssrMCwXT8Ig7wr+8mgqHTr6b+u2VB92433r89xi3lwYHjL0rwXT0?=
 =?us-ascii?Q?PlT/J5Wuy164tzGtxI/ofFgwX1QuUHmsGZSRvoKaammOv2iVTwnJKsKKu1JH?=
 =?us-ascii?Q?fvVyEIuIyXDsRFyixLH5bD2+WOTRH4CVl4z0qPdGAobDQeuUw8Vg8qdvbsGS?=
 =?us-ascii?Q?AObAhutxslXwQMdBxVgT1WQiG4XYr2wgDoMAM5PkOq75bG4rUNpBsTMlM+6H?=
 =?us-ascii?Q?p1WYMu/KsAwZrEZjqKIEkMbKK3R0OOwpZh08499MDY8IhjIeBbHw/GuYFzMi?=
 =?us-ascii?Q?sAUcs1Ib/lvhJY5GR0yHgdU2CMCN+mUu4PBnT1dY5e2SZqN1g4rr2sYlGGa8?=
 =?us-ascii?Q?d5uFMYoOOOrwsplSdXEmei2R0Vvk38+m2QzTWARN1cSzDoUd0fWenYwwDGSc?=
 =?us-ascii?Q?yrFZtMuaUtzDeXgtUS3pqWvV6DWByaGJ+kw9QmQkLNYGZTiJ/DBSXWIvJO7c?=
 =?us-ascii?Q?qiHCHmlbV7bt20r2BJe7UAclIzJEscprNODULE9rmDqdxycCZsAYAr8l8ZCM?=
 =?us-ascii?Q?nScRzERyBAT3snTstacYCIuTXZVUX3VPQ6WhNFyCR5WyD9hmrgH+25uKwKBo?=
 =?us-ascii?Q?SVB+h7xcWVsaf6bAxqk3VngmdJ4KrO384OCWm+n8wx7vuoFkmbx5U9LRoFz0?=
 =?us-ascii?Q?mQYEztawUAuyTQXlfcPjcLJSpbNEAboi8N73bmJsIgn2jRL7n1926Dv+ocCB?=
 =?us-ascii?Q?nEteY2L+il+ns4kHe1YwHIaMp/SWrS8BiwFqqaS1CynjkW5JLNH4fnG9yEZj?=
 =?us-ascii?Q?Jg7GXfsyzR9dV/snF1d26VuSTYwjt+AfFdVaBaA3UdYXW9jJQs8o3mDrQswZ?=
 =?us-ascii?Q?DGdFOdbrT6pqVk56WKUngbC3zXIXK/yZvz04hrNqBrNwpybDOOtfFxL61kzH?=
 =?us-ascii?Q?2YbBBZXpyO/Srgtg/cgZyPyjiCVycKo17uTL9NXeitpMPDdKuJv1fV5tCqvU?=
 =?us-ascii?Q?GzIWxvSIVQ3z6td3q7sHFAAeEaiqsacEL/s/i9fFfW6BNAwmuZrCK9f0xdx1?=
 =?us-ascii?Q?J7SZjzSeXNLXYBf5n51WgaYveI+H5imlr+Wx2VruVGhEniqNhdLP8KqVVRra?=
 =?us-ascii?Q?cqRoBG83ZwxBJuYNmrpF9mdSocX6dej2Jj8kMTjAQuBhyg2if35g3+37ERfp?=
 =?us-ascii?Q?g6rqL9W7jwqzxZEAsOzpSR0CF7A3kJUtd4H8XL/edvzBxfRD8kS6CoTPYdsf?=
 =?us-ascii?Q?QS65Ye6WmbRbm9ngtuK1XvHt4nGe3M+vWsJkNnghKgcSU+YwO78PT5XspCNy?=
 =?us-ascii?Q?BQ=3D=3D?=
Content-ID: <8385DC1BBB627A4EA5FA39F92DFF41DC@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FuroD62USi+CC4oLMEiKZQHGKzrsUkVeOti4uEb1lOe79cl49SSFAL/86fHtMoChIscm/442XSaa/7eI4vYy37GZ1Lzgfffyr+gIYBUlQwjRq3IZVw1Lm/1NtXVJDVpFWN0PYdYPO9s5lF1t2KCZ3INApkftf8TE6FY4QUMmp3G/MV7t3NSRUByz9BvG4vMNv2xe/njrKV8qCYtgTOSrQMnbVcxIx/neSMlnWb0ELxNS9gtMCSJYkl5PEjX9Hd2BLgJprzbEgetv2IWIU+BnDv+0/xrrySE6kWjTS28BCK6PqnNAWvS8uoxXGVAEy3kSy07UUKA5pE13D3c1OMQ/Sf6T+qijEiDzfkfRVSmy7E/H4IIDbbqWNvy6es3SiufYHjgz05gnM7gMQhnVSCDGEe7/roj9vEF/eDdBY1z34tQacmWpmq90hfWCpbKSe2tZ/ANjPpRef4dqXGW/5i+jYcKqtPuFC2B0Jeg76pYykopxj0QCq0k7RLJuperl6kT6C6Unp/MuxoJqlm1tS8lH2AMqjHaZxT9OuMekGEo5JWCepgPPl2Te3LVqFYHiOa173SIfw94DkbFpRXYtD2jHJuknPkjPizCBzzb22iv59900/o9bkI7tLd51T2JOdJka
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cdd5f6-e6db-4a07-1683-08dcf3916738
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 18:35:00.6864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5DTVwltdbhxdegQ0dZYnbHMVlr39Y8fAzgr/f5rbkcbiqUCjfgM3Bkz+BSgU+jUW53YXxckQepDPStextCcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729708524; x=1761244524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=dEUoa81wgySdg2I0IpOrnTCKlxz8MMIbE5/SiLVwdBE=;
 b=bUc2qXjm0kelGgYBdomam0TkKTJ9zMr03TV6u/HKLVTLlwIMKNLMegpF
 +TjBtz2A1jfjyxxMn88mkwrmptz5+B6HGZNU+buo+t5PdP6Qy6eSXkHnd
 FEx5gSRjCw4mGKr2w7wprN2rDn+8PDxgtDwj/8TU8DrOdZcgaa9i8Jge7
 wpTQ3uGSJySolM43Xeim1oowcJhuJlAtLrHQGJLxmhyfViPZ55Fc6v0+n
 WXPVqDI4hu4uqJe82utBqAvxmtoztCngDZsKSBKLNyhw+wnwpMZg4iynS
 5puxolEjk80QKf0f4z9aOwsI7zrH/dBfd5Gq4E9+e5p12ppZOgCpm8EUl
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERPkYpEW+NLKNSfJWzHLEXS2XQ/7MYnjnLAx5dDgZPw=;
 b=xMzt5d+JTgOm7Rp9PI5gOan3kWi6/MAyT8pntKXjkfSYhVjDSm9qer4Sa4ObkgYhpQH9jvfjuain3SXPV+G8RWtNfWX10tOunmaT4XbTn45rCD3CMvR9FbKJwPhGg82aVExKv3X56kT6Krl7yfLRwGLbcU5BHgmytL6T+gk5rTM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=bUc2qXjm; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=xMzt5d+J
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 4/4] configs/rock5b: enable uboot-env on
 the SD card
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

On Tue, Oct 22, 2024 at 10:50:40PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> On Wed, 16 Oct 2024 15:24:43 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > +	partition uboot-env {
> > +		offset = 16M
> > +		size = 64K
> > +	}
> > +
> >  	partition rootfs {
> >  		partition-type-uuid = root-arm64
> >  		image = "rootfs.ext2"
> > +		bootable = true
> >  	}
> >  }
> > diff --git a/board/radxa/rock5b/u-boot.fragment b/board/radxa/rock5b/u-boot.fragment
> > new file mode 100644
> > index 0000000000..e332bc0c79
> > --- /dev/null
> > +++ b/board/radxa/rock5b/u-boot.fragment
> > @@ -0,0 +1,5 @@
> > +CONFIG_SYS_MMC_ENV_DEV=1
> > +CONFIG_ENV_SIZE=0x10000
> > +CONFIG_ENV_OFFSET=0x1000000
> 
> Hardcoding an offset isn't super nice. Could you try using
> CONFIG_SYS_MMC_ENV_PART instead? It isn't clear to me how it interacts
> CONFIG_ENV_OFFSET.

I can't use CONFIG_SYS_MMC_ENV_PART.

If you read the Kconfig help text:
"""
MMC hardware partition device number on the platform where the
environment is stored.  Note that this is not related to any software
defined partition table but instead if we are in the user area, which is
partition 0 or the first boot partition, which is 1 or some other defined
partition.
"""

So CONFIG_SYS_MMC_ENV_PART is about specifying a MMC specific hwpartition,
which is different from a GPT partition (which is usually stored in a MMC
"user area" hwpartition).

I sent a v4 of this patch that uses the uboot feature which automatically
loads the u-boot environment from a GPT partition which has the
"u-boot-env" GPT partition type GUID instead:
https://lore.kernel.org/buildroot/20241023182509.2808544-1-niklas.cassel@wdc.com/


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
