Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A17C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 06:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC4560EED;
	Sun, 17 Apr 2022 06:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHfCdMVKSxEq; Sun, 17 Apr 2022 06:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1C760E4B;
	Sun, 17 Apr 2022 06:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E489D1BF3FC
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E0760E4B
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiGeJs74Wl-A for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 06:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7E5760A97
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 06:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxUp9A5jOfqumrGRJaH0CC/wK82cLxkkcoFyNO9hZGwIxHsQJgyMeDd3xCWjjsUkEUhSvgb2wibUkcLdW3xImTIz29IRMSrugoCUgKXAdEniAa8nWlqQ9iGxGv9EUT8+zzzUzk/ezMSLlLd484yhVUXs/Gp/JMpKFWNs5N08FwwWDETBvKnddsO4nU28tj4pLNqxdva8imAV+X250YXzt0qcAAisO6kTmgvE2CpJWHRseuj31Fs2rwLIvzxQjt1z8DTwLKo0BxepLk08JpwfKJCCGvPzwJLPRVSs88veYs7Fk1D5F1Wsp6R2SkPT9xshld+LhuScTsCwPNxAHm3/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjF0EO4PwuW4kDRiOKvA8pMC2yF41NG9f/WyV4vpge4=;
 b=UhnnyRx8BBX8BMpktKj/dzqY1VLnZlUcFOVNg8kv0CPodDooFAo+nz8BRFm4kgBtSkSD1oQ3ZB+EexLmyrHpfBQpWX8lhbnZqnGi+skMgAQAgCu0YgEDM9XXZ9j6DRqkudxa3s68PKkl9UPNFcnXFESi4ihIMX2jD79nlwd4HGzP6xchmwdkKV15voQ5NosU1oQZ4gBylaBPW/mI4Air3NvMy5DyqnyUKPPWR7+/m5/2TYDNLenaovMYN6FKEGeEVwaYeORl+hN/172RGcJhjP+OpPr/867chuGYuuOj68jiuN0qyxjxg3WINu6UgDqyAH5PbbGNDk4YXqLAvr8elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjF0EO4PwuW4kDRiOKvA8pMC2yF41NG9f/WyV4vpge4=;
 b=NoeHCF7aH8sO3D0fNchdmYeZIq4F7VmPF3zJ5ntyiRGqlnLxN4joCNt+yjSzzp0MtbK5HgdFnyudwzI5WhjJVz7CptMGALyCN1eKso6zWL1KZS7VpJE7PvT0Z0S8AzfsfwUNGmo7d1YIP0pb8EqghzQKnlur6ajmLjRrnpE7VKY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN6PR02MB5248.namprd02.prod.outlook.com (2603:10b6:805:76::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Sun, 17 Apr
 2022 06:48:20 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 06:48:17 +0000
From: Neal Frager <nealf@xilinx.com>
To: Arnout Vandecappelle <arnout@mind.be>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "peter@korsgaard.com"
 <peter@korsgaard.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to
 Xilinx 2021.2
Thread-Index: AQHYS1jCIBhUrJ2T10y2XXcoR/MRfqzv3CmAgAC2VaCAAyUNhw==
Date: Sun, 17 Apr 2022 06:48:17 +0000
Message-ID: <299536D8-AC74-4B1B-AF56-FD5BA3619055@xilinx.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
 <SJ0PR02MB7758E25006ADC3AAA0346C73D7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758E25006ADC3AAA0346C73D7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be528f62-99b3-4c3c-9a74-08da203e40fd
x-ms-traffictypediagnostic: SN6PR02MB5248:EE_
x-microsoft-antispam-prvs: <SN6PR02MB524838CC8BE0EEE80824D93ED7F09@SN6PR02MB5248.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNNnbZIoMJ0l/L4RIDFW3p+3XJQVS2hkQETcEvqHE+o4efG8A/BfvqrreFYa+gaswprmfVOzbrfRkvv4jDQcAuG2AmBR1CmW6lBomqd2cmiaoXW6YfDVQZq3DuJR55Ck/J889PGQ1HEG9gjAb78nQg/LWGJdtkYd5B0fsdSBw2Mjyk0Uvaa3HiR9yVCxUWkvpmJhKZCdP0pmO9CA2UGXJL6JQfFRJktee3CiqQ+5/3fac6AV+lFL7EBXk4v3ZnJtSEmbcxLAvpWzw2gHpIU1ioBBHAxQ3V+n67+3jhnIpmfJO4fz/JJ9rR+Ca29X85llPx1bBI7VQFFRSNsx57BtqahhTK/BpSDiaUxyUvinNNWCqiBcx3DHt4D1hoyD8iG8eRl0puJaMVyn782G2Fs7ZrFPKS2kSEqWMFgjmyBBPsY7mxtyadvj/tz8YDUDqTLt00FVRmKaZnKdbz3C6AoynLys7EejJpOlHmLQZrAub6Kwrhh/sJodXZcs21sWFgu7RsjXn9cOH804M09veNIIeGhqlFdqEmcB39GwlfuhkjtW2vo9zKb0L2orWeab3TrGKIXwv0V/yz4NcS7sqfoyHztfBe5E7F+V1Yh8d5f135rHJY0y01VEQDmhqGLwnyKxmAp2ce3wHOAqaY8hCJe/NwXZOEVnPWdogcCKLqkdgToWLELBeSu0viEV68aUgMbG1oSg7SN/MqRDOq7tBwG3Jp/hyR2qlwFlXTDITctPsCkinpXE5mAOxJPK7EyjzQZVXaMbEy7oWnsS2OusSwuoX01bNsh7NraP03zIxxzT0RbqzQA4/ZWifxywLVJx8V1KgaFGc9sfX8a/R/GzIt1vVp2Cf1Dal6QxQZb2ua1JV1yF9h3KUdjuYoumKy2snTC0FkbFrj6xselc6qt8n5yXBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(2906002)(508600001)(316002)(6486002)(36756003)(38070700005)(5660300002)(86362001)(8936002)(71200400001)(66476007)(4326008)(66556008)(66946007)(66446008)(8676002)(76116006)(64756008)(122000001)(38100700002)(110136005)(66574015)(54906003)(33656002)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXFrRk5icEdaY2VHZjhzVkJ6amlGUHh4Y2hRcEIxQWRHcDBvZHZyVUo4SS9h?=
 =?utf-8?B?R3VwK3FiVEdRQkordERYRlhNd1RBdVd6OTVhL2drTVpwSXhFUFRjaVRKc2Nq?=
 =?utf-8?B?OXllM3ZjTFRSQTd0dWc5M3A2bS8xdTN4TGhEdkVmc0pXVUxxN0dsTUZ3SHV5?=
 =?utf-8?B?VEp6cVE3ZVlueENKckJjM0Q0QXJJSzlTRWN6SnRPVlU0c1pYeHJHb28rOXJm?=
 =?utf-8?B?MGlnUm9EdmRWLzFCSDVjMEVsejZGdWxSTXNwbTRzZGxPMUtEWExMZ1Y3bGNG?=
 =?utf-8?B?eUlWcHZYOWRiQXJPTitYM0FVNlBBZ2VuK1dKRG5tc2JreXh5dHJEQ2RuRGNG?=
 =?utf-8?B?VXBuNE05bmFrMFpNWEtRb2pJRDNBdkRNVi9rOGR6R3NzQmV1QWJvck1ucFNR?=
 =?utf-8?B?WjY2V3NuYXZZVVZBQXc4NC9MeiszNTAxVjlMMmEvK0tWSy94UnlrMUd6VnRP?=
 =?utf-8?B?MXVoc3NDYVcrMHhYU2QvR3FIOEdFNVNldVQydC9ZY2pnQU1STzhrcFBFZS9J?=
 =?utf-8?B?dEFFbGc5WEZVSDlvU09CUVpGcFgvenVZWGFOR2ZkVUhvdU5SazhXL0t2WnBv?=
 =?utf-8?B?YldCbHJTZUYzTlJNZ1ltQTBqUVBoamE1K3N4cG1kMmd0elZpc3g2RUxWYmph?=
 =?utf-8?B?WlM4czZOaWVweUdqa2ZkNXV6SHFQN2J6cW1ybks2WEdFWmNScWNXUG5QbUww?=
 =?utf-8?B?K1lBYXpEOVl3WmFRUkJvVURYVHZRQ3RzOFZXTklZUndxNVpRR1JabjRGWkk3?=
 =?utf-8?B?N2RDY21WUXZnaXpadW5rZVY2S0FWUFc0RGtKMWF1MStVZ2VxTXV1VUZ3MEZR?=
 =?utf-8?B?aDMrV0xoRVZheWh1SG80RUwwTHZPemNLb0p4aGRxcElVNmhXL09qVGtYTVBq?=
 =?utf-8?B?NFcrYUptZkY0UmJNM1JBeXA3d2VLelUyY3NuRVpFQzNvODR5WHFvRGtyTXdB?=
 =?utf-8?B?TnVPMWJPdFBtS1hjUFBTQ0RTZEg4aFlybU9ZcFRCa29ETGxiamxhQXNpaUg5?=
 =?utf-8?B?ODU1MmZlYm5ESWFxY295L3FCaitmYXo2LzYzS1Y3cnFpR3FlYkkxeVZiYjBC?=
 =?utf-8?B?Y01kZm93YStlemdpcEczRTVoZ3lLSHNOQkxjNVIvYjBUbzIvM1NJYVBtR1hE?=
 =?utf-8?B?b2J3SW1BR2VEZHZYRUxrQXh3QWxOOThaM1FpOXVUWTZyQmJ5RGFFRmM4ZCtl?=
 =?utf-8?B?bHBkeHZXWEVGOXBwZjZqbWcwOEpUcEZCYi9RTmQ5R003VDlHdVJWZ29KMldD?=
 =?utf-8?B?MWtiMnpZamF3cEY4Q3habUV5ZWpvbjZFR2VuT3dDMUtMci9ZbCtZczIrUDhy?=
 =?utf-8?B?VFRnOCt3YU1XN1B5N3h5MXgvYytzSDhDS0RSNzNSNjJ1Yyt6Vk5nbXRkbGFQ?=
 =?utf-8?B?MWNEUnpuVGRJczNBZ0ZxQ012aktudTU4dXdKQm5VNmlsY215TVlJbExkS2hs?=
 =?utf-8?B?Rzh0dWpJY0NEV3cyMlM3cERSYnJQRkRzRytwQlVadk5pVDdQWHhRMzdSbGc4?=
 =?utf-8?B?YWNVUjZKMzFUMnRaV2hZSFhmRUZqNXowRjFVZEVMdC9yQXFFS0hZMmRZY3Na?=
 =?utf-8?B?UVNiRXp2R2VtQTB0RnlZV3hmL2c1M0FzN3FKMkE5dUEvNzBIOTNNN1k0OXZB?=
 =?utf-8?B?MGNybjNLRFNodVJRR1BSdVRoYTk3WmQxOVNXWkJxVk13bkRMQWxuVEpYS1Ns?=
 =?utf-8?B?MzVnOUdlNEYwNGVPamR1RHFRRUI0ZTNDdVo3N2hGb2dtYTdQRStDU3NKMmpm?=
 =?utf-8?B?dy9TdDFnS3FwSmpMekViTTFzanZCSGFqMjUxQlpIeWdpQmU3TVAzTU1PM0ww?=
 =?utf-8?B?THFpMFlNcS9XNVBMY01VQXBzalFQWXRpVlEzWjFtRXNCLzBhSDNPY2ZDaWpF?=
 =?utf-8?B?cXZMZlVweFBsZnR0VXFhRGZGcm9nOTh6WGhNZ0ovOStHN2RsK1BrWmgwYXg4?=
 =?utf-8?B?YVo4MUdSOU0xVmtTbUswOWNmS2EvR3FYdmMyd0pLRnVvNk0rcVc5MURoVmM3?=
 =?utf-8?B?QVltWWM3RC9tcENFME1YN1hVdGVobFlSVmx6VVdLb2ZKczlEaUVSRnpzZS9I?=
 =?utf-8?B?UkN5dkNPblkrK3lkUWo3VTUvWE4zNGNHaUppOXphVFg4T1JoS3NuRUR4Yllh?=
 =?utf-8?B?bnhURW9Ob0hSTjFqQTBGdjdZWkJNR1c4TSt0WTV0YU5Iak9jeU9wQi8raSsy?=
 =?utf-8?B?WGF6Vmc1VVorTEJoc3N2aGhMMHY1YW5vckwyK3p5SGQ3YTNWWG9wSXRuaW9j?=
 =?utf-8?B?aGVTR0NwcE9lU2ppUFp0M1BhT3BENEQ4RUpjRzd1aisyQWpTdUpWbVlKR3B3?=
 =?utf-8?B?Y1YrS2NPUFhEQzVLYU9TRG1nUFpEdERSNm5xdlNPMlhtMTBqUzd6Zz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be528f62-99b3-4c3c-9a74-08da203e40fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2022 06:48:17.5663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMksZWsxgHX6YKWtGQRWEGs0Pr9wPOE0gArwJ2Wi1TsGjl2OEKE0bRO0DNs7wBB95uMkSC7WOcfMi3yasO9YpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5248
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCg0KPiBMZSAxNSBhdnIuIDIwMjIgw6AgMDg6NTIsIE5lYWwgRnJhZ2VyIDxu
ZWFsZkB4aWxpbnguY29tPiBhIMOpY3JpdCA6DQo+IA0KPiDvu79IaSBBcm5vdXQsDQo+IA0KPj4g
LUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQ0KPj4gLUJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsWGlsaW54LGxpbnV4LXhsbngs
eGlsaW54LXYyMDE3LjMpL2xpbnV4LXhpbGlueC12MjAxNy4zLnRhci5neiINCj4+ICtCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9HSVQ9eQ0KPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9f
VVJMPSJodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0Ig0KPiANCj4+IFRo
aXMgaXMgbm90IHNvIG5pY2UsIHdlIHByZWZlciB0aGUgdGFyYmFsbCBkb3dubG9hZCAoaXQncyBh
IGxvdCBmYXN0ZXIgaWYgdGhlIHJlcG8gaGFzIG5ldmVyIGJlZW4gY2xvbmVkIGJlZm9yZSwgYW5k
IG5vdCBtdWNoIHNsb3dlciBpZiB0aGUgZ2l0IHJlcG8gd2FzIGFscmVhZHkgY2xvbmVkOyBpbiBh
ZGRpdGlvbiwgaXQncyBzdWJqZWN0IHRvIGdpdGh1YiByYXRlIGxpbWl0aW5nKS4NCj4gDQo+IEkg
d2FzIG5vdCBhd2FyZSBvZiBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdGFy
YmFsbCBkb3dubG9hZCBhbmQgZ2l0IGNsb25pbmcuDQo+IEkgb25seSBtYWRlIHRoaXMgY2hhbmdl
IGluIG9yZGVyIHRvIG1ha2UgdGhlIHp5bnEgZGVmY29uZmlncyBjb25zaXN0ZW50IHdpdGggdGhl
IHp5bnFtcCBkZWZjb25maWdzIHdoaWNoIHVzZSBnaXQgY2xvbmluZy4NCj4gTXkgb25seSBwcmVm
ZXJlbmNlIGlzIHRvIGtlZXAgdGhlIHp5bnEgYW5kIHp5bnFtcCBkZWZjb25maWdzIGFzIGNvbnNp
c3RlbnQgYW5kIHNpbWlsYXIgYXMgcG9zc2libGUuDQo+IElmIHRoZSBidWlsZHJvb3QgY29tbXVu
aXR5IHByZWZlcnMgdGFyYmFsbHMsIHRoZW4gSSB3aWxsIG1vdmUgYm90aCB0aGUgenlucSBhbmQg
enlucW1wIGRlZmNvbmZpZ3MgdG8gdGFyYmFsbHMuDQo+IA0KDQpXb3VsZCB5b3UgbWluZCB3ZWln
aGluZyBpbiBvbiB0aGlzPyAgRG9lcyB0aGUgYnVpbGRyb290IGNvbW11bml0eSBwcmVmZXIgdGFy
YmFsbHMgb3IgZ2l0IGNsb25pbmc/DQoNCkZyb20gbXkgc2lkZSwgSSBqdXN0IHdhbnQgdGhlIHp5
bnEgYW5kIHRoZSB6eW5xbXAgZGVmY29uZmlncyB0byBiZSBjb25zaXN0ZW50LiAgU28gYWxsIHVz
aW5nIHRoZSBzYW1lIHRhcmJhbGwgb3IgZ2l0IGNsb25lIGZvcm1hdC4NCg0KQXNpZGUgZnJvbSB0
aGF0LCBJIGFtIGhhcHB5IHRvIGdvIGVpdGhlciB3YXkgYmFzZWQgb24gdGhlIHByZWZlcmVuY2Ug
b2YgdGhlIGJ1aWxkcm9vdCBjb21tdW5pdHkuDQoNCj4+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RP
TV9HSVQ9eQ0KPj4gIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dp
dGh1Yi5jb20vWGlsaW54L3UtYm9vdC14bG54LmdpdCINCj4gDQo+PiBBY3R1YWxseSB5b3UgY291
bGQgc3dpdGNoIHRoaXMgdG8gdGFyYmFsbCBhcyB3ZWxsLg0KPiANCj4gU2FtZSBjb21tZW50IGFz
IGFib3ZlLg0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1ECl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
