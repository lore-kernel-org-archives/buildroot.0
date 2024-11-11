Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6112D2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7792760667;
	Mon, 11 Nov 2024 13:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaqxHzkyPMU7; Mon, 11 Nov 2024 13:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CAC46067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAC46067A;
	Mon, 11 Nov 2024 13:34:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07850DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4E2440278
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgKjeq1TNS7z for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=03875af56=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 978EB400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 978EB400F8
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 978EB400F8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:34:15 +0000 (UTC)
X-CSE-ConnectionGUID: 9r/L0eb6RLqOYal5lKNweQ==
X-CSE-MsgGUID: nfLHsGVMT/aSlZgsCfposQ==
X-IronPort-AV: E=Sophos;i="6.12,145,1728921600"; d="scan'208";a="32172405"
Received: from mail-eastus2azlp17011026.outbound.protection.outlook.com (HELO
 BN8PR05CU002.outbound.protection.outlook.com) ([40.93.12.26])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2024 21:34:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1PJEBK2xeofTRu+ZmOIXJ0BOh7zfm5zIY55n+D2BZF8kPm8Z9ID3T7ZgIQFiaVxqIz+t4LfFwvtdz7j36mhQ1gJrDPTaGUWMSI+DT0RyBDIQkaY86ZF8ghceWJNvm0XZe4N2DOMRYV0drmGA5atKUpSQWrVTfwJENLLjEEZzDHx2b+PCCGsCszcAwfMgw2x5sffIHAIbgPB39IG4OEVZn3PDN4zR+B0SCdq3aPgYox6frGrYCnXcWp3ZcwlWXs0jpKNWFZlBNb6CCFlCiqxHo0bjvkYoW3RpTwtosk9IYBP8HSskK+jk4w/s4/gCt8d0wHz/VstXcbSmjBVo7FbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPg5Ihixf0V7bdEg1cYjP1zim9biMUXYigi411IopaM=;
 b=J35ivqEOF6PfYTTNQn6EWEVCvvLH83dK4ZZayHtM5MfpRgd1ddWPsovbAf2yQ1EcEcl787cEw9YD7k4LXQi+0Wq53vqmIqPLEzodWh3DEWfgmTGyXb6juQcUyRkNXiRIQj8xV4fUYmAlpRZhh9g78kcXV7QHOl5Ji+aOSZp9cFDpRPiNCKo15SvLJ3cYYAyuGh/nmBElltnT5zZdBYB+lrhtvNgBvTr1WrnZXvhmvf6XqG2NFevZsgV2mekowxPFAj+iHkiCJ++CUJuodDqL2odKUT1Hfl3bm4D27HKWKx6vKj7elca0bWhboZqRJd+y+BFCi39HzMl0BuOjYWZb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6831.namprd04.prod.outlook.com (2603:10b6:208:1f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 13:34:11 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:34:10 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
Thread-Index: AQHbMvULtZpM3bTcHUiB61tnvhC5KLKyFtuA
Date: Mon, 11 Nov 2024 13:34:10 +0000
Message-ID: <ZzIH0atHhpuyJ5U1@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6831:EE_
x-ms-office365-filtering-correlation-id: 55ce5716-6c2f-42f7-0f72-08dd02558614
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JiiltwmdfDyMjjIJs1JlfjR508JC+KCveEJ5571VAqfPJz7z1l0aTR+H8q7P?=
 =?us-ascii?Q?A39PMjRjn/G+zI+dIUKj2NwfVnYgHRJcaQ7Esi5EQmMyYfHeBSb0JajRLkwU?=
 =?us-ascii?Q?+7NF2P0A4aNPJMjLbxDlAIHyLx7WENWoTSWZu3UAFwPR4yRlVz5EuMC8gnr/?=
 =?us-ascii?Q?UfS9NOkohODoGpD1sq8rcxSixdYQIMZQhb9R0ldWRhyKdZzftQI5hwZnP9qX?=
 =?us-ascii?Q?J7bV6bE7Bc1uyEUFCcnQDoCBqXpNeTJO1o0LqHdw0QZDusuVSaBNreRWkpaT?=
 =?us-ascii?Q?VQuCjQDHWNPA6PhQvC0On2uRWO7wyh5AQHJgruc2eA+yfx80dVIDhdhG/CE2?=
 =?us-ascii?Q?k6B8JveNbthhD9buDj1xBEV4yhYqS8oZzk+/q1vF+ubfTdq0q2hg+MNs4kgP?=
 =?us-ascii?Q?qJ7PBOsKmftDM/jp58E3N2a7afM0FhrKqNGkP9mDcbFHuDHCVD5tyeuB6Hgl?=
 =?us-ascii?Q?AF768IXt8qAqxzD6rDbvBfUHDekIdku8E8r5Q+WoEmAv67OEhku5JeDOM0nj?=
 =?us-ascii?Q?k/aTfE5iTy4hWCJe4LVlgw7jxbkOUWpaoKXzKHuxVm4vKaZ8BPSH4J4ZUVmV?=
 =?us-ascii?Q?PHju7QI15jiV2nGDeGPbXuQbTYqXdDsyGG/Y4srPWumj/u7pGWjgzzYMPEhH?=
 =?us-ascii?Q?zHnAG984AOKM/xDXhARjAx6b+8o+zmOY35UykC+QfAv6AGpGLfB5P9K8rUOP?=
 =?us-ascii?Q?JDvvM+wbhQs8Bv7LZ0onK57rTCEuWH/iFvfvdEnaI/+bxEwJbUrWV0t7L8CK?=
 =?us-ascii?Q?1KHi3bTra9WtggY2ovdDa4AZvvmQi++Pi71p6xFFnzIAlpBcGpqDGWqKHN2F?=
 =?us-ascii?Q?8WLHEoEU6Vzwc7BhYppcB4kaPy5otFA0Sb6r3avX2oQ6wBoK39PHKOvR0xfT?=
 =?us-ascii?Q?RS0NQsi1fI1JvaIE2TtMa/YDdckF0qLXpgk6KLdq6t7BZVsmG4rSwrzh0VpF?=
 =?us-ascii?Q?Z1mE5zvpAwqgByf0wetOKCNkLKW8LJuxbz/rGwl5JMd5I+sv2tXBMRHLF4w3?=
 =?us-ascii?Q?SoZHYPeFFIHkI2iAs7DA0kwR/c4hOt+obKc3wtaWZHesZ5a/A2EMZXrWWj5c?=
 =?us-ascii?Q?J9j8oPrHvEAL6jn8RmnvRR5KlZ4V1yXqvlMHC8wIizr2iHzgX15oTEB7phNY?=
 =?us-ascii?Q?x/3bfYDjcthDzlmX8eSQIJog3xuxOuDZhfq+6hozE2Vb+660qtMnUogi5W58?=
 =?us-ascii?Q?bQitE75qwmMQI+bV0KQjzQcFeRI2QUODImsi+b2AmvsUkRi8uZCdmgQAB7c9?=
 =?us-ascii?Q?zcwaVsWlfq9DSiE7CMRX8FvL0dxopRI9ByJMliH0lXVTMWjr+ULKEgPKTe/g?=
 =?us-ascii?Q?biRA8W8iIGdfDHJMP4/Q7rVrrIAPSX3KoiXQ8v6dlOACqg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FBAunLDWINS6y4lwene5itgxkRLBB+qiqPHhBLTrKwrGDY4RukpXZ2b2dQRU?=
 =?us-ascii?Q?x8kfjV2YI4BzU/D7b8rBl82lI05oWxW3agw3RGxiHl3rLiE333/re0xP/uNl?=
 =?us-ascii?Q?nucOgoQogIT15uhHFj3mAYVertpJrCOBl/mf7MrQz5Jr4YpuIvoWTeMZXwUe?=
 =?us-ascii?Q?4PF7tSllAQBSzM7VLcUoDN6gR6vBV6z5h0Uz1yKj9BDePE4m+Tb6pcOaoq/m?=
 =?us-ascii?Q?jdWjYFupEWThnISqtJ5dyxSC5nFqVnade+1gA3gzk/NdPiAKz/W6uoZqZ5/d?=
 =?us-ascii?Q?0joCHKXnsbmh1HI9Gtid1TsWTXOPB8Bz74Q+7Oulfia8OzpcSjLViRAIuR8V?=
 =?us-ascii?Q?goVRStVsYLWy/8oFqmMLdjdssaa9MKoV/1sg5CXCxcLaLvOwh6YmanK/GpEY?=
 =?us-ascii?Q?Iy0g+7gI9fui81YPY3SghxJGYO+OjofzLTh9uFvYJTH6M/LhYq5kRsk89oln?=
 =?us-ascii?Q?ky2z/9Z9VWwfUSihCFvksGa+tgf77e6MuaQLWVE91boPA4TPiM3OGz8Thctj?=
 =?us-ascii?Q?Awsad3XrU6rjMgb8p2FtdhXZLjA5//TFJrEBRZ8SHMy1VtpMuDwoMQ4NrSlr?=
 =?us-ascii?Q?8Jet6u3DMPxJcjxY9JAg+HXpC/f+LHWcWoBW3dqKOBCzQUCfyV9kPeFp5f/j?=
 =?us-ascii?Q?WnbveQ2Mae182B6isuaBZ467jHurb8jcuSVgX51ecKLwc98J+qoYn1f4as6y?=
 =?us-ascii?Q?5g9CsVVAr4276VMtdamNrkXi/lMiPi7nwNR8YirXvarJej6Rup1S03xaFPjZ?=
 =?us-ascii?Q?fq7PYUlWcNAvkwb6X31vJBLF4lRyKCPO3gxIp40l6z3ZszIEl4o7fsg/KLQo?=
 =?us-ascii?Q?wObxarDJr+v3CkMetsPbOIvmrB359kxDYGcxb9QF7Jdlqg1HCVF0iuSj3wKx?=
 =?us-ascii?Q?Bl1vZue+Jb+DjCX19WqlD64wl8aTvNbD3Gx5kjjy+QZn8fo/mqCUjPkPCovb?=
 =?us-ascii?Q?vJ0ybBJgeuO+Zte1+hB7RHss3jV5tvS16wOnRd3TUBRqARw+dTbH01l54t1n?=
 =?us-ascii?Q?MStae7l8RrWwI/xP8QwXVZJsERtYxSdxUrhyR/tCJD1t4xni67pKHMlaByO2?=
 =?us-ascii?Q?wJwhusY5UD/HslWpnA/zB65A1W2NEh2I7ODCcbhda9Ed9gAYoil2bfJ9iOb4?=
 =?us-ascii?Q?WZroPULq1XOwsTHEBM+CyfZtjMExImhIUC7VdCi1utIZ1m4pBuflITt7shX5?=
 =?us-ascii?Q?448sND4Rgx+X9p1R2p4CA/nxCItDRfb5VzFT6pw6bVJVZetGAsE3btYPIeBL?=
 =?us-ascii?Q?tIjX6J36chGt2HeQxRBA+RoGZnX5HYwYAh/AmpByLhNbUDI1BxUNOmbhms5T?=
 =?us-ascii?Q?NgSnxepW+XfaT7mD1/xbylHu+hIMwUEMTkVk7CZAka5bF/r3deYJqi4vWah+?=
 =?us-ascii?Q?ipRtWxGmCIDId3lFrqqoBeSbLQ1ZVy5HvJL4kTZO7HwyWyECQiAaIak37MIx?=
 =?us-ascii?Q?piaahm88iDvg39RxQd1WkXMe8a3SylVo4b1R2PtHs+kbRZou5k/de7TxYyRr?=
 =?us-ascii?Q?86ugCD91MNf/ylqwqGr2aea5D6PDfjoL+EBIk9kskr18pkVuXpzlKFsVSWR0?=
 =?us-ascii?Q?b2WBG0rXVukMo3+uiung2fJGcdzspISzYe/R+Vr70qw6mBqaifsvke4yZ3Hb?=
 =?us-ascii?Q?eA=3D=3D?=
Content-ID: <B2FCF3E02A27CD4888F5A1E95E8B4C90@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2/iG7XemcR/J7KOAzAsyjnWndqJ0wmtGWg4G6Ze4ZNaZRFwPFv3FF7qTLvGRR57qUHiy+J+aVyGFh0yCiv6AMWeVaUnhcguF1JJZLu5gBrj8uSisV2m7dO/PpsfSTcF/GPcAJlekOIaLjLEWEsZl6ZzS0rcSVKi+f5woZs1u+2FsFX08AdPg0ojOVJf7sPhQ8T5fin5ww3axD6CCyFqRSmaN51HxLwdfl6ypsSqbcE85tq6KZtDg2Dr0ktHVRuNv25tJ/iYrbSLvjWWehxk1xZPxWDBmWBw712+eTzXkB/ASyNdPUTZ599I570ZFbFhR/BTqzZvWpCROFoIrwbbI858zKkrpCi7kf4WdbPS57jZML8g/9N1SFYPiaxbLWDpCjj/OiOykrYzwA2Tb9f+QD9TJkKxN4UDUBjAuBG3MGxQyUx0NU3orRh4GNIwIxeZzL7R+FDcNH9VhD05rK1uy05sHa8BGp/fsEBYC3zmI3CkghfoZtXzDgB4DmFQE12HjB29DWouMLc6wJ5ij1tW0rUpT2drWt3N6NvH7CSO7/AEQi51onauT4YLl616dXiZv8k/DZ7g46H8Kz1DfQvgvwYUuYDqXRlZdlrOrQa9RiMrv0mcVDDGX0D+QEfs8twWz
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ce5716-6c2f-42f7-0f72-08dd02558614
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 13:34:10.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1eb6zFLe/BfPc/UqU/8InmcQW/KXafxNwmt2e/rAqlabEpPWZ0zXWq+4WmXSzrGUaeMEjNl1yuqstZmcafPoEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731332055; x=1762868055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=kPg5Ihixf0V7bdEg1cYjP1zim9biMUXYigi411IopaM=;
 b=qFDfj5WHJoQoaBi8LsW6k8YAUHMvFqq7WjKaVn1lBYJvkNeDqGv66Zm3
 G3aydDlJUD4u8vjd4JqMoIe6dC2kQsuxIvWBDEyATdsfHAGXTOA2/TAhn
 4A/iguamrL/T/dFyVUQ4Wf3dt6J8EeKgiWRlAGf8TJJDK0mrkdr5ZJWYj
 uyP6XrRzEgul/1aB8+llwFVITJFPD+ts6d6FDkkYoTD7YszM7oXntttcT
 olYWH1U57Rdlegw8nvORs2OCEPGMWAMzt14rTu74FTX/ny+0afSENv0LL
 DkQC847mY8ZqaX6Cqb8BZGTuYLccSryrbTyvK5230RE9g0gi3CCyuWl9v
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPg5Ihixf0V7bdEg1cYjP1zim9biMUXYigi411IopaM=;
 b=Pvv2mxVmxnQPK7M/3G7ArGm6MH+shRXSZflwCVkIdVAR9N/mQIlo+4USNgaZ7eiZ0L4pJ3tM7vdLlYnXxBfNJrdkgC92PGCFWiCx0ecq6MntL8NtvYrNFZQKO5xEPsBMRbLvtWUeP2L+HVOKV4aUQee2DJkTsI9i0fbWdiXPXnI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=qFDfj5WH; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=Pvv2mxVm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
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

On Sat, Nov 09, 2024 at 04:16:14PM -0600, Brandon Maier wrote:
> Buildroot boards using genimage's "partition-type-uuid" can use either a
> full GUID or one of the shortcuts defined in genimage[1]. The Buildroot
> manual recommends using the "L", "U", or "F" shortcuts over a full GUID;
> but does not specify how any other GUID should be defined.
> 
> This series tries to bring consistency to partition-type-uuid by making
> shortcuts the preferred method. First we update the Buildroot manual to
> say shortcuts should be preferred when available. Then we update all
> boards to use shortcuts.
> 
> This series is partially implementing Thomas suggestion to have
> consistency when using "L" vs "root-${ARCH}" vs full GUIDs[2].
> 
> [1] https://github.com/pengutronix/genimage/blob/master/image-hd.c#L264
> [2] https://lore.kernel.org/buildroot/20241022224945.4dc67b89@windsurf/

Other than some minor comments, the series looks good to me.
Good job!


You seem to have missed one conversion though:
board/radxa/rock5b/genimage.cfg:

partition-type-uuid = 3de21764-95bd-54bd-a5c3-4abe786f38a8

can use shortcut:
partition-type-uuid = u-boot-env


But now when I look at it, it was you who added this to genimage just a
week ago:
https://github.com/pengutronix/genimage/commit/3e0a2aea8d10431f8c8f652129f73544cfa16af2

So we might need to bump genimage in buildroot before we can make use of
that shortcut. (And for that we probably want to wait for a new tagged
release of genimage.)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
