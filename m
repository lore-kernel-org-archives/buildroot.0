Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E762CDD0F8
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7CB80F8F;
	Tue, 22 Oct 2024 21:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuaMLs_Gynho; Tue, 22 Oct 2024 21:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCA380FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DCA380FA1;
	Tue, 22 Oct 2024 21:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B16752072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 911A340620
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktsYjE39b5jj for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=018cbd283=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12BCB40611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12BCB40611
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12BCB40611
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:17 +0000 (UTC)
X-CSE-ConnectionGUID: 5melR4DWRPuJ4rU/9wdzTw==
X-CSE-MsgGUID: wJo+cxcGSIG/8O7IdYh3fg==
X-IronPort-AV: E=Sophos;i="6.11,223,1725292800"; d="scan'208";a="30729492"
Received: from mail-eastusazlp17010000.outbound.protection.outlook.com (HELO
 BL2PR02CU003.outbound.protection.outlook.com) ([40.93.11.0])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2024 05:08:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgKqvz5jbEu4knPLQCiNHc9NmLxYEmlrTMtZXGu58mHp0RYDDqCCy3bOHqBRiW/8FmuJguRA6gh9tQGLPTdBBd69czBWFOkFSFQm6TXsYNVqVOi0VDenfPYoWewi0qjP/U2zTDmHPEDZdiWSxWgrGkupOK0TrPs0sTKW2a8kQLeODsDQrg9NcgjEP/VA28Ru4D2He8jA0Cl5OtamyfqR6pF9+1pLb+wXpO2LE231xv5Ms9smNJ8lTEu7Fia+ZHRKitSAkfpvnAcsoXF7QL2JqxePo1qggy0pn/MOFMs1ALz7UDwQmrWNW1w1BjuWQH8+1LmutyVBFLk1VF8vedLPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNbfcgX0TNJHoa7XptAH7vZmntQDmR2+YEdnpoHXq8o=;
 b=Pt44KZNvMgyNfwr079J+FCjJkAUi83wt9GAVoOG5Q7GZrQhnUnvXuhPy85rDI+IgX5X8vwQ9Zbg5Cyylbk2q7ahyGoORydu42XobHzKG+BXzdcdU1gDm5i6zpnKH+ztMQlvvAHfyqQKU9AAJyybfmT++X0ekZnuk3LrhfVR1RPvMNK+NEO9CL9DQ5y5bSr3bTYshQuRKt7cQbBrqYnu5NBN+XRdQg8j4Xtblgc/CiJGSIuPx0Vmb46WnZFL087oi9ZvlNOe1uOLYt3EHePv7VqqoRi5PeJncSzhtm/FHZ/wH26eMOvazjdXkZdsKdcUSp2YwGycenbZrLCuBCX5RFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DS0PR04MB8666.namprd04.prod.outlook.com (2603:10b6:8:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 21:08:14 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8069.016; Tue, 22 Oct 2024
 21:08:14 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux 6.11.3
Thread-Index: AQHbH87TgI17C4b5N0+SChXLoBJvcbKTR1SAgAAGDwA=
Date: Tue, 22 Oct 2024 21:08:14 +0000
Message-ID: <ZxgUPHsMJYIf8S-p@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-2-niklas.cassel@wdc.com>
 <20241022224631.3adcf661@windsurf>
In-Reply-To: <20241022224631.3adcf661@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DS0PR04MB8666:EE_
x-ms-office365-filtering-correlation-id: 1bc3b1f3-bbd4-451b-0304-08dcf2dda493
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Or6p1L7subJMNbE2xnEveiHcyHfUSRg/j0f5ojwK8TieuEymRb2kXUm09pGA?=
 =?us-ascii?Q?SYPVuqo8LANUd3Nb3de1r3EaXNqQUthwaCuyq+o01ttNI0c63B6YSj80CEK5?=
 =?us-ascii?Q?7hujoKdppRiRI2Oq5t375+trK+Dmch1ytePDVVXpRZAqrfIj51Akg8DMlXN7?=
 =?us-ascii?Q?2nPMYDy1IGsg/c8EMwXFJdDa1iNDt1bn7K+T7U6V5Y5m3ovw2i93teLie9Bl?=
 =?us-ascii?Q?Kyj8P8rhXv+J6udMwtMtUvC2wSD2Q/HLMuzhBgzcqF4xa1EzIkbRgdudXjNv?=
 =?us-ascii?Q?WXoPsvRglIJ7vjyHsw7ikMl4Res7dquU/0HgbPzR7FPNTdIXP407zMtC7HVx?=
 =?us-ascii?Q?AED2FHr9n27dnf21KyHNnSqt2HykdnHyXDnRBczyvRHxzA71jOKwPKGGZvY/?=
 =?us-ascii?Q?/FPoXNS1VPhSAlTSx/9otQIZtJgvCsn8DqVagV9b7HhrON2BPy2LVEs7TPhm?=
 =?us-ascii?Q?frS+uHAwLC/0ZjYUXeziEg4CCnc9x1ZL12OiWugRH6UNEIycsshEN8Uorks+?=
 =?us-ascii?Q?dQ9iTL74Ivq+A0AVnXmCE/unqB+sZmLlYF8dJVKFeaN3U1rkbb6z21FIk5rS?=
 =?us-ascii?Q?6CKwCavfDrOFHULgptU9JionorJ3RDMM9FX9a4DTA6sSRHOTBGmbyJJ18fhJ?=
 =?us-ascii?Q?QeW+Tp42GRtkEpazTlvkDJSXZU26ASks5i3Tq1KuHeHDJ4T5I71o1Vwm4Z/s?=
 =?us-ascii?Q?qvJ6TpyMKtE8eOROwPNxkgZfraHcraZ/dZTVA4UpEyPhAVcd2kdOrg3ZOJwt?=
 =?us-ascii?Q?4W5n8tJ1ePvzjU/MpmzJhcwc8ivdo2mIiAbS3fO9SRAGCF1ic0SD9PF92kEA?=
 =?us-ascii?Q?F/oJjvaFxmzwLz+zMH73RWpdyO+cb1mPJrlk1EpFGlkmpL2qEHH/CtoWPBxm?=
 =?us-ascii?Q?fuHtyUeCaFQ1UACfOkOk1Z2pm/ZoVsPisEntx7zKAAiWayfSpNi0AHcoCusW?=
 =?us-ascii?Q?rcwMW20FG3lm23vyL+Sx7ObCQgMbFDEjVhdZD+8rtjZx9cyO8HGf8z341JYR?=
 =?us-ascii?Q?jCL5gSWZ/6U+0vYgHvmjGEM9ueJnvT9Esg+wZlC4IuzCjBHkddIvFFEWHQKv?=
 =?us-ascii?Q?Ri6DdESCH9jTRtIp7S0srHe8yspqP5HT726DhQrDz5l7M+6tODGMhmGDWq/y?=
 =?us-ascii?Q?pxcNKo1ty2P0gIFfn2B67sAE+pV9Q++nPk2T0Q5JDm+rbb1Q7+ISTGxhWdq5?=
 =?us-ascii?Q?jdjUxLJzD3UZUmnknq+4BzCpWVcrsFN/mVEV5tcCW+aasPtBVsfZ+le0Jf9M?=
 =?us-ascii?Q?GHY1GQiZdda+T8TY8TRmpVK4ZW2dseRR5IZ0KYaNCN5gCHISJw8DXqcvyrQl?=
 =?us-ascii?Q?qCKsEeru4Ex9Bae9+3kK2aVADR4c6DqRZovUu+1uexgi4goyTRhhiXXD/2d+?=
 =?us-ascii?Q?nRbRgF6np8E4VYzLVX/MdMWgSq79?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B+P7AVOJ+BzYQDDbS3HF+UNr4/K4TV/6nyYeVn4q38kJcGPPFg6D1OnjhYlt?=
 =?us-ascii?Q?UOTWx1+fWAXlZFKkCFau75MykYijurf6w9ZN2Du6z5KdxpdxVtWhSVVa3M5e?=
 =?us-ascii?Q?oVQlouMTjIUh0Z1gM+g1QvYnSNg5Ah4tE8eYaIM8zQuqlPQSZQ0exLhu2Xj2?=
 =?us-ascii?Q?w4zS3MGKvVvnUnE0afc5lPTpSCQF/srUJ8hXFphBB3p2BEs7euyGdYxQMxDJ?=
 =?us-ascii?Q?chXl2PdIdwTPErpBVdskytMCF3unMnlyuBbegLivEPkCoAym0BGMwlRz61Gu?=
 =?us-ascii?Q?tFdlNn7vvD9L80FbKMXYrGtGKXm/RELmYq4tN8D1vQIh3I9+9S/R/VsIjhIx?=
 =?us-ascii?Q?cJcIWuS9G4VOi68HT8EDuLPDRRusCW5jk87bUDtS10rcds2wuo4QjSZjIyfq?=
 =?us-ascii?Q?hLJdybF2tYkdVnl0RmiJAPVlZkETSKU6CmkqutcOTB6PSCKvL/ODnLA0NGV2?=
 =?us-ascii?Q?X+pVigvOxA6cjYUyqtF8MXel3c4TR2a4Ja6kO+KJCZENV3qbM+O9WbiMSwsi?=
 =?us-ascii?Q?QtX4gCsBYVJtfmnG2Kg4w5PpYfSjrUw4+iIkSVrRnn8y4h4d031M/fcfkfgN?=
 =?us-ascii?Q?abLhO3nm6U/kk5uZuwKyiCZf22n59dF8rVPJILEl+X6G52GBGGfygrWv/dZv?=
 =?us-ascii?Q?+gBxNuZKTrjOD4hy2sAnvdi25AjnL0NsiEMkZWeG5UncVadFAAw0owYDukoe?=
 =?us-ascii?Q?/6KtfN/xkAW+XK953Uz3FEC2dj8a33XuiWagZw8fM8xJ0YauN5HBhDbMEGO3?=
 =?us-ascii?Q?RrpckfMBErt6KOSSA1RtNtl/rVzGMVuA3WrJf+OelNxqkc2qnpWtoij0Lf2+?=
 =?us-ascii?Q?aTQTAts/XjjI8FeqleUv/wTBFkOYQpLRjB8FM68pIascgRgpPLkfUrv5ZCQf?=
 =?us-ascii?Q?syK0TNp/nfJdS4NnEJ2d/754lzb/9EDhLgOqEHLS0q2B9GQ6Gi/mRIfWqE+f?=
 =?us-ascii?Q?jwd8l7ve41Xm5GhGYsxbe2SwWdMR6lvnfX0epjJjHLNZ5sWbBu3Slm+BWN7u?=
 =?us-ascii?Q?3kaJLNdiXxS+NGB5IryesqBEr9n9ReZxNFZPznIrGi3Lj5LxjZrXXMXI0FI4?=
 =?us-ascii?Q?Adzhsk/15vaYLuHgRhwObdisAjiz49XYL7ShCrfVBdcwGzHArUOVXIYTQWmb?=
 =?us-ascii?Q?dwpmrf5fF7KFqRsjOvubw2ZIrjJENAB5EYVHaETvLbNNAQIEyaqFmJxksR75?=
 =?us-ascii?Q?f6/g9pQuBafYcdr8UuzmlC3xCnM3NLbnf5jSUY3UUxz5xhAG3rfe1L0AqIiI?=
 =?us-ascii?Q?8AJocLrSFeivEugw+BN3ricksXweAMW7sDp/ZjvAEBrvuku0rf+5JrRimPOi?=
 =?us-ascii?Q?BNN+nzQqpXkpWT4hwyn2Snk+mctk0odjgvxJu3FmJHBHKTX6L07vzNS7UOPr?=
 =?us-ascii?Q?HUVUH2a8rwf/iqwyL2opk5IX6K3+S++rux+PmJP4WV5KNIJ4ZAK+LBH3FAqP?=
 =?us-ascii?Q?LI3kJV4TJVY7yAaaXSbn9fhp7Hzsl184aoE6qHmWuhl/bB+/KGQHF1O01Nai?=
 =?us-ascii?Q?Lq5paLd647Q6+2zYAjbJpgCm1ywZDcV8IPswMCx5FAZjWA8A3SroZ3xkJjvT?=
 =?us-ascii?Q?n7Dj7RndlRXw2Yh9p6PuBKlwWmngmatuGcKVap+zu+xILXKL4bC0Hh1vELev?=
 =?us-ascii?Q?Zw=3D=3D?=
Content-ID: <11259F9D8E49074E99ADBB51290169FF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OldRfxfM38EzYzDrggQrtb3a53nnwciduBQKnizlv5K3eRSwI1eSZKXrjgpm2IzawTHCcGeZMs063RrcbMTuDGtFHDHlXdM4MsgBsR8Rza/RNzqY92SLCzG8sZK8b74Gom0qBqz8qiTuAZ7yqSUZLeW/d1E3ziQpYi4g70/LcWNgUxFi+SFx+ElUzNEzbtfo5oaM9AK4C3OR1t+ViZccfs6sh7kCcPf6R5kqMMRHv/3f1ubz9DF7QEaZNc5zjfppC22uWgksn4csIsSTF8Wrvc4hgqWCM0p/QMlzNYtelfmZwVBVTFm4saR/9MxG5n0mvoiN/KgJz/rvsubACiIlKDKladZERLNJbhUrPStfqa3u+z17xSUUD/yeVJEXAa1z3iS0IwkxW052qcQkD7Ir8zccMsu4XPwxwRfIxLAJqtRM3gUNvbbgasgrurWzoe8+CMMKeZaFhbBpbsD6Cc0Emk7bS5RT/AlyqdT8ASsrekeb2HNHnXlzPUFE9kfxKtPQjwsigQOHh4/ybd7kUJvGS8lZ523dOWQwyL5VP+SJn0DIOyWdZGPphTgBTSXoz8RlhNold6+AelVkqzDNOHeqqvjoYMBHoyu8iYhRG8iAqmu3VtbXagg3cyuILzrGe6tb
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc3b1f3-bbd4-451b-0304-08dcf2dda493
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 21:08:14.1961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fpPJBr6eQ2nC3SWAo9busUU0eOhWsfK6aUNtk9Vb3p6V4xXjUJYrO70Vh7CXlvLHhOIv3DF4OsbMo6ZCJpXKLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB8666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729631297; x=1761167297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=yyAWHMPTPC6Ybf6YjdvSOM3byaP5FzpPzAiSyEVSJjY=;
 b=AwDUydZydSiVAua0J904ti2OiL+At/vYx74t2hm4QEajxDlMRdBGk6G8
 EFYMEi8F+JYEUtXQm1/GtSS83WibawHq2XM3B1HGD9GWRSE/rW6pRJdZo
 pQJA5JJHYYAnw/fhk7uZlgBwtj8barnV5/ZU15xvMjmf+UP/nu1riIxTq
 7Xz/SftNo6KQwZaFgb0Qp2usdJKBv63cVpB5SCvYfRveyYNkebB1G96iw
 iufFh78nsBTbuMJ0tYxg4bw7otAyzSxnqbIhQl/8VqUzYawBnfT+WBqsF
 RWnJLhIWDKGAZSBKvWjDUxT3hYBD6pKDPTWhZeMadRynNdRFabJbGTDqS
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNbfcgX0TNJHoa7XptAH7vZmntQDmR2+YEdnpoHXq8o=;
 b=lGCMviCJ4WGqW5pDo61qZFtNXPfDdLzkp5BT/5QPGt5TgYUsLXe/IIu2q6YCPgG5BTqCU7Di1pQXFY5ny18DUoNIP+55e24JkC6oaRwa1cPS7lb9D9D3Q1Do5MHwHdOM0VrO9B6bmsAJuB42FvYcinZiTBW8QaHF74bPRfu7jPw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=AwDUydZy; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=lGCMviCJ
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

On Tue, Oct 22, 2024 at 10:46:31PM +0200, Thomas Petazzoni wrote:
> On Wed, 16 Oct 2024 15:24:40 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > From: Niklas Cassel <cassel@kernel.org>
> > 
> > A bunch of new hardware has been enabled for rock5b in linux 6.11,
> > most notably USB3 host controller support, GPU support, cpufreq
> > support, and PCIe endpoint mode support.
> > 
> > Add the dependency on host python3 that is new since linux 6.10.
> > 
> > Also add the missing dependency on openssl (which has been needed for
> > a long time, since we are using arm64 defconfig, but only shows up as
> > an error if the host system doesn't have extract-cert installed.)
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> >  board/radxa/rock5b/patches/linux/linux.hash | 4 ++--
> >  configs/rock5b_defconfig                    | 6 ++++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks.

Hello Thomas,

It appears that you missed the cover letter for this series, which stated:
"""
This series depends on:
https://lore.kernel.org/buildroot/20241013103341.78501-1-bernd@kuhls.net/
which adds support for linux 6.11.x.
"""

I do not see this dependency on master yet.

So I think you need to also apply the series that adds support for linux 6.11.

I don't see a reason why it hasn't been merged yet.
Bernd's first patch series that added support for 6.11 was sent in September
(2024-09-17), the series that I link to above is his V2 (even though he didn't
mark it as V2) which he sent in October (2024-10-13).


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
