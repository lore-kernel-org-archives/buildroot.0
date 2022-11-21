Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3E8C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 09:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191A081BC6;
	Mon, 21 Nov 2022 09:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191A081BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcgeEMIjUY5i; Mon, 21 Nov 2022 09:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3570981AC4;
	Mon, 21 Nov 2022 09:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3570981AC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8531BF3AA
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 09:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A9DF408EA
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 09:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A9DF408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhQ1Nrlidhru for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 09:13:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B5140022
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37B5140022
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 09:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fj4MUPsITD5UaMWbuBINLiBXnWBZetN69IFKHTLWWrKis4fRIOiu9jR0/dPblrs8qtpbw3yS645kZM88HqGrRaQj+0QUb2AcgIRwOu5Fbh7qn9GV4C+/Es+VjBAAyGjjEVEaTs+R29jQQ70k57Kp3UxQOzfxPz4SI4rert9X2OkQqVWipFTsn4/f13/E3C9qZaTytfKR4E7J2ceqIc6WgAdRWMf7w3N0SP1NcDaTRzc/sQ6gKE1TsYBtwh2NuhMDdrNKoooLGKbli/6qQzqT8ckrtyyWIc5Mq4uG0PAzFU9qvoW087VZtMX+YteGffNTsotpEojS/qTquqI3Xz+P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPiBqPNbRha/XkPqBzVRT6Cc9KJAb4k6iZpeEBUCndg=;
 b=DHkzvRdtOcJcrY2/a75KAS1AS5kMclDiIEYC5PowMv3rKKDgeieeI67iBswFyQnS7xqnEtZVSwfT/Xf6vRnFaCrFjYvxUj95RTNrVfsHmxiKhx+BB+/xGC1W+MjDVzB9gTaqZkVz9MA9tOO1yBPnK95DEEhxpKqcIE19XBJpaoco1Y4Weqh/nq7Mx6n/1lNuoU7xma8cBTdRx9+m8nFCKE3KqPuaCi9WOkE9H90wkibuT5VMpz0Gjjc8SsfXOvOHDCuAcKd78J8bgJH8l0MuzkcT7X7HQO9U5XZ0jL8eurR24zOdgwCSyOk6o7vstBhcLAY7OkjQ/7f7Dt6FUA09Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 09:13:14 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:13:14 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "peter@korsgaard.com" <peter@korsgaard.com>,
 "Simek, Michal" <michal.simek@amd.com>, "Chaplin, Kris"
 <Kris.Chaplin@amd.com>, "O'Neal, Terry" <terry.oneal@amd.com>
Thread-Topic: [PATCH v4 2/2] configs/versal_vck190: new defconfig
Thread-Index: AQHY9Btje/fKxpNlD0iFO0ixpgBZLq42rqSAgAAD1gCAAArEAIASbVFA
Date: Mon, 21 Nov 2022 09:13:14 +0000
Message-ID: <CH2PR12MB5004E30250076F4AF3652605F00A9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221109155621.4af7f270@booty>
 <CC27D304-488B-42BA-88F5-0B13A7FEC403@amd.com>
 <20221109164836.60da738e@booty>
In-Reply-To: <20221109164836.60da738e@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6766:EE_
x-ms-office365-filtering-correlation-id: ca92c650-de86-41d3-656a-08dacba09eb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TYY9NyxHmfwhBFLWNt18eUgePOdTlEmn364BUYevxy2LjeDQT5yJ6gxY+5Z+eWybG4Is6niEkLeHyrWVdoj+5HHU5z2iuTQi66KhiKMUSlVU/vhCpp4eMrEqFtLuVIgywxMhR+KrBSzpTh1RiRSFIX8whUzsx9rBiAW+gnEo5wLQ4U4WCFfWSQTCWQhBA+V6B77omllwsQEdtuXoFSU5I71GBkCjOVIchYPn9IkKGc7EgUDL82nC9uEDtHR3N0wBL5koYo1aLLaQzeQcwJXVv3PFrfpClGnWHkTXGRQ0+Plg2isSc8G9XDzBLK5NEAWccysWKEzvPYgSqhdTNVVlxr1F12JpOpETrTSHcuMvVsYjy0aGJPIBe8eYuVgjgEKtWTtaVD7ushSIf0rC7JUOq8o3GIqCeBrcSUxMS089Oe69gFqXVY2ltsrHu5zHDAQrSNsk7dbj4iznqrTSTLan7QXZglMKwHE75mueGnJ2/ZZgt0vUo0D2SBKRIODa78drFW6jbsek+macZVGGQ/y3vRdlsXd1WIEcCO+0YoahMUpfsbGggwxEbU5kBJjQk6irpRhgACfwrB7OHOVMR9UJb2hQXR45897OukFvQ3FGi9kV5TpKOQHLhhywufarcsTGcb43fFgrmA6R7BJqs94snbSxkdTwYb1C9CFnshOxY/AmSC4q+4IiXe2I3l8KrWlmx6p0GpznpL9/6l5BSfJgHFkBInYcWkZyqcNHy6Pe6PILT549O43Ug/5MnoPsfgQ/yJOX/RJ3lcmQzHnM5tmbF400vnXiCjeXI3DQnaBUJeM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(38070700005)(110136005)(921005)(2906002)(86362001)(55016003)(71200400001)(6506007)(478600001)(966005)(83380400001)(38100700002)(122000001)(9686003)(7696005)(33656002)(186003)(66574015)(8936002)(52536014)(41300700001)(76116006)(64756008)(5660300002)(66556008)(66476007)(8676002)(66946007)(66446008)(6636002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVhmTHpDcCtmQUovcFRYR3liYUVNVmNINUNUQzFqMEcwUi9jNXJibjhwOS9W?=
 =?utf-8?B?NU1lejhndmhtMUNya3pKZEZobzJCQjhXaXJTenVjQjRrVDJUVnZjVzYzQWt0?=
 =?utf-8?B?QlJPanowaEF6S2Z4TG4zdGNBcCtGeG9WN29NbXhYQ29xbk9hNFNMYkllZzJo?=
 =?utf-8?B?QktDZDNnU2gva09raDB5UzlNMzA0STd3SlRwYnFGMXRHT0VNWUR3YjBKMWVJ?=
 =?utf-8?B?S21ON0hndkphSGRKKzF6TzBIQnFuT3ZvMElIZGxPUExwbHlkNDhVL2NVL1ZI?=
 =?utf-8?B?VjNUU0ZYYzFlKzMzcitSSUdZRTlyQkhWUGx0WExwOGsyZzZYVm1NSE5pY3I4?=
 =?utf-8?B?TGNWOW9iU05GUW9LNUtUZ2FsT1FRMFJlaitJdktGWE05eG1KUzdsY2JwWTFS?=
 =?utf-8?B?bjBIRFZFMUdOMDJ6Y3pZUHRyRnpJNFZ2d3ZJRVEvSWRJQVNGNnJXLzE1UUs1?=
 =?utf-8?B?anYyZ0p1SlFuVHpIUTEzZEs2UDBuTXZQRHlGbW9tUW5Kc2w5YmNnekdpOSs1?=
 =?utf-8?B?ejJ3eXdBQndDcG5wY1FBTVhCWmtCV1lkWkxFVllkbjFZcDRnRjdkeWNweDZO?=
 =?utf-8?B?dDlWMkNzOU5jNlkxZjhSMEx4YUQzdURncHFZNGpkbEtqeWJFOTM5blp4WlU4?=
 =?utf-8?B?SWVBaFJmVExaNDF3QVBUWnZ1N2x6cTdmZnRZTUV4U3JVdXoxNThGQ1hXK0g3?=
 =?utf-8?B?T1hoOEZGN3BrZ0xSUW9KdXNTY1hLaU9pcVZFUWhkY21rWFBNRlFiOHd2c0Fp?=
 =?utf-8?B?MmxZOWUrYXJkcmtIbFFsMzcwaFRYVFYrN1QyM0l4SmZ1dVNoOXVlelc3QjJx?=
 =?utf-8?B?cWwxSlFNVEpHYmNmZjJQWkxIQVRkUTJFZzNIZGlWdWdFSzhGMEt0a3V6OUxq?=
 =?utf-8?B?T2NHeUQwQ3F5cXRlK0J1TWRVV0k5TkJvMHlsSnlMNG5WalQrWGtkZmQrbzhC?=
 =?utf-8?B?RGZEWUNkZGE0WXJTRXRTYWZDZGlhRlMwWEtlaDFBaC9sNFUvOXpoNVVwL2Mv?=
 =?utf-8?B?M0pjMWVYZVJTbnpRYWNKNnlMYlYyb21ndUxVa3FRN0lONU8zVE5vL3JrVXdE?=
 =?utf-8?B?ajY1SHkrTVNIb2V4L0RmUklsY1cza25sZFJGVytoR3Z2MGQvV291M1J0bldH?=
 =?utf-8?B?L2g0aVIxdFB2eVNCcXRJVUNyRGZubEZya1F1S21vSkg5a0t1Slk3TCtpZFdn?=
 =?utf-8?B?UEZHbWIwQVlEc2NHWkJvQWszaXgva2luQVFCblFqUldJMUd3MnoxOVozYnpz?=
 =?utf-8?B?M0VLc3VoRFJ5R0czYVRveGFJMU1RaGNZOTNEbTdzN3RuNTdUVnAwdmJKQzFB?=
 =?utf-8?B?aUQ5M290Z2RKdElGbmpJNldsNHkzeEsxczJkdHgvejRiN0pmWW9zMXl5d0wv?=
 =?utf-8?B?cEJEOGJGMktJY1J5bWlwZmxONG5oT3E2NDQzeXUzZDh4TVc4QUZMSFM0T2h6?=
 =?utf-8?B?SGxnZFp0eExJZzVlNlIzSUhnM2RUWFAvVnFXVEFlVndSd3g4WmI3VEpiVnFv?=
 =?utf-8?B?bWVMeGRHVHgzQUUwUWdaQkRsWWJOZkZlcmlrVnFTNmpEUThoT2kwWXk1ZzBT?=
 =?utf-8?B?RzNaamxON0QrcU5oVVlWSU1wVjVxdVBLUDBJMUhPSGpTM0hYSkFyeDRzVG1p?=
 =?utf-8?B?K1dGS285MkR5U3ZRYkxrTjFrREQzQ3hUY3ZCUVJPYmpvTEx6QittRHhtK3NR?=
 =?utf-8?B?bHVEZEtsNkdkNTRFTnkxYkJWc25iZFhwMHRmNk95OFl0RWY0cVVCRGx1Z0My?=
 =?utf-8?B?M2pnblR5WmpkV3dHQkdiQmtKMXZEZzVzSUF1TEplV2tCQUJEWG1kME9FZjBn?=
 =?utf-8?B?ZytQNTF6bXJmL01QTlNOU1FIakY5elV0Um1jSXg0azhobEErQlF6QWdHbjNa?=
 =?utf-8?B?cENFNzFXQnc0M3dGNzBzMjdkWW5lMHl0aFRMZ2ZuTVdhRmFLVGliTHlxUWtw?=
 =?utf-8?B?THd0UnhiZ3dKRlRUV2RramZaWHlHWjB1TkRMY1MzbHRiUnFtRmxrQWw0b3JH?=
 =?utf-8?B?VEtiZFdnVjdObzNCWU5KMnUxNXZod3ZUR2NFTXRvaXhYby9uWUNZamFoOFUx?=
 =?utf-8?B?ZUczQTFhRDVOM0U5dURBYit1UzlDL1drVDZra0VzRVFvZnlrYkVyVEwzSEhs?=
 =?utf-8?B?b1lMdnFNY21BY2I0SUlVYUdiMlVDUTF0RGZNTm5maWhMNXRrWW50MnkvcmFh?=
 =?utf-8?Q?BHVVrWVImD5AeNpm5GxGHmU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca92c650-de86-41d3-656a-08dacba09eb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:13:14.3484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJtG0WZT6MZmac/JqLHGV7iPWLzV1KNn02+xs69Cxnt3+Cj/rh6UJDn7vSvHNvKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPiBqPNbRha/XkPqBzVRT6Cc9KJAb4k6iZpeEBUCndg=;
 b=FiB4x23ODcxysayCIsVDhTnRArz2tOESayJ0/P50aIgaLBbhycVUHhJ3Nn+8ETOdlQCrCjOBk3pZMQJ8TIBQEypZqY+egq/fbGl+ejLQYy8uB55kYTv4BqcyUSNeE+stWrmKq94zAiIDXu0a0xNXyYLpwWCz79AKhBbmwLv7V80=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FiB4x23O
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/versal_vck190: new defconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gZXZlcnlvbmUNCg0KSnVzdCBhIGZyaWVuZGx5IHJlbWluZGVyLiAgQW55IGFkZGl0aW9u
YWwgZmVlZGJhY2sgcmVnYXJkaW5nIHRoaXMgcGF0Y2ggc2V0Pw0KDQo+IEhpIEx1Y2EsDQo+IA0K
PiA+IExlIDkgbm92LiAyMDIyIMOgIDE1OjU2LCBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xp
QGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6DQo+ID4gDQo+ID4g77u/T24gV2VkLCA5IE5vdiAyMDIy
IDAyOjEyOjE0IC0wNzAwDQo+ID4gTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdy
b3RlOg0KPiA+ICAgDQo+ID4+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBYaWxpbnggVmVy
c2FsIFZDSzE5MCBldmFsdWF0aW9uIGJvYXJkLg0KPiA+PiANCj4gPj4gVkNLMTkwIGZlYXR1cmVz
IGNhbiBiZSBmb3VuZCBoZXJlOg0KPiA+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3Rz
L2JvYXJkcy1hbmQta2l0cy92Y2sxOTAuaHRtbA0KPiA+PiANCj4gPj4gVGhlIFZDSzE5MCBpcyBi
YXNlZCBvbiB0aGUgWGlsaW54IFZlcnNhbCBmYW1pbHk6DQo+ID4+IGh0dHBzOi8vd3d3LnhpbGlu
eC5jb20vcHJvZHVjdHMvc2lsaWNvbi1kZXZpY2VzL2FjYXAvdmVyc2FsLmh0bWwNCj4gPj4gDQo+
ID4+IFRoZSBWQzE5MDIgaW5jbHVkZWQgd2l0aCB0aGUgVkNLMTkwIGV2YWx1YXRpb24gYm9hcmQg
aGFzIFhpbGlueCBBSSANCj4gPj4gRW5naW5lIGFjY2xlcmF0b3JzIGRlc2lnbmVkIGZvciBhY2Nl
bGVyYXRpbmcgbWFjaGluZSBsZWFybmluZyANCj4gPj4gYXBwbGljYXRpb25zLiAgQWxzbyBpbmNs
dWRlZCBpcyBhbiB1cGdyYWRlIGZyb20gcHJpb3IgWnlucSBhbmQgDQo+ID4+IFp5bnFNUCBmYW1p
bGllcyB0byBBUk0gQ29ydGV4LUE3MiBjb3Jlcy4NCj4gPj4gDQo+ID4+IFdoaWxlIHRoZSBMaW51
eCBrZXJuZWwgZm9yIFZlcnNhbCBpcyBxdWl0ZSBzaW1pbGFyIHRvIFp5bnFNUCwgdGhlIA0KPiA+
PiBib290IHByb2Nlc3MgaGFzIHNpZ25pZmljYW50bHkgY2hhbmdlZC4NCj4gPj4gDQo+ID4+IFRy
aXBsZS1yZWR1bmRhbnQgTWljcm9CbGF6ZSBjb3JlcyBhcmUgdXNlZCB0byBib290IGFuZCBzZXR1
cCBWZXJzYWwgDQo+ID4+IGRldmljZXMuICBGb3IgdGhpcyByZWFzb24sIGN1cnJlbnQgYnVpbGRy
b290IHN1cHBvcnQgd2lsbCBkb3dubG9hZCANCj4gPj4gcHJlLWJ1aWx0IGZpcm13YXJlIGltYWdl
cyBhbmQgdXNlIFhpbGlueCBib290Z2VuIHRvIGdlbmVyYXRlIHRoZSANCj4gPj4gYm9vdC5iaW4g
Zm9yIHRoZSB2Y2sxOTAuDQo+ID4+IA0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8
bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4gPiANCj4gPiBbLi4uXQ0KPiA+ICAgDQo+ID4+IGRpZmYg
LS1naXQgYS9jb25maWdzL3ZlcnNhbF92Y2sxOTBfZGVmY29uZmlnIA0KPiA+PiBiL2NvbmZpZ3Mv
dmVyc2FsX3ZjazE5MF9kZWZjb25maWcgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggDQo+ID4+
IDAwMDAwMDAwMDAuLjhjNWQzOTFiOTcNCj4gPj4gLS0tIC9kZXYvbnVsbA0KPiA+PiArKysgYi9j
b25maWdzL3ZlcnNhbF92Y2sxOTBfZGVmY29uZmlnDQo+ID4+IEBAIC0wLDAgKzEsMzggQEANCj4g
Pj4gK0JSMl9hYXJjaDY0PXkNCj4gPj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fNV8xNT15DQo+ID4+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC92
ZXJzYWwvcG9zdC1idWlsZC5zaCINCj4gPj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9
ImJvYXJkL3ZlcnNhbC9wb3N0LWltYWdlLnNoIg0KPiA+PiArQlIyX1JPT1RGU19QT1NUX1NDUklQ
VF9BUkdTPSJ0dHlBTUEwLDExNTIwMCBtbWNibGswcDIgdmNrMTkwIg0KPiA+PiArQlIyX0xJTlVY
X0tFUk5FTD15DQo+ID4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkNCj4gPj4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIs
WGlsaW54LGxpbnV4LXhsbngseGxueF9yZWJhc2VfdjUuMTVfTFRTXzIwMjIuMikveGxueF9yZWJh
c2VfdjUuMTVfTFRTXzIwMjIuMi50YXIuZ3oiDQo+ID4+ICtCUjJfTElOVVhfS0VSTkVMX0RFRkNP
TkZJRz0ieGlsaW54X3ZlcnNhbCINCj4gPj4gK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9
eQ0KPiA+PiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InhpbGlueC92ZXJzYWwt
dmNrMTkwLXJldjEuMSINCj4gPj4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NM
PXkNCj4gPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQ0KPiA+PiArQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkNCj4gPj4gKyMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQgDQo+
ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkNCj4gPj4gK0JSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTEw9eQ0KPiA+PiArQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1
YixYaWxpbngsYXJtLXRydXN0ZWQtZmlybXdhcmUseGxueF9yZWJhc2VfdjIuNl8yMDIyLjIpL3hs
bnhfcmViYXNlX3YyLjZfMjAyMi4yLnRhci5neiINCj4gPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfUExBVEZPUk09InZlcnNhbCINCj4gPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQkwzMV9VQk9PVD15DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0FU
Rl9CTDMxPXkNCj4gPj4gK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzFfRUxGPXkNCj4g
Pj4gK0JSMl9UQVJHRVRfVUJPT1Q9eQ0KPiA+PiArQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNU
RU1fS0NPTkZJRz15DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJCQUxMPXkNCj4g
Pj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRo
dWIsWGlsaW54LHUtYm9vdC14bG54LHhsbnhfcmViYXNlX3YyMDIyLjAxXzIwMjIuMikveGxueF9y
ZWJhc2VfdjIwMjIuMDFfMjAyMi4yLnRhci5neiINCj4gPj4gK0JSMl9UQVJHRVRfVUJPT1RfQk9B
UkRfREVGQ09ORklHPSJ4aWxpbnhfdmVyc2FsX3ZpcnQiDQo+ID4+ICtCUjJfVEFSR0VUX1VCT09U
X0NVU1RPTV9NQUtFT1BUUz0iREVWSUNFX1RSRUU9dmVyc2FsLXZjazE5MC1yZXYxLjEiDQo+ID4+
ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX05F
RURTX09QRU5TU0w9eQ0KPiA+PiArQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfRUxGPXkNCj4gPj4g
K0JSMl9QQUNLQUdFX1ZFUlNBTF9GSVJNV0FSRT15DQo+ID4+ICtCUjJfUEFDS0FHRV9WRVJTQUxf
RklSTVdBUkVfVkVSU0lPTj0idjIwMjIuMiINCj4gPj4gK0JSMl9QQUNLQUdFX1ZFUlNBTF9GSVJN
V0FSRV9CT0FSRD0idmNrMTkwIiAgDQo+ID4gDQo+ID4gVGhlc2UgdHdvIGxpbmVzIHNob3VsZCBi
ZSByZW1vdmVkLiBUaGV5IGhvbGQgdGhlIGRlZmF1bHQgdmFsdWVzIA0KPiA+IGFmdGVyIGl0IGhh
cyBiZWVuIGFkZGVkIHRvIHBhdGNoIDEuDQo+IA0KPiBXaGlsZSBmdW5jdGlvbmFsbHksIHlvdSBh
cmUgY29ycmVjdCB0aGF0IEkgY2FuIHJlbW92ZSB0aGVzZSB0d28gbGluZXMsIEkgYW0gbm90IHN1
cmUgaXQgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLg0KPiANCj4gSSBkZXNpZ25lZCB0aGVzZSBw
YXRjaGVzIHdpdGggdGhlIGlkZWEgb2Ygc3VwcG9ydGluZyBhZGRpdGlvbmFsIHZlcnNhbCBib2Fy
ZHMgaW4gdGhlIGZ1dHVyZS4gIFdoZW4gYSBzZWNvbmQgYm9hcmQgZ2V0cyBzdXBwb3J0ZWQsIGl0
IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBmb3IgZWFjaCBkZWZjb25maWcgYmUgZGVzaWduZWQgZm9y
IHRoZSBzcGVjaWZpYyBib2FyZC4NCj4gDQo+IEkgb25seSBjcmVhdGVkIGEgZGVmYXVsdCwgc28g
dGhhdCB0aGUgcGFja2FnZSB3b3VsZCBhbHdheXMgYnVpbGQsIGV2ZW4gd2l0aCB0ZXN0cyB3aGVy
ZSB0aGVzZSBwYXJhbWV0ZXJzIGFyZSBub3QgZGVmaW5lZC4gIEJ1dCBpbiByZWFsaXR5LCBJIHdv
dWxkIGxpa2UgdXNlcnMgdG8gYWx3YXlzIHNwZWNpZnkgdGhlc2UgcGFyYW1ldGVycyB0byBnZXQg
dGhlIHJpZ2h0IGJvb3QgZmlybXdhcmUgZmlsZXMgZm9yIHRoZWlyIGJvYXJkLg0KPiANCj4gT25l
IHRoaW5nIEkgY291bGQgZG8gaXMgZ2V0IHJpZCBvZiB0aGUgdmVyc2lvbiBkZWZpbml0aW9uIGlu
IHRoZSBkZWZjb25maWcgZmlsZSBhbmQgbGV0IHRoYXQganVzdCBiZSBkZWZhdWx0IChsYXRlc3Qp
IHVubGVzcyBzcGVjaWZpZWQgb3RoZXJ3aXNlIGJ5IGEgdXNlci4NCg0KPiBUaGlua2luZyB0d2lj
ZSBhYm91dCB0aGF0IEkgdGhpbmsgeW91IGhhdmUgYSBnb29kIHBvaW50IGhlcmUsIGF0IGxlYXN0
IGZvciB0aGUgdmVyc2lvbiB3aG9zZSBkZWZhdWx0IGlzIGxpa2VseSB0byBjaGFuZ2UgaW4gdGhl
IGZ1dHVyZS4gU28geW91IGNhbiBsZWF2ZSBpdCBhcyBpcywgZm9yZ2V0IGFib3V0IG15IGNvbW1l
bnQuDQoNCj4gUmV2aWV3ZWQtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxp
bi5jb20+DQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
