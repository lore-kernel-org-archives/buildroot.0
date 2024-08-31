Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C5CA1018
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA821606CE;
	Sat, 31 Aug 2024 10:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbIJE6Rjfme5; Sat, 31 Aug 2024 10:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DE4606A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DE4606A3;
	Sat, 31 Aug 2024 10:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D42A31BF2FB
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 10:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC9FF606A3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 10:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOiPFzMJdfYj for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 10:44:58 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 31 Aug 2024 10:44:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 802EE6068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 802EE6068F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=96651a518=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 802EE6068F
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 10:44:58 +0000 (UTC)
X-CSE-ConnectionGUID: BF/qNr2zSGyJTqMjq9UV9A==
X-CSE-MsgGUID: kuQxrinCRIyqle2c0L4ehw==
X-IronPort-AV: E=Sophos;i="6.10,191,1719849600"; d="scan'208";a="25649318"
Received: from mail-eastus2azlp17011029.outbound.protection.outlook.com (HELO
 BN8PR05CU002.outbound.protection.outlook.com) ([40.93.12.29])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2024 18:37:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftLQZiK3FvUfSvheZPTIG2qinautzeiii9d1o328LM0+RFFEl9PC/F6NT7GgKju3xELRikvBnx9YXkibJRWQSZGu7t/20JVh4x8pwdCfloymhBqItJYkLBIHhYVE05fjbEuVpLXlpaIaqDDd5mPeI3m6hPVgz0hZmRaKw9Dg0zI7WaE1XQ29bTjRHAH6fcSdVxU8Id4EHZC1vuYzNrPL76BhWR38zvo/QN5IATWNpcCeJY/SerMqTt0z8AFrwYDK9HBAo96ayoFIEKXw89fSBoVDM0faS8Ab5346x5/lM6n89pnX7v5rgJb6z4JeZ0CTcHul2rN9pDCFs4kWjmje3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+x/oq2smCQ5mg6uvd9uHSuu9geEvozEztXcS4Q7RWE=;
 b=bDiuZNIIieKW3MsD25NU2BFOYjKYnSypFT+JePYCBD1MqdFpPvzYNKiRGbmnQYiwzTatRqKTfs4o8JH8RNn4Swe0Bg1lMLZZ5LWnt80fPcm7yPtW+M8RRN+0TUKTPVK+xciFTSQTXYS2KQxT9TrwbN9KSbtPWuEhROBMfMzDitS/V86kSzHNPJjYYv938EQx3cLRwoWcjDV+h+SdssG5o9LOScAn8++SME00Y1S4wnzDbX7Qv5xNAJVytIr++bc0forE0p8UMBZltqRaCPYv4ZJrWi86yehliPUvHnpnOc6/+UsMplEbwV0tlv7SoQqcs0J+67gK99vuEYchfq7BoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6927.namprd04.prod.outlook.com (2603:10b6:208:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Sat, 31 Aug
 2024 10:37:46 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.019; Sat, 31 Aug 2024
 10:37:46 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
Thread-Index: AQHa+sZSwOF3S0VFzEC/tk5chBjVerJABX2AgAEol4A=
Date: Sat, 31 Aug 2024 10:37:46 +0000
Message-ID: <ZtLyeSzV6TYO50jh@ryzen.lan>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-2-niklas.cassel@wdc.com>
 <20240830185613.1d568c17@windsurf>
In-Reply-To: <20240830185613.1d568c17@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6927:EE_
x-ms-office365-filtering-correlation-id: 4b511419-03af-4ee3-10e1-08dcc9a8f3e7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?i3ifk/vCjhC0kcgeBHVyutnkdWZf2E48NY9/xlyKc9TQLpA3ridptQT0o4jg?=
 =?us-ascii?Q?TZ6+OqK6h40CT1J/o+XiqLBqfHG8Wz3kRKfUaBahV6DGN3CPjA0LvFyAdWzq?=
 =?us-ascii?Q?EznrSXk4VyuC3AFDuLtulEqyOC7iCvwrDHoyxbYpjsBFeL9+e87lm9ma5uKT?=
 =?us-ascii?Q?fomnyuZWTblGBApDLJnslzZ3cCtMCzyBO0izroUvSq4K492o13lM2Nsy0oDD?=
 =?us-ascii?Q?RpkDtI7iFx+j0hQ0gfVquaAP0/zFUnC813hSpwU36N2VWTngMMO0sZnUbrxt?=
 =?us-ascii?Q?8Q0D09RLE6CvLJUdfaMUPDDzzgYYb4BoevpMNRgiBQUs7qIwhrFf8gu+yqxl?=
 =?us-ascii?Q?PsfFQouUnKkd3NFunH84oZKABuiYUtKiPP8BhLirdW1oU7muqsYs15ouLsSZ?=
 =?us-ascii?Q?rslKrq+Uv6Gf4Yie4NA+cIYP5TqeSe75mJMEPhNYJ6i6oAtXESTePstOuGJa?=
 =?us-ascii?Q?8Ypu175PMnc1kf5AVAHws1NDNnZu+Mp30mlZUH40LGNdpCuU0a6rcHUsP46g?=
 =?us-ascii?Q?KkI0tDNGX7sYl6f2BVBsa923fuVd4r9lDQU4AW1oXLPzF+bFezyFmI+yIo2B?=
 =?us-ascii?Q?KsU1i8FLTrcYYeLDhhfz0nQOAAeW0NZoBbuhHXVQKxuroNgy7NKIapzrxx8k?=
 =?us-ascii?Q?87NC5dUSomWXA3ZKsdsH02H2cbFe9wm3AGKeYkysLdqYtXXhogzn3wg7pC4W?=
 =?us-ascii?Q?gMDbk15JfmSt3R0CSw+OXv/f+YXxVBBhVBMD0mzjBRM6fdsVcOtW9+JdyaNu?=
 =?us-ascii?Q?/PHnZbp7evt30DhIPy9nJAWFbqeKWoBKW+cB8Omma4qoNaDEIeUdEvDTcjRw?=
 =?us-ascii?Q?kshVs02CBbEDuYnsU16veLmuy9ZP9hMa7dy0UibKUITW0sGUzRPHhOh2eG+M?=
 =?us-ascii?Q?SF5iixJyLUt4JImaQ+Xc/SR7uZn+sd+T1GF/mYk8pefK7q3gbUQZJUoeiZAw?=
 =?us-ascii?Q?2ktoIG52lB2ebT9BXE0EyuoqA9lIUF+gXP2Qo/8ShKRzu5SvryaBoNxohhXb?=
 =?us-ascii?Q?PYue/Iu+kVpKUJ52rh6RW8a4KpC+psMp68JI4ozAwgT/gcT+9W4T9mClJbjn?=
 =?us-ascii?Q?lEcduNCfK9BB0Njkbb+N0JLoUo7c6UCMU+5H3BA7JNaCOQ9WFSwE4TONV+n1?=
 =?us-ascii?Q?jZZetra5dcsdyYmgXu35HonvyqnQQGvewDDoAAX56jxu7lvnOp7N3621oZAj?=
 =?us-ascii?Q?ELovppxw1F+sMBVvkVkNwe7SINlS6k12exWs/Jvb8G8r5GpCtXFpFhRy2f2n?=
 =?us-ascii?Q?oChjWRjjTgILAse6DmlLabE8b/KohLVkZPHkUJdCffdAighm2eibdzi+41PI?=
 =?us-ascii?Q?BxFhdoE5m4QtEFXMklFE5bEAPr4g4YZpBEjmIrdgoITjeVjxk5dJJEG+iv5b?=
 =?us-ascii?Q?0J+AK426NJVq0BE0uYFiF9jnGkwKUt+1ZQPK6XyoHsZ22NrUkA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bVSW+MWAtXIBD4RSg14sN2vpWuELi8mKA4uTkY9Y3ymzag7NshLkgW3QJ+IB?=
 =?us-ascii?Q?i3NwOQOTm1f6uxPIvmf2Z9ZCLvAPxanFfLTu5/idYP1WzqbDUUuaSCahIptv?=
 =?us-ascii?Q?nkybM1HYRy4Lw4yYnGuQ03ZYWJKX7v3KxKF+0mlF5Ii556lECpYFEbwlKOJn?=
 =?us-ascii?Q?Cw5S4lLZYC/p1D6PgXGvTnS8DwIgHt5K+uZvRfLS9Fx+JCe4R6SE1gYbuHMx?=
 =?us-ascii?Q?AMgVsB95g6+C/Y/u79QLxlijxNAelnt29lEaqPI21cHvmYO+x/y8MDVhHC5m?=
 =?us-ascii?Q?tmf0XMdr4PNYZCAU5bnUwrkjift9dEk5Vef/5WHfjnkKBKr/hXoq3RqKB0Xq?=
 =?us-ascii?Q?ykmUbad5GSVBriK8GAnvkMcxlkgktGkixr/9i2MLtRHeCoE75LlpFf+8Eu4B?=
 =?us-ascii?Q?7hJ1c2ijboky76uqt81vmUYTcheKl2C7CPPafuE6RRNxhMuJM5sFOXwUWEZ5?=
 =?us-ascii?Q?nEgy+qixtUK1ssthwLPCUi165UNTDoSAtJ5vGNUSEjqubhprYs0J1Dg6mxoT?=
 =?us-ascii?Q?rwX4TLSoXC0Q9qd/vJyOXozQlIJId+6H5NncxFxxmwUuqKnwCsXIi0bYcvz8?=
 =?us-ascii?Q?uBzr2SRgeFaCpeK0FJa2D/WwJKoHr/5FKjb9/phnJ1eA0oy4bKzclJOcTu0l?=
 =?us-ascii?Q?tHJXNkgVu4RPa2A40Dr8fnaLTXaEW5FaHlWzUOn5Ekf+ASv8Hm0Xqz3VwOQp?=
 =?us-ascii?Q?4M4cQEhEUZnIQS8GJ2+zgLPQLbLLhneLjLRTqOmE2/NZJ6vHkUUFqOOKXVI5?=
 =?us-ascii?Q?nQETWE0cy/pq94J9XjwWp1fVFtjk3+DHUGuKpSAl96nESSPGyhy5L6YscXRp?=
 =?us-ascii?Q?yosTZgMFmTZBtssusvpKU7wuFx84q8hPDvezDHTZoBoLPFyHYJcYiTcFDCmQ?=
 =?us-ascii?Q?HTBu7VhhR1tFafWpLxnO6I/l4ZzXShvF874WKOSWS/7kOfl3EmGA7hoXbVzA?=
 =?us-ascii?Q?XF4srop4c9X+K9SEmDznoL07bxrBLeYEzNWWOAa17z1rw8xd9deqasKXHO3u?=
 =?us-ascii?Q?6ZrwkM197D48vQ+JMy0n7B0zVE/vbBy1nxygqmnYgklkgVLxoMC43ndoVL+x?=
 =?us-ascii?Q?cEnTNc0o4NRLCMoehlU3H2w2gK7cr2tSvQDfpcCWt8VySEBRykDPkiHm8c8V?=
 =?us-ascii?Q?6HzT1AO/YMKxqCEPX9eiUG5hWrT6ymV3P3SvXgRjKz7LltefU/nWTja60rph?=
 =?us-ascii?Q?HTG+CncQi3XiYJOzJW3KtRUnlXL4rAu9zqGpVvR/axSHguNZ0EY8pQSmewPY?=
 =?us-ascii?Q?MeWdUbmcSuRv12wMhxisdDlI7s8x5N17Xgp+/2+mbhHmPqjwxF059vHXS+01?=
 =?us-ascii?Q?rlTLAgZuMmPPH/D6D4+tiZxnoVQOyBATOGDY63k2DHSZKBlZTMnj4sTTp5mN?=
 =?us-ascii?Q?gLMGKJBrmzPEd1RocDIIEjY9a1LXsOLqYt2WMaXjPYzihWIVHpviiJO89M4Z?=
 =?us-ascii?Q?vm32IHmlgbRvd9UbLrxJPPBVCwgPAh9RFmfuToplh7rJoxJN15B4HCAiss3E?=
 =?us-ascii?Q?E1+Mv9t/C+IkZEpLUhh+oTdAPb2c84tEiYKGCxj/yJPF1tbrhhqnLjxAJ/Yw?=
 =?us-ascii?Q?vH4/tNpN3G/GuznA3jIEU2Dn1uCMUktyvZLE9FJq8t2DcIlzFeAwGNq71e/Z?=
 =?us-ascii?Q?cw=3D=3D?=
Content-ID: <C56E5EA46820804BB2AC0DDD5578D18B@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VWiN+miz10BEJyXW2IKMLE3hA+Ql26u9z0FM/wAIcJkI5Fpj0jWZv4mkmF4No3nIDn6FXQnUMBWzSaszTNotgo/BYRd7Zp0KouvaeyAajbN5K7Hi4qCUZKP/i8gLNflMypBwWUphKZZC/d0jHImkrvd1LaGQCXFmaRu/jeIivDxVZHGCJC39VXDIj4NkEXmaHh7fyMKpuXkiZOmNRCGrBnM+1sl3LZoNZPNVtvG98o1zq21HBrvhGWejdpXZvDlQnNvQCoQSQ0UMbbrmcLDVywEYkZhm8A3l/Vd89Bvgg4CCDA/6Vfs9ElKHa2IGxd+vARBuaHcIocwpa6kN4MJ9i8X54rYq94di3p2eKXvUAowPcQvWjYfAEbW6l2oTO/mxZgHPw7pX2MIBeo88Qosk1GbAQhCY41cYIG5q7VF9251/am+aSMm+6z+1McevOueM9eznxv63djt588CbF6+CSL+1XaraaPvHGhQOzOYSc2JEjgp8I+cJLv4KrwOlRyvNHgI84iWESSvfRLbxEJfAIVEskkXHkgjiYskjRbtQKd+xixP5B+sDmxw1HV3hvckJDO/b084HWzBqxB40sDkvP3KkOfQlaf8+bq+PrT6clrHooGYk9tRdqDolgwoaxZpv
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b511419-03af-4ee3-10e1-08dcc9a8f3e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2024 10:37:46.3386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WiofMzt3TAtSYj7Rn5M0U26jS9Pitn4RHLM3AW5esae2Sntl0NS4HUhotoQ9a0J82zeqqsYE+RUZRAqbUU8MsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725101098; x=1756637098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=cRS8RCMglLANabnAzIbRqfimseG9lqZqOHQhLyVy5RQ=;
 b=FCMGx+9YBQSOs+Hnkyk0mQ+uOsdXmyn2Wk1MgPJUc67rKvbPDN5RwsfN
 RuZOhvBR3dSN9DN7hWWJd8WEhFye8aec6M490PIlBosXa5sqcGZLQ2YwX
 Gk06du1P+De7eMs5IHQ7HhY4AlR3vcFQG43Np2ntBfyarhZv5bgXXb6cZ
 teqHLCFNTe5ZZX8W4rb0W+/i5pg7NRTNkRCfZnTFemZ+OwYefMLttoAhp
 c5nwSPIyz/ubIAHW+BHOoV7rkR5AZ6ICifUU3BOQyx6JYEXVnRYpqRJpf
 /iqRSelDtkHytFMYpT1+C9f46DaTZFP1vYTBo/bFzVCU3IdVRMViSh16q
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+x/oq2smCQ5mg6uvd9uHSuu9geEvozEztXcS4Q7RWE=;
 b=TgJ/APJhtcSbQLvwuYTlWDlkOVtAO2PYwgCbSZHCDi0PQGAPa3UNHoV9jl/xEOQT93oODY71MnXuFf6trbpr+ywFD4AAEK6HwtTz4Tx7O+TXUQEIhzbyiLh6fhzPJZj/m+NPz6ragAzYAnjS4lhgslh/F/uuE34rfupbXSiNPLE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=FCMGx+9Y; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=TgJ/APJh
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
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
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Fri, Aug 30, 2024 at 06:56:13PM +0200, Thomas Petazzoni wrote:
> On Fri, 30 Aug 2024 12:13:24 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
> > index a1a531f038..8759d7491c 100644
> > --- a/board/radxa/rock5b/extlinux.conf
> > +++ b/board/radxa/rock5b/extlinux.conf
> > @@ -1,4 +1,4 @@
> >  label Radxa Rock 5b Linux
> >    kernel /boot/Image
> >    devicetree /boot/rk3588-rock-5b.dtb
> > -  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
> > +  append root=PARTLABEL=rootfs rw rootfstype=ext4 earlycon rootwait
> 
> I'm wondering how this can work. Indeed the genimage.cfg file for this
> board creates a MBR partition table, which doesn't have any
> concept/space to store partition labels (unlike GPT partition tables).
> And my understanding is that PARTLABEL is based on GPT partition
> labels. So how can this work?

Because the genimage partition-table-type is set to 'hybrid', not 'mbr':
$ git grep partition-table-type board/radxa/rock5b/genimage.cfg
board/radxa/rock5b/genimage.cfg:                partition-table-type = "hybrid"


From:
https://github.com/pengutronix/genimage

"hybrid: A hybrid MBR/GPT partition table.
Partitions with an explicit partition-type will be placed in in the MBR table.
At most 3 such partitions are allowed. This limit does not effect the maximum
number of GPT partition entries in the same image."

The prints from genimage at build time:
INFO: hdimage(sdcard.img): adding primary partition 'uboot' from 'u-boot-rockchip.bin' ...
INFO: hdimage(sdcard.img): adding primary partition 'rootfs' (in MBR) from 'rootfs.ext2' ...
INFO: hdimage(sdcard.img): adding primary partition '[MBR]' ...
INFO: hdimage(sdcard.img): adding primary partition '[GPT header]' ...
INFO: hdimage(sdcard.img): adding primary partition '[GPT array]' ...
INFO: hdimage(sdcard.img): adding primary partition '[GPT backup]' ...
INFO: hdimage(sdcard.img): writing GPT
INFO: hdimage(sdcard.img): writing hybrid MBR


Doing a:
$ echo print | parted output/images/sdcard.img
Model:  (file)
Disk /home/nks/src/buildroot-rock5b/output/images/sdcard.img: 272MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start   End    Size   File system  Name    Flags
 1      9633kB  272MB  262MB  ext4         rootfs


Shows a gpt partition with label 'rootfs'.


During boot:
[    3.134613] Waiting for root device PARTLABEL=rootfs...
[    3.422771] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 247
[    3.423813] mmc1: new ultra high speed SDR104 SDXC card at address aaaa
[    3.424819] mmcblk1: mmc1:aaaa SH64G 59.5 GiB
[    3.429940]  mmcblk1: p1
[    3.461922] EXT4-fs (mmcblk1p1): orphan cleanup on readonly fs
[    3.462582] EXT4-fs (mmcblk1p1): mounted filesystem 5d48042f-ad69-4b24-ad35-61abae2598b2 ro with ordered data mode. Quota mode: none.
[    3.463676] VFS: Mounted root (ext4 filesystem) readonly on device 179:1.
[    3.464599] devtmpfs: mounted
[    3.466399] Freeing unused kernel memory: 10304K
[    3.466843] Run /sbin/init as init process
[    3.554357] EXT4-fs (mmcblk1p1): re-mounted 5d48042f-ad69-4b24-ad35-61abae2598b2 r/w. Quota mode: none.


> 
> From the Linux kernel code:
> 
>  *      9) PARTLABEL=<name> with name being the GPT partition label.
>  *         MSDOS partitions do not support labels!
> 
> Note that I would be fine with switching to a GPT partition table to
> make this work.

That is not strictly necessary, since hybrid means:
GPT (all partitions) + MBR (includes only partitions with a partition-type set)


However, looking at the buildroot tree:
$ git grep partition-table-type | grep gpt | wc -l
29
$ git grep partition-table-type | grep hybrid | wc -l
2
$ git grep partition-table-type | grep mbr | wc -l
0

It seems that only two boards using hybrid are:
board/avnet/rzboard_v2l/genimage.cfg:           partition-table-type = "hybrid"
board/radxa/rock5b/genimage.cfg:                partition-table-type = "hybrid"

I don't know of any reason to keep the mbr for rock5b, so I'm quite sure that
we could change rock5b from hybrid to gpt.

I'm not familiar with rzboard_v2l. Most likely there also isn't any good reason
to keep the mbr. I don't have that board, so I wouldn't be able to test.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
