Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76808D49231
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 15:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE0761664;
	Mon, 18 Nov 2024 15:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrB6_GRO1un7; Mon, 18 Nov 2024 15:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DCA6F4B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DCA6F4B1;
	Mon, 18 Nov 2024 15:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 664E0DB2
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500E340B0D
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28iOiZVUpUt2 for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 15:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=04553ee47=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E720E405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E720E405BA
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E720E405BA
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:11:00 +0000 (UTC)
X-CSE-ConnectionGUID: dVqtfpc8Ra+bxsnMBqqzng==
X-CSE-MsgGUID: LtP9u3J1Q+i1Qjv7cbi55Q==
X-IronPort-AV: E=Sophos;i="6.12,164,1728921600"; d="scan'208";a="32756166"
Received: from mail-northcentralusazlp17012051.outbound.protection.outlook.com
 (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.93.20.51])
 by ob1.hgst.iphmx.com with ESMTP; 18 Nov 2024 23:10:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpXC6Psn6/7fQ2sm/vfLyesrqV7mVjSFgzGpaW41a8DQ7ScctvoEzrKcN4BZwepcIFNMzJwwO1JL8mEl6+rLrgDPa0RMDPc+Nf2KyfNwRVNqiGtcm3AgLWe5jPw9jgxumRMsaMBADBEASmKgflY8dOX510v2G1CPuzaHPxla69h/153tkTC5qHojKppw9r1h36aIXLVMyApo4rpK0Sv1v1q8dUxvC6XJ7SUOMlemlO1zHlPs8wSvgICa0qdsft0o7cjOK0zAfbfdeCFCpzr+3tX2GRR4ShfrQ/5qkV5dlX8ScaJ35z5bMyAOWjNenMNjPihdSA8CrAPSbY3Z5RH5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9ux+qAoUu2VkTbSnYhyRSkvtqRK2tVOEPkoaQrhI/E=;
 b=p8bBQUEm1Q+UyhZeI36kdod8iZ+pggyJriWVHrHpuSr589NnPBfvBdaiBHR/suJ5W0+h2BwotuHyPJY8ebnEaYBukjEqS3KT9y/Aqj3yG2MOKeG9CQ6wAc1SFsIKoObNolo75O2k+AKKisBUoRsflAgTq6yfa0By0bCfSF7pt46w8f5jnwHm4Iv0QJ57JJjSqVTVS5+vbCVNTbzG3fOgCra5bDcW/NkxctG8/K/D7Cem/RM9E9WIkFR9dWjFlmk3TkAZruBtx7AvqwGFnuQ6pNsPo4B+KjwYsaSxO92XvYSpSuvmCglPuwS7Ny+JEII1+rjZH7vy2OmBjEVrL8wjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB7902.namprd04.prod.outlook.com (2603:10b6:a03:3bd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 15:10:56 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 15:10:56 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH v2] docs/manual/writing-rules: align use of genimage
 partition types
Thread-Index: AQHbOctVi2ZGTZDV30mm0ZiBB6QdlbK9JIqA
Date: Mon, 18 Nov 2024 15:10:56 +0000
Message-ID: <ZztY_1s68gpsfM6t@ryzen>
References: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
 <ZztXxBOZtE-h6Yfs@ryzen>
In-Reply-To: <ZztXxBOZtE-h6Yfs@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB7902:EE_
x-ms-office365-filtering-correlation-id: a234b09a-00c7-46e3-8833-08dd07e333a5
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QhqbdzZf3AxvHvyJWCR/pTFczxRQwBnZz0Qd7MuDWfD6TGbMquQ6qaKAMUFo?=
 =?us-ascii?Q?n6jwAeuwUXm+2KA43FRzvnO1qHqTd+sALE8SftNGvgXDX6Qud3o6ZXV3aZYq?=
 =?us-ascii?Q?SsJ4kG4vX3apAyudOvKaQg5MmEOu87Vie/mXXPImj58LXXJhvD6pkcHeqzXq?=
 =?us-ascii?Q?i8BbAU3rFu4ml3x3yXF8c9byRyC1uOcLOttEGET6GNHYTaZu33r2wxBsukrv?=
 =?us-ascii?Q?8OjgKGAFzgRGcoQeG7aN1nFMAyB0pRDB+xii1uxK/OztH+LNBusryXnzN7+h?=
 =?us-ascii?Q?nIKn3T8V2wpkP11j17FctWop2bm8jsL90lPOYWvfIxAn3Tl37uLqJVZei7me?=
 =?us-ascii?Q?aWa0AZIGKC3IpE3urVtsA41+INwDhFklWDDw526eHJSK2XwIM4FGvca6LqCU?=
 =?us-ascii?Q?d3OQXG70KoATizKlQ4l+Le868OtPDFCSit0ezjxyqvInZC0s/EIsbkTW8Emq?=
 =?us-ascii?Q?v5fZrpkGR/rUrmbSKo94rTXppc0+hIGfNuNuagTHUfwoo/slhhp00TluomIA?=
 =?us-ascii?Q?lUBYH3m4IXrDeoMJPo6vkoF6TGx5rlQzfZZDLDmdHqCQcCvFdk2w3YOegZD/?=
 =?us-ascii?Q?mxlJ2WwSZQOmiId2hlmV20GmOKg+lqvVZVEDK9YZIJ1e/bTfU/J9530YNCAJ?=
 =?us-ascii?Q?yK4gDt3n22QpgiYOHTQsPsyhftupy1NgBu9dYDbqCCGjAqSmkc0Ba3e9JsnI?=
 =?us-ascii?Q?dboZZdSbe3MVd0pUN8uFthiNegw94Gh+MHfEtF12M8RoOj1u0QFXP9Bm9xnt?=
 =?us-ascii?Q?AIKbtC99VB+D8X77o/ojgs95gMR3nlHUwHQ98vx9NOwdOWA+JG1XtQL6kdTi?=
 =?us-ascii?Q?B6aNDsju96QHJr/m1SQlY/botJB997xFouffxP3fqvXcNlzIBWcYDlh8NJkI?=
 =?us-ascii?Q?Nmu2sRHAfwCC9crD5K0GuppNnpkZXUHiONX1UVPcDo07sytga9DNBgV2Q/Fz?=
 =?us-ascii?Q?8TvzAh4o2ZR7dnOuC9n8ZkFLWXokddVqCiKPJbRhHMLBYQveOEo13T00DL/E?=
 =?us-ascii?Q?rJsJTKqmqNRxdweGdkJy856edTAGRVAFP0OVS/lNNduxRYqJ6J8qYnibL1bB?=
 =?us-ascii?Q?W/pgW3FW+3X5TVzJS2rMfk7eQPZrsncshVD2baTWs085v1aLJ9t3hZOGu9kG?=
 =?us-ascii?Q?XfVGH4pMIXvGMa5UL0kEGfrC/Mrx43htEB46WXZ0Na2MRaigX5WFZ8r3mjpo?=
 =?us-ascii?Q?nW3wnZq9nJcA0rVfiv6LzxasqUY3iUG+cuODcBSDFYW84s9V2y0VqYlN4gX2?=
 =?us-ascii?Q?1XDLCYS4dVTRSD0deKstbiTPb+lGDxBu/2ixXlE9TakfRPK3gb3YncS9sIjC?=
 =?us-ascii?Q?Xs+L2LKaD0HtQTMeQtLGLMCq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2laad3/eXmpod4TKBTlO73DL01mzx7r6N8O5dRtBqn/PqLz3iYjKpnh95RfF?=
 =?us-ascii?Q?tKBwCKKFPPg9W2idh5DmBiChmvQGB5muCy86uqV9KKg5Ikyblq/WSgC+ZgDH?=
 =?us-ascii?Q?mErncmQSsUZWR5nlfIQRAtIdr2jw7nI272oULhh3TwRleVrWeAGrk5EGRzrH?=
 =?us-ascii?Q?jQncqvUD2wNbUKueJoFi5jMZqaQ9Rg68bqO4OyKX+WJZvh5OkyWYke3jbuKH?=
 =?us-ascii?Q?5SAU7rroQRKiYB7Y3Jvov4ICFAlqjYb3cHd2IdC3u73qlQo5ZbHz8ShB+o11?=
 =?us-ascii?Q?hswMgpzXNm0u92fTxoID4pRtvFedyERPpwAvFIxr3Mgn7FTbqunaYWnB4V/N?=
 =?us-ascii?Q?qaeZrxzlQ7fPkbVGHkJgP18kDnwXm1yxHiTAWhs8nRaTytfOBAIaVUH24e4l?=
 =?us-ascii?Q?LffW/LvuFgZ0RL/C33HxYTlAArzAnPTVGK6nG4iDT/z9k7SC/UxsWoi7mZ9X?=
 =?us-ascii?Q?a1pX4cphWH8Cn2d4CMBsYgQXT6ZJlWn96Uid8XnZ3QH+nYRCs1bnsB4CWjL7?=
 =?us-ascii?Q?rXM9Z06r53SXEq5V2pRvQgz1YtE6jza0tLPVwqMZRQmgW6OTAG9IjFo6DGQk?=
 =?us-ascii?Q?CoJLqXUtma+Q1PyWYsS3MBEt8yglzTCWOuL+OsCUvzxTvPA2FuxotrZYwjXr?=
 =?us-ascii?Q?ABT7FdDZTIz5X3cJ5V2yn8GLFonHsYLqGM1JORMXv27sCKUjGcJV1S5ECVhY?=
 =?us-ascii?Q?Z6OSvv8d1A7ZvjFejh8SklXED51CQlPulJX2hUb5BfJmH6bJkYT1x+vHasrB?=
 =?us-ascii?Q?2IwBfNp2Fl/uVY7KcKdCs4iuy9LrPc9ofhEudN+MOeF0bsGjAYueoqZXzhlm?=
 =?us-ascii?Q?IW1TqfJ4ZOcxu+74IDI+k84TWV0ySeYzyta4YFZ5tIZZsQu34DPuDgR6YOXm?=
 =?us-ascii?Q?89dE5J7hDY1lziujqZAWRhF9wlutnVFCyZOyVMTjtyALTYOVysOybbpiH5HB?=
 =?us-ascii?Q?nrB1Ru4RxywTxNHcBn+xvMkIhz49qc202K2yyV0xxU5SgsM35du2lHJmf6dj?=
 =?us-ascii?Q?qbGSiGQebREv4PWGJGMzIpYAg2Xl4eE8VPAyP+oDTYugYB0FewhhssWl5aK2?=
 =?us-ascii?Q?dKeEcRV6VUZvlLurPc6QAQGFr3D3YSlNFyH5sdtUKTencZm9cLXgwBGNQfdb?=
 =?us-ascii?Q?T7JP4IwjJreb9D6if/qPzCiWNecjtUGgEOcbAJCL40Ev4nrIuMxUvC2E4AHi?=
 =?us-ascii?Q?wJi/k0+yvnziaJ6Q0z4ycBbuN+3YQqKpradwFBborMnQWKsoi5x0EGpATfPo?=
 =?us-ascii?Q?sUMyxfSTvlSCJLMitACU2uQ7BqUOs6eNYYXuFfl3VXt9DJDwVYcYpdgI7hwp?=
 =?us-ascii?Q?IrLCscfG0bKyObHBYL+cvYOkvr7I0VShLJitSHKu18lW+WhIs8DjRtX5dKLc?=
 =?us-ascii?Q?9sVpfjWE3CfisJ0wP0+yyy/Zru9XePq97kFp2fhTFWaDrDbxboTLSPiwl3Bm?=
 =?us-ascii?Q?eZBEQFFUi40ZRS6Lw99jYiGDcD8RHHKXNJHEMgBDClkmHezvU/XZ3juysBK5?=
 =?us-ascii?Q?cYSCN227S3SbCkBS0fRUBYD/lTchaZKIN8dyHpMsoTVcZasF3YGlxzW5Mfh0?=
 =?us-ascii?Q?Z5PwsYS5hjQdO90MRlsTM9MVZFkAD8jW0o5n5aASPck+l6xAFk7dd903z0yV?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-ID: <B3CF18FD2D2B574089FCB1DEC21EA500@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wdQeQ6/PF0EXfFoldRZtVgxdUaZFGXrv/2d47bVrHTrOt1BhnGSFSnQ09fbPUej1yfHt8AmGoZHahdI0k4ofWA6Ih+GhIhX971FOjtCS/ZM0aASOF5CLeYpO3VwMWpsS5buB1Ymus3PLDz29Cjj5JGc6D0cCKNHiYL6TUc3pwgqayUE5NIfQf5vQqhSxaMDIIhpgb7pyw5AUx0yQFGM5V2PiQS4z3dD0jVchWYmMZGYcJvwHKtYK3lCEXQqAG3X42cJhZfvlB8FGPoAJ38CmDVcUI9tb9UiDmfRbvjk0pyj1s2FMs98JijMBKOO0REO5/WcHOHEwrMi6/ZQprYZ/m9IvP5R0njHG8RQ6L+s75UD2wX6WAmlCA7LNQs6+l4DHtmFqScnNS048KHYeWRFUbmBvCKsEcMLJat4jqbXhjeoDxJEy+UZE+AJfy/e6pO4raX1xB9U9MjJ/K95NV68B/FrXkPQ60id+8nlikD8Nz5zNn40ohl1cEez8iSZ8FfLCxSPBsSKginnt5mhJOifsNieucfjSN6iD/ioh+sa1rE2oRrD7PKoL6QsAJ/SyVLgHydFAtwM/6tioQdfconVFB+zJKT8ujbeRBZ/1Tt43a56CMxYHMf9KSLud4+AGb6hF
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a234b09a-00c7-46e3-8833-08dd07e333a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 15:10:56.1623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNtfxGkVcAl+yWKavRAuNqH+5GaKalp3lGRDiDjlexwhI5EY9nXp6UBg1VaTVg87MUVBa3K9TZHkb/CSb1IFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731942660; x=1763478660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=W3CiUaJ3VLQaa0BY14GMM4VAlgNRMZkXabt+WLTcMXU=;
 b=cly1kXxxi14D55DJQVCwU+twnSciUUWefWcwgqTB15iHK/jepm7oaxAO
 dJRTPQb/A+kL6iSWu8dItwSFR46F/sD8A/fG/wV/CqW3JcQvomXzza8Sj
 NdpbFjWb7aENijg2S9gxN3cqI6NDsl7ApMTyDUOtC01bk5yTJG/x0b3f5
 L7q0veTYmy8syjW3q/Jk80lRCfr/dmD38kub0Pmka0hi6eNdndji3e23X
 sHpO326puLhaJn/m0x/d8r+GvB/XWNuxFz6imhFr+e3uGV03EyeZamdH4
 hhp7UiZzdASz8zoWdQPkfLh2cZxortGyhBh2xusRNkQKa0OcQf9hYVrOh
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9ux+qAoUu2VkTbSnYhyRSkvtqRK2tVOEPkoaQrhI/E=;
 b=G19BtBA+zayJZNgYfyDwnkiHFkY4vo61/Kx9gyWG8F54G6mwoS1a3PXNOFzuxTW0GztVQHcJfj9IbIB96U6MjbwtFO3uGXV7Jz/DzgCSyCdyZy7E3Q0cAWFIkfuIdqRB0BNQOhUP7i8fhZAVHAqFGt/sRNQ/37EzJHRG31InLQ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=cly1kXxx; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=G19BtBA+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2] docs/manual/writing-rules: align use of
 genimage partition types
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

On Mon, Nov 18, 2024 at 03:05:40PM +0000, Niklas Cassel wrote:
> On Sun, Nov 17, 2024 at 03:00:38PM -0600, Brandon Maier wrote:
> 
> Perhaps something like:
> 
> Buildroot follows the
> https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[Discoverable
> Partitions Specification] whenever possible. This means that the partitions define a
> specific +partition-type-uuid+ depending on the mountpoint.
> 
> _genimage_ provides shortcuts for many of the partition types in the Discoverable
> Partitions Specification, and these shortcuts must be used whenever possible.
> If a GUID shortcut is not supported by _genimage_, the full GUID must be written
> in lower-case letters. Some common shortcuts are as follows:
> 
> +*** +U+ for the EFI System Partition (expanded to
> +    +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
> +
> +*** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
> +    system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
> +    +root-arm64+)
> +
> +*** +L+ for other Linux filesystem partitions (expanded to
> +    +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).

For a list of all _genimage_ GUID shortcuts, see
https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section


> 
> >  The +genimage.cfg+ files are the input for the genimage tool used in
> >  Buildroot to generate the final image file(i.e. sdcard.img). For further
> 
> Perhaps you do:
> s/file(/file (/
> here.

Looking at other examples in the file, it looks like there shouldn't
be a space before the opening '(', so perhaps I was wrong here.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
