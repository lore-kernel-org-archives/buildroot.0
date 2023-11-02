Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EF9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1417943397;
	Thu,  2 Nov 2023 10:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1417943397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NX-uGpKmBLUU; Thu,  2 Nov 2023 10:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7835433A3;
	Thu,  2 Nov 2023 10:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7835433A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAA791BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 10:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D97740B16
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 10:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D97740B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUTMUqnEbQvn for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 10:28:03 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7815343394
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 10:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7815343394
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9gw3HUfN0b6tpNdd72f0Gsz3+FHwui2fWOB3wW1WZbveypi6Isa7nsJaxM3cPX5bSqNA3KLBZEXTwNWLg0WgDpnfD5Z7DctyejmiXIhFmTogpjSqa1FuMv51zoEcKAbF1mRf61f4SWc3DR4rVl9yVgCoOYMLa7HyroILOg5cik+f8r/9tkSGloeTKouk4Sx7GkEiGN8B7ugoYERNsXB3KR+S2cLTiS4DE+0atuYfU8Dx2HxhDzYCxkGLj5x+D7vQHzrlRoEjAxl9rTqUpZSpxLD2icf9ciFK7gFgCoxsSw2kDNyHmK2DRqcE12hbvBzvhwRvBlzrotqKkWfTfI8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+zqewOrMQH2BFI25OXs9eYQENcoULhqw4Kf1aHXIvM=;
 b=GHeW+IFIZLv6fLkK88C+Medq4SpQGSN+9UErixDT2klisHLcaJH72J9maCixi7QlPmuIrfPp/Wxu43stFC1JTNrx/zEXF67FLnwsuJR3IfBPqB91Tzem3pedzI34K1s13BcJP9kW6oWR8WA40Qm0IOt2wcqfR1X3jJdmv728QFN7/sQIo+jUaZemHvYXrunUtn0XNA0w90X+uSTajM7LdRtK+KjA2+J/XekVlgzKFLhCJOCVgrX4m5hhufWe6vnx235O4qHM5IW50rqJ9uKbHGDyhptO+m6cgbkosPRSHgv6aXm/y7/n+zApA4/quvnF4v2sA5ucoOM3tSaqZkNvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 10:28:00 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 10:27:59 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkwgAAGH4CAAU13hoAAAKqAgAAN1AA=
Date: Thu, 2 Nov 2023 10:27:59 +0000
Message-ID: <7025D8A0-B9AC-43BA-98DE-FCF9FA923BAE@amd.com>
References: <20231102103759.52e59361@windsurf>
In-Reply-To: <20231102103759.52e59361@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB8559:EE_
x-ms-office365-filtering-correlation-id: 2e7173cc-d458-4722-4ca9-08dbdb8e62f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cEc1L7hnpDQGmUcc19p1ZRPvpQFtgc71dSm1il4gor1Z0oEHMeysyf3mxtHVvH6LVrFdfTyGtY4kyESrOyekA/QYbNuoSG8tV3xJaNpT7mbFVmXcSGzkgyo3PqW7xob845gwugNUmgaWWMI1nHHCWQAgnJ+CG6SSIi+8iWhSvKTQo6GIUyOa0yNsRafI7CWrLNAwTio55a8QSrDgWoqkJQxkSdvXm6cVwCSs8utmabFRmSghG52YlqyeEcfR9WcMPYG1P1HTzoI37PB9rHFPu18BVK7hWHSvj4V+jpIz1g6IrkkasCA3zW0a7aRXFXHbsoSB5JBYdp0aKcQEIGtPx55WAZkuViSiCgi8GJoyxFUx4+CCE1yU8xqv+LD/G0IdQD198pyGYGrSrz3roOyME7j/zmt61doKeUvGQKVfpAeE63LKlZ6x/RVfGgJoryLk3GzXIiqUZJ8TGg8L6F2jgEvdnhoCOBKmjcKpHWxXOiqTltdl2PIlMquUyn08jK8hmwxZcq1E9yM4biyX5NHDrT0sjzy4SEuHZ2wr3D0m40fuvwD5XWI9ullCvbiW7sICpwmALxlOCrsBLmDBRTviSm25+m3hQFhu5ot5NquVogD7OTvlbVeQSygEdesUzCMba8GVCgV+Cm6B1rj55792duqRLUBqpbNhXjJvVSpNr3UZdtDVgERr7FvwbQDo85Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(86362001)(122000001)(4744005)(66574015)(38100700002)(2616005)(36756003)(6512007)(33656002)(26005)(71200400001)(38070700009)(6506007)(83380400001)(478600001)(6486002)(2906002)(91956017)(66946007)(66476007)(66446008)(41300700001)(66556008)(64756008)(76116006)(8936002)(4326008)(8676002)(316002)(5660300002)(54906003)(6916009)(41080700001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFhiQ0dQWmRacE1DOTNULytqcjZJN3RQcXpJenhicXhVS3Nudkk0ajk2d2Z3?=
 =?utf-8?B?eTRsSlFlVXZ1NEJpSWIxb1ZMOEd0TFlmOGw5dERrbHovL0JoRGdYaERyRy9K?=
 =?utf-8?B?YXhZRHNkYmhYS0dtZFJLL0NpSXFCSkNDTS8yeHZSN3hQUkZqaDF2SlhIZUNN?=
 =?utf-8?B?SDRQUS9QVU9XS1V6RDdLT25SNkIrZlZVMFBjTUg0YjZ1L2c2WmtoYjZEYlVJ?=
 =?utf-8?B?aTREK2xZTjJ1M0hLTi9qelVGY2RhdzVEUU54aTd4dGFTOXdBV3pCYnl0d1lX?=
 =?utf-8?B?bnZzd1RLTkNuMUhKRkNwQzg4cU9zUkpva2VUNlFKM3hJanpwZGNjaFJ3KzV2?=
 =?utf-8?B?S1NRRVZtMmt1TWlDbTF4NFc3TkFIdk5FM2dnTUkxSFhCeHBnenVLT3NVMENr?=
 =?utf-8?B?ZzQ4c0ZGc2hrT0ZXZTZRYWhLMkF2eVYzTW9CNlIxU1lxK1MzVUswazBVcVlI?=
 =?utf-8?B?U2dhTHJNTGhFSHJtOGpnMEdzMWRXeDNWN2k4NEFPdGw4djFCaHcrWEhaZ3Nt?=
 =?utf-8?B?YWJiVEc5ZVVmcjJtRS91TlozUnlhSmVwNktYMHFhVW84UGNsUTJ4L0EwY295?=
 =?utf-8?B?N0Z2N3NqWnNwVXdnQk1ZUW9vTmxrZWV0WFdUbEV3bGJUbnFub2xWZWowUWtQ?=
 =?utf-8?B?MzN0eDYwSUxQT3ZCRVp0MHAxcEhmcHpUU3Y4Wk56QUJXZ0xtbk9uTnVJK2VG?=
 =?utf-8?B?KzZCZitucUpwRlVhZXhqTDdMQ0ZKV3ZoeXRVU2dnRUIwYU0zaHdkNkYvaUZn?=
 =?utf-8?B?OEF6NDJNa3plYm1MYksxK1Noc3dnRzZOOENIakk0cWpDR1FrZEVTMGVnY1JN?=
 =?utf-8?B?R2RuY2NmVHFTczZ2U243NGp0SlZHd3N5NkVUTTBRbXFuRHBpK2tCNHFjT0lR?=
 =?utf-8?B?alZNSGIwOUJlWmVtOVhWY3BCTWJ1VmNMYkJ4TWcrMWpJZFIwUGR5OWtsOGlx?=
 =?utf-8?B?N1hpanhSKzFuTWl1UEFRd3R3YTZOY0M1MjdkWjhmTTExS0xKajZ0M08zVThV?=
 =?utf-8?B?ajNhT2FoNlpLY09VM2x2dG1DeHN5d3BlU1VhcWVTL0NKaGEyWTdlS0dxeFFw?=
 =?utf-8?B?YWlaMm1sTDBodUZZcTQveWEzb3NTM2xmcnpnWCtJUWhZeXpuQ0RGVFBHTHhZ?=
 =?utf-8?B?SzQyaUZ0TEdZbWhra0VEdXd6UTZaN0tZVGFmV09aZTlPRk1yWElUNE0zbHoz?=
 =?utf-8?B?M2tRdlFQdEZLUTlmOWNmendrcHFmZVdhdGpFem90T1pvUm9IQU43Sko2Z1li?=
 =?utf-8?B?eldwMnRWRG02M281TXVySjdBYmdBRkhHWWtqOGhaWEdnRUFMbXNIV3hZK2x2?=
 =?utf-8?B?aFdqbUxLSlVTRHYzUlVNcE9ZWHY0a0JxWVIvbDZORC84bjFZRFFzY0RUVUdh?=
 =?utf-8?B?dlBBeU9OSloyREIwSU5BMFJpcXVONWU2SG5HNzBBZ2V1U2s1ZGVMSmRwVUZI?=
 =?utf-8?B?Nmt0dklxS1dKMWYydFhLbHpCRDdwbVU5VysySit0MzVqNXp1SkFFbDZueGRx?=
 =?utf-8?B?ZzRhNDM4WkhvaXhSbitJaGFwTEV1c1FFYnp1L1hHcytrMGtzVjltVlFaVTh4?=
 =?utf-8?B?SzNrZTBJd0c1Rmd2S0ZVOFMwOXRKeGtMcWdTMGJaOU90S2FTUC9DdEgzK0d0?=
 =?utf-8?B?TDNKQk5Sek1IT1IrVEhSbnlDcFl0QTNqZFA4OW5MOUhjTFYzRGhyMmNWOXRY?=
 =?utf-8?B?THRrWlVkV0haTG95aEZ6OEYwRnhWRE94SUZyYUhucTlsNWxJSHRKU24zRkwy?=
 =?utf-8?B?YUVFQ0pWRmYyQlNydlFVZEZhcUM0OXZ5M1p6Y1l2UWIrVUxLcWJ3MG5lanZp?=
 =?utf-8?B?QnNOWGtIcnVjNjBGajUxbHpDWU5vclhvdmRuZlN6QW9ST1EyVmRzUHlnWXl6?=
 =?utf-8?B?TDJQMHgzRXRVK2U0Z2ltUnFTNGZMc3ZuaFFXd0o0TExHaE4xeHlhTjhSQVQ4?=
 =?utf-8?B?Vm4yWGVmam1hRSswREVnRVYxZXhVajVzSUVqZnR3RkY5MHpIYTAvem95Tk9y?=
 =?utf-8?B?eHIrdkIxaHVSb3YydVBXZWljbmdHWXpBd0lwdWwyeFA1Q29qMUhweEdjbjhT?=
 =?utf-8?B?V3FScDVFR215RUZBaUkvcnE5NGlScjM0TllOWXpwVVBKVTJTMSt3dVVkTGk4?=
 =?utf-8?Q?1AJA=3D?=
Content-ID: <A7FFBE16A5870346B68FC6E90CAA0CF4@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7173cc-d458-4722-4ca9-08dbdb8e62f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 10:27:59.4832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyy8ySwUVTPtA0uTntQHNYXf4lHQ1dNY+u4UHQIC3MQlLcnKkAkJmu4E6phZ6+Ak
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+zqewOrMQH2BFI25OXs9eYQENcoULhqw4Kf1aHXIvM=;
 b=KjlLtrcNVMckMLjgKJXk+1a5sMygfrFZXHPlkdZI1oSYUhe6575kWRDBY0x1tJLnMnJdytvjJ31zj1dURDfLFrRk/lHakttoRz9+vQaL9I9NW5c+RAJhg+6g8z8wpXErSSGmj5JM54urMi9ythv/jsBYfmGRxbTTYPAEBB8Z7eM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KjlLtrcN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
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
 Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQoNCj4gTGUgMiBub3YuIDIwMjMgw6AgMDM6MzgsIFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v09u
IFRodSwgMiBOb3YgMjAyMyAwOTozNTozNSArMDAwMA0KPiAiRnJhZ2VyLCBOZWFsIiA8bmVhbC5m
cmFnZXJAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gZ2V0IGZl
ZWRiYWNrIGZyb20gVGhvbWFzIGFzIHdlbGwuDQo+IA0KPiBPbiB3aGljaCBzcGVjaWZpYyBwb2lu
dCBkbyB5b3UgbmVlZCBmZWVkYmFjayBmcm9tIG1lPyBPbiB0aGUgc3VnZ2VzdGlvbg0KPiBmcm9t
IFlhbm4gdG8gdXNlIGEgc2VwYXJhdGUgc3lzcm9vdD8gVGhlbiB5ZXM6IEkgYWdyZWUgd2l0aCBZ
YW5uLg0KDQpZZXMsIEkganVzdCB3YW50ZWQgdG8gdmVyaWZ5IHlvdSBhZ3JlZSB3aXRoIFlhbm4u
ICBUaGFua3MhDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
