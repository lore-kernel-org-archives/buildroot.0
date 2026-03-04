Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C73EF8FF4
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE21B81202;
	Wed,  4 Mar 2026 15:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zGqYUoIl69u; Wed,  4 Mar 2026 15:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B68581204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772637591;
	bh=9csuQ1M0q3NfCfEL/AtGmowxouBlDJxshhQyrBsi4sQ=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FsX4SUza1+LFS8ERtlInm0ANUwpJrO4iBB0Xdfp103LMbnwo55AA2vqWu8aaRUXb1
	 cUui4ZbJ5vbBHIA8LoZj2PotJjSIB9T2rI3qDjfifCfORnlznOA/gdwAr8plozeUVE
	 MWEVHgU01k4iEahPfFX2u5vILR1NSHqbLp51CboHsB/MGsF498F8iMYPqwTUHzS+mT
	 gXgN2cwojYiYCxKY3LE87qVL8cdxQufJmRfXUO+HNQVPfp74jvtFhNmFotFMrD3zkX
	 kMubAMzmE5ofC0pFA5p5hr58CFx3b8psmlMal43bzugm3Tj4qNONttoT7CTYgM/4yh
	 0jPHxKDST+LNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B68581204;
	Wed,  4 Mar 2026 15:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAACF1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A08B9407FF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd7N4N-Qgoqq for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c005::5;
 helo=co1pr03cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6882F407FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6882F407FE
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6882F407FE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPJCMwvmBAeqy+gc8Nq3NkloGhNyEvL3Q42xROl49NvBEOVF+iqpAFHycmnnFA392SY3P8bLGtJ5PKlaQfwORik2YuB8NTlKH7+WQbkNLypHj31su36/+p2wGb5o382bQ1yydOUCIR/HBWQsy3INxeNHAxQJyjtw/gLUkKRYT04pFtlqK4Zs6dAiyQAUkff6jLoiIWnHws642nsA5JmQuZbKsmhjVoeJDNOZMKFkLa4scsjb6zzb0KUo1wfxtFEJDJIemj7YxY+nR3w8GB5vOBvCoNsqTpjr1fVYao4RXM2+KfRD5tFYRVNJAJOP3nQnsyAvpmel8PEi1+t6P80HyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn0kL5rTJNvP74y4Oag66xXIMV9fd3JI8slJc7RE1ow=;
 b=DUUo9sy9NUxyaB0dbgLpngh42NBgumSZEA1eIHGJ4eOKuan8g9DUFCSaP4cGCRUIZSh0f4GwOa+ApoCfvdP9GVBKrGx/zEoT+veZmClVJtqQ8E0pcYjlbFHb1nE7h7nucm6ttj9szzyVAnTCLq/MfhKUg8bnzXMnj+HueXJ6wmowJQasIwZsV8J+RujlGeyzgAhD8SHMOqLcWC1RxzvaLeTT/qhVWGZwfGNO3UrLanIdu5P3Ps9Wauem5W8cfhxXFffXwAhNx+dUP4qR9UOK6Oyq5i/qMqu4CJapiassJ/soSc6OYxiYEoK4sJVERySqj+/BXuiSira6wW9s9eB1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:19:44 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 15:19:44 +0000
To: Fiona Klute <fiona.klute@gmx.de>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
Thread-Index: AQHcq9uUfI7nXmsP/U600vD4Ue4egbWeZvsAgAAC+mCAAAoaAIAACEMA
Date: Wed, 4 Mar 2026 15:19:44 +0000
Message-ID: <BL1PR12MB5032D465352231089A7AAB95F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260304133241.3389941-1-neal.frager@amd.com>
 <20260304133241.3389941-2-neal.frager@amd.com>
 <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
 <BL1PR12MB5032A1CD6A81B8C5CCBA2164F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
 <c4d66d10-019a-4b37-86c6-390a4aa884c1@gmx.de>
In-Reply-To: <c4d66d10-019a-4b37-86c6-390a4aa884c1@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-04T15:17:30.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|PH7PR12MB7235:EE_
x-ms-office365-filtering-correlation-id: a150906c-9b44-496a-d523-08de7a017719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|41080700001; 
x-microsoft-antispam-message-info: tYS2P3IbHTpZ22mhSa625wm6VQ7VV+noJwyRz4f6+He6F2n4ZP4lO4F7ldD3+gj+c/abLxGVfsqJTJ6IxgJNWHw0rNG6oOnzeDnTkI5cR0SBTOSWxpHhwwHAKCybWoheZh+15Xw4UI/TwRCrHNPesyAp+FIelXeeeHOdfUy/vsTp6sIsTNMuvw+FOyiKOOkAJNN4ECmwdnehkDxUh/NwRMwf5ivl1p09qqIhcKBI0FyhAVVyFTQSuI7TuxDPgCCwOT2bHdFQ5VYRCIHTA/aas0erbLRLBBv3/1N2M03k73UYRoX/vnkF2lypvP+w/5Pk/bca4FBGjzvD6F0qvkPmYH+tIrBc3e9h54s1MplG9d2ldDKc8rodBYiqzP4ABK2/LUzHcWuVlr+tToQqGzJZDec5+WXdF7RxXuJHZI0aMAS7gCILqSSBHxoLe4h2XWS/VwndKCjmNchPo8VXVEuuzeKMlOrTb0Z9fPFS5nrVQ5jx9+8zBgpfVPkbmxxZULwZX3MrVA/19yoIYGlYl/tMnsYW0fesuEhC+3mdsDnB74bbPd8KLdk8C4nAnleOLKmlUjFOHaG/i2z7pM0DfEsBun5NAid8Kwi2Xh6Nv2Bpk/UdsqwiByqp+dLQHONVtQpMqSrKXJbhNxw33blmm1pNalBcSknSJ5/hm4LoDERInlqQcmHZVmoHaa6wp8bFtBtd7m2FNfdlr1pc6ztYBLPQ1JxFUMI+qPaQ1t0PE8rS6gxAh3q+7uZMkFGySLxPmQvjuhJ4se5LPk6j/t2/5NhtN7+xoQrOkmDybE7VgdOMyzxAWQGfHGLr/tDufmGdrwmoUKW48jnW/P9dk2HVEJOvHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFdka0pNSWhiSHhiNzFFTDBjVW4weGE4ZkdmMDFzbWxPM0J5ejJpOGlzcGxK?=
 =?utf-8?B?YzZGUkpEci9TNW0rNWRCa1B5MGFUTnFSQ3ZUYW9vdTVERVNYUlNvaEZWODJT?=
 =?utf-8?B?MXdUbzZ6WklxM0VjRGJzZTVnaWFvYUxPeGY0Yk5UdWMxVFUrNVp0M2xmVTIz?=
 =?utf-8?B?OGJZdmRMdFhuUlRBZThLQVhXNFBGZ2RiTWE0dDFhd1RHMUQzOGZXa3NvV0tC?=
 =?utf-8?B?KzRSeVhSbWVpKzB3R2UxNSt0b0duV2lKRnZTOUFHYmZ4Z2pLRzRMYVhjcEpE?=
 =?utf-8?B?VnRmdkx1Q1VrSG05aklBY1ZJQ3dRY2RuMHp4YVlVMk9zZnFzK29GYkVmemxn?=
 =?utf-8?B?b3c2NG0wN1Z3SENuU0UwZ09LcHp2Z0xSeXozZUlXR1BJRDUwOTV0TDR2MVV1?=
 =?utf-8?B?NGt1R1Q2cURwejVQOGdiMnR0ZkpWYURHVWtpTjAyOW95QUxuOG9iZWdaYy9h?=
 =?utf-8?B?UmdNTVNsdWR1bi8wVTg5V2VjdHVFeFpNWDN3S2t0ZTJrbFpWSkpJZFBBQStU?=
 =?utf-8?B?OHN6SHVYaEFpOWI1enpENTFRM3FpbVNTbVNLOG0rVjRXQVdYczk4WUY4cXZt?=
 =?utf-8?B?dDRUOFZyc0QwTGY1Q1RmYU1sdnY2R01YY2lFODBJOU9mdlV2ZWFVSkZiRm9q?=
 =?utf-8?B?blMrZmtYK2o0UURTMHEramJYZDZIdllUN25JamkyNTFNNUpuby9GWEVhSmFu?=
 =?utf-8?B?eUNMNnkzMm9aY3hnQXBaSjJpRnhSZlpvaEpWaTdxVGFWMWdMUmRpUXZCalMz?=
 =?utf-8?B?dVNQM3BRbHU5MzZmWmE5UlN2T1JUWmNYYTkxT2xULzdaYk1JK2loblVhT2x5?=
 =?utf-8?B?OGJNVGNUcGNucG43WUVJUHRsKzByc2RkMHZiU3NuT3FvUFlVeWIxajAvRUFl?=
 =?utf-8?B?NEUxQ04vUnJ5YjBnM1BrNkRmNlV6VGlabXUraStiVUxiMk8ydHVNZzBPNmhZ?=
 =?utf-8?B?OGxVb1F1UWlqTEgvYjg0WHVkcUJaalhKc3pZV3ZQek9Mcmdsc0Rrc0U2WmEw?=
 =?utf-8?B?TktYcStGdmtBSDJ3RUdBZVc0Q3ZIYVNEOGFrSVZsd05IckdLUklTeGJMSk9w?=
 =?utf-8?B?RDFSZjg4ZEVyaUtnRUVpaDcyK3ZHaTBpTE5qNjRGeStJSzdRMU9MMHpoRkRQ?=
 =?utf-8?B?Ympmd2J0OTA5UDlUUXhVTlo1V2tpN3RhTFhhZHl3VzEzcTVCWUJyUWxjOTNC?=
 =?utf-8?B?YVVMU1NCSk56bFdvMWtXbXc1YWJvYng2QVgvRjJhQ0d4d0ZTMEhHNUNLMXlY?=
 =?utf-8?B?N1lpbVZ4Yk5yZ1VLdXNiMFRMY2EzaEZwSzVQWmlNUkpRU3EydTVXVjFWVkND?=
 =?utf-8?B?OEpMeGozL1ZSNHdMWXpqQWhibUVobFA3VTltMW1NSG0xWFByTUdLazdyR2Fn?=
 =?utf-8?B?TUVlSFl6QTdkQVkrOWZ4U2MxWEhxakJaRkRqTWFQeWtoSjYvRExMRW1EV2Ur?=
 =?utf-8?B?UUpaeVBnNDJxMEhLMGszS08zNG5jSUFsZ3RCVW9iMGZPM0pXeElWbGMrbUpn?=
 =?utf-8?B?ZDUxelgyaXpnMU9CSHFseEkyc2kyejZnZ1RQRmhYVTg5cWVSazVxNElhcmVQ?=
 =?utf-8?B?UjVERUxkMzh5eXJOWXd1dDZFVENJY2Z5dHdpbEN4TEZ2WVUrMlNJV1EwdUpj?=
 =?utf-8?B?ZURINU50NnJZdzVpTkpiZzZ6R0dlN1F6NDNtSTNSR0NjUkx0VzFHdmlJczlQ?=
 =?utf-8?B?VlRlLy92ZVBFbDRRQkFSdS8reWZYelZqQzR0NFN5bXpYZGpOSGR6SlFNb3ZP?=
 =?utf-8?B?UHdUTlBWRWk0Y3BCU1ZmUElodEVBL2VXOHRhTjF6bjUya0hydUZGRitOVFFw?=
 =?utf-8?B?cmhIYmx5TXVodFM4Mk5MSDgwVDZiY3RRTURqNndmc01GdUxKZDRLTVpjTndS?=
 =?utf-8?B?UXU5bUk5LzJNSkVINlVZT3pNT1lObWQ3YTVTNkt6K3Y1ZkFUd01KMzVjN1BK?=
 =?utf-8?B?bk1YZXVrNXlyZ3drRC9SSExJZ01YR25iYmQwSTFjcTlwU1ZoS21JY3NkallH?=
 =?utf-8?B?Yk9SMm81emVyZElvbk5TLzZOTnZtdVNIb3dxVklTYkhCaVpGVkdpY2ZsVzl2?=
 =?utf-8?B?U1NjdjVtNjFNWHI0YW43d3hDZUYwWGwyWWRLOHJicDlqbWlmRXJ0NkNEU0w5?=
 =?utf-8?B?cEptdTE2cXhPQVNJa2xteTlLSE5SbWZTSFdoaTFOblRoYml5WW1nOHZzd3Jh?=
 =?utf-8?B?UFNyZllzWHZWV0tUOFVqSVBvdk5xdzVmNG9jWDRXNHlSN2hiWk1XSDZlck43?=
 =?utf-8?B?cUxhMk9ROXBkbnFnak1JallEUW1lY1EyMElVT3JCci9wS3Z3WWVKL1c3UWRD?=
 =?utf-8?Q?9+K9VQjBEKB4+/DdFm?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a150906c-9b44-496a-d523-08de7a017719
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 15:19:44.4850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pb4t/AZTDYBtc6Q55t+ERXVFV78YRYvWkYeVyNPFjQXpiVV0Bz7kkJ8ZbalgDlxF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn0kL5rTJNvP74y4Oag66xXIMV9fd3JI8slJc7RE1ow=;
 b=kzjTs1mVdwE4/v+k5uPO6/i7rN39r6eKMolDA1QTCYcPeSXeaXG31daNWYfT+jApHWjXsxMSJofqsAW69gq+qCFr0p1hQsM35fVE3vEVxqasA7XsmDpsNNCiBuxQ3c5+i5dUqZt86s0cBrjfuAlEZaLGdJ6cHkcHpBi8FXXtHqs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kzjTs1mV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Fiona,

>
> Hi Fiona,
>
>> By switching to the LINUX_DTBS variable, the post-image.sh script can now
>> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
>> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
>> the transition users will make when migrating from a zynqmp evaluation board
>> to a zynqmp custom platform.
>>
>> To keep the example post-image script as simple as possible, it assumes that
>> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
>> filename that u-boot will use for booting. Users are free to implement their
>> own post-image scripts for use cases with multiple DTBs.
>>
>> Signed-off-by: Neal Frager <neal.frager@amd.com>
>> ---
>> V1->V2:
>> - removed unnecessary $BINARIES_DIR from symlink source
>> ---
>>    board/zynqmp/post-image.sh | 9 ++-------
>>    1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
>> index f44b66342d..10a3c32b2c 100755
>> --- a/board/zynqmp/post-image.sh
>> +++ b/board/zynqmp/post-image.sh
>> @@ -2,13 +2,8 @@
>>
>>    # By default U-Boot loads DTB from a file named "system.dtb", so
>>    # let's use a symlink with that name that points to the *first*
>> -# devicetree listed in the config.
>> -
>> -FIRST_DT=$(sed -nr \
>> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
>> -               "${BR2_CONFIG}")
>> -
>> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
>> +# devicetree in the LINUX_DTBS list.
>> +ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
>
>> The comment and commit message talk about the "first DTB in the
>> LINUX_DTBS list", but this command will only work right if LINUX_DTBS
>> contains *exactly one* file. With two the second file is interpreted as
>> a possible suffix to remove (in practice, probably ignored), with >= 3
>> you'll get an error.
>
>> That may be fine for the defconfig (I haven't checked), but in that case
>> comment & commit message should be clarified.
>
>> Same in patch 3.
>
> Interesting.  I only tested with two DTBs in the list, and when it worked, I
> thought that basename was ignoring all the additional filenames in the list.
>
> Since users may very well have multiple DTBs, do you know of a better command
> that we can use that will strip out the first filename in the list?
>
> What I would prefer is to have a command that matches my commit message.
>
> Any ideas?
> In Bash I'd say "turn LINUX_DTBS into an array", in a POSIX shell script
> given that LINUX_DTBS is a space separated list the easiest solution is
> probably to use "${LINUX_DTBS%% *}" in the basename command to cut off
> everything after the first space. AFAIK there is no supported escape
> syntax for filenames with spaces, otherwise it'd get more complicated.

Great solution!  Thank you!

I am not sure we need to support filenames with spaces...

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
