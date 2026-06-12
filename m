Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542B8CD4F2C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 08:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08424410FD;
	Fri, 12 Jun 2026 08:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dvJ_ORH_C_Z; Fri, 12 Jun 2026 08:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4703410F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781251805;
	bh=qUohANQpnjXFzRz17/d83M3bfs6FyynJ6wV60uMPXME=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=caCVF0IRlrjcbDyelyFzdXMv8+0leFm4jdpJ02V1i4ga26UZoBvnAw3M4y0iCVn01
	 cfvOaLNEjwMGSAQiKMaCfhwcVYD8z9OzOUzfQqBImzS7Dci42hXyDK8wjcROepeRzz
	 rmAr8Nx1u0jlV8dUoy5EfsCwRWhkzrDCd+phiTjlg/0SVyaGuYbGP0jWX2E6Agj/DA
	 FK3vxhq0pevuCfbsdfDKXGciinZ65bvQKAoZbpQ58SSuiFF1vjtWI1XNs9F89mfmMQ
	 9BeZQp3DFQXu3+y33zxCBEt/komwKHZ7c7n1n1I9s4FK0xoRTNNo8T0oI4nhoGFQPA
	 5qKK7dxPXO/Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4703410F8;
	Fri, 12 Jun 2026 08:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF3212F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DB8D81566
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNpfpgboccow for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 08:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A4DA81585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4DA81585
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A4DA81585
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDeYpHIqwNVnxQ2Wj9c0Be+HH6ytQ1pDdYyQdBkvN13a4c4h0lgx6uTOtDRqF4uRjfFT9s9gyFr8uUnazu8ihnDPw1QprKZf97gePiA3X/T5HFn6++GUzZf8oGHghBO4pf4lv5k+/PzTFVyAA+HOI/pPmn+rDnmfkLRIXA7I8Gk5L9oNy4vKhuO9n3NROijY6gGsBw9dValXyXr5td18VAPClw7VCMZIPJH+BRvvF361NzvVPfKhHpkskT/aMMl9IIA40iaCJm+XuJf2y1yk921ZbJoF80RzJ3S9z7TwvFTgx6ndZU0ZWkfCD2jzBLzFpIoZ+8jUMG46QRmmEVUutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKCHAChBrNFVAyI+Q7t2QxSL/laL6d6AIyiSZdWm47E=;
 b=JNWDyg9GM/oozF3+A9HgxwmRTYYZfRf0gCSKd24R4fCQ3R5I7P2ss8dYXQEckhYVGUgqrLKEQrEbk/AELFQU4U5mZojS57LYB718dwCEVnf6sVilNy1x4K3b3zVfxP58nWzsgWl5AD1zkdp7uaX1+1zHxUqcsu4fJThoyQcaf09Bwq4+0vj2IXm7WMMCod21LxFxDaMtVFkljpPDD4mhkCC5hZjoMeJMePugglzV5Zqb0V21+bo3EXxgdMg2YLXGbPnzDEtWK0rAHESWgGQ9hTZgUfzb3r3pisCSBM60A/LRoiplTY3jbPTytol/ezPFPuB+/LnIMpSpejSN8h0Qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 08:09:56 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:09:55 +0000
To: John Ernberg <john.ernberg@actia.se>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Hildebrand, Stewart"
 <Stewart.Hildebrand@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball
 support
Thread-Index: AQHc+YuZ1h5yPH4+RUWCL8yb0e4LBrY6jTIAgAAEhhA=
Date: Fri, 12 Jun 2026 08:09:55 +0000
Message-ID: <BL1PR12MB5032D8E3A6E7652CA8F5CC85F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <20260611101734.1968785-2-neal.frager@amd.com>
 <ae37c770-9619-4af8-9b24-d946bea672cc@actia.se>
In-Reply-To: <ae37c770-9619-4af8-9b24-d946bea672cc@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-12T08:06:43.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|MW6PR12MB9018:EE_
x-ms-office365-filtering-correlation-id: 7f85d884-19e8-4564-4e13-08dec859fd06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|23010399003|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006|41080700001;
x-microsoft-antispam-message-info: 9C4i1AZbJKJX9bcWKRSXnSEx9xzP7vHy/yR8DhREAk1g8sjJzbyHe0KPSoxvOImwG5fdPsuu5fpZgF0hc1PFEhtwjsuy4L3Q2uO96iKM/yaGTx0hzN6bgP3sioqnDUHk3IIcPdNknVaG8GfsuO0ItGanaKWf+/LBkV2lktOgcqxBcsO1KZdDkeBgUC5+fXA1PE4t907/3u7ukxrRxEVRRNKL9tNG/FH+gk9OzRp+KBGRLvbYwRypF5mWUHSvS3VeHNtCzTzp4nOVTDtBgsoyG+4EcqBB6myv2wMpQKhalbLmOZdtntO8T8NIRbZY6onPUbco3pOlE0zEIz/75R5cUlJJVUTkSarPzbuhNSYSnjeDIv4+mqMLs+owOv0uwBdCwGcsRkdkMe3so5fWjjwLE3tf7CYKboNm+P4NKR3X5qbgjKzhzKpABkzwzgaViTMZzSfBzV87Fm5MZX5CvKORg67uBxsqC+/6FOQWgbxZtAis6NaT+BktHecoAmwi604rI89tQ0SgOcftzcL3Gr3M2iEoqS9ZkOesnCN+fwNQePU11yYJRYiAL54UNizULYM28yk/rZImF/Pu73qzfq5QkTalgsyhZoAJkp7w17NgIbApouJ00oibaIhAY1AlduzGxm5NnCCoOVP60DBu1E0Au/JJ5p5es10bD83q7sNzQ/LDRwgQMLo3LFpnsOtyPoMKHMRxFGT7+HV7U2U8VfAy4LCN6f7HpWm5h/fme3zdNWRyBH2HNBywha+6GeWXaBPU4wnNO54fDUAoXP3xOZ2pBcp9a/W9zShhGZWYh/IPHzQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGNqVDRDa3NmTElYQ2FiU01BN1laVks0VlJidzNWUzRMbkxQWmp6TzZ0WGh1?=
 =?utf-8?B?czFyNTZ5ZGg4c1ZnSHE1bWtPMktuNEk0TGpKc2FUTUxzUlI0dS9BcEpPSzlp?=
 =?utf-8?B?bUc5Ulo1SmVQT2hvalhHUkRGN2tNOVZHZlJLamxJc0tyMXdWRW4wdVpQaEZT?=
 =?utf-8?B?Q0pVajYxWTZrYzRyK2N5alNkRzNEeGk2OEU3bUY0R1NBUlMxSVBrTkI3WXZM?=
 =?utf-8?B?bXdEczdTaWp2NTlGVmtJMzZoNWZFbkdkcklZcFhiVlozN3FmNEZwNWFadHlW?=
 =?utf-8?B?OE9NVE1PTk8xb0NLNktRa2w4eEY2T0g2bHREWjUzUStPdHF1QmRrMGdHQnA1?=
 =?utf-8?B?ZmE5bThNdjhCMEc1YUtMT3BTS291RE5xNkwzR1pXUit6TE1hblc1MzkxZnhl?=
 =?utf-8?B?TTVNRkR6UUtDMnRtOGRtYTlWVG1ycUZteUE3ZEtJZjNGZlRLNTVDNmtIMmtj?=
 =?utf-8?B?ZTMxM1hLU3lCYkd1akFvdHdnclRLTWhHdmdqKzlaUTZVY21OcmlTdTNWTE4v?=
 =?utf-8?B?ZUpLc0gvTFVmcFZ0ZDVGVXFDeVdVODkybm5OVElVMFZuaEFuTzQwb0hoeWM5?=
 =?utf-8?B?WmtPNElCclFWQWh1OEcrNHpBeXNwSWUyd0xGclFTa0lzdlovV1Bqb0ljT05X?=
 =?utf-8?B?Z0FMLzlocHY5dmxYSGYxS2lRV0M5Qkt0TXNKVnZjcGR2c3YxZVF3bXRtN2xD?=
 =?utf-8?B?TVk2a1IvZmcvTWJaTERtUGZ6TEg0V2Z1cG5JZWVuRVY0M0pFMG9kQi9GQXdI?=
 =?utf-8?B?dWc1bjJHbUVOMGhLN3k0dXBwcjlHU1NBbmsvT2w5d2JhZXFrNjFSMXQ1RVpS?=
 =?utf-8?B?eEhkcHRUVkh0Z08ySFNLbW9XMXBmN1grRHh1VERiK3M2TE9seStqOGJHbUJE?=
 =?utf-8?B?ZHdKYnp6WmhqQ1NOME1OR0xRSDRIemxUVjlFVUV2bnl0MFkrOFRsZHMyaFRo?=
 =?utf-8?B?VmxuaVV3SkZlSDJ6L0xBcW5xZkpROGhzQVdxUDFldnhQdmVsSnpSRGRISWZi?=
 =?utf-8?B?dVJNZk5iRHhUR2l0RkNkTW56SytMZWxpRGRHYXo5dmJiTVYrYmJhOHBNOEVT?=
 =?utf-8?B?djhCRVJsdUtaMnBaUjZHVWxSK0dNMU91WVpobjdmMUkvTFNEV2VmQ2NreHZs?=
 =?utf-8?B?T0tHOVBxOENMUWdzUTl4ZGhaUTZPM1dZRXZQZkhCY1puTFFNOWNhZW0rTUo2?=
 =?utf-8?B?VHpjZEoyeEIvYlIwN0ZLR2ovNnV1djZPbzZzYU9qYXdRakdNVVFtTlRXdDJC?=
 =?utf-8?B?RFQ3RU9sZXlJUEFiUHF1Z2lmTGN0NW9mVUs4NXp1NlM1S2tpelc4cmxWdzU2?=
 =?utf-8?B?Z2NJTHFWVFBXMlB3Ly9JTTI4SllaeDkzbnE0eW5iQlZBaTZGV2IxdUtBU3hN?=
 =?utf-8?B?SDhodVNvdlp2QUc5emhiNG95VXNUV2w2ano4WGtkeTJiV1V5emJGbnJ0WWRn?=
 =?utf-8?B?RlFnMnNJdkFaSmc0M1pBOVpQeTlBdG5pVnFBVEc1NjNVcFNVZmZPcHZ2N2hS?=
 =?utf-8?B?MkJvcVJkNEp1VVlqcnVvRk4zN2tHbERDYWJyNnpvVCtYcDNuaytFcHFjaEFI?=
 =?utf-8?B?dC9tbGtIeWd5NTVQcDNQalhDTDQyaUhGbThKU0cvSDcyMEp4V0t4YzRmV0lO?=
 =?utf-8?B?UlhkbDlYYkgreVR4MDdLZHJ0bHJlWHg1Z0MweUpWc1QrR3hXZ2gweXZVTGZp?=
 =?utf-8?B?RUkxcmNSMGNBRjh0WHU2dmQweE4yS2ZwaitYL2dKK2F1TU1BbXdRTTRVQWg4?=
 =?utf-8?B?N1FYc2hLcHJvL0NkaFJVTThxYkV6cmVhUVNBc0NHRmtDTUdwQms0SXg4Tmdr?=
 =?utf-8?B?c2Z5YUxGa0JtYVZkRkxlUnE1VlVCWlFPV0dOZmdVV2Mza2kvWEFRVlV1OWFw?=
 =?utf-8?B?SWJwS2ltd1h5ZHZBU2ZmekdkUWpEZ3FKbVZ0aklJT3VKWm1tZGxpNTNvaWxr?=
 =?utf-8?B?SlRFRVhOQmtBckNFdWZidmtrMnZjeVRMU1ppcU5EaW42OThBWlphb1BPY1FR?=
 =?utf-8?B?K1NCOGcwbWlKaGNZOVp5WjJZWXpKZjhPODcxQkJua2hmQTZVUWgwaW5LblJv?=
 =?utf-8?B?SXBpMytYejR4MnVTS1dMQmwzVldZa05lN2xuQkY1OFdwTWtaUUdEcHNGZHh2?=
 =?utf-8?B?NlZ5L2xNQi83aFJKUlU3alZVL3dCRWxSZTF1cUdFbWNXMDY5Ykd0T2M4Nmh4?=
 =?utf-8?B?TkpJOVRIQXlhd2d3ekp5b0kwTWFXcW1NRGVXdGVzZkF1QXpjQjFPWk51cEJn?=
 =?utf-8?B?THprYkIwRU1IY3hDT20yNkpnWWpDZVBBLzRlY1JHbkQzenF2R0J6YXhucjZ5?=
 =?utf-8?Q?TahHmyk1D81z1ZsuEC?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f85d884-19e8-4564-4e13-08dec859fd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 08:09:55.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TZ0phDLBGji6QB47I/5ACjnLPpdj8NBtlRvNW4V8NQijH145fXuiJsggc2cyl3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKCHAChBrNFVAyI+Q7t2QxSL/laL6d6AIyiSZdWm47E=;
 b=DegoZb2Kn7qFXBYpm6P0RgXC9IqcOv6ChL7ZJlQeydJMfpbQR/VyIsFrYKFInE7Q2jo6T0RaiY6HrP0lz9i/guki+ahBSk7ixgdrvzQQrhegcYfhemNHgs1e/yInhLmte6FlPgE9dUL4UFM7CVF7H42QHfjnlpMbAnnJzqGp7G0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DegoZb2K
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball
 support
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

AMD General

Hi John,

> Add support for custom tarballs such as tarballs from vendor Xen trees.
>
> To test this feature, add the following configs to any zynqmp or versal
> defconfig, so that they can build the latest release of the Xilinx Xen vendor
> tree.
>
> Add to zynqmp_*_defconfig or versal_*_defconfig:
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx_rebase_4.20_2025.2)/xlnx_rebase_4.20_2025.2.tar.gz"
>
> Add to package/xen/xen.hash:
> sha256  3453d17402d2d1417fa86ec7f959bbe5ccdf63312224679ef51e4f97d0a32870  xlnx_rebase_4.20_2025.2.tar.gz
>

> Should this add the same scaffolding we have for e.g. Linux were we can
> get the .hash file from other locations?

I didn't put it in my commit message, but I believe this is already supported.

If you put the hash here:
board/xilinx/patches/xen/xen.hash

and set this in your config:
BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"

The hash is found in other locations.

Is there anything I am missing?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
