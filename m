Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CA6C19F28
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 15:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A44B408A6;
	Tue,  2 Aug 2022 15:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A44B408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMBTfEbCkAha; Tue,  2 Aug 2022 15:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113F840640;
	Tue,  2 Aug 2022 15:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113F840640
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C064C1BF951
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A50F54092B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 15:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50F54092B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrsGzUoAlGEd for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 15:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 902B740928
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 902B740928
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 15:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cccNi5YJko3sMSkrfKVet8UPdzsY6Ky44r+OuRn1a2QbkRjDg2Q/rEroblDZgyauO6LJ2nP7BbFRNr5gdL3aflDEpXj08z1mz8ddDMPAFJ04unYmIJ5QTirV4vkYjRPbupDlMlkbsinayQxyuqySUK3iSFCENyrdYIJ/ss9SfzPuqbboLzTwGuSkFRFbl8gyDshcLImxpAybrbqE55q3zpHvzmIGFhFqwBYJBaRFNGYC/9rcTwzHrDAy1B7vbMreGjzMfxw8VpbsompXlku6CzUHbDO5FBscMXdnBGwgNiSHPdtacT5LBMfDyWOP9Gj4ZXrMn6067zaO2DyCgXR32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ncw/kdmkKNf1/FwLAtejuq1yo8gEWC/1dbsKJOsB/g=;
 b=VZJmzfSlHro+HPJO1HGv8XYNV8jPwXOnwsD5Hiad+qynKVZ0JUWOa10mY15YIxZkoR3e9GEjlI8mj94YM08oVzofssXyQTupLIzC3jp513e7pxXhkKKIEy2HaOIRHMeZnPNwHSj+Ly9uUUn8poxCl6TJ1Jde+gycRYiDKzx3JALu5p15uLtU5hJnh25EyshwhJlnOBkek3tC9MPO/caOPpmC4mAUE8Osql1cHG53L5EX5gKW2X5MMaGxLZA9RWaGxJqiBYKBBGdaduraGYiyEZn3QXfrzETgJZazcWolHokN8tzVtQAgLBonKlNFOuc1Ybg8CUg5zM8W7b1jgYw34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB3599.namprd12.prod.outlook.com (2603:10b6:208:d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 15:06:13 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::253a:804:ec0f:f545]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::253a:804:ec0f:f545%3]) with mapi id 15.20.5504.014; Tue, 2 Aug 2022
 15:06:13 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIB+E1BggAGkngCAAABrsA==
Date: Tue, 2 Aug 2022 15:06:13 +0000
Message-ID: <CH2PR12MB5004747274AA6A197CD0EE81F09D9@CH2PR12MB5004.namprd12.prod.outlook.com>
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
 <CH2PR12MB5004860BC0816E61B757266AF09A9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20220802170112.00ff0966@booty>
In-Reply-To: <20220802170112.00ff0966@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 871680e9-edce-400c-fef6-08da74988acc
x-ms-traffictypediagnostic: MN2PR12MB3599:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Gjd0dkR8Cqp5YlgkDwBbmenhq5oU9hk+ZnkKPe8VLyRsT3l+2OciTpu2scAlYVRWHdWUZW5leOKD9MRHvtMVVqYVQcdMCU5DZTr97yC1XXAk3KFEqSfI7dZGKUtGxDRuolvS+wOSqfmK077KAOuSL10LcYX5krFv56kZ9B8G0Q6Qhaj43/RBTPEHprsYB8XbaqYVKbG2hx9cqMFwdjm3oYlUDmQhg5se4xmBFoeEappJRHuG2pyO7fBNmwvkopGYEKTVZqG8YesW4UumJOwz0tJGYopZfIdKFXUPUtOcJOLNoTpclShMz0KP+y5GezCO0bkLfHpqjwsOk3EJz9aMqhyvuvNsIHRgGsYC9xKzpqr8QT5i6fDLRT0HLt60A5gRM6qeZqkngWYKbDIT3XnQ7FOdYm03dKSuETIdYWdNeCQ6FGZEHtoScAY4JP7WgcVgMfSEcalMyRZ318oe/mVWDTyOQ8Yjfo3hyvALj37vEgI0zFcq19sor2WImOorJVw3uwwB6nSdhbMIfo7GSeF2lJc7kbr1CEIaO4eSriuinPiFNwrYtUSl7fSs2znuoqYl+rYmmHh6OilK5eylwG4nloUVaEYT82pCjeiv5fAb2kGBq3DgD/36g8fEIzTSbZPHQRlt3QCaNwi9drlZUJT3vITz3cRrjcl/mJlg+9KbsRKVLra19sdKISBNahVva6ryPma5cOpX/3nxs6CLCDGe7VVUoDSHCRcoNNEdZcrG92jIbooya3NC1ffiq1wc3jwHCrnGJWXEi7KG3ue3aqwXhp2FNlx+KgQUkDk2EjCi1lbOSE5iPqamArugUYZ7S86gbOZQ/xIuT8fO5KRZJZbUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(83380400001)(53546011)(9686003)(66574015)(186003)(38100700002)(86362001)(38070700005)(122000001)(5660300002)(52536014)(55016003)(8936002)(2906002)(966005)(71200400001)(478600001)(6506007)(7696005)(41300700001)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(8676002)(4326008)(6916009)(316002)(54906003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0lBSmx5R1lDUStvWlF0enVhRlZEMjFDR3lpQzNEVGxrNGdFOEw3QUlyRVRE?=
 =?utf-8?B?bzQ1a2Y1Yng5KzJwQ3lVWk1BZStCdWRtb05aa2hSb0lkV3RWRldqN0t6eS9R?=
 =?utf-8?B?Wi9zSHAwb0NuYzZSK2gwODNCQ29KNlBlRk9BT0plWVJwNDJaTThZTWx6SjZN?=
 =?utf-8?B?MlJDNmhXQ1IyT0tIcFZNSkx3cldUaGdSTVhicnU3Sm4rbjY2ck9Bald3MFF3?=
 =?utf-8?B?b0VzZ28zc21HOVNHbms5aGZpQXdISS9vM1dkVnVONTZtdFFwOWpCODMvcnpV?=
 =?utf-8?B?Wnd2L0phTWZ2MjZqekNQMHk3ZlVYakt6L3RRNFcrTCt1RXB5b0NKMElZSnND?=
 =?utf-8?B?MDdmRDB1aGtTZS9DajVRRlRDUW1YQ1Y0ZGVkVGdqUnYvTjI5Y0JXSC9rNnY3?=
 =?utf-8?B?UVcwcGJFQTd5d3Nwa3JTK2ZYc3NrN3VoMnEwQ1piaFFOWm92eEpLbCtLY0xV?=
 =?utf-8?B?Zk1EbEtlOW5LQWp0MXNXUFBIMW5SR2NpOG9zdjczc3hnQi81cGFVUEtwY2hX?=
 =?utf-8?B?M2Y2aUFydXczSDJaM1k2d0g0WWpUall5S2U2V2hlSndrRHc0QmZSeUwwSHJS?=
 =?utf-8?B?ekI1Sm4rRVdqV0IxdVZyOUNZaVY4SGN2V1B3R3o5RnJ3QUtxdmZETlN1Q3Bz?=
 =?utf-8?B?V3ZueHFHQ0NMaHlEM3F4MW4xamd1a3crK2hHSHZrWGR3Q1REaXh1R0cyb09K?=
 =?utf-8?B?dmY1cElSL3Z6ZG40VHltckVVdFpHVVFWOHhoQVpROHVCTTVtQmpvMCtnZ3N3?=
 =?utf-8?B?c29nZjNmd1RNMnV6dWZtYkx1dVA4ZktnMGRrMGZBNndpekNSK2xWaEpvRm43?=
 =?utf-8?B?ZG4rWTJ5aWMzdlhNT1JaQ3pJbVJ3bmZkaFIybW1PcEkxczJRMjNuRGtOVlAr?=
 =?utf-8?B?WmFvQWRxanNtNkJIS2phNUdLN0k3YUNCODhWYUZLRElmelFBV1RTMGxFb0U1?=
 =?utf-8?B?alE0eGE0L294OEgzekFDRkdrWEVXM0QzTnFRTVNzVXJ2eGRhVENMWkg1cmNq?=
 =?utf-8?B?cDhUT2VUS3FaYkkwQmtBZ3VPWTRMVWswNlE4cko3b1BkVXBXOU9oRHBYUm8v?=
 =?utf-8?B?NVZ5bnNvcEZRRHl5Z1VFK3BTVDRucHJYZ1E4WWQ4RWc5M2l4Vm1TTUlNL2tV?=
 =?utf-8?B?ZlUzdEhJMC9KRWVWaFYvMm5NcXlMYnNpckhJMmJTT0xTMHdjU21TaWFCUVlR?=
 =?utf-8?B?SXNwYU9iZzBVaDFpZUpwSWMvbUZyWTArWjdUZzErenRZWWdYNmRHSnhVT0dO?=
 =?utf-8?B?Y2N2b3ZlYjFweVFoUkZVejlNT3pWaE90SFc0a2NOQkwxc3N1aWFWM0plTzZM?=
 =?utf-8?B?dHM1eEtvelIzZHFSVzNSU05ZRFRTSk9lVnVsVEt3NmRkWTRCR0MzTjVtOU4w?=
 =?utf-8?B?dEI0aHY3WkpNYlp6dDJOL1hCVWlreUR4UmdWOUZ2WnJEd29RK3k3dS9ObUEy?=
 =?utf-8?B?YmhJM1JVMG1YV1pwSXdFZHltd0xteHd2eFpsdEJQZGFJbWh1Ukc2eVVyY2ZJ?=
 =?utf-8?B?YWcrY0dDM05nZHZzSDNVTC9CYytOTTg3Q3RSbUFxem5TSkRySXRrWjlOVVdI?=
 =?utf-8?B?WHMrSTRkbExkM1VYT1lEVEQxYnpvTzJoQldoUDgrUFFBUis1OWZ4VjVmNWZY?=
 =?utf-8?B?NFp1SzJmWTBkSDBXdUlidm4xQXVJdXZqR3EwMW4vbDdqU2NjMkZDQjNiTUR2?=
 =?utf-8?B?czR1Zm80bVhEbXBaTlNqQndvaGV1eVFEa0FLZSt5bHpweHdCL2NCMEoxa1pK?=
 =?utf-8?B?UGRXbVZtK3NZdWNOV040bjh6dWphMHVhTDVWS1BrR25EQnFCM3BFMHlHMTJu?=
 =?utf-8?B?dHpkTGpUdVI5S3RJYUQ5WVZ3Qmo5UDI4QWtpTTBCTEFxVkxhckZ2dVV0em90?=
 =?utf-8?B?cEpvTnhad3YvMm10eUt0UVFCUHdNdlhRSThBLzRhb0JSeWFtanhkZkdyS0xI?=
 =?utf-8?B?RkduU1hmVk13V2pTUHdwemE0eXJqZisyWlNkNlVzR25yREJPcDBjY0NWVElO?=
 =?utf-8?B?U0NDeHg3eDVicWtlMjhiWkF1TlhHcm5uZ051ano4WFlEOE9DQTc5OUVTc0FZ?=
 =?utf-8?B?NW90aTdhcUdid3cyRFhBWkVRNkxsWGVJVktTcFFmV3JGWmRIamdiK0d0c3pE?=
 =?utf-8?B?b2xkbDBsNlFYTUZyYTBhRklIbHZPNStMQkhRQ0lWMHZScnF6N0J3NzFESzRo?=
 =?utf-8?Q?9WYa7pqGbisjSmM9yf1Tyl8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871680e9-edce-400c-fef6-08da74988acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 15:06:13.8419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ul0QG0yFu2hEdAW0jqM4SweBNEyMsO/YSZtOlk3UlsRFbqa5Pgc++7K6dId6c99H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ncw/kdmkKNf1/FwLAtejuq1yo8gEWC/1dbsKJOsB/g=;
 b=peYyQe102lRZ/orxcYAesqa9Jk5LjNIvf766yLgKhM1lCOSN/9IVYGStCwGYfsBCqLtrFTSqnn2MyU4T7zWurEFNfwOBBpr3gpy1tInPzA0X8uCJaejhYNcDBQsCi+agdCD3INZCzTu600FqvNXHzkd0cn+noa7hAjH3Q9z1Rew=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=peYyQe10
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "'giulio.benetti@benettiengineering.com'"
 <giulio.benetti@benettiengineering.com>,
 "'buildroot@buildroot.org'" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KDQo+IEhpIEx1Y2EsDQo+IA0KPiA+IEhpIE5lYWwsDQo+IA0KPiBPbiAxMy8w
NS8yMiAwNjoyMSwgTmVhbCBGcmFnZXIgd3JvdGU6DQo+ID4gSGkgUGV0ZXIsIEx1Y2EsDQo+ID4N
Cj4gPg0KPiA+ICANCj4gPj4gTGUgMTIgbWFpIDIwMjIgw6AgMjE6MzMsIFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPiA+Pg0KPiA+PiDvu79DQVVUSU9O
OiBUaGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBs
ZWFzZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2ht
ZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4NCj4gPj4N
Cj4gPj4gIA0KPiA+Pj4+Pj4+ICJOZWFsIiA9PSBOZWFsIEZyYWdlciA8bmVhbGZAeGlsaW54LmNv
bT4gd3JpdGVzOiAgDQo+ID4+DQo+ID4+IEhpLA0KPiA+PiAgDQo+ID4+Pj4+IEkgaGFkIHRvIGFs
c28gcGFzcyB0aGUgLW0qIGZsYWdzIGluIEVYVFJBX0NPTVBJTEVSX0ZMQUdTIHRvIGdldCANCj4g
Pj4+Pj4gaXQgdG8gbGluaywgcHJlc3VtYWJseSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBoYXMg
aW5jb21wYXRpYmxlIA0KPiA+Pj4+PiBkZWZhdWx0cy4gTHVjYSwgYW55IHNwZWNpZmljIHJlYXNv
bnMgdG8gbm90IHBhc3MgQ0ZMQUdTIHRoZXJlPw0KPiA+Pj4+DQo+ID4+Pj4gSSdtIGFmcmFpZCBJ
IGhhdmUgbm8gcmVhbCBhbnN3ZXIuIDooIFdoZW4gSSBpbml0aWFsbHkgd3JvdGUgdGhlIA0KPiA+
Pj4+IHNjcmlwdCBJIGRpZCBpdCB0byBoYXZlIHRoZSBzYW1lIGxvZ2ljIGFzIHBldGFsaW51eC4g
TGF0ZXIgSSANCj4gPj4+PiBkaWRuJ3Qgd2F0Y2ggZm9yIGl0cyBjaGFuZ2VzLiBJIHdvdWxkIGxv
dmUgdG8gYmUgaGVscGZ1bCBidXQgSSANCj4gPj4+PiBoYXZlIG5vIGFjY2VzcyB0byBhIHp5bnFt
cCBib2FyZCBub3cuDQo+ID4+ICANCj4gPj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciB5b3Ug
dG8ganVzdCBpbXBsZW1lbnQgdGhlIGNoYW5nZXMgdGhhdCANCj4gPj4+IFBldGVyIGhhcyBwcm9w
b3NlZD8gIFBldGVyIGFwcGVhcnMgdG8gaGF2ZSBhbHJlYWR5IGlkZW50aWZpZWQgYSBzb2x1dGlv
bi4NCj4gPj4gIA0KPiA+Pj4gQm90aCBQZXRlciBhbmQgSSBoYXZlIHpjdTEwNiBib2FyZHMsIHNv
IHdlIGNhbiBib3RoIHRlc3QgYW5kIA0KPiA+Pj4gdmVyaWZ5IHRoZSB1cGRhdGUgd29ya3MuDQo+
ID4+DQo+ID4+IFNvcnJ5LCB0aGF0IGlzIG5vdCB0cnVlLiBJIGhhdmVuJ3QgZm91bmQgdGhlIG1h
Z2ljIGluY2FybmF0aW9uIHRvIA0KPiA+PiBnZXQgYSB3b3JraW5nIHBtdWZ3IGJ1aWxkIHdpdGgg
dGhlIHRvb2xjaGFpbiBidWlsdCBieSBjcm9zc3Rvb2wtbmcuIA0KPiA+PiBNeSBkaWZmIHdhcyBq
dXN0IHRvIHNob3cgd2hhdCBJIGhhZCB0byBjaGFuZ2UgdG8gYWRqdXN0IA0KPiA+PiB6eW5xbXAt
cG11ZnctYnVpbGRlciB0byB1c2UgYSBwZXRhbGludXggdG9vbGNoYWluLg0KPiA+PiAgDQo+ID4N
Cj4gPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlucW1wLXBt
dWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0YWxpbnV4
IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/ICANCj4gDQo+ID4gQ2FuIHlvdSBw
b2ludCB0byB3aGVyZSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBjb21lcyBmcm9tPyAgDQo+IA0K
PiA+IElmIHBldGFsaW51eCB1c2VzIGEgcHVibGljbHkgYXZhaWxhYmxlIHByZWJ1aWx0IHRvb2xj
aGFpbiwgcG9zc2libHkgd2l0aCBzb3VyY2VzIGF2YWlsYWJsZSwgdGhlbiB0aGlzIGNvdWxkIGJl
IGNvbnNpZGVyZWQuICANCj4gDQo+ID4gSG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1c2UgYSB0
b29sY2hhaW4gdGhhdCBpcyBzaGlwcGVkIGJ5IFZpdGlzLiBJZiBpdCBpcyB0aGUgY2FzZSwgdGhl
biBpdCdzIG5vdCBhbiBvcHRpb24gaGVyZS4gIA0KPiANCj4gPiBUaGUgZXN0IG9wdGlvbiB3b3Vs
ZCBiZSB0byBmaXggdGhlIGN0LW5nIHRvb2xjaGFpbiBvZiBjb3Vyc2UsIGJ1dCANCj4gPiBJJ20g
YWZyYWlkIEkgY2Fubm90IGJlIHZlcnkgaGVscGZ1bCBvbiB0aGlzLCBlc3BlY2lhbGx5IHdpdGhv
dXQgYW4gDQo+ID4gaGFyZHdhcmUgdG8gdGVzdC4gOigNCj4gDQo+ID4gVml0aXMgYW5kIFBldGFM
aW51eCAyMDIyLjEgdXNlIEdDQyBjb21waWxlciAxMS4yLjAgd2l0aCB0aGUgZm9sbG93aW5nIHBh
dGNoIHNldDoNCj4gPiBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L3RyZWUv
eGxueC1yZWwtdjIwMjIuMS9tZXRhLW1pYw0KPiA+IHJvYmxhemUvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTExDQo+IA0KPiBJIHdhbnRlZCB0byBmb2xsb3cgdXAgb24gdGhpcy4gIEhhdmUgeW91
IGhhZCBhIGNoYW5jZSB0byBhcHBseSB0aGVzZSBwYXRjaGVzIHRvIHRoZSBjb21waWxlciB1c2Vk
IGJ5IHRoZSB6eW5xbXAtcG11ZnctYnVpbGRlcj8NCj4gDQo+IEl0IHdvdWxkIGJlIGdyZWF0IGlm
IHdlIGNvdWxkIHVwZGF0ZSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIgdG8gZ2VuZXJhdGUgZ29v
ZCBwbXVmdyBpbWFnZXMgZm9yIHp5bnFtcCBhbmQga3JpYSBzb21zIGluIHRpbWUgZm9yIHRoZSAy
MDIyLjIgdXBkYXRlLg0KDQo+IEFwb2xvZ2llcywgSSBoYWQgemVybyBzcGFyZSB0aW1lIHRvIHRy
eSB0aGlzLiA6KA0KDQpJIHVuZGVyc3RhbmQuICBNeSBxdWVzdGlvbiB3YXMgbW9yZSB3aGVuIGRv
IHlvdSB0aGluayB5b3UgbWlnaHQgaGF2ZSBzb21lIHRpbWUgZm9yIHRoaXM/DQoNCkFzIG1lbnRp
b25lZCwgSSBjYW4gdGVzdCB0aGUgcG11ZncgYnVpbHQgYnkgdGhlIHp5bnFtcC1wbXVmdy1idWls
ZGVyIG9uIGFjdHVhbCBoYXJkd2FyZSwgc28gSSBjYW4gdmVyaWZ5IGlmIHRoZSBwYXRjaGVkIGNv
bXBpbGVyIHNvbHZlcyB0aGUgcHJvYmxlbSBvciBub3QuDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwg
RnJhZ2VyDQpBTUQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
