Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D1BC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 21:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09223606CA;
	Mon, 15 Jul 2024 21:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rO_Y19KXtro; Mon, 15 Jul 2024 21:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C81F960744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81F960744;
	Mon, 15 Jul 2024 21:43:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD7DA1BF398
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B2A810ED
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZudfw2R2Itb for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 21:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c103::3;
 helo=yt6pr01cu002.outbound.protection.outlook.com;
 envelope-from=rajnesh_joshi@sfu.ca; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87CB580572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CB580572
Received: from YT6PR01CU002.outbound.protection.outlook.com
 (mail-canadacentralazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c103::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87CB580572
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXTw4jFGRcw0OrW0XU/5Sz7dFObuFrGvzTGofU46nVGV1Hh/tHe1pSLKZ8JrcGNzvsg3MmdZYfo+i2bw4KTyNfi2k1m7uasqFvMysWJ9Go0zBU4UgigQI6KCdNJA0+nLaeUZL8Kskmygo4pPYEiR/daMNdQ6DkyO6GwYMKkB6cUhyZ0oV77kNurJfLwoq7Yacx06jmcZk8XyI0LmZtiYTipGmDdm3XeJ5VroXUgG5JWpnLgqSnmIY/YAxeVmofK5DMvjc0XZysdjkVLu0drp+V7NGZNYS3mK/27nplkEmzJxQZAWs9YL02QOxIPX9VhJVlTYzPTbWbYDDufVsJw4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM8omDmfR2Oa2lDF+zMxiSCCCWIw1iCkCPWYrBFweiY=;
 b=WcG+Kibnov7KqxvpeGev3jQIynTqdepJukimAnXEW+kNa5Ob0XTlIJKy3paHd5UB7aXWiTUNEyC0AhIauwmGkfgqaYVr60bGxp4kDbpckl8RKbEtp5PiTeNUwkjUOQbMZ//uEObB2kVExp3qdRo90ZyTNrcGxdcF+SSH8J9tpLvjSCrCjoOUfFXWF+bsISLCG76fFxYV00TsGh5SeqKxwQi+DRXiajBlsYGgkzqocoPYo9DWhD3yLKER9n+6qtAk0Jz6T7tIESglXpJokfMCqKeGj6uY6e7unWYAMP6L51gNJBFrbpIRRipwp590Dwlbfy/MO7/dkkSKQ/36e8llBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sfu.ca; dmarc=pass action=none header.from=sfu.ca; dkim=pass
 header.d=sfu.ca; arc=none
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:37::15)
 by YT2PR01MB10228.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 21:43:19 +0000
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa]) by YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 21:43:19 +0000
From: Rajnesh Joshi <rajnesh_joshi@sfu.ca>
To: Alistair Francis <alistair23@gmail.com>
Thread-Topic: [Buildroot] 32-bit RISCV build error
Thread-Index: AQHa1vluoteKe1/LJUyB8eqbTYOwrLH4TsoAgAAC36g=
Date: Mon, 15 Jul 2024 21:43:19 +0000
Message-ID: <YT2PR01MB4239F24C075D994E5746EB30F7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
In-Reply-To: <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB4239:EE_|YT2PR01MB10228:EE_
x-ms-office365-filtering-correlation-id: 51b239b2-1ed1-46c2-4572-08dca51724ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z2R1TDdMdWZHYkF5dzFZdHdveTFtcUFCVGVzdytLTHNtM3NJK2EzYjcyTk9k?=
 =?utf-8?B?bDIwVHIyTkNIWnFRWEhnNlgrd2IvZzJ2MEcvOFVLaTR4MGFwOG9yS2M5NTNm?=
 =?utf-8?B?VmtLY1RjcEJIOUdQSkROUk9RVmVsenF2bW51TmFnZU5yajI2YnpRdmdYNitO?=
 =?utf-8?B?a2hWZW5aR21vS0xIUzNXV3NEemtja0s2dTNiM3FScVptYzhjQlFEYUxWUmZN?=
 =?utf-8?B?bG9UdFVsY2YzR0JjeUU3a0F4UE4rWEF5VmxZVER3T01VYjhIYUxKUENxMFVO?=
 =?utf-8?B?YitIUFNDL2hIc1pzeHVGSnRFTjljcHRJNktQalhyR3d5R1dEQnVTcTlLcGJS?=
 =?utf-8?B?QzVnZjlRSjZCb1NzYnEyNGg0cnFIVFM4MzAvUEJoeEM3WTgzc2Z2dEcwWmNn?=
 =?utf-8?B?WnNibnh2N1JuZ2tpNzVQVm5ZT3ZDQkRIblJtOHJtQnNJK3NGKzFjM01vd1F1?=
 =?utf-8?B?bHdVNkZPS3ZxakY3dERiWGJJUnI2S2lxVmZ6UjlQYWZqa1pFZE1BUTFqNnpH?=
 =?utf-8?B?NTQyNXNmb3UyUGpzSDZ2UzZFbWhSRTcyTkZTdS9KM0d0RWUydXRLMExwamtL?=
 =?utf-8?B?MThGVVFVUVEzUExXS2lOSkhjUytxcUYyU2M3dVRMMFJLRzVhMEFDTEN0a3VN?=
 =?utf-8?B?UjJseDlrdHQybkhWVHpBTGlZMnplenBVc3JiK0pXazcrMURaeDhndXJlcGRK?=
 =?utf-8?B?b1ltRERWUGRDcXRBQVZMOWRvOVhZaGtmM1pXMzc3UVZBQzF4eE1YdjNUREpv?=
 =?utf-8?B?Y2gyUXh0UWwwdmxzNmJyMS9pS00zenlwcUQ5bTIzZHVNYTZ6SWJMVXcvai9t?=
 =?utf-8?B?VU5ZeDJYRXhoZWRGSlFudzFlYmkzQjZmOFhLSzNqZmtrZkNZa3RmMjA2UVBp?=
 =?utf-8?B?eHd1WXhyUkx4RWdpazdkVVZ0dVRQRnZSTEhZVDZqU0p2YWxON2RRWlRyR3dt?=
 =?utf-8?B?dnBtKy9IWGE4c3N5dXJnUVcvMVdiazZlaHJjVis0WVdoVEdSaEhQSTZVZnBL?=
 =?utf-8?B?SnpoWW5WYmlKMVc1TU1UVHVORDRnRk43K0Qwd0p4VEIwVkJnMUpIbGNHQ0tq?=
 =?utf-8?B?Mlg0cnh2MkVoUXRWZ0JORm5NYUd4akJRQ1hHdm5DNlhnZ0tVZnlCaUtOc2hK?=
 =?utf-8?B?bmxzSEpKWVE2U1RJVkYwWkdwRmliNjJ5T3lzOVY1VFJoOUFaaHVLNjlTTmVz?=
 =?utf-8?B?R0tKYnhma0ZlTzF4dWZNYW90RUkrdmhFVWQ5eklzcFhUb01uQ09JRk51NWs3?=
 =?utf-8?B?YVpmTVA3cVp5UHpZcFJwZytjZ2NJQjI0Q3pHcFBNUFlQSURhVWxBVnMyd09h?=
 =?utf-8?B?TFZJVzVNUjdDTHdQWlpVVDgxQlNOcE9WbU54Q2llelBDeG9mOE0vbzBwbGdL?=
 =?utf-8?B?d1ByQitpR0NZWWtPSzAvMmcrQXNNMWU1bjRnT1VDczBtWlo2UldlTmFkRlNp?=
 =?utf-8?B?cnp2SGh6RTVVY1Yxd2MzQjUrWksvQjUxWUpDTkRoWU9ETVpRZ0d3SjJtWkQ0?=
 =?utf-8?B?a1U1VElGOGF1UFNnem9QZkQ5dGN3MEZEQ2gyQ1F3T3RzTGxkREovYnZ6T0NB?=
 =?utf-8?B?ZGlvdnViUGRnODd0bHp2TVc5UVhkUDVzZFY0dlV2WkljR3RTbW40L0llYmJS?=
 =?utf-8?B?eHNmSXQxUG5MbDAwcFNoOFpvMTFsZy9ST2V1dlJKT3VZQ1VvNlFFQ0ZXRklO?=
 =?utf-8?B?aWtBWjdubDYxQ2YzeGhVcHdMZUVLTC9uWXl1bkF3U0VuQVFsbHl5Tzd2Y0Mz?=
 =?utf-8?B?RVF6TGUxbnRsdHNMWFRJMEhVNzVzYkVZMnkzVGJWMXozbjh1Y2NzN2FvUklL?=
 =?utf-8?Q?FIKs0Y/lP218CNuoSzmTh/bs9wbTv2GnqfbJc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmZ3VHpLaTBUamVJSnFRQ1F2NFZDOVJGZzl0VnBFTzlISHdyQmNzQ3FsR0RM?=
 =?utf-8?B?ampGd1IvZTJCSDJRN3k2bjhkc3NpRS80SG9DaWpmSHBjeGw1eHgzT012ZEhR?=
 =?utf-8?B?YzlaOVhTeC9wUnUyNHJEdEx6b2xneHlEY1Rya1ZYMm5kdEtIN1Rma0ltemlo?=
 =?utf-8?B?MTd3MjhxZmlBczBqZHpuUWF4K2NFWWl3ZTRkeDEwV0xrcFM0ZVVZVXJtaERH?=
 =?utf-8?B?YWJZa2taUVo1Vm9GZDYyUXVNTFA4Y1ZLSmI5ZWQyeHBoQzQ4L2JJcFExMUM4?=
 =?utf-8?B?R1NYencvRkE2bnFYSTllckc0Wll1SGlsWW16ZzB2eHlGTEU2dVBRY2M0aFdM?=
 =?utf-8?B?SFJDa2dFdzVnaTlOb1Fxb0NLeTlpUWVOdWs1SWxuWTN3MG5aU3lBczZxUTBG?=
 =?utf-8?B?Q3hOd0x0a3dLcFVzV0NBcU92ZmpwNmdxZmJEWEI1QVV3K0FjRHhCdzkwTXlS?=
 =?utf-8?B?c1NackYwek9uNlNoVXdiMUNhVG5hYTlGSlArSjVkWldzWDhFR29zY1BwTVJn?=
 =?utf-8?B?TjBEU00vdUZCV1QwSEZwSll3dkJFY3paVlV4aXJtM2U3bFRRZ0pWMXh3TWRV?=
 =?utf-8?B?ZzQ2NWYvSlVpb1JaRFlWdFJMVVphL0kyL2ZJb2dHVzFyTlM2Y3lQVXl5eW11?=
 =?utf-8?B?OFVGajR0bytyK1BVaFJpdENaeEl5YldDd09pUStQV1RCZ2lET2g1TjBGK3FW?=
 =?utf-8?B?VGcxa0RxR2JkUzA5OWtLdDZGVisvbkJsUWMvbFFsaEk1bG5HN2Zsb0FaSjBi?=
 =?utf-8?B?UkZMOXFpekpCTk1XM3BrQTd2Z0t0cmtIWHU3Q1h0SzMvN002YkdVNGhLUmIr?=
 =?utf-8?B?U0RZTGdOYVFYWURSd2FQZHJYb1VtcndUWTN2bGdHWUNLamtENk1JNTJwWEZW?=
 =?utf-8?B?VTVvM2o4S3k3YXBxUzF1VU45WVRnZjlaUSt6cXpVeXpGY2ZSTllTcmVjSDZ6?=
 =?utf-8?B?bUFXL0MxSkFjTDhYWkQ2T2ZFdm5mM2dQRHFtWkdIK1V0UmhTNGN1Qy9Eb0M1?=
 =?utf-8?B?YkhvYTk2RUc0R2hJems3VlZudGFpRHFqM1lvQm5lblNOVk1RZHptR1FObThm?=
 =?utf-8?B?WWhhUDJuK3Q4Z1ArTnUxYlduUHprWGhyVzU2OTBWWEhjRHk0SnFaQ3FkdHF1?=
 =?utf-8?B?SCttaFlpMkN2RjNnMytFN3JmbFcydzNGc1ZNaHZqUTZ6Y2JUVzJRclV6dUpZ?=
 =?utf-8?B?dHlNRFVuMjBjUHB1Tjl1YTg2M2lmQjJJVGMwY3laamFLUXBMUmxueGNhYStW?=
 =?utf-8?B?dXlDWGhQUXBNRy9qbEYwZExSMzRVTDVQRThCeHBORDlxSTNGK2wxZm5wZDd6?=
 =?utf-8?B?cG9rNDlMZ0ZDVDlLWE0rZ3JTOHRKbFhnRHpUcGN0d1Y5S2I4YXNMZWVOcHpz?=
 =?utf-8?B?Zktob05pWHZ4aFN1NUJkdEtWaGFnSGtUOEZtZFllbEQ5TlFCNXo1bHNncUFV?=
 =?utf-8?B?eFllKzM4QzBHNklQanJjTWFGK1B4RG1QSVUveHF6c21TM0dNamVDT3llQlpD?=
 =?utf-8?B?bDYydEdITEViKy9FYW5ZVFZyR1RPMVJ4L1NDazdjVDBaYmIvcWxRck5Db0Vm?=
 =?utf-8?B?UC9hWGpwU2F3UWpIalo1NXlhR1RHNXlISnV5VU5sQU1rRXpzSHJUT2lYY0Yy?=
 =?utf-8?B?dG8yUW81VUVsREl6Mms5cHAzU01PRFRrK3ljbGtJMWRseXhUNEtGUkJVSG13?=
 =?utf-8?B?WXpiQUErY2Zza0R5R21pQlZFZ2U0ejY1OXhWdnN3RG4ybEYwbCtpam8zT01I?=
 =?utf-8?B?LzByVFNrSTF3STVrckVpSlF0MEpGVGVubzlxYm1BNFBBV1RxLzJFMFdCUWVW?=
 =?utf-8?B?ei9xNmVRT2V1TEphMVJDMFpYdS9xRnhlWWErb3F4ZkJYZXRZemFQRG5SOExL?=
 =?utf-8?B?RzNkS1hFRktyUGxNRTd0bzhCa1g5Uy9EaTVsOS9DWXBobm5QK01pbyt3NjBE?=
 =?utf-8?B?VHBTYVFsbUU3QjhmS2M1Y0pTbk1Yc0IzTk5xWUNFMXdVM3YxaDB4cUt4QXZW?=
 =?utf-8?B?TnBEbzZCOFRoSUhPYk8vZng4a2g4YWhyVm5ua2VvQ0FIYzVnc1c1MXVYclB3?=
 =?utf-8?B?Y2NzdzF3THNBNWVjdkZJZmh2VGtJQVZkdVRES3p3cVE1M1hYUWRaWk4ydG9k?=
 =?utf-8?Q?pZ7g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sfu.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b239b2-1ed1-46c2-4572-08dca51724ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 21:43:19.7952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e8677e-c989-47b9-8619-d83d5a5f6c67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Nd7bvySATJXf0rTSSEmNge43I+gw38CZb51+mYWHQtwBhRpo7dMSLONntn35cwp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10228
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sfu.ca; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM8omDmfR2Oa2lDF+zMxiSCCCWIw1iCkCPWYrBFweiY=;
 b=ImN6FnKtJJfu7KOC61lwA7cpdsG5OBykk19oKPaJUasEHNlZAH0D+Nm3pfasFsb1VJHUgQJZBZHsCl2sJzRphaoe5JUPlYV2mIpWLENVmMPCkjtkI6pSQDDqp7oxkteh5pgS5pDoorg1PDtYrWqdKYsTozRLYSLwhMzmDJmM0jebbhiAo/ex9md8ao4F9jYka552tYcAsG9hPMKaTjz/Py1i8Y28u/HsVrABIWPWBKj6H/EGiiiUel7KybrWYNUS81BLRR2o6VzHInp6rchEoBaU69Oaln1jk0gBo/0jYco45qYQEtPFU+YCsIRzd/dgcts6isPaZUe9lUgf5CSJXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sfu.ca
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sfu.ca header.i=@sfu.ca header.a=rsa-sha256
 header.s=selector2 header.b=ImN6FnKt
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
Content-Type: multipart/mixed; boundary="===============1182214864837899252=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1182214864837899252==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_YT2PR01MB4239F24C075D994E5746EB30F7A12YT2PR01MB4239CANP_"

--_000_YT2PR01MB4239F24C075D994E5746EB30F7A12YT2PR01MB4239CANP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQWxpc3RhaXIsDQoNCkFjY29yZGluZyB0byB0aGlzLCBCdWlsZHJvb3Qgc2hvdWxkIGF1
dG9tYXRpY2FsbHkgYWRkIHRoZSBleHRlbnNpb25zIGlmIHRoZSBnY2MgdmVyc2lvbiBpcyBncmVh
dGVyIHRoYW4gb3IgZXF1YWwgdG8gMTIuMCwgbm8/DQoNCltQQVRDSHYyLDEvMl0gYXJjaC9Db25m
aWcuaW4ucmlzY3Y6IGVuYWJsZSBaaWNzciBhbmQgWmlmZW5jZWkgc3RhbmRhbG9uZSBleHRlbnNp
b25zIHdpdGggZ2NjID49IDEyIC0gUGF0Y2h3b3JrIChvemxhYnMub3JnKTxodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNzIzMTMzNTI1LjI3
OTgxOS0xLXJvbWFpbi5uYW91ckBzbWlsZS5mci8+DQoNClNpbmNlcmVseSwNCg0KUmFqbmVzaA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IEFsaXN0YWlyIEZyYW5jaXMg
PGFsaXN0YWlyMjNAZ21haWwuY29tPg0KU2VudDogSnVseSAxNSwgMjAyNCAyOjMxIFBNDQpUbzog
UmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9qb3NoaUBzZnUuY2E+DQpDYzogYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg0KU3ViamVjdDogUmU6IFtCdWlsZHJv
b3RdIDMyLWJpdCBSSVNDViBidWlsZCBlcnJvcg0KDQpPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCA2
OjU54oCvQU0gUmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9qb3NoaUBzZnUuY2E+IHdyb3RlOg0KPg0K
PiBJIGFtIHJlc2VuZGluZyB0aGlzIGVtYWlsIGFzIEJ1aWxkcm9vdCBBdXRvbWF0ZWQgRW1haWwg
dG9sZCBtZSB0aGF0IEkgd2FzIG5vdCBzdWJzY3JpYmVkIHRvIHRoZSBtYWlsaW5nIGxpc3QsIGFu
ZCB0aGVyZWZvcmUsIGNvdWxkIG5vdCBzZW5kIHRvIGl0LiBJIGRvdWJsZS1jaGVja2VkLCBhbmQg
SSBhbSBhIHBhcnQgb2YgdGhlIG1haWxpbmcgbGlzdCwgYnV0IHRoaXMgZW1haWwgdGVjaG5pY2Fs
bHkgaGFzIHR3byBhbGlhc2VzIHNvIEkgYWRkZWQgdGhlIG90aGVyIG9uZS4gTGV0J3MgdHJ5IHRo
aXMgYWdhaW4uIFNvcnJ5IGZvciB0aGUgZG91YmxlIG1lc3NhZ2UgaW4gY2FzZS4NCj4NCj4gRGVh
ciBNYWlsaW5nIExpc3QgUmVhZGVycywNCj4NCj4gSSBhbSB0cnlpbmcgdG8gYnVpbGQgYSAzMi1i
aXQgTGludXggS2VybmVsIHVzaW5nIHRoZSB1Y2xpYmMgbGlicmFyeSBmb3IgYSBzb2Z0LWNvcmUg
Q1BVLCB1c2luZyBhIGN1c3RvbSBMaW51eCBmb3JrLg0KPg0KPiBJbiBteSAuY29uZmlnLCBJIGhh
dmUgdGhlIGZvbGxvd2luZyBsaW5lczogQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTI9eSB3
aGljaCBJIGJlbGlldmUgaXMgdGhlIHBhdGNoIGZvciB0aGlzIGlzc3VlLCBidXQgaXQgaXMgbm90
IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uLg0KPg0KPiBJIGFtIGdldHRpbmcgdGhlIGZvbGxvd2lu
ZyBlcnJvcnMgd2hlbiBCdWlsZHJvb3QgY29tcGxldGVzIGRvd25sb2FkaW5nIHRoZSBMaW51eCBL
ZXJuZWwgYW5kIGJlZ2lucyBidWlsZGluZyB0aGUgTGludXgga2VybmVsLg0KPg0KPg0KPg0KPiBU
byBwcm92aWRlIG1vcmUgY29udGV4dCwgaGVyZSBpcyBteSBkZWZjb25maWcgZm9yIHRoZSAiYm9h
cmQuIg0KPg0KPiBCUjJfcmlzY3Y9eQ0KPiBCUjJfcmlzY3ZfY3VzdG9tPXkNCg0KVGhlIHByb2Js
ZW0gaXMgdGhhdCB5b3UgYXJlbid0IHVzaW5nIFJWMzJHLCBzbyB5b3UgbmVlZCB0byBtYW51YWxs
eQ0Kc2F5IHlvdSBzdXBwb3J0IHRoZSBaaUNzciBhbmQgdGhlIFppZmVuY2VpIGV4dGVuc2lvbnMu
DQoNClNlZSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL3Jpc2N2LWdudS10b29sY2hh
aW4vaXNzdWVzLzEyNjINCmZvciBhbiBleGFtcGxlIG9mIGhvdyB0byBkbyB0aGlzLg0KDQpJJ20g
bm90IHN1cmUgaG93IHlvdSBjYW4gZG8gaXQgd2l0aCBidWlsZHJvb3QgdGhvdWdoLiBZb3UgbWln
aHQgbmVlZA0KdG8gcGF0Y2ggYnVpbGRyb290IHRvIGFsbG93IHNwZWNpZnlpbmcgY3VzdG9tIGV4
dGVuc2lvbnMNCg0KQWxpc3RhaXINCg==

--_000_YT2PR01MB4239F24C075D994E5746EB30F7A12YT2PR01MB4239CANP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIZWxsbyBBbGlzdGFpciw8YnI+DQo8YnI+DQpB
Y2NvcmRpbmcgdG8gdGhpcywgQnVpbGRyb290IHNob3VsZCBhdXRvbWF0aWNhbGx5IGFkZCB0aGUg
ZXh0ZW5zaW9ucyBpZiB0aGUgZ2NjIHZlcnNpb24gaXMgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRv
IDEyLjAsIG5vPzxicj4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2Yi
IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxhIGhyZWY9Imh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA3MjMxMzM1MjUuMjc5ODE5LTEt
cm9tYWluLm5hb3VyQHNtaWxlLmZyLyIgaWQ9Ik9XQTVlODBhMmFjLTcyYjQtZjdlZC0wNDU0LTQw
ZmJkZGM4ZDc1YSIgY2xhc3M9Ik9XQUF1dG9MaW5rIj5bUEFUQ0h2MiwxLzJdIGFyY2gvQ29uZmln
LmluLnJpc2N2OiBlbmFibGUgWmljc3IgYW5kIFppZmVuY2VpIHN0YW5kYWxvbmUgZXh0ZW5zaW9u
cw0KIHdpdGggZ2NjICZndDs9IDEyIC0gUGF0Y2h3b3JrIChvemxhYnMub3JnKTwvYT48YnI+DQo8
YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGli
cmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQpTaW5jZXJlbHksPGJyPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250
LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KUmFqbmVzaDwvZGl2Pg0KPGRp
diBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxv
Y2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPg0KPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGly
PSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250LXNpemU6
MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBBbGlzdGFpciBGcmFuY2lzICZsdDth
bGlzdGFpcjIzQGdtYWlsLmNvbSZndDs8YnI+DQo8Yj5TZW50OjwvYj4gSnVseSAxNSwgMjAyNCAy
OjMxIFBNPGJyPg0KPGI+VG86PC9iPiBSYWpuZXNoIEpvc2hpICZsdDtyYWpuZXNoX2pvc2hpQHNm
dS5jYSZndDs8YnI+DQo8Yj5DYzo8L2I+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnICZsdDtidWls
ZHJvb3RAYnVpbGRyb290Lm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtCdWlsZHJv
b3RdIDMyLWJpdCBSSVNDViBidWlsZCBlcnJvcjwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8
L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPk9uIFR1ZSwgSnVs
IDE2LCAyMDI0IGF0IDY6NTnigK9BTSBSYWpuZXNoIEpvc2hpICZsdDtyYWpuZXNoX2pvc2hpQHNm
dS5jYSZndDsgd3JvdGU6PGJyPg0KJmd0Ozxicj4NCiZndDsgSSBhbSByZXNlbmRpbmcgdGhpcyBl
bWFpbCBhcyBCdWlsZHJvb3QgQXV0b21hdGVkIEVtYWlsIHRvbGQgbWUgdGhhdCBJIHdhcyBub3Qg
c3Vic2NyaWJlZCB0byB0aGUgbWFpbGluZyBsaXN0LCBhbmQgdGhlcmVmb3JlLCBjb3VsZCBub3Qg
c2VuZCB0byBpdC4gSSBkb3VibGUtY2hlY2tlZCwgYW5kIEkgYW0gYSBwYXJ0IG9mIHRoZSBtYWls
aW5nIGxpc3QsIGJ1dCB0aGlzIGVtYWlsIHRlY2huaWNhbGx5IGhhcyB0d28gYWxpYXNlcyBzbyBJ
IGFkZGVkDQogdGhlIG90aGVyIG9uZS4gTGV0J3MgdHJ5IHRoaXMgYWdhaW4uIFNvcnJ5IGZvciB0
aGUgZG91YmxlIG1lc3NhZ2UgaW4gY2FzZS48YnI+DQomZ3Q7PGJyPg0KJmd0OyBEZWFyIE1haWxp
bmcgTGlzdCBSZWFkZXJzLDxicj4NCiZndDs8YnI+DQomZ3Q7IEkgYW0gdHJ5aW5nIHRvIGJ1aWxk
IGEgMzItYml0IExpbnV4IEtlcm5lbCB1c2luZyB0aGUgdWNsaWJjIGxpYnJhcnkgZm9yIGEgc29m
dC1jb3JlIENQVSwgdXNpbmcgYSBjdXN0b20gTGludXggZm9yay48YnI+DQomZ3Q7PGJyPg0KJmd0
OyBJbiBteSAuY29uZmlnLCBJIGhhdmUgdGhlIGZvbGxvd2luZyBsaW5lczogQlIyX1RPT0xDSEFJ
Tl9HQ0NfQVRfTEVBU1RfMTI9eSB3aGljaCBJIGJlbGlldmUgaXMgdGhlIHBhdGNoIGZvciB0aGlz
IGlzc3VlLCBidXQgaXQgaXMgbm90IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uLjxicj4NCiZndDs8
YnI+DQomZ3Q7IEkgYW0gZ2V0dGluZyB0aGUgZm9sbG93aW5nIGVycm9ycyB3aGVuIEJ1aWxkcm9v
dCBjb21wbGV0ZXMgZG93bmxvYWRpbmcgdGhlIExpbnV4IEtlcm5lbCBhbmQgYmVnaW5zIGJ1aWxk
aW5nIHRoZSBMaW51eCBrZXJuZWwuPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0K
Jmd0OyBUbyBwcm92aWRlIG1vcmUgY29udGV4dCwgaGVyZSBpcyBteSBkZWZjb25maWcgZm9yIHRo
ZSAmcXVvdDtib2FyZC4mcXVvdDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBCUjJfcmlzY3Y9eTxicj4N
CiZndDsgQlIyX3Jpc2N2X2N1c3RvbT15PGJyPg0KPGJyPg0KVGhlIHByb2JsZW0gaXMgdGhhdCB5
b3UgYXJlbid0IHVzaW5nIFJWMzJHLCBzbyB5b3UgbmVlZCB0byBtYW51YWxseTxicj4NCnNheSB5
b3Ugc3VwcG9ydCB0aGUgWmlDc3IgYW5kIHRoZSBaaWZlbmNlaSBleHRlbnNpb25zLjxicj4NCjxi
cj4NClNlZSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL3Jpc2N2LWdu
dS10b29sY2hhaW4vaXNzdWVzLzEyNjIiPmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1jb2xsYWIv
cmlzY3YtZ251LXRvb2xjaGFpbi9pc3N1ZXMvMTI2MjwvYT48YnI+DQpmb3IgYW4gZXhhbXBsZSBv
ZiBob3cgdG8gZG8gdGhpcy48YnI+DQo8YnI+DQpJJ20gbm90IHN1cmUgaG93IHlvdSBjYW4gZG8g
aXQgd2l0aCBidWlsZHJvb3QgdGhvdWdoLiBZb3UgbWlnaHQgbmVlZDxicj4NCnRvIHBhdGNoIGJ1
aWxkcm9vdCB0byBhbGxvdyBzcGVjaWZ5aW5nIGN1c3RvbSBleHRlbnNpb25zPGJyPg0KPGJyPg0K
QWxpc3RhaXI8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_YT2PR01MB4239F24C075D994E5746EB30F7A12YT2PR01MB4239CANP_--

--===============1182214864837899252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1182214864837899252==--
