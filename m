Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429B9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 06:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0C980B99;
	Sat,  7 May 2022 06:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHqwOAQ3B6tf; Sat,  7 May 2022 06:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C4B80BAA;
	Sat,  7 May 2022 06:26:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27A071BF400
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 06:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A6440521
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 06:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDJUHaasO7Ko for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 06:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 189CA40025
 for <buildroot@buildroot.org>; Sat,  7 May 2022 06:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCb1gDCDElc0Y4CwyzPTj7XOOiDNFtL+pl45zowq+0rI3k1cjKL5uecZjXLtNhIUGBS4SjOZowZRub/1nbV0ffEYy5Ol+g9+dyyTRKA0GrgBrk2HZ1lexuKCCr8cNnPwdADFZu0JiXtTm69HsKi2dX2gtDOUdjRD0HUD99S9dhbDUrYG09tbNEV9/1lHhd3pf/lYJrLASSwlb3Aug6cVTR5gDD1/uPVjvpZy69qi3Zd7eazVO3giHnfeempP1M07CiouFuG+gyZG3kkZukHNp67VsA0j4rehInfOxFrFbUYXFkGJ1/qJtuAGOj34E+ieqyXwgoV0UFbeb/Y0hbMCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akZbWozHGU6hi309E+G3sqRjmIUNo1O0r32m3Dd0v7s=;
 b=YRUtxJPJbqtK3mXN8GE4mqPuInQ8yy7vEy2c6n4PEFqSFGUigwU+FhY91CMb266uzTFLZVH3UMwNPbPcVGaHz9bvRsqxXIplKYGCuoAbNeYrpj0lqeBu1uvsYrqGPYQ7G+bJ3cRGdfDsqXccpS0SXtaqqIFLtJFerAPgz1+z8Aev4o8RY3CfgzzxS2WyDLo4fML+hIV/auLh9jBwwXGgIPPT0Q8d7RI0OogfO5dM6q2I6DTqFbZymGZxD6HNkNpjcp3A6Hxcnc1/8U+MlvbKqd5OGlcHmbCn4i13eLG7GCUEdbQiF0hs9A6WzFkkcZtaNG+sLfaF/F6FqjpMxmujDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akZbWozHGU6hi309E+G3sqRjmIUNo1O0r32m3Dd0v7s=;
 b=qDO/iAtJmPdoK0CZj2bPNfcV1vyhq4vr2oL9t0o2MgKkCXK41A8kDM3J7S6DKRGQgieHKdtjBMyFjcA1IUs0QB/xVVkPWwPVXmLvoxPNWwRuWvw69XB7OdmAk+aHwUz1Xk0NYAxIW9tXegz+2JNUPV+NwpKl9M1yGMHyShZ/7QU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB3666.namprd02.prod.outlook.com (2603:10b6:207:45::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Sat, 7 May
 2022 06:26:28 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Sat, 7 May 2022
 06:26:28 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/2] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0SPCfngAC5bCI=
Date: Sat, 7 May 2022 06:26:28 +0000
Message-ID: <BE2A1487-0690-4BE3-BFEA-AC439B98FD3D@xilinx.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <87pmkqzcsf.fsf@dell.be.48ers.dk>
In-Reply-To: <87pmkqzcsf.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6727f92-978a-401d-77dd-08da2ff284c8
x-ms-traffictypediagnostic: BL0PR02MB3666:EE_
x-microsoft-antispam-prvs: <BL0PR02MB3666738D525A39FF9B64FB1BD7C49@BL0PR02MB3666.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: reYeCGn9rMG5Pqht2eE7ENvJW0KiaakFJw8CecKx91ZlJRQcGOptV4WsqdkmHCky8f9bNlVexPsuf+fHv/1zbtM5n4blFHZRPqH+dTwdMKZ0bpF+prWFcaj+VLNd1hcWKmPU36g88h2gDZVD3fXMpw63CMDHT2sj6K6gk1laVLGQ6Mg8Wf+FsZf5URjbpZBfco9N8/Lh0BcZ93O2tZCPx1y+eS9ru0wujIN3VQ62NZUkbpqdeZFgjTUIQ4qCbWwZJE3lpNcC25cx6qOQA0ZLTc2R+0gofErYLhuKeMtKZ370HB89AZYpWQSt0lbMUJGU+HFszHCFWE1y3ZAKR2MpZoX4cY8TIJUe0oxiFAE7IsHv3t5+lNQ/hOT3bmbnwPQsSWOeZ2gRMYJBF1piri2wfRrunad+Q4TZ40isLGYd44UfbU1P/ODWHgocPe+ZTE+8XI12z+wvfbWt4FnTXM29FVGUBzRaoVahK2OM2db7R20SNFfKbZyio4mPm4pHF2pMOo8Gp/oieogbuahW6nUe90ccpk+1dQDgFniBOiGootHfv3T2UlX1OivmTIzUimLPyqwMxCGbX0ljGVa8NPXLtoRqpy+6XLxeER2V3JxPmXyhVJcK+3BtsTeLjJnjwy0EgbUrW0kMxn2KKSfayZxBgXy+2EKDh58XSJ9E3mVPww+ey8qhsNIsFe7dlztZbsZlDIcqoWoMBQBRUi1dXkwKVkExKGF5qamLUsyjLOBlCw2FSgjAdWg0OW8mGTYgugBbRDAmALO4XHXJQtoUCpuX6o1RxZ42bX48fICaNUBXVsVFqil9Pf9oyeImMuVeXKSwC7IYppnZLbrQCMEmjOS41xgOmEk3r8vCJSKP3csURG6W9lVyuLrtEEcrMvd5Qjbp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(2906002)(8936002)(5660300002)(66446008)(4326008)(64756008)(38100700002)(76116006)(66476007)(8676002)(38070700005)(66946007)(66556008)(122000001)(83380400001)(6506007)(186003)(2616005)(6486002)(966005)(508600001)(71200400001)(86362001)(36756003)(33656002)(26005)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkgzKy9PN2NHYnNnVjMzL0xLeFZrRlVQSThDdytCNndQZitEN29ZZ1Vab3Ir?=
 =?utf-8?B?Wk1YWTdNeERDR3BPNFAzNi81UHR5SFhpZjBlandZYkl3eTlVaGVaVzd5Qmsz?=
 =?utf-8?B?eE45eUFhMElGUlpibWFnRWtIQVMyVmd3TEk0TGZnV1NyWDl0V2pxaWhkNVln?=
 =?utf-8?B?SzM2MTRORDFRV0FxTFFLVUxnNUE1V3BvK0ZnQUpDVGQ5Qko4MFRIOEhRY0VG?=
 =?utf-8?B?ckszQU5nVVRaWG5WSkRFcDU3QktLUTZoQmNES0p0TmMxMUZFR2dtMDg0b3du?=
 =?utf-8?B?YVM2T1lKREE2ekl3YjMyZmlXTHNBaUFYTEdGQzVFQXVicGJsUHNlUHo4TzBt?=
 =?utf-8?B?N0FwZjB3YVQ0K3dzUk5PS3dyVGp2RFFvZmYyUWJhcytHUUhxb1AzcGIxbzI1?=
 =?utf-8?B?M2VKcVptL0hja1BIMExxTU9xeHdPaFVCNnkySW5COWQ1dzZ0WTVQQ2NzUHla?=
 =?utf-8?B?TXNzZW1JVTFjb2p4Wm1BQVNxeHMrd3RaMTMxV1kzME9TWmFJanN4bXBTUmd1?=
 =?utf-8?B?cGp5Vk9iS1R6SmxNUndVQVRUSU1QZjVHNVpIU3BiK000bVRGOCtacjJpUjlK?=
 =?utf-8?B?OE9BQnFmNjcrOWZ2bVE2Rkw4Zm9ramJRWlZOR3BUbUUvMEtySWI4YUl3MGVP?=
 =?utf-8?B?Nlh0enQvRFZpKzVqZlFFWllhRElsSWdZM1N1SDhnZUVsM1hFQUdySWxsUVZH?=
 =?utf-8?B?VHBwN2J2Mk04Z2o0Z01pVUQwQU43Smt2cHF0M2Z3Q2drUENQaEhlZ1MzTXpy?=
 =?utf-8?B?L0FSZDJYT0pnSkZENm1XT2lKMzJXUVZ0Vm03a1pjb0t6MDY0N2tkL2s4Z01x?=
 =?utf-8?B?czcwODBNMlNGKzdtNWVmRUlTa2NESlBWQXdLSXlUR0RReFJvQTlxWUoxUGhp?=
 =?utf-8?B?bjNKY0pac0hldkpvWFVJSEwxT05IZ250VjE2c2VFbnVORkpMaDloSk5uNVZR?=
 =?utf-8?B?aEltUWZNWkJHYVRhR3M5OGpmdzJNWU1RdnZFU1ZZWFZ0SXlFaDZza2xGT0Zw?=
 =?utf-8?B?V2dYYmUrNnFTaDZsRWZSTjlIY2lvMzA0c1gwN2JxQ2hqTkhiTUhvR3RHMllX?=
 =?utf-8?B?c0R1WmNhUlI5V3pRVUpOMUtHRG9nMUNqU1JoOHI5WlhEZi82S0d4bTc2UWhC?=
 =?utf-8?B?amR5d24wSE5CUCs1VEtsVitVb040YmZlemJPbFdxRTUyWmZvTzJucFBIcTVN?=
 =?utf-8?B?RFo5VzRsQWZ0UG5vUzB4b3dlak9aZWc2aGxmWkZuZXlZR0hQeFYzdmI5WDR0?=
 =?utf-8?B?eXVKZVgwUEovc1JNN08zVXJQL2Z5cWhoVHdyNFl3dGJQNnRaSGxPNzF5dno4?=
 =?utf-8?B?Z3VUcklmRDFXZkJLNUlXSEJTSlM2RzBjV2p3Sys1U2ptMmc3TjNkMGM1N2lh?=
 =?utf-8?B?RjJ4MHZJelU1T3pWWURQM2ZId0pWNVc1VGlPbE1xeVI5WVVENWNRcUxDZjRp?=
 =?utf-8?B?aXFQNXloUWd0czNWWkFIUGEwdXcvdjVTYng3ZzdiaFMyMUNoZklqa1RjUVZV?=
 =?utf-8?B?TFpPUjRCU0IzUUYyZWJ0S1oyVzJhdjBqUVBkWTU3YzhvQ0E5ZjhuNkxNUk1m?=
 =?utf-8?B?dTZ5cW50RUNNODdGdlRSUE5nSUZiRTcxcVZCM0FxZTdiaURBRHdxWndMaHBl?=
 =?utf-8?B?aVloTnd5Z1dUSEhoRVNuYjhnWTJIc3U3MGxzZitzWnc3cVlXNDJtUytOdWRI?=
 =?utf-8?B?SUFEUlBrTzdPVTIxbG5pUGpFdFRGbUpsMmxWNVh4WXJtaXFxM2hHV3NVbHZp?=
 =?utf-8?B?QVYwNTFON1JuYkNBWlY2aUpxdTU4R3h4a21YblZ0ZUV2R3dadnR4MHA2elVn?=
 =?utf-8?B?MXFhbisrM3ZzK1JmdU5jcDNGenJyMGNpVi9iMStHdVJXem1FNm5nZ3hzdmRp?=
 =?utf-8?B?T1kxUCtEMmtVRE5EK2hoVGc2SmdoL2Zndkk5MDFhQ1FGd2hPZDBYQ0V6THkr?=
 =?utf-8?B?c0tEc1BIQmtIbVdNemFWRWpnWFVrQ1RhTEFKQ2JzL2lEdmZORmpVT1JzZEV0?=
 =?utf-8?B?K1IyM1BXeGNiZUV4Vmp0bFhDdDVBNVBYU0lDV2xBU0FuVHNTUUU4RzNLbnFi?=
 =?utf-8?B?L2ZzZjRCRDlTOHVNL3Q1VkhweTVXcXQwTXVBTlFsVVc0ZzRMcmhhMmlMYzRi?=
 =?utf-8?B?eXhVSG93UWJ5MXFrNmMxV0hCNWRKNVc2NTBNMHJqZE5qZ3paQlBhK1oxcGhF?=
 =?utf-8?B?aS9QeHZ5VzVsWGZMNTB0V0pLbWFVcEF0RlM2aUo2dWF6NUNWTDI1WEZZaUhj?=
 =?utf-8?B?ZFJlS1Iya0tCNzg1cEFXdXMzd0wzUWNjdGFoMmNmNHBOa1FUZSthS0NJcGRU?=
 =?utf-8?B?bXJXS3YwR2k4czBpY3FZK3QrbFNsRXVzMWZzZTdzVFZpUUZsVXM5Zz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6727f92-978a-401d-77dd-08da2ff284c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 06:26:28.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJzGmvi1zhVMxMT7syqcpEjHAo1qedZ298qPKgYWzzQ6PZlBHdaOa7rUGXdL0HGe9ovBtR3k8PpKXaAXACNSZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3666
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCg0KPiBMZSA2IG1haSAyMDIyIMOgIDIxOjIyLCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+IFtD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2Vy
IDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cml0ZXM6DQo+IA0KPj4gVGhpcyBwYXRjaCBhZGRzIHN1
cHBvcnQgZm9yIFhpbGlueCBLcmlhIEtWMjYwIHN0YXJ0ZXIga2l0Lg0KPj4gS1YyNjAgZmVhdHVy
ZXMgY2FuIGJlIGZvdW5kIGhlcmU6DQo+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3Rz
L2JvYXJkcy1hbmQta2l0cy9rdjI2MC5odG1sDQo+IA0KPj4gV2hpbGUgdGhlIEtyaWEgU09NIGlz
IGJhc2VkIG9uIGEgWnlucU1QIFNvQywgdGhlcmUgYXJlIHNvbWUga2V5DQo+PiBib290IGNvbmZp
ZyBkaWZmZXJlbmNlcyBmcm9tIHRoZSBvdGhlciBaeW5xTVAgZXZhbHVhdGlvbiBib2FyZHMuDQo+
IA0KPj4gMS4gVGhlcmUgYXJlIG5vIGJvb3Qgc3dpdGNoZXMgb24gS3JpYSBTT01zLiBUaGUgYm9v
dCBtb2RlIGlzIHRodXMNCj4+IGhhcmQgY29uZmlndXJlZCBmb3IgUVNQSSBmbGFzaC4gQSBwcmUt
cHJvZ3JhbW1lZCBib290LmJpbiBjb21lcw0KPj4gd2l0aCBldmVyeSBTdGFydGVyIEtpdC4gVS1C
b290IGNhbiB0aGVuIGZpbmQgdGhlIExpbnV4IGtlcm5lbCBhbmQNCj4+IGZpbGUgc3lzdGVtIG9u
IHRoZSBTRCBjYXJkLg0KPiANCj4+IE9wdGlvbmFsIGluc3RydWN0aW9ucyBmb3IgdXBkYXRpbmcg
dGhlIGJvb3QuYmluIGluIHRoZSBRU1BJIGZsYXNoDQo+PiBjYW4gYmUgZm91bmQgaW4gdGhlIHJl
YWRtZS50eHQgZmlsZSBhbmQgdGhlIGxpbmsgYmVsb3cuDQo+IA0KPj4gaHR0cHM6Ly94aWxpbngt
d2lraS5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL0EvcGFnZXMvMTY0MTE1MjUxMy9LcmlhK0sy
NitTT00NCj4gDQo+PiAyLiBLcmlhIFNPTXMgdXNlIFVBUlQxIGZvciB0aGUgY29uc29sZSBpbnN0
ZWFkIG9mIFVBUlQwLiBGb3IgdGhpcw0KPj4gcmVhc29uLCBLcmlhIFN0YXJ0ZXIgS2l0cyB3aWxs
IHVzZSBhIHNlcGFyYXRlIGV4dGxpbnV4LmNvbmYgZmlsZQ0KPj4gZnJvbSBvdGhlciBaeW5xTVAg
ZXZhbHVhdGlvbiBib2FyZHMuDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5l
YWwuZnJhZ2VyQGFtZC5jb20+DQo+PiAtLS0NCj4+IGJvYXJkL3p5bnFtcC9rcmlhL2V4dGxpbnV4
LmNvbmYgICAgICAgIHwgICA0ICsNCj4+IGJvYXJkL3p5bnFtcC9rcmlhL2t2MjYwL3BtX2NmZ19v
YmouYyAgIHwgNTU2ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IGJvYXJkL3p5bnFtcC9r
cmlhL2t2MjYwL3Vib290LmZyYWdtZW50IHwgICAxICsNCj4gDQo+IEFyZSB5b3UgcGxhbm5pbmcg
dG8gYWxzbyBzdXBwb3J0IG90aGVyIGtyaWEgYm9hcmRzIGdpdmVuIHRoZSBrcmlhLw0KPiBzdWJk
aXI/DQoNClllcywgdGhlcmUgaXMgYW5vdGhlciBLcmlhIGNhcnJpZXIgYm9hcmQgd2UgYXJlIGFi
b3V0IHRvIGFubm91bmNlLiAgSXQgaXMgbm90IHB1YmxpYyB5ZXQsIGJ1dCBJIHNldHVwIHRoZSBk
aXJlY3RvcmllcyBpbiBwbGFubmluZyBmb3IgdGhpcy4NCg0KPiANCj4+IGJvYXJkL3p5bnFtcC9r
cmlhL3Bvc3QtYnVpbGQuc2ggICAgICAgIHwgICA4ICsNCj4gDQo+IFRoZSBwb3N0LWJ1aWxkLnNo
IGNvcHkgaXMgbm90IHNvIG5pY2UsIGJ1dCBvay4NCg0KSSBhZ3JlZS4gIElmIHlvdSBoYXZlIGEg
YmV0dGVyIHNvbHV0aW9uLCBJIHdvdWxkIGJlIGhhcHB5IHRvIGhhdmUgYW55IHN1Z2dlc3Rpb25z
Lg0KDQo+IA0KPiBDb21taXR0ZWQsIHRoYW5rcy4NCj4gDQo+IC0tDQo+IEJ5ZSwgUGV0ZXIgS29y
c2dhYXJkDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
