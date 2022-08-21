Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC6C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 07:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3F944049C;
	Sun, 21 Aug 2022 07:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F944049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mdef939Jkusr; Sun, 21 Aug 2022 07:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C01E4048B;
	Sun, 21 Aug 2022 07:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C01E4048B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08EF31BF348
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 07:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F9E360B68
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 07:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9E360B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNYB_KaOI8qX for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 07:27:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6996068D
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA6996068D
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 07:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3ugc+lGENsuKt50EqLsAkclkCh0BKDbuSkjvtAiN3LAY6+EeVY+IzYO5DObVpQbxOxgxpMN4vH7FaMHWzs21D+kw9WbHTzeFWL38rtCFy13ywmOZAnda1mZk2U/4jGa24sMgrIAxpWJRo6e/D4lM/dZ6TjpoR7YkKJS+VS4BBMP/IeK5iQgRWHi9P0Dpw9huIlDfV/7oMuYaqAhPMNj40g45YDXsdxFUs3lghps/P9eFyl1NvmyYyLfCiULsRCfHSN57kS1OgwAo5PmHjq5hAbCYrkDHvZAmGJlLmcEQQ0sozRldmKSndRUDVLoDBUPDq1oe3CHDHwXXZeZl4ZbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReNy1tx6tUhXlrK52LxjndYQOjk2D4DbxJ3s9um8I9Y=;
 b=T5quXUsmOXQJhLrIGFcSJJhyN3dL1IF//CeJV1CU6v2BMZAWvcCryN5KmplpLrjElHFAqfwoM2uNVtFekNVmFHGZKz1wKv66911Uqyhl+tYiMHLBwShTezZO/o+9KYEiqI18IulBP2JQiunxXxpoSpaazCmHclD8o75CQKYWKqEr3ASQDUUIVC/zCG/uFCaL3mUXX3nWWzgWY4sqEekk4Uy7ZcgjYG2otJvo+YNkR+12BpKl99FkQKYVabUXIVgkF4tPP+N1rkqZN/9M42GxdhnwCgPyDLVYMOrewkb+27IsOjVOu2hfQgcfKQoXZIrz6Aw3ZR4cs8K0ROV695UfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM5PR12MB1915.namprd12.prod.outlook.com (2603:10b6:3:10c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Sun, 21 Aug
 2022 07:27:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1%8]) with mapi id 15.20.5546.021; Sun, 21 Aug 2022
 07:27:14 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHYs5Yt/VTzzNzFBUGC6DI8hhWoIa2352uAgAAnvqCAABytAIAAy9cA
Date: Sun, 21 Aug 2022 07:27:13 +0000
Message-ID: <E3824005-6AF4-45A2-B399-B10B861975FA@amd.com>
References: <20220820191736.GQ2167049@scaer>
In-Reply-To: <20220820191736.GQ2167049@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c255298e-23a2-468f-804b-08da834691c6
x-ms-traffictypediagnostic: DM5PR12MB1915:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYeOfm0ptNizZYs7N9J48TO8RmRWbi8Rp8VIX9pMJYRVazuzbAokNwPWpgDEwKQqWBWM4bvOmMCWdMN8xIUybptGq9auIbrn2jW3aNTvlGkEeSnaw5bB06T9dB7d+7LijdR2/XIJrsImIxw3KL6HmdpaHeqbHTOy4XHnXIoFKKvLOaMUcpNI0r+eOCIm1gqGF35v41rnj7TkfDi1pX/jNZTE96gF6HpdJ8h3DzlBrxb+gnf92N8yvwLg1Xl+uPIgfuni1QtDNtvzN3ALcb8bM4qkTGaO0nUH8Y1pzVc+wblTBkQLa8j6LoPYoTn6A8E0WY5s4/5SvW3HJTUOqJWcmK9m+XOzrSkj5P8tqYFCfDkPnIVrR9iqtqMIK3is39wTHtDRLpo0XcuWvh6Nr08RmbUjrodo4CfMEAx+ErdZzEN5EH41eTTVQhlNlDeVvdki4wK7xifib0e5OFTYspxjKF4hIutSQGn9frXgzbXI2PF800CcZQofVBbhYynEXfXFB3aWpoVfiHV5OO2hxkxMhTjPvMn8dw854S1V9gGIluXuX0+rq75ji3Qm4OS+JDEcjBwoPdzDnkMEIKsdXsjavMb0JFPzTDkoJ1pWGvBmJjLBVRx8SPp7vMjbTD2cBn+PCQ+Mj8560IGLaj0jfoN/QO0uNF+p/3qcfneIZXbHc4LDm1gHwhOK97CQ2xj9/Bj7AoCNzjba76hd5q5XJ1lJCqTO2IWxnVhh5dmp+ldJGUV709OumBzrorFDD81sz+2kg8jC5GsR8J/tU4wQdhegRir0pp+dcldK90NdWwummBSypaTjJKHzjQ7zjJjPGrfphICU9icHcI6zlaX8XSVD1vLkjqyPr8/1SCXpjOKVSrHF+rsEIOyLQWjsRPtS0w7Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(38070700005)(86362001)(33656002)(38100700002)(122000001)(8936002)(41300700001)(5660300002)(54906003)(6916009)(316002)(6486002)(966005)(478600001)(4326008)(71200400001)(8676002)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(91956017)(2616005)(36756003)(186003)(83380400001)(66574015)(6512007)(2906002)(6506007)(41080700001)(15866825006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWJTblBRWHJkR0o1bDcyMlBRWm1oOGJxU25tdkZ1ZVk5Z1libzNRazlHVzUw?=
 =?utf-8?B?T0VCeHRFRjRIVVJobGthZkd3VUpVN3dBY3ViSlRCTmtVTmF1WXliYjFuVHVK?=
 =?utf-8?B?dGE1UmJNVSs4UDgrRldMZHoycXlzeWt2ZENFdDlYZmFaU1k2Wkh2TDlHczZz?=
 =?utf-8?B?K3dnelFLUkN0SFYyRSsyRmt3U2VEUWxqdnBRbVhhdWszVjNDbCtCK1I2QnVX?=
 =?utf-8?B?TGR4UW9EcmVaV1VqS0QvRHY1VFBPV1YySmgrZ1hsb0l6WjJaUnltR0tlSGZY?=
 =?utf-8?B?MC9qVzBZNGxjOThSZDVhQ3p3OWtIOElVdHpnY2JyRkxWV3lHMmltbk5Hcm5y?=
 =?utf-8?B?bklMUlJ1U2RibFNzT1pRMUFILzhRTHR6WStQaFNaWFRoZFRXN3M1blE3K2hY?=
 =?utf-8?B?eHdIWHFJczVXNnozd1A0d1pmelBzbHFCTHZZL0lvNUR1bE5xM0lleTRVTlNX?=
 =?utf-8?B?dTlFYk1oU2RTNkRRMFAxaUw4YWUwZVpKbXpDakFPcHRRN0d1Rmp3Qm1OdTdO?=
 =?utf-8?B?MmNtZXBUMUhlZ1VrVlJDTmFjRURHczBRM0grR09GS1NBUyt6ZjVFSHI2dGNm?=
 =?utf-8?B?c25WMDhmZ3JlUUJnWGRxRjJXanZ6SkM3SHlqbEdMMys3Tk1NeFFmRkoraU5Z?=
 =?utf-8?B?aUVBMFZxZjE3SnpOTmxhaFNRRXoycXFySmgwU21tRk9uNERLVmxJUE5KalpH?=
 =?utf-8?B?WHY4b0dvNmlHemFXVU5tTGNlYkwxVjJBaytBcTlaeEVZbG96TWxtUnJzMzhv?=
 =?utf-8?B?dk1pQSttVk9OcWtkZm43aTJBUDBXYkkvYkhCeDBIRExZaCt4djZaYUhRNTVS?=
 =?utf-8?B?UHV2anA2cml3c0VxRnRtMjRSTjM4ZXY1b3M4ZVdMR1AwUmVkNlBNRkZGV09S?=
 =?utf-8?B?OGlueEpCVXgxY25QUnNFc0RJUms3TVJwbS9iNjNvODZtaWJUZklidnhZci8z?=
 =?utf-8?B?dWJmMzd2S3dWT21zdVUraU1sYmlzZmJWM25tTS8yejBJQWFKaEg4b29FYU1L?=
 =?utf-8?B?VjVER0F5SEplbzVZSWpqcGJKSXRYV2N5ckcxa0xCa0dGdjlPdlZwNnhOSTFj?=
 =?utf-8?B?MWIvdzdwdmFmRWFBb2J4KzRTNGt1YmF1dS9YeHBlbmgvQjNxU1lZZTB5cXh2?=
 =?utf-8?B?c1ZCK3pRdmgvaHZybG9JNHBxZzhaczVzalhJWktYLzYrcUtyMFBZbndnd0Vi?=
 =?utf-8?B?YmFXL2VsVEg3Z05JSDIwMmNzcHk4UEFTUHBaakVGRHFONEppMVF1elE2VmlZ?=
 =?utf-8?B?K1daY1VxRXBvQXFidVNkVDRDaERXRWtUUHhrbDVjelg5NmJlU0puZ2JZZ29u?=
 =?utf-8?B?MVpBem1QbGtUOFJWZnVpcVgvSk8xOWFRRHdtOHdPNmIxcm1ZMS9SVEFoalUr?=
 =?utf-8?B?Y2hNczVJcWYyUXRra0xJRytISnpwb2VUWnI1eUFqQVJzSFl3bUNYdlNDeEV4?=
 =?utf-8?B?UkgvQ1NIaFdiMU1ic0t6bWh2ZkRSODdIcHJNTVZJSFFZSjVjYjQ0MnBqSFhj?=
 =?utf-8?B?bnJjVFp1VWliYWViVmV6MEJaRklzQzljWnZEMVhHWjBhMnBVdExpeEp5V2Qr?=
 =?utf-8?B?dmlwbFZKdnJjWmVZOEZzYWtzMDhuUlpSaWpNR1RMbmVrdFRwOUFNNnlkSFc0?=
 =?utf-8?B?T0lJemVFd1JuNzd4WGNNVWl2ZkFaeVNuSCt3WERFRTJiVWtzUUNNVTI5Y0Z4?=
 =?utf-8?B?NWFVV0dYU0ZEbjJYcGpQclJQdGtEZzZuRDJHSlA3MmJHNFRMckYxTmNLU2JK?=
 =?utf-8?B?ZXNxZjFYbm9GSGNzY2Jrd0trYjFmeUpnVk1wa3VUSjNaZVpzMGxWM1VKbE5K?=
 =?utf-8?B?ZkxXb0EyZlNRcUZYaWxXWlYxVlNWYUZZaU0walFuK05GN1ZNQmFtQXlGRmhw?=
 =?utf-8?B?Wk54VW9oVEt1YlFiQzFVSWkzdllvRTN3UEd6d2RmL0NWTlF1aTB4UFZWNFdp?=
 =?utf-8?B?bjlka1U0ZjVNNjBUOE5xV3JCMng3QVNMYUxxSWllVDRPTk9vak9iajl1UVFt?=
 =?utf-8?B?NWM0OWtJV0x2UGU2ZVF0QTFnV1VSdG9tVmgrY0V0bjVvc2Q2N0grSzA4eDhs?=
 =?utf-8?B?Ky8wYzZpVTloV0JydDliTUFRZ1lMcHQ5MDJucGJvYnpaeUg1bWVCVCtsOVhS?=
 =?utf-8?B?YmpncFhBVkFTY1ZTTWFpeW9DemZVbVljUE83eWdaVkViZmQwRXl1UVM3STRJ?=
 =?utf-8?Q?3+ra3qItD9TJui9vQ1sA35Q=3D?=
Content-ID: <1C6F154632C31E4692ABBD54426A5075@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c255298e-23a2-468f-804b-08da834691c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2022 07:27:14.2845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhrXRp2KzLhmeS2O6PPOYfl1ivU31DuCXPAlyQUSPE/h+NaF+nYRakEDoZXFuU/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReNy1tx6tUhXlrK52LxjndYQOjk2D4DbxJ3s9um8I9Y=;
 b=fPBlGpc5v8oxGRhu18wJ560t/cT8pj/IXtBWW1GrIIkYKdHi6gBsG+rPjqvb45kmHEnfhEnL7i4WfmF4lK1kaiQm8f3QoXMRfr960R8wmETaxfnf/m+YBSGi3LPW+Iw4vToVV9scjZK37yaWExQ/lDjjT/oDtcfMAbc6t/71Djs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fPBlGpc5
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

SGkgWWFubiwNCg0KPiBMZSAyMCBhb8O7dCAyMDIyIMOgIDIxOjE3LCBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOg0KPiANCj4g77u/TmVhbCwgQWxsLA0K
PiANCj4gT24gMjAyMi0wOC0yMCAxNzo1MiArMDAwMCwgRnJhZ2VyLCBOZWFsIHZpYSBidWlsZHJv
b3Qgc3Bha2UgdGh1c2x5Og0KPj4+IFRoaXMgbG9va3MgbGlrZSB5b3VyIHBlcnNvbmFsIGdpdCB0
cmVlLCBub3QgdGhlIG9mZmljaWFsIG9uZS4gKFllYWgsDQo+Pj4gSSBub3RpY2VkIHlvdXIgZW1h
aWwgYWRkcmVzcywgYnV0IEkgd291bGQgc3RpbGwgaGF2ZSBleHBlY3RlZCBzb21ldGhpbmcNCj4+
PiB1bmRlciBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54LykuDQo+PiBJIGFtIHdvcmtpbmcgb24g
dGhpcyBhbmQgYW0gdXNpbmcgbXkgb3duIHBlcnNvbmFsIGdpdGh1YiBsb2NhdGlvbiBpbg0KPj4g
dGhlIG1lYW50aW1lIHRvIGZpZ3VyZSBvdXQgaG93IHRoaXMgY291bGQgd29yayB3aXRoIGJ1aWxk
cm9vdC4NCj4gDQo+IEFoLCBJIHVuZGVyc3RhbmQgbm93LiBOZXh0IHRpbWUsIG1hcmsgeW91ciBw
YXRjaCBhcyBSRkMuDQo+IA0KPj4+ICtpZiBCUjJfUEFDS0FHRV9WRVJTQUxfRklSTVdBUkUNCj4+
PiArDQo+Pj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9WRVJTQUxfRklSTVdBUkVfTE9DQVRJT04NCj4+
PiArICAgICBzdHJpbmcgInZlcnNhbCBmaXJtd2FyZSBsb2NhdGlvbiINCj4+PiBUaGUgcHJvbXB0
IHNob3VsZCBiZSAiQ3VzdG9tIGdpdCByZXBvc2l0b3J5Ig0KPj4gQ291bGQgeW91IGNsYXJpZnkg
dGhpcyBhIGJpdD8gIEFyZSB5b3Ugc3BlYWtpbmcgb2YgdGhlIEJSMiBuYW1lIG9yIHRoZQ0KPj4g
c3RyaW5nIHRleHQgd2hlbiB5b3Ugc2F5IHRoZSBwcm9tcHQ/DQo+IA0KPiBUaGUgcHJvbXB0IGlz
IHRoZSDDonJ0IHRoYXQgaXMgZGlzcGxheWVkIHRvIHRoZSB1c2VyLCBpLmUuIHRoZSBzdHJpbmcN
Cj4gYmV0d2VlbiBxdW90ZXMgYWZ0ZXIgdGhlIG9wdGlvbiB0eXBlLCBpbiB0aGlzIGNhc2U6ICAi
dmVyc2FsIGZpcm13YXJlDQo+IGxvY2F0aW9uIiBzaG91bGQgYmUgcmVwbGFjZSB3aXRoICJDdXN0
b20gZ2l0IHJlcG9zaXRvcnkiLg0KPiANCj4gQW5kIG9mIGNvdXJzZSwgdGhlIGFzdHV0ZSByZWFk
ZXIgeW91IGFyZSBub3RpY2VkIHRoYXQgdGhlIG9wdGlvbiBuYW1lDQo+IGFscyBuZWVkcyBhIHJl
bmFtZSwgQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJUk1XQVJFX0NVU1RPTV9HSVQNCj4gDQo+IEhvd2V2
ZXIsIHRoaXMgd2lsbCB1bHRpbWF0ZWx5IGJlIHVuZWVkZWQsIGJlY2F1c2UgdGhlIGZpcm13YXJl
IGZpbGVzDQo+IGhvdWxkIGJlIGRvd25sb2FkYWJsZSBsb2dpbi1sZXNzIGZyb20gYW4gb2ZmaWNp
YWwgbG9jYXRpb24uDQo+IA0KPiBTbywgdGhlIHR3byBvcHRpb25zIHRoYXQgc3BlY2lmeSB0aGUg
Z2l0IHRyZWUgbG9jYXRpb24gYWRuIHZlcnNpb24gYXJlDQo+IG5vdCBuZWVkZWQuIEp1c3QgaGFy
ZC1jb2RlIHRoZW0gaW4gdGhlIC5tayBmaWxlDQo+IA0KDQpJIHdpbGwgaGFyZC1jb2RlIHRoZSBs
b2NhdGlvbiBiZWNhdXNlIHlvdSBhcmUgcmlnaHQgdGhhdCBzZWxlY3RpbmcgaXQgaXMgbm90IG5l
Y2Vzc2FyeS4NCg0KSG93ZXZlciwgSSB3b3VsZCBsaWtlIHRvIGtlZXAgdmVyc2lvbiBhbmQgYm9h
cmQgbmFtZSBjb25maWd1cmFibGUgaW4gdGhlIGRlZmNvbmZpZyBmaWxlLg0KDQpUaGlzIHdheSwg
dXNlcnMgY2FuIHNlbGVjdCB3aGljaGV2ZXIgdmVyc2lvbiBvZiBib290IGZpcm13YXJlIHRoZXkg
d2lzaCB0byB1c2UgZm9yIHRoZSB0YXJnZXQgYm9hcmQgdGhleSB3aXNoIHRvIHVzZS4NCg0KDQo+
IFNvLCB0aGUgQ29uZmlnLmluIGZpbGUgc2hvdWxkIG9ubHkgY29udGFpbiAoc2tlbGV0b24gd2l0
aCBhYnJldmlhdGlvbnMsDQo+IGV4dGVuZCBhcy93aGVyZSBhcHByb3ByaWF0ZSk6DQo+IA0KPiAg
ICBjb25maWcgQlIyX1BLR19WRVJTQUxfRlcNCj4gICAgICAgIGJvb2wgInZlcnNhbCBmaXJtd2Fy
ZQ0KPiAgICAgICAgaGVscA0KPiAgICAgICAgICBGaXJtd2FyZSBmaWxlcyB0aGUgdGhlIFhpbGlu
eCBWZXJzYWwgZmFtaWxseSBvZiBib2FyZHMuDQo+IA0KPiAgICAgICAgICBodHRwczovL29mZmlj
aWFsLnhpbGluaXgvbG9jYXRpb24vZ2l0aHViL3doYXRldmVyLw0KPiANCj4gICAgaWYgQlIyX1BL
R19WRVJTQUxfRlcNCj4gDQo+ICAgIGNob2ljZQ0KPiAgICAgICAgYm9vbCAiVmVyc2FsIGJvYXJk
Ig0KPiANCj4gICAgY29uZmlnIEJSMl9QS0dfVkVSU0FMX0ZXX1ZDSzE5MA0KPiAgICAgICAgYm9v
bCAidmNrMTkwDQo+IA0KPiAgICBjb25maWcgQlIyX1BLR19WRVJTQUxfRldfU09NRVRISU5HX0VM
U0UNCj4gICAgICAgIGJvb2wgInNvbWV0aGluZyBlbHNlIg0KPiANCj4gICAgZW5kY2hvaWNlDQo+
IA0KPiAgICBjb25maWcgQlIyX1BLR19WRVJTQUxfRldfQk9BUkQNCj4gICAgICAgIHN0cmluZw0K
PiAgICAgICAgZGVmYXVsdCAidmNrMTkwIiBpZiBCUjJfUEtHX1ZFUlNBTF9GV19WQ0sxOTANCj4g
ICAgICAgIGRlZmF1bHQgInNvbWV0aGluZy1lbHNlIiBpZiBCUjJfUEtHX1ZFUlNBTF9GV19TT01F
VEhJTkdfRUxTRQ0KPiANCj4gICAgZW5kaWYNCj4gDQo+IGFuZCB0aGUgLm1rIHdvdWxkIGxvb2sg
bGlrZToNCj4gDQo+ICAgIFZFUlNBTF9GV19WRVJTSU9OID0gMDc2ZDRiNGYwMmI0NzVkZDljNjVh
ZDUxOTkyYmZjYWQ4ZDk4YjAwMg0KPiAgICBWRVJTQUxfRldfU0lURSA9ICQoY2FsbCBnaXRodWIs
bmVhbGZyYWdlcix2ZXJzYWxfYm9vdCwkKFZFUlNBTEVfRldfVkVSU0lPTikpDQo+IA0KPiAgICBW
RVJTQUxfRldfSU5TVEFMTF9UQVJHRVQgPSBOTw0KPiAgICBWRVJTQUxfRklSTVdBUkVfSU5TVEFM
TF9JTUFHRVMgPSBZRVMNCj4gDQo+ICAgIGRlZmluZSBWRVJTQUxfRldfSU5TVEFMTF9JTUFHRVNf
Q01EUw0KPiAgICAgICAgJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoQEQpLyQoVkVSU0FMX0ZXX0JP
QVJEKS9ib290LmJpbiBcDQo+ICAgICAgICAgICAgJChCSU5BUklFU19ESVIpL2Jvb3QuYmluDQo+
ICAgIGVuZGVmDQo+IA0KPiAgICAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQ0KPiANCg0KVGhh
bmtzIGZvciB0aGlzLg0KDQo+Pj4gKyAgICAgaGVscA0KPj4+ICsgICAgICAgTG9jYXRpb24gb2Yg
YSB2ZXJzYWwgZmlybXdhcmUgYm9vdC5iaW4uDQo+Pj4gKw0KPj4+ICsgICAgICAgVGhlIHZhbHVl
IHNob3VsZCBiZSBhIGdpdCByZXBvc2l0b3J5Lg0KPj4gDQo+Pj4gU28sIHRoZXJlIGlzIG5vdCBl
dmVuIGEgZGVmYXVsdCBsb2NhdGlvbj8NCj4+IA0KPj4gVGhlIG9mZmljaWFsIGRlZmF1bHQgc29s
dXRpb24gKGFzaWRlIGZyb20gcGV0YWxpbnV4KSBpcyB0byBjbG9uZSB0aGUNCj4+IGVtYmVkZGVk
c3cgZ2l0aHViIGxvY2F0aW9uIGFuZCBidWlsZCB0aGUgcGxtLmVsZiBhbmQgcHNtZncuZWxmIGZy
b20NCj4+IHRoYXQgd2l0aCBhIG1pY3JvYmxhemUgY29tcGlsZXIuDQo+PiBBbmQgdGhlbiB1c2Ug
Ym9vdGdlbiB0byBnZW5lcmF0ZSBhIGJvb3QuYmluLg0KPj4gV2hpbGUgSSBjYW4gYnVpbGQgdS1i
b290IGFuZCBhdGYgZWFzaWx5IHdpdGggYnVpbGRyb290LCBJIGRvIG5vdCBoYXZlDQo+PiBhIGNs
ZWFuIHNvbHV0aW9uIGZvciBidWlsZGluZyB0aGUgcGxtIGFuZCBwc21mdyBpbWFnZXMgYW5kIGdl
bmVyYXRpbmcNCj4+IHRoZSBib290LmJpbi4NCj4gDQo+IFllYWgsIEkgY2FuIHNlZSBpdCBiZWlu
ZyBxdWl0ZSBjdW1iZXJzb21lLiBCdXQgaXQgaXMgbm90IHVuaGVhcmQgb2YgaW4NCj4gQnVpbGRy
b290IGFscmVhZHkuIEZvciBleGFtcGxlLCB3ZSBoYXZlIHBhY2thZ2UvYXJtLWdudS10b29sY2hh
aW4vDQo+IHRoYXQgcHJvdmlkZXMgYSBwcmUtYnVpbHQgYXJtdjcgdG9vbGNoYWluLCB0aGF0IGlz
IHVzZWQgdG8gYnVpZCB0aGUNCj4gYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS8gaW4gY2VydGFp
biBjb25kaXRpb25zLg0KPiANCj4gU28sIGl0IHdvdWxkIGJlIHRlY2huaWNhbGx5IHBvc3NpYmxl
IHRvIHBhY2thZ2UgYSBtaWNyb2JsYXplIGNvbXBpbGVyDQo+IGxpa2Ugd2UndmUgZG9uZSBmb3Ig
YXJtLWdudS10b29sY2hhaW4sIGFuZCB1c2UgaXQgdG8gYnVpbGQgdGhlIHBsbS5lbGYNCj4gYW5k
IHBzbWZ3LmVsZiBmcm9tICJ0aGUgZW1iZWRkZWRzdyIuDQo+IA0KPiBCdXQgdGhhdCBpcyBhIGJp
dCBvZiBhIHN0cmV0Y2ggdG8gZ28uIFVubGVzcy4uLg0KPiANCg0KSSB3aWxsIHNhdmUgdGhpcyBm
b3IgYSBsYXRlciB2ZXJzaW9uIGFzIHRoZSBlZmZvcnQgdG8gbWFrZSB0aGlzIHdvcmsgcHJvcGVy
bHkgaXMgc2lnbmlmaWNhbnRseSBncmVhdGVyLg0KDQo+PiBUaGlzIGlzIHdoeSBJIGFtIGxvb2tp
bmcgZm9yIGEgc2hvcnQgdGVybSBzb2x1dGlvbiBvZiBqdXN0IGRvd25sb2FkaW5nDQo+PiBhIHBy
ZWJ1aWx0IGJvb3QuYmluLg0KPj4gQXQgdGhlIG1vbWVudCwgZGlzdHJpYnV0aW9uIG9mIHByZS1i
dWlsdCBiaW5hcmllcyByZXF1aXJlcyB0aGUNCj4+IGNsaWNrLXdyYXAgZG93bmxvYWRpbmcgcHJv
Y2VkdXJlIHdoaWNoIGRvZXMgbm90IGxlbmQgaXRzZWxmIHdlbGwgZm9yDQo+PiBhbiBhdXRvbWF0
ZWQgYnVpbGRyb290IGRvd25sb2FkLg0KPiANCj4gQWJvdmUsIHlvdSBzZWVtZWQgdG8gaW1wbHkg
eW91IHdlcmUgbG9va2luZyBpbnRlcm5hbGx5IHRvIGxpZnQgdGhpcw0KPiBjbGljay13cmFwIHJl
c3RyaWN0aW9uLiBJZiB0aGF0IGlzIG5vdCBwb3NzaWJsZSwgYW5kIHlvdSBjYW4ndCBoYXZlIHRo
ZQ0KPiBwcmUtYnVpbHQgYmxvYnMgaG9zdGVkIGluIGFuIG9mZmljaWFsIFhpbGlueCBsb2NhdGlv
biwgdGhlbiBkb3dubG9hZGluZw0KPiB0aGUgImVtYmVkZGVkc3ciIGFuZCBidWlsZGluZyB0aGVt
IHdvdWxkIGJlIGEgZmFsbGJhY2suDQo+IA0KDQpJIHN0aWxsIGhhdmUgaG9wZSBmb3IgYSBzaG9y
dGVyIHRlcm0gc29sdXRpb24sIGJ1dCB5ZXMsIHdlIGFncmVlLg0KDQo+Pj4gQWxzbywgbm8gbmVl
ZCBmb3IgYSBzZWFwcmF0ZSBtYWNybzsganVzdCBhZGQgdGhpcyBjb2RlIHRvIFZFUlNBTF9GSVJN
V0FSRV9JTlNUQUxMX0lNQUdFU19DTURTLg0KPj4gU2FtZSBjb21tZW50IGFzIGFib3ZlLiAgSSB3
YXMgd29ya2luZyBmcm9tIG90aGVyIGV4YW1wbGVzIG9mIGZpcm13YXJlDQo+PiBkb3dubG9hZGlu
ZyB0byBjcmVhdGUgdGhpcyBwYXRjaCBzZXQsIGFuZCBJIGFwcHJlY2lhdGUgeW91ciBmZWVkYmFj
aw0KPj4gZm9yIG1ha2luZyBpdCBzaW1wbGVyLg0KPiANCj4gTG9va2luZyBhdCBvdGhlciBleGFt
cGxlcyBpcyBhIGdvb2QgcmVmZWxleCEgOi0pIEJ1dCBvdGhlciBtYXkgaW5zdGFsbA0KPiBtb3Jl
IHRoYW4gb25lIGZpbGUgYXQgYSB0aW1lLCBzbyB0aGV5IG5lZWQgdGhpcyBjb21wbGV4aXR5IG9m
DQo+IGNvbmRpdGlvbmFsIGFwcGVuZC1hc3NpZ25tZW50cy4gSW4geW91ciBjYXNlLCBpdCBpcyBt
eSB1bmRlcnN0YW5kaW5nDQo+IHRoYXQgb25seSBvbmUgZmlsZSB3aWxsIGV2ZXIgYmUgY29waWVk
Lg0KPiANCj4+PiBJbiB0aGUgZW5kLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBhcHBseSB0aGlz
IHBhY2thZ2UsIGFzIGl0IGxvb2tzDQo+Pj4gbGlrZSBpdCB0cmllcyB0byBjaXJjdW12ZW50IHRo
ZSBvZmZpY2lhbCBkaXN0cm9idXRpb24gcmVzdHJpY3Rpb25zDQo+Pj4gb24gdGhlc2UgZmlybXdh
cmUgZmlsZXMuDQo+PiBJIHVuZGVyc3RhbmQsIGFuZCBJIGhvcGUgdG8gYmUgYWJsZSB0byBjb21l
IHVwIHdpdGggYSBzb2x1dGlvbi4NCj4gDQo+IEdyZWF0ISBJbiB0aGUgbWVhbnRpbWUsIGFzIGl0
IGlzIGEgV0lQLCBJJ3ZlIG1hcmtlZCB0aGUgc2VyaWVzIGFzDQo+IGNoYW5nZXMtcmVxdWVzdGVk
IGluIHBhdGNod29yay4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shDQo+IA0KDQpJIHdpbGwgc2Vu
ZCBhIHNpbXBsZXIgdmVyc2lvbiAyIG9mIHRoaXMgV0lQIHBhdGNoIHNldCB0b21vcnJvdyBmb3Ig
eW91ciByZXZpZXcuICBUaGFuayB5b3UgZm9yIHlvdXIgaGVscCENCg0KPj4gSWYgeW91IGhhdmUg
YW55IGlkZWFzIGZvciBob3cgYnVpbGRyb290IG1pZ2h0IGJlIGFibGUgdG8gZ2VuZXJhdGUgdGhl
DQo+PiBib290LmJpbiwgSSBhbSBoYXBweSB0byByZWNlaXZlIGFueSBoZWxwLg0KPiANCj4gSSBo
b3BlIHRoZSBsZWFkIEkgcG9pbnRlZCB0byBhYm92ZSB3aWxsIGJlIGVub3VnaCBhcyBhIHN0YXJ0
aW5nIHBvaW50DQo+IGZvciB5b3UuIERvIG5vdCBoZXNpdGF0ZSB0byBhc2sgZnVydGhlciBpZiB5
b3UgaGF2ZSBjb25jZXJucy4NCj4gDQoNCkFueSBsZWFkcyBhcmUgdXNlZnVsIGF0IHRoZSBtb21l
bnQuICBUaGFuayB5b3UhDQoNCj4gVGhhbmtzIQ0KPiANCj4gUmVnYXJkcywNCj4gWWFubiBFLiBN
T1JJTi4NCj4gDQo+IC0tIA0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLg0KPiB8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfA0KPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfA0KPiB8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfA0KPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfA0KPiAnLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJw0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1ECl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
