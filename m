Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD62C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 14:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5317741C53;
	Thu, 24 Mar 2022 14:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkzfLS9LqAwW; Thu, 24 Mar 2022 14:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80539418F4;
	Thu, 24 Mar 2022 14:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2491BF3E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D31D60D5C
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX2pADNCRRQV for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 14:36:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 046E360B6C
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaA3iavdxTVFId2isYNMnz2HG1+edYXjDFPPiDJdvkisb4d+Lgtv8E7ofTEEbj64FSbCp/aqUgFHWLLCIcQkxQ64rfBuyQTIV+JzEoAx2f46fKt3sgyCx4fuynPgXFf3GBMPzjSE9z/86QdT7XA9QUZUlGj/HEJforVpRSOfhsBZX5FMByLa1wok5BUktI/Dksl7ZhiMjyj4buixKuz/Q+o6wKpdCaIz5I0qQg9Xw734DNheOR/DyXx6G62kJUbHpH+JBhiSggLMQn3b8A5/zBJVEz2wdW89G7aXNT9VYnc5R8MoAvO5oo55d+fAFWIDDDgxvJNU3p0YZZCfb5k5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUJFqffPb61Tzj2ybOoO8wCjIZhfO2qtAZswWvmo6oQ=;
 b=MzJO10515KOSj1AYVkLCDYJZpIrzTJTGjzQHcL3V2YnvUgR9jWBw4y/uSdciozFZEFotnEka6XD61eTu8HmwVUWw/N7DmwladaalntwBls871R9kBfYol4YvXLAxgtijwlXsUBO4F+vfysKKkGXtuBqj3hcPH2xDSgwpgAqvFfrbWjGuCZe9CU8SAChj4aJaGhlg/v4lsl2a089jgBs7yG+WMcV34c0qwluBLbEQ5uRR75DqlSFsX2VfJsxDRebV83hS2fJ7wnj3oowvP86Dd+5JJfC/3pwKr2W8ykgtA7D/IGo7DUDJb2YFbod3MUzEKHzLhjAPs98s+EeUcI/XFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUJFqffPb61Tzj2ybOoO8wCjIZhfO2qtAZswWvmo6oQ=;
 b=f6DlLgBAKRxJgVhzmLrw8G9LolAM7xQ/iy/KKRDo0lEwUETcuInR7WkGRqvNhz1ZoeRk+VNteYT6LhDwaW5lHnXb/IVeAkfTgd1mjyvEUIcesKkepLEmcaOCfKcY7iwHxzCG6lQyJ/I+6CdR6FqVE+jTmpQWS3qzwunUGp+vkCs=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SJ0PR02MB7678.namprd02.prod.outlook.com (2603:10b6:a03:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 14:36:47 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::c90f:43f9:8898:57f1]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::c90f:43f9:8898:57f1%7]) with mapi id 15.20.5102.019; Thu, 24 Mar 2022
 14:36:47 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_zcu10x: change git to https
Thread-Index: AQHYPdyCyDY7aYPsY0qZy6z62qJYu6zLWEiAgANE7hA=
Date: Thu, 24 Mar 2022 14:36:46 +0000
Message-ID: <SJ0PR02MB7758A50AC5135C35FDDA49A5D7199@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220322110313.4061782-1-neal.frager@amd.com>
 <70D87B9E-978A-49CE-BECE-500C876CE13D@benettiengineering.com>
In-Reply-To: <70D87B9E-978A-49CE-BECE-500C876CE13D@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f99bd83-bb4f-4fc2-e4aa-08da0da3b992
x-ms-traffictypediagnostic: SJ0PR02MB7678:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB767800513D158164583DFDC9D7199@SJ0PR02MB7678.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jd92wN7qEYiOob1SQcJcsXL7C0w4W1Rx4Rl4+izAOZzm+ezmTDtnNBs4EJTZFpaTFiIflN4XyzzDaWRUpuMVpd71ejWgqOY4a3DDfsvMK8SNLMqQkzta0GNvqyNKU+5Aa2/9OZx24ABT5eFW7mCsKs21Cx28kvmLBL8A0tzxQeztgvE8q8Lhr6zFa3F+wlA78dafwe8oYMiijFY7S3FygMvddh8954VP35TtmK+0QqVvzTdkhmbsfVkVsHR7YdBb/dK3ZQaR+Wk59tUuQB4S6V2NjSCvaw8DYY7lY1wwkfI5oyAfegjJml7TGm2pFFXnPuT7wdCdDa5h3BBE9ghI4iEIURNDfZqtB448LgN9Fsul7anfOBTiK6Mc8Ylgw6Y4v2MMsU47BIGlKN0DQuSYfovdsrFhfM0YvqxkPQ/XBYzxU2GKGs2cZYxLB6cEdVZu7VNjXFl+oV3qCjgVLJXyRYWWB5EVPLwSLP4YcwcUidBllvmBk5Xb4/fASNeIoAwUY7Mu/U7mqPJXoe+cLYEyLYlnwpjWwL52sRTt0pgeQBQ4yugH3H7jSpYJS7QWKWZYj++wILPMt1o3VNU6gFJ4w7j9B/CQ8x7BHFxlD6LAm9b45rhqRMQvshtVlgFN0eyenmI6FgdCrDQ4dhONcQheMFyH7soXZL9GRvzuK11QdKsEoPYG5f2oYg8D0PGMo6OYeomcpKYb/Xe4WuGA7K5udbyzAd5CjsQuzDDhsZRwBE6/OmpmTkfgsRx+VXQszgG78KxibKLNcVaRBNkDH13QXgK4fqKBnaIM3RIPzxd+HNr9TJb/+hfy+LSlSRYdkhVKMp9NXnYctx42qLLcenTHJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(186003)(55016003)(64756008)(8676002)(66946007)(66556008)(66476007)(66446008)(966005)(508600001)(122000001)(52536014)(76116006)(54906003)(6916009)(83380400001)(316002)(86362001)(7696005)(6506007)(5660300002)(33656002)(71200400001)(9686003)(4326008)(38100700002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bCtaUDdSMW9qZWZlaERZano4VWd0Ym93Nk9HR2dMRTJXVE5WaG5xZ1prTENl?=
 =?utf-8?B?ZzhySDZrbC9UbGhjU205cEphWEpCM1FYeG8vKzB2NEh6R0ZQejZUOE9jSVNs?=
 =?utf-8?B?VXhpaFJoRjNvN3RUb2h5T0I4WEwyOFpucngzN0c4OHVSeTREOVhGSm4wMTVt?=
 =?utf-8?B?UFFqWnl6WWxRMXorbjh0WlRNUG1RSWltRDNiUkNhYUo4aWNsemV0M0t5OTl6?=
 =?utf-8?B?aHR2eE9IaDUzOHRxWUZmMzBMKzVmT2pySHVGZXFhS2lRZUJXWWt5R0dqaTJG?=
 =?utf-8?B?SkJDeU9rdlFwbTlYNEhQTXd4U3RXNHRYaHI2RzZkdlJ4S2xKUGt2MHFCYTkw?=
 =?utf-8?B?NG5icFVjQStFWG1SYTNDakZZdWFIdlJqWVg0YUdTajZJRGFZTnBLNWVVTklY?=
 =?utf-8?B?ak11QXN0a2tzak1nWDVPWGMrU3pLWE9vOGJHKzR4cGsycHZkT0lQZG5Xb0ZL?=
 =?utf-8?B?RHlIa09wR0pDZGJIeVdIWGt6c3JNRVF2cEQrcUI1NC9SWE1TMkM4UXh2N282?=
 =?utf-8?B?bEZ3bHRxQWJPWG1hbDJkR0NNd2NRZlVYN05ESFdYakorZ0RMY3ovaGl2Mmtm?=
 =?utf-8?B?OC91N3RXNC9mSFdqbHRFaStqbVp5SktsTmliK2lON2ZmWmpjT0ZXY2ZjMytp?=
 =?utf-8?B?bzdtejNnS3RhdVR1U0M5dGhnUXVJYzl3SkZaK1cyQ29aUUtNWVp0NEExL3lm?=
 =?utf-8?B?eXovTGxwZmhzVlNkMDVSa2EwM09pNFU2WDVRNDhoUlh5SWg3ZitKeitnVmQy?=
 =?utf-8?B?VTJMRzcvTHBSSnlwcTJkbHFmeWwyb2ZhZVJkQTBCdzJqZlYwTVM4eGNya0kz?=
 =?utf-8?B?b3ROS1N0aXl2VTJDVVNYd09ZVXA5RFBNeWk0MTY4dEx5MWluSVpMYkpod1Zr?=
 =?utf-8?B?cHhQWk1sSEcvZjhIN0dQMkdZZ0VKVVl3bmZ6V3JZQmgrRHYrYWwvcmtzZGQ4?=
 =?utf-8?B?VFhybE9lYjFQL3dSSml6TmRVZ3FmT2pkbEdEb3RkNkgvQSs1RGZaUzFXeG4z?=
 =?utf-8?B?OFZsaWdPRThSdnhVUXRtbzVWcFl1Rk93aS9TKy9QU3V3SmhldDNQeHZrKytG?=
 =?utf-8?B?SitLQUVjT1FrNWJvN2FMenV1T3gvbEhONTcvR1BGNE9INWpXNnBzNnlsYWVx?=
 =?utf-8?B?Rmd0K2dLOC81cC9JZTV0QS9DRFNFdWZmWnI2MWh6Vk5TbGxkNXVpZDRQMEVZ?=
 =?utf-8?B?ZmF3YXhYK1ZRZmcweUhnbERMUlpITklsZnk2eGEwdTFXUC9zTVJIcnhWZjJk?=
 =?utf-8?B?SWFaSVRqbENPSlFXR1JYdFlDQ2Z1aWZNcnRBUFY0SFVtTU9rUEZFVHM0ajV1?=
 =?utf-8?B?UU16aUVJRGR4bWVvaUJ3L3BPcmNkR0NHVkhqL21EcTlOd3Q1bTJTZ3BYc1VC?=
 =?utf-8?B?T0lEZWhCNDYvaVpNeHJGK1g3WWVHdzRuN1h0ZGloclZZdEg5MFZKY2lBVk1x?=
 =?utf-8?B?N1dDY2RaZU9IY1R4M1Ivb0hWWkVIMk4zejNLN1ZUdTBpQi9ZMlZlS2tsUG1r?=
 =?utf-8?B?SDBqNndOdXBpbTVubTdiTTZIOWw1VzhWUTdYM3c5RytveFJMbDNJUVFWYUtN?=
 =?utf-8?B?YzA2R3ZSejZ2WGozank2ZnlqZ0dqZFZGQVJ5Ujc0MXVlQm1tL3J2OGZMN3VD?=
 =?utf-8?B?WS9YRHROaHVPNjMrOVhIcnFnV20rYVRDeG9PK1VTOCtzWTJVSUlpNHVBQ2hs?=
 =?utf-8?B?VnIrNmtOd1BxODR5Q1hQZFowcDNWUDJ3Y1FHWHQrOU8xdFpIdWxPb29qWU9M?=
 =?utf-8?B?VmhaeTJ1T3duTnEvcGZmYWQza1N3VlhCdWk3U1poa211RmdSZ1AwS1luUlls?=
 =?utf-8?B?NlFoUzlYUUUrQ1B5SEJHVWs0YkY3SDF3eDF4RkdyemFaRFhHeGpqRkFPVjZy?=
 =?utf-8?B?eElzNTQ3L2NxTGloRHBOZ2ZZWnE0ZTVCeU81SlNTa2ZSWkkrK3BPM2dvNTlJ?=
 =?utf-8?B?UVNOL0dOQzlCN0RtbzdhQlYrZUk3bjZNUkdEaHJ5RU1walk4N3pyNG5sY2hZ?=
 =?utf-8?B?V00zYnhvWlpCbXNCTXV2RUxha1ExdmlhSTdCeTg5aFAyTFd3SGRXNStoKzFs?=
 =?utf-8?B?RUJ5RTlXV1BqcEdacjR0RHRUWUU0clBvU0hTNTgzMnc4aWhESDNPazMzWmhi?=
 =?utf-8?B?SlI2UnlNU29RS01VVUpPNUt5VVhHSEU2WGJsV1NTTmw3WDFnZFpMaEJNVGZF?=
 =?utf-8?B?WkxaVnd3bU41ZGVCNUl0VVM2TlNRUTVCRFN0ZkZNSkpEUU1jMmxNdUtKNXIw?=
 =?utf-8?B?Z2Zxb3Y2ZVF5dHA4aWtXKzZxVldsZ3Y2djNadWRYSkV4SVFwc2lKc3Zkb2o2?=
 =?utf-8?B?QVdyUnA1UndEd2t4S1VRVmsxVVdNaVFOUEUyQm5mZDNuNG5WeXI1SXNkUDZx?=
 =?utf-8?Q?sNXd8TQ2WGHtQLx/ThRCFhDRaMirc2eMX8sPYDcBPx9W2?=
x-ms-exchange-antispam-messagedata-1: cYic1donPLT3mA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f99bd83-bb4f-4fc2-e4aa-08da0da3b992
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 14:36:46.9651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIWK3jIlDrvfbBdvvJvolkQqwwUaUjggmXogVsFNNsZCQS7ro5uL7ImFIPKSy/GDnzG8e5gD9F/089FyjUzIcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7678
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: change git to
 https
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
 "fabio.caccamo@amd.com" <fabio.caccamo@amd.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLA0KDQo+IElsIGdpb3JubyAyMiBtYXIgMjAyMiwgYWxsZSBvcmUgMTI6MDMsIE5l
YWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPiBoYSBzY3JpdHRvOg0KPg0KPiDvu79UaGlz
IHBhdGNoIG1pZ3JhdGVzIFhpbGlueCBMaW51eCBrZXJuZWwgYW5kIFUtQm9vdCBmcm9tIGdpdDov
LyB0byANCj4gaHR0cHM6Ly8gYmVjYXVzZSBnaXQ6Ly8gaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZC4N
Cj4NCj4gRm9yIG1vcmUgZGV0YWlsczoNCj4gaHR0cHM6Ly9naXRodWIuYmxvZy8yMDIxLTA5LTAx
LWltcHJvdmluZy1naXQtcHJvdG9jb2wtc2VjdXJpdHktZ2l0aHViLw0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4gLS0tDQo+IERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+IGNvbmZpZ3MvenlucW1wX3pjdTEwMl9k
ZWZjb25maWcgfCA0ICsrLS0gDQo+IGNvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZjb25maWcgfCA0
ICsrLS0NCj4gMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUw0KPiBpbmRleCA5NDJi
YjhmZTljLi41OGVkNGY4MWNkIDEwMDY0NA0KPiAtLS0gYS9ERVZFTE9QRVJTDQo+ICsrKyBiL0RF
VkVMT1BFUlMNCj4gQEAgLTIwODksNyArMjA4OSw3IEBAIEY6ICAgIHBhY2thZ2UvbGliZXZkZXYv
DQo+IEY6ICAgIHBhY2thZ2UvcGtnLXFtYWtlLm1rDQo+IEY6ICAgIHBhY2thZ2UvcXQ1L3F0NW9w
Y3VhLw0KPg0KPiAtTjogICAgTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQHhpbGlueC5jb20+DQo+
ICtOOiAgICBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4gRjogICAgYm9hcmQv
enlucW1wLw0KPiBGOiAgICBjb25maWdzL3p5bnFtcF96Y3UxMDJfZGVmY29uZmlnDQoNCj4gVGhp
cyBeXl4gc2hvdWxkIGJlIHNwbGl0dGVkIGludG8gYW5vdGhlciBwYXRjaC4NCg0KRG9uZS4NCg0K
Pg0KPiBkaWZmIC0tZ2l0IGEvY29uZmlncy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZyANCj4gYi9j
b25maWdzL3p5bnFtcF96Y3UxMDJfZGVmY29uZmlnIGluZGV4IDRlOTY0ODkxNzkuLjJkZDA4MTdi
ZDggMTAwNjQ0DQo+IC0tLSBhL2NvbmZpZ3MvenlucW1wX3pjdTEwMl9kZWZjb25maWcNCj4gKysr
IGIvY29uZmlncy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZw0KPiBAQCAtNCw3ICs0LDcgQEAgQlIy
X1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvenlucW1wL3Bvc3QtYnVpbGQuc2giDQo+
IEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3p5bnFtcC9wb3N0LWltYWdlLnNo
Ig0KPiBCUjJfTElOVVhfS0VSTkVMPXkNCj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fR0lUPXkN
Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVVJMPSJnaXQ6Ly9naXRodWIuY29tL1hp
bGlueC9saW51eC14bG54LmdpdCINCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVVJM
PSJodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0Ig0KPiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9SRVBPX1ZFUlNJT049InY1LjE1LTkzMC1nOTY2MTI0NTMyNjU2YmM5NWQ3
ODFhYmY1NzUzMWU0Y2Q0Zjk2MjIzNyINCj4gQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9Inhp
bGlueF96eW5xbXAiDQo+IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQ0KPiBAQCAtMjIs
NyArMjIsNyBAQCBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzFfVUJPT1Q9eQ0K
PiBCUjJfVEFSR0VUX1VCT09UPXkNCj4gQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NP
TkZJRz15DQo+IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15DQo+IC1CUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9SRVBPX1VSTD0iZ2l0Oi8vZ2l0aHViLmNvbS9YaWxpbngvdS1ib290LXhsbngu
Z2l0Ig0KPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9YaWxpbngvdS1ib290LXhsbnguZ2l0Ig0KPiBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9S
RVBPX1ZFUlNJT049InYyMDIyLjAxLTE2NS1nNjY3MDAxMzE5Y2JlNTExY2U2MzUzMTk1ZmI0OTEw
YWU1Y2IwNDFjZSINCj4gQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9InhpbGlueF96
eW5xbXBfdmlydCINCj4gQlIyX1RBUkdFVF9VQk9PVF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJv
YXJkL3p5bnFtcC96Y3UxMDIvdWJvb3QuZnJhZ21lbnQiDQo+IGRpZmYgLS1naXQgYS9jb25maWdz
L3p5bnFtcF96Y3UxMDZfZGVmY29uZmlnIA0KPiBiL2NvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZj
b25maWcgaW5kZXggMGE5Nzk3NWFhMC4uZDgzNmVkZmFmMCAxMDA2NDQNCj4gLS0tIGEvY29uZmln
cy96eW5xbXBfemN1MTA2X2RlZmNvbmZpZw0KPiArKysgYi9jb25maWdzL3p5bnFtcF96Y3UxMDZf
ZGVmY29uZmlnDQo+IEBAIC00LDcgKzQsNyBAQCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBU
PSJib2FyZC96eW5xbXAvcG9zdC1idWlsZC5zaCINCj4gQlIyX1JPT1RGU19QT1NUX0lNQUdFX1ND
UklQVD0iYm9hcmQvenlucW1wL3Bvc3QtaW1hZ2Uuc2giDQo+IEJSMl9MSU5VWF9LRVJORUw9eQ0K
PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9HSVQ9eQ0KPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fUkVQT19VUkw9ImdpdDovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0Ig0KPiAr
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHViLmNvbS9YaWxp
bngvbGludXgteGxueC5naXQiDQo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVkVSU0lP
Tj0idjUuMTUtOTMwLWc5NjYxMjQ1MzI2NTZiYzk1ZDc4MWFiZjU3NTMxZTRjZDRmOTYyMjM3Ig0K
PiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ieGlsaW54X3p5bnFtcCINCj4gQlIyX0xJTlVY
X0tFUk5FTF9EVFNfU1VQUE9SVD15DQo+IEBAIC0yMiw3ICsyMiw3IEBAIEJSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfQkwzMV9VQk9PVD15DQo+IEJSMl9UQVJHRVRfVUJPT1Q9eQ0KPiBC
UjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkNCj4gQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fR0lUPXkNCj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9fVVJMPSJnaXQ6
Ly9naXRodWIuY29tL1hpbGlueC91LWJvb3QteGxueC5naXQiDQo+ICtCUjJfVEFSR0VUX1VCT09U
X0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC91LWJvb3QteGxueC5n
aXQiDQo+IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9fVkVSU0lPTj0idjIwMjIuMDEtMTY1
LWc2NjcwMDEzMTljYmU1MTFjZTYzNTMxOTVmYjQ5MTBhZTVjYjA0MWNlIg0KPiBCUjJfVEFSR0VU
X1VCT09UX0JPQVJEX0RFRkNPTkZJRz0ieGlsaW54X3p5bnFtcF92aXJ0Ig0KPiBCUjJfVEFSR0VU
X1VCT09UX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvenlucW1wL3pjdTEwNi91Ym9vdC5m
cmFnbWVudCINCj4gLS0NCj4gMi4xNy4xDQo+DQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2Vy
DQpBTUQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
