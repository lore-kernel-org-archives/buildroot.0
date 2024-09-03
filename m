Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D1CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 961FF605AA;
	Tue,  3 Sep 2024 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bemTP6PH1Zma; Tue,  3 Sep 2024 20:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 655B060680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655B060680;
	Tue,  3 Sep 2024 20:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83FDB1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B0140112
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URn2QCD2RLxU for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=969f4f420=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E89FB40A21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89FB40A21
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89FB40A21
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:06:38 +0000 (UTC)
X-CSE-ConnectionGUID: IGgiFuj8QDm8EuPboBxCCA==
X-CSE-MsgGUID: M2HsvCTQTx63fo6yVGII0w==
X-IronPort-AV: E=Sophos;i="6.10,199,1719849600"; d="scan'208";a="26650614"
Received: from mail-eastus2azlp17011029.outbound.protection.outlook.com (HELO
 BN8PR05CU002.outbound.protection.outlook.com) ([40.93.12.29])
 by ob1.hgst.iphmx.com with ESMTP; 04 Sep 2024 04:06:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suXAUwAA3HYC/dviHsZ0O3rEs9SiwquGGFfmnhM4MBF9UnP0qeg1qZW/BKPXGWyCzA+r9NkdffQCK89g1biQf9/r0Wx+76DYszpSDrcpUgy7VLCxUqLcnUuwpZ1l5tmjm2n1OKEW0p6Fe7Vf3fE8GuSbJqMYLuFV9anP/mTiUhC9FdZWbUP+c+Ir7v8r9ICnRvXlG7POtEcJKjdHfLqFtvGrZleDs1ghK1xLKpOE8kg2H+cdMaypNeNCIQ4i+uqH6QdJJm9KaTzrqxejSZbO7Ztqu7PLWyjpShpKbaS+VeF/vRuXm2aAbVFbhIumNhGxV8yHHvtlEabcou/aMOi7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdAqe7ELED+xZnjHqWLaMfYdAp8+ni4vsO/p5YVOMYE=;
 b=ZE49eUlEs6w38OBdjjAduy2VeI8KA88nYVfwduS44Xx6f1P5WNhVN1i8ebqcBkMgJ1yFA0gFulHb14IzT2spSGVqcTEn1uMUPYcp2w2rOq+n6tY+Wzgd8pzqmLXC8Cqs9bJmhrGf1J5ZqzVGrxAXyILxE9v0WB3Y/6XZ61Wokl1CMT/+ZgwXmS0seaIqwD6WFiFdwj5BsCQCblNjX+3H3kuelpVkAjudSBttFUDMPBEq4OLxPi31EW6QcObsb4npbYWYHfY9ET9oMWctHoJuykEtr410ffJUEUjJf7/N6EImwO+1827qyhjOEgTS6GY53P8HuGjVmv5s0RCX0aIXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CH4PR04MB9106.namprd04.prod.outlook.com (2603:10b6:610:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 20:06:35 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 20:06:35 +0000
To: Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
Thread-Index: AQHa/SUvwik4mZfGrECETvuPU521UrJGc/mAgAAG54CAAARhgA==
Date: Tue, 3 Sep 2024 20:06:35 +0000
Message-ID: <ZtdsSR6M9nD614Ka@ryzen.lan>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf>
 <a31976ae-fdf5-4a62-aece-52fb70775b39@mind.be>
In-Reply-To: <a31976ae-fdf5-4a62-aece-52fb70775b39@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CH4PR04MB9106:EE_
x-ms-office365-filtering-correlation-id: 1e8ada16-2bc9-4fd7-728e-08dccc53e982
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nFZow2J84VcnHAZB+xngGClMI1+uyLmDAXxFwRll5jpMe0PNwV3DIgkipBXk?=
 =?us-ascii?Q?3GcjI5m812HrQCxS9K5wRGWU/hpsB4TYYQGT8jaSBIwaehKS52a91Aoq6kRK?=
 =?us-ascii?Q?tvlqEili28bhp9568YUgSDJ0X9j8t8yIVSiBsa5uz8tZ8VEFPHMZ9RUqdQs6?=
 =?us-ascii?Q?1o237a6NUWHTvkWibAaBVrRSnLGPoisJVC5gfvLgxV2pEx351yv3VNCGUhVq?=
 =?us-ascii?Q?U2rFj/J+UyvFgeVwB1VCRmPnvGKs3UgYWA3pFnZR0wMoB2VUPOFaYHkkS4p6?=
 =?us-ascii?Q?vaN7dcqzlJSt153tmL5Uw41Efingwg0Nz3sGRaA/FmnPcJhbYp9NoqUHmfj8?=
 =?us-ascii?Q?Fo/CAKvTS+IMjwoSXHaWnceMbQ94JPLO3lbM/eC9P+quFWQBZvcGO97Qf462?=
 =?us-ascii?Q?ll0dC0CXdMyr7HYCECt2bWkHV6m6WqV6Yb+8jfkiP2w8DEYnU3HBIqSQPjXy?=
 =?us-ascii?Q?SvyzxCAx/D7dpw86Hs/QsLKRQ+YinGJtFqZFBYE86Ac0BEXX3zrvgq65wv5V?=
 =?us-ascii?Q?sy9TmNo+lbQ21oXmjHs31U8SxjlI5kaQIML7/1OPRjATY4WUz8s7CC6MwX4j?=
 =?us-ascii?Q?lP4Vwev3/QBOfhMnjYwLYKVc+BqitZt2lqbN9FLXTktyLVDpHj8k9UqPEU5D?=
 =?us-ascii?Q?awQ0tgeO+E5g3/EZdOH+j14nXuEdToNw5mb4bZUtsXkKIfZRP4CrN9wAbpYO?=
 =?us-ascii?Q?aymIauVsSeEKn2ir8qmGtzlyBCPZSxGQp/NLW02DOF/krLiw9Yc+Jd6Bk6p4?=
 =?us-ascii?Q?tgpnSzFxL61+Bp29K7NgMJDhjSxXt+Yj/Ed2ETIcQayNsv+bYmbtwwz/L44T?=
 =?us-ascii?Q?vhs4D7gxk/rn3tv+gM2G73oMYrhGIj0/2cqqehD/QynEOyYQTyeOKJ+Hpr30?=
 =?us-ascii?Q?NVzh61szsb1w83DuelQcfyrlXNdz6RsuBuXrwVIksBJSWbT6lhBLlZDOdFFk?=
 =?us-ascii?Q?fD3XS4Preb5rZUQQiPpQ/Nhla9ywxnSJs/HMc+5fszQg06I8kCIg/n/egSrt?=
 =?us-ascii?Q?FRRLJJtBUd4Mn8sTJUhT1x/0HWgVBybRLlEr2ilmfX8R55XYJsgZuHgJ4xy9?=
 =?us-ascii?Q?TYXmlIZSyaTCmFc3doM2/2k5Lv0Pmk55suVjgspLQKSYdCejudUNCHh4aKSP?=
 =?us-ascii?Q?NxT3Ca7ibzv2Ic4AKADMPkZbJsdByZ8QfQatxHWIPNgh/5pKYCJQH3eM1a1Q?=
 =?us-ascii?Q?7rptxMLYO2IX8eaXROArtTmomfKzssZJA9VdZxx5rgydzGwtwvPpshl5WnJu?=
 =?us-ascii?Q?+SaJ2RQ6HZv3eKoqXbYfgeVxsaEmFWAxmRv7Nnk7Rs79MksNA4E+jFyPQKaZ?=
 =?us-ascii?Q?EL3Z9+noBj5dzilCgLe1UBRsGJ7S2bsb8XFJlldkzBJ3KGiiomUWh1nZFsQA?=
 =?us-ascii?Q?5mRrEfQ0utGyC/Ry+I4pvn20loJ+PYsoWEeqcgUnBT1/l9gWyg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4fhK0xyTVZRyaiwpkL6KGG6/U1yv8e06Tubpp91JayVWY2/FbD/OFhhis3yW?=
 =?us-ascii?Q?Tt9G8ITivToE8WEHaGKRt+RFjxakKGoPVzKTO1EKnDqU2ouuAbp6uGdTFJjf?=
 =?us-ascii?Q?ljuMTIhTpwwReH7nrjlmxzy1nNXoavRhjZE+lQLkGc+s1oBjHzxUpHBMEIk7?=
 =?us-ascii?Q?nBTEJvo3AsEEn9H5uK74+exzAXGdqFyOwGhQ7l2C+fPCYuyPnHA1LFyAp03p?=
 =?us-ascii?Q?2gRMQykKWgxctzchBY1JWszYu/f1VxVRdjC5ZsVzA1zwscEiIdKA0DVPJpYf?=
 =?us-ascii?Q?bRuZxgddkayJi7jWIKqUqVAsvx48zkhG62/sjFqUsaQOGBv99B7ebJqX9q3b?=
 =?us-ascii?Q?P7kD/i50sTy7IjN+yLvvIyXG1k7UZUmSveQC95x+QCOerTfClYZiGqtindWk?=
 =?us-ascii?Q?pAtj65NBs4enLAIDnJaSECcsgb7mIeOH36XerLp14SZ3djk8nCgSfav69UqV?=
 =?us-ascii?Q?uRFHflKlDHOKzDBsthrEB+uel3xcuOQx3LtnX5KcjoetdqzMuDz14mvR5U+9?=
 =?us-ascii?Q?RE5tB61Ytfg6sPmG55Zge2A2OLPVEdPr9jpigXQkAdW7re1aFXR/3kljqcNS?=
 =?us-ascii?Q?D+oYMNBJJXZxqIKMMzotZCTSI8wvrjo0Az9QSV2Cjn28uABZHcOKztlDcPMV?=
 =?us-ascii?Q?+ZvAd2oRT2hp0ghI3dBYYqpgpvVu/r4kCsv+yf6jsQov30CTHSYtBsrg3V1X?=
 =?us-ascii?Q?yK0i5kl2e+ByFcdtVoEvI32bnRfVoF8UffXfel2WJWQwVZgQTkcMOrSGv388?=
 =?us-ascii?Q?NKIZqhW2wK4dxSMAEh+yn22MMXbm9GI0vWmD7Vxqr/UwatOSz56QTbKn4NX2?=
 =?us-ascii?Q?U8dG7KjfOzZxpSMzDY/IUfBmz2sZrI3FXnWMkION1zjFZEwFPBzWQMJM/xeR?=
 =?us-ascii?Q?zgn4BJ7AqjwtYLzv9FYn9wlXqG0mJF8I7j9nS8G3qTDsfucL2EUiqrhstPU/?=
 =?us-ascii?Q?y7u3BOAR8RiKTqCS6bwQNABcJawA/Kl6Rhinbz8brAQ38pzCOrdO0cW2C95U?=
 =?us-ascii?Q?0NnKAzRgvAtHOU8Loyo8fOklIdi1CTQIjtrcQ7SDV6qfhibLHXi1rj7Zvxw3?=
 =?us-ascii?Q?4E7zotR2+2Sww2jlRrKf5sn2JrGwqYuTEvJoej9F/8c1xuOROm45sWvbr9P9?=
 =?us-ascii?Q?LLZv0DnWuzGL54YKXJEcO4zhQxPTbZgcHyCpThyVNtYPUvQlRENdyonvQk6f?=
 =?us-ascii?Q?vFB8cnSlofHl0JMl34GUnX7VcEOR1AXF9bLfUZIcY/Lgn8w0yjOg37bjRmAK?=
 =?us-ascii?Q?dc+KM1WHA/HiylQTFrZv91Gz0uIuFXc5WZZInrfX7K8uaN5EsjvxvZAYxFAp?=
 =?us-ascii?Q?ZBRJmIDYip8OnIh6WXfoEoLxKE31IovGFBmvkvcpwalfvwby0gMgeNuC5Icf?=
 =?us-ascii?Q?2ktqlpdlghDikToXxMw1sfGRTmhhGxHUVvuS4f+ebmDNCsewJR35KSyChWfR?=
 =?us-ascii?Q?ODu3T3qah80VdabSsW7APbESssArXxD0o/GlOGfQZJsvTxNNRUs9Klqp4M1N?=
 =?us-ascii?Q?Dl5hkFWniA/vroiSqhsRUvm3eNtAgq0/50nVwSSGCQjpF9cQhkYbivhG0YSX?=
 =?us-ascii?Q?WaNYED1gXwiN14t+fI0N6HjJnRU+DmUQCy2qc+YUrnAyBnGm8DRYIWfPaQ22?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-ID: <DD822B7E33027445B08A9A61A6FDC2D4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eBRIRMOIOietOjP6a18dMbIFwRQNjgKD4TqmKCkJ/WP0xeCBk52TThgPVdNRg40KuzN5nRmdL0R0WZS5wbROiAPHxoOihkzyVXLr85RSEY9owE6IHjaLz0RDBSp2G6L7K8H5zFj4iUIikoWRJDYFdxHEtvq0+t4wK7eFUUrDCHstK49at5H2uM/b6RRz7VXvpl25h0QtH5tA81qkALCH+Ifk3p3CQP5H8DdJxZJJhRWUCYuY0uzmo+07SEdyp0Zl4xfVY6+IduTk74VMDfyoXGzAPjef75hfEX/SY4F8PV1h2xxXksxt18DyNh5oUqrbJkuD/Xqa8zd/s+UeHKKjDJFuGeIpbbzVnZP9UnKBe4JmLwHFpK5rAdIeS/TMCKcRMECXCnqdTlgXKtpJEbPn24d/W8pAyTDeyxF7VZgzB6ScymkWf1jr4HpSdJw3rDSX+Qs/8ntsDit6aubWZSL7/Op8Ynh6LDwoeP86FotL7WFYOBQ/V4Jk5oDM+koKJT++RSYeQ4rCdlR4fmA5L4OPn5TnGlGqSkL1VIMIspS1IbpqFszWxaObLcnSWftxDB8lhGuz2EZGkgdu66Y5rR02Xac59b6RRFkxUGQ2ckvLvtTZMSsbGnrLGIhLBf2bcasJ
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8ada16-2bc9-4fd7-728e-08dccc53e982
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 20:06:35.1704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l25zbZPIyUR4vWGURSsDc4dhDlGdQ4L8PFUIQHW9c8MLfzkC39da5bw8njUfQUlaatvNqH0nW7KX+CDJncGFYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR04MB9106
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725393998; x=1756929998;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=s4LVOcJQfrVkB04ghhJH5OFiOEdeS879/zEQ1j68mtc=;
 b=maWFFbywO+h9rh2LlqQTjPL+Qn9zrZnFnILXyVDu0BUd/obdcs+t5gRA
 qcF2MhgwNXGOJ3DbGsi6LsNyN1cTh8Mn1/NI1rbTrfdrpzW3EAXicU7u5
 yy32uubQys0og6EXiQMirWmQtmM7ToaYvpt4JJoYHqFUSxCSaRPcqBcJ+
 /vjgsuv5e7nsZ/xZlaaHIOTLZK15n84WjDw7qMmXLk9//gwQ8HSMjKFtx
 Ec7KPvqZP0fMUgjaBYAEvTmwUtDjxSdMg8VE8yedFDhvk9mKs677Jd+eR
 VS+vWp6pyUgiYUsdQolhEE+bwUJnjXXnZb377AWODSwX1d7me3R93hw1K
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdAqe7ELED+xZnjHqWLaMfYdAp8+ni4vsO/p5YVOMYE=;
 b=erQBqugKnyvsix59RPlWjCACan7eJZvPVJcKO3ZxPwPGEZPJ+0wcYH+ytZHZTNaeX+qeIIEmn6PHSaGij2JZ2j9N/3e/hmrHi4O8dRbbU81GNQCFJ28njhx814V6CPKGI6HGSCaZJZrgrPthzDLIUNn5ejpa1qj+L4lPO+6ZgbQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=maWFFbyw; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=erQBqugK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 03, 2024 at 09:50:53PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 03/09/2024 21:26, Thomas Petazzoni via buildroot wrote:
> > On Mon,  2 Sep 2024 12:44:31 +0200
> > Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> > 
> > > From: Niklas Cassel <cassel@kernel.org>
> > > 
> > > The arm64 defconfig enables both the R8169 Ethernet driver and the
> > > PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
> > > 
> > > Enable udev so that these modules will get automatically loaded by udev
> > > after the rootfs is mounted from the SD card.
> > > 
> > > This way, we do not need to build these modules as built-in, and we also
> > > get the benefit that any device plugged in to the PCIe slot will get
> > > automatically loaded.
> > > 
> > > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > 
> > I'm not sure what we want to do here, especially when this ends up
> > needing net.ifnames=0 that you add in PATCH 4/5.
> > 
> > We do have already a small number of defconfigs that enable eudev. So
> > far we only use net.ifnames=0 in 4 configurations.
> > 
> > Basically, I'm trying to make sure we remain consistent and have a
> > policy that applies to all defconfigs rather than ad-hoc solutions that
> > are different for each and every defconfig. That's why I'm a bit
> > reluctant with applying your patches as-is because they only solve the
> > specific case of this defconfig, in a specific way, without creating a
> > clear rule that all defconfigs meeting a specific situation should
> > follow.
> 
>  We don't really have a policy or rules at the moment. I've added this to
> the topics of the Buildroot Developer meeting in Vienna.

See my reply to Thomas where I suggest to create a
BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES Kconfig which is default not set.

I think that would be a nice policy / solution.


> 
>  For the time being, I think we generally prefer to have a kernel config
> that is as much as possible custom for the target board. Thus, we also
> generally prefer to not require loading modules. Certainly for ethernet -
> having ethernet as a module makes nfsroot impossible.
> 
>  So I've marked patches 3/5 and 4/5 as Rejected.
> 
>  Feel free to give arguments why we should prefer these drivers as module though!

Sure, we could keep the Ethernet driver as built-in.

I still think it is a really good idea to enable udev though.

rock5b is currently using arm64 defconfig as kernel config.


Just enabling udev shows this in lsmod:

# lsmod
Module                  Size  Used by    Not tainted
hantro_vpu            270336  0 
rockchipdrm           167936  0 
v4l2_jpeg              16384  1 hantro_vpu
v4l2_vp9               20480  1 hantro_vpu
v4l2_h264              12288  1 hantro_vpu
analogix_dp            36864  1 rockchipdrm
v4l2_mem2mem           36864  1 hantro_vpu
dw_mipi_dsi            20480  1 rockchipdrm
panthor               118784  0 
videobuf2_dma_contig    16384  1 hantro_vpu
dw_hdmi                40960  1 rockchipdrm
videobuf2_memops       12288  1 videobuf2_dma_contig
cec                    53248  1 dw_hdmi
drm_gpuvm              32768  1 panthor
videobuf2_v4l2         28672  2 hantro_vpu,v4l2_mem2mem
drm_exec               12288  2 panthor,drm_gpuvm
drm_display_helper    167936  3 rockchipdrm,analogix_dp,dw_hdmi
drm_shmem_helper       24576  1 panthor
drm_dma_helper         20480  1 rockchipdrm
crct10dif_ce           12288  1 
videodev              253952  3 hantro_vpu,v4l2_mem2mem,videobuf2_v4l2
rockchip_saradc        16384  0 
gpu_sched              40960  1 panthor
videobuf2_common       57344  5 hantro_vpu,v4l2_mem2mem,videobuf2_dma_contig,videobuf2_memops,videobuf2_v4l2
drm_kms_helper        188416  7 rockchipdrm,analogix_dp,dw_mipi_dsi,dw_hdmi,drm_display_helper,drm_shmem_helper,drm_dma_helper
mc                     57344  5 hantro_vpu,v4l2_mem2mem,videobuf2_v4l2,videodev,videobuf2_common
drm                   552960 12 rockchipdrm,analogix_dp,dw_mipi_dsi,panthor,dw_hdmi,drm_gpuvm,drm_exec,drm_display_helper,drm_shmem_helper,drm_dma_helper,gpu_sched,drm_kms_helper
industrialio_triggered_buffer    12288  1 rockchip_saradc
backlight              20480  2 drm_display_helper,drm
phy_rockchip_usbdp     20480  2 
phy_rockchip_naneng_combphy    16384  5 
kfifo_buf              12288  1 industrialio_triggered_buffer
pwm_fan                16384  0 
rtc_hym8563            12288  1 
snd_soc_audio_graph_card    16384  0 
typec                  77824  1 phy_rockchip_usbdp
snd_soc_rockchip_i2s_tdm    20480  2 
snd_soc_simple_card_utils    28672  1 snd_soc_audio_graph_card
snd_soc_es8316         40960  1 
rockchip_thermal       24576  0 
spi_rockchip_sfc       12288  0 
rk805_pwrkey           12288  0 

Without udev (i.e. with the current buildroot rock5b_defconfig)
none of these modules will be loaded.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
