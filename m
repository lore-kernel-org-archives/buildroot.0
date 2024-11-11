Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25CBD2E9E6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4BC080F14;
	Mon, 11 Nov 2024 13:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c4B9eGv8wMi; Mon, 11 Nov 2024 13:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56F0B80F04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F0B80F04;
	Mon, 11 Nov 2024 13:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B19FDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C08B80F04
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLTj4waW8upP for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=03875af56=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED6A280F03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6A280F03
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED6A280F03
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:11:11 +0000 (UTC)
X-CSE-ConnectionGUID: aMtntHHjR0SiCduVIBlA8A==
X-CSE-MsgGUID: 4yMMYowtTrqMwhKuPlaKMg==
X-IronPort-AV: E=Sophos;i="6.12,145,1728921600"; d="scan'208";a="32170780"
Received: from mail-westusazlp17010006.outbound.protection.outlook.com (HELO
 BYAPR05CU005.outbound.protection.outlook.com) ([40.93.1.6])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2024 21:11:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAUb8CebBNe6k1s7Zl6w/XAdufZi5qtQOOie3+QlQC3C3F+Z9ZxozXq/sP7N62ZWSbyH7Y1JyWjiEVUck/9z/i93TIGCsJTfyTG6iJsrFIznIcT8uh6F9JqBsV+isMcfn3QWWc4pgJLk0TfPE5haKRhQgZ3OBleRCXKzNuUaXol3AkkJDPYDo6h5j80Mdt6DmWtIpGntVAGooWOVhBtFuktFMeSD0nwiWG5xcJMOoJ5saa2P/IzUGGCqAjZ4OOlaTXQb46sHYGYKTn1IA7QsCA11AxAVpkYNDxGg/nnQeC6UVbJ+PImh6E2TbuI/lKThgMtCYbDttS08F44HpcNqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wiwj3n22fpszgVbUFfc1PH2wHJ4SJiXEHQLni8n9+ss=;
 b=kTOKIa2dIQR5OtV7GjfW3Ncz50t3VCpbMXgYumDPtiLRiNUHJjjpSZJ6phcoxkEqxcvg+FamFlm2cIyVPchf/phC0mOUganYfi0duMgaveuNgE0+09sBEJ8D8sq1HFaU7Lj1a/BXKFQiji4T9Xq12bl7pLZHGBF+KyPFrvZ7rt252MkKpOsJaoThMH06miCnxx59meg7lg3F/NbSpY6Cy8aPp0B2dSggIW4m3Cpdw/sQCh0noeYV0ZDtG0zax95QgqJiwQQMXtgHiMRo8P3h+FjDAXWKx7z80smcr0FgRJqpGKQCU1o2yzLPwk5P+UWKBqRkEOAEpeuOUfA/NStyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA1PR04MB8853.namprd04.prod.outlook.com (2603:10b6:806:383::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 13:11:06 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:11:06 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
Thread-Index: AQHbMvUNwdczTquLHESzK5jXBV0bM7KyEGmA
Date: Mon, 11 Nov 2024 13:11:06 +0000
Message-ID: <ZzICaWfSt7aJ2y1B@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA1PR04MB8853:EE_
x-ms-office365-filtering-correlation-id: 1fd0d2af-f367-4071-3c32-08dd02524d50
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Y+NGzvJdenc+ndDHfngaTkxvGonIE5GmR02Oj66bleV+4qd3J7THWvrfIfPv?=
 =?us-ascii?Q?ZDBFpkzt/8vfbE0jmU0qTFOh3dAMgu4fLcZMK33mJySCO8q3JrAhlMO855DB?=
 =?us-ascii?Q?NPk0g2w5gf8XDQOKf+dLgky3Z+rT3Ybn3MhtvkyeOMjaKTf2BgMsW0G+2jAg?=
 =?us-ascii?Q?Tc3ElirNnp5wFUkP8I54kTt6SU7Foo3qcMq/GkMy6c8rs+1yVhOLCAGm4l3Y?=
 =?us-ascii?Q?pT6THDaAYFSxO3v4iWYYwRr7G57+Jc28Iel3hZeEnxDEkJTa4QYlnDHA1SUs?=
 =?us-ascii?Q?D8+lss8hJsiS7D2/9i6ZnLhtEYlBjEHPlA9ri10J6dMoSnL++cF3AMWNl9V4?=
 =?us-ascii?Q?ngg2to+Yy8MHW3K4KgHPSHNKdLsNOMg1BksmGyUHYYIHhbANYK9w+2ljGwcH?=
 =?us-ascii?Q?9210qexLbeKPWJPfeBYnYioEaWfPdP/0bakZuFyC1qUIrMTvHMix5Sq1kHZ9?=
 =?us-ascii?Q?VJQtT5O+o8sjSIu6p5npoS1aL4itCFi138yPOvSDWrcdd8PcAoZtccga9oOP?=
 =?us-ascii?Q?sGUuENxgclgnCoO4pf7RIdSym89IYbmcFa25d3X0ol5Ijns64XJG6Hx/oLck?=
 =?us-ascii?Q?V3RCurMeS8aXdbBwnQg7h9jZb4VOM79rIsEqWvpD6Mlmb0u1A//QIwduWaDY?=
 =?us-ascii?Q?KXuR96AwxJIDX2yxX69DTLFJK9xMTvJSgcwTWEwBnLGK821URtYinBkYYRaz?=
 =?us-ascii?Q?ROTPBIDUarJZ1cbuPuoPmaI4qkXC3NkELZEGwabDtRtItKGpZ0jNUPsEd2Wq?=
 =?us-ascii?Q?MGfrHyUTQQ+wP7lQhgNp2ki9iaLZIubCSQPnHGGDvYSeCHGSUnJhj+saRK84?=
 =?us-ascii?Q?t7sJsm+o/wVTAlla7rbbmxmIVQEqQg8uNPtKqTTQDvWjGZ4q6p8A+cs+wqzD?=
 =?us-ascii?Q?4FZdOWLZiJ87B6QJVfE2x210Z96mnjKMLi1wgm15cDfe6/o9XtRiBeQEpsIT?=
 =?us-ascii?Q?tzObprbC/DFqJwIixgWYgbrZwL9x/2ZpOg1lhO8venlDEV/lmnbqEPEOeHO3?=
 =?us-ascii?Q?gI2OvJPMD3y99OFjia58aUTRKjtY5h3H85Jw/LNTtehSwMF5A4wpZha5yLcA?=
 =?us-ascii?Q?Rijv1hD2mGtquu40QDZunY0TmUpBbGYrx6d9vp4AUgizKUTinuNKJy2HP9qy?=
 =?us-ascii?Q?Fmc+nDsefOJfBtVzXdIEop7TkxYqtczXFI0ZF7kXQGOR37+bS82X8T0eBfCf?=
 =?us-ascii?Q?UyjKzPBIxJASiScyb347xyeWbEt/0fRiPIEZ5dpgRC1iVOZtuWUteFzqoPKd?=
 =?us-ascii?Q?tfRXfm80iADZcj5Ef4r/HoAChZCNxr163Lo/dwMV5y41UFusVmMWrIrM2AQ/?=
 =?us-ascii?Q?yFiTYae+8zA2iWZOr/NnFlErzJpkQDYcLmWJosU0qGp+VOS9s0wunpCSnGVE?=
 =?us-ascii?Q?07HBj8vCIyzeKdyQrftOWXJofo9Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QgvA5XHPBe7rJs8TvUnTbeesEtXESH5vVep40hdcDePcGv8tueRlOfvigYWz?=
 =?us-ascii?Q?xghCabrGcguhP789HJKwEBRT4AhIWLaGr5EBbBuKj+uaOGB4SLxcDNIRg6IT?=
 =?us-ascii?Q?TlmwUDC+8/IKN6svfSzK+yvpahgliMhQGPgAlVA0TWZa9e0iQOvD/2WIzjuQ?=
 =?us-ascii?Q?lw5v9JH39Q3oLlZp7O+1ryOjGzzGrjZzEwhx64FlwvAb4dkPDXOpMW1mx/Qd?=
 =?us-ascii?Q?miNWE3Bu2EQilJY9iK+cwUuZ3/CHSQ6HCsVs0B9sVqvZ3sxegZBboHwveups?=
 =?us-ascii?Q?OzJ2o6qwdrLZeSq4245alSFRtbcN76zGhzB02xnCzUq6bXi4RB0wV8NPjdrm?=
 =?us-ascii?Q?e9NsIBSu086qJ/fU4jrNI48Tsnx2zoczepfVJpCz5S7RKrVQV7hy4+w+j3Sz?=
 =?us-ascii?Q?lFmi6MHabUVZgHRLUJqXa7hHyf/xeJddvOJ6hSYo12b7CLNBpF7c/5gfcU84?=
 =?us-ascii?Q?b8Cqr+EHiSYxBjBrjAALqXYIhhdAhIHlkMNU7nqY27WorLC8srUx+taPRum+?=
 =?us-ascii?Q?daTGU5GdGQ7wO2Jqf5/2ph3jgE8T67F6dxfkiiLCyRF2PVOQ4jdBGURFb2Px?=
 =?us-ascii?Q?YwS5gJs+D4N6xt3YxtrvKuiUcQDQnrQEk6Q7x6lD03y+Y60YaYo5t3eZ8Lti?=
 =?us-ascii?Q?/hUW4vKCCDc3JggORQDW2t8r2b5XelHd6taboiVvm4ORMNjQQbGh8qdoHbOR?=
 =?us-ascii?Q?7pRIM6YaVaz4mallBRijuh1GjEPOVTPY7a1HpwouKzGe/fMutDY88Y00lGq7?=
 =?us-ascii?Q?8CM4uEnTAETctbqt/3/UAM0pkQUhFfSua1tOOGBeTYzeiDDJi6To+wLH6oTt?=
 =?us-ascii?Q?hoKql2mLbYztAKk8L50fHAMKOQv8fZSbOGdtKmjFnSnw/kL7qocYZJpg5ufR?=
 =?us-ascii?Q?BNmtP6FSIWLNz/5C1xPY1WkBlPTP6TU0hkLiwpIPRByRYBFfcFDZoz5qg1wk?=
 =?us-ascii?Q?S23Bu6SmnJFHGEjRk2F5l4A6MnBMqey8CQABx3Fy0bwZIKCHmOqkzB6ZmhYJ?=
 =?us-ascii?Q?B2apEWzLngK/21xGBaPBvFHr7Q/5QVpsU2x9xVC7C13Xe/nuz1R2ySOSnkeB?=
 =?us-ascii?Q?0wLK4L3S93DVdjqMCKoycjynBo66hbihA7QO6sN0qrW3doF/v8f+oG11/GVj?=
 =?us-ascii?Q?T3R3K/+d0zqqur6NaAWGNAKAX3c9V3nqNKrbXaxCMnOPTGQnqVlw4bToNQUN?=
 =?us-ascii?Q?N5cU1doQkUz5EE5iKgA13MHEDfoaYDLDIctvLs14HzXUcq/XPwawgxgPAS8o?=
 =?us-ascii?Q?xI28ur7a1j5Nv2YYIyUMJ2CRdqk0zZ+1K8HihIVSyCVQd8qpKmgW9ZnvYJnS?=
 =?us-ascii?Q?75+YNLrCsMCaCVREgr/dZIkwoN64Kg+NBTsZ3/JTQSCc/g4gEQNz0eWYHNfv?=
 =?us-ascii?Q?93kRvxYobQafruYvvZzovgCQQPkMppAiyxpVRYpRgdVI+VFb4JlS0wIPAz8r?=
 =?us-ascii?Q?eMm2UfhfmCv6jenwqK12lfNS5adS1odGhrKejGjX0nItrp04zTn+0h+v+Gua?=
 =?us-ascii?Q?0RxxPJYs8OqWDgy6keLSU3y+JmpJKh0YovNwjHFTlb/a3HHTjbHRYoPCp7aE?=
 =?us-ascii?Q?XN+ZTihHEc+WOtXhcxUXugEDMJfvZbGssV6fz/KpfiM1Z8ODCQ46kjNYumWm?=
 =?us-ascii?Q?pg=3D=3D?=
Content-ID: <731075376CDCFA4E97488CDF48E2D828@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QaswSTITqMco+z3rKhrkYixMMybRKgkmtZkgEGHTF3wsEfZmjh2s+pzRc8UqvIYif2qP91HNUg+zDGDVwbbSvHgX5nizYw72RHFQ9301620WKprRnpzZA1G7wzEQXi37ROxWAa/XLBaZ+1Jkq/EMpUzqLDEETSkwLTRwr9Scw92zJnj4HrzkiICpDvMOBRjIhus9MziEokn7k5Qu6mEOmhqRFgcLRRTD1mGB4d0m5+dCqL2QLolpQE/9JivUxjlSWg6KAvOo6XzEP2sPTscNK8gBEb0QexN1ttQ4Fu44I6Bz2juf25iRkl4vf6z9hnGcGBehjy927VeCHRfFh5WyRSOlzkAhwaHuZIiFzXfy1dJ+vG22eKjGQ2x2nMNmvsrRY0pFZJncvNC/iF+TldZPb5DxvYvVVaSO5LkpnTg4wbH0+vF/XUYe9m/lo6NI5GpXP/ZHB1kS5nenVUA5WmjhiHYXbfiK8WwM9cEbpyi6h++1x9+aHKBXrEV9JYUoLhoG8/+aQbE42cCgJQ0T0q05jODsP4hUmuT8A3VVTW9q3KUxPM/iaPA8tByjlEhKn8ilMi+UMBNRNrTgR2kNs+avaKwEyz39jpvJD4sRFwMBRbIIS+coQBwMRUQK2d3itk47
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd0d2af-f367-4071-3c32-08dd02524d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 13:11:06.4068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9UrjcmDbOfPcV4l10+kHEEgN8W8vKjKsT0EJbd9XFPBOKlOAvbsOBfmUZKldjrxv0jekdyfwIHfSn15bGALzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB8853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731330671; x=1762866671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=OJchG/9RJZgigOWNFyz0NAARdLgEgGO69RGBZy0MvGs=;
 b=hvbplsXJ13OjnSgg3Y0pFqNZPckVjOq4qSIYI+25pQCqA92EjYvsP91h
 IX+/KskvTogSBTYF0JP8oD7k+lIO9T+suqx8vFxMgLd6SzBKuYIeBljqS
 lmIqAF2Vygqs8xHs6mVTCe7Zf/KCRecvdO/IV39/oLKLcTMg4e/UgdagA
 IW8xyks4ygUrZBV4xZEeYtuBfCWMFD45cDxcsYWdf0SPcnAzjpV361KUK
 Jok8OOhDwsC1xjXBzyqr7AXjqPXibFcrabXVy0l8iAuCmHr6rgKJQe7Lb
 DcDGvBye8brpH11jxTkS91T5ZPUGzPe36Eo5eHRPars00KlWJ5FHcgDrz
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wiwj3n22fpszgVbUFfc1PH2wHJ4SJiXEHQLni8n9+ss=;
 b=j8RYD2Bf+hDtNyaIHGp1tjQn9Tnemz3AjshhcoiTgqfoqtRkJxM5qHjkmCiGwDJp8oXJNPIJwj/pgOrn9E2SgLqHbn0pNYjm3YrmqkAgLA+ubd1jK1tHUJhV2yKOgVeQ3fjCe0GFden1kqrmBCvOgB/HzXtHLeifsLBApn/upIQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=hvbplsXJ; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=j8RYD2Bf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
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

Hello Brandon,

On Sat, Nov 09, 2024 at 04:16:15PM -0600, Brandon Maier wrote:
> Prefer the use of genimage partition-type-uuid shortcuts over using the
> full GUID. To make shortcuts easier to find, include a link to the full
> list in the genimage source.
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  docs/manual/writing-rules.adoc | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
> index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..10f25a7011db2f8d4ea7c4acb3ea66c4dcce7a86 100644
> --- a/docs/manual/writing-rules.adoc
> +++ b/docs/manual/writing-rules.adoc
> @@ -198,17 +198,23 @@ image sdimage.img {
>    chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
>    (not +kb+) in place of +G+, +M+, +K+.
>  
> -* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
> -  the EFI System Partition (expanded to
> -  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
> -  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
> -  _genimage_) or +L+ for the root filesystem or other filesystems
> -  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
> -  _genimage_). Even though +L+ is the default value of _genimage_, we
> -  prefer to have it explicitly specified in our +genimage.cfg+
> -  files. Finally, these shortcuts should be used without double
> -  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
> -  specified, lower-case letters should be used.
> +* For GPT partitions, the +partition-type-uuid+ value must use a GUID shortcut
> +  if it is supported by genimage. These shortcuts should be used without double
> +  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is specified,
> +  lower-case letters should be used. Even though the shortcut +L+ is the
> +  default value of _genimage_, we prefer to have it explicitly specified in our
> +  +genimage.cfg+ files. Some common shortcuts are provided below, for the full
> +  list see the +gpt_partition_type_shortcuts+ table in
> +  https://github.com/pengutronix/genimage/blob/master/image-hd.c[].

Like you wrote in the cover letter, this series is only partially
implementing Thomas' suggestion, which was:
"My point is that we want *consistency*. So either we use "L" for all
rootfs partitions. Or we use root-${ARCH} for all rootfs partitions."


While this series is just converting GUIDs to use a shortcut, if there is
one available, I still think that we can update the documentation to be
even stricter, something like:

"For the rootfs partition, the partition type GUID should be set to the
architecture-specific shortcut (e.g. root-arm64), rather than the generic
+L+ shortcut (generic Linux rootfs). An explicit partition type GUID should
always be specified for the rootfs partition."


That way we can remove:
"Even though the shortcut +L+ is the default value of _genimage_,
we prefer to have it explicitly specified in our +genimage.cfg+ files."

I don't like this sentence, because it could be interpreted as that
buildroot prefers to have the GUID explicitly specified (rather than
having the shortcut explicitly specified).



Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
