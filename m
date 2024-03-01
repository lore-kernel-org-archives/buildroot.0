Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A38C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A0A460FD2;
	Fri,  1 Mar 2024 10:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSHpG8tLGIeJ; Fri,  1 Mar 2024 10:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9898D60FD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9898D60FD5;
	Fri,  1 Mar 2024 10:04:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65F7C1BF83B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFFB416F9
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqDgZyz4E8SN for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:03:58 +0000 (UTC)
X-Greylist: delayed 434 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 01 Mar 2024 10:03:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41A6C416EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A6C416EE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41A6C416EE
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:03:56 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 01 Mar 2024 10:56:38 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 2E3EFB5ABD;
 Fri,  1 Mar 2024 10:56:38 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 871ADB5ABC;
 Fri,  1 Mar 2024 10:56:26 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 1 Mar
 2024 10:56:26 +0100
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Fri, 1 Mar 2024 10:56:26 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd8UKE3jqibTOSdNZOSYpNkCtbGU2oGoNkSsuo0hpRLzc0foVh1rwuIiqEN95Ye0RzS9bxgV/ZY0vFD3z7StbGCBD5aecpDDd0mZAG6RRwuNIZaXKguYx0ufveC6EnseYjTaLr/4ej04JiOoQ1k2T1U21aAostI775KjFoREBtR+ofIcOQVrh5+ZA7K8e/ctbFQx9jKVSpHTPfyffvjcCRxNxxQ3IhugCL2nVGfBJmAKC8FnO6z6x/xuy1gdDLgA2bTqW+g0C0saNDHoqffKHxhb2zQ7AFG+C1Mz78mE32RQ0i9lYzrF31dif7u2qWxSsRJtzAlowegm6+6RuUSWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/31ZxJ4nFO4PRvB7Mca6uM6na9cL0jW0Ven7lgM24k=;
 b=I47oaStgxDTb+cOD30F1yzNM5yOEYY4EBsIpKEfBJtxxvUeAiEmp9DYYxAZIw2fB0/fYra4iQz2H2viAwBOWRdcppiW3nATwC30wqiSd0G9JUGt6arJay0QJs2ieYAnPFHS7Vi8HmbbUsH70tGW+KNggBwKFaTH6Gh5rbgGWtwBlNRSqcPzN0ELc1y0LSSqSgAb8LEza7HRDM6WJz9ls2JSkfHDky8OZgucN4RMGSTwoXS26KuzWzIWvXASU/WMWEeE8fsseDMLrqeObdM3QNXR04Bo8whiJgyDJwCNcmc4tppOb7w/DhPz5uSiELdnZ2VQ1irCbkHlE/0D2v5KhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by VI0P250MB1051.EURP250.PROD.OUTLOOK.COM (2603:10a6:800:24c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 09:56:19 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::256c:ce8e:9709:2e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::256c:ce8e:9709:2e82%7]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 09:56:19 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v3] package/libzenoh-c: new package
Thread-Index: AQHaa761ExEDrroE2kuUhVB5/yGN2Q==
Date: Fri, 1 Mar 2024 09:56:19 +0000
Message-ID: <AS1P250MB06080D04D548B5D4D947C44AA95E2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231101184652.412eb9cb@windsurf>
 <AS1P250MB06086CD15C0B581F84F7F00BA9AAA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
In-Reply-To: <AS1P250MB06086CD15C0B581F84F7F00BA9AAA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|VI0P250MB1051:EE_
x-ms-office365-filtering-correlation-id: a3e20535-0071-4a22-65ba-08dc39d5d7f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJp4urSYZp1/GockiqLeQT6Xth15mV171l2L4x+pH4Zm9fMUSJEhJWshuGjZITEtmy1ybGI5hZUhSIs8TIwmMq1533tHtfn3IsxiuGzFtWrVO/LpPf71WYXGG5T19syiywzOkACuE61bWeBtq58dtMDU0c+kjFGrfdkLFVRiLMe2v95Q8Mgt4nTcGK4R4zZIkSit6dQQ2mB2T9bUGoMA/MWWvKpXCO+a6gp0hykTiU2Y9E2iI2JmusNayByJtrrjBE1aYJNE3Bx6hfIzeuB58wh/qpr8tZsuSbilRQTc6NQ6MWfp/LDU1S6lNbC5kbNr25ooV+JlIfK4sscg9ZYcNeuARlTzLbkDRaOfLa4ZLzB+wkTyqabLrprrJ89JUTAbOjZYyBDEegx8LIwKLW6rHR1lm+NoP4ABvmJKkeXyzJ8yJx7ufbEkW0x9ofdQql95dGuMPB9oQYTkY6rwSwJ8aPQr+1OFTZoahWtQat6gJ2Uf5oCGfeY8QhyiiKF6toOsqNmXE8WINOdo4j9zM84SVj4zPkaXIVw5lgC8W7BxQQ0I8uXsjT/Qy+8fILQeM56vtMqdhNXRQU11apvLGYwiHm1unCRCK2z9oOK1ADmmT9tX9jVOfDPkVr+i7vLba/awCoBcH5NWGrJpSoIj/uFKeamsSRmf3NXl/vyJ2oHOOLk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3hJTEszSWZnZFdwL0hBanB5Y2dCSXRZbHpVaCtDdXFpcHJqSS9jR1BHK3hs?=
 =?utf-8?B?RThSeG5Pd3NESlUvdi9uRkFwVTMrNktNT0VTZVRLMGtLamgrTFRybENiSlFt?=
 =?utf-8?B?bUU3L0hjMG5GZmFKSTVvY2J0dG9HNHBTd2lyOHVrUVdJWnJjMXB4dVRFUU0z?=
 =?utf-8?B?VlZLMHhqOEpqZlM4M3pDNnF0TDBPUUNsN1RqdjRmM3pGb2lMQzhYaUZGTTlM?=
 =?utf-8?B?RkRFUzNCSFJSaDNPaG52L2lvMUNaWGFnRWRkYWZjOUhVTFRNM1hzRDJIa1ZK?=
 =?utf-8?B?MFFDMjM0ck1jNURMVmpsSU5PL1lscldtOU4yNTFwUTJoVHAwd2JXb3oxRzFh?=
 =?utf-8?B?dm1qaEpnYTBIdHpoK2l5RnRrazcydGRDZ1RKYkw4bE5weEJsOHIrSjJka1JX?=
 =?utf-8?B?cWtZY3BzMWR1MEQrUzZqZlRWRGFOSmhBbWJTZ05rS0pzNWJ5d1d6dytaaWox?=
 =?utf-8?B?V1MrdEZYczJRK0RxRGdueUJsTkpra3plUmJyMXROOHk1SSttWE9xYzBtSFJ5?=
 =?utf-8?B?dFpZV1crNHFvU0Y3anBwUlQ4UjBES0xxYlV3amF4QnR2YjBnelF1VXJZRkQw?=
 =?utf-8?B?WTRiVGhVTng4U2g5NlkrL1NjaUl6ZEVLZ1ZDSkxJelFiSEtKNCtTWXFxRjB1?=
 =?utf-8?B?Q1FDTjYxb3FVR3VZRkpEWEpON3IyVC9YblVhVDAxaFFKY1ZVTVlFRW90YVN6?=
 =?utf-8?B?WGJHNkEza0FZcTVieXhQbHl2NHFqRGRSSEppTVhYUDdWNWV4c3Jwa2JPOXdN?=
 =?utf-8?B?WFRTMExaMWRCUHZWNWF1dnJpYTJPeU1EYXJBNG16SFY0cXMreEdKWExNQkNp?=
 =?utf-8?B?VG5LOEF1b2xrOXNWUUtsSjRlaEhmTEgxbnZDbkhidHBZK3QzT0NSNS9mTHdY?=
 =?utf-8?B?RGZsT3dabTJ5TmVKSEF1MHh4RUkvTnphdFdtQTdXT3VzUGpsSUR1WFlqY2xH?=
 =?utf-8?B?SFhOVkF5TU9FcmNFK3hsUk5jUTJTbFNIbE9hQlNtRlV1d1dkZEtrQ2lIOTNx?=
 =?utf-8?B?NTdIZzMvR0NQT1ZzZk1FMmZlYlVBU3ZMMm1DeG5nd01OQ1hLczM3ZnQ5SSs2?=
 =?utf-8?B?VjNYQUZkdWNPYndjZGJ6MFhxSWVseVRiU3ZYVTFrbmpncDFiMzlOZHBNSUpR?=
 =?utf-8?B?MlJCM1c3dGl5N3IvRWQvcEpkbERUOTloL2dYeGwyVnJ5czhmOG4xL201SFl3?=
 =?utf-8?B?ay9VOVMwQnFSZHFKZU9kZWdxQzVmL2RHTi9tVWJIZFQ5dmJITzZHVHBjajhC?=
 =?utf-8?B?NDhZaXhFMjdnMzhhSkwwZXVZbnREbjhFWnNHcHBVMnUwbnVWOWgvNG1QV0I1?=
 =?utf-8?B?WXRIeGkzQU9FZlZMK3dFRmZhZmw2TjlSUVRlNTh2Nnd0N1JrMzNDREVkbVFX?=
 =?utf-8?B?UDZlbmM0aHpBaUFBR3U3djBicFRGSGM0N0diNG1xREdiSUV1cnFhK1QrVWlI?=
 =?utf-8?B?eWhsREVLTEJDc2p0MzI3K3o3ZVF6VXIzZjZCcjdBNHF6Wjlla2RtMUJ0ZHJC?=
 =?utf-8?B?TEQ0VkVYZFZQSjBFSkEySzlzK3c4b0MvajRtUEJPVko5YnJHbXU5WFRlNnk1?=
 =?utf-8?B?Zld0QStRN3lPcTkyWVpNVTR3OUtJbERyS3RwMS8yblFFQjJOZ2I5VUd5U3Zn?=
 =?utf-8?B?a2FVNit6Mkk3ZkJIRndIdlpRWUc0UGpNaWdqSy9sa1V2WGROdjJDaEQrQ3Ju?=
 =?utf-8?B?dWx2TGQzRVAwOU9ORWJzOCt5UnRCRmdpRG02ZXNNd1VaS0FrRXNqeXFOQnpE?=
 =?utf-8?B?aEpidmhvVDFpcVFvMGFiV3QwTnJEVFdGMlNoa2pDMEZLaUsvb2NRZGJJc3Jt?=
 =?utf-8?B?WDZueXFQYldGTytyQk9iMGVYVTFiMlJOakJwZU43RDJXWUNoYjljZEhZNXlD?=
 =?utf-8?B?SnpSM0JyTXNiU2VHOFNWUExxeHliNTN6ZWtnQTlsYW84VnlXZGl0ekt2QXFx?=
 =?utf-8?B?Sy9uYWJMMGc4QzY2RnRNNno3MHR4VmFVcnFIV2RzQWZJaDhqZmExRmVuSkVi?=
 =?utf-8?B?V2dlb2R5UzJOUXMyaUYrMmRJbngxRytnOGtpeWFaYTA3b3ZYZkpuWTIvNTI5?=
 =?utf-8?B?TzRMaTQ5RzlLYmUrYUkwdzJDWWNrQXpnQ254TS9VckZNYk80ZXdhSFl4MW5Z?=
 =?utf-8?B?WTNXcndNYVNxZzJNSTdCcStka1FYNVdNZEV0Qm9NazBOWUZ1YmtvaGdDUWVJ?=
 =?utf-8?B?c3c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sUJHWFVOBCak7MiR3kwbqj/xr5szQQIy/36AfKqtgo7HwLerq7gRFcatZsLjmIvFClRrWLPF7xRk3U9RBzf6gBjHOC5Yz08DULSBnJ8hXEd9Bt8FkqKucdmb+zwsgSIBFC0nKc6KW3yoTbHFiG5O+m4/W1qE2rFmN+BujyQOMJzOaiaOwhwvCshwiIngOpm59XWxhmKty2L2ZOYy2ImN6pqtDhHbRBBHCL/Gmz9LyPLqImXVpw59645m5A1wmB/b0kHUTdGrc0wZBSPz9N4kSonkQ+1InfBID2zyWuS+U5UcLxavvMsWez+72j4N1vpQpUWK4CJ+UHSUHdJ+8WhbMqQqmr8DJN9OZq3FClL8XMJnPohAktp1XfpJc3Sr4Mv8fGNifki11Uzr1HdYJ26mk9sKZfrHuf5PTo6QUqTWB0CYgKsd2mocBUYUWrmaYGFD1a8vXIB01asp4aJVMKQMTvrUntAnlz6oGrS+QFgpBkMqA01Lj0Qs+Q8eMBRKsx4d8moa+hnMHg/yYxXS1F1RDMw5/Jrvr8OAkbpHOjdWN197BTLXewAxrDKDnNbndb8t0+UgtDrdXxMdMz8EXZCqXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e20535-0071-4a22-65ba-08dc39d5d7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 09:56:19.3568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgvavhaEfEZp4xR8MwK6OZulRxP8qPpXdN+vkvWOvUkn2hH8RO1pT+jR0cJy7LtjeK1y4AaTb5NvjJ6HX5UjBc7i9IAG57NVBr4ZcU+5n1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P250MB1051
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-TBoneOriginalCC: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/31ZxJ4nFO4PRvB7Mca6uM6na9cL0jW0Ven7lgM24k=;
 b=Wy/6PNiwY4QpBNPnvS4KGD5wMb19t62ib4/fa+DVwRKSx5hx8z1mZbb5pEcQN7647HoQLeuPiZSqyKJSX8MR0zR8pd07jLz4LLCYL12TouN2I8aYqC0kSn8eBQJaaTTqB42y+JZYUo4fEDNFGOBVxmY8ykUS7p/bC/w9/pTivcM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=Wy/6PNiw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH v3] package/libzenoh-c: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a C binding based on the main
Zenoh implementation written in Rust.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v2 -> v3:
  - bump package to 0.10.1-rc
  - set INSTALL_STAGING

Changes v1 -> v2:
  - renamed zenoh-c to libzenoh-c
  - added myself to DEVELOPERS
  - fixed LICENSE
  - install shared libraries to staging and to target
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 +++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/libzenoh-c/Config.in
 create mode 100644 package/libzenoh-c/libzenoh-c.hash
 create mode 100644 package/libzenoh-c/libzenoh-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac277423a1..08c3d9a5a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ N:      Alessandro Partesotti <a.partesotti@gmail.com>
 F:      package/oatpp/

 N:     Alex Michel <alex.michel@wiedemann-group.com>
+F:     package/libzenoh-c/
 F:     package/libzenoh-pico/
 F:     package/network-manager-openvpn/

diff --git a/package/Config.in b/package/Config.in
index cd687a682b..af1ee30585 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1996,6 +1996,7 @@ menu "Networking"
        source "package/libwebsock/Config.in"
        source "package/libwebsockets/Config.in"
        source "package/libyang/Config.in"
+       source "package/libzenoh-c/Config.in"
        source "package/libzenoh-pico/Config.in"
        source "package/lksctp-tools/Config.in"
        source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+       bool "libzenoh-c"
+       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+       select BR2_PACKAGE_HOST_RUSTC
+       help
+         This package provides a C binding based on the main
+         Zenoh implementation written in Rust.
+
+         https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..8c93a7a091
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3ede587dd08ccd6b0b7f0b44faeefa466eb5e18826db0b1cd93c51ffc59377ec  libzenoh-c-0.10.1-rc.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..738758e13f
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.10.1-rc
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+LIBZENOH_C_INSTALL_STAGING = YES
+
+define LIBZENOH_C_INSTALL_FILES
+       $(INSTALL) -D -m 644 $(@D)/target/*/release/libzenohc.so $(1)/usr/lib/libzenohc.so
+       mkdir -p $(STAGING_DIR)/usr/include/
+       cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+       $(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+       $(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+endef
+
+$(eval $(cargo-package))
--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
