Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0406DCF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D0C40338;
	Thu,  3 Oct 2024 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23NFgrS1e8lT; Thu,  3 Oct 2024 21:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CC540592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35CC540592;
	Thu,  3 Oct 2024 21:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BBD91BF34E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A88580BDA
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXw-Lqjo2_vb for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 21:16:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FA3B80A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA3B80A8F
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA3B80A8F
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 21:16:53 +0000 (UTC)
X-CSE-ConnectionGUID: U+pfiq3bRWuPI7ZFguWSsg==
X-CSE-MsgGUID: /hzBBmLPTBe8uCIt6uP8DA==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="28611737"
Received: from mail-centralusazlp17010003.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.3])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 05:16:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuxTCU7qAP0k5paYgVVbBU9Ib8ljPROPXvm4HrUTj8a1kSYs3CizIh6aqWtFzqKmXtio80QjaCrhOANeSdKL5X02ehKhs1rOmgJjiiXQTZLRWqf7NbzHCypQYYS/7vmba2PSV2OoC0/0p53OvHoMrxoLStZFUZmCUAcyNNlKbM1WwfBbOZQV/m9nZV+IcUDoP5nZn5MUL7t8rSCFLulO6wKrJMHSxHbQBl5VAENyJb8cUXcIR2Z3icioYpeCW8v/82S41DBpHYshdrZ8RnK61ykU2t+Ue/QdiXkZc+78vAPoU3d1ROsbCZVkDsGrxasbVpp27jCF+x1DVcMUMbvrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxqsjDCx4nkOMIbLZ2SbE3TZDzMjQKlovUfWArcDndU=;
 b=ZynzvtrivQfB0HoqxuFRP69xmdlD1PvAh9i5ROIvno7QPdIFlX/OFOadBDTROYeVssicjufYu10r7GyjotWQ1MkroF766xPvnJfINt3nkYTPWx5t7RZsNsF7ee+pfGZDVWQo2/nUJGU8Gzf7QFVAFgEsxhNv4RGEwargaPeOUT+WpZcDWWVhVv8oHIAxKtwCsRlg2whgw7DrsZIvJZ1zyfpCW5lWUCDtbVGVImPmJRpWsjitLT6AE3Uw5pLyOxi5kIWlPNwkFRHcevSj5u4pQatqpv6pA7osO21FgxZQDthIIRhJ1vsw6pcEEF/z3mfFy1QeYTn98bZc6I5IdlFLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6657.namprd04.prod.outlook.com (2603:10b6:a03:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 21:16:50 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 21:16:50 +0000
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v2 2/4] configs/rock5b: update to uboot
 2024.07
Thread-Index: AQHbFdVBjvXdKzy5YUisMUJKgpsRbLJ1hEAAgAADMgA=
Date: Thu, 3 Oct 2024 21:16:50 +0000
Message-ID: <Zv8JwGcZCT8ghE-p@ryzen.lan>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-3-niklas.cassel@wdc.com>
 <b6f8a2cd-b2e6-4075-9e41-ef4344a40681@mail.de>
In-Reply-To: <b6f8a2cd-b2e6-4075-9e41-ef4344a40681@mail.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6657:EE_
x-ms-office365-filtering-correlation-id: 01d40430-ce27-488e-56a4-08dce3f0b23e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xi34oiCAojVaQEDIoT2N7+ysLSRwCMRrzmY4FOY410gO1Itff5VY56VFqXkn?=
 =?us-ascii?Q?mNMfolqs+ZYEanWjZ8zuiiXKHKZ7k1fG7e2Np7+cGHtvCzjJNXUHj+0/mr5f?=
 =?us-ascii?Q?Pfzu++Pm6xCOHhcYuuARnKEiOgd1gJ83ZvvVBMCOF6qpNT1YO19jb1iZ3xXz?=
 =?us-ascii?Q?1ZUEdtJm0oHKfNODwB6NBuU7X5eZsiLhKpQXGOUyQxJMUTmyP2D2jWHIhKH2?=
 =?us-ascii?Q?dk1p2u1qUbjb/eDvi4sVWBK/eQdYOnN28vTDb+pW2DJbQWh0hW+iYgH19qdA?=
 =?us-ascii?Q?kqIVt5lODu6NCmezJu7N2SxPNUcORbc9EEm2H/gWJsPHC1r4zOR2oHH1Icx8?=
 =?us-ascii?Q?SZ0pejcrCyALOoWiXEz5OClAC7o/Di1M4moomMQtTR/z82Zi+LBpdFsJk7wD?=
 =?us-ascii?Q?ka1e/W33h8StitebqrdH7OouaDy9DEdCX6if89b40mdqXrJgRwQHWtbnqBI1?=
 =?us-ascii?Q?EX4CZAYHy2+Agmqfwahiid6pLq//3Yfway8HcCjP8J9ounuPJrrc5+jsattR?=
 =?us-ascii?Q?UQFhqD4loOKQ/gPpGoPLcdDEKPxpTBUqFdwoyh2pL7EMQW4Y6TLX+t/vNVWj?=
 =?us-ascii?Q?Jfsr6F2yzQUl8i0iM9ZMSPYHV//sEX5yLjZET7Q58vgwRfhWyznbRX806Zje?=
 =?us-ascii?Q?fZ9zhPqtOqME3mr9GWDAAaOS8JbEYVYZrCbF/sdn5w+uGXLgDTF43/vTygW7?=
 =?us-ascii?Q?AOFis5wmafRa9RQA4rvAc4k8HEbrIfTndWmmI/U1k6H80Ym+RLoT+98xmUNu?=
 =?us-ascii?Q?oraAi8Z5JposSbYmuuFk4BGk7prOAlMJMTIZ4ZQZje4dOwsUY7qi9ZRVLE+e?=
 =?us-ascii?Q?I3FioraDusPPIRrWFxa6I+xupWCEd/0pnsWpRfFuezWcRtqNS9jTNWSTp90Q?=
 =?us-ascii?Q?6SV2r/qibtjXXZZ/OjamMPfn8fFqbD9/bJEWt0/XGOpAnUGlNGfY0EzWZrYm?=
 =?us-ascii?Q?mv7jw3BFvKcXsIcrLYsDdmZzGLKV0CA1JguUPdUb+IP1dKgh9MlolTHBc7aw?=
 =?us-ascii?Q?dpSi4YEvAwNJNVr+RHPR13dzJ7nhZI8qhjaxae40cLNYQY+0V/HDzJjFWcAR?=
 =?us-ascii?Q?jdDjpq/ZEYOlTIljwDBQqE8HVBiu0Vm62Y2bTNr4QZMSQ3BvwQMvA1H68AiQ?=
 =?us-ascii?Q?kPalsk6aVHDZy9cdRKgPB4yboquNSgBGXmQ8XlV2A27vUDqQC3ts/7HuFxVB?=
 =?us-ascii?Q?UHNSURZgkphPWnuSMmkuMjt3y/JXN7ZyZ6brbJVJ3002DeP0DQ3bGkQtUHaL?=
 =?us-ascii?Q?j3hFgZCj2353O+egyHKXoEk1je4J6aDKjMc4HL+puOlPCMU9Iz0XcPnexzLp?=
 =?us-ascii?Q?W00=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G7EDR0LaUGfIWHkOwPxbwNiVUIE7UNnoBntY+XB0/tWTq8fsqXcXzlMLyE5u?=
 =?us-ascii?Q?DVM6klBZhTrLAmnFyesLkOKChk1orkg7/LCCjn5ulEohezbSbt67nKfqmXm8?=
 =?us-ascii?Q?bjWOUTsnrXuhGH63ALTFJxJe2tCxE6NrCEaHIK0wyGCfhlMXLvJhuAb/0bo1?=
 =?us-ascii?Q?nBgTgQKJF1myKwnWktgxw+Rjj/ao3acvITXeGBBc9zQV4ufGPvap7Cgpejdm?=
 =?us-ascii?Q?Ca7HJkXSEU6Zs7MAkEX5Uou/lQ7gQdL5v4qRgkpBh8HR+g2aFS5HlgZx3iNP?=
 =?us-ascii?Q?gcqRLV629xmzRADrNqi8ohqWeaul7OShVXjUM+YccXjsiMsCmueqmKJSW0Kn?=
 =?us-ascii?Q?OddcPRlrp8OuBX59LwFhp7lsGbcKfaxk24Q5qc+uJfbc43EU4VPnxGRVEiBW?=
 =?us-ascii?Q?WgIa5cpDhjLNdO9XohIJ+CGEpZlqhuo5SGPipJI1qsZX8g10ymvR9LABK3g6?=
 =?us-ascii?Q?a8j99P644+9okIhtSfz8dDp893SoSxMRcGDGzHxHqodX6QezJnC/q7vlwXUQ?=
 =?us-ascii?Q?QhLfQgS2Qtb3YbzV5O2DaoE+5ezdeQR9/znoHEujvZcr/tSQ76dc0DhbBSH4?=
 =?us-ascii?Q?hdV7oI9TRrLvUjn4LCI0BSJaymjfsgAWqgGrYEmPeDP2yN9wcFJvUlb8pSiM?=
 =?us-ascii?Q?Q2wvGLKK001HJDP1knHE1t+dfXLDLKsWGOGqqLcfJLWIwpXY5kO27dQ3cTHR?=
 =?us-ascii?Q?4P1EHNGPWQq/QmMmuHY3+4fhECQl+0HiNkNRxodsnBXfjNSAt37VRkgONDsX?=
 =?us-ascii?Q?94NKRqRbZ3s3Q7BpLwxdHMtFZ+/N2cPyh6lkwWNEgtBlPImebqpFgXfUyAh0?=
 =?us-ascii?Q?0lYekV1eFK8kuYefZF85zh/UrCxZRC7wY1azln4aBDv+/kRoOkDKrt2xfV0J?=
 =?us-ascii?Q?FLAwf15ajgUCIWws6yEzAdHlm18jKAd8P3j+wI72uYtESakLtAtqdhQFHyk5?=
 =?us-ascii?Q?Ak090Rlhi8w4L407x9IwYcG0ifcdT8sXzgOW6zGRLMXr1fYSo0s4U+BhX5aU?=
 =?us-ascii?Q?I2/ghHiHi2lvPxSCBzSw0LRU8L45vwQbvegcJvBaodSNBGc2QnyZbZbLwQ07?=
 =?us-ascii?Q?6QLhwFVLnsquXRvWUFIbq3B4ls2awDhLdnOWFl5FNCE9dm9w+LWo7Snws+2+?=
 =?us-ascii?Q?osWJfulKQNy/cCfmkk5PsB2dAiHpMxqNYQwY7/Jdbc8KkKkE8KrzdAWNi3tq?=
 =?us-ascii?Q?1uckNH2yQGEF3ACLzQBJD7Jx7CVWjzmhPBCSZYMCkNbK1KZpmYF4lbgKWRSN?=
 =?us-ascii?Q?jLjBW43foN1FZfDDNjgqsf2HZKbIeS5ZNTgO93qLePAowdreS9hTDvsGoyki?=
 =?us-ascii?Q?jkGKFcW3dezhoL1WFMD+Xa5bpjK4N8q6gZO4D4qKnBSDn6UaUuqmKDoYR2hq?=
 =?us-ascii?Q?Gg4W9ZlRIUAWi9D1spW+qBhjUKMdwVUwZWjMwdmY/6mz3HpWgRN0pDwjeA/f?=
 =?us-ascii?Q?71HAyLEYrw2LgmXuQMhS7bj4u/mrTDe3G/4T8fc3Seif7BFFK7QFQ7SVPV3M?=
 =?us-ascii?Q?Y6K0Ja4s+If9Kmx1+96xZfz/Xy/qZdrM3Br+OZ3rO4a6aJbdbl5NJJI9I+5T?=
 =?us-ascii?Q?WDlG7HmeXNDwu71QXxJBt/kLyN1nJ/mhdDhsaJhT8x3aWXcVPR/Rdbujpdf2?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-ID: <99E95ABDDC132C4BB624C8A9B1835444@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UIefIAzWLY28cUZr7uvI1Irn4RmTuBzjUhgLc0xvqA8PXFbQvxHuiOI+b87iPL8W/FIuBvSvyzN72msfTIs/giMIO8j3sgAy6R9Srew4brHgACIX7yMiOzg5r9rm/2sCCBfY24Mxx3czZAoH8vtYqC345RIHJYPapwjgj7d0og2kwAx+1CenFQN5EO1SDX1Q8MCgGmDOK+0DALe1JEGK24cq+t/wl2MPkfSgaaBRNsbDHYND2ImUwtHMJMP35JTNf8dlvDV5sJXo1obmUi5r4bkrTlB86fQm3ebjtDz15P7WUwsQok1ej2ZuFWfDifwdYHldk1qmFuxN8b6+ZJCC5QugAoLUk8FGe7HpJut9ML0kFso/nsjJCcCOqCnCGxoqD6jtPQkFdGBzr/aR7RBEDeRiPsL5A2cJgdoqPgq6HfUe9PODRPOPF2qnLrmo7yjJzWRWK0mBYE/+Xonq5PQlvLePLgKFv642R+WGhzdx7FOPwuVaOET3HKWzVmD2n/7kkFSnGSSFovYLefZ933nOXP7oqINGlOyKhARCenjQBLvYtWjGObGsQmvuPUQBCA5vWAmhH5eyocpPZv2M7VroXImjT3iNGEYX4iHYm9SjtuJSPcQZ7Tw2EzOYlgMpYG8Z
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d40430-ce27-488e-56a4-08dce3f0b23e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 21:16:50.1507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GmOCTNCdmZQx4qwz3kVIWQW2HgeHCbQSnyCkh2N9pY1nZ+B8XYwH1ENltruDNXNBzHrWz+utW3Rles07UHsIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727990214; x=1759526214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=RaMwXMOXH1XWsKASD0hA6Sj8A0m3AON/EesGryktBkU=;
 b=JothSMXRwt8Kv4koXDwIGpof3qUuZdnoptCDMfcyOhRTcA5o86fGemiV
 /OfHY49/pE8KguFiVdBfulQF+mndqox0Yk7HD/TzIbI7oxY4rC/EugFq0
 j+ssFntLjjbNWPZBvqbLiyX8zrRrmtpSEiY+purMEaHp9jleYF5PBHElI
 ouYPlIAlPEsGg2yvpfOMQnNDyvW4J0kAodBe1KRiafEf+Td6K9MWsEj7l
 1KfVs82NOtw7j57iKoHAVIppHKAKL1TK85NCPORZ6KvknuYXicFaK3Cq+
 /bvBWWMWdGk+bB1XFQ5Xbspey4lyWNxP2+6Js5dtI9QqcRepICFm/YWFb
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxqsjDCx4nkOMIbLZ2SbE3TZDzMjQKlovUfWArcDndU=;
 b=xf11aYV5Z1v4vUKJVqgPuVgv5zHjy8qOcVXlq1yti77E+qZKMM1XAZwRYdG6WKPckIdUI/pjGA3bJdU/azPZTop5XB3ouTfnI3nOn3QlBuTUHWWOHwnRLiI293cippXc8L3aWnFc87hFqnyueODE+TP99PH4zkp18RCGeCUzUNo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=JothSMXR; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=xf11aYV5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 2/4] configs/rock5b: update to uboot
 2024.07
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 03, 2024 at 11:05:22PM +0200, Kilian Zinnecker wrote:
> Hello Niklas,
> 
> thanks for your patch!
> 
> On 10/3/24 22:45, Niklas Cassel via buildroot wrote:
> > From: Niklas Cassel <cassel@kernel.org>
> > 
> > Newer uboot versions contain commit ebb0ad4eef0a ("arch: arm:
> > mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588"),
> > which enables BOOTSTD_FULL for RK3588, making it easier to figure
> > out issues with the bootflow, if any.
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> >   board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
> >   configs/rock5b_defconfig                    | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
> > index bc999536af..fe9b4f53dc 100644
> > --- a/board/radxa/rock5b/patches/uboot/uboot.hash
> > +++ b/board/radxa/rock5b/patches/uboot/uboot.hash
> > @@ -1,2 +1,2 @@
> >   # Locally calculated
> > -sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
> > +sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> > diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> > index c0c6877d81..bdf3c5a27f 100644
> > --- a/configs/rock5b_defconfig
> > +++ b/configs/rock5b_defconfig
> > @@ -30,7 +30,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
> >   BR2_TARGET_UBOOT=y
> >   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> >   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
> >   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> >   BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> 
> I also successfully used uboot 2024.07 on the board to boot the mainline ATF
> (which now also features the RK3588) instead of the rockchip-rkbin binary
> blob:
> 
> https://lists.buildroot.org/pipermail/buildroot/2024-September/764512.html

Yes, I saw that patch.

But it seemed that you both agreed to wait bumping ATF until there was a
new ATF release.

I think we should bump uboot now, as it provides some significant
improvements by having full bootflow support, and there was also
some MMC driver patches for rk3588 in this new uboot version.

I don't see any reason to wait with bumping uboot because of ATF.
ATF can be bumped independently once a new version has been released.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
