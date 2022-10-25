Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B19C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 15:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90784402A1;
	Tue, 25 Oct 2022 15:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90784402A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu3sh_ZTOR83; Tue, 25 Oct 2022 15:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E35B4028C;
	Tue, 25 Oct 2022 15:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E35B4028C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DBC51BF976
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 15:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 855578109A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 15:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855578109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BLPpsMZm-3b for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 15:00:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8DF081094
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8DF081094
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8b8joTv4tAp6VBmYfOHWnjmUQuHu6CtkEYdQdckAm58MKiUabViDUos5WDyKOQbUd1TgDLzkQXZ7qqH/idR7zSidMI5ngM4oVk2F8/EcbjgoHicFlIKJuesUC/nRj4Iuudp6snKg2bKLvtiECh5nUvOfO4hbjSvPaLodyCvIYc8GneTXT9vRt9Q4I3uamH+bQH8py+5rkpzV/8VSF3w+zQXv9Izjf2sQEo7j56zb3L5rq/lkp6RJxq82hIiWBTqa/AsGyUzA3nR/y5udNM6+Q0sdBjxP3rzAPCWin96dgh2IG79o3nZHoe+LC4GLx6zPBAzVeKSlmm+ea0hfPa4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKfdagxYqHGghTgz+kAbNLAxL0Ulag0TDYP2a1iaoxs=;
 b=d95dqoYSoeKw852FT+nUj/AW1wokdEjY/Zmr2KyP931fWn6jegsNaIE3gy2d2ERXAsXxJLfoXoFliNCrgUJcVxTiS+nTO5qnD/koqs6K0NFKNXNadFenl6Pem6pxGX4IhZZqDY25+b1OHxQ0o2tQl/kqB2HekEBSL/F4UnJQfoQ2C6+MENmeemWLN4fy0skjblcD3w9XoLAytOJtlJEzkxnfbkqTy716utTsA3AZOeHTk2jAh5IvxE5N4ocrqREUFhE6Mu1EOuurEdU58m/YisEd/LYjeSKpMtRvzz4t7g2WgOg8djSIdEQnxLcKgrnJskRtgwBmkai9KeNMX/dRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 15:00:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082%6]) with mapi id 15.20.5746.027; Tue, 25 Oct 2022
 15:00:16 +0000
To: Aaltonen Eero <eero.aaltonen@vaisala.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
Thread-Index: AQHY5fAgs+BoAarWO0GBZrgnMOlb/a4fOFAAgAAAy3U=
Date: Tue, 25 Oct 2022 15:00:16 +0000
Message-ID: <458C9F7A-80E7-4D46-95AF-8953F724EEBC@amd.com>
References: <20221022082645.20505-1-neal.frager@amd.com>
 <16bd1ade785531da3b54d0173aea5e9c921f1ff7.camel@vaisala.com>
In-Reply-To: <16bd1ade785531da3b54d0173aea5e9c921f1ff7.camel@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB6903:EE_
x-ms-office365-filtering-correlation-id: fb731c78-0002-4896-6022-08dab699a061
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVGNKCws/aG1S8clY9jb164pmHtnu4oozti5pjolgVfrNl5HAkOSOvGQkFFVaFV578T3kCfD+gsrsSWcGwszy9QiZIzZJLsOCqaeiJET9ROKMCIH1GU5xWoBUyZOUH8rtYk9RNGoGoUJRrdjFfuf1N+C/EqiMqj/SYeENF85sSKZWJ1E6bsPK5bv1RXo515YNnYoy6m5cidwSWBUe4I4djbrhEfd79IPEviubOYzVIeXx19TCUF927BV9fIxIGndD73YRBZiQRf8/yce56CMhATkF/LuXu8tvdXtY2ikkvRVBpAAUZFIMqVYI0VkHu8lhRbQ3giyL7cK3DTNelUXGHxkhsPT7+d1qadTWBA4tc4hKZea2+jjlxwyzVAdrjy7tKMZqBbct8Nr89PAIB2j9CNVcfZusSZ+L5vLtwRr9C10T7tkYvSKQExQtLWbkCQmZNd1kXZKbja1o0v/IhOzDJpVQK2/hVVFYSu5w9d1Gfd7/5LOk9ZmopVwPZzasdcEtwHNIDcVTT78M35TTvruglGG9CZHaLGqU5SUIBCc4D4Y79SAnfv59BHKLSB0WjKDXKH8skCr9VouyYykS1A9ivcuX2x6zyYQRIhPgYv2J5uKYYybtL7wkcFf9/zZ4gIzOlPeQ172TWg2tC5HBHGBrqxxDnKicr2vttARNJrouWY9NRyzOhPuj7NB6r1aVOVxdwrLJm1Rg57IX/zrpvMkBuzComDHxsUWv9wbxuaeP1w9oWlPYOQ7MmmFY3kIgJnTJm8JfFPXkJISKrNzq/T2NedpgKM5EqUncyh5Ty2/orWWmMs1l9jAKkjl2w5m3xgolNJyBDoy/H5y2zcdVBDimJzqkE1bqQ7U4rW9DCCKIBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(2616005)(86362001)(66899015)(966005)(6486002)(478600001)(38100700002)(71200400001)(4744005)(64756008)(8676002)(38070700005)(6506007)(76116006)(36756003)(4326008)(66556008)(2906002)(66446008)(6916009)(66946007)(66476007)(122000001)(316002)(54906003)(91956017)(5660300002)(8936002)(33656002)(4001150100001)(66574015)(186003)(41300700001)(6512007)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlxME9MK25Yd2hNSCtxSE94RUkxTnpqQmNGYTBTOTF3QTlYNlVVKzV3Uldw?=
 =?utf-8?B?MFFlcDMvdVFWSk10b1dmOTdWL0lXSnp2ZXk4MnJDSnFGVy9aOUlDbEVqc2Z3?=
 =?utf-8?B?dEw3V3RWOGtRM2hxbUdkMGlMTjNzSjMvVDBEekcrK2RqQmlPZmhKak9Ydm42?=
 =?utf-8?B?Sis5bVcwZkx0WHRlVzFJUDlYL1FRUWlLK1hpSHZxWFRJOUpyeEoyZUlrdFFr?=
 =?utf-8?B?SW40R1FGSXdFay81OEZVU1ZQSDkwK2FHZytqV3I5QW1tRTlXemdvZ0J5eGZG?=
 =?utf-8?B?bU0rVzBzMFA3cERpQ0tCOU55N2hWL1Nvd0l1WEEzajc2bmZFN1A4Z0E4U2RJ?=
 =?utf-8?B?T1M2M1dDMHhzQWVnTC9mZ2NsYVpBR3pldEllUmlDUndMNXN2WVllZlVoYzV4?=
 =?utf-8?B?YjBRZmNaazJQRk5WazlvNmt4eTlVYmNKY2YyR1pzSldEcmdQNmJGVWx0NFlG?=
 =?utf-8?B?dCtoSWJlRHFzL2tlV2ZPNHcxODNmN3RTVmZnSmRLbDEwdWN2TjhxQWtRdlZC?=
 =?utf-8?B?bUFiQ0NLNm1nNTNqbW5mWUVqMG9LUHZkMW1jTHR4dzRsWXB4dC9kVkYvditu?=
 =?utf-8?B?WkpvWlJKS1RlR2dqa1lvZGU3bUhWay93RVlVVXV2K0NZT2VMdjRtVllQd1Fj?=
 =?utf-8?B?MW11N3lXVEFHcGhhSHJFckdMZU1pakRnYkNwQUhWclF4a3RYaGZTMG5NLzZT?=
 =?utf-8?B?cTJKSjYxWGROWDhITE5pSGZTMUpRMUpWbmtKcmgydXA0RGp6QVowZFRwWjVK?=
 =?utf-8?B?YVYxellPUnhsY0htU2FqOCtSQTg0dnlEQ1ZLeXo1aGlnbld5VitTSlZlSm1r?=
 =?utf-8?B?Sk5RSlhGVjUvTTRSSDZma25hUkJJeVFNTHdUck9yalZtVU9vL1M0NzZsc05V?=
 =?utf-8?B?UGpHOHBzbDl4YWQ4WnJxNUJlN21RQ3VjdUMyN0h6WlM1QnZCTDZjVmdHSk5N?=
 =?utf-8?B?djRQNUJOSFhHZEFKbnRTb2o2K0UvSkZxTmQzVTYyRlVBOEtMQnZDclIrSGxL?=
 =?utf-8?B?MmlCWmw1MXRXcHNzMzRYWkd5QVZaZ0RLRS9XOU9sRlhPK2hzVW9wUkdpMVpC?=
 =?utf-8?B?NktLdEFqK1RJSUQvMmFob1lKdWswWDFvTUNFMHJZWjNlTm56ZXBtd3UxZEVm?=
 =?utf-8?B?QzFTeHZ6VDBaOFJQd0ZDMmZpRllmTmFiQ2lFeVB2SVgybE5jektHSVhNUjRG?=
 =?utf-8?B?djdqUUkycnN5eVN4dFZPaTliZkplMUNIVXNFa0dWVHRwN1JUVTJKUDhvQnRx?=
 =?utf-8?B?TVN1ZmRoZzhEWDdjb2FPMit0UkxGVTBualEzYTEzNVhXVkJOWWtvdzlhaHRW?=
 =?utf-8?B?Q1dBc3N5WGZRRElHaDdzSWxselBxV0lCK3BUQWxRUFVhUEFXWjFTQkF2QkhT?=
 =?utf-8?B?Qk1uS0xkQkJyZEhiOW1DWnJFVnY2NkVvbG5vN2s5M3E0MjhDVWpVOTlTaU5E?=
 =?utf-8?B?Rkl1RUpEVEFZUTBpemlMM1J1bWNTcC9iVVMrOHFaeDQ0ZVNUTlJzdlFCdTho?=
 =?utf-8?B?U0o5akxPSE5VeDZka2FYTHdLUi9xejByZjJ3VysxM1NQQnVxTi9wU2JjQkpV?=
 =?utf-8?B?dDFHRW4yc0Q3Sm1NOU9JeWdwRGF5RVNUUXpRQUFyNjRZa3JsNHhiR3hMRDlJ?=
 =?utf-8?B?OGd5S0phVlVQbzBtTEF2WVBqMjJOSWJQbmkrdHc4eENoVVRXMjJyRXA2VHhW?=
 =?utf-8?B?cWUycHJOUnVkMWpmKzJzTDhoc3dEYmw0TmxVekZzeDlhUVg4cjNxRnlDZDVD?=
 =?utf-8?B?VHpNOUNTYkhmSGNwN1dPSll1SzhoWTBEUTNCeXJDMi91eFZKMEtOYmc4eTZx?=
 =?utf-8?B?WE9TR2xBUUQ5aGpXb0RHclEwUUhaTlkwVTc0S3dkMms0eHlRcDZuT0hqaHcv?=
 =?utf-8?B?WW5GWEdGeEpMMVFWVFBZWklPaEZTSmxoZlk2QmZiendUeEs1VlVWL3JCZTEr?=
 =?utf-8?B?M2NWZXNiKzI1ODRvMTJmU3MyVENZTXpObjlaRENhZDZoSGRXdVBkeEdIVG8w?=
 =?utf-8?B?Nll5TXZyL3F0UHJXdUpHb3FpY1B3TUxSSFFXeGFYMXNuMTc1V2dRQmpPeXhj?=
 =?utf-8?B?QVZlN2JPbmxuUmMzaTlFOVAxNWNwWmg4M2lBM3hHQlZWTUt4MmhwT2RvaUwy?=
 =?utf-8?B?enl0Wnk3UWNyYkgrYUxRcUU5NWFxVUkyLzJQUE16MUphdjY5U0QzSDJvNW05?=
 =?utf-8?Q?7/Cr1at9BJE33N37CYcIUjE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb731c78-0002-4896-6022-08dab699a061
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 15:00:16.3178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMCg4S5ivYApXmRDqfhqgnbYww1O/+T4Zkud9T8G7FM3EljdWyR/+saPKkLfQy+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKfdagxYqHGghTgz+kAbNLAxL0Ulag0TDYP2a1iaoxs=;
 b=L0gNb1uga3r819X15BWDaOgulDqw/y70Mu717hn9Zl2D/UViAFYf6DYp56CmfiBq6Idjy1rRi9Ux5baqFy+oIL6XjJ2TSI2cBGUehgMrhZHAlOLzcuMBbzpQhjZnQTmGnJLjGiseaHj38pFv1bu8L9DT23YLJkROJ88HkQGEvvg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=L0gNb1ug
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWVybywNCg0KDQo+IExlIDI1IG9jdC4gMjAyMiDDoCAxNjo1NywgQWFsdG9uZW4gRWVybyA8
ZWVyby5hYWx0b25lbkB2YWlzYWxhLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/T24gU2F0LCAy
MDIyLTEwLTIyIGF0IDAyOjI2IC0wNjAwLCBOZWFsIEZyYWdlciB2aWEgYnVpbGRyb290IHdyb3Rl
Og0KPj4gVGhpcyBwYXRjaCBhZGRzIFhpbGlueCBib290Z2VuIGFzIGEgaG9zdCBwYWNrYWdlIHRv
IGJ1aWxkcm9vdC4NCj4+IGJvb3RnZW4gaXMgYSByZXF1aXJlZCB1dGlsaXR5IGZvciBnZW5lcmF0
aW5nIGEgYm9vdC5iaW4gZm9yDQo+PiBYaWxpbnggdmVyc2FsIHByb2R1Y3RzLg0KPj4gDQo+PiBJ
biBhZGRpdGlvbiwgZm9yIGRldmVsb3BlcnMgd2hvIHdpc2ggdG8gdXNlIHNlY3VyZSBib290IHdp
dGgNCj4+IFhpbGlueCBTb0MgcHJvZHVjdHMgc3VjaCBhcyB6eW5xIGFuZCB6eW5xbXAsIGJvb3Rn
ZW4gaGFzIGENCj4+IG1vcmUgY29tcGxldGUgb2ZmZXJpbmcgaW4gc2VjdXJlIGJvb3QgZmVhdHVy
ZXMgdGhhbiB0aGUgdS1ib290DQo+PiBta2ltYWdlIHV0aWxpdHkuDQo+IA0KPiBBRkFJVSwgdGhp
cyBzaG91bGQgYWxzbyBoYXZlIGEgYm9vdGdlbi5oYXNoIGZpbGUNCj4gaHR0cHM6Ly9uaWdodGx5
LmJ1aWxkcm9vdC5vcmcvI2FkZGluZy1wYWNrYWdlcy1oYXNoDQo+IA0KPiAtLSANCj4gUmVnYXJk
cywNCj4gRWVybw0KDQpZZXMsIHRoaXMgaXMgc3VwZXJzZWRlZCB3aXRoIHYyIG9mIHRoZSBwYXRj
aCB3aGljaCBoYXMgYSBoYXNoIGZpbGUuICBUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suDQoN
CkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
