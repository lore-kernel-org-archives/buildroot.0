Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53D9C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 01:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAAF440154;
	Tue, 16 Jul 2024 01:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecLDcj3PVoYv; Tue, 16 Jul 2024 01:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F28C24092B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28C24092B;
	Tue, 16 Jul 2024 01:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC2A81BF476
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 01:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E19DB810BE
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 01:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh94zK56XNq2 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 01:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c103::;
 helo=yt3pr01cu008.outbound.protection.outlook.com;
 envelope-from=rajnesh_joshi@sfu.ca; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83659810B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83659810B7
Received: from YT3PR01CU008.outbound.protection.outlook.com
 (mail-canadacentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c103::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83659810B7
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 01:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT4I+FuD0Hf/wpUK1ZWWJ2S6EcpfEbmEb/3gYJVMdmBcNO7dLvFhifQve6AcwvANe2TNbQj8IR8Mb2p8huaLgoBhSYa6EIV931W1xoYpsgNe6lIsWWlrF7IOEb+HAbQW6i9cb75gKvnrSKTCiOx0/kALBdaMM6evqO54ONEauaoW/2rHKORVcRr/uTBqRCB48hiC4NdagMPOosRfqjFMosIfFFTz5gL8Pbla1ff0VGxJxz4lstdCLSong+eLiPKcDJiB2PyS32XglgTrhSJPx4kzn8f2Nq7NR5401kKdW3xNty3Jt31ai3Tra/K8gIsNXvwZ3c6ln21FJstwX9BUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhBo240F/pvr4W16KcabxweuJOKZiHRvSYnZbkwYYk0=;
 b=m80w8cJaIgVfzGtFp01XshDNkkID/fKHuK1AW7PK4KmFGzGg4423YqH8kGgH0JgySP+jxsnMPbDxnprIfPltrhEjO/JusQiOdOeEbZ/eZtAkmyCIKD3MGr537grkdWUJGOeQClUBr7eMKXb7N/iANLs2ZlHtyfiNDU+/pgV57hDldb5ipx7POYuqDiXFkgmjINUOb1AyRIhHnv/6n1pOKxinKnbge0n5BQ5hxoT54Jvp7w761z9Y0OSNa5hxZlupy5tIz55fHUtHIEGyQbRRy0KYqG9kelUxJkIZiJ5Np/+mIMtHxE+Fp6PBg7YTg0E5DA6CFDzdKxrosOg8G5+u3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sfu.ca; dmarc=pass action=none header.from=sfu.ca; dkim=pass
 header.d=sfu.ca; arc=none
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:37::15)
 by YT2PR01MB8167.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 01:54:10 +0000
Received: from YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa]) by YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ed44:6e70:3ada:98aa%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 01:54:10 +0000
From: Rajnesh Joshi <rajnesh_joshi@sfu.ca>
To: Alistair Francis <alistair23@gmail.com>
Thread-Topic: [Buildroot] 32-bit RISCV build error
Thread-Index: AQHa1vluoteKe1/LJUyB8eqbTYOwrLH4TsoAgAAC36iAAAhkAIAAPeMy
Date: Tue, 16 Jul 2024 01:54:10 +0000
Message-ID: <YT2PR01MB4239F514BF394397441DAD1BF7A22@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
 <YT2PR01MB4239F24C075D994E5746EB30F7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKP8LMKA72nc8MKws_Zar1BpwS7Yju2bjamLfyY6Z64VSw@mail.gmail.com>
In-Reply-To: <CAKmqyKP8LMKA72nc8MKws_Zar1BpwS7Yju2bjamLfyY6Z64VSw@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB4239:EE_|YT2PR01MB8167:EE_
x-ms-office365-filtering-correlation-id: bd1d0c2d-dd74-4717-331c-08dca53a2fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2lWM1pGbjB6d3dRWFA4d0cySzVvbS8waUlBUFFCQ3haWVVEbTVKc0JKU0Vl?=
 =?utf-8?B?Nmo0K3BIeEN1WXJjUFBnSG1uUVNwZ2ZDTHcxY2ZjOGxTSGZvVDhLblNEKzJy?=
 =?utf-8?B?TnduSkxHNU5XRE5rTlIxNXpBT21qNkpVbzR6ZEVKd2hHYkxVRFNIbHcreG84?=
 =?utf-8?B?R1ljM09oNXoyQk5hRWQxNWRndThYeXlhcVduUWZYOWhPN01HSUpzZGNxZ0dP?=
 =?utf-8?B?VkFYZENyZGdHOWY0bWd1a25wMmJEQ0VUVlBKelYyWS9vb2l0eGVBd1ZvYzRJ?=
 =?utf-8?B?VUtESlYwdmJSOGJCWHhuZ2djd2FPYlVlN2MyOXBmblo5dk9VL2Ryb0R5NHAx?=
 =?utf-8?B?OXJnSVExRFc4bkpVbjl5L2lhVVkwS0k4ZzlNczBBVVhXL0orbE1zc0tRYllC?=
 =?utf-8?B?U2dhWEFkZHdkRkNSNnlTMkgyUzlkUnh5cnY3ZHNBb3p3M1VGTWhJeGRNa3R5?=
 =?utf-8?B?THB3NWg5YitMR0UvYktKOWFCZTlTeUtqZGZPb2hsWkVyV2N6R1ZEVXJsQlF6?=
 =?utf-8?B?VEdRK3g2REE3TTc4dVJiYXpmcGhKdlVsUGQ3ZXZrK1JpZXNQWXBiaHZTYmFh?=
 =?utf-8?B?WTNJNy8wVUs0WU95NCtiVlJ5V0NkQ3dEMnRYa21ERVV3QVBTRXpRVzZOWUor?=
 =?utf-8?B?NytZZXgzcEY2dzBFYVJKN3d3UlFXK3ozV1l1M3BsdERVZlFBWDRaWTc2OGxG?=
 =?utf-8?B?b0NNa0RmeE45S1YyeXlUOUV2SWFMVmVGRERuZEhPclB6SE1nTTFNQlp6d0Jq?=
 =?utf-8?B?SEQyVEhLeHAvSXBEUDYzQk9jZWduRkU3dFEwajNVNmpLTUlhVThCaWJ2OFM4?=
 =?utf-8?B?b0ZSTW5PcDV4dUtwN1JhaDYxbzRoVmN2U0gvbUxLWTFFbkJ0b2wvRkUydUIv?=
 =?utf-8?B?d2V2ckovV3lORHBYcGdjTFZYbk5KS04vbTdhcXZ6OTJ2YndYTVZtTG9MWm00?=
 =?utf-8?B?c0RSQUo1NkZSbzM2NGFHejVzT0x0eHUvaWI2dTNCcXFnZ1hOa2pmc1BneTYy?=
 =?utf-8?B?UlI4WUIrRzRpMkllQUUrYTVidlNFaWNqZzUwNVhkelRmZzk0c2xML1lGQ0ox?=
 =?utf-8?B?N3ZrRDRGcXV0QThMaldKT1dWMVZFaU5EcnMwRW1sZjdFVGRUL2cwZlVKNE5H?=
 =?utf-8?B?YTcrL200WW1aTzZ5VWM4dmtsRWtKeG5jUnMyUkJQMnM3MStGNWF3L01HV1pS?=
 =?utf-8?B?T2M0WXV2TC81aTg2YjliSks5THBkcnBFbmIxSHA2MTZzWWZMcHQ5UVhlaS8w?=
 =?utf-8?B?ZzBEMDFwQzN0Y1FqdFQ5SFRJRExjdnpWSHRMeUdvZjBza0RYdE5lbW1wMlA0?=
 =?utf-8?B?SmVJNEVmTDY0WmMrTEtMYjBKOXNLRHQvelFINmt3TXBGOGJncDlFQzVxQmZJ?=
 =?utf-8?B?WGpjd2xTZVNjT3V4c0tiS0pHWlNCVWdnY3pGZ2pkOTlPc09BVEZWbmVKOGpw?=
 =?utf-8?B?cWVRM2FvbWhUTms2bzRlai9wQi8xakVaNVRZV01ieGN2cnZ5WHhTVURRMWI4?=
 =?utf-8?B?RHU0SjB0anFMaXZxS2ducnBMMGQ5cGFtQThZMVlHSi9QTVJwVXFvdjR0R2NX?=
 =?utf-8?B?Q3luMjhvMVlMZXQzTDJMU3dZVzlLY1Q2UmljcG9aQ2J1UTI3Z3FpMnRkRkpk?=
 =?utf-8?B?c3FuRmtMNmFYamNFMnVWV1hKdXFyb3hUdW9hVHM3eTBRNU5zdVIwaTVsdTV0?=
 =?utf-8?B?SzIyTXhBM2dRaGc5ek1oZy8zWGJGODN6VTFsUmVkVDA3YzlnaXAyeEFwL3VV?=
 =?utf-8?B?MExkL1VQMGNITC9lUUdBY3FWME9xeWhwV3ViMDBGV1pNcUwwUjJGaDBXRzND?=
 =?utf-8?Q?t9bOmj1jxOZefG2Z3xDJ5X22xi/uB3SeSMp7w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTJwa3FQbSs5VWMrMFJYd2d1ZWQ1UGRVOXkweTI2bVhVd2kxZ2xGcHJJcGdl?=
 =?utf-8?B?Y3p3UGdlK1NCaUlzY1Y1UC9Vbk1wT0hhOVZVcUlEUnNyTEQzdk42bnJUVXVV?=
 =?utf-8?B?ZTJVWHVUVXlIQWVjTjhHa2pLSkdheWIycHdwYU50U0xNWElJVEtvb2g4elRt?=
 =?utf-8?B?TWpUdVMyTXB1Q2RQamp0VFgxTytzWmlqcmFpWFVqUlY2QWtoRHF2Q0l1eE42?=
 =?utf-8?B?L3phS2tHN3ZBQS84ZTE5dkRyN01sRlBEb2czQ2ZENHVZUXY0dUU4SHR3VVFl?=
 =?utf-8?B?YkpKNHNLeVgwUGZXYmtEKys0K1JEa3ZWcFc2KytYMDZhTlpJckJhYWFERzUy?=
 =?utf-8?B?QUlpRGNFaTBJUHYzYTFrN1lOdlVXdEJhcWtVWXdJanVzekNqaS82VXQ4bHBu?=
 =?utf-8?B?SWxuL3duMVdIQWVxTVVtMS9Nc2huUjhSalcvck55aDNibVBTZDJXRm5pdnF6?=
 =?utf-8?B?ejRBRm94aDZjMjRoeHFEZDQ1a21KcTFiUkpBQnY0UjV6cTB1V0I4enRiOVh2?=
 =?utf-8?B?RFdReFFLZkUrWnB0ZEtuS0daWk16dTNZTkgzREFST1hjQmE5U0hnUlc0cXJ3?=
 =?utf-8?B?UlZtbFd1QzJaUUtoVGZ6YzhBMXFYd2Y4RWhNejdBZnRUOE5VSktFamdZUmRK?=
 =?utf-8?B?aEZEVVlyYm9EODBpTEd2b0UrMkZPZ3ZhaUpIcmJPaURRbnQ5cG01SE85bzFu?=
 =?utf-8?B?VFZ1VlZNOWpGeFB1SlltYm1GZnZ1VDdveFk0R1NDQmxvM1I0RkF5T3FqZHRJ?=
 =?utf-8?B?a05Lb2U0blNjckc3aEFkVHI3dWtsQVQ5RFk0ei9MY2RzRmFBT0k3REU3U1Aw?=
 =?utf-8?B?cG9sMHVxRHU2cmhYK2o4a1BFRzg2dDQzUWxDOE9pRDg4L25xRGdjSDRRRmh4?=
 =?utf-8?B?RU93ZWdQN1NkU2ZQTEx4a2FVdnZzczRPbG9vVjdDNWZqU3dQQVJLNEROUS9S?=
 =?utf-8?B?ZmdZRUFQMjhuckQ4djV2OGhrbTk5Q2FUektFc2oza3hlcVBNT0padXdkbElU?=
 =?utf-8?B?N3p1M0QrazZGcS9leldXR25iRjk3S2k2R3p2ZWNpNW02eTJ2cHpsV3dKdWJN?=
 =?utf-8?B?a3JxSkcrM0N0TFlNZDdLbFRMQ1FuTHBUeUJ6a3BTRmE4R25Pc0orUGtzRjJB?=
 =?utf-8?B?ZE9ONVhweFlVK0M3cmYrRENDMDNYMzNmN1JjMCtYelcvbmZrL1hiSE1hN2R1?=
 =?utf-8?B?NTJZYUs0VzlVMFB1aFBVWWR0NmZ1aE10eTlYaHVSWFpNOG40VGhrVzZaVDZx?=
 =?utf-8?B?aXNDRk41eTI1MGgyT2kyTHFlYzZJbzhMbzd1bzlKN01HVlVNd3NqRUROOVVO?=
 =?utf-8?B?bGY3KzRTeHJja3F4aGhDU1h6YWdtRTJNUDBRbFEwczlraUo5VFJvZjcxY25H?=
 =?utf-8?B?TktPTGhKUE5tcU1hdnVJWE5tSkRBWFBVNDdLR0RqK29CM2JWcE9JczVLRkoy?=
 =?utf-8?B?eDZrYTVVSC8wV2hiaHppSktaK2tRSVIwRlRkK0JPREJrM0JWbmNSMzJRcHNG?=
 =?utf-8?B?enl2Tmt6SGdKa2YzTlJJSU1YanZ5TVFJekRYUjdrMWdIVzdSZVA1L1pmOXVp?=
 =?utf-8?B?em1PRC8wdldZVFQrcjNaWXJkNTA3NmlaMFVHdjF0NVByNnN6djZQZDRrOXFr?=
 =?utf-8?B?ODdiTzYxMGEwaTBlZHpkOWxvR1I0aEFzSk0yanJFSVBPSTJwaXhwNzhIVExS?=
 =?utf-8?B?aTBSOVhrL0dITXpVSEw0SUh2SUl3cnVuTFZYVzFUQTFhUi9HeFh0amwrVGw4?=
 =?utf-8?B?d1NXMXk5WEROWnpjeWg0M1lyckYrcmliOGFvVmVpcHBPakIrTUw4NHNlei84?=
 =?utf-8?B?UWRaY2NCSGNUOGdNbGdiOXlvYkRSNGxBNzd4VmZBVUR0SXZWMlpwbzdLVEdt?=
 =?utf-8?B?NFBwczFOaU0wdDdZSDY5cW5jZjBVZ0tVY05aU3NjNkJZakpqWnpCcmYwWEN4?=
 =?utf-8?B?dloxamU5OGJTeU5LTW1kYVJMSStmaHhWR3R2aTYwcFlyYXJhbGtyTUJDZGhW?=
 =?utf-8?B?aWF3M2FPT2NYK2FCTmFBSFpEVThuUTBNb2FuOThNTjdhTG43SGFpNzBONS9z?=
 =?utf-8?B?NWFkZU16N2p5RnRnUzRPWTFHMjV0YVdBTk1EUkVSRmpuZXpxZk5tVWwvNm95?=
 =?utf-8?Q?9BcI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sfu.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1d0c2d-dd74-4717-331c-08dca53a2fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 01:54:10.6387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e8677e-c989-47b9-8619-d83d5a5f6c67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZqXOWQKkkp5WserRWvs2bfbHQOllILc8l5eHnobxIBApNUvogvvp9FtVE5Q1r8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sfu.ca; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhBo240F/pvr4W16KcabxweuJOKZiHRvSYnZbkwYYk0=;
 b=goQkhUuvCAosnjo1mcXiBkAlPUIxrV3FDDzDXEnN1QKr5flEX7r7freh4jCprgKtvtmxZXgjxVeqpeVPkYMuQ4o/aDj/HkA++otFxjr+u7Ui2LkWKWizmK/4FbzOsRIpDTSp8+pMM7dQdI+G1XLOKxn8Gn+n8/9Uf18BrNtX7cPlvszwkCc4woezpc+gtklnMVe2dOJGdSBJVekaYBkA6Ppo3RJdyn6WRG7/EXU8wGrk9Eh4lkzfA19Eu9R8XCa2HYj0xuTuk2/qg6ilgfIQhJg18NTJujGWfTcdbpgl4BKZ4ORhzOuXAbHEysacdbHks+TLSVjxBnPJ+bjbonK0mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sfu.ca
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sfu.ca header.i=@sfu.ca header.a=rsa-sha256
 header.s=selector2 header.b=goQkhUuv
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
Content-Type: multipart/mixed; boundary="===============6321576369433923787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6321576369433923787==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_YT2PR01MB4239F514BF394397441DAD1BF7A22YT2PR01MB4239CANP_"

--_000_YT2PR01MB4239F514BF394397441DAD1BF7A22YT2PR01MB4239CANP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVhaCwgaXQgaXMgcmVhbGx5IHN0cmFuZ2UuIEkgaG9wZSBpdCdzIG5vdCB0aGF0IEkgYW0gZG9p
bmcgc29tZXRoaW5nIGluY29ycmVjdGx5Lg0KDQpSSg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCkZyb206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9y
Zz4gb24gYmVoYWxmIG9mIEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyMjNAZ21haWwuY29tPg0K
U2VudDogSnVseSAxNSwgMjAyNCAzOjExIFBNDQpUbzogUmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9q
b3NoaUBzZnUuY2E+DQpDYzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnPg0KU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIDMyLWJpdCBSSVNDViBidWlsZCBl
cnJvcg0KDQpPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCA3OjQz4oCvQU0gUmFqbmVzaCBKb3NoaSA8
cmFqbmVzaF9qb3NoaUBzZnUuY2E+IHdyb3RlOg0KPg0KPiBIZWxsbyBBbGlzdGFpciwNCj4NCj4g
QWNjb3JkaW5nIHRvIHRoaXMsIEJ1aWxkcm9vdCBzaG91bGQgYXV0b21hdGljYWxseSBhZGQgdGhl
IGV4dGVuc2lvbnMgaWYgdGhlIGdjYyB2ZXJzaW9uIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0
byAxMi4wLCBubz8NCj4NCj4gW1BBVENIdjIsMS8yXSBhcmNoL0NvbmZpZy5pbi5yaXNjdjogZW5h
YmxlIFppY3NyIGFuZCBaaWZlbmNlaSBzdGFuZGFsb25lIGV4dGVuc2lvbnMgd2l0aCBnY2MgPj0g
MTIgLSBQYXRjaHdvcmsgKG96bGFicy5vcmcpDQoNClRoYXQgc2hvdWxkIGRvIGl0LCBidXQgaXQg
bG9va3MgbGlrZSBpdCdzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbg0KDQpBbGlzdGFpcg0K
DQo+DQo+IFNpbmNlcmVseSwNCj4NCj4gUmFqbmVzaA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBGcm9tOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpcjIzQGdtYWlsLmNv
bT4NCj4gU2VudDogSnVseSAxNSwgMjAyNCAyOjMxIFBNDQo+IFRvOiBSYWpuZXNoIEpvc2hpIDxy
YWpuZXNoX2pvc2hpQHNmdS5jYT4NCj4gQ2M6IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIDMyLWJpdCBS
SVNDViBidWlsZCBlcnJvcg0KPg0KPiBPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCA2OjU54oCvQU0g
UmFqbmVzaCBKb3NoaSA8cmFqbmVzaF9qb3NoaUBzZnUuY2E+IHdyb3RlOg0KPiA+DQo+ID4gSSBh
bSByZXNlbmRpbmcgdGhpcyBlbWFpbCBhcyBCdWlsZHJvb3QgQXV0b21hdGVkIEVtYWlsIHRvbGQg
bWUgdGhhdCBJIHdhcyBub3Qgc3Vic2NyaWJlZCB0byB0aGUgbWFpbGluZyBsaXN0LCBhbmQgdGhl
cmVmb3JlLCBjb3VsZCBub3Qgc2VuZCB0byBpdC4gSSBkb3VibGUtY2hlY2tlZCwgYW5kIEkgYW0g
YSBwYXJ0IG9mIHRoZSBtYWlsaW5nIGxpc3QsIGJ1dCB0aGlzIGVtYWlsIHRlY2huaWNhbGx5IGhh
cyB0d28gYWxpYXNlcyBzbyBJIGFkZGVkIHRoZSBvdGhlciBvbmUuIExldCdzIHRyeSB0aGlzIGFn
YWluLiBTb3JyeSBmb3IgdGhlIGRvdWJsZSBtZXNzYWdlIGluIGNhc2UuDQo+ID4NCj4gPiBEZWFy
IE1haWxpbmcgTGlzdCBSZWFkZXJzLA0KPiA+DQo+ID4gSSBhbSB0cnlpbmcgdG8gYnVpbGQgYSAz
Mi1iaXQgTGludXggS2VybmVsIHVzaW5nIHRoZSB1Y2xpYmMgbGlicmFyeSBmb3IgYSBzb2Z0LWNv
cmUgQ1BVLCB1c2luZyBhIGN1c3RvbSBMaW51eCBmb3JrLg0KPiA+DQo+ID4gSW4gbXkgLmNvbmZp
ZywgSSBoYXZlIHRoZSBmb2xsb3dpbmcgbGluZXM6IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzEyPXkgd2hpY2ggSSBiZWxpZXZlIGlzIHRoZSBwYXRjaCBmb3IgdGhpcyBpc3N1ZSwgYnV0IGl0
IGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbi4NCj4gPg0KPiA+IEkgYW0gZ2V0dGluZyB0
aGUgZm9sbG93aW5nIGVycm9ycyB3aGVuIEJ1aWxkcm9vdCBjb21wbGV0ZXMgZG93bmxvYWRpbmcg
dGhlIExpbnV4IEtlcm5lbCBhbmQgYmVnaW5zIGJ1aWxkaW5nIHRoZSBMaW51eCBrZXJuZWwuDQo+
ID4NCj4gPg0KPiA+DQo+ID4gVG8gcHJvdmlkZSBtb3JlIGNvbnRleHQsIGhlcmUgaXMgbXkgZGVm
Y29uZmlnIGZvciB0aGUgImJvYXJkLiINCj4gPg0KPiA+IEJSMl9yaXNjdj15DQo+ID4gQlIyX3Jp
c2N2X2N1c3RvbT15DQo+DQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgeW91IGFyZW4ndCB1c2luZyBS
VjMyRywgc28geW91IG5lZWQgdG8gbWFudWFsbHkNCj4gc2F5IHlvdSBzdXBwb3J0IHRoZSBaaUNz
ciBhbmQgdGhlIFppZmVuY2VpIGV4dGVuc2lvbnMuDQo+DQo+IFNlZSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YtY29sbGFiL3Jpc2N2LWdudS10b29sY2hhaW4vaXNzdWVzLzEyNjINCj4gZm9yIGFu
IGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoaXMuDQo+DQo+IEknbSBub3Qgc3VyZSBob3cgeW91IGNh
biBkbyBpdCB3aXRoIGJ1aWxkcm9vdCB0aG91Z2guIFlvdSBtaWdodCBuZWVkDQo+IHRvIHBhdGNo
IGJ1aWxkcm9vdCB0byBhbGxvdyBzcGVjaWZ5aW5nIGN1c3RvbSBleHRlbnNpb25zDQo+DQo+IEFs
aXN0YWlyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
YnVpbGRyb290IG1haWxpbmcgbGlzdA0KYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0K

--_000_YT2PR01MB4239F514BF394397441DAD1BF7A22YT2PR01MB4239CANP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpZZWFoLCBpdCBpcyByZWFsbHkgc3RyYW5nZS4g
SSBob3BlIGl0J3Mgbm90IHRoYXQgSSBhbSBkb2luZyBzb21ldGhpbmcgaW5jb3JyZWN0bHkuPGJy
Pg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBD
YWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPg0KUko8L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8
aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4N
CjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBz
YW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9t
OjwvYj4gYnVpbGRyb290ICZsdDtidWlsZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnJmd0OyBv
biBiZWhhbGYgb2YgQWxpc3RhaXIgRnJhbmNpcyAmbHQ7YWxpc3RhaXIyM0BnbWFpbC5jb20mZ3Q7
PGJyPg0KPGI+U2VudDo8L2I+IEp1bHkgMTUsIDIwMjQgMzoxMSBQTTxicj4NCjxiPlRvOjwvYj4g
UmFqbmVzaCBKb3NoaSAmbHQ7cmFqbmVzaF9qb3NoaUBzZnUuY2EmZ3Q7PGJyPg0KPGI+Q2M6PC9i
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyAmbHQ7YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcmZ3Q7
PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbQnVpbGRyb290XSAzMi1iaXQgUklTQ1YgYnVpbGQg
ZXJyb3I8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5
RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0K
PGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5PbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCA3OjQz4oCvQU0g
UmFqbmVzaCBKb3NoaSAmbHQ7cmFqbmVzaF9qb3NoaUBzZnUuY2EmZ3Q7IHdyb3RlOjxicj4NCiZn
dDs8YnI+DQomZ3Q7IEhlbGxvIEFsaXN0YWlyLDxicj4NCiZndDs8YnI+DQomZ3Q7IEFjY29yZGlu
ZyB0byB0aGlzLCBCdWlsZHJvb3Qgc2hvdWxkIGF1dG9tYXRpY2FsbHkgYWRkIHRoZSBleHRlbnNp
b25zIGlmIHRoZSBnY2MgdmVyc2lvbiBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gMTIuMCwg
bm8/PGJyPg0KJmd0Ozxicj4NCiZndDsgW1BBVENIdjIsMS8yXSBhcmNoL0NvbmZpZy5pbi5yaXNj
djogZW5hYmxlIFppY3NyIGFuZCBaaWZlbmNlaSBzdGFuZGFsb25lIGV4dGVuc2lvbnMgd2l0aCBn
Y2MgJmd0Oz0gMTIgLSBQYXRjaHdvcmsgKG96bGFicy5vcmcpPGJyPg0KPGJyPg0KVGhhdCBzaG91
bGQgZG8gaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGl0J3Mgbm90IHdvcmtpbmcgZm9yIHNvbWUgcmVh
c29uPGJyPg0KPGJyPg0KQWxpc3RhaXI8YnI+DQo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaW5jZXJl
bHksPGJyPg0KJmd0Ozxicj4NCiZndDsgUmFqbmVzaDxicj4NCiZndDsgX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX188YnI+DQomZ3Q7IEZyb206IEFsaXN0YWlyIEZyYW5jaXMgJmx0O2Fs
aXN0YWlyMjNAZ21haWwuY29tJmd0Ozxicj4NCiZndDsgU2VudDogSnVseSAxNSwgMjAyNCAyOjMx
IFBNPGJyPg0KJmd0OyBUbzogUmFqbmVzaCBKb3NoaSAmbHQ7cmFqbmVzaF9qb3NoaUBzZnUuY2Em
Z3Q7PGJyPg0KJmd0OyBDYzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgJmx0O2J1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnJmd0Ozxicj4NCiZndDsgU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIDMyLWJp
dCBSSVNDViBidWlsZCBlcnJvcjxicj4NCiZndDs8YnI+DQomZ3Q7IE9uIFR1ZSwgSnVsIDE2LCAy
MDI0IGF0IDY6NTnigK9BTSBSYWpuZXNoIEpvc2hpICZsdDtyYWpuZXNoX2pvc2hpQHNmdS5jYSZn
dDsgd3JvdGU6PGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IEkgYW0gcmVzZW5kaW5nIHRo
aXMgZW1haWwgYXMgQnVpbGRyb290IEF1dG9tYXRlZCBFbWFpbCB0b2xkIG1lIHRoYXQgSSB3YXMg
bm90IHN1YnNjcmliZWQgdG8gdGhlIG1haWxpbmcgbGlzdCwgYW5kIHRoZXJlZm9yZSwgY291bGQg
bm90IHNlbmQgdG8gaXQuIEkgZG91YmxlLWNoZWNrZWQsIGFuZCBJIGFtIGEgcGFydCBvZiB0aGUg
bWFpbGluZyBsaXN0LCBidXQgdGhpcyBlbWFpbCB0ZWNobmljYWxseSBoYXMgdHdvIGFsaWFzZXMg
c28gSSBhZGRlZA0KIHRoZSBvdGhlciBvbmUuIExldCdzIHRyeSB0aGlzIGFnYWluLiBTb3JyeSBm
b3IgdGhlIGRvdWJsZSBtZXNzYWdlIGluIGNhc2UuPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAm
Z3Q7IERlYXIgTWFpbGluZyBMaXN0IFJlYWRlcnMsPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAm
Z3Q7IEkgYW0gdHJ5aW5nIHRvIGJ1aWxkIGEgMzItYml0IExpbnV4IEtlcm5lbCB1c2luZyB0aGUg
dWNsaWJjIGxpYnJhcnkgZm9yIGEgc29mdC1jb3JlIENQVSwgdXNpbmcgYSBjdXN0b20gTGludXgg
Zm9yay48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgSW4gbXkgLmNvbmZpZywgSSBoYXZl
IHRoZSBmb2xsb3dpbmcgbGluZXM6IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEyPXkgd2hp
Y2ggSSBiZWxpZXZlIGlzIHRoZSBwYXRjaCBmb3IgdGhpcyBpc3N1ZSwgYnV0IGl0IGlzIG5vdCB3
b3JraW5nIGZvciBzb21lIHJlYXNvbi48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgSSBh
bSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3JzIHdoZW4gQnVpbGRyb290IGNvbXBsZXRlcyBk
b3dubG9hZGluZyB0aGUgTGludXggS2VybmVsIGFuZCBiZWdpbnMgYnVpbGRpbmcgdGhlIExpbnV4
IGtlcm5lbC48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDs8YnI+
DQomZ3Q7ICZndDsgVG8gcHJvdmlkZSBtb3JlIGNvbnRleHQsIGhlcmUgaXMgbXkgZGVmY29uZmln
IGZvciB0aGUgJnF1b3Q7Ym9hcmQuJnF1b3Q7PGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7
IEJSMl9yaXNjdj15PGJyPg0KJmd0OyAmZ3Q7IEJSMl9yaXNjdl9jdXN0b209eTxicj4NCiZndDs8
YnI+DQomZ3Q7IFRoZSBwcm9ibGVtIGlzIHRoYXQgeW91IGFyZW4ndCB1c2luZyBSVjMyRywgc28g
eW91IG5lZWQgdG8gbWFudWFsbHk8YnI+DQomZ3Q7IHNheSB5b3Ugc3VwcG9ydCB0aGUgWmlDc3Ig
YW5kIHRoZSBaaWZlbmNlaSBleHRlbnNpb25zLjxicj4NCiZndDs8YnI+DQomZ3Q7IFNlZSA8YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL3Jpc2N2LWdudS10b29sY2hhaW4v
aXNzdWVzLzEyNjIiPmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1jb2xsYWIvcmlzY3YtZ251LXRv
b2xjaGFpbi9pc3N1ZXMvMTI2MjwvYT48YnI+DQomZ3Q7IGZvciBhbiBleGFtcGxlIG9mIGhvdyB0
byBkbyB0aGlzLjxicj4NCiZndDs8YnI+DQomZ3Q7IEknbSBub3Qgc3VyZSBob3cgeW91IGNhbiBk
byBpdCB3aXRoIGJ1aWxkcm9vdCB0aG91Z2guIFlvdSBtaWdodCBuZWVkPGJyPg0KJmd0OyB0byBw
YXRjaCBidWlsZHJvb3QgdG8gYWxsb3cgc3BlY2lmeWluZyBjdXN0b20gZXh0ZW5zaW9uczxicj4N
CiZndDs8YnI+DQomZ3Q7IEFsaXN0YWlyPGJyPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188YnI+DQpidWlsZHJvb3QgbWFpbGluZyBsaXN0PGJyPg0KYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc8YnI+DQo8YSBocmVmPSJodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QiPmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdDwvYT48YnI+DQo8L2Rpdj4NCjwvc3Bhbj48
L2ZvbnQ+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_YT2PR01MB4239F514BF394397441DAD1BF7A22YT2PR01MB4239CANP_--

--===============6321576369433923787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6321576369433923787==--
