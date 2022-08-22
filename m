Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58355C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6AA740072;
	Mon, 22 Aug 2022 10:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AA740072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DDQo-GIx8Wc; Mon, 22 Aug 2022 10:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D54540941;
	Mon, 22 Aug 2022 10:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D54540941
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAC3F1BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 10:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A2181444
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 10:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A2181444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIzAOUboG2eI for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 10:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F19581440
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F19581440
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 10:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBbndTIzSTGLy9zadv0aDahBKDV1MDjpXXBCH3l4fBUvXNDFCocSMcMsp9R4zixKLBZIBDgIo2H8A+bgo6zdMdmDc4VFL476WxIvDMb0nB+QZxhKDYP77GzhxQ5WmgSe27I99mBF12vdFDj5WYTi6oe/dJSXZyMshnpySuM1Ig7YcY4tAljFcyIXLurszGBB+jk1WC2R23QG6vwIATjMd/glLPxGGGt5nWTcS+ue0uxNT4LAN5xA+9JmjI4cykLtbOys+zBgoy95YsI3fepbLedANh2wAbRWh1XMaYFe8/BY0F7iWonagMKEh05fMmacqtQVmnncRDaI5gZqWmb7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhOEZm5ZIVF85gK/h4lh0qIX3NN5Y5fvB/PksftvYk0=;
 b=cuskzFsLQSCxwN42/1eIgOc150C2Udh52WeL068+voVZlofK4gYj8BueVfmw2b+2x17nEkANnVE5MxG1Xgqv1gilTn/IOAeVC8DF4DSd3MhyUfp/0q4/wGNYMJYDCYgUfAaI3JNlFjeS8LYboNtzEXrmMXsaOxxf0Kilpm5gLQr5bFsmZUuuH+P+S4biK4T2KM2ZgtLOapGIO7PNUqV57QuOBT2l0p7+efhyumTDxhTTtcn3rcVZz5Anof0rvClvSFuRnCLhZGfLgeT66DEIFtfQz1RE9e1frRT58LnvelYX0eNGZXvhKRhIVUNJlSFy9D/l4v2wAn0gR4xxgKEgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB2841.namprd12.prod.outlook.com (2603:10b6:5:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 10:01:31 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1%8]) with mapi id 15.20.5546.021; Mon, 22 Aug 2022
 10:01:30 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHYs5Yt/VTzzNzFBUGC6DI8hhWoIa2352uAgAAnvqCAABytAIAChlAg
Date: Mon, 22 Aug 2022 10:01:30 +0000
Message-ID: <CH2PR12MB5004EBBE77F6DB8E7661A9A1F0719@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
 <20220820151243.GM2167049@scaer>
 <CH2PR12MB50042583296DCDC5716F5ACDF06F9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20220820191736.GQ2167049@scaer>
In-Reply-To: <20220820191736.GQ2167049@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06263af7-1896-49d0-7ee2-08da84254963
x-ms-traffictypediagnostic: DM6PR12MB2841:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UvWr5VI5iRRabfVjqETGmNlmr5LvWF6QeDKv8TSEjvYxRn3TQX/27J5DXzDbc1s7aORedG081IHJCA0Rw6z1XfkABFN/0D3mVmVIiq1yQfHGLEKDtEUsCXkIfuGqhkHLZj42noCPM+0YIrSqLB891L4eN5xpAu/gazBVUH/ayI1L6kJZftojdUUCSDS15vwCscB4NFdoXeXmIlnUe9cUZqntl+ZkwJTxnyFCxalzWtx6chFytyg6GoN955BwpANXT1bImKd2G4eT24AoQR0DGe7oV4YTRHui2Ll/jM+I0Kxhhp4YTAKp8hMLUgNkua8wHGT7DOfcX8UD69Fpf8PZ4nrSSTfdlOwwX02GWTIaM2zH4mOB4ljMVzKP4ORGBSx42WWsyG3uEN0v6vA+L8IiVtml+rJWh9dq+BduE64w5X3F9z7lCo5f34tcj1QNefdLrt/qaAbE02vkHGMRDTzmZDR9IyIwddU0rNXa+3Vt8fmyt63qiA0i+QBibK4oQorLuk6pqNtPE2ynz73H5dYCtkEghbbuCaWgXxRqlCxQNDNk0+a+l3W2dLkvPuF98EhBLScnI8DttQyMHSLkj/0X3PW9EELfsd4jXuCMha9E3+Ot77afp9/2+i0rzXeHbItTZPfTGre1DsmTK7h2rpz42uQbCxenY2D+7pbeevO5agc9iMBiho8CkLMjIlAwLVxzBFWtD1G9wNn1/ogUNk+JmFUL95GO3td6ug5V0N9qRcH7kjxM5+CsAeGdXYVX06CRzpMg2izY8lAtwYjZfKHzquklwMJeO80Ewikr85cS5RlW/dHwAhLKs/FUczPTTwRGZYdL9Sh1HSDBf61xNdlYWFnDDn548+SZN6DpEe/5qppc09jiPDJk47kFbIQpv40e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(76116006)(6506007)(7696005)(71200400001)(5660300002)(52536014)(186003)(4326008)(8676002)(64756008)(66446008)(66476007)(9686003)(66574015)(33656002)(86362001)(2906002)(66556008)(66946007)(55016003)(83380400001)(38070700005)(38100700002)(41300700001)(966005)(8936002)(6916009)(54906003)(122000001)(316002)(478600001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUpyaGRKMzhZUTAyMWs2c0JJTnFGRGJSSis2enZyR1FqYjFldnc5ZHhGZHYr?=
 =?utf-8?B?aXZuNm90YzB1U0tsUUJCczh1SGxEQnFzb0hsL3lHenlPSlBsckJKTU83NEY5?=
 =?utf-8?B?aDlCV0diOWtYc0N0eHRMS1lPSVAwaXFocDVRV2tob2I4YlBkM2djWThFMWhp?=
 =?utf-8?B?YUkyeGU5ajBYNmpSNkp3dSsxMFhqRW1DWS9hNjRnNzNuU2hJcmhJUTBpTENO?=
 =?utf-8?B?WnpnM2FlNXo0QTFMa0lpN1A4RlV6QldFWFZ6MGg3bFNPWFdCNUVhSTQ1bzY1?=
 =?utf-8?B?cFZZMkFjTnplMDR6OHdqazR4Z1NoRVNWdXlkRVF6dTMrdCtkbVA1a2R6bU9y?=
 =?utf-8?B?TjZacnFVaE9LZ1JoQXVLWlhWcUZPOGZJeHhKalJYa3Z0aDNnZGxxVFNvcGto?=
 =?utf-8?B?b0pRbndac3ZwTDBzdkhyWkhtMkRuMDc0MUw2WGlGNVcwcWs0L3lwWnN3SDdS?=
 =?utf-8?B?Z1BSTDh2RmNuSmRIcG5pb2NsMVZpbHZxRGptd1NucWhiM3diSWNPbjRUZlU4?=
 =?utf-8?B?czJRTlE3eHU2T0pTb2ZEQWRwTWNjUElBNlNZQlEwY3BtZHBUaGRHYUFleHps?=
 =?utf-8?B?RlppQUtLYnVydElZVkRvaXhOVnp6b1NZVDFFNkhoaS9MT09WbHA1NkNsdjRo?=
 =?utf-8?B?NmxPK1VpbWhIQW4zTmlyWXNsWkd5bnFFRzhJOHdzc3ZmcnhibjV0T0pvYzRO?=
 =?utf-8?B?NWlhL3FBN3k2Y1ZMTndwck50dzNRZ2FiQ2N6REJKQ1N6cEFveXE4N0t2eldN?=
 =?utf-8?B?Qk42MUFoZlppSjRxS1FYRTZyZ042ajZLZndBWW1oRTFTRDYyWlVFY0N3ZXhM?=
 =?utf-8?B?d1p1OXcxdTAwTkMrZVRtTGw3ZjB1bTBpYU9DQzdWNVBqS2hpSDV2VGtxa2RH?=
 =?utf-8?B?T2xBV09pVG10VlI2N0szMkpacWJadGNsZGxqS29SUDcwS3VPdWNLcTZhQXZL?=
 =?utf-8?B?RzFJa1RiYXVBdlVERmNsZmR3RElnWlF4MDFaQksxaHlNK3V4b3daVElCMDNs?=
 =?utf-8?B?alBzZXRwWFhObmg4RG9CK2crbmRQOHo4NzNjM1FaM3FHWEZ3S05CSGRreXdx?=
 =?utf-8?B?dE1wT2VJNHV1ZGsrcWxKYWlTL2tEZGRZZHo2dU1MWFoyTE9FbVhRU003V1B6?=
 =?utf-8?B?TFZJbmpKNEdCWDVGQWVQbXZMNytkc3lrQk44cG9DbGU0QTlYd2lLb0UzL3hY?=
 =?utf-8?B?ZkpaTEo4WE9heHpCeHQ2TDgzNFQxMnExaDVJNWo1ZXZuby9lQXU5aGlNY3Ba?=
 =?utf-8?B?WHZsYW5LM3U1UVYzWTc4dy95UnczZXZyOU9TbjMxZGd1YWNxSHdsejE2MW80?=
 =?utf-8?B?TWtwVGEwVTBIWjcvQ25HWk9PM2Nmd0xsNVd5K2ZBbHlNK1pzOWk3ZU1NcXBU?=
 =?utf-8?B?Wjl3WkE3Wk15VDNkTlYvNURzSmdRaGl4U0thdDU5NlY2TnB0N3Q4cEdtUFhz?=
 =?utf-8?B?dDdEWkFjc0JtYXdHL2MvTFZKTUU5bFhMZ3ZiS1VCZU0zNG5mVUdsT3czN0wv?=
 =?utf-8?B?Nld5WmJ3dVgwMXBXWWZNbHBiN25vOVd3cGJGVDhCakhRNGdYb2VYYXhkcU9P?=
 =?utf-8?B?RlYrT0FYVDhSSGRLVVhwRHRuVkNjYVB5djBEbk9pQkg0TGpFU3VjbXVtWEox?=
 =?utf-8?B?M2dDQkZLT1RtYUdaUDY3LzJBUWhWc3JrMWZyQTNnK2RldXRnZGZEN3ZLWGJO?=
 =?utf-8?B?RHlhbERWOWNUVzZpVk5zYlFBMFBFVHhtam94SkpvMlZKRHRzRWpZb2w1UmZr?=
 =?utf-8?B?L04wM2pVK1hqN0xpejMxclFUaTkxSnNiN2k2eUs1cSswRWFTRGF1YktTRHps?=
 =?utf-8?B?MW9xQnVRUTErMnh3K3JHU1lpWWhOK0RpcEFDUUxYdVpHOXJRWnFXZmM2NUJ0?=
 =?utf-8?B?cmFMRUQwcW84TVVKdyt2RXNsR1pOWC9idUQ4MVZTT1lBYUFtcExHMWtlZmV0?=
 =?utf-8?B?T085OFNaNWdIVUFxN1E2OCswMCt6ZmF4NzM2emhqWU9weEpBNStORW00S3F4?=
 =?utf-8?B?Vk4wTTlUMjY3UmRQTUUvaXZJNWlDQjFucXpLbXIxSUc0c2JSam10dHFFMU5K?=
 =?utf-8?B?UW13ZkpYZUZUUmNUMVBMRXVYNjJ1RnVQQmFBZVdWeDYvQTdGbXEyTmt6N0l4?=
 =?utf-8?B?SWtubC9tdWpCZG5sY1grQ0N5MzNTSXNlWEpGUGZid3IxU0FxRDh3akFIWHNZ?=
 =?utf-8?Q?Jkur393fPrakI61r1NXNDH8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06263af7-1896-49d0-7ee2-08da84254963
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 10:01:30.5948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MU/MEvDEAPjkfLcP7cCGkTgEeA9nbAnu1AgNJLUWBIYVeMgWLBClnBLkYQAaHinU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhOEZm5ZIVF85gK/h4lh0qIX3NN5Y5fvB/PksftvYk0=;
 b=Y9b8bZllCC9XBpgd5vE1j3T/fW1Tl8+Uu6tiwyZKyUfjr7GpvTp4bWw9DxPRrMZJY21GAvZSEZKD/pAf1/BxpiX55ziV6Hj0gnvVXwazO5+CYKgTcbuKeuQqzYOw31vMDHJE6mInWV0Wtyiuv0oGTUiE7PYliAnOscoH2NXPdMY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Y9b8bZll
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwNCg0KPiA+IFRoaXMgbG9va3MgbGlrZSB5b3VyIHBlcnNvbmFsIGdpdCB0cmVlLCBu
b3QgdGhlIG9mZmljaWFsIG9uZS4gKFllYWgsIA0KPiA+IEkgbm90aWNlZCB5b3VyIGVtYWlsIGFk
ZHJlc3MsIGJ1dCBJIHdvdWxkIHN0aWxsIGhhdmUgZXhwZWN0ZWQgDQo+ID4gc29tZXRoaW5nIHVu
ZGVyIGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvKS4NCj4gSSBhbSB3b3JraW5nIG9uIHRoaXMg
YW5kIGFtIHVzaW5nIG15IG93biBwZXJzb25hbCBnaXRodWIgbG9jYXRpb24gaW4gDQo+IHRoZSBt
ZWFudGltZSB0byBmaWd1cmUgb3V0IGhvdyB0aGlzIGNvdWxkIHdvcmsgd2l0aCBidWlsZHJvb3Qu
DQoNCj4gQWgsIEkgdW5kZXJzdGFuZCBub3cuIE5leHQgdGltZSwgbWFyayB5b3VyIHBhdGNoIGFz
IFJGQy4NCg0KSSBqdXN0IHN1Ym1pdHRlZCB2MiBvZiB0aGUgcGF0Y2ggc2V0IGFuZCB3aWxsIG1h
cmsgdGhlIHBhdGNoIHNldCBhcyBSRkMuDQoNCj4gPiAraWYgQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJ
Uk1XQVJFDQo+ID4gKw0KPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJUk1XQVJFX0xP
Q0FUSU9ODQo+ID4gKyAgICAgc3RyaW5nICJ2ZXJzYWwgZmlybXdhcmUgbG9jYXRpb24iDQo+ID4g
VGhlIHByb21wdCBzaG91bGQgYmUgIkN1c3RvbSBnaXQgcmVwb3NpdG9yeSINCj4gQ291bGQgeW91
IGNsYXJpZnkgdGhpcyBhIGJpdD8gIEFyZSB5b3Ugc3BlYWtpbmcgb2YgdGhlIEJSMiBuYW1lIG9y
IHRoZSANCj4gc3RyaW5nIHRleHQgd2hlbiB5b3Ugc2F5IHRoZSBwcm9tcHQ/DQoNCj4gVGhlIHBy
b21wdCBpcyB0aGUgw6JydCB0aGF0IGlzIGRpc3BsYXllZCB0byB0aGUgdXNlciwgaS5lLiB0aGUg
c3RyaW5nIGJldHdlZW4gcXVvdGVzIGFmdGVyIHRoZSBvcHRpb24gdHlwZSwgaW4gdGhpcyBjYXNl
OiAgInZlcnNhbCBmaXJtd2FyZSBsb2NhdGlvbiIgc2hvdWxkIGJlIHJlcGxhY2Ugd2l0aCAiQ3Vz
dG9tIGdpdCByZXBvc2l0b3J5Ii4NCg0KPiBBbmQgb2YgY291cnNlLCB0aGUgYXN0dXRlIHJlYWRl
ciB5b3UgYXJlIG5vdGljZWQgdGhhdCB0aGUgb3B0aW9uIG5hbWUgYWxzIG5lZWRzIGEgcmVuYW1l
LCBCUjJfUEFDS0FHRV9WRVJTQUxfRklSTVdBUkVfQ1VTVE9NX0dJVA0KDQo+IEhvd2V2ZXIsIHRo
aXMgd2lsbCB1bHRpbWF0ZWx5IGJlIHVuZWVkZWQsIGJlY2F1c2UgdGhlIGZpcm13YXJlIGZpbGVz
IGhvdWxkIGJlIGRvd25sb2FkYWJsZSBsb2dpbi1sZXNzIGZyb20gYW4gb2ZmaWNpYWwgbG9jYXRp
b24uDQoNCj4gU28sIHRoZSB0d28gb3B0aW9ucyB0aGF0IHNwZWNpZnkgdGhlIGdpdCB0cmVlIGxv
Y2F0aW9uIGFkbiB2ZXJzaW9uIGFyZSBub3QgbmVlZGVkLiBKdXN0IGhhcmQtY29kZSB0aGVtIGlu
IHRoZSAubWsgZmlsZQ0KDQo+IFNvLCB0aGUgQ29uZmlnLmluIGZpbGUgc2hvdWxkIG9ubHkgY29u
dGFpbiAoc2tlbGV0b24gd2l0aCBhYnJldmlhdGlvbnMsIGV4dGVuZCBhcy93aGVyZSBhcHByb3By
aWF0ZSk6DQoNCj4gICAgY29uZmlnIEJSMl9QS0dfVkVSU0FMX0ZXDQo+ICAgICAgICBib29sICJ2
ZXJzYWwgZmlybXdhcmUNCj4gICAgICAgIGhlbHANCj4gICAgICAgICAgRmlybXdhcmUgZmlsZXMg
dGhlIHRoZSBYaWxpbnggVmVyc2FsIGZhbWlsbHkgb2YgYm9hcmRzLg0KDQo+ICAgICAgICAgaHR0
cHM6Ly9vZmZpY2lhbC54aWxpbml4L2xvY2F0aW9uL2dpdGh1Yi93aGF0ZXZlci8NCg0KPiAgICBp
ZiBCUjJfUEtHX1ZFUlNBTF9GVw0KDQo+ICAgIGNob2ljZQ0KPiAgICAgICAgYm9vbCAiVmVyc2Fs
IGJvYXJkIg0KDQo+ICAgIGNvbmZpZyBCUjJfUEtHX1ZFUlNBTF9GV19WQ0sxOTANCj4gICAgICAg
IGJvb2wgInZjazE5MA0KDQo+ICAgIGNvbmZpZyBCUjJfUEtHX1ZFUlNBTF9GV19TT01FVEhJTkdf
RUxTRQ0KPiAgICAgICAgYm9vbCAic29tZXRoaW5nIGVsc2UiDQoNCj4gICAgZW5kY2hvaWNlDQoN
CkkgaGF2ZSBjaG9zZW4gbm90IHRvIHVzZSBib29sZWFuIGNob2ljZXMgZm9yIHRoZSBib2FyZCBu
YW1lLiAgV2hlbiBhZGRpbmcgc3VwcG9ydCBmb3IgbmV3IGJvYXJkcywNCkkgdGhpbmsgaXQgd2ls
bCBiZSBuaWNlciB0byBqdXN0IGFkZCBhIG5ldyBkZWZjb25maWcgZmlsZSBmb3IgdGhlIG5ldyBi
b2FyZCB3aXRob3V0IGhhdmluZyB0byB0b3VjaCB0aGUNCkNvbmZpZy5pbiBvciB2ZXJzYWwtZmly
bXdhcmUubWsgZmlsZXMgYWdhaW4gd2l0aCBlYWNoIG5ldyBib2FyZC4NCg0KUGx1cywgdXNlcnMg
Y2FuIHRoZW4gc2VsZWN0IHdoaWNoIGJvYXJkIHRoZXkgd2FudCB3aXRoIHRoZSBkZWZjb25maWcg
ZmlsZSBhcyB3ZWxsIHdpdGhvdXQgbmVlZGluZyB0byBnbyBmdXJ0aGVyLg0KDQo+ICAgIGNvbmZp
ZyBCUjJfUEtHX1ZFUlNBTF9GV19CT0FSRA0KPiAgICAgICAgc3RyaW5nDQo+ICAgICAgICBkZWZh
dWx0ICJ2Y2sxOTAiIGlmIEJSMl9QS0dfVkVSU0FMX0ZXX1ZDSzE5MA0KPiAgICAgICAgZGVmYXVs
dCAic29tZXRoaW5nLWVsc2UiIGlmIEJSMl9QS0dfVkVSU0FMX0ZXX1NPTUVUSElOR19FTFNFDQoN
Cj4gICAgZW5kaWYNCg0KPiBhbmQgdGhlIC5tayB3b3VsZCBsb29rIGxpa2U6DQoNCj4gICAgVkVS
U0FMX0ZXX1ZFUlNJT04gPSAwNzZkNGI0ZjAyYjQ3NWRkOWM2NWFkNTE5OTJiZmNhZDhkOThiMDAy
DQo+ICAgIFZFUlNBTF9GV19TSVRFID0gJChjYWxsIGdpdGh1YixuZWFsZnJhZ2VyLHZlcnNhbF9i
b290LCQoVkVSU0FMRV9GV19WRVJTSU9OKSkNCg0KPiAgICBWRVJTQUxfRldfSU5TVEFMTF9UQVJH
RVQgPSBOTw0KPiAgICBWRVJTQUxfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZRVMNCg0KPiAg
ICBkZWZpbmUgVkVSU0FMX0ZXX0lOU1RBTExfSU1BR0VTX0NNRFMNCj4gICAgICAgICQoSU5TVEFM
TCkgLUQgLW0gMDY0NCAkKEBEKS8kKFZFUlNBTF9GV19CT0FSRCkvYm9vdC5iaW4gXA0KPiAgICAg
ICAgICAgICQoQklOQVJJRVNfRElSKS9ib290LmJpbg0KPiAgICAgZW5kZWYNCg0KPiAgICAkKGV2
YWwgJChnZW5lcmljLXBhY2thZ2UpKQ0KDQpJIGhhdmUgYWxzbyBjaG9zZW4gdG8ga2VlcCB0aGUg
dmVyc2lvbiBjb25maWd1cmFibGUuICBJIHRoaW5rIGl0IGlzIGJldHRlciBmb3IgdXNlcnMgdG8g
YmUgYWJsZSANCnRvIGNob29zZSB0aGVpciBmaXJtd2FyZSB2ZXJzaW9uIGZyb20gdGhlIGRlZmNv
bmZpZyBmaWxlLg0KDQo+ID4gKyAgICAgaGVscA0KPiA+ICsgICAgICAgTG9jYXRpb24gb2YgYSB2
ZXJzYWwgZmlybXdhcmUgYm9vdC5iaW4uDQo+ID4gKw0KPiA+ICsgICAgICAgVGhlIHZhbHVlIHNo
b3VsZCBiZSBhIGdpdCByZXBvc2l0b3J5Lg0KPiANCj4gPiBTbywgdGhlcmUgaXMgbm90IGV2ZW4g
YSBkZWZhdWx0IGxvY2F0aW9uPw0KPiANCj4gVGhlIG9mZmljaWFsIGRlZmF1bHQgc29sdXRpb24g
KGFzaWRlIGZyb20gcGV0YWxpbnV4KSBpcyB0byBjbG9uZSB0aGUgDQo+IGVtYmVkZGVkc3cgZ2l0
aHViIGxvY2F0aW9uIGFuZCBidWlsZCB0aGUgcGxtLmVsZiBhbmQgcHNtZncuZWxmIGZyb20gDQo+
IHRoYXQgd2l0aCBhIG1pY3JvYmxhemUgY29tcGlsZXIuDQo+IEFuZCB0aGVuIHVzZSBib290Z2Vu
IHRvIGdlbmVyYXRlIGEgYm9vdC5iaW4uDQo+IFdoaWxlIEkgY2FuIGJ1aWxkIHUtYm9vdCBhbmQg
YXRmIGVhc2lseSB3aXRoIGJ1aWxkcm9vdCwgSSBkbyBub3QgaGF2ZSANCj4gYSBjbGVhbiBzb2x1
dGlvbiBmb3IgYnVpbGRpbmcgdGhlIHBsbSBhbmQgcHNtZncgaW1hZ2VzIGFuZCBnZW5lcmF0aW5n
IA0KPiB0aGUgYm9vdC5iaW4uDQoNCj4gWWVhaCwgSSBjYW4gc2VlIGl0IGJlaW5nIHF1aXRlIGN1
bWJlcnNvbWUuIEJ1dCBpdCBpcyBub3QgdW5oZWFyZCBvZiBpbiBCdWlsZHJvb3QgYWxyZWFkeS4g
Rm9yIGV4YW1wbGUsIHdlIGhhdmUgcGFja2FnZS9hcm0tZ251LXRvb2xjaGFpbi8gdGhhdCBwcm92
aWRlcyBhIHByZS1idWlsdCBhcm12NyB0b29sY2hhaW4sIHRoYXQgaXMgdXNlZCB0byBidWlkIHRo
ZSBib290L2FybS10cnVzdGVkLWZpcm13YXJlLyBpbiBjZXJ0YWluIGNvbmRpdGlvbnMuDQoNCj4g
U28sIGl0IHdvdWxkIGJlIHRlY2huaWNhbGx5IHBvc3NpYmxlIHRvIHBhY2thZ2UgYSBtaWNyb2Js
YXplIGNvbXBpbGVyIGxpa2Ugd2UndmUgZG9uZSBmb3IgYXJtLWdudS10b29sY2hhaW4sIGFuZCB1
c2UgaXQgdG8gYnVpbGQgdGhlIHBsbS5lbGYgYW5kIHBzbWZ3LmVsZiBmcm9tICJ0aGUgZW1iZWRk
ZWRzdyIuDQoNCj4gQnV0IHRoYXQgaXMgYSBiaXQgb2YgYSBzdHJldGNoIHRvIGdvLiBVbmxlc3Mu
Li4NCg0KPiBUaGlzIGlzIHdoeSBJIGFtIGxvb2tpbmcgZm9yIGEgc2hvcnQgdGVybSBzb2x1dGlv
biBvZiBqdXN0IGRvd25sb2FkaW5nIA0KPiBhIHByZWJ1aWx0IGJvb3QuYmluLg0KPiBBdCB0aGUg
bW9tZW50LCBkaXN0cmlidXRpb24gb2YgcHJlLWJ1aWx0IGJpbmFyaWVzIHJlcXVpcmVzIHRoZSAN
Cj4gY2xpY2std3JhcCBkb3dubG9hZGluZyBwcm9jZWR1cmUgd2hpY2ggZG9lcyBub3QgbGVuZCBp
dHNlbGYgd2VsbCBmb3IgDQo+IGFuIGF1dG9tYXRlZCBidWlsZHJvb3QgZG93bmxvYWQuDQoNCj4g
QWJvdmUsIHlvdSBzZWVtZWQgdG8gaW1wbHkgeW91IHdlcmUgbG9va2luZyBpbnRlcm5hbGx5IHRv
IGxpZnQgdGhpcyBjbGljay13cmFwIHJlc3RyaWN0aW9uLiBJZiB0aGF0IGlzIG5vdCBwb3NzaWJs
ZSwgYW5kIHlvdSBjYW4ndCBoYXZlIHRoZSBwcmUtYnVpbHQgYmxvYnMgaG9zdGVkIGluIGFuIG9m
ZmljaWFsIFhpbGlueCBsb2NhdGlvbiwgdGhlbiBkb3dubG9hZGluZyB0aGUgImVtYmVkZGVkc3ci
IGFuZCBidWlsZGluZyB0aGVtIHdvdWxkIGJlIGEgZmFsbGJhY2suDQoNCkkgYmVsaWV2ZSBsaWZ0
aW5nIHRoZSBjbGljay13cmFwIHJlc3RyaWN0aW9uIHNob3VsZCBiZSBwb3NzaWJsZS4gIEkgYW0g
d29ya2luZyBvbiBnZXR0aW5nIG15IGdpdGh1YiBvZmZpY2lhbGx5IHN1cHBvcnRlZCBsaWtlIHRo
ZSB1YnVudHUtZmlybXdhcmUgZ2l0aHViIGJlbG93Lg0KDQpodHRwczovL2dpdGh1Yi5jb20vWGls
aW54L3VidW50dS1maXJtd2FyZS8NCg0KTXkgZ29hbCBpcyB0byBjcmVhdGUgYSBnaXRodWIgbGlr
ZSB0aGUgZm9sbG93aW5nIGluY2x1ZGluZyB0aGUgTElDRU5TRSBmaWxlIHdpdGggdGhlIHJlbGVh
c2UgbG9jYXRpb246DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvYnVpbGRyb290LWZpcm13
YXJlLw0KDQpUaGVyZSBpcyB6ZXJvIGRpZmZlcmVuY2UgaW4gdGhlIGZpcm13YXJlIGZpbGVzIEkg
cGxhbiB0byByZWxlYXNlIGZvciBidWlsZHJvb3QgYW5kIHRoZSBvbmVzIEFNRCBoYXMgcmVsZWFz
ZWQgZm9yIHVidW50dSwgc28gaXQgc2hvdWxkIGJlIHBvc3NpYmxlLg0KDQpTdGF5IHR1bmVkIGFz
IEkgd29yayBvbiB0aGlzLi4uDQoNCj4gPiBBbHNvLCBubyBuZWVkIGZvciBhIHNlYXByYXRlIG1h
Y3JvOyBqdXN0IGFkZCB0aGlzIGNvZGUgdG8gVkVSU0FMX0ZJUk1XQVJFX0lOU1RBTExfSU1BR0VT
X0NNRFMuDQo+IFNhbWUgY29tbWVudCBhcyBhYm92ZS4gIEkgd2FzIHdvcmtpbmcgZnJvbSBvdGhl
ciBleGFtcGxlcyBvZiBmaXJtd2FyZSANCj4gZG93bmxvYWRpbmcgdG8gY3JlYXRlIHRoaXMgcGF0
Y2ggc2V0LCBhbmQgSSBhcHByZWNpYXRlIHlvdXIgZmVlZGJhY2sgDQo+IGZvciBtYWtpbmcgaXQg
c2ltcGxlci4NCg0KPiBMb29raW5nIGF0IG90aGVyIGV4YW1wbGVzIGlzIGEgZ29vZCByZWZlbGV4
ISA6LSkgQnV0IG90aGVyIG1heSBpbnN0YWxsIG1vcmUgdGhhbiBvbmUgZmlsZSBhdCBhIHRpbWUs
IHNvIHRoZXkgbmVlZCB0aGlzIGNvbXBsZXhpdHkgb2YgY29uZGl0aW9uYWwgYXBwZW5kLWFzc2ln
bm1lbnRzLiBJbiB5b3VyIGNhc2UsIGl0IGlzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBvbmx5IG9u
ZSBmaWxlIHdpbGwgZXZlciBiZSBjb3BpZWQuDQoNCj4gPiBJbiB0aGUgZW5kLCBJIGRvbid0IHRo
aW5rIHdlIHNob3VsZCBhcHBseSB0aGlzIHBhY2thZ2UsIGFzIGl0IGxvb2tzIA0KPiA+IGxpa2Ug
aXQgdHJpZXMgdG8gY2lyY3VtdmVudCB0aGUgb2ZmaWNpYWwgZGlzdHJvYnV0aW9uIHJlc3RyaWN0
aW9ucyANCj4gPiBvbiB0aGVzZSBmaXJtd2FyZSBmaWxlcy4NCj4gSSB1bmRlcnN0YW5kLCBhbmQg
SSBob3BlIHRvIGJlIGFibGUgdG8gY29tZSB1cCB3aXRoIGEgc29sdXRpb24uDQoNCj4gR3JlYXQh
IEluIHRoZSBtZWFudGltZSwgYXMgaXQgaXMgYSBXSVAsIEkndmUgbWFya2VkIHRoZSBzZXJpZXMg
YXMgY2hhbmdlcy1yZXF1ZXN0ZWQgaW4gcGF0Y2h3b3JrLiBUaGFua3MgZm9yIHRoZSBmZWVkYmFj
ayENCg0KPiBJZiB5b3UgaGF2ZSBhbnkgaWRlYXMgZm9yIGhvdyBidWlsZHJvb3QgbWlnaHQgYmUg
YWJsZSB0byBnZW5lcmF0ZSB0aGUgDQo+IGJvb3QuYmluLCBJIGFtIGhhcHB5IHRvIHJlY2VpdmUg
YW55IGhlbHAuDQoNCj4gSSBob3BlIHRoZSBsZWFkIEkgcG9pbnRlZCB0byBhYm92ZSB3aWxsIGJl
IGVub3VnaCBhcyBhIHN0YXJ0aW5nIHBvaW50IGZvciB5b3UuIERvIG5vdCBoZXNpdGF0ZSB0byBh
c2sgZnVydGhlciBpZiB5b3UgaGF2ZSBjb25jZXJucy4NCg0KPiBUaGFua3MhDQoNCj4gUmVnYXJk
cywNCj4gWWFubiBFLiBNT1JJTi4NCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
