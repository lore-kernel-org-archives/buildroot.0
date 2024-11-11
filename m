Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A88D2E9E9
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F3E600B5;
	Mon, 11 Nov 2024 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpnI_RHipnlJ; Mon, 11 Nov 2024 13:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27CDB6063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27CDB6063A;
	Mon, 11 Nov 2024 13:22:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA20AD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A53DF6063A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNWxy39VfIii for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=03875af56=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B1BF60661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B1BF60661
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B1BF60661
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:22:12 +0000 (UTC)
X-CSE-ConnectionGUID: R9ezdXM6QteiAUOgxbf+qg==
X-CSE-MsgGUID: Jo2FY1pGRWagA73xPgXkLg==
X-IronPort-AV: E=Sophos;i="6.12,145,1728921600"; d="scan'208";a="31126989"
Received: from mail-westcentralusazlp17013079.outbound.protection.outlook.com
 (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.6.79])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2024 21:22:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh8AC5D5D+KaX6Aa2N6kZ2Yaao8MM24MY5TEgztWbmlhgAoZ2cCi8FeNaiqFYytGfRwQ1//nJq+Qb4lxytcvphlBPIR3g1S/STOFZnE0YBhZTi5HT0GYFM8GY8c9WCk8zpjCQRzRunWsq8GKzUlGZM673Xmc63+6XLUdkkPdp2kd+S3lpLRlL8MNynh7BpyZiHJDGjU8VcJ2cnoN39d2caNjqkdQtDsFz08wngEuvoeIQWVDSr5bE9db6dYl0F9Zu45z1P724T8ZBfkIxrY+gH2ycxdmqbGrTkALr9QEZTmmm4IGqHFrhfjbqt2faAvDq+Y0Q9B/0FLG6qX2sO8upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2yfU34Z/tERbInlq3jh3eYiCdfEg4DQSI04cMuSOUc=;
 b=TyrA7W4W4BCjejxq/nWiCUn4RAd1yFOlZqXvCKcHLxZVsb9rrL4otdGotiXI0oV6i/QrGygyHME8SSpwM2YXnYSXzqTpAO6jrrjO7UJ5yhC09nxPLGSBgQu20XOL96AZjiwBj5IuG9HKjApQiICU61pdo42h/wZTl/WkTJsJmd6OwvCravbo1f6MA5OyyPxnXGvJRETwZUa3PCRqABHlETWoxWpMTU8tczhO5SY0BUClCLJ7WEzZrAoJ96qIgVoGdYa1j31EO77uyPuVStZD2pl8Wf+cuxQ4rww9x71X1Fob8E1bOQgSdFFmPYlgj3kgV3sXYcdl11TbZ/10oOnYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6787.namprd04.prod.outlook.com (2603:10b6:a03:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:22:06 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:22:06 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH 10/17] board/qemu/riscv64-virt-efi: use
 partition-type-uuid "root-riscv64"
Thread-Index: AQHbMvUajVogFqkua0GZQ4C2732JYrKyE3yA
Date: Mon, 11 Nov 2024 13:22:06 +0000
Message-ID: <ZzIE_UYSnV5-gPr-@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-10-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-10-9f23180c7195@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6787:EE_
x-ms-office365-filtering-correlation-id: 7cb258a4-c4ab-4205-42c4-08dd0253d6e3
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p6BYOMBCtwEaVy+ZHf2tTlBNT6izKCsMl5KHhAYgQeGCNoAfywL3vtaW+KFD?=
 =?us-ascii?Q?0YfO0k+diW5s1l36jvFy98rkIHOCjmhqDDLKQOLGgLsvMWsPL2R/gV77ZwDl?=
 =?us-ascii?Q?PxZ8yYGF1M0DEFujf2n3a3A9VB4ILRSVSUUv0j32j+Div9twUppMRjoGckrm?=
 =?us-ascii?Q?q0+EdERt3IUYpOd4+m0BfF69VD1TTMs1yMFFKusNFcK3Q1V1QOsPNBldt/p9?=
 =?us-ascii?Q?PdTZg6wsNaWJ21D5FLsJCSIDVhKfKx0/adwPjHCFdj5ji7y1liqmCzh5IGsr?=
 =?us-ascii?Q?+CxStNYgT/nzSX25mI7tx4haUYntGfJWHIEP0l80qmSD4o0/0nc/ZgxZtlg8?=
 =?us-ascii?Q?B/pDUf1QpbirVItlWzrAW2XscIkP0WtpeTdZ6v4QoamYPShrFFMOW1GEGvP4?=
 =?us-ascii?Q?m8H95bJW1wFZZoIoqWg6bH/VKGmpWC9dSTGw87KDKTj3W94lQVcWPlsmYmrU?=
 =?us-ascii?Q?dUu/xpSa+cgY1j1dfNNsEd/rBqxkJlfYjrfQErk8xagm3ACIIAdnCMdHXNPk?=
 =?us-ascii?Q?WmiKgDAp53AlT2XQTj0ky/KfRydIAbXmJnB7E3zZvnQnicpT6ZtkA6ZRnxBQ?=
 =?us-ascii?Q?6t3UcGjkFSPKATPoGat6C98OAMFEMdKIK+qFDQrz7eESPNcp3jDMUqamQXe2?=
 =?us-ascii?Q?qeUC2rWEVFeXTag7r2XzLbBi5hIKHGvE51T9aCTy1iJr2dO8OnIa2BlV5iqQ?=
 =?us-ascii?Q?r7+RLzGn7GASvyOYdYwQjAr3OXYKhItFGPFbZ67SshJz3ByOv6uScKIXfXq5?=
 =?us-ascii?Q?Fc/Oy/6x62GYXgRMalldIQY1NjNeINvsl7R3n5AC44JWreHPE/nxa4Y1al4z?=
 =?us-ascii?Q?TJUvcq+5Yhj6X+yf9CvljVI0xj6IXinw0HLO3kDOI4kbtss8Qy/nMcBj6cJf?=
 =?us-ascii?Q?2I13jZTWFqkPsoE0GraNQaEX+VVc2AwjGTaQgVH5FpJJV4GyOfWmx+gIHdAH?=
 =?us-ascii?Q?EB78YGz8LEa7s+M4r+3iJUcGOmg6mXS7Qf6el48bwIQiuD+V9LZ4P2H736yC?=
 =?us-ascii?Q?8WFboM4hqaWk305jPTWTorZOWnQN/nNmMWAOxaytw+xUodvweJDDN3hNKUvF?=
 =?us-ascii?Q?NWnI+7iCcza+WAnBbi+/LdNPqNnItZqiBrwEh+m2ne9hPxpY3DsZxlN8DrNw?=
 =?us-ascii?Q?mGbmT0v2WEr/zgNdQ73NibWY8EBNW09kwrZwMKUMT2I9EUiRGrnZ5Sk8k1c2?=
 =?us-ascii?Q?Qo9WN9BuXYzySjkf+VZcJR+WDVB9N1CNla64xww6j3VnQimRdJmB6QEPkOBo?=
 =?us-ascii?Q?YfJ1lHZO9fAWeLxDr36EzOigTm8Z9B1avBLiz65MPdEkPSWPhYxjzU1Ii9NM?=
 =?us-ascii?Q?/EIpx4mBjP9YVop9dilo9Z8j?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ayOK2U8CZ3s6r/FF4HGFLx9nzdKg5VNswCT2rxkrRc5TuAIcAbWBPMFYnLRA?=
 =?us-ascii?Q?4Q00hu+YdiZNFcrUVqd+kkJ1zQBf7Dd6+27emX36/ois0AyGYltbf9cHR16n?=
 =?us-ascii?Q?OrulQDFuZmrkNZUAKLw4nKIqiRClOw/8HDgMXZfCxBrCMkVc0JIvbwdpgwAV?=
 =?us-ascii?Q?atneeBTpiizq7OUZasMUmOMQlrkJW+xXHRxDWCjGKrLUzYGkGEX/sz5iUsuR?=
 =?us-ascii?Q?sGUo6aSgkPNIeITJOXZBFyFYVbAldRuM6rK3bnvAPPWZebzQbeLfsm10pP/K?=
 =?us-ascii?Q?3nLxzmda7LZunuCCBuibwLQZ1f2z1/W4m6mCw4RxPifRJngL7PmpqqC5zZ5S?=
 =?us-ascii?Q?ewIhpC43BxYZOwOrPxt6IJxutzQXfv5ExMElr9jQA293d9/xmenUIHK1QrT2?=
 =?us-ascii?Q?MCkoBN34vpdANdtsMsaybg+dEFmf/3n4Hbq4JE5zOLCZZk8hCKwtRNJmgcGA?=
 =?us-ascii?Q?mWWIJk32j7k6urVbbL5eWil+XDeaVEVS4XTTqi6y/RI/1UawvhYyQ5Xjx9Da?=
 =?us-ascii?Q?CflLMRFNkioQWqT8iq4WqFCB6OnD7RaQ+DpvdM7TgCJDgWKrXuOMbBZSM6Mu?=
 =?us-ascii?Q?C6yB5gijT1ix6t/IKrjK4lp+aXLkMMoOCZ49AKraNdgzwvFF0uxTPaoPmSzF?=
 =?us-ascii?Q?OVjKUVIp4lcsqQf9eHontNyccWptbEc2qL/LM9EooF02hBVkpASMXRpMSl6j?=
 =?us-ascii?Q?HdoLcgrsvBTZDVGFLOVB9KbzVqRcJBao3RzO82FTt7VpJ1PlX3aP/O5dL/MW?=
 =?us-ascii?Q?EzlKe4DBNgMquxLoqKxALAIpQ3NqIg3UWMPnA3n9G7Rug09gg4RObfYKVwco?=
 =?us-ascii?Q?8DAWdZv/Axtlxq++/Iwq6GcVJRfkY37VR3EgeXJgX6AkIXAyA17WGcg1nlVz?=
 =?us-ascii?Q?qlSvVOq0SwgIMHs2y6/UyOEL7ge7XVHqtbfZiSgYGceEyl9OV5f815kon23b?=
 =?us-ascii?Q?P+JML0T+DEYfgu9X4igkk6IdhbBpPvD1yQ4VpWGUg2vedAzI9B3kSPOOEhKU?=
 =?us-ascii?Q?ip4+swhTZrT4kVau0qOM/00KILuv5aqoY5wmvCGSngWjppfKR0sP3Q4fIVV4?=
 =?us-ascii?Q?L4DceNxAuXkYbfPxSlbNUPFY7V1tF2OgMwqndVALKiYVTRkBikvnTSdKk0Bq?=
 =?us-ascii?Q?fj1cdg2s6GN6IEKad/Id0HmLbG+JktuVJCbrwE72QVdwbnraE18wuNX/yp4b?=
 =?us-ascii?Q?H8FLZL8dIz8EgGtkYS/Sjssm/KxdVicgXbB913U2ldpiqj1+SLjXY1I4fdZw?=
 =?us-ascii?Q?0fCvkbYSlmJAzQ9wuLb/8nuFoTe7t9NUr1yYC2V7GcsgcZk0poFsewhaO88i?=
 =?us-ascii?Q?jquKRr7mZNWKYN7NHtCW0RCl+ddkycPaV6n5IZvHWilPsfWuthKVt4nl1osW?=
 =?us-ascii?Q?igQh+Y2d40uPlQ1Tiafece2fKcOI0O4VIe3kUh/JutCru36Ifn6uTUJtRVSI?=
 =?us-ascii?Q?rC3krtX95USs1nSzJeAJfpBTwWPrJ0B5XZvhlLfHG4puzusU5VDb+ITqSxKv?=
 =?us-ascii?Q?AIHJxpdezjEWguYhWzAL3Uw2oziOOkvdqY446Lrv3pNJI0GeR1Apd1ky8fCJ?=
 =?us-ascii?Q?L094t6TcZg7RCYT0iT9wtZG7ma8/Mb9C9/YBVHlhwzXYqk6QCBo3PjIXsvDM?=
 =?us-ascii?Q?Og=3D=3D?=
Content-ID: <283E28F8ED2C1A46BBE0DCEED7152611@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7nFSRRyA1sJlBlAqU1O9ea4lbYr5jzPyUDa+9Gy5wE4wjYw3Tf69EJyZeaYdnCoKBWXaLHDvqYh5LqubjziEjAWfne+l1NclzGck4YUuF4FnzmMbpBE6RoIVB+N6tyDBn6TS0T6mJUrKJHrMrmooDw7LYixWPfbXeohpRxJFOcM+4mfWC6WuHC+oifwPNuHRCCZFS0SAGsBGIWKGU4A+OC9UGOc9Gt8dIUSve1EbsQk9KUxQdfc2oqCaXTXT/xeDpqSui6wVV8wKyp+hZRnFppMo1A8j7yWCAeTe/z2X8sNytj7BGh0sl0GoilXdGFgM/lRLrliQownm2iu+NcQVws6LoRmwBfz1Ljhgb41+4tKFPgRD5BNGbAQDOpJmQoB3FMfJy5kaTIUqVxuDM29/d08rpDXqYsTOcjGjFvkQt00JpDWX78EagITAtDanRftZlYgWAcI+Dns9sfc/QjiulywCP9O5eSBQpbrkb3zzbh/rO+5MyfxxGBvdwMX5nvI3FbJlaFi63oa8mDSbca1j966JEev9WiuWcs7+zuOzxMkFumFvHZHh0jCy6gv/1RxXDkDJLwiyR6RTkKUVmXXO+LMZ2ugpoMLe80AJFyON5GS3QpABnF4ioY8OzT48zAxF
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb258a4-c4ab-4205-42c4-08dd0253d6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 13:22:06.6626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iq9fmF0lqpONEy1KsJlMAcbg4wJHhJmWFcCZA0yklCKTAOltbKOT9GOTS0LDaZPp6XnHBj6IM2AFgc5FiOA32w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6787
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731331332; x=1762867332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=7jsyC0bdOqGzmNyEoVlhiqV0JfmAnLR2vrgiGnIBl/c=;
 b=nft380LPnbZPT8+l8ieF2DvfU3hTDdn4qb4r75yssnhp4SJqBlUmR/GS
 vUPNK2OI2BdGmi4llAYJbPvCP+I/XHg3XD6Zj1GIKI7aSnOaa+YBA1YxG
 BO/msejn2euIZa9riGfUO5feDkfOJkRFl85CK/L09VrtOOBm4Xf/cGd0p
 SpeN2n1zdOYb/iVeUT/CEyWpVcLNXrZRm7x1cHD1mnVPzWLBLAsjmil6I
 49K2faa/koleNPGZMuK1fxI2BGP190sFGjy0AYI1Hj6JNIljTJ9kCDxi4
 2mcKfck75l/J6h274gUadwQczcYAxz3GRh0o5vSt5iUvtSt8+veURcLyT
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2yfU34Z/tERbInlq3jh3eYiCdfEg4DQSI04cMuSOUc=;
 b=UCRUjEg+mnuGFYLthxbnrK9VNaI7FzsURIOFSnh6bUvNfC5vRo+4Gqnhoi4tOEof0gJVW5QB82iV+3MJD+z50qszMoGEk+D+1HgElrmCxAmuou1qA+ICJpEbMpi0b+945I3kEhVC3fvTMp+bMuXdX3ibWjTEjzhQxaK9SjvJQTU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=nft380LP; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=UCRUjEg+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 10/17] board/qemu/riscv64-virt-efi: use
 partition-type-uuid "root-riscv64"
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

On Sat, Nov 09, 2024 at 04:16:24PM -0600, Brandon Maier wrote:
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  board/qemu/riscv64-virt-efi/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/qemu/riscv64-virt-efi/genimage.cfg b/board/qemu/riscv64-virt-efi/genimage.cfg
> index 46950591e0a3d4c3fb14f81d71a6c2ccf245d564..a7d5420d78dc637a0c18fe7ce2ff86378b55741a 100644
> --- a/board/qemu/riscv64-virt-efi/genimage.cfg
> +++ b/board/qemu/riscv64-virt-efi/genimage.cfg
> @@ -28,7 +28,7 @@ image disk.img {
>  		# For partition-type-uuid value, see:
>  		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
>  		# SD_GPT_ROOT_RISCV64

I would kill the comment above.
Now when using the shortcut, it is self explanatory.


Kind regards,
Niklas

> -		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
> +		partition-type-uuid = root-riscv64
>  		image = "rootfs.ext2"
>  	}
>  }
> 
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
