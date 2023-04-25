Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B682C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 10:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69038130A;
	Tue, 25 Apr 2023 10:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69038130A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3XQcHV_eEqk; Tue, 25 Apr 2023 10:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096D9812EA;
	Tue, 25 Apr 2023 10:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096D9812EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0FAD1BF284
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 10:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B107D408B5
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 10:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B107D408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4LxwXrgyapz for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 10:18:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D16408B4
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D16408B4
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:18:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; d="scan'208";a="212145888"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Apr 2023 03:18:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 03:18:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 03:18:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWbfFyw9fq/2wDosDy9SHloZ+tnMeQ+NXXaOKZTFJ4DToiSpt2OU1T9xjGGqE+2BFgyWzPDK2jMcRh0xWSTEoTLSLpoZHfxcZBUvPKW5q+MyMWxckIHNzj45homJJ1FMOfADLMD+Z+3UkeJpbxfL8gqhBSG4nuOLHNZecRpuX2ksIh1J09CbD7DTqlLlTbz5Ms8V/vWbqVn/i3Z13AbBUmYa/ZYGFbluAbsIc1EjrD9ptIvjOZdQUaCkKUTVsP22Goe2R14egeHO07IZ3hOIRilLFA3Di+a2SvFWFRcybI2PuDBDbsy3+MtLAxsIVLyML6jxFIGeASCC3EY1Rzk+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyMmyufJhoJr8zM0L+WO9HVrGpUvmJsDsXErH+NTFgA=;
 b=IUrTdxoz8Bjx8MwamMeWt0MQqOzKPRwA4I8fDqsu4LQOYR7fSK610pVPkmmQJm3kMZaRqdzDdW10G/xIWhZl0WVFu5CX14UN6lcx/oUi4admU7UZSkozHffCwozO1xxcOdEVwbpZ1Hm09KshzscTvAUpQnC+ImSF+h74xvCkgMbfsy4x3qA6240V9xOHPkTr07sS0SeHWTUXOW0JjBVeoALBfxfwQjIqQiEBaYjdNKax7ILqWIgliHccsf8RDOx7zvZoDvdvK/1ebyI+XEuMjQxBd7Bl2Zlbh5fulcLMANwe91PUEG6s32BJsK49eidrJpT5lk+n3FYL6IUlSZn9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.34; Tue, 25 Apr 2023 10:18:42 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::adb:58ac:916e:ab38]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::adb:58ac:916e:ab38%4]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 10:18:42 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/2] package/microchip-hss-payload-generator:
 add host package
Thread-Index: AQHZd04kdYvn8KzRfkuJIaA9e2eJnq87xnWAgAAJdoA=
Date: Tue, 25 Apr 2023 10:18:41 +0000
Message-ID: <01db737b09ac273925c623c44b44a48a366871e0.camel@microchip.com>
References: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
 <20230425081444.1441521-2-jamie.gibbons@microchip.com>
 <20230425114431.5461f144@windsurf>
In-Reply-To: <20230425114431.5461f144@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|IA0PR11MB7332:EE_
x-ms-office365-filtering-correlation-id: f67f0a24-dcf2-434a-7a9e-08db457671c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zMpJBtrodOvNmuXqBhCAkFdeU2/0IQF/xryGvMcYNpw0miy1bG6lwyPexWP+ufRWXS8G4ZamgokNOPclpXNUaqaV+2wnAANXRUwTfRwq5kUT4yQos8nrW3/NZG4kpA9loEcoFPeMv48jsFyqdVg+G0aFV17vYCPIjP9zE4mfH4PZZZorHsycqaaYgfbF9XawFldXG+23BAtcMoXvzA/kMHlWP4+RyL7ViWLqnaGIK21Wm4BlV4y5B2CBtbR07lnZ6ogtn6kOwNG/8ADZT9SvGN0UGqS6x3nd2SEJZeMHAuDvN8EiHi6Ucmz1/FJZVQI3JT/6lwgDwm+qYoNNM/oef6FyRGLci+UZ3MMB0d9ftpjO8ijYe9UZq7N8nbWwej37s38vi3FfXW3uQxsiq+fYwMpswybUFDzwhN/+PjH77LXQCcdHdww7zcAUsl8jU6FdnNpPLtXazpv7FYpXJFno7NwwHAg2HEHX7obLn1SF0nyo53y0fIiyld01b44QvjxaxB0n+jt+1zaUJW1totQGUWPCm8ZEeyWslSczcLNPjqU3IW0rNoiOP/q3czmN2FLx5ReH4xi+xOh0O0QRSScpt6ldGWyecUAj8hn0hYx5ipQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(54906003)(110136005)(478600001)(83380400001)(107886003)(36756003)(26005)(6506007)(6512007)(2616005)(186003)(38100700002)(122000001)(38070700005)(86362001)(71200400001)(6486002)(966005)(41300700001)(91956017)(316002)(64756008)(66446008)(66476007)(66946007)(76116006)(66556008)(4326008)(2906002)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkcwdUgrbDBCaXNtaFFkL2M3NzV2R2J6MmxyNWtFbm1LaFlBNENzbWM2YWlU?=
 =?utf-8?B?WmE5eWxabGx5amRvM2lyYmZKNkZCSm9XQitia0ovd2kzeU5CMUp6NFRJZEV4?=
 =?utf-8?B?QTZkeGFNRkZXckZ6UFhtZmZRZ3hzbmlQMEZ0VFo0bjl5cWh2L1RoNTd5NlRi?=
 =?utf-8?B?Zjc4UUYxeXUzODhnMDVudHBLdk9jWWhybTdnWVRlTFVyejJXcTNwVUFkM2lz?=
 =?utf-8?B?UlIwcnBwdkF4OUdXSFNGSEFlell5SXR3bFhXNURLU25vbEpFS0U4MHBjWWFw?=
 =?utf-8?B?ZENWTm1mT1QyWnFFM0pLUlBHdExQZG5VWmp6WHJhb0RsbkMrZVZvK0pwajVw?=
 =?utf-8?B?SlNvMUYrMHJZTmcvL0JiVnBYZ2N4Ui9Ca1BvZXh3K3ZnYXBqWnlaNG9LcHRn?=
 =?utf-8?B?bDBYRlpsUEpNY2MxUXd6a2VSTStTVzkzRDlxbVBTVGJ1ZVhxL3VYYnprQkZI?=
 =?utf-8?B?dXcyejJ2UWdyZkV1amhBLzFDcEF0Rmx5eXo3YTZ0TmZXNUNBZzZTZGtDeGRB?=
 =?utf-8?B?SXo2YU5Ga3o0WnJBZjJ0RGp4Wkl5d0dhSGRGeWRDdE1pVW9pZmlBRW5kY0xF?=
 =?utf-8?B?Qmk1YTVLZ0FNQTIrZ0ppa3U2aEFaS0VXTzltYno1cmJkWjZMTkN1cVBkdnRk?=
 =?utf-8?B?d2wwVmZnOG5GTUlyWmtBeWh4ekFja2F4OHExWnhnWHROdXZPQmFpMTY5amZM?=
 =?utf-8?B?SkI3OGlaNGx1dlU3MmdyZ2FHSG5IZmppWnBEK0JsaFU4ekhpS2hxZkhRaHBC?=
 =?utf-8?B?b0J2VWt0K3NzWkZjWVc1cFd6ZlJuaU5ubDFOcld2Y3dvNGdPMS85VnRadVhE?=
 =?utf-8?B?b2F2VnNueUtvYlFkVzI4b3ZLSlM1VXcwU2dzdVdsdm54TXZPcys4VVFlcjhJ?=
 =?utf-8?B?Z1FoeG4zMVBBMzFmTllYWEl4RDVHbjNrc0lrZEpRaURPdCtSQVl1U044M0RV?=
 =?utf-8?B?bVZWWHpZajRCNEdRT0M3cThpc2lLRUpTeVBGTFlHbzFJL0FBTXB4eEJNVDJq?=
 =?utf-8?B?MUFrbTZnM1RWejYrQU51Z3hPR1RnNFYzbUtBYWc5VkZqU2U4OHlDM1h5djV4?=
 =?utf-8?B?V0NXMjdYcVZMVzd2QTQvVXpZNmVMazdwTlpOT0NWc1UwS1l1c2o2VVFlWW1i?=
 =?utf-8?B?bnYzSmV5ckNBS1laeTlMdEhqZHc1TnlQLzZ4eE82VndRZmk0cXdiYlZsbCtO?=
 =?utf-8?B?WEloUmNhUTlyK1k3UXZGYmZ2eFhHZXpVNmpDeE5UaUo5blZLWTBWWnd4enJx?=
 =?utf-8?B?SWovS1d4ekNOQjR6ZXJPWCtOSllXbWZkczd0ZjdTMTlmdzVLYlBTUmtmVVFB?=
 =?utf-8?B?a2h6SWYweXFqaVE5aWZsTWZWMjBUZ0VGR1c1ZXNnd1JmNE5NdWdLRWptdG8z?=
 =?utf-8?B?UDVSU1JEUE16NlJ6eThQUlAyNkw0R1J2ZTBoK2pESnh5cENnTUlqbTdaZlJa?=
 =?utf-8?B?OSt0R2YrRkMyMmhzUnpCU0EyaC9Zb1RsL2NPcGowaWExWUcxaml4V1VIL0FK?=
 =?utf-8?B?eVNTcy8rbjIyZTVFbTFhc2FJRDlwQzUvZWY2SHlxWlBaNDBPcFFhRFlQM1N4?=
 =?utf-8?B?K1EzeUZqYlBMcEYyWjNQYWlVOGlWa2pxamlaNEpBS1pib2JwMUJoZ0VhZUla?=
 =?utf-8?B?aGR3YVYvNmRSMzlLL3pJNm9VNGh3YkhDd2dXWDBqTlErOEZwWDlhNEV3dDBu?=
 =?utf-8?B?dVpaWCtvQ0pQaUJON09vMXdocDJWanRCUXorcHBXcVVQVFdiWW5JaU5LMXE0?=
 =?utf-8?B?YXp2MDUwZUtaY2pVd1cwWjh6SlZGa3JjbjhNMEhBc2NEMTZKMkF5MVY4aml0?=
 =?utf-8?B?dzM2ZTl1N0tnM1BwVVhTZHhYRjBORGhhdXZGeFFMNStaVFdTSk1tcGMza2Vh?=
 =?utf-8?B?M1FoaEp0azVQbkkvQ0crcnBia3JoZStjU0N5bXQrb1h2WjMwYTJrcWlRY01q?=
 =?utf-8?B?UTJad1FkNVJUemhkdVpNZU0wR1NreVV6T1pRZGc2YVpteVFURTRCek84Zll2?=
 =?utf-8?B?M3pnWFA0TnZCOU1aQzBZVDd0M3dPSEV4alJQb3ZuTWRZb2xGaVFRanNHb25Z?=
 =?utf-8?B?ZzRzSmdmaHRWZTQzTm5PUmpjY3NwR1YzVVpZR1dFdFFXKzkwTFFIMzdHckUr?=
 =?utf-8?B?Y1ZqbUNvSzVkaXNrNllTbTVuZWpIdEFiK2dkQ3N5dWtvQ2djV0tMaFhlcHcx?=
 =?utf-8?B?SUE9PQ==?=
Content-ID: <6F2C398AE8A3E34CA0AEB9FE3C4AA03B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f0a24-dcf2-434a-7a9e-08db457671c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 10:18:41.9916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4inD+iHQFchsG0kGH+wAz34UNPrmcqoZEo1wiYTmRbVoL1bzyTIXunumYPB2vbMsHTr74SC7o3yMYe11eIID24zk1lDn1JjCtlMPFLOLfOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1682417930; x=1713953930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=QyMmyufJhoJr8zM0L+WO9HVrGpUvmJsDsXErH+NTFgA=;
 b=oMQKBUM/Palow+a05hgM6+60M5Y2RA+3B+P61oxq+/M6pcQZcCpW90JK
 nVXWcVBb2jeQRRnxGyZv8i9tF/GKwRubjD3HuDzm5nK/6LUeeJgbqGAfv
 2UtmQuQtu+1Tp3d7lKhU2EY35gjaJvzvMLPQtlDQnrbLsSMsLQAo597N4
 3+CauHbI8zY5q6FUPUwfGq/2rAwCFOPM/xySPdyD5qDhGOMYzLc9CcMLC
 MOtXGAAaU1uXEAiQEYGPjlVP9bHQbp16Ngm9nRmIsrODTQtO15voXpigg
 l7ZempIWKyH/MrX4PLa6FjR5W8dheUbcxlZ3UHKi4Jm7CD5WGZGvwgcHI
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyMmyufJhoJr8zM0L+WO9HVrGpUvmJsDsXErH+NTFgA=;
 b=lQ/9asBTze+5/lxD0bzTrjK//87+TvezHhkQXlj2ICW98qawAuhJZVr0EsyxaICn42rgIBrrZ078LtnTPlQUQVPbOhwie7UHYxk1ewrIwoGPwejBy5fW8TxdjmuEYbT7qBmjMIoaT2Z/wT4zXxZinPMVCY1cOd3IahFjom0KrpE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=oMQKBUM/; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=lQ/9asBT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/2]
 package/microchip-hss-payload-generator: add host package
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMDIzLTA0LTI1IGF0IDExOjQ0ICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhlbGxvIEph
bWllLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBIZXJlIGFyZSBhIGZldyBjb21tZW50
cyBiZWxvdy4NCg0KSGkgVGhvbWFzLA0KDQpUaGFua3MgYSBtaWxsaW9uIGZvciB5b3VyIGZlZWRi
YWNrLiBJIGhhdmUgdGlkaWVkIHVwIGFuZCBtYWRlIHRoZQ0KY2hhbmdlcyB5b3Ugc3VnZ2VzdGVk
IGJlbG93LiBJIHdpbGwgdXBkYXRlIGFsbCBpbiBhIHYyLg0KDQpUaGFua3MsDQpKYW1pZS4NCj4g
DQo+IE9uIFR1ZSwgMjUgQXByIDIwMjMgMDk6MTQ6NDMgKzAxMDANCj4gSmFtaWUgR2liYm9ucyB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6DQo+IA0KPiA+IMKg
cGFja2FnZS9Db25maWcuaW4uaG9zdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDEgKw0KPiA+IMKgLi4uL0NvbmZpZy5pbi5ob3N0wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrKysN
Cj4gPiDCoC4uLi9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yLm1rwqDCoMKgwqDCoMKg
wqAgfCAyMg0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDCoDMgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWljcm9j
aGlwLWhzcy1wYXlsb2FkLQ0KPiA+IGdlbmVyYXRvci9Db25maWcuaW4uaG9zdA0KPiA+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWljcm9jaGlwLWhzcy1wYXlsb2FkLQ0KPiA+IGdlbmVy
YXRvci9taWNyb2NoaXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yLm1rDQo+IA0KPiBXZSBuZWVkIHRo
ZSBERVZFTE9QRVJTIGZpbGUgdG8gYmUgdXBkYXRlZCB3aXRoIGEgbmV3IGVudHJ5IGZvciB0aGlz
DQo+IHBhY2thZ2UuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3JvY2hpcC1oc3Mt
cGF5bG9hZC1nZW5lcmF0b3IvQ29uZmlnLmluLmhvc3QNCj4gPiBiL3BhY2thZ2UvbWljcm9jaGlw
LWhzcy1wYXlsb2FkLWdlbmVyYXRvci9Db25maWcuaW4uaG9zdA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uN2UwYmJhZDcxOQ0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9wYWNrYWdlL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IvQ29u
ZmlnLmluLmhvc3QNCj4gPiBAQCAtMCwwICsxLDggQEANCj4gPiArY29uZmlnIEJSMl9QQUNLQUdF
X0hPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUg0KPiA+ICvCoMKgwqDCoCBib29s
ICJIU1MgUGF5bG9hZCBHZW5lcmF0b3IiDQo+ID4gK8KgwqDCoMKgIGhlbHANCj4gPiArwqDCoMKg
wqDCoMKgIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DIFBheWxvYWQgR2VuZXJhdG9yLiBUaGlzIHRv
b2wNCj4gPiBjcmVhdGVzIGEgZm9ybWF0dGVkDQo+ID4gK8KgwqDCoMKgwqDCoCBwYXlsb2FkIGlt
YWdlIGZvciB0aGUgSFNTIHplcm8tc3RhZ2UgYm9vdGxvYWRlciBvbg0KPiA+IFBvbGFyRmlyZSBT
b0MsIGdpdmVuIGENCj4gPiArwqDCoMKgwqDCoMKgIGNvbmZpZ3VyYXRpb24gZmlsZSBhbmQgYSBz
ZXQgb2YgRUxGIGJpbmFyaWVzLiBUaGUNCj4gPiBjb25maWd1cmF0aW9uIGZpbGUgaXMNCj4gPiAr
wqDCoMKgwqDCoMKgIHVzZWQgdG8gbWFwIHRoZSBFTEYgYmluYXJpZXMgb3IgYmluYXJ5IGJsb2Jz
IHRvIHRoZQ0KPiA+IGluZGl2aWR1YWwgYXBwbGljYXRpb24NCj4gPiArwqDCoMKgwqDCoMKgIGhh
cnRzIChVNTRzKS4NCj4gDQo+IEF0IHRoZSBlbmQgb2YgdGhlIGhlbHAgdGV4dCwgd2UgbmVlZCBh
biBlbXB0eSBsaW5lLCBmb2xsb3dlZCBieSB0aGUNCj4gaG9tZXBhZ2Ugb2YgdGhlIHByb2plY3Qg
d2ViIHNpdGUgKEdpdGh1YiByZXBvIGhvbWVwYWdlIHdpbGwgd29yaw0KPiBmaW5lKS4NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWljcm9jaGlwLWhzcy1wYXlsb2FkLWdlbmVyYXRvci9t
aWNyb2NoaXAtaHNzLQ0KPiA+IHBheWxvYWQtZ2VuZXJhdG9yLm1rIGIvcGFja2FnZS9taWNyb2No
aXAtaHNzLXBheWxvYWQtDQo+ID4gZ2VuZXJhdG9yL21pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5l
cmF0b3IubWsNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAu
LmNhNWY1OWUwZjENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvcGFja2FnZS9taWNyb2No
aXAtaHNzLXBheWxvYWQtZ2VuZXJhdG9yL21pY3JvY2hpcC1oc3MtDQo+ID4gcGF5bG9hZC1nZW5l
cmF0b3IubWsNCj4gPiBAQCAtMCwwICsxLDIyIEBADQo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICMjIyMj
IyMjIyMjIyMjDQo+ID4gKyAjDQo+ID4gKyAjIE1pY3JvY2hpcCBIYXJ0IFNvZnR3YXJlIFNlcnZp
Y2VzDQo+ID4gKyAjDQo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICMjIyMjIyMjIyMjIyMjDQo+IA0KPiBU
aGUgZm9ybWF0dGluZyBvZiB0aGlzIGhlYWRlciBpcyBub3QgY29ycmVjdDogbm8gc3BhY2VzIGJl
Zm9yZSAjDQo+IHNpZ25zLg0KPiBBbHNvIHRoZSBzdHJpbmcgc2hvdWxkIGJlIGp1c3QgdGhlIHBh
Y2thZ2UgbmFtZToNCj4gIm1pY3JvY2hpcC1oc3MtcGF5bG9hZC1nZW5lcmF0b3IiLg0KPiANCj4g
PiArSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX1ZFUlNJT04gPSB2MjAyMy4w
Mg0KPiA+ICtIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfU0lURSA9ICQoY2Fs
bA0KPiA+IGdpdGh1Yixwb2xhcmZpcmUtc29jLGhhcnQtc29mdHdhcmUtDQo+ID4gc2VydmljZXMs
JChIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfVkVSU0lPTikpDQo+IA0KPiBQ
bGVhc2UgcHV0IHRoZSAidiIgaW4gdGhlIF9TSVRFIHZhcmlhYmxlLCBidXQgbm90IHZlcnNpb246
DQo+IA0KPiBIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfVkVSU0lPTiA9IDIw
MjMuMDINCj4gSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLHBvbGFyZmlyZS0NCj4gc29jLGhhcnQtc29mdHdhcmUtDQo+IHNlcnZpY2VzLHYk
KEhPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9WRVJTSU9OKSkNCj4gDQo+IFRo
aXMgd2F5IGlmIGV2ZXIgcmVsZWFzZS1tb25pdG9yaW5nLm9yZyBpcyB1c2VkIHRvIGRldGVjdCBu
ZXcNCj4gdmVyc2lvbnMNCj4gb2YgdGhpcyBwYWNrYWdlLCBpdCB3aWxsIHdvcmsgY29ycmVjdGx5
Lg0KPiANCj4gPiArSE9TVF9NSUNST0NISVBfSFNTX1BBWUxPQURfR0VORVJBVE9SX0lOU1RBTExf
U1RBR0lORyA9IE5PDQo+ID4gK0hPU1RfTUlDUk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9J
TlNUQUxMX1RBUkdFVCA9IFlFUw0KPiANCj4gQm90aCBvZiB0aGVzZSBsaW5lcyBhcmUgbm90IG5l
ZWRlZDogeW91IGFyZSBkb2luZyBhIGhvc3QgcGFja2FnZS4NCj4gDQo+ID4gK0hPU1RfTUlDUk9D
SElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9MSUNFTlNFID0gTUlUDQo+ID4gK0hPU1RfTUlDUk9D
SElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5tZA0KPiA+
ICtIT1NUX01JQ1JPQ0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfREVQRU5ERU5DSUVTID0gaG9z
dC1lbGZ1dGlscw0KPiA+IGhvc3QtbGlieWFtbA0KPiA+ICsNCj4gPiArZGVmaW5lIEhPU1RfTUlD
Uk9DSElQX0hTU19QQVlMT0FEX0dFTkVSQVRPUl9CVUlMRF9DTURTDQo+ID4gK8KgwqDCoMKgwqDC
oMKgICQoTUFLRSkgLUMgJChARCkvdG9vbHMvaHNzLXBheWxvYWQtZ2VuZXJhdG9yDQo+ID4gSE9T
VF9JTkNMVURFUz0tSSQoSE9TVF9ESVIpL2luY2x1ZGUvIExERkxBR1M9IiQoSE9TVF9MREZMQUdT
KSAtV2wsLQ0KPiA+IHJwYXRoLCQoSE9TVF9ESVIpL2xpYiAtTCQoSE9TVF9ESVIpL2xpYiINCj4g
DQo+IEluZGVudGF0aW9uIHNob3VsZCBiZSBvbmUgdGFiLg0KPiANCj4gV2h5IGRvIHlvdSBuZWVk
IHRvIHBhc3MgLVdsLC1ycGF0aCBhbmQgLUwgaW4gYWRkaXRpb24gdG8NCj4gSE9TVF9MREZMQUdT
Pw0KPiBIT1NUX0xERkxBR1MgaXMgYWxyZWFkeSBkZWZpbmVkIGFzOg0KPiANCj4gSE9TVF9MREZM
QUdTwqAgKz0gLUwkKEhPU1RfRElSKS9saWIgLVdsLC1ycGF0aCwkKEhPU1RfRElSKS9saWINCj4g
DQo+IE92ZXJhbGwsIHRoaXMgc2hvdWxkIGxvb2sgbGlrZSB0aGlzOg0KPiANCj4gwqDCoMKgwqDC
oMKgwqAgJChNQUtFKSAtQyAkKEBEKS90b29scy9oc3MtcGF5bG9hZC1nZW5lcmF0b3IgXA0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSE9TVF9JTkNMVURFUz0iJChIT1NUX0NQUEZM
QUdTKSIgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTERGTEFHUz0iJChIT1NU
X0xERkxBR1MpIg0KPiANCj4gPiArZW5kZWYNCj4gPiArDQo+ID4gK2RlZmluZSBIT1NUX01JQ1JP
Q0hJUF9IU1NfUEFZTE9BRF9HRU5FUkFUT1JfSU5TVEFMTF9DTURTDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAkKElOU1RBTEwpIC1EIC1tIDc1NSAkKEBEKS90b29scy9oc3MtcGF5bG9h
ZC0NCj4gPiBnZW5lcmF0b3IvaHNzLXBheWxvYWQtZ2VuZXJhdG9yICQoSE9TVF9ESVIpL2Jpbi9o
c3MtcGF5bG9hZC0NCj4gPiBnZW5lcmF0b3INCj4gDQo+IEluZGVudGF0aW9uIHNob3VsZCBiZSBv
bmUgdGFiLiBQbGVhc2Ugc3BsaXQgdGhlIGxvbmcgbGluZSB3aXRoIGEgXA0KPiBzb21ld2hlcmUg
KGJldHdlZW4gc291cmNlIGFuZCBkZXN0aW5hdGlvbiBwYXRocywgcHJvYmFibHkpLg0KPiANCj4g
VGhhbmtzIGEgbG90IQ0KPiANCj4gVGhvbWFzDQo+IC0tDQo+IFRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
