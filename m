Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B61C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84FD540C0B;
	Thu, 12 May 2022 16:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqSlVHeiqmi5; Thu, 12 May 2022 16:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ECD6405B4;
	Thu, 12 May 2022 16:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5523E1BF282
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4377660E85
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZObWcQBp0Cvp for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:09:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1122E60E29
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV1dHKi4NHsm6Fl3m5THCqqKasFCtUfpL9uODcZkq4+7kSpGslORU2N2QC4uT4qYaApcImpobesHhYPwRQwV0/Rk/PsG3H5nAJKXoKVIMU69ASI8H05Hx5UlOyDIfw9/MeT6fZ82Ay8vOsS4baeZcO2Ge/da9pRRwW/XWs0KSOiX3yjezZ12jU+0iIflUW8OON2vx7mU5EqgevS5jC98BXQZxYVOM2W8kz2pXeZE0nSgXMSvn1wVWpi6o12/V/CVrU3fhNfkiwvT3RLD1Sihpt0YgDTg32rnKMkwCwGXGmn2yvDyBRf9ojAzEgGqPQQ/2Awg60KviWt5clVgiL1pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcZsPNjzJeWfj5MlepDcY+/zJ7q9IZYvypUuaF0SI4I=;
 b=Xde+rPU4/ZAHfoNQB5BdzgdevpkeSCBzGHYgmdKshDl20E7xiBlsQsIpINupZ57EJxSVloQjj7lPpwMY0zD8JbKcbAIH/f+BPuZpnm87cmCISz3otgrgyitEJVRd/iSh3SnOkudr4RjL6Rn85whnXzXihJlYH3WTNLYwBcvA1zK+44nQz5MfGU6jQlhT58GA56MUC3PI7cJO52RZBTgi/W0p9YURQ+P4LmTkGg4gNJkFZ3+N8rtBXIkaAXDZz+hHo6Y4OtdPziudOcjv2I0P4xW6waGlydmEWIc5xpa1rH9mMBwv5Nmg2J9wDETHHHZbXTEv5KYS26UgjVEpMtldSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcZsPNjzJeWfj5MlepDcY+/zJ7q9IZYvypUuaF0SI4I=;
 b=R+xPWzgKfZlPYiD+H9/GMjGc4AZgYPX1YiE1k1U+ezxliwmvIkrft5MVUyJgjZgfq+jXE1od504RbdfLarPO0XpNqup3RZtpsjXny2jE9KWwE/j6U9v3hKUaSeenhD9wjjGnCNorRRt7w+OhKrCIjtQ29MP65omiTEGEKm4PSTc=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SA0PR02MB7419.namprd02.prod.outlook.com (2603:10b6:806:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 16:09:42 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 16:09:42 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWc=
Date: Thu, 12 May 2022 16:09:42 +0000
Message-ID: <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
In-Reply-To: <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ecfb2dc-608c-4ad3-f6f8-08da3431d2ee
x-ms-traffictypediagnostic: SA0PR02MB7419:EE_
x-microsoft-antispam-prvs: <SA0PR02MB7419495E2A9E4F4A5C6A6585D7CB9@SA0PR02MB7419.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wFO2/i20Ushcq9OHc77yu1pn43WY3w04+wGi+3T4JOX5I8jg6+KjOOa6ANVcuUux2vcS/WfeDFYT/xZVkjYsOgCH27kmlOyNEFA3YqHhZ98/EMe+Q/vIsKmtzKI6U8puN3+XI/EI7YVOpogia5a/AS1oCIi10Nrzf7u5DJR/w+VNfaScranWpZllAa6js+KkOnqUrHzchEDRVyxM8enYnqG+5uBrAvQEfhQHz+hYQG5X95mND6csFJp1H+VcO2AGQPI9X68kre9Z5I47R+y1kdqaKMKXUBSJ9CplcB3mQz0fNQrdhUpiLqpkR84WfpF+Y1qBAkehIpMs+LPF9WTSCNg2OFeSmV8/J5igbNblT5mBIN3lxwidw5FhMrWIy0eHm7BHktNfy5ryHdCSXZc+46eLpHEnc135UI1TGk+VCh7pZ6ZxU85RqZygPBnCp7Jjy1WzWfZBFhzfVbtUXxaliHWjTLJxtdae39L2uzVbXyDntxjFzdCsFG0i3wjzqbPtncMjjAAxIXBtTc+0zljDGyhOtO1h53nJmBgr49OVNI9KMKCCf9X9KYkX8fjvM580mK6IijMu5oq0+OhRi2RynU2BA5iWt3IzkixSaZe3popEl3MVazzaswqq5Zo5eL0LMWM/HZuOHGrQAoLRPslNf12tQ6fTAezqr7B3LH35uLtc9O2BLw/JwY7qTgb7dYlxgz/9PYEJyo3zlvfcLwBNIxsUEDBABEvMnNaqKO8elpGl4NeU86wc3ZKuqW2PLLAj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(66556008)(66446008)(2616005)(6512007)(53546011)(26005)(5660300002)(4326008)(8676002)(66946007)(66574015)(66476007)(186003)(76116006)(71200400001)(54906003)(36756003)(33656002)(316002)(86362001)(6916009)(8936002)(6486002)(508600001)(2906002)(6506007)(83380400001)(122000001)(38070700005)(38100700002)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0llNGRLUGZ1USt2bUs4QnVRV1RybGQrLzA4WDR2RENZZWEzUlFlWkZzZDE1?=
 =?utf-8?B?RTFDaTk0ZGQ3S3g2d3VPTnJxekU2YkZXRnZ1K1IrZjRCV0NPbVo3MkpiQXBw?=
 =?utf-8?B?UDB4NTRwdzY2MWJnbDNSOVYvaEpUQzFsUkNvelJBanRJcVRVbUtUVlRKQ2tF?=
 =?utf-8?B?VzJFb1hQRHA5RnhLdTBrbEdUSXRjVW4wSkhrMTNsZFVtRENDVmNUWGp2QVJs?=
 =?utf-8?B?MXhNMHhoVGFmUURQcDBXYVYweE91bnVxdXhuYzFWcDhYZHlZY0VGU0VsR1JC?=
 =?utf-8?B?cjhnazJwaTRrUmZJeGxqRkpOSE40Rms3ZnI4WjFqeTV0WnJZSHdGVnp2TkV1?=
 =?utf-8?B?NnZGa21PSXh6OUp0cnVic3F6bjZjWjVPY0YzTElVQ1o5OG1YbTUxbWdkNjFm?=
 =?utf-8?B?SjViRmRSL3pGNEFQY1czMGt6bmtxNFVacE8rYjlRK29Xazg0KzgvaHBwU2Z2?=
 =?utf-8?B?UUJKY0hhZEZTb0JxdnFURE9rTXBRRHVRZExCVzB3ZzczQzdZampNRzJxOUpo?=
 =?utf-8?B?OERpYXUxUEJBekN0NFZLc3VoZkdOTEk4UVF2REFtOGlLQzV6bHFJMHdmb2dP?=
 =?utf-8?B?UmNqajQ1WDFjejlGZVgyWHQrb01tRVBRZWlQMTc0VXZuTW45SFZ4bXpsNjR3?=
 =?utf-8?B?SzRHbXFVbTJZdkRpcFJnZldhdEZ6b3ZaL0hWOFFaYUFCTkxwNmFqelNjU2FE?=
 =?utf-8?B?a2hHSXNocng0bEFGWWxwckd4S1poMEF3ZE9lQ01rWnMvQ1g5QUN0WFY2dTNC?=
 =?utf-8?B?Y1crUTRZUHpMcGlpM3JoSEZCazlYb1QrUE1sRFVhaU0xRmlmMU9ZcVhDSUll?=
 =?utf-8?B?WTZ2SWhJc0tYVVJ5WGticVZ0bkhKaDhkeEhrOHlkMVQ0YjRVandLNDExaEVU?=
 =?utf-8?B?TDFkSVdFY252NS9uUkNmMnpHT256UE1JdFI5SFB3M0ZQZDM0SFp2NlVlS0pY?=
 =?utf-8?B?cjdQRmE5bGZDcWxKYXR0dUt2NGsvTGszdEJHSVo1b0VEbW9iQkV2VHcybk9I?=
 =?utf-8?B?R1JpS3Y3dGVjQlRHWWRBditIVTJCZUxwV1dPWFZDNjVxSW16TkdZZmF5VUw5?=
 =?utf-8?B?L2xlcTdzeVl1d1JvZk1CdndWMnNmT0Y4Q2xYVVRrNHZtU2VKbStadkZLOU4z?=
 =?utf-8?B?Nk9rQmU1L0V4NHFWZ1M1d2UzRGs5dEJwZVJ2U29xRHdpa2ZrRzVwbDNOSkdR?=
 =?utf-8?B?V013akZPYksvQjFYWEtlSzVFSlFEYWQrQ1NodktBNkFaRVF6b2c0NU9NN0Y1?=
 =?utf-8?B?MjAvclcyREg3Z3Y3bmhSQ2VjRXNOQTVKeUlJMGhRVWVmZkw2dVc3NmNhOTZw?=
 =?utf-8?B?c3QvWFFTc0hoVGlUNEVMV3crNFFyaFdzQmswbVAyNFdzWWRTcGhtcGFyYWNZ?=
 =?utf-8?B?VDFYUlJKQUhSUkhCSE9jVnQxR00wdmxWY3dDYlc2RkdGSWw5V09pTjI0M2hE?=
 =?utf-8?B?SUxoa0FDZU9ZRnNOZFREVUFpTzhRY1V6TkhWNGkxSFlhdlZLYzRVVXYrRUR4?=
 =?utf-8?B?bVU3eW5HVzVjengwTzdnbFYyZ2dGTVhBbEJCZkg2NTFkd3RNQzNqWm8yQVcz?=
 =?utf-8?B?TnJQUG8wT2ZreFl0Y1NpZkEzNkdSSEtaQ0Q2VDVmb3pWdDlPTU5zdnZudDJT?=
 =?utf-8?B?bkVzSHhwUitWL0dCU3JHZ3ArSFhzOXE0MGZJbHlLWE9UQzRWQzFGTHhFalYx?=
 =?utf-8?B?ZXZKZzE1OVZCb1JEKzBCOXQyNXdCaFU0Q1F6VTdqRjBrS3pnZklvenduM2sx?=
 =?utf-8?B?azRWNkE0aVRSQ09ROGdpUjhJUHdqK0NRakR0b2xYZVdJdUdXT3JlKzZRZ2tj?=
 =?utf-8?B?NHVIQnk4cVhoMGFUcHNGL1RwUnFGaHMzUFhXdWV0RmFKS3VXSHoycW8rMFpj?=
 =?utf-8?B?QnJLbTI0ZmU0Q1JZQ2N6TjBndDhlR2FubURrdTdBa0IvYXBkb0tWU3ZsSkhV?=
 =?utf-8?B?UU80MmJTQjBvdmMrdG1yTWZyZHlGVThqZzVYRUkrT09zNC9TOWtibXVET1dU?=
 =?utf-8?B?MVdOS3l2ZEZaTXlYbENRZUxCSE5XOENieGNMNGVTNjQ1dkNjRlVFREhVOC9L?=
 =?utf-8?B?STVkYWdFNXRhUmVueUM2ZHVXdU1qeHc0Z3QvTGZ5T01Ib1M3WVRvMlFCcm1L?=
 =?utf-8?B?bVVjR0ZLdEIxYUtLL2FLYnNJUTNKRGkvTEZLZDFvNE1PSEI1UHBKUnI1bGc0?=
 =?utf-8?B?a1JIYm9WbXBzcFMrZ3IwNVFrWU1wVnBFdDBGUkNNb0NOMmtucWNtOHZPWWls?=
 =?utf-8?B?SDdMV1pYdm16M3NrLzJ1SEpXOGd0TnkrNnFUczlOZ0lpZk40WHNBeHhqVy9M?=
 =?utf-8?B?UUljSjFBR0dvZEU5ay9pK01NRWxtd1NZcW0yeFg1MUMycWx2Z3h2Zz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecfb2dc-608c-4ad3-f6f8-08da3431d2ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 16:09:42.2936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKPRzFkLhYDjIK3YTnrxGm6HjSD1+c62gcFUPdoApMIQ19P0Xb0PQCwFFXJJ1MThJbWAnLdkdLS29JvPxvas5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7419
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KDQo+IExlIDEyIG1haSAyMDIyIMOgIDE2OjM4LCBMdWNhIENlcmVzb2xpIDxs
dWNhQGx1Y2FjZXJlc29saS5uZXQ+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+IEhp
IFBldGVyLA0KPiANCj4gT24gMTEvMDUvMjIgMTc6NTQsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToN
Cj4+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbnguY29tPiB3cml0ZXM6
DQo+PiANCj4+PiBIaSBMdWNhLA0KPj4+IFdlIG1heSBuZWVkIHlvdXIgaGVscCBvbiB0aGlzIG9u
ZS4NCj4+IA0KPj4+IFBldGVyIGFuZCBJIGhhdmUgYm90aCByZXBsYWNlZCB0aGUgcG11ZncuYmlu
IGdlbmVyYXRlZCBieSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIgd2l0aCB0aGUgb25lIGdlbmVy
YXRlZA0KPj4+IGJ5IHZpdGlzIG9yIHBldGFsaW51eC4gIFdoZW4gd2UgYnVpbGQgdGhlIGJvb3Qu
YmluIHVzaW5nIHRoZSBwbXVmdy5iaW4gZnJvbSB2aXRpcyBvciBwZXRhbGludXgsIHJlYm9vdCB3
b3Jrcw0KPj4+IGFzIGV4cGVjdGVkIHdpdGhvdXQgY2hhbmdpbmcgYW55dGhpbmcgZWxzZS4NCj4+
IA0KPj4+IFNvIHRoZXJlIGFwcGVhcnMgdG8gYmUgc29tZXRoaW5nIGluIHRoZSB6eW5xbXAtcG11
ZnctYnVpbGRlciB3aGljaCBpcyBpbmNvcnJlY3QgZm9yIHRoZSBwbXVmdyAyMDIyLjEuDQo+PiAN
Cj4+IEkgYmVsaWV2ZSBpdCBpcyBhbiBpc3N1ZSB3aXRoIChhIGRpZmZlcmVudCBiZWhhdmlvdXIg
b2YpIHRoZQ0KPj4gdG9vbGNoYWluLiBJIGZvdW5kIGEgbWFjaGluZSBhdCAkV09SSyB3aXRoIHBl
dGFsaW51eCAyMDIxLjEgYW5kIHJlYnVpbGQNCj4+IHp5bnFtcC1wbXVmdy1idWlsZGVyIHdpdGgg
dGhlIGZvbGxvd2luZyBtaW5vciBwYXRjaDoNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2J1aWxkLnNo
IGIvYnVpbGQuc2gNCj4+IGluZGV4IDYzMjE3MzMuLmYwMTE5NGQgMTAwNzU1DQo+PiAtLS0gYS9i
dWlsZC5zaA0KPj4gKysrIGIvYnVpbGQuc2gNCj4+IEBAIC01OSw3ICs1OSw3IEBAIHBtdWZ3X2J1
aWxkKCkNCj4+ICAgICBCU1BfVEFSR0VUU19MSUJESVI9IiR7QlNQX0RJUn0vcHN1X3BtdV8wL2xp
YiINCj4+ICAgICBCU1BfTElCWElMPSIke0JTUF9UQVJHRVRTX0xJQkRJUn0vbGlieGlsLmEiDQo+
PiANCj4+IC0gICAgQ1JPU1M9IiR7SE9NRX0veC10b29scy9taWNyb2JsYXplZWwteGlsaW54LWVs
Zi9iaW4vbWljcm9ibGF6ZWVsLXhpbGlueC1lbGYtIg0KPj4gKyAgICBDUk9TUz0ibWljcm9ibGF6
ZS14aWxpbngtZWxmLSINCj4+ICAgICBDQz0ke0NST1NTfWdjYw0KPj4gICAgIEFSPSR7Q1JPU1N9
YXINCj4+ICAgICBBUz0ke0NST1NTfWFzDQo+PiBAQCAtOTIsNyArOTIsNyBAQCBwbXVmd19idWls
ZCgpDQo+PiAgICAgICAgICAgICAgQVM9IiR7QVN9IiBcDQo+PiAgICAgICAgICAgICAgQ09NUElM
RVI9IiR7Q0N9IiBcDQo+PiAgICAgICAgICAgICAgQ09NUElMRVJfRkxBR1M9Ii1PMiAtYyIgXA0K
Pj4gLSAgICAgICAgICAgICBFWFRSQV9DT01QSUxFUl9GTEFHUz0iLWcgLVdhbGwgLVdleHRyYSAt
T3MgLWZsdG8gLWZmYXQtbHRvLW9iamVjdHMiIFwNCj4+ICsgICAgICAgICAgICAgRVhUUkFfQ09N
UElMRVJfRkxBR1M9Ii1nIC1XYWxsIC1XZXh0cmEgLU9zIC1mbHRvIC1mZmF0LWx0by1vYmplY3Rz
IC1tbGl0dGxlLWVuZGlhbiAtbXhsLWJhcnJlbC1zaGlmdCAtbXhsLXBhdHRlcm4tY29tcGFyZSAt
bWNwdT12OS4yIC1teGwtc29mdC1tdWwiIFwNCj4+ICAgICAgICAgICAgICBBUkNISVZFUj0iJHtB
Un0iIFwNCj4+ICAgICAgICAgICAgICBDRkxBR1M9IiR7Q0ZMQUdTfSIgXA0KPj4gICAgICAgICAg
ICAgIGluY2x1ZGUgbGlicw0KPj4gDQo+PiBJIGhhZCB0byBhbHNvIHBhc3MgdGhlIC1tKiBmbGFn
cyBpbiBFWFRSQV9DT01QSUxFUl9GTEFHUyB0byBnZXQgaXQgdG8NCj4+IGxpbmssIHByZXN1bWFi
bHkgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gaGFzIGluY29tcGF0aWJsZQ0KPj4gZGVmYXVsdHMu
IEx1Y2EsIGFueSBzcGVjaWZpYyByZWFzb25zIHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8NCj4g
DQo+IEknbSBhZnJhaWQgSSBoYXZlIG5vIHJlYWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5
IHdyb3RlIHRoZSBzY3JpcHQgSQ0KPiBkaWQgaXQgdG8gaGF2ZSB0aGUgc2FtZSBsb2dpYyBhcyBw
ZXRhbGludXguIExhdGVyIEkgZGlkbid0IHdhdGNoIGZvciBpdHMNCj4gY2hhbmdlcy4gSSB3b3Vs
ZCBsb3ZlIHRvIGJlIGhlbHBmdWwgYnV0IEkgaGF2ZSBubyBhY2Nlc3MgdG8gYSB6eW5xbXANCj4g
Ym9hcmQgbm93Lg0KPiANCj4gLS0NCj4gTHVjYQ0KDQpXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3Ig
eW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBjaGFuZ2VzIHRoYXQgUGV0ZXIgaGFzIHByb3Bvc2Vk
PyAgUGV0ZXIgYXBwZWFycyB0byBoYXZlIGFscmVhZHkgaWRlbnRpZmllZCBhIHNvbHV0aW9uLiAg
DQoNCkJvdGggUGV0ZXIgYW5kIEkgaGF2ZSB6Y3UxMDYgYm9hcmRzLCBzbyB3ZSBjYW4gYm90aCB0
ZXN0IGFuZCB2ZXJpZnkgdGhlIHVwZGF0ZSB3b3Jrcy4NCg0KVGhhbmtzIGZvciBhbnkgaGVscCEN
Cg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
