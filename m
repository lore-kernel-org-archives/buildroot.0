Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B342DC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BD14122E;
	Tue, 11 Feb 2025 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rdNz92qR7ZM; Tue, 11 Feb 2025 10:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89E9413C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89E9413C8;
	Tue, 11 Feb 2025 10:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD0B6C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 10:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54279413CA
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 10:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lP70HrDgl5I for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 10:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=13030e94e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A6674122E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6674122E
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6674122E
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 10:13:18 +0000 (UTC)
X-CSE-ConnectionGUID: R65oTu/WS8CP9G602cpxbQ==
X-CSE-MsgGUID: 653tUsJtRyqKdPhuZDpEpw==
X-IronPort-AV: E=Sophos;i="6.13,277,1732550400"; d="scan'208";a="37553970"
Received: from mail-northcentralusazlp17013058.outbound.protection.outlook.com
 (HELO CH4PR04CU002.outbound.protection.outlook.com) ([40.93.20.58])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2025 18:13:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsg9iezFa+t2GPcBf8uXqfCY0pQhVhXZQBrII8y1Y/xTcRP9u3HasfhhbnYVM55r4g5Q1Jbt5uxOJTMIuWsSjsi9p/CrRVOFQnAm/XLehtO4Eiln7e4F1dFjVRf7GUfq96Yeohemiv0hFaHF3ksh2p5JaxxHR+zMyEr4cGzMvbc2CqEP0GrdyCjz7443BW9NXQJthRvlTME2zFz4t8+vYq7eiOESPlYC4QfrlqB3Az4Tsf+NJgJ4O0loeALlnUGfN5HXOr7QmiKFGZ0L2vG4jlEz3DuGbWgCDz+43cIpyIKZpkQu4T21GtlyN5/jILD3QbJ1TqTqouWgizYUgPBYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iehXsmzY8mRCv8q9uzg44ZITsZIqZIA9AvJjon07GU=;
 b=WVx4a0jVwhUTLtBvRKAwH3a3nJOIHUi89WelGGb0jbCL41ox2KuimSL0EJ8HU2KNNuuLZJxjgmnG+cIjZdu09K5HtrdFz/P16oFd4k++KpDg2M7ONoSXkUcT6ZATkCeqYvVvMxQDCSDj9jjSIZRdDPTfWc4pYc99xVgIv2YdTWLIwwDCvvxKK8Ck/mjbbz818hGTpsT9iiBdMvOJk55DjfH4u4FLmi10UCEfpKLLv2aCsPsa5pBMHlMApulR3B81mDA1kF8L+0tTKdHuT7sofChcaDzI5SObD7SH8CqsxPZ4vxAYC6PCorkixPxqPs+aBjRF0XZ1osaurwELWXMS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM6PR04MB6512.namprd04.prod.outlook.com (2603:10b6:5:1b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 10:13:11 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 10:13:11 +0000
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Javad Rahimi <javad321javad@gmail.com>, Marcin
 Niestroj <m.niestroj@grinn-global.com>, Sergey Matyukevich
 <geomatsi@gmail.com>, "linux-amarula@amarulasolutions.com"
 <linux-amarula@amarulasolutions.com>, Julien Olivain <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
Thread-Index: AQHbfGgeIWGf+9VagECBtuYRdrcM77NB2tOAgAAB9gCAAAWCgA==
Date: Tue, 11 Feb 2025 10:13:11 +0000
Message-ID: <Z6sit8qik21z9jj3@ryzen>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
 <Z6scc31LdTE21rU1@ryzen>
 <CABGWkvpMURxUinVjRe43i2nmnzz59rKE8TQUh3WgJTMu3NxX8w@mail.gmail.com>
In-Reply-To: <CABGWkvpMURxUinVjRe43i2nmnzz59rKE8TQUh3WgJTMu3NxX8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM6PR04MB6512:EE_
x-ms-office365-filtering-correlation-id: 7399e621-e6aa-48fc-5724-08dd4a84b0cf
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?F/gxMX+7+rLANCqSN3KAqG9FheA2j55a+iAsG4UzkjENCklTdeQbJew5xJoT?=
 =?us-ascii?Q?V6cAGmLRQ5uGBUObqCcHeZRWZXJXrRcT7hS4frCCGfDraR59scIcOPAtc/vH?=
 =?us-ascii?Q?lNxfPTT1NLLkEFtrAG2tpUnGIvF5WvMUn4Oelsy/LzoYSFD6B/9v6KqRHZi3?=
 =?us-ascii?Q?W1CmCG+1/B0rwFyziR1KBW2ZtkjLLGxYT6C0dFKmNgRrkqvejlGMdPokBb3Z?=
 =?us-ascii?Q?z/sMEayYz6v+H6yrcgsz/gu8fEy+Ly5xItpDkQVVo+MU+Tqe+ZdOKyziivum?=
 =?us-ascii?Q?Q/OjSi/sBhHOvh21GK3WxP6hU/AM11zScHJtJSyfzx1l7pdOFOMRcvuFH5Qm?=
 =?us-ascii?Q?JXxa3rbm0pCO2i6qo4v64wJOfmGVYdS0uLX9uWUEv1cqlY4rqAYU+2g1hnCG?=
 =?us-ascii?Q?Si0anhV4s7OYPCZfQzCIfZxL23dF7+qn5lro8VpfIfGxlv0DFtNORCywHGuO?=
 =?us-ascii?Q?nCUrRqbXxumsSHNSHzFohcExD3t/mnu4YcNLWCwkCxmHikQpWeifnyDYpHFR?=
 =?us-ascii?Q?+lIdTeb+vPL5NEWAQWW21hXzJw3Qr7HPwN3O82DhMubD/zb3LSzF5JD1G4yx?=
 =?us-ascii?Q?WH6/NLtlImO/POBXkSS5aFjS6FP+Y51kO4IjezC7vYGUkk2RuhnsF8VUFTcX?=
 =?us-ascii?Q?T7PcRGajujdgTHdd7ZYZbuPIf5H9ECkxQxI+mSMhyeixEiSKT32clkz7HfeT?=
 =?us-ascii?Q?3lZSa9KJjNuHucQVTpIJdkv1hyYWJIv+ve4suMSSNS0JKXwLFvjJ3rVTD8FY?=
 =?us-ascii?Q?2iBc9/7QHuDVl030zmL008TNomi6XtdNvscizY7KlM8Ftt5a8DOX87iYHNJF?=
 =?us-ascii?Q?EkzBIXwystRDAc1/nXG7Ot9RceBTjueJ7jCYNS65NP2AKMVTJW3vnwPMFuOH?=
 =?us-ascii?Q?wW/+ygKtpQsZivhr8PJQM4YMDxsHSZDDzN5ubLNeCb/JXjCsxVFwe3N/R14w?=
 =?us-ascii?Q?O6XCPyBzx72b1zbvmm3mh2vfZ4vXZEm2sniYL9Lx1we9rDzV9aFgl59iKIgQ?=
 =?us-ascii?Q?wwVcg0CKWiNPuIthxPGfxh8pcSefOb8QRKmrCCI39y5Bv4Yy0E37YWetw8AV?=
 =?us-ascii?Q?tEqfuyOWLItMTdrb13kgcyGb3KLjC+HIaZmpQGm1SlbASzUq0+qlf0WNKHrE?=
 =?us-ascii?Q?j4pRwSGypGu1O61wHnZ0g/JnD/5Y7gv3yaijSxnDAiuAHClnyl0zuNKXCufM?=
 =?us-ascii?Q?1tmYHtD5Edl0CbxUQDD1mzm9I755f+v9bpTGCtuNbCPXWEZCto3wkRuKAxhL?=
 =?us-ascii?Q?L9gduSOxoC7qtdTNlbkSrG0p54Wd0N4vL/UaFfVOJnwxFT+F8dCbB0pJfJQt?=
 =?us-ascii?Q?Vb53ezlCngUByddrWIQ0GPBuIHZ9B0AmqpxFyTOmSGxS4D5OSRFNxeaFi8OL?=
 =?us-ascii?Q?MSUGhb7t+H1g6QLlA8+JxgDXsV7wjFU/6B6jLrcZhOtfGQrDC3cXdyGePrS/?=
 =?us-ascii?Q?klXqez9fTwTx6drKOPwJrNWyxmXdRKDZqiGxIhgPyOzGshtI93D4fm2dtm/A?=
 =?us-ascii?Q?Y1RSsp7p0YYRG/b5w4xYPaubPu9bhhWsjyBv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nz3MtTVH1BC/Fjdj9yDggrNrQLbIsyXVsY8nPS6Qf9Da4J9CV3lH2r2g8/q8?=
 =?us-ascii?Q?7IH6FBZbZZ6KKFYWQ/gRatYkPLCpwtRAeClkv8Lvf80e+aWek1VSkp/JsSkV?=
 =?us-ascii?Q?AXnY7iEJNj40s+8Gap822lgBux3UagMea3IpcYDxSrekneMWpQ3II+IZbG7o?=
 =?us-ascii?Q?yBCzA/Gmmni6AJurykm0UgZWinzzpZ6MYWdyItK4j7umsEA6UEnpZtkpjMxd?=
 =?us-ascii?Q?8ZI2xpAYUpQEqy7x1bJblMuJxiujga2V5drhH6ulFZVHIjPxO4VfZGKCMuax?=
 =?us-ascii?Q?K3lov/+Gyheza9BsaiTmOsUFJeEe/zSK3LT8tanthBDNMt9DtKMIbLlyJ92s?=
 =?us-ascii?Q?eEEy3wnJtwkfK+dGnyEOqQNnHS+NjmecPjRr5iIUowgs0myFHZEyQ8Hgr0s7?=
 =?us-ascii?Q?czaHfFFa0rUgewFlFBz/tBiEE9AmnE7/uZih26UKpKyB1TCh2GeSR6petKz7?=
 =?us-ascii?Q?fjhRdkSxLxvAHq7e3zJzxXUzRbJDBzI3R33nphOJw40ap+znrP4KGX6Kdydj?=
 =?us-ascii?Q?vfu3/w82xpIwIYSZ9qauOyeXITBRFDGxvevAQBRwWSH16wy6N0+Wagi8CcbU?=
 =?us-ascii?Q?EFGivtOT+5Toep40PG/NVEHUU8J/3/fHhmuKcI6Pf+GANHFJatUHHgOYqOeE?=
 =?us-ascii?Q?Wyb3/rRyoAYALTXMylwS+0Xn0K/tQaylWU8fb4FCo/fUaOiTF0ZP19qW1527?=
 =?us-ascii?Q?LtEqbt9JpOXuB90eU31r0uBHXs0c5qrHOWKm20zcM2dcybHGk1Rn8OKGqSbx?=
 =?us-ascii?Q?M06+1eKlKUMEKpVnLROFaq2V02SA7r27vrafidQB+WisvCyTTHDQ4tcx7qXH?=
 =?us-ascii?Q?lEmlT1mF3OTchS6cz9JaBeqFJhQkYK/d8K4/ZgY9o9ZFvaaWi2Bfu3FlVqca?=
 =?us-ascii?Q?TPGViQSmCycIboUdKgNG6yJHN5KK8xSc+ZGfImphzkxc1Hb0rR+ibAFqBS0p?=
 =?us-ascii?Q?bsidrSg9T2AMuaQSLPUbtLA0umU7IRfDHV3UCZr4JxHSUpEJ9oA+BxD7EjTL?=
 =?us-ascii?Q?P0tsCHD9+nWhXjoCOJGNvzL3+BrwJmfo7VHLYQged0Pp99b9V94DnHKLnHWI?=
 =?us-ascii?Q?/VS7noNxGEqCXqh4rOvIoPc0g+4nsEa8lxhUne8FSGUeuSvvtyLVv4i78orq?=
 =?us-ascii?Q?TWxfTRRySAJfBVqEhShtBI0tbcRhE5NUPchxm+CLffPDgsMest6TNQP5ujFX?=
 =?us-ascii?Q?tV8k+OXWJTYh+U7Uml+LtZ6grlK9XR+fBQT4N+5iN1nZ8iPYAHhSLr7ucWaz?=
 =?us-ascii?Q?pi2HJRA8fyP4RvccOLmleme3sZClwNgM0lRDAOlUQxBA6Gp93twIqXVOrZC8?=
 =?us-ascii?Q?xBfukcARRFjDOGRzPAjkb02sE8FLKwAwkKHZCnX9tOUws/uM6CMWmNmllkQt?=
 =?us-ascii?Q?S6EgCxKADBBa0//bYf9pS8WYdBg+4asdoo1pqD4rE9pwoJwsrEBaFnuHpqJ6?=
 =?us-ascii?Q?hXPWv5IYWgE+3SoSqwYoBzUZgK3pgBAbKsh4lTianK+06oz9G4Rh+8JSx6Ud?=
 =?us-ascii?Q?OTy6MiMVlgX45bczisKxTP/Dslifp8ZxXlNyCzhwQut4IorG04iJGjv5FPaA?=
 =?us-ascii?Q?Arip0pSeBdzj52dTAS6oenWWS57wMDhLuDqrTwQKQ2Z2uZNuYBZwxghWHfrC?=
 =?us-ascii?Q?aw=3D=3D?=
Content-ID: <BA7D48EACE602C4096E504B8DF6792DD@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pTIg6hm/ejOKeX54q1QBAfoDDy++bnCN4IEXwzgbjlbaLkGxqPHntl+ko3ReJEYRBxWmAfBbPyForSIEHkDUnI5euhjaSeq407jdh62oXoVzmdPtSNt9tKgyCQrNCkRDgERbIAzQRTHi+CGk+ACrZdkBaIxMHWgYU7jjCHPFg4BWmiusZVJO5FmbWkrAqrZlyJEIrM/XgKPgKe0QtHd7STTIJvpif7NpICbcsCXkB03urvZtghuCwoHJaGkUtFnj7D8kqljfZ3Rn8AFsXzIhiXLujmW1ehZj4VJ+E7DZ5nQXQc91MHprJ1I98Zvk/oKKer7izhb4vGS74VTtfBlz6ntSjeN11T4SQoJZXTGNU33XQiRoZBx/dnEwNlkiDbuujtAjA9FRuKh+4rN54CHNMuMkFsHmI/Ka8AFNfARaOMWY3x3ER+mzmDJn7XJS5ebfjNxHKT6RMppj37YGDCnB/9hCejADKK9zdPVDCKg/75TnAn3U1x2lB6RFjJO2am38FJHHTEz+6Nk8Rf+mGfw6xblb8gqXuEE7j+rT83fcIYymujHbuQmx0FR4Ms5R/UAHonQ/G8TqrPWN1zLJvGJ4KwRcbUd7rZp7bHcBj9EZyUB8coGQAAINNdYR1+PfsCuO
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7399e621-e6aa-48fc-5724-08dd4a84b0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 10:13:11.8912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UG3/mOMMN+cqIOE7pBszmwQpvJxc3pfFw5W9yeZj+0Pn8kvTbhpSBGK3/4VmovlNzCkB/Usk4MIAAI7uZIUUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6512
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739268799; x=1770804799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=6iehXsmzY8mRCv8q9uzg44ZITsZIqZIA9AvJjon07GU=;
 b=pmTqskDaGaZfxIbbdrbFK4K59FZL+df90UGaK1ai9UMdBVG6aHgojO7B
 rVtrZGVg18mEnowT6gNBk7FoQEs9P2qpegwkVV7HEgXocNtct8LPy9ZUZ
 RnPswPGixfYM38+33PdmRpXoxkeLiCCselFNcyuAjUb4oFwgJMt3ds9Dn
 +fxoedn7FoBjMtSL7u3vBu/Np2jROi8X202zGg9+EytW1H+zxLWifqBbG
 Zvc4k6GS8VOMvcWJJVG1SM62fulddbG68C33rAGhDqxhNQyuIcDDWAAsJ
 4put0hblHcAVO+c5cClJutSGxHCXLCTfcvI/cB+MChhPEYVqqf3QS5eza
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iehXsmzY8mRCv8q9uzg44ZITsZIqZIA9AvJjon07GU=;
 b=eJ0RVGT+bm7Ruarazg5dBR5JD6MCfE5SIJhZwZ3wt916vrM/RcMcXvU+2cUWn/YFTjc8JpeDWoLXTUqMmoibY7KMbQGmDhkVfvMNID4Qvz3RWZgP1FTVE6HlPw5NbsMnXF5pI028XS24sqjHjI+5U39yqUPyFsO3ZGJ3TmvUgq8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=pmTqskDa; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=eJ0RVGT+
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

On Tue, Feb 11, 2025 at 10:53:28AM +0100, Dario Binacchi wrote:
> > Hello Dario,
> >
> > here:
> > https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/
> >
> > Julien said that it does not need to be /dev/null,
> > and that it works fine with just an empty string
> > (if the default is the empty string).
> >
> >
> > So, shouldn't you simply be able to remove the:
> >
> > BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> >
> > lines from the defconfigs, without any need to add any
> > BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
> >
> > lines to the defconfigs?
> 
> Since I can't physically test the patch on the board, this way
> I'm sure that the modification is definitely backward compatible.
> This is the rationale I followed.

Considering that the problem is that the build fails if you don't have this,
there should be no need to physically test on the board.

You could simply build the defconfig for one of these boards:
$ make foo_defconfig && make
sha256sum the uboot binary.

Then apply your patch and:
$ make foo_defconfig && uboot-rebuild
then sha256sum the new uboot binary.

If the sha256sums match, I think you are good.

Personally, I think it would be cleaner if these defconfigs could drop
these lines, since they shouldn't be needed once your patch is applied.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
