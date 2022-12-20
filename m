Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB569C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BAED400D9;
	Tue, 20 Dec 2022 08:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BAED400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPwnSwh3jvti; Tue, 20 Dec 2022 08:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 640A540133;
	Tue, 20 Dec 2022 08:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640A540133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8D3E1BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E6160881
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E6160881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6anF15MK5Z1 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D41607D0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38D41607D0
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4OQ9zcZbIZr7Vend5+YU0TaBBYlqq/PDUSSm2sEfJBgN5M212L3QTvjsi2rNxxITV4kJQEUxmxJTzGIsCHvHiodZ+9bl9StGeIly4Ogm2AGpQ7rBQxsZZK5E2Gn5m+CecI94AxksHTqg4e3mOX7qhYzrxpe+b+flSBb0NATxPCgKXS08uMQHjNwfOVjl5g3l97QdbrO5o1DX81fO8MLSqwvhE9uF9nMGYYeOnkV8o/Bj9Dy+0Ep4cG9XnmneC+xpcWkXCwWy5jDfiJdpEybv28vQ4y/sICW8rDkbZcXXMjtU4fNBdYRJREx21UcNwVUeODR4MHFYsvIr11ZHylbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyZB/M24/uLIyhehM7oeHF3udQ5paOa0eIlgDFSvGFY=;
 b=IuPhE5Q3/ywCkWTHSz9nmK6j70yhGx7pluN5eaEA7BieYc/rFFnWHXfpaVfjv7Z7gaSQO1l7/SjpT4Q5sCHTKxtUKtRZ4fYLg+X1pd4vvabTvblHxwjUPxlvydMPsDfW8n1yu7WikRuY1t5SJiVC8dEQbDgLla7Q4b186dgdsMzbHX3lb99Ftp7vA8iztDh8nx1vuzXljXeMQQcAjxxHxQQh82mLzD6qK4iYndF+icJ7V3h5psLoSUWtaiw06hGCltfbSKh+XH5B2nWruyzB072qx9/ZTy7tNANKEvZx6JGl9h/tMT2HAu+wQPIsXDdszZI5P/ycAZsjm5Swbhv5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH0PR12MB5329.namprd12.prod.outlook.com (2603:10b6:610:d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:17:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:17:40 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: use
 CONFIG_MULTI_DTB_FIT work around
Thread-Index: AQHZETVPblOC0EkMJ02+6LohnRI2Aa52bDUAgAABxoCAAAaZAA==
Date: Tue, 20 Dec 2022 08:17:40 +0000
Message-ID: <4AB30A82-4DB9-4DAD-8179-C6F9D3C67730@amd.com>
References: <38D3027F-389D-47B6-B030-1C918282969D@amd.com>
In-Reply-To: <38D3027F-389D-47B6-B030-1C918282969D@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH0PR12MB5329:EE_
x-ms-office365-filtering-correlation-id: 7dd44633-5751-4548-94c1-08dae262a98d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DxOf/YGDh2zRWUuz8uRRMquIpb7Bxw154rYu3t8/hcNQGAXHT946WRPdmNBtnSQy7mbiL6zwgHuPHPL74DKfZ5rp8U1/y2Qnx/DQ7o3AsW1Fl5dRGihOeRgZ2xwldSrNy7KalI1mkuiXp65f0HnNawG4hs6BnOw7fmVxRowEwLdI/53Wnt54S8QcJ4+gTFoTNNm7DJ0oz8nSjnVsClzeafsploGNVlpwB1UfccxJ4GudehCOXVEbP8QcQSPkkMiJfGIT1Tj6aah+EXL0bw0hopKPXHa2ZIEsJ24afL6IHHBqSPTKyvPbzpz/OQu6EdDW0WO5XG3vWWd0ggkvlVeBG5+QDjADALIjSSpGB9Zd6PALK5Vvf+wu8vvdDUIi+A9wqAz+hYrJQaG3z5iwsZ356HdNOh4mQhPni+j7P278hQIjPQIZhilyV+JFyGwy/pAkbvC03GEIVX6S4SKQEQlXeXLuWwOEhp4JQ6xXZEqq9V5MYzWZl6QP6DckWPTUtUki/AFIyPWqWscFxj8/+sDLVCwRu7pMEnyamIxjzCcu8XKeBDE3PozRF2MVxHV6e5vppGMFTxzyRMev2IqRb4miaR1Qpg7CMfAEOVAghyUHC3oiT3BfBkXktyEnsDgw4tKA/BBkXL8zkBkLly9d2HBw3agMDh9U4GP25dGgW0QE+CRo8kQlrnnbmT8jNQflG1vbOW1VSrA3IJOcu9bAQgsRXti0Yl1HTfPKHIsiq52uAyoH21z3lmL3Abl881YvPSsitY5keSkUTAdhYHxt6G9fuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(122000001)(2906002)(38100700002)(66574015)(36756003)(33656002)(6512007)(186003)(41300700001)(38070700005)(86362001)(8936002)(5660300002)(66556008)(91956017)(76116006)(64756008)(4326008)(66476007)(2616005)(66446008)(6486002)(316002)(83380400001)(66946007)(8676002)(478600001)(54906003)(6916009)(966005)(6506007)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHpQMUVhZllmak4rUWxZODR1RkNQR0I0UkNHd2F1MEdRc1pYaEQwbUhqekFZ?=
 =?utf-8?B?UjZ2NHRLS1JMRU1FUklWMlVMajFCT1hhQnFLZGlZOHJLTHplVTRXNy9Wa3VM?=
 =?utf-8?B?NXl0dVB6MmJqdDdGZWoxTzUxdk9KVzhFbzdKT3dRTWw3aFhFd2lsQk9najlR?=
 =?utf-8?B?eHlEZ09mRUJSMVAralB4UXlwS2dYb3FxSExGNmkzaVo1NjNQRTFuMEF2WXNV?=
 =?utf-8?B?MkdDTVVzRkYvSmx4ZE9IbjZzaSt5NHAzTTlETU91cUY5VDl5Y1NwVURnSFRr?=
 =?utf-8?B?ZkpjY3FNWnFEMUNSMlFBTktnM3d1c2E4RWpJY0RhZWRRNHV2bnRNYWx1WHN6?=
 =?utf-8?B?U1RhQ0l2dTl1cUlaK1QycGN2K2NrU1hlRmpobVYrUlV1cFpuTWdLNUN4blMz?=
 =?utf-8?B?ZmdCSnFnNlhBdlhkN0tNTDE5bENWZnhoVW41Zk43dWVOQ1ZyZngwN0RIM29O?=
 =?utf-8?B?aGZmZy9ZTlVTaFBkNHRMaVpzMmsxMXlFNUNtYkkyR0loRXJ3YjdsRzArQkZB?=
 =?utf-8?B?N3JWQksyd28xejQzd3hNTTIrZE9xTk10OE5PNkJBK2JFT1k5d0JnaE83cjlw?=
 =?utf-8?B?dlhSNTJXSE0wc2Vxcm10RnVUMVE1aG43Q3praGwrUVkzb3ZoV2FjeVd5Z0dO?=
 =?utf-8?B?L0x4UG9BaVA2M21TdjNSU2E4dzRhWFB3SC9Cais4YzBUdnh0VTFyclVxRlVF?=
 =?utf-8?B?MU5XQjdkb05CQldZWHF2SnBJdTMwUi9nbTlDekZ3cDZQU3JRNzhiYTJoTkNL?=
 =?utf-8?B?WHdjVFViRXZiR0hidHd0VmIvTUlJWDRoa3oyWmhDVjFmMkdNeG90MzYxVzJ2?=
 =?utf-8?B?Q0lTWS9waDZBcVdzTzBwM0M1WjVXVzdYakwxeGVHTG9VTzRnT0JZNjVMT09N?=
 =?utf-8?B?cngyb2JJbDVmOE5kNUJFSFZNcGNQZ0VqRDVFUUM1aTVucExYTjVpVkluRDB3?=
 =?utf-8?B?Mm1vUm1ZWGFYQS9Tdjl6eU90bW9QYk0vVUtTaTRKanpXRFdHciswL3RCWGpT?=
 =?utf-8?B?QklUNW9kbFduYjBwcHkrS0NkRnFTNmtnOTlEeFVvZ3hrVmJqL1BCanNyQlA2?=
 =?utf-8?B?OXFUeVJOQVFHeTVZeWh4SVRrWEJtL3RXVEdScHBydmZISEZSeFZBYU1MV0Zt?=
 =?utf-8?B?STBRRTNUODNwMW1ENEZkbUhjY0I3TnZEY0VXQTRsaHhYS2Y3NTdaRWFoandw?=
 =?utf-8?B?Y0duQzg4WjZWTGZSZ0hiU0NzUUU3d0VYNnc5NTVhR2M4Z3ZaT0Q1WG9KM1gy?=
 =?utf-8?B?T3pzU2hNQ3Yvd0dPbnF4K05YaVorZE5hUXdJRU9WcW5HZkpQS2w0TldBM2JL?=
 =?utf-8?B?L3hoeURCQUVvc3JlVDlFL0RSSHQ5TFI1WCtDM0poNy95eGZGREhKbloxZ3pJ?=
 =?utf-8?B?M0lDdE0zMGR5Q0NjakVqYmxNclVBUjhvSy85YlRlbm9MUEw5UG5OcjY2UEg5?=
 =?utf-8?B?UHp5UHNydW5URTFYVFA3UzFQYXF2eDNBcnVBVDZDRnh1RU5Bb1RUSXpNa1hB?=
 =?utf-8?B?RlJXNWgxY1kydWlnd05SSUd3dS9WVGMrYkZHWGJac2VDSmFmS1Bua2FISk5o?=
 =?utf-8?B?eXdCV0JyNUJxUDRnMEJ6RzUxU1dSRXVFMzhUVG04MUNsR3pMRWlJTU9hWGI4?=
 =?utf-8?B?dGxVM0Nmdzl4WHBnYzJCcWhRbjJ3MjRRNEtqekVUdmdINjEvT0VFNUNFSVFH?=
 =?utf-8?B?TVg0T2V2RzBEZVlwOER4WThycitOQld4Ry9WVUdqQkVPb05VZWoxYTlZWFlS?=
 =?utf-8?B?TmNKZ09GeVF4N2NOZEltM1JKTEczQ09DRmtVd1ZZbUcwMkZCNTR3Vm9NTk0r?=
 =?utf-8?B?ODZCcHljREhPQ1k3YXc2ZThpN1hJbXJjRlROL3F6OUJnVHc1bXJZYjN1RkRF?=
 =?utf-8?B?a2pnRmV3TlNUeW4vN1E1aXl6TmtwTHdERlg4UE4raXdCN21jN1pkVWJQQzFh?=
 =?utf-8?B?NkdCZi8yZzdzWm5vTk9nTW1pTkM0SGcvNFRRVnpQbExMVUducWRPVHNjQUVZ?=
 =?utf-8?B?YUhQU1ZxYWNXL0tJZ3VWS0RDNlBmNm9OSk15SnRPeWpZMFQzTmYwVnVsS0R0?=
 =?utf-8?B?MDVBZUdPdlR0ZE9pbmVtV2lTeVpSdjJnZVR3M2dUQTNDeEFOY0d1RkNzdkdB?=
 =?utf-8?B?UjlrdU1yRXUwYkpiMmFCb1hEdDFYNXpGb0VYcWl6TFZlZTRkL2ZOeXpFejVz?=
 =?utf-8?Q?eWaCIe2wsGXDctA3hmoEST/XyyexzXGEhpbBrsdUSHsH?=
Content-ID: <D7D9D10514E3DF489018791E125FCCC5@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd44633-5751-4548-94c1-08dae262a98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 08:17:40.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/27xVCzXrQaZNYaRcVDqkP+d4ui4oOMAaQi8WKK/r4tq1c5YE2az+X9/ff2qxfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyZB/M24/uLIyhehM7oeHF3udQ5paOa0eIlgDFSvGFY=;
 b=ytlSsCIJXtntN6ZNWizS3hDwrTXr06rE7YfSDBxS69zJhtkoWXe4cLHFDzhtBrJeL3sU0gSBQ+wEChvZSr+X0NsUtrXIfoDVf3+IcRMoM2V4cjxneNQM0GCTbg8miVlXyaPN+UerabvNuM3pw9yJgXAA+80BA+IPn+y79hBJcEU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ytlSsCIJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 use CONFIG_MULTI_DTB_FIT work around
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
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KDQo+IExlIDIwIGTDqWMuIDIwMjIgw6AgMDg6NTQsIEZyYWdlciwgTmVhbCA8
bmVhbC5mcmFnZXJAYW1kLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/SGkgTHVjYSwNCj4gDQo+
IA0KPj4gTGUgMjAgZMOpYy4gMjAyMiDDoCAwODo0NywgTHVjYSBDZXJlc29saSA8bHVjYS5jZXJl
c29saUBib290bGluLmNvbT4gYSDDqWNyaXQgOg0KPj4gDQo+PiDvu79IZWxsbyBOZWFsLA0KPj4g
DQo+Pj4gT24gRnJpLCAxNiBEZWMgMjAyMiAxMDowMDo0NCArMDAwMA0KPj4+IE5lYWwgRnJhZ2Vy
IDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBDaGFuZ2Ugd29yayBhcm91
bmQgZm9yIGt2MjYwIHUtYm9vdC5pdGIuIFVzZXMgQ09ORklHX01VTFRJX0RUQl9GSVQgZm9yIGZp
dC1kdGIuYmxvYiBnZW5lcmF0aW9uLg0KPj4+IEFkZHMgYSBkZWxheSBiZXR3ZWVuIGZpdC1kdGIu
YmxvYiBnZW5lcmF0aW9uIGFuZCBidWlsZGluZyB0aGUgdS1ib290Lml0YiBkdWUgdG8gYSBidWls
ZCBpc3N1ZQ0KPj4+IHdoZW4gdXNpbmcgdGhlIGJ1aWxkcm9vdCBjb21waWxlci4NCj4+PiANCj4+
PiBUaGlzIHdvcmsgYXJvdW5kIHdpbGwgZXZlbnR1YWxseSBiZSByZXBsYWNlZCB3aGVuIFhpbGlu
eCB1LWJvb3QgbWlncmF0ZXMgdG8gYmlubWFuLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IE5l
YWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IGJvYXJkL3p5bnFt
cC9rcmlhL2t2MjYwL2t2MjYwLnNoICAgICAgICAgICAgICB8ICAyICstDQo+Pj4gLi4uaWxlLWFk
ZC1kZWxheS1mb3ItYnVpbGRyb290LWNvbXBpbGVyLnBhdGNoIHwgMzMgKysrKysrKysrKysrKysr
KysrKw0KPj4+IGJvYXJkL3p5bnFtcC9rcmlhL3Vib290LmZyYWdtZW50ICAgICAgICAgICAgICB8
ICAxICsNCj4+PiBjb25maWdzL3p5bnFtcF9rcmlhX2t2MjYwX2RlZmNvbmZpZyAgICAgICAgICAg
fCAgMSArDQo+Pj4gNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3p5bnFtcC9rcmlhL3BhdGNoZXMvdWJv
b3QvdjEtMDAwMS1NYWtlZmlsZS1hZGQtZGVsYXktZm9yLWJ1aWxkcm9vdC1jb21waWxlci5wYXRj
aA0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS9ib2FyZC96eW5xbXAva3JpYS9rdjI2MC9rdjI2MC5z
aCBiL2JvYXJkL3p5bnFtcC9rcmlhL2t2MjYwL2t2MjYwLnNoDQo+Pj4gaW5kZXggZTg5MTg1MjAw
OS4uZTM0NjdmMzA2OCAxMDA3NTUNCj4+PiAtLS0gYS9ib2FyZC96eW5xbXAva3JpYS9rdjI2MC9r
djI2MC5zaA0KPj4+ICsrKyBiL2JvYXJkL3p5bnFtcC9rcmlhL2t2MjYwL2t2MjYwLnNoDQo+Pj4g
QEAgLTgsNSArOCw1IEBADQo+Pj4gDQo+Pj4gVUJPT1RfRElSPSQ0DQo+Pj4gDQo+Pj4gLWZkdG92
ZXJsYXkgLW8gJHtVQk9PVF9ESVJ9L2FyY2gvYXJtL2R0cy96eW5xbXAtc21rLWsyNi1yZXZBLmR0
YiAtaSAke1VCT09UX0RJUn0vYXJjaC9hcm0vZHRzL3p5bnFtcC1zbWstazI2LXJldkEuZHRiICR7
VUJPT1RfRElSfS9hcmNoL2FybS9kdHMvenlucW1wLXNjay1rdi1nLXJldkIuZHRibw0KPj4+ICtm
ZHRvdmVybGF5IC1vICR7VUJPT1RfRElSfS9maXQtZHRiLmJsb2IgLWkgJHtVQk9PVF9ESVJ9L2Fy
Y2gvYXJtL2R0cy96eW5xbXAtc21rLWsyNi1yZXZBLmR0YiAke1VCT09UX0RJUn0vYXJjaC9hcm0v
ZHRzL3p5bnFtcC1zY2sta3YtZy1yZXZCLmR0Ym8NCj4+PiAke1VCT09UX0RJUn0vdG9vbHMvbWtp
bWFnZSAtRSAtZiAke1VCT09UX0RJUn0vdS1ib290Lml0cyAtQiAweDggJHtCSU5BUklFU19ESVJ9
L3UtYm9vdC5pdGINCj4+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvenlucW1wL2tyaWEvcGF0Y2hlcy91
Ym9vdC92MS0wMDAxLU1ha2VmaWxlLWFkZC1kZWxheS1mb3ItYnVpbGRyb290LWNvbXBpbGVyLnBh
dGNoIGIvYm9hcmQvenlucW1wL2tyaWEvcGF0Y2hlcy91Ym9vdC92MS0wMDAxLU1ha2VmaWxlLWFk
ZC1kZWxheS1mb3ItYnVpbGRyb290LWNvbXBpbGVyLnBhdGNoDQo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi4zOTFmYTg2MWJkDQo+Pj4gLS0tIC9kZXYvbnVs
bA0KPj4+ICsrKyBiL2JvYXJkL3p5bnFtcC9rcmlhL3BhdGNoZXMvdWJvb3QvdjEtMDAwMS1NYWtl
ZmlsZS1hZGQtZGVsYXktZm9yLWJ1aWxkcm9vdC1jb21waWxlci5wYXRjaA0KPj4+IEBAIC0wLDAg
KzEsMzMgQEANCj4+PiArRnJvbSA1ODJiNTJiZWY2OTIxOWRmNjc4ZWQwNDc3MWViNjQzMTE3Y2Qw
OTRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPj4+ICtGcm9tOiBOZWFsIEZyYWdlciA8bmVh
bC5mcmFnZXJAYW1kLmNvbT4NCj4+PiArRGF0ZTogRnJpLCAxNiBEZWMgMjAyMiAwODozNTo0MSAr
MDAwMA0KPj4+ICtTdWJqZWN0OiBbUEFUQ0ggdjEgMS8xXSBNYWtlZmlsZTogYWRkIGRlbGF5IGZv
ciBidWlsZHJvb3QgY29tcGlsZXINCj4+PiArDQo+Pj4gK1doZW4gdXNpbmcgdGhlIGJ1aWxkcm9v
dCBjb21waWxlciwgaXQgYnVpbGRzIHRoZSB1LWJvb3QuaXRiIGltbWVkaWF0ZWx5DQo+Pj4gK2Fm
dGVyIGJ1aWxkaW5nIHRoZSBmaXQtZHRiLmJsb2IuICBUaGlzIGNhdXNlcyBhIGJ1aWxkIGZhaWx1
cmUgd2hlbiB1c2luZw0KPj4+ICt0aGUgQ09ORklHX01VTFRJX0RUQl9GSVQgYnVpbGQgY29uZmln
dXJhdGlvbi4gIFRoaXMgcGF0Y2ggZm9yY2VzIGEgbWluaW1hbA0KPj4+ICtkZWxheSBiZWZvcmUg
YnVpbGRpbmcgdGhlIHUtYm9vdC5pdGIgd2hpY2ggd29ya3MgYXJvdW5kIHRoZSBwcm9ibGVtLg0K
Pj4+ICsNCj4+PiArVGhpcyBwYXRjaCBoYXMgbm90IGJlZW4gc3VibWl0dGVkIHRvIHUtYm9vdCBt
YWlubGluZSBhcyBpdCBpcyBhIHdvcmsgYXJvdW5kDQo+Pj4gK2FuZCBub3QgYSBwcm9wZXIgc29s
dXRpb24uDQo+Pj4gKw0KPj4+ICtTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFn
ZXJAYW1kLmNvbT4NCj4+PiArLS0tDQo+Pj4gKyBNYWtlZmlsZSB8IDEgKw0KPj4+ICsgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4gKw0KPj4+ICtkaWZmIC0tZ2l0IGEvTWFrZWZp
bGUgYi9NYWtlZmlsZQ0KPj4+ICtpbmRleCBiOTZlMmZmYTE1Li4wZDNlMzM3MDRkIDEwMDY0NA0K
Pj4+ICstLS0gYS9NYWtlZmlsZQ0KPj4+ICsrKysgYi9NYWtlZmlsZQ0KPj4+ICtAQCAtMTQyNiw2
ICsxNDI2LDcgQEAgaWZkZWYgVV9CT09UX0lUUw0KPj4+ICsgdS1ib290Lml0YjogdS1ib290LW5v
ZHRiLmJpbiBcDQo+Pj4gKyAgICAgICAgJChpZiAkKENPTkZJR19PRl9TRVBBUkFURSkkKENPTkZJ
R19PRl9FTUJFRCkkKENPTkZJR19TQU5EQk9YKSxkdHMvZHQuZHRiKSBcDQo+Pj4gKyAgICAgICAg
JChVX0JPT1RfSVRTKSBGT1JDRQ0KPj4+ICsrICAgIHNsZWVwIDENCj4+PiArICAgICQoY2FsbCBp
Zl9jaGFuZ2VkLG1rZml0aW1hZ2UpDQo+Pj4gKyAgICAkKEJPQVJEX1NJWkVfQ0hFQ0spDQo+Pj4g
KyBlbmRpZg0KPj4gDQo+PiBJIGRpZG4ndCBzdHVkeSB0aGUgY3VycmVudCBzb3VyY2UgY29kZSB0
byB1bmRlcnN0YW5kIHRoZSBpc3N1ZSwgaG93ZXZlcg0KPj4gdGhlICdzbGVlcCAxJyBoZXJlIHNl
ZW1zIGEgcHJldHR5IGJhZCBoYWNrIGFuZCBub3QgbmVjZXNzYXJpbHkgc29sdmluZw0KPj4gdGhl
IHByb2JsZW0gaW4gYWxsIGNhc2VzLg0KPj4gDQo+PiBBcyBNaWNoYWwgd3JvdGUsIGRlcGVuZGVu
Y2llcyBtdXN0IGJlIGVuZm9yY2VkIHZpYSBtYWtlZmlsZSBydWxlcy4gQW55DQo+PiByZWFzb24g
dGhpcyBjYW5ub3QgYmUgZG9uZSBpbiB0aGlzIHNpdHVhdGlvbj8NCj4+IA0KPiANCj4gVXNpbmcg
dGhlIFhpbGlueCBjb21waWxlciwgdGhlIGJ1aWxkIG9yZGVyIG9mIHUtYm9vdCBpcyBub3QgdGhl
IHNhbWUgYXMgd2l0aCB0aGUgYnVpbGRyb290IGNvbXBpbGVyIGFuZCBJIGRvIG5vdCB1bmRlcnN0
YW5kIHdoeS4NCj4gDQo+IFdpdGggdGhlIFhpbGlueCBjb21waWxlciwgdGhlIGZpdC1kdGIuYmxv
YiBpcyBidWlsdCwgdGhlbiB0aGUgc3BsIGdldHMgYnVpbHQgYW5kIHRoZSB1LWJvb3QuaXRiIGRv
ZXMgbm90IGdldCBnZW5lcmF0ZWQgdW50aWwgdGhlIHZlcnkgZW5kLiAgVGhhbmtzIHRvIHRoaXMg
b3JkZXIsIGV2ZXJ5dGhpbmcgaXMgZmluZSB3aXRoIHRoZSBYaWxpbnggY29tcGlsZXIuDQo+IA0K
PiBXaGVuIHVzaW5nIHRoZSBidWlsZHJvb3QgY29tcGlsZXIsIGl0IGF0dGVtcHRzIHRvIGJ1aWxk
IHRoZSB1LWJvb3QuaXRiIGltbWVkaWF0ZWx5IGFmdGVyIGJ1aWxkaW5nIHRoZSBmaXQtZHRiLmJs
b2IuICBUaGlzIHByb2JsZW0gc3RhcnRlZCB3aGVuIGJ1aWxkcm9vdCB1cGRhdGVkIHRvIGNvbXBp
bGVyIDExLjMgYXMgaXQgd2FzIGJ1aWxkaW5nIGZpbmUgYmVmb3JlLg0KPiANCj4gRXZlbiB0aG91
Z2ggdGhlIGZpdC1kdGIuYmxvYiBpcyBzdGlsbCBidWlsdCBiZWZvcmUgdGhlIHUtYm9vdC5pdGIs
IHRoZSBidWlsZHJvb3QgY29tcGlsZXIgY29tcGxhaW5zIHRoYXQgdGhlIGZpdC1kdGIuYmxvYiBk
b2VzIG5vdCBleGlzdCB5ZXQgYW5kIGVycm9ycyBvdXQuICBTdWJzZXF1ZW50IGJ1aWxkcyB3b3Jr
IGp1c3QgZmluZSBiZWNhdXNlIHRoZSBmaXQtZHRiLmJsb2IgYWxyZWFkeSBleGlzdHMuDQo+IA0K
PiBCeSBhZGRpbmcgdGhlIOKAnHNsZWVwIDHigJ0sIGl0IGlzIGluZGVlZCBhIGhhY2ssIGJ1dCBp
dCBmb3JjZXMgdGhlcmUgdG8gYmUgdGltZSBiZXR3ZWVuIHRoZSBmaXQtZHRiLmJsb2IgYnVpbGQg
YW5kIHRoZSB1LWJvb3QuaXRiIGJ1aWxkIHdoZW4gdXNpbmcgdGhlIGJ1aWxkcm9vdCBjb21waWxl
ci4gIEl0IGlzIG5vdCBhIGdvb2Qgc29sdXRpb24sIGJ1dCBpdCBzb2x2ZXMgdGhlIHByb2JsZW0u
DQo+IA0KPiBJIGFtIGhhcHB5IHRvIHRha2UgYW55IGlkZWFzIGZvciBhIGJldHRlciBzb2x1dGlv
biENCj4gDQoNClRvIHNlZSB0aGUgcHJvYmxlbSBmb3IgeW91cnNlbGYsIHNpbXBseSByZW1vdmUg
dGhlIHNsZWVwIDEgcGF0Y2ggZnJvbSB0aGUgenlucW1wX2tyaWFfa3YyNjBfZGVmY29uZmlnLg0K
DQpUaGUgZmlyc3QgYnVpbGQgd2lsbCBlcnJvciBvdXQgY29tcGxhaW5pbmcgdGhhdCB0aGUgZml0
LWR0Yi5ibG9iIGRvZXMgbm90IGV4aXN0Lg0KDQpJZiB5b3UgdGhlbiBydW46DQptYWtlIHVib290
LXJlY29uZmlndXJlDQoNClRoZSBzZWNvbmQgYnVpbGQgd2lsbCBzdWNjZWVkLg0KDQo+PiAtLSAN
Cj4+IEx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4NCj4+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcNCj4+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0KQmVzdCByZWdhcmRzLA0KTmVh
bCBGcmFnZXINCkFNRApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
