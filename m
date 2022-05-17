Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D818C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B06C640BA9;
	Tue, 17 May 2022 07:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJV_eg_Dgvg4; Tue, 17 May 2022 07:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E53140B81;
	Tue, 17 May 2022 07:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4B1A1BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C770883337
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXuGtQCUFsNJ for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 861B7832DB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxIyV12FIjZiZJKNchr9l0UjgnMfn/QTOPnhOIg/uUO6r1aSmpjxbY/0d9GJUtlEZepTQPuEA8vEklSWSX9nd94meUZOHiCgVB4BP/MX+XvhvIz/HO/b8X5TUmEYpUnM4i8GM/t7QUJfehx1rwPhZvEXK5OxEAsVMIBzGjRVLqfhB8B51m/MKmPnPxeBgiaQmGS6I0v9hsdfRnCGkWhJbBwiiWOyQzAKPcDOAZ5nAWglfC4+xq+9vTh0xAlZ4zESxf5uwPkHI3XdgvEbZe5pxWy7R+2Hx8SdNJ7+nRKDAJCt9DIwzI6KcpNMs/u7O/Qx7v0df8DGMngcrFhqIGZOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8RWWjYT/+4/60It/gi1D/cUW4palm5eeJwpE5pKig8=;
 b=AutCOpiOsq+Tys/L08nysOTfh+4+eoHKRI92IZ/xMtLdYjbLz1swa3isyHXliAe1YJeL5rC0fJTV+gEYS1gv1QGCfZjWeJJojlJ4rGGzFulJrf0KX+dWpfLdU65IxmDn+vGaeQ+bsH5XIXbozNtw4vMPxWnrgmt9yTbmLUCYEdSmRtjpeev4qFlu3ew+ShbhTA7dl3WWBUSbrd2NDA59AXYluFuTwWuZHt1IPIBkDUoGr4vmBRUanJz325a6rJVf520xLCQTej+W0g+1JytH+jUPbYDEVKeoGpsQd5sONQGbbEz5X3nHrikSJy7ZLzbWaieIx/1OSzJx26jdWlO1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8RWWjYT/+4/60It/gi1D/cUW4palm5eeJwpE5pKig8=;
 b=ZSXDVL4JZ/TlAXykhUgRsZFLXqgv3DbFkiPNg4c/aogkA6cPMGml2zO6krnj9l2rRIYfpXHepCJsJ+UIcQcfANubmY0JnJZx0eJC6iyC03wpeIHrAScIK0ONTA8Y7VwrSpL1+3cifvvvnvJvFiP8OEANgPgkZdxs7v1O6FEnVGY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN1PR02MB3855.namprd02.prod.outlook.com (2603:10b6:802:31::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 07:50:31 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 07:50:31 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIAAB08QgAAchVCABhYOAIAAALfg
Date: Tue, 17 May 2022 07:50:31 +0000
Message-ID: <SJ0PR02MB7758AB17CAA7DA20A7458C70D7CE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758C4D738BDB949E2A2C0DBD7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758610ADD04816CE25C00D9D7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <367a3562-5f82-3ed1-b2b6-63d4316102d7@lucaceresoli.net>
In-Reply-To: <367a3562-5f82-3ed1-b2b6-63d4316102d7@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6daa10af-8430-4d0f-4095-08da37d9eacb
x-ms-traffictypediagnostic: SN1PR02MB3855:EE_
x-microsoft-antispam-prvs: <SN1PR02MB3855AA2638F391873C1B5C79D7CE9@SN1PR02MB3855.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Tex6pE2HvOUIzjbR0pExbvPk50w89jhjYN7BVJ4PkFAFzAS17xyUksS3+iiA2n7gjtnOm9gQPuLlbN9Cylrc6K6AQq88Y/059KexjOxzw/WX6txG3Z1FBRhWuIL28NScK5wE1hnfr0tndaZbXqeYiaZjXisp25OESXke+bpPfRNX3L04EHhYq7ml2fibiOG4evO8OyKT0EjAVqT5zE0MgmpVZznRrnQJmvSJIu4l5zbyEr6lEPJHIdGmVdCT7hxj+D2t/DnvVKGTuxLJRNy+S/V2d8x5IAZup4lmCPvnfLLHfSGW7ynvDVW7IXIvQk2ECthFF3oHlRaOcOMNsJwd4CLitttJAz8GqenvRh+HgkY4QzWpq9b5s3/VN6xF3+9n3MyNG1YdTifdcVAEspGfMZ09U+uFCft2bLoBGNDP06Q1UNMkfO/6dcSFprZgUlwsZY/dfzw/s0sMz6+r7CCndQsWJhtwP1hR/m50jJS+bq2d+Qu0/cd0qL/u17bZwYYR22ObF/5jdF3K2MdN8tt64/FHWIiA/Ee63xooNRwyIIM17zxMgaTseykQN7eFeENyde6VuY/J1ZVI4LHXWzseSNJF8RpJwDs4TUyBUZowaXH9C3EMCvFZvtQklrWjpTwWPSTUl14R6+Qh/d3sjWJaUpF8YKDp7QZf7b/O7DHZscSAziN4Aks6bXn4JFSVGyVu1PUpfHw2iPP0KR0JGmWOzXt1zIYdqJkXGq/JE07o0Dihtev6sHHe8+ccPGrHkNV06zIDZgxyIrgct1pukKm6ds6bwtTUfD9gL+dVkPZCUh3/MbmFREh5psyJZT/DURT9lqyTMKPa0HUZ3NlndwpqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(2906002)(122000001)(33656002)(9686003)(26005)(86362001)(8936002)(52536014)(7696005)(316002)(6506007)(55016003)(508600001)(110136005)(54906003)(186003)(966005)(83380400001)(66574015)(38100700002)(38070700005)(8676002)(76116006)(4326008)(66446008)(66476007)(66946007)(66556008)(64756008)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVpMMkZHeVlicGR2SWZmNWh3Zk9SVndPeFR4dnVrYXdZeGFIVXVzS2lBSTBX?=
 =?utf-8?B?ams3OWY0UVRzb2g0aWNWWUtWT2NUMVFFVTVoR2pIU0lYcTdCVU5MamZYY2hx?=
 =?utf-8?B?Z0ttRVdwL3NMdEhzTGd1Y3NFYVBXZ0h3alljNXVEQStYRlF4VVFqVDJjdW0y?=
 =?utf-8?B?V2NhNzF1UVoxVnQ5NytXNklHK0JQbS91VXE4V2JPNzZxNDFhaDNNODEwcTdh?=
 =?utf-8?B?QWZXdW8rUXVtRG1kejJMSkRUTlNzUHhmbU1hZnlic0twV1ZEWmIrem1NV1RF?=
 =?utf-8?B?N1lEdURJOGQ0bkdwVEdRZVFWbURnN2RxVVNLVWhWcXFQbUMzWW1HZ1dXNHpX?=
 =?utf-8?B?R3hXNkdXUWFlQTZSblN0TURYb1J2NU5lWDNxSUl3dk5FS2tlTEJ4TXBDQzNk?=
 =?utf-8?B?cmFCTXZCQXJGRjJMMHZQN0QyVDlhNm0wdEtUaGxYcTBHSU41bVNJblh0NVo5?=
 =?utf-8?B?cy9FTWtpWFpiV0RYcERXRzRVQWRMVXpBd1gwTG8xL05vSHQ0NFNiRjRCV09Y?=
 =?utf-8?B?RGZkSDdIVFYvbU15dlJ6WGxsMzdFMmZabUs0MHZSQm50S01GbUlpeFltNVZv?=
 =?utf-8?B?dDg4L2J1ZzR2TTlhcGRLRElHNDhkSktTRGpvdG81Z1BYSVNTQ1pwVnN3V05T?=
 =?utf-8?B?aUV0SDUxOU1yWjJOemVRY29PcWxSVVlSRXU2dnM4c1BMWlIxNGd6QUo0WXBW?=
 =?utf-8?B?c0IzRWdGTWI1TTUzVkpnWnJyamdHT2xRR1NjRkVYMG5wVmNUeWFIMkpmSmhD?=
 =?utf-8?B?dEZDMnZ2R3FFSG0yVFNlOTBXK2UwSHVoZXhOVmxEditHYW9ZNUJWSHA1TDdR?=
 =?utf-8?B?UnYzNEE2cWdYQUNhTnA4dFdUMFhDQVA2Q2EyS3c2bThpS2xraEtobUdEVVNx?=
 =?utf-8?B?eTljV1gxZ3RrRmYwcXhrb09way9RMDYvdExMZno0ZEQ2TFZTamdWVnE4SlpZ?=
 =?utf-8?B?NWphVm5ic2RxYitwSWlQdGE5ejF1YmRBVVlLWFNFR29qYVM1TGpwRWpHWDBO?=
 =?utf-8?B?TUd0SW9iZ3czcDduY3pUazlNV1NqWVZyYkVnUzJmWTBpWVhodXlLb0VQL2M3?=
 =?utf-8?B?NUJ4bmgzOWVaUmJKbmV3dHBLRGlCUTV3cC85T0hSWTQ1Z0U1TUlLVVloUnVq?=
 =?utf-8?B?Q2J4ZGR4YWpkaEdsQXdqK0EyMTR6V0t0K2Y1S0JSTXRSTWlXZlBocGxkUjZ1?=
 =?utf-8?B?Y0QxenA5MEtDOU10S3h0WEtKdnFVQTVUUis3R1Y0UjcyR1NRQ2MzK2ZFUnN1?=
 =?utf-8?B?ZXdoTTVoaXYvWWNqRCtISVBmc1gvVjZnK2U2bnBiUi9ja0ozRDJ3ZlN2NGtj?=
 =?utf-8?B?RHJjZjdIYkRFYytxVG1yNFpVVExQbVJkQ0M0WEpJdzZBZ29aa1gxSHpPNktP?=
 =?utf-8?B?SmF5MlNyL2Fjd0dWdXhBUll1ZFM1Tm0vR3NXTkVyL3M1Z0o4NTM5MUsxeHY1?=
 =?utf-8?B?WDZxR3lkS2t5Nnd4cURTRlVnVmo1cDYyWWt0c3gvUHplNFlwUmpoZ2V2c3NW?=
 =?utf-8?B?b0RrV0hvRGI0ald5QVRjRG9rVjJqK25QYk5oR1lYMkZmckcvUm8vaXhJcFFv?=
 =?utf-8?B?Um1FOGNIemJkTEV2RGRnaHp1RU1pektqRGx5UVVVemxaK2NDN1dSbGJqL3I4?=
 =?utf-8?B?eXZtdjIvMHRSTzcvRDk1WnlyRHB1R2pVbzBiTGkydG55WlBGdGF6L2kyZ2Rn?=
 =?utf-8?B?QkwyWFNLeUtZbmw5UnY5ZDdkcndLT0NZNFlOOVNQTHpuTk94Y3NrSldJdUZy?=
 =?utf-8?B?dDJuaVhTU1RJei9NbTVsWkxURHpZOXNUd3Z3b0NqMzU0NWtBcEkreVJ5MWZz?=
 =?utf-8?B?cm9YVGRiamdBNklTdUhTN2d3QVZYQ3JVZnJZREExa1lPWlE2Z0hqZytEVDlS?=
 =?utf-8?B?RnE5aEMxOE4rbmlURmJyVDF6L3BNM2tsa3pEdmVsTkxNN1NLOUdDTUlidXh3?=
 =?utf-8?B?N3VHQnhTcmE1WFRrcElidExIdVRoQWNCWms2NjZZMzVLZnJTSHprZENJZ25n?=
 =?utf-8?B?eExzNFFYN3JwWW1JQ0xyWnJWSUt4STgvdlBzRnZIT0gvd3lDZ00yMWVEdUJ4?=
 =?utf-8?B?T2NMV2crMll3d2pBWG1GTW9DdEtBcVIxNWFReVM1eURvMHJRbFlhZWw5SUtL?=
 =?utf-8?B?cjNYcUY5VE1lOVFrM3E2STgzTytsTjlTbXgvK2NNQlZNTEQreXBlRTZ5TGk4?=
 =?utf-8?B?b1pUaVNWeDhoalpLOHN2TnNROWxya3F4YmRSMmRRejJCQnNmNDg3TGMyRmQ1?=
 =?utf-8?B?ekE2YmZuUGRRL3d1K2hCVEY5MTI5ZGZ4RHUxVHE0L1hCK2gvcUl1eWxpeVEw?=
 =?utf-8?Q?RlvgOcfqdb1z6625ZJ?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daa10af-8430-4d0f-4095-08da37d9eacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 07:50:31.2653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8iMOh9mQUqraUBIXHrKCn0AexpN/Fh5j9WDrqGEmeg54RN4wzx8fpqHAbKgn2kTlyvxSPNoeVRsNTdw2XGrwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3855
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBMdWNhLA0KPg0KPj4gSGkgUGV0ZXIsIEx1Y2EsDQo+Pg0KPj4NCj4+
DQo+Pj4gTGUgMTIgbWFpIDIwMjIgw6AgMjE6MzMsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPj4+DQo+Pj4g77u/Q0FVVElPTjogVGhpcyBtZXNzYWdl
IGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBQbGVhc2UgdXNlIHByb3Bl
ciBqdWRnbWVudCBhbmQgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5n
IGxpbmtzLCBvciByZXNwb25kaW5nIHRvIHRoaXMgZW1haWwuDQo+Pj4NCj4+Pg0KPj4+Pj4+Pj4g
Ik5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbnguY29tPiB3cml0ZXM6DQo+Pj4NCj4+
PiBIaSwNCj4+Pg0KPj4+Pj4+IEkgaGFkIHRvIGFsc28gcGFzcyB0aGUgLW0qIGZsYWdzIGluIEVY
VFJBX0NPTVBJTEVSX0ZMQUdTIHRvIGdldCANCj4+Pj4+PiBpdCB0byBsaW5rLCBwcmVzdW1hYmx5
IHRoZSBwZXRhbGludXggdG9vbGNoYWluIGhhcyBpbmNvbXBhdGlibGUgDQo+Pj4+Pj4gZGVmYXVs
dHMuIEx1Y2EsIGFueSBzcGVjaWZpYyByZWFzb25zIHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8N
Cj4+Pj4+DQo+Pj4+PiBJJ20gYWZyYWlkIEkgaGF2ZSBubyByZWFsIGFuc3dlci4gOiggV2hlbiBJ
IGluaXRpYWxseSB3cm90ZSB0aGUgDQo+Pj4+PiBzY3JpcHQgSSBkaWQgaXQgdG8gaGF2ZSB0aGUg
c2FtZSBsb2dpYyBhcyBwZXRhbGludXguIExhdGVyIEkgDQo+Pj4+PiBkaWRuJ3Qgd2F0Y2ggZm9y
IGl0cyBjaGFuZ2VzLiBJIHdvdWxkIGxvdmUgdG8gYmUgaGVscGZ1bCBidXQgSSANCj4+Pj4+IGhh
dmUgbm8gYWNjZXNzIHRvIGEgenlucW1wIGJvYXJkIG5vdy4NCj4+Pg0KPj4+PiBXb3VsZCBpdCBi
ZSBwb3NzaWJsZSBmb3IgeW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBjaGFuZ2VzIHRoYXQgDQo+
Pj4+IFBldGVyIGhhcyBwcm9wb3NlZD8gIFBldGVyIGFwcGVhcnMgdG8gaGF2ZSBhbHJlYWR5IGlk
ZW50aWZpZWQgYSBzb2x1dGlvbi4NCj4+Pg0KPj4+PiBCb3RoIFBldGVyIGFuZCBJIGhhdmUgemN1
MTA2IGJvYXJkcywgc28gd2UgY2FuIGJvdGggdGVzdCBhbmQgdmVyaWZ5IA0KPj4+PiB0aGUgdXBk
YXRlIHdvcmtzLg0KPj4+DQo+Pj4gU29ycnksIHRoYXQgaXMgbm90IHRydWUuIEkgaGF2ZW4ndCBm
b3VuZCB0aGUgbWFnaWMgaW5jYXJuYXRpb24gdG8gDQo+Pj4gZ2V0IGEgd29ya2luZyBwbXVmdyBi
dWlsZCB3aXRoIHRoZSB0b29sY2hhaW4gYnVpbHQgYnkgY3Jvc3N0b29sLW5nLiANCj4+PiBNeSBk
aWZmIHdhcyBqdXN0IHRvIHNob3cgd2hhdCBJIGhhZCB0byBjaGFuZ2UgdG8gYWRqdXN0IA0KPj4+
IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIHVzZSBhIHBldGFsaW51eCB0b29sY2hhaW4uDQo+Pj4N
Cj4+DQo+PiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlucW1w
LXBtdWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0YWxp
bnV4IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/DQo+DQo+PiBDYW4geW91IHBv
aW50IHRvIHdoZXJlIHRoZSBwZXRhbGludXggdG9vbGNoYWluIGNvbWVzIGZyb20/DQo+DQo+PiBJ
ZiBwZXRhbGludXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29sY2hhaW4s
IHBvc3NpYmx5IHdpdGggc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBiZSBjb25z
aWRlcmVkLg0KPg0KPj4gSG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1c2UgYSB0b29sY2hhaW4g
dGhhdCBpcyBzaGlwcGVkIGJ5IFZpdGlzLiBJZiBpdCBpcyB0aGUgY2FzZSwgdGhlbiBpdCdzIG5v
dCBhbiBvcHRpb24gaGVyZS4NCj4NCj4+IFRoZSBlc3Qgb3B0aW9uIHdvdWxkIGJlIHRvIGZpeCB0
aGUgY3QtbmcgdG9vbGNoYWluIG9mIGNvdXJzZSwgYnV0IEknbSANCj4+IGFmcmFpZCBJIGNhbm5v
dCBiZSB2ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNwZWNpYWxseSB3aXRob3V0IGFuIA0KPj4gaGFy
ZHdhcmUgdG8gdGVzdC4gOigNCj4NCj4+IFZpdGlzIGFuZCBQZXRhTGludXggMjAyMi4xIHVzZSBH
Q0MgY29tcGlsZXIgMTEuMi4wIHdpdGggdGhlIGZvbGxvd2luZyBwYXRjaCBzZXQ6DQo+PiBodHRw
czovL2dpdGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L3RyZWUveGxueC1yZWwtdjIwMjIuMS9t
ZXRhLW1pY3INCj4+IG8NCj4+IGJsYXplL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMQ0KPg0K
Pj4gRmVlbCBmcmVlIHRvIHBpY2sgeW91ciBtaXJyb3Igc2l0ZSBmb3IgdGhlIEdDQyAxMS4yLjAg
ZG93bmxvYWQuDQo+DQo+PiBBbm90aGVyIGFsdGVybmF0aXZlIGlzIHRvIGp1c3QgZG93bmxvYWQg
dGhlIHByZS1idWlsdCBjb21waWxlciBkaXJlY3RseSBmcm9tIHRoZSBYaWxpbnggd2Vic2l0ZToN
Cj4+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vcHJvZHVjdHMvZGVzaWduLXRvb2xzL2d1ZXN0LXJl
c291cmNlcy5odG1sI2dudQ0KPj4gMjAyMiANCj4+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vYmlu
L3B1YmxpYy9vcGVuRG93bmxvYWQ/ZmlsZW5hbWU9Z2NjLXhsbngtMTFfMg0KPj4gXzAtcmVsZWFz
ZS56aXANCj4NCj4+IFRoZW4geW91IGFyZSBzdXJlIHRvIGhhdmUgdGhlIGV4YWN0IHNhbWUgY29t
cGlsZXIgUGV0YUxpbnV4IGFuZCBWaXRpcyBhcmUgdXNpbmcsIGFuZCB5b3UgZG8gbm90IG5lZWQg
dG8gd29ycnkgYWJvdXQgYnVpbGRpbmcgdGhlIHRvb2xjaGFpbi4NCj4NCj4gU21hbGwgY29ycmVj
dGlvbi4gIFlvdSBzdGlsbCBuZWVkIHRvIGJ1aWxkIHRoZSBjb21waWxlciBhZnRlciBkb3dubG9h
ZGluZyBpdCBmcm9tIHRoZSBYaWxpbnggcmVsZWFzZSBzaXRlLg0KPg0KPiBXaGF0IGRvIHlvdSB0
aGluaz8gIENvdWxkIHdlIHN3aXRjaCB0byB0aGUgc2FtZSBHQ0MgMTEuMi4wIGNvbXBpbGVyIHRo
YXQgUGV0YUxpbnV4IHVzZXM/DQoNCj4gUGVyaGFwcyBpdCBjb3VsZCBiZSBkb25lLCBob3dldmVy
IEknZCBsaWtlIHRvIHN0YXkgb24gYSBzdGFuZGFyZCBvcGVuIHNvdXJjZSB0b29sIHN1Y2ggYXMg
Y3QtbmcuDQoNCj4gSSB0aGluayB0aGVzZSBzaG91bGQgYmUgZG9uZSwgaW4gdGhpcyBvcmRlcjoN
Cg0KPiAxLiB0cnkgY3QtbmcgMS4yNSwganVzdCByZWxlYXNlZA0KPiAyLiB5b3UgcG9pbnRlZCB0
byB0aGUgbWV0YS14aWxpbnggdHJlZSB3aGljaCBoYXMgNTArIHBhdGNoZXM7DQo+ICAgdXNlIHRo
ZW0gaW4gb3VyIGN0LW5nIGJ1aWxkIGFuZCBzZWUgaWYgdGhleSBmaXggdGhlIHByb2JsZW0NCj4g
ICAtPiBpZiB0aGV5IGRvLCBpc29sYXRlIHRvIG9uZShzKSB0aGF0IGRvIGl0IDMuIG1vcmUgb3B0
aW9ucz8NCj4gOS4gc3dpdGNoIHRvIGJ1aWxkaW5nIHRoZSBYaWxpbnggdG9vbGNoYWluDQoNCkkg
YW0gb2sgd2l0aCB0aGlzIHN0cmF0ZWd5IGFuZCBzdGF5aW5nIG9uIGEgY3QtbmcgdG9vbGNoYWlu
Lg0KT25jZSB5b3UgaGF2ZSBhIHZlcnNpb24gcmVhZHkgd2l0aCBjdC1uZyAxLjI1IGluY2x1ZGlu
ZyB0aGUgbWV0YS14aWxpbnggcGF0Y2hlcyBpbmNsdWRlZCwgSSB3b3VsZCBoYXBweSB0byBidWls
ZCBhbmQgdGVzdC4NCg0KVG8gc2hhcmUgd2l0aCB0aGUgY29tbXVuaXR5LCBJIGhhdmUgdmVyaWZp
ZWQgdGhhdCB0aGUgcG11ZncgcmVib290IGZhaWx1cmUgb2NjdXJzIG9uIGFsbCB6eW5xbXAgaGFy
ZHdhcmUgcGxhdGZvcm1zLg0KSSBoYXZlIHZlcmlmaWVkIHRoYXQgdGhlIHNvZnR3YXJlIHJlYm9v
dCBmYWlscyBvbiB0aGUgemN1MTAyLCB6Y3UxMDYgYW5kIGt2MjYwIGV2YWx1YXRpb24gYm9hcmRz
Lg0KDQpTbyBjbGVhcmx5LCB3ZSBuZWVkIHRvIGZpeCB0aGlzIGZvciBhbnkgZGV2ZWxvcGVycyB3
aG8gd2lzaCB0byB1c2UgdGhlIHp5bnFtcC1wbXVmdy1idWlsZGVyIGZvciBwcm9kdWN0aW9uIHN5
c3RlbXMuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdXBwb3J0IQ0KDQpCZXN0IHJlZ2FyZHMsDQpO
ZWFsIEZyYWdlcg0KQU1EDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
