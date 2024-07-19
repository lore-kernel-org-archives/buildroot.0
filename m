Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D3EC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 15:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A2A8052D;
	Fri, 19 Jul 2024 15:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPjUqQ20EGJ9; Fri, 19 Jul 2024 15:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960068053F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 960068053F;
	Fri, 19 Jul 2024 15:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 992201BF2E4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91EB140C33
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrFznyjOiT_g for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 15:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c103::3;
 helo=yt6pr01cu002.outbound.protection.outlook.com;
 envelope-from=rajnesh_joshi@sfu.ca; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4F0C40C1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F0C40C1F
Received: from YT6PR01CU002.outbound.protection.outlook.com
 (mail-canadacentralazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c103::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4F0C40C1F
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 15:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMUcz9eG4DL5JQTqAJrXQapRbC9slpQ6xCWfOHf5UhUl4CyKRUw3PZkvEcFka5OTfdbYmySULLzFMqDMc/1criVp/UbqFFQ+mfdlYwm3Ku7FLXjcFRu3g/2/CHS/j0MI9lDsfD/V2vnK4R6SMRBLg0K/B493Vj2rU2StuMGOdf/UrEosV4sGFyQXX8Oq3Va0Xmj4E2USUAbsF7aAoFIkwtTmsUW0bdeHg8V16aqqwmcTaNVVjEZs2HcoJS6pWwyIlx6c40KbQBs2KGy+MpP+Fd5QwDqROhm09iwD/0g3rukn1SFjsfnKSFQxhXHdwuh+PWhv4xPP6/XWYGmSh9bH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcuV0G+HGsKcHfBzkxV0mAEYLbApSV3uRWwBHRuBTBg=;
 b=CMCNlD6mB00IsqITpVid8g+TTVrTAqDKlzmSApWlssmoS2VUkvOOwauUlBeb4yU81X2XU7lEEVTgRdGAbBMSfY+DH4KfWe4qD7SOpT9dNZ8s8riaS+YwqjBr0TjI2PwRtoWmL/e+SCx1Ruk/UFxdCGeFM/NEFwHhfMPK1v+BM20Ez4dbSRBXH1LMp/aHMiRB8UkKI/VU8wOTKnOEe7eDbodu38Cl3UtpDCNaRLkH3WraOH58RbunGBLitF5XIkwUzO7TjzLfPpsmZ6K07+xZmEBLi4ITqXJhZFHTnRN1wKDwAMNxZptHMxhRSyxetVgZ43Go43uVUtECnqfW4qL0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sfu.ca; dmarc=pass action=none header.from=sfu.ca; dkim=pass
 header.d=sfu.ca; arc=none
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:37::15)
 by YT3PR01MB8529.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Fri, 19 Jul
 2024 15:43:48 +0000
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa]) by YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 15:43:48 +0000
From: Rajnesh Joshi <rajnesh_joshi@sfu.ca>
To: Alistair Francis <alistair23@gmail.com>
Thread-Topic: [Buildroot] 32-bit RISCV build error
Thread-Index: AQHa1vluoteKe1/LJUyB8eqbTYOwrLH4TsoAgAAC36iAAAhkAIAAPeMygAWeU3Q=
Date: Fri, 19 Jul 2024 15:43:48 +0000
Message-ID: <YT2PR01MB42391898AFDBF1046CB485B2F7AD2@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
 <YT2PR01MB4239F24C075D994E5746EB30F7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKP8LMKA72nc8MKws_Zar1BpwS7Yju2bjamLfyY6Z64VSw@mail.gmail.com>
 <YT2PR01MB4239F514BF394397441DAD1BF7A22@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT2PR01MB4239F514BF394397441DAD1BF7A22@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB4239:EE_|YT3PR01MB8529:EE_
x-ms-office365-filtering-correlation-id: 37e0fca1-c855-4028-1aef-08dca8099490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b01oQzhNT3lqa2ZRSWhDUHM2eFNsTCtNeWJReXNqaUt0aUdPMXByZzBQenVD?=
 =?utf-8?B?ejgzK3NvL0pKdk42U0g3SHdNc0JWQU15Q2ZXK1FBKzB0QnBxckxpL3ByeVRp?=
 =?utf-8?B?V0RKUlhqeVA2QzFpRDJpOWdxK2E0RDlHN29YUVY4UnFwT0k2WEF5Z0o3MTJG?=
 =?utf-8?B?T1h4ME5zRTV6WlB0QmN1S1hadzQxRnJ6Qm0yQUdxM09NRXZTQVpHTFQxSVlU?=
 =?utf-8?B?SndiQTB2TmZ5RWlGS2ZJYXFqMGpCbFREajJtSkRhZFBORTBFR2dDZG9jaXFO?=
 =?utf-8?B?Zm8xZEgwMDhSTVJJZGN2bklZVzd5WUVmRlhJZGg5ZHdmeWNjTTRRTEpiK0lJ?=
 =?utf-8?B?OFRxRGdXOHBDdmRmc2RPek1xUSs4NW1mSHFHVnBqbnZZa21VaktEWjZqWjdu?=
 =?utf-8?B?WUZlanRPTk00WTZoTThsbWs3VlNwOG9hM3FUcGo3NVJVQzhVMjVwOW1Db2Nn?=
 =?utf-8?B?WXdCT1dIZ1hvOEVTOFl6S3BvZ0RUdnZRaHU3TDloaXZoMGtMcUR0VUdaNDFG?=
 =?utf-8?B?Q0lESEQ0RXV6YXk0WGpEMmtJYWU3cFg5NG1HZVlCQmpkdFQ5ZU5IR2kwR205?=
 =?utf-8?B?SDloekk1VDViQlVxZDJVdEk4RnNXMVYxZ2Y2ek52bWo4NUdhajFwYzhKbUhl?=
 =?utf-8?B?VnpCT012T0F1RE5heXZOaHp1S0JJdzJFdExxUHdTeVNQNTh1cnRNT3ZkSzVn?=
 =?utf-8?B?UzZpbk00OVFEdEo3eWhQdURTY2RYemdDZnhRZjdHVk5vQWtRNExPZ1JHdnVW?=
 =?utf-8?B?dEh3bGFzbGErUmFDOHYzTGtzaDFIajgzVlFjWWlnQWZRRW44WmViZjZCYmI4?=
 =?utf-8?B?aVhKRnlNRDcxc2IxUEhNZFkrSzBlNEROZEF4aXEraG1lMDVVWUNJYS9XSmU2?=
 =?utf-8?B?TzJWNzZvT0tRVVpXWERjZW1ScFdiWHdZcWowTUFFY0w0dmlacFVPODBSUlpk?=
 =?utf-8?B?K3RvWElyaUZ4eDV4REVrczFiUVM4MklYMWpEeXF6RjdWVjEyMERuM0xVQVU0?=
 =?utf-8?B?VjlWNWNHRXJEWVNzS2pwOXRSbGE1NE5vVlc1a3hva0xnYVNTaEVWZDcxK3E0?=
 =?utf-8?B?N2M3V1NtTDFYUkphRVM0dC9YbWkxZUxEZy9qdVNpUXluRHVQZ2JWOFdQalFZ?=
 =?utf-8?B?MGFlaVBkMEFYblkxY0E5YjFyckViRTJVeXo3ZVdpa00wMDlidTMzUFl0b1Zv?=
 =?utf-8?B?WWVoRWI3eDc4Z25EeWFYeDFoYkZtSnA3M3h4RGliYzBwSk04aDdzZkJkcDZw?=
 =?utf-8?B?WmtkL24xbUJGSmtFdlE2aU1TcWs5b1NWeWNmWTZDNS91bTUwU21XU0lraXNw?=
 =?utf-8?B?Wk5pdEhQcjc2Y2drcVlwUjVEcllDNXFtcUFTazIxTkRoMWpyd0piMms0N0Zv?=
 =?utf-8?B?bkdya013MjB5Uk5xc3RHcEtxNDhnS2lHZkVuUnkyNmN1SFZZc2N4VHdNYmdM?=
 =?utf-8?B?cXlkSWFCa0syMkFCNHBNMzlqSDhoR1NhQkN3b3RJeTdPaDVRUHQrZlRLaU9y?=
 =?utf-8?B?OHlaOWtKemN3QXN3YTRCSlhkdGkrWDYwdERQZ2hlQVBMUDViMFIyOHliNytS?=
 =?utf-8?B?cUE4U2xJVm1rY2Nwc1k3V0tFUlNQMDVpRC8rQlVSWllXZ0h1S2JhWUZVSVpa?=
 =?utf-8?B?SytXNnVKQk5JRE1ENHh0NU1jbTdidkREcmZlQnAzcVlienFXRFJEREdHMDJr?=
 =?utf-8?B?TjBJMjVvR3h1aEQrV3BOU1greGJQVHQzNk50RzlsUmxQOGJzWHRoMDZJdzVH?=
 =?utf-8?B?N2g4aGxXQThVMmhISXFzYW5SQlpPL3pUbFd3Zy8zOHpnank0US9ZK2cwOTJV?=
 =?utf-8?Q?KvGnShCUBAlq0vV5bO5XVpiIhE6OiKAVDUZc4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlRyTytoOFVtSlFYTUhqNFMvdExDTXA4LzZuSG9IOWZRKzRRd1BJb09jZ2k1?=
 =?utf-8?B?Q1dzdUFzL1BoOU5TSTVmOFRRL05sbVVVNHZiRXVKQzA4M2ZWNmt4ZjE5UFp0?=
 =?utf-8?B?TVg2aW01L3lQR2xoUDhaTlVhd1YvNHkxZ1Rib09rM3FwS3hHZHRuT1RIUUJI?=
 =?utf-8?B?cmhGN040d0RNVWJjSkdUV2tpc3B6SlFLZzc1dS9XUElKSWhkN05qeEx1ZkRh?=
 =?utf-8?B?Vi9aL0VVdS9WUElmTjNYWTNaT3I3QmhZMlRTZlF2TzlUS1hOZjlFYVh6STRB?=
 =?utf-8?B?cks2SFpCMWRBb2MvRzlHcm9JYTdZbjQrQ1JSY2FzVVFxWFZLdS9tOTBWdkQ3?=
 =?utf-8?B?OXJWSjFIZWIzWUdHSk5OUGd1YkJmTWNGaXBXbjB6cUZ0K0l0Y0k3Nkg2K1Vz?=
 =?utf-8?B?UTJ0MTkrRW4rcXhpdk50L29oWm1yZEQ5UDRrWTIyTXUwSjdqUU96L0hDUGVE?=
 =?utf-8?B?dTRPaU9iU0JhSVdWcEZCbzBieWtWVzhSZ1k5aXJEakRTZEduY1Byc2dLVGQ1?=
 =?utf-8?B?enJncElTdW5nZUFGQUZQTFFCc1BRdUV5eDd4b0RJb3JWNTM5NVd0OU1ORlBY?=
 =?utf-8?B?a3lDQVpIdzMzNjJHbjRUdjRMTkMwN3dpMHpuY21wcTBsREViWEVSSlhLcFdm?=
 =?utf-8?B?a1o3R2pnZ2w0ZjM4ZFhrWGo5RjhIY2tZMm8zM3J6d3VSWjJLVlVGOWhlYlVT?=
 =?utf-8?B?YVA4RnN4V2NnWis2UWYrRVpDc1JTMjNYQ0VPalowNnNoeHJhKzY5LzEzSVhw?=
 =?utf-8?B?QjdHWGlqcVg4T2NJSm1leUZaT0ljcjc3b2tlQ2kxckIxbFpqd213RWtOeno0?=
 =?utf-8?B?Q3RSMEt6V0QrbnRmTnN1MTZTOHk4enAyK2dWbGs2d1pmb052ejN5enNmQmsr?=
 =?utf-8?B?aFBpcDZYSi9KUGt5YmpiOStUdk56QnR3dU42VExPSEdqSmdSNnlLVExDdnRv?=
 =?utf-8?B?dUxBOGJxazFBMVNwL01YVHBsU1Y1Qnc1RXFFYXYzM21OdUZzYytMRkg5UDNQ?=
 =?utf-8?B?b3BuSGlpY2NNVnc1TjZ0K3JDTmZWMW5nN0RvUGVWQi9GdFlZZnBGeVQ3ejFq?=
 =?utf-8?B?UlNmWGRhQjU2SnhQMWU3RWl0ZTBCR3VmWjJPdjBBcVB4NXNjSFFlcDZabkZM?=
 =?utf-8?B?Q0VnM0FrUll3SEdjQXNxOWFMZTJJOCsrOVZyZjIwYk0yVVFiSTN0YmN0SFJO?=
 =?utf-8?B?b3RCaU03K3dPb0xhMkc5MUtKUVE1OGVPNHR4dTNuaElDNzNpYjF4UmVlTCtK?=
 =?utf-8?B?Uk9JblMyMUZ3OHlPakRJVzd0V01xRmJkeXNZSkdCaWtKNDZ0SVpZVGFjN0M0?=
 =?utf-8?B?bzRtMTJoN3c2MnJ4d2FaR0d3WFNSck1COFFNeFFEN0U0RU11Q2Vpb3Q5RDQ5?=
 =?utf-8?B?ei80ajFuWklNam9XbFcwd2hmalJ2WHRNbmpkTjdSZUxTR0ZEaHZDRCttVHVo?=
 =?utf-8?B?RHlKU2UzQTY5cHluUWh5SHZTU29UWHViTFM4amhaVU1Dejk5UlUwNVk0eHBS?=
 =?utf-8?B?ZHhLNWZGZmNyWnkrc2dhbzRab1RmVExOU1VRNHVJVy9UQVQzenlqR3d6dDF6?=
 =?utf-8?B?LzJPeU5xUEJHeW5GLzlmeG8vTk1QRTIxc2kzUjJkb2N0Y3ZkdzgyWG5NYXVs?=
 =?utf-8?B?MU1qcjI3RVA2NHRxN3FVb2ZHc3ZIdzRGdmRUQlZzNGhlMno2bEkxQXpTVWs5?=
 =?utf-8?B?aWh3WjJEOW9ac21ydzY1bVQvVzZZekIwVzdQdUI5YWw0d0FFZk9SUlE3MzYr?=
 =?utf-8?B?ZXVmd2gyZkxkdC90QUYwdXd5TW10ZW03N3Z2a3p0NUVFcFVEQjEvNnBnTzND?=
 =?utf-8?B?clVMeExmZlpiUDIrNDlOU0d3d09jTENHdURPQThPb3M0WDlmenRqZkFDVjY0?=
 =?utf-8?B?aHkzbmc0M0tJM3ZMM0JXVjBPQmgxcTVtNTliTlA3TGh6Yll5YWlaek1pUlVE?=
 =?utf-8?B?V3JOOTNGTWgrOWxyM0Zld2s4V0pBVFBWWjZVMlYrSU44TWdxRTk2VG9MSURy?=
 =?utf-8?B?dzFsOTdkUXdSd1lVUlNNL0JKRlNNTkgwMTRRUnQzUEVwazI0WXdRUUhDVkRl?=
 =?utf-8?B?L3BLN1prS3BJWTFySjRqRjZjbENadWhnelhJMTBoQklJM0o5VlU5MSs5R05C?=
 =?utf-8?Q?no6OPkQyDdZvxjq9lsZ5c+qDu?=
MIME-Version: 1.0
X-OriginatorOrg: sfu.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e0fca1-c855-4028-1aef-08dca8099490
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 15:43:48.0088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e8677e-c989-47b9-8619-d83d5a5f6c67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yU/7f82zBGH5kNJ5TLN59+8CAykGTgw5nDWZBgocm8j463CLXPIGf3bOyR9ZXHCT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sfu.ca; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcuV0G+HGsKcHfBzkxV0mAEYLbApSV3uRWwBHRuBTBg=;
 b=wGq0Ts7x4CL87xfLmVR8W0PSJOK+EvFilW/aFGw6pBshDyi0RbcL4k1X6103/lcLFxqTw+rUBcS/EQ2t/i4BoB0rsRwjIDt6CY88aibN27mfytbcTc8utNOQujTtfXzs1KrFh5IM4wUNF3ci5Whsuf7NtgUoIQKZSzykMlqkXS6IfHhQBTWvW3SCVqDCVadWGgNlPW/pEyOdivQ6r4oHKfO6bRyEKKvnFWLSEiIERUVHP2i7bJUaRk+z77ZVhusr4YIoTNw8PZV2kqN2bCNYnrdbE2n8J4D+U3ZxbhMGnzdQ9l72vgu8JLAYmI83fFikHf4z9Z1EmMFbdI1khRZi/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sfu.ca
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sfu.ca header.i=@sfu.ca header.a=rsa-sha256
 header.s=selector2 header.b=wGq0Ts7x
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sfu.ca;
Subject: Re: [Buildroot] 32-bit RISCV build error
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2085303737714187337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2085303737714187337==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_YT2PR01MB42391898AFDBF1046CB485B2F7AD2YT2PR01MB4239CANP_"

--_000_YT2PR01MB42391898AFDBF1046CB485B2F7AD2YT2PR01MB4239CANP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCklzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGhlbHAgZ2V0dGluZyB0aGlz
IGZpeGVkL2NoZWNrZWQgb3V0PyBJcyB0aGVyZSBhbiBvZmZpY2lhbCBwbGFjZSBJIHNob3VsZCBz
dWJtaXQgYW4gaXNzdWU/DQoNCkkgZ3Vlc3MgSSBjb3VsZCB0cnkgdG8gbWFrZSBhIHBhdGNoIG15
c2VsZiwgdGhvdWdoLCB0aGF0IG1pZ2h0IHRha2UgbWUgYSBsaXR0bGUgd2hpbGUuDQoNClJKDQoN
CkdldCBPdXRsb29rIGZvciBBbmRyb2lkPGh0dHBzOi8vYWthLm1zL0FBYjl5c2c+DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogUmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9q
b3NoaUBzZnUuY2E+DQpTZW50OiBNb25kYXksIEp1bHkgMTUsIDIwMjQgNjo1NDoxMCBQTQ0KVG86
IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyMjNAZ21haWwuY29tPg0KQ2M6IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4NClN1YmplY3Q6IFJlOiBbQnVp
bGRyb290XSAzMi1iaXQgUklTQ1YgYnVpbGQgZXJyb3INCg0KWWVhaCwgaXQgaXMgcmVhbGx5IHN0
cmFuZ2UuIEkgaG9wZSBpdCdzIG5vdCB0aGF0IEkgYW0gZG9pbmcgc29tZXRoaW5nIGluY29ycmVj
dGx5Lg0KDQpSSg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IGJ1aWxk
cm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gb24gYmVoYWxmIG9mIEFsaXN0
YWlyIEZyYW5jaXMgPGFsaXN0YWlyMjNAZ21haWwuY29tPg0KU2VudDogSnVseSAxNSwgMjAyNCAz
OjExIFBNDQpUbzogUmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9qb3NoaUBzZnUuY2E+DQpDYzogYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg0KU3ViamVjdDog
UmU6IFtCdWlsZHJvb3RdIDMyLWJpdCBSSVNDViBidWlsZCBlcnJvcg0KDQpPbiBUdWUsIEp1bCAx
NiwgMjAyNCBhdCA3OjQz4oCvQU0gUmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9qb3NoaUBzZnUuY2E+
IHdyb3RlOg0KPg0KPiBIZWxsbyBBbGlzdGFpciwNCj4NCj4gQWNjb3JkaW5nIHRvIHRoaXMsIEJ1
aWxkcm9vdCBzaG91bGQgYXV0b21hdGljYWxseSBhZGQgdGhlIGV4dGVuc2lvbnMgaWYgdGhlIGdj
YyB2ZXJzaW9uIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAxMi4wLCBubz8NCj4NCj4gW1BB
VENIdjIsMS8yXSBhcmNoL0NvbmZpZy5pbi5yaXNjdjogZW5hYmxlIFppY3NyIGFuZCBaaWZlbmNl
aSBzdGFuZGFsb25lIGV4dGVuc2lvbnMgd2l0aCBnY2MgPj0gMTIgLSBQYXRjaHdvcmsgKG96bGFi
cy5vcmcpDQoNClRoYXQgc2hvdWxkIGRvIGl0LCBidXQgaXQgbG9va3MgbGlrZSBpdCdzIG5vdCB3
b3JraW5nIGZvciBzb21lIHJlYXNvbg0KDQpBbGlzdGFpcg0KDQo+DQo+IFNpbmNlcmVseSwNCj4N
Cj4gUmFqbmVzaA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBGcm9tOiBB
bGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpcjIzQGdtYWlsLmNvbT4NCj4gU2VudDogSnVseSAxNSwg
MjAyNCAyOjMxIFBNDQo+IFRvOiBSYWpuZXNoIEpvc2hpIDxyYWpuZXNoX2pvc2hpQHNmdS5jYT4N
Cj4gQ2M6IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIDMyLWJpdCBSSVNDViBidWlsZCBlcnJvcg0KPg0K
PiBPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCA2OjU54oCvQU0gUmFqbmVzaCBKb3NoaSA8cmFqbmVz
aF9qb3NoaUBzZnUuY2E+IHdyb3RlOg0KPiA+DQo+ID4gSSBhbSByZXNlbmRpbmcgdGhpcyBlbWFp
bCBhcyBCdWlsZHJvb3QgQXV0b21hdGVkIEVtYWlsIHRvbGQgbWUgdGhhdCBJIHdhcyBub3Qgc3Vi
c2NyaWJlZCB0byB0aGUgbWFpbGluZyBsaXN0LCBhbmQgdGhlcmVmb3JlLCBjb3VsZCBub3Qgc2Vu
ZCB0byBpdC4gSSBkb3VibGUtY2hlY2tlZCwgYW5kIEkgYW0gYSBwYXJ0IG9mIHRoZSBtYWlsaW5n
IGxpc3QsIGJ1dCB0aGlzIGVtYWlsIHRlY2huaWNhbGx5IGhhcyB0d28gYWxpYXNlcyBzbyBJIGFk
ZGVkIHRoZSBvdGhlciBvbmUuIExldCdzIHRyeSB0aGlzIGFnYWluLiBTb3JyeSBmb3IgdGhlIGRv
dWJsZSBtZXNzYWdlIGluIGNhc2UuDQo+ID4NCj4gPiBEZWFyIE1haWxpbmcgTGlzdCBSZWFkZXJz
LA0KPiA+DQo+ID4gSSBhbSB0cnlpbmcgdG8gYnVpbGQgYSAzMi1iaXQgTGludXggS2VybmVsIHVz
aW5nIHRoZSB1Y2xpYmMgbGlicmFyeSBmb3IgYSBzb2Z0LWNvcmUgQ1BVLCB1c2luZyBhIGN1c3Rv
bSBMaW51eCBmb3JrLg0KPiA+DQo+ID4gSW4gbXkgLmNvbmZpZywgSSBoYXZlIHRoZSBmb2xsb3dp
bmcgbGluZXM6IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEyPXkgd2hpY2ggSSBiZWxpZXZl
IGlzIHRoZSBwYXRjaCBmb3IgdGhpcyBpc3N1ZSwgYnV0IGl0IGlzIG5vdCB3b3JraW5nIGZvciBz
b21lIHJlYXNvbi4NCj4gPg0KPiA+IEkgYW0gZ2V0dGluZyB0aGUgZm9sbG93aW5nIGVycm9ycyB3
aGVuIEJ1aWxkcm9vdCBjb21wbGV0ZXMgZG93bmxvYWRpbmcgdGhlIExpbnV4IEtlcm5lbCBhbmQg
YmVnaW5zIGJ1aWxkaW5nIHRoZSBMaW51eCBrZXJuZWwuDQo+ID4NCj4gPg0KPiA+DQo+ID4gVG8g
cHJvdmlkZSBtb3JlIGNvbnRleHQsIGhlcmUgaXMgbXkgZGVmY29uZmlnIGZvciB0aGUgImJvYXJk
LiINCj4gPg0KPiA+IEJSMl9yaXNjdj15DQo+ID4gQlIyX3Jpc2N2X2N1c3RvbT15DQo+DQo+IFRo
ZSBwcm9ibGVtIGlzIHRoYXQgeW91IGFyZW4ndCB1c2luZyBSVjMyRywgc28geW91IG5lZWQgdG8g
bWFudWFsbHkNCj4gc2F5IHlvdSBzdXBwb3J0IHRoZSBaaUNzciBhbmQgdGhlIFppZmVuY2VpIGV4
dGVuc2lvbnMuDQo+DQo+IFNlZSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL3Jpc2N2
LWdudS10b29sY2hhaW4vaXNzdWVzLzEyNjINCj4gZm9yIGFuIGV4YW1wbGUgb2YgaG93IHRvIGRv
IHRoaXMuDQo+DQo+IEknbSBub3Qgc3VyZSBob3cgeW91IGNhbiBkbyBpdCB3aXRoIGJ1aWxkcm9v
dCB0aG91Z2guIFlvdSBtaWdodCBuZWVkDQo+IHRvIHBhdGNoIGJ1aWxkcm9vdCB0byBhbGxvdyBz
cGVjaWZ5aW5nIGN1c3RvbSBleHRlbnNpb25zDQo+DQo+IEFsaXN0YWlyDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYnVpbGRyb290IG1haWxpbmcgbGlz
dA0KYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0K

--_000_YT2PR01MB42391898AFDBF1046CB485B2F7AD2YT2PR01MB4239CANP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPkhlbGxvLDwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9
ImF1dG8iPklzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGhlbHAgZ2V0dGluZyB0aGlzIGZp
eGVkL2NoZWNrZWQgb3V0PyBJcyB0aGVyZSBhbiBvZmZpY2lhbCBwbGFjZSBJIHNob3VsZCBzdWJt
aXQgYW4gaXNzdWU/PC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRp
cj0iYXV0byI+SSBndWVzcyBJIGNvdWxkIHRyeSB0byBtYWtlIGEgcGF0Y2ggbXlzZWxmLCB0aG91
Z2gsIHRoYXQgbWlnaHQgdGFrZSBtZSBhIGxpdHRsZSB3aGlsZS48L2Rpdj4NCjxkaXYgZGlyPSJh
dXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5SSjwvZGl2Pg0KPGRpdiBpZD0ibXMt
b3V0bG9vay1tb2JpbGUtc2lnbmF0dXJlIiBkaXI9ImF1dG8iPg0KPGRpdj48YnI+DQo8L2Rpdj4N
CkdldCA8YSBocmVmPSJodHRwczovL2FrYS5tcy9BQWI5eXNnIj5PdXRsb29rIGZvciBBbmRyb2lk
PC9hPjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRh
YmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFj
ZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAw
MDAwMCI+PGI+RnJvbTo8L2I+IFJham5lc2ggSm9zaGkgJmx0O3Jham5lc2hfam9zaGlAc2Z1LmNh
Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBNb25kYXksIEp1bHkgMTUsIDIwMjQgNjo1NDoxMCBQTTxi
cj4NCjxiPlRvOjwvYj4gQWxpc3RhaXIgRnJhbmNpcyAmbHQ7YWxpc3RhaXIyM0BnbWFpbC5jb20m
Z3Q7PGJyPg0KPGI+Q2M6PC9iPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyAmbHQ7YnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbQnVpbGRyb290XSAz
Mi1iaXQgUklTQ1YgYnVpbGQgZXJyb3I8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9kaXY+
DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0eWxlPSJkaXNwbGF5Om5vbmUiPg0KPCEtLQ0KcA0K
CXttYXJnaW4tdG9wOjA7DQoJbWFyZ2luLWJvdHRvbTowfQ0KLS0+DQo8L3N0eWxlPg0KPGRpdiBk
aXI9Imx0ciI+DQo8ZGl2IGNsYXNzPSJ4X2VsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1p
bHk6QXB0b3MsQXB0b3NfRW1iZWRkZWRGb250LEFwdG9zX01TRm9udFNlcnZpY2UsQ2FsaWJyaSxI
ZWx2ZXRpY2Esc2Fucy1zZXJpZjsgZm9udC1zaXplOjEycHQ7IGNvbG9yOnJnYigwLDAsMCkiPg0K
WWVhaCwgaXQgaXMgcmVhbGx5IHN0cmFuZ2UuIEkgaG9wZSBpdCdzIG5vdCB0aGF0IEkgYW0gZG9p
bmcgc29tZXRoaW5nIGluY29ycmVjdGx5Ljxicj4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0i
eF9lbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OkFwdG9zLEFwdG9zX0VtYmVkZGVk
Rm9udCxBcHRvc19NU0ZvbnRTZXJ2aWNlLENhbGlicmksSGVsdmV0aWNhLHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZToxMnB0OyBjb2xvcjpyZ2IoMCwwLDApIj4NClJKPC9kaXY+DQo8ZGl2IGlkPSJ4X2Fw
cGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgdGFiaW5kZXg9Ii0xIiBzdHlsZT0iZGlzcGxheTppbmxp
bmUtYmxvY2s7IHdpZHRoOjk4JSI+DQo8ZGl2IGlkPSJ4X2RpdlJwbHlGd2RNc2ciIGRpcj0ibHRy
Ij48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBjb2xvcj0iIzAwMDAwMCIgc3R5bGU9
ImZvbnQtc2l6ZToxMXB0Ij48Yj5Gcm9tOjwvYj4gYnVpbGRyb290ICZsdDtidWlsZHJvb3QtYm91
bmNlc0BidWlsZHJvb3Qub3JnJmd0OyBvbiBiZWhhbGYgb2YgQWxpc3RhaXIgRnJhbmNpcyAmbHQ7
YWxpc3RhaXIyM0BnbWFpbC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IEp1bHkgMTUsIDIwMjQg
MzoxMSBQTTxicj4NCjxiPlRvOjwvYj4gUmFqbmVzaCBKb3NoaSAmbHQ7cmFqbmVzaF9qb3NoaUBz
ZnUuY2EmZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyAmbHQ7YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbQnVpbGRy
b290XSAzMi1iaXQgUklTQ1YgYnVpbGQgZXJyb3I8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0K
PC9kaXY+DQo8ZGl2IGNsYXNzPSJ4X0JvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXYgY2xhc3M9InhfUGxhaW5UZXh0Ij5PbiBUdWUs
IEp1bCAxNiwgMjAyNCBhdCA3OjQz4oCvQU0gUmFqbmVzaCBKb3NoaSAmbHQ7cmFqbmVzaF9qb3No
aUBzZnUuY2EmZ3Q7IHdyb3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IEhlbGxvIEFsaXN0YWlyLDxi
cj4NCiZndDs8YnI+DQomZ3Q7IEFjY29yZGluZyB0byB0aGlzLCBCdWlsZHJvb3Qgc2hvdWxkIGF1
dG9tYXRpY2FsbHkgYWRkIHRoZSBleHRlbnNpb25zIGlmIHRoZSBnY2MgdmVyc2lvbiBpcyBncmVh
dGVyIHRoYW4gb3IgZXF1YWwgdG8gMTIuMCwgbm8/PGJyPg0KJmd0Ozxicj4NCiZndDsgW1BBVENI
djIsMS8yXSBhcmNoL0NvbmZpZy5pbi5yaXNjdjogZW5hYmxlIFppY3NyIGFuZCBaaWZlbmNlaSBz
dGFuZGFsb25lIGV4dGVuc2lvbnMgd2l0aCBnY2MgJmd0Oz0gMTIgLSBQYXRjaHdvcmsgKG96bGFi
cy5vcmcpPGJyPg0KPGJyPg0KVGhhdCBzaG91bGQgZG8gaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGl0
J3Mgbm90IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uPGJyPg0KPGJyPg0KQWxpc3RhaXI8YnI+DQo8
YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaW5jZXJlbHksPGJyPg0KJmd0Ozxicj4NCiZndDsgUmFqbmVz
aDxicj4NCiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQomZ3Q7IEZy
b206IEFsaXN0YWlyIEZyYW5jaXMgJmx0O2FsaXN0YWlyMjNAZ21haWwuY29tJmd0Ozxicj4NCiZn
dDsgU2VudDogSnVseSAxNSwgMjAyNCAyOjMxIFBNPGJyPg0KJmd0OyBUbzogUmFqbmVzaCBKb3No
aSAmbHQ7cmFqbmVzaF9qb3NoaUBzZnUuY2EmZ3Q7PGJyPg0KJmd0OyBDYzogYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcgJmx0O2J1aWxkcm9vdEBidWlsZHJvb3Qub3JnJmd0Ozxicj4NCiZndDsgU3Vi
amVjdDogUmU6IFtCdWlsZHJvb3RdIDMyLWJpdCBSSVNDViBidWlsZCBlcnJvcjxicj4NCiZndDs8
YnI+DQomZ3Q7IE9uIFR1ZSwgSnVsIDE2LCAyMDI0IGF0IDY6NTnigK9BTSBSYWpuZXNoIEpvc2hp
ICZsdDtyYWpuZXNoX2pvc2hpQHNmdS5jYSZndDsgd3JvdGU6PGJyPg0KJmd0OyAmZ3Q7PGJyPg0K
Jmd0OyAmZ3Q7IEkgYW0gcmVzZW5kaW5nIHRoaXMgZW1haWwgYXMgQnVpbGRyb290IEF1dG9tYXRl
ZCBFbWFpbCB0b2xkIG1lIHRoYXQgSSB3YXMgbm90IHN1YnNjcmliZWQgdG8gdGhlIG1haWxpbmcg
bGlzdCwgYW5kIHRoZXJlZm9yZSwgY291bGQgbm90IHNlbmQgdG8gaXQuIEkgZG91YmxlLWNoZWNr
ZWQsIGFuZCBJIGFtIGEgcGFydCBvZiB0aGUgbWFpbGluZyBsaXN0LCBidXQgdGhpcyBlbWFpbCB0
ZWNobmljYWxseSBoYXMgdHdvIGFsaWFzZXMgc28gSSBhZGRlZA0KIHRoZSBvdGhlciBvbmUuIExl
dCdzIHRyeSB0aGlzIGFnYWluLiBTb3JyeSBmb3IgdGhlIGRvdWJsZSBtZXNzYWdlIGluIGNhc2Uu
PGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IERlYXIgTWFpbGluZyBMaXN0IFJlYWRlcnMs
PGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IEkgYW0gdHJ5aW5nIHRvIGJ1aWxkIGEgMzIt
Yml0IExpbnV4IEtlcm5lbCB1c2luZyB0aGUgdWNsaWJjIGxpYnJhcnkgZm9yIGEgc29mdC1jb3Jl
IENQVSwgdXNpbmcgYSBjdXN0b20gTGludXggZm9yay48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7
ICZndDsgSW4gbXkgLmNvbmZpZywgSSBoYXZlIHRoZSBmb2xsb3dpbmcgbGluZXM6IEJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzEyPXkgd2hpY2ggSSBiZWxpZXZlIGlzIHRoZSBwYXRjaCBmb3Ig
dGhpcyBpc3N1ZSwgYnV0IGl0IGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbi48YnI+DQom
Z3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgSSBhbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3Jz
IHdoZW4gQnVpbGRyb290IGNvbXBsZXRlcyBkb3dubG9hZGluZyB0aGUgTGludXggS2VybmVsIGFu
ZCBiZWdpbnMgYnVpbGRpbmcgdGhlIExpbnV4IGtlcm5lbC48YnI+DQomZ3Q7ICZndDs8YnI+DQom
Z3Q7ICZndDs8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgVG8gcHJvdmlkZSBtb3JlIGNv
bnRleHQsIGhlcmUgaXMgbXkgZGVmY29uZmlnIGZvciB0aGUgJnF1b3Q7Ym9hcmQuJnF1b3Q7PGJy
Pg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IEJSMl9yaXNjdj15PGJyPg0KJmd0OyAmZ3Q7IEJS
Ml9yaXNjdl9jdXN0b209eTxicj4NCiZndDs8YnI+DQomZ3Q7IFRoZSBwcm9ibGVtIGlzIHRoYXQg
eW91IGFyZW4ndCB1c2luZyBSVjMyRywgc28geW91IG5lZWQgdG8gbWFudWFsbHk8YnI+DQomZ3Q7
IHNheSB5b3Ugc3VwcG9ydCB0aGUgWmlDc3IgYW5kIHRoZSBaaWZlbmNlaSBleHRlbnNpb25zLjxi
cj4NCiZndDs8YnI+DQomZ3Q7IFNlZSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
Y29sbGFiL3Jpc2N2LWdudS10b29sY2hhaW4vaXNzdWVzLzEyNjIiPmh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi1jb2xsYWIvcmlzY3YtZ251LXRvb2xjaGFpbi9pc3N1ZXMvMTI2MjwvYT48YnI+DQom
Z3Q7IGZvciBhbiBleGFtcGxlIG9mIGhvdyB0byBkbyB0aGlzLjxicj4NCiZndDs8YnI+DQomZ3Q7
IEknbSBub3Qgc3VyZSBob3cgeW91IGNhbiBkbyBpdCB3aXRoIGJ1aWxkcm9vdCB0aG91Z2guIFlv
dSBtaWdodCBuZWVkPGJyPg0KJmd0OyB0byBwYXRjaCBidWlsZHJvb3QgdG8gYWxsb3cgc3BlY2lm
eWluZyBjdXN0b20gZXh0ZW5zaW9uczxicj4NCiZndDs8YnI+DQomZ3Q7IEFsaXN0YWlyPGJyPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQpidWls
ZHJvb3QgbWFpbGluZyBsaXN0PGJyPg0KYnVpbGRyb290QGJ1aWxkcm9vdC5vcmc8YnI+DQo8YSBo
cmVmPSJodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QiPmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dDwvYT48YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_YT2PR01MB42391898AFDBF1046CB485B2F7AD2YT2PR01MB4239CANP_--

--===============2085303737714187337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2085303737714187337==--
