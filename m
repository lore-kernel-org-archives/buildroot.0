Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6603C7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1177A40160;
	Mon, 12 Jun 2023 20:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1177A40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnet5yhlxJ8f; Mon, 12 Jun 2023 20:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178F540169;
	Mon, 12 Jun 2023 20:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178F540169
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26141BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6786A40305
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6786A40305
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhqpsHbU6rFV for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:03:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67A540302
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B67A540302
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwGK/iv7TbK209B1T6tSTBOjpfvrzkeMH2MS+gbuYpCoYiNN3mTmMfi1RHg9IkB6Cse+CCvODTdQqgH2wiuAm0qmws+RQa55qTY4byEVq3/wqA3yT3aN9sCc6QR7TcasIVQgRkhILsZO8xc2zN5CV+93HQ6hzuAddR1R/hgqzI97Y85SGGrPf+K1aXeHP7fB1FoTBPkIIL2vNCiqgNk8UzyHgliW6QKrTaPFToRBvM67FaMhJemNPPxbYEDB4zEP2qVBcAcRUXzKu1+Wd+MOLJw4QEO7HP2b2CGmDdGS0M8Wh7P6MZqT0cssF0HHPCCmw6QSJ3COIy32zKr5u/IYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NyhvFlMdKn35zjVAzJPlXxzBtr/zsGds9dyzZyW1bY=;
 b=BFp7OAsnxjBrO0Bts+eb4USpBWo3iaOj0kiHlmHI4ierMDLFryv6mzXtqOoFvxNFDbFiqwDw+g8jLJWos5USWysmL+JTVrPNByX6aJjvVrFcigYxhCX5u88gAQsuvTEJJ+Em4uxxNRQq2ZHfAJtNKCWTWw8LFtlWuo/TmmnoITtMe7bA4H8xvFg4i4jBBl56L0evt2Ov6FvWA8PN7yyrrvrZKa9DM2v21EEE1BxPknhcl9o4KL8WgVF1FwtzQ3O+Am4F6C+scN8EjWA4g2AaMMia7J3h2b/aDnO4Cp9fMwfyAW1akJKehjmqc15pYwhHv1HCeFWbWmovIqSjcW1kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 20:03:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 20:03:30 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH] package/bootgen: add patch to fix builds on machines
 with modern flex versions
Thread-Index: AQHZnWPaGjtZfw0JZEmjyeSLNcRxwa+HlviA
Date: Mon, 12 Jun 2023 20:03:30 +0000
Message-ID: <99C59802-C439-44FC-A44E-D6B7594CE512@amd.com>
References: <20230612192648.859014-1-peter@korsgaard.com>
In-Reply-To: <20230612192648.859014-1-peter@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB7035:EE_
x-ms-office365-filtering-correlation-id: 72a136f3-2379-4940-438a-08db6b8017f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ac5pspzDJLAwZr2pcZzE3Cxtri7fbKVq8u8uJU9h5P4aEJpaMteB6Rpbsq2pHKlRd81AuKzsYZF+8P7d5FfZRo9RbL/q/yhQXo1PW3AEZs7WCTDPItxa13qIPca18dPGx0RF6a1wRE8sz4PJP90K9DoHnEtJbCx4soXGuT8GePqPcultDNOM8xQJvdIFZt9fFN4Z7N02U8nn9Ho5ds4gM+9DgAZH6mPAlgOKYhn1j0k8HrwfORUghME11H9huJWpUpMpB3WEX1/ZJZ8PH5rhRXd5Ih1YpZbL0/SbB8QERFx02urxlD83vFzeVU18qpqRRB1jIi+IhL5zL0l5YavqJiNrViTczsRf6Ibbm1AU5QNSSTKuIZRiUy7HAzOXj+dsi0/7RDF5B6DTmrjNoDx+LKKQmXSly8BtRV6M9oPT7WLrxDg8m9Q7syxY30lIkVPkVQP39/BMdjz7hCfsSErl1wQkV+1EtwGPChWWkaKP5iMbQmAr4IZYUs5Wp+8kxZAhFBeQNUE/MllTyeM/DP8p2IeMtrkSTxyZEBTIT3Lmxm/4bV3xTPXmiOr/cMhhn5ZI3Gzb3ovtGgCRugvU8V/nPyIACCt6Fl8/fvtgon7Bj2CrCuHMXnJzObh0rMfgfggcN8ufQF3/42usUgiKr9lFIFf+kFZ5wdXJ6zk9h7pdD8k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(6916009)(91956017)(66556008)(66946007)(4326008)(76116006)(64756008)(966005)(66476007)(71200400001)(66446008)(36756003)(41300700001)(8676002)(8936002)(5660300002)(316002)(6486002)(478600001)(2906002)(33656002)(38070700005)(38100700002)(83380400001)(6506007)(2616005)(66574015)(122000001)(186003)(6512007)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG9vN1k2N25UVnkzdEpaWTRQWktRWUgvV3cwTzlNU09wQmszbzdOWGEzUG5R?=
 =?utf-8?B?ZVBJUmdCeXdMTjhEYktuUkRxdU1hRjA0TThkcCtZRjZ6QUtTU3J4enlIZ2ZF?=
 =?utf-8?B?WlV0Zm1OdWJUMzVrWTA5cTJmdkdSdjRWUHQxS2FpN0wrdlRvUzg0NDRYRWwr?=
 =?utf-8?B?Y01ZOEd1TGhLN3B0SVpXVjM1UnhTTG93R3NoZndzSDlIMWhXMjdTQW5oVzYy?=
 =?utf-8?B?NUMxbGtNV2o3b0x1Y2xDZmhTOXFqREtqRHpHZTA3aTZxVEllN1VJcFl2bmhN?=
 =?utf-8?B?NytRKzdmaUhhZlVvMEdvU2NmajBiczRsWEFQRVpYUkEzZGFEUWNBTmQxZ0Uz?=
 =?utf-8?B?dURVQmdwYm5TMzJVMlExMFRkbE1iSGZzNWt5aDFjcU9ZelFsRk1tOEhVa1M1?=
 =?utf-8?B?Q2RmUEpXSDNCeHRaT3ZHczhXdWdVN1AyMnJUQlRFYVhVZFlkMURoTjBMS0Zv?=
 =?utf-8?B?aEJqdWd6OXduUUh4WlhnRU1YajNlKzlZRGVsVEJ6dlh0MGlKNVRQeG5VN3Zu?=
 =?utf-8?B?N000eVNZWUNWN2xqVit4QWxueFlhWE0wQXZ4R3MwQksycUNTeDUvUE41V1lx?=
 =?utf-8?B?anIxbFZjNDh4SE1BNzlTSFFGZUFNMXBNMkRNeUlCNWFwbFFDU25wd2w1VXdG?=
 =?utf-8?B?OE8wNzc5cHp2RUVyU09vZWdzNHJUbmQzdjFsdjNuL1lUVnRsZ2MyZktialZE?=
 =?utf-8?B?aTFrSlNuaWFJK0g1WVJGR2FjVUxZNGJWVmZJbUR6Wm9CK29rUEk5bzNyVnQ2?=
 =?utf-8?B?dFl1cTFzcHVNcWxhS29oSVlFTHFvb1BQNUQ5ejhIRWNzanYrNzREUExrU3d5?=
 =?utf-8?B?TmQzN2dpU1NGSTdiamFzWkVMUDhUUDhJWEsrYUo2dHVPcXNnZHJ2L3NwcWkz?=
 =?utf-8?B?OTZIdjRyN2pIdVh6R2JBdEhwSUpkeE1GRFR2bm13cGptdUxORlM2YVZMNjF4?=
 =?utf-8?B?ZUNnU1IxZXRXQzAxN2dFRHBodUdBVktHb0NBdFZmMTRrdnluZGtwckhtTE9k?=
 =?utf-8?B?eVEzdytoSUxLTW4rNXNVWStkV0FPMCtHaXB0a1ZneFNoZk1qK1BLWGFmbCsr?=
 =?utf-8?B?YWRTVk8vcys0UGhXcDE2K2FSU2gzSlRaOE5hUlVrYWhWbDdLVnFwWEF0MmpS?=
 =?utf-8?B?RDJRWUFVNmNUcHBMQ2R6N3ZiL3NOMGVranF4aHJib3JmQjdQbEV2aGNlRk5x?=
 =?utf-8?B?SUNic3U3U3o4VlVCUGJxWUhmQXR2SldCWnd1d09kRlhLS3cxZm1jUnppMS9T?=
 =?utf-8?B?WEFUdWFZVVhNek5CcXNjc0lEMHVrVTlBRU50c056ZkpvdmNZdHZ3Z2RBTytB?=
 =?utf-8?B?aU5FVkdzalZqRzZadnRxMzVwWmlPcURFYjdqUjNUd1hNdldNaFFyMVVQODNN?=
 =?utf-8?B?cXFiemh0ZFVqVWVJOE16ZTlkQ3ZEMkhpVzZ1SGw0VFBDa1A4TERYVGpxYmVE?=
 =?utf-8?B?NGtDdkZSb1huSnNZY1ZhWE9EYkVzczVseGdGTzhYMFlNNXFyMFhSUkZ6eGJZ?=
 =?utf-8?B?VmRzUWx1bnRoQ2hBS09zcnMzMlNnUnVlaGtkd2drN1Q4d2l5cXE2KzBFbndy?=
 =?utf-8?B?aE5wWVRFZTNJdjQ0VXUzS2tWUHhuTUtSVUFEME1tOTVaemNNZXlwdDYvRkZV?=
 =?utf-8?B?bEZwSC9WNVozWHBhOHRsWmRXV3Qrekh5S2YyelRxdHdvcFdWOFVGZ0NPZnBw?=
 =?utf-8?B?dnM0WU4xTm81akhEY3ZiVkh2aFI1cnZaRFh5aXBpdjYrNnh4RU1mOGxjblhF?=
 =?utf-8?B?MjFVWHQ0WTRMd0c4SlFycDh3c0d4RC8rTDY0bk9nOXdYTUFPNkp3OXFoeXI3?=
 =?utf-8?B?WlVzOUV1R2FGR0twWHBKNjlUUnM2NHpxL1o4VmhWWlY4d2xROVI3TWZSbDlS?=
 =?utf-8?B?OFVva25HU3RXQW1FVW5reHJ3RmE0T2l0M1ltTE9kRWcxMmdQdGU4RjJ6elhj?=
 =?utf-8?B?ZGlmdjlYNXlVQVlhQWx6VGRqRE84VmxYK2oyUHNnRnFZM3hSSENqdzY5VU11?=
 =?utf-8?B?U2RHWjdQUEZxZTNndXBibUMwTlAzRVVjbnA3Mkg2c3ZTYm95YXkvM2ZDL2VC?=
 =?utf-8?B?OEtlNlNVMlFLTHBVdjZDNnF3K0N4cTkzMTdJQXhxd2srR3B0c3JVUVk5cjJE?=
 =?utf-8?B?Tkhoa2w4MXJmM0FNNFRzUmFQdlBPZnVObVY0N0FBNFI2WlM5Mlhmc0JFSCtQ?=
 =?utf-8?Q?ZpDQuLirpeaZ3HJKzbEbjl0=3D?=
Content-ID: <7BBC4E3F258267428230CB79AC4DF29F@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a136f3-2379-4940-438a-08db6b8017f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 20:03:30.4064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/a1ZBAKopsId7JLVT+Y26aMe/o2Hn3tExOiF6QGRxjf/CdtzrvwqMMZy6y4nBjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NyhvFlMdKn35zjVAzJPlXxzBtr/zsGds9dyzZyW1bY=;
 b=WLP5h9MLNPKyYVL4HHG40eBfj36R+Zs3b+y9R1Iwc75vOUYqloGQOOwtNSW5R6nflMV+e5jH03Fjyl6EZ4vgUHwCtWZvRCTru4LxhO4J7GZS8ZdxuXHMyx+KgJ+iEtg33TmdkpLnbv2JjQFxXWHWCD1kVD4BrVHcDFumTYZf4ig=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WLP5h9ML
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] package/bootgen: add patch to fix builds on
 machines with modern flex versions
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQoNCg0KPiBMZSAxMiBqdWluIDIwMjMgw6AgMjE6MjYsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/Rml4ZXM6DQo+IGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzI5My8yOTM2ZDliMDU0MjY5YjcwNTVlNjZhYjVh
N2Y3YzFmN2Y0OTI2ZDQ4Lw0KPiANCj4gQm9vdGdlbiBlbWJlZHMgYW4gb2xkIHZlcnNpb24gb2Yg
ZmxleCwgYnV0IHVzZXMgdGhlIHN5c3RlbSBpbmNsdWRlIHN5bnRheA0KPiAoI2luY2x1ZGUgPD4p
IHRvIHJlZmVyZW5jZSBpdCwgY2F1c2luZyBjb25mbGljdHMgb24gc3lzdGVtcyB3aXRoIHRoZQ0K
PiBkZXZlbG9wbWVudCBoZWFkZXJzIGZvciBhIG1vZGVybiBmbGV4IHZlcnNpb24gaW5zdGFsbGVk
LCBsZWFkaW5nIHRvIGJ1aWxkDQo+IGlzc3VlcyBsaWtlOg0KPiANCj4gLi4vYmlzb25mbGV4L2Nt
ZG9wdGlvbnMueXkuY3BwOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3ZpcnR1YWwgaW50IENPOjpGbGV4
U2Nhbm5lcjo6eXlsZXgoKSc6DQo+IC4uL2Jpc29uZmxleC9jbWRvcHRpb25zLnl5LmNwcDoxMzYy
OjE4OiBlcnJvcjogbm8gbWF0Y2ggZm9yICdvcGVyYXRvcj0nIChvcGVyYW5kIHR5cGVzIGFyZSAn
c3RkOjppc3RyZWFtJyB7YWthICdzdGQ6OmJhc2ljX2lzdHJlYW08Y2hhcj4nfSBhbmQgJ3N0ZDo6
aXN0cmVhbSonIHtha2EgJ3N0ZDo6YmFzaWNfaXN0cmVhbTxjaGFyPionfSkNCj4gDQo+IEZpeCBp
dCBieSB1c2luZyBub3JtYWwgbG9jYWwgaW5jbHVkZXMgKCNpbmNsdWRlICIiKSBpbnN0ZWFkLg0K
PiANCj4gTm90aWNlOiBUaGlzIHdhcyBhbHJlYWR5IGZpeGVkIG9uIG1hc3RlciwgYnV0IHRoZSBj
bWRvcHRpb25zLnl5LmNwcCBhbmQNCj4gcmVnaW5pdC55eS5jcHAgaHVua3Mgd2VyZSBhY2NpZGVu
dGx5IGRyb3BwZWQgd2hlbiB0aGUgY2hhbmdlcyB3ZXJlIHNxdWFzaGVkDQo+IGZvciB0aGUgMjAy
My4xIHJlbGVhc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+DQo+IC0tLQ0KPiAuLi5uLW1hY2hpbmVzLXdpdGgtbW9kZXJuLWZsZXgt
dmVyc2lvbnMucGF0Y2ggfCA2OSArKysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2Vk
LCA2OSBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Jvb3RnZW4v
MDAwMS1SZWZpeC1idWlsZHMtb24tbWFjaGluZXMtd2l0aC1tb2Rlcm4tZmxleC12ZXJzaW9ucy5w
YXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm9vdGdlbi8wMDAxLVJlZml4LWJ1aWxk
cy1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LXZlcnNpb25zLnBhdGNoIGIvcGFja2FnZS9i
b290Z2VuLzAwMDEtUmVmaXgtYnVpbGRzLW9uLW1hY2hpbmVzLXdpdGgtbW9kZXJuLWZsZXgtdmVy
c2lvbnMucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4u
YjEzZGQyYjAzYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3BhY2thZ2UvYm9vdGdlbi8wMDAx
LVJlZml4LWJ1aWxkcy1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LXZlcnNpb25zLnBhdGNo
DQo+IEBAIC0wLDAgKzEsNjkgQEANCj4gK0Zyb20gMjlhNGU0ODc1MjdkMTA5ZjUxN2ZjNDdhN2My
ODRiNzczMmIyN2ExMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4NCj4gK0RhdGU6IE1vbiwgMTIgSnVuIDIwMjMg
MjE6MDQ6MjUgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gUmVmaXggYnVpbGRzIG9uIG1hY2hp
bmVzIHdpdGggbW9kZXJuIGZsZXggdmVyc2lvbnMNCj4gKw0KPiArQm9vdGdlbiBlbWJlZHMgYW4g
b2xkIHZlcnNpb24gb2YgZmxleCwgYnV0IHVzZXMgdGhlIHN5c3RlbSBpbmNsdWRlIHN5bnRheA0K
PiArKCNpbmNsdWRlIDw+KSB0byByZWZlcmVuY2UgaXQsIGNhdXNpbmcgY29uZmxpY3RzIG9uIHN5
c3RlbXMgd2l0aCB0aGUNCj4gK2RldmVsb3BtZW50IGhlYWRlcnMgZm9yIGEgbW9kZXJuIGZsZXgg
dmVyc2lvbiBpbnN0YWxsZWQsIGxlYWRpbmcgdG8gYnVpbGQNCj4gK2lzc3VlcyBsaWtlOg0KPiAr
DQo+ICsuLi9iaXNvbmZsZXgvY21kb3B0aW9ucy55eS5jcHA6IEluIG1lbWJlciBmdW5jdGlvbiAn
dmlydHVhbCBpbnQgQ086OkZsZXhTY2FubmVyOjp5eWxleCgpJzoNCj4gKy4uL2Jpc29uZmxleC9j
bWRvcHRpb25zLnl5LmNwcDoxMzYyOjE4OiBlcnJvcjogbm8gbWF0Y2ggZm9yICdvcGVyYXRvcj0n
IChvcGVyYW5kIHR5cGVzIGFyZSAnc3RkOjppc3RyZWFtJyB7YWthICdzdGQ6OmJhc2ljX2lzdHJl
YW08Y2hhcj4nfSBhbmQgJ3N0ZDo6aXN0cmVhbSonIHtha2EgJ3N0ZDo6YmFzaWNfaXN0cmVhbTxj
aGFyPionfSkNCj4gKw0KPiAraHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
MjkzLzI5MzZkOWIwNTQyNjliNzA1NWU2NmFiNWE3ZjdjMWY3ZjQ5MjZkNDgvYnVpbGQtZW5kLmxv
Zw0KPiArDQo+ICtGaXggaXQgYnkgdXNpbmcgbm9ybWFsIGxvY2FsICNpbmNsdWRlIHN0YXRlbWVu
dHMgYnk6DQo+ICsNCj4gK3NlZCAtaSAncy88RmxleExleGVyLmg+LyJGbGV4TGV4ZXIuaCIvZycg
Kg0KPiArDQo+ICtOb3RpY2U6IFRoaXMgd2FzIGFscmVhZHkgZml4ZWQgb24gbWFzdGVyIHdpdGg6
DQo+ICtodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vcHVsbC8yMA0KPiArDQo+ICtO
b3RpY2U6IFRoZSBwYXRjaCB3YXMgbm90IGFwcGxpZWQsIGluc3RlYWQgYSBkaWZmZXJlbnQgcGF0
Y2ggd2l0aCB0aGUgc2FtZQ0KPiArY29udGVudCB3YXMgYXBwbGllZCB0byBtYXN0ZXI6DQo+ICto
dHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vY29tbWl0L2FmNGY3MDgzZWE5MjkzMWEw
N2U0Nzk5NWViMmJjMmEzNDhjNTc3ZWQNCj4gKw0KPiArVGhpcyBwYXRjaCB3YXMgbm90IGFwcGxp
ZWQgdG8gdGhlIHhsbnhfcmVsX3YyMDIzLjEgYnJhbmNoLCBpbnN0ZWFkIG1vc3QNCj4gK29mIHRo
ZSBjb250ZW50IHdhcyBpbmNsdWRlZCBpbjoNCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2ZmMDlmMGU5MzBkODJlZDA2YTgzYQ0K
PiArDQo+ICtCdXQgdGhlIGNtZG9wdGlvbnMueXkuY3BwIGFuZCByZWdpbml0Lnl5LmNwcCBodW5r
cyB3ZXJlIGFjY2lkZW50bHkgZHJvcHBlZDoNCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2ZmMDlmMGU5MzBkODJlZDA2YTgzYSNk
aWZmLWUwMjg3YWRiNDIwZGJlY2MxMTJhY2RmN2Q0YTFlZmJhOGVhNmNiZjA2NDAxZTRlODY3OWI4
ZmZkMjJhMDkxZDgNCj4gKw0KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9wdWxsLzI0DQo+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+DQo+ICstLS0NCj4gKyBjbWRvcHRpb25zLnl5LmNwcCB8IDIgKy0NCj4g
KyByZWdpbml0Lnl5LmNwcCAgICB8IDIgKy0NCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2NtZG9wdGlvbnMu
eXkuY3BwIGIvY21kb3B0aW9ucy55eS5jcHANCj4gK2luZGV4IDM4ZmVkMzUuLjRlOTQwYWIgMTAw
NjQ0DQo+ICstLS0gYS9jbWRvcHRpb25zLnl5LmNwcA0KPiArKysrIGIvY21kb3B0aW9ucy55eS5j
cHANCj4gK0BAIC0zNzksNyArMzc5LDcgQEAgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIFlZX0NIQVI7
DQo+ICsgDQo+ICsgI2RlZmluZSB5eXRleHRfcHRyIHl5dGV4dA0KPiArIA0KPiArLSNpbmNsdWRl
IDxGbGV4TGV4ZXIuaD4NCj4gKysjaW5jbHVkZSAiRmxleExleGVyLmgiDQo+ICsgDQo+ICsgaW50
IHl5RmxleExleGVyOjp5eXdyYXAoKSB7IHJldHVybiAxOyB9DQo+ICsgaW50IHl5RmxleExleGVy
Ojp5eWxleCgpDQo+ICtkaWZmIC0tZ2l0IGEvcmVnaW5pdC55eS5jcHAgYi9yZWdpbml0Lnl5LmNw
cA0KPiAraW5kZXggZDgzMDczNC4uZGVkZTQ3MyAxMDA2NDQNCj4gKy0tLSBhL3JlZ2luaXQueXku
Y3BwDQo+ICsrKysgYi9yZWdpbml0Lnl5LmNwcA0KPiArQEAgLTM3OSw3ICszNzksNyBAQCB0eXBl
ZGVmIHVuc2lnbmVkIGNoYXIgWVlfQ0hBUjsNCj4gKyANCj4gKyAjZGVmaW5lIHl5dGV4dF9wdHIg
eXl0ZXh0DQo+ICsgDQo+ICstI2luY2x1ZGUgPEZsZXhMZXhlci5oPg0KPiArKyNpbmNsdWRlICJG
bGV4TGV4ZXIuaCINCj4gKyANCj4gKyBpbnQgeXlGbGV4TGV4ZXI6Onl5d3JhcCgpIHsgcmV0dXJu
IDE7IH0NCj4gKyBpbnQgeXlGbGV4TGV4ZXI6Onl5bGV4KCkNCj4gKy0tIA0KPiArMi4zMC4yDQo+
ICsNCj4gLS0gDQo+IDIuMzAuMg0KPiANCg0KUmV2aWV3ZWQtYnk6IE5lYWwgRnJhZ2VyIDxuZWFs
LmZyYWdlckBhbWQuY29tPg0KDQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMhDQoNCkJl
c3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
