Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909CDC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBA5C41061;
	Wed, 17 Aug 2022 17:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA5C41061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ob8vpWvOWEzm; Wed, 17 Aug 2022 17:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D3440475;
	Wed, 17 Aug 2022 17:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D3440475
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F31B1BF33E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 17:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED1F5610FF
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 17:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1F5610FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCP8FdEzJxfF for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 17:23:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF5160AC0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DF5160AC0
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 17:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv4iRGV3R/ZKjsmlntmtUCnAjyEgnCUG0CPCf/+wYYgWqTKcraWiuqPotVpvbQV5ZY3TZdTr+oyhrmjdJXTXIKN0AJ1QT++exVfl9AYQkHNuBysLEaLCtGMQQ7ZbNzy3EYAFKZYLGZJgq1LJhw88MFjW0o2qmExTxXP7Z8UIHNCX17z2wSDEBUTR2yDEsSPHCnP5EmQEakT3hLwO3JgWPBwA0HalP1+tEd1u8LVBM0ZA5eu/FErHGTGJpGYuV3aanz+ygD3Nxk3Kz43oAWTPovTfKpaGddblLO+BOHJ0pdeXABpRVnD0Hwkr7uueJV1Y1RkB7qh1L+5PTJelyxHA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDUe+YNfIJT2ssGffpCm6h1kLPshlmnqnwztdhzTbF4=;
 b=oLM5P0rhlyhIoyOrasQCJdskJAAypn1k1qPN7ggup1EZ8+0pN0yPuli0O42kk2R0o1wvaaugFIfbdiilTz/IVY067rLz8yXhdeXA6eGEXECjrogSNZi0fG4vPkOg/rrE4C+7Ril8bKhF0wtr30oKtrCdkE3Ml+B0utj+wOPRscL364ZMQK4G3lwqPF6cOdgHP0oQ++Rgrg6t3dWJdM8n5/d5m741Us865COXHhYgZxgzU23ROItACY7f4TouaPzwT0iZyEayHWWbXZ9shmF/lpBJKPJvN6YNIbu9xd1DRs1pPSPsrMXcenCHyOofxPgYQ9kJNTN/ffLDpH6Qz5PiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MWHPR1201MB0016.namprd12.prod.outlook.com (2603:10b6:300:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 17:23:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1%6]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 17:23:41 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIB+E1BggAGkngCAF7kPsA==
Date: Wed, 17 Aug 2022 17:23:41 +0000
Message-ID: <CH2PR12MB50047F205184CA0DFD7C688DF06A9@CH2PR12MB5004.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 1461fa85-f917-4263-8630-08da80753b05
x-ms-traffictypediagnostic: MWHPR1201MB0016:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zZuX64gYwB0MsI14SCn0yOUuSTMDG64WYHZGL/9hVdsBSp1D4z5cH+6hYBFVtW7cX9nipiDxL+nsevRnOADFwGx79apR93By4Dcv2gQqPJAmqTD/Vthch9uI3EFDespgZ2BxsBAYX2I7cuL4wQM/g51+6hsRAiah5gGKguT2nRWo89NrWlBOnA+kCv/6kWlzZn0/WxXAaIS2BDBGxUinSjGcP9NgTGBugWtAwQfDcn8eVxaUBkNQFt8oLjrdUztSQC6pISGrTNY7g1666KcA2oyyOrQPSx6+vb5NXiwhroqF5f09UaTSw89qbmu0DbiDuqnsmK/DzbIvNvRzepKiurkRvazZA1oDr26DjrgidXWWpiy8qzXQuuYDeSCUHss74VcsIfcn8OcBEJK9w/Rl3oshxBX/v/lVcxQoQGish06XyHV0EOLl3PfSKHTZiwB+pKxK6lr8F4eW7fjof8me8AIipCwshNQxc2R2jJBb2tPfG8OSL2BZ1SSpAZ4ILZDBud/miYdeZp9X00B12qntzBQrVgmXlRgpH/IHx/JEpkdcguLS1mxnx+0eSiydKCHyAK3cMKCi2PgULbptdFK9EMdRPfTBhmO611FycYBmhqbh/iUiXZcsQz8YXU7Hxiy6OURL6FNEDcsEo+sh6jfQCQgNsNhovCOFwbXpcTe2n11h/4roxV7wNyZoHBKHpg3iAemwULab1BIHOWibV2sesuekSH2QmAXb/dF8gB5HbpCz9J5B8iUb3ObUxlVkSlD09VRx8uocEUJ4QrKnechHnz62eTpH7DF7XtsOFUqUIm49kozt4I2tUui+Bd93G1OUM0opJaQ1CDWTDVCt+eS3utJlt2+WIPVtXFaT8MLbJe9e4vL+AjbDZXbFg8rozvo3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(71200400001)(966005)(41300700001)(54906003)(316002)(478600001)(38100700002)(4326008)(64756008)(66946007)(8676002)(76116006)(5660300002)(66446008)(66476007)(8936002)(66556008)(52536014)(6916009)(2906002)(38070700005)(122000001)(186003)(86362001)(53546011)(6506007)(66574015)(33656002)(83380400001)(7696005)(55016003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3h4UGlBbFRvL3BQNHlmczBIL1duNGtDdFVqVmJqNFprTkhnTG5qa3VNajN0?=
 =?utf-8?B?WmVqTFBFSm9iemZJSHIvVHgrSTRiRVV2Z3E4R3R5L2p5NlZpVXhraE9SS21T?=
 =?utf-8?B?OHN3VHMrZ2NNdC9RYkdmNTRJaCtPbGNiTThIRkFvSXE4c1hXMmszQ0FsY0Vv?=
 =?utf-8?B?aHkzMGxzUzBwdkJGWWlPY0krdzN6N0VzRlpOUitub3hNY0VLQVNhOU04VjNY?=
 =?utf-8?B?WWRXVCtxVlArK0hSYjk1em82UUNTM2dJczZjdjlqVEwwMkljZ2ZJSHVwN1No?=
 =?utf-8?B?ZUsxY1NQY04rLytPTU1HbFBnZ0o1UHBmN0hXb29IOFNHRlR5SXRJK3J0WkpM?=
 =?utf-8?B?Q0pZY3Nic1RUTnBaWmgyT3k0b1NVWUZ6NXlBRHRYQlVDdTRUNUxTcW9Gejk3?=
 =?utf-8?B?NnVIYkFUektGeXBCNlFYMnIxRmpVWEJtSWJEek11d24yRUZkL2ZVN2t1bTFC?=
 =?utf-8?B?c21vdnNIOW1NZkIxRkthOStFUnRlTzFKVitLeTdvVVFqaFl1dzU3OW9tZ3I4?=
 =?utf-8?B?N0RIazMySXpkWUExZXdVVTIwYnVyd1pPUDdZWmRpNkRqSVFPdGNjd1JWSlhH?=
 =?utf-8?B?MXRjbmN5RlhZUTUxOUxZbHA3UmREeFdscGlucjEvN29aQUhJNVBLYUhOTXNh?=
 =?utf-8?B?c2pkdXZBelNYT09mN1J1RTBpU01ZVG54MVI1WFVCSHJ3eEk5ZWxlMmhhd3dm?=
 =?utf-8?B?b2NINFoyZWNld1RpWTBkUkhuMFQwaGE1QVh5a1hCd3lIMEZqeDF6K3dRNzJE?=
 =?utf-8?B?RHNrQS95b2M0R1NIWWNHdXhEM3VuMUR6TnJ1REVPb0VSMU1POHZNREViWElV?=
 =?utf-8?B?eWkzTWd0OW94dFNJYncvZERGTXdRaGl5S1VsTllSTTk0ekxpeGl2aUtJUnlm?=
 =?utf-8?B?dGRvSXl2YTBXT0V0ODlBZzhxTVp4UDN0YXpBYUlqd3NJSUxzNi9nODdHajFn?=
 =?utf-8?B?dmk1UGpjaGpYdDkxNFlaYThrTWlWUmxERmJoUUtFbEJjbEsyaEVCc1NabExa?=
 =?utf-8?B?dUxXTmo4bjdrc2pTNWd1YzU4a3RyL1h4WjVkVWlQeEExRm1IV2pFTjVHMmNN?=
 =?utf-8?B?eWJsRHlZRm96N0F0U2NBYkxZSnJwUk93Q1BMRHgrRDR4NkNydnk5N0VPSFMy?=
 =?utf-8?B?U2pmZjdCSHN5dit6TWszdmVFcnFDZXpjUEhlUWI5b1pxSjRYTEV1dDFDaU83?=
 =?utf-8?B?QzBnQmZER0V1Vjgzdm9MUHMrb2pPMFhDT0loN3RteFQ1WFFEQU9mSDZ4V0tD?=
 =?utf-8?B?aTYyZ0dnc3BQdnFWSWRQODdCajVhT29YWEJhWjRlWkdwWVROUUVGc1k2ZllH?=
 =?utf-8?B?K3VORlFKRW5nU3ZjbjJQTittQ2FsVkZsQndqSGUrcEpGUUEyekI3SVVVZWJB?=
 =?utf-8?B?V3dHRTEycHVBb3M3dU9yczliWDNGZGY5Uys1THhkVytFdjZhblI4ekxGaXlM?=
 =?utf-8?B?SHRlZ29OWlp1Qm9yczJRYTMyU0tBRzJ2d2hXaGdoMXhwZ0xaM1NuMzl4QTZ6?=
 =?utf-8?B?OEUvS2ZLSjNJYmhKV1JXS3R6dWx1dWV1OTQ1dVlWdlArSzlBcENFKzJUdEhl?=
 =?utf-8?B?Z2dIcE1Qamx1dDVjT1ZQdjFKd09BZUpQMmc3OWtIVTh2UmtpSCtoNG5XRXN0?=
 =?utf-8?B?S0g4QXBQV0xDV3h2NzFxSGhxeFdQdElpK3ZPc0toZUlZV2FFc3BBUnFUOHRU?=
 =?utf-8?B?U2pXY2RmTldFRktMRHBUdWlNbXZ0NkY0TmZPeHg4cm5QQTlLOUw2N0k3Skxs?=
 =?utf-8?B?U2VXSU01bnBtc1dlVVc4S1orcFo0My9oSU1DQ080S2lyaWZLMzhmUzhhSWpn?=
 =?utf-8?B?L0Y4OU9LVlhXUlV0ZHhNMjhvR1NwREpLaUNpVkJTN3ZGRDBpVFV0UjlkZXlQ?=
 =?utf-8?B?MkJZbTFQWjBhdG5Cclo3MHhmZzBVbzRVTTNOckVCTVFveDZZdGpLcnB0YVJP?=
 =?utf-8?B?ZDc1WW5EWU9RNjJoTHFydGhzSEJjZXBRamp4TXRBYmJNWk1oanlzc1c1UHI2?=
 =?utf-8?B?NjJQd2hqM1gvZVlKTFQzOEw4RGVVSnRFNDZDNytrbjRYemR5OUl1Y1A5VUdu?=
 =?utf-8?B?NlZJRTZUeGhMb0RMSkk3TVRxSmRWZlVnbWVmNUNFbjZPaWJvZHdHQ3BRWlVp?=
 =?utf-8?B?MmwvcFhvMjBIR2w5ckNLM0czTWorL2p2ZklHSXNqYmUxVDlOcEo3TFY0R1NF?=
 =?utf-8?Q?3//L+sC+DIua0TYZ6BMIaag=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1461fa85-f917-4263-8630-08da80753b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 17:23:41.5780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVUolCs8CQmofXmjerFGqdMc4OJLSLduaxvR52Xd5ZSLpJdDeEfIbmPHLZkbhxKh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDUe+YNfIJT2ssGffpCm6h1kLPshlmnqnwztdhzTbF4=;
 b=LHl53oj3GVc3LFnQ8zvLlUmuXXbP0VO6BBSmKtNpHsOCmjeUgUuILjK18ML75ZTQfbMMR/JSyZleHCbrFTe3XBeF3Jhe5Qig4ACU/VTfde0Ow5ozRfIRQQg2HPc2Sh2jdLH58TuJ6BfxMMaDryLT3K8FicswqSHXWznPodHBwSw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LHl53oj3
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

SGkgTHVjYSwNCg0KPiBIaSBMdWNhLA0KPiANCj4gPiBIaSBOZWFsLA0KPiANCj4gT24gMTMvMDUv
MjIgMDY6MjEsIE5lYWwgRnJhZ2VyIHdyb3RlOg0KPiA+IEhpIFBldGVyLCBMdWNhLA0KPiA+DQo+
ID4NCj4gPiAgDQo+ID4+IExlIDEyIG1haSAyMDIyIMOgIDIxOjMzLCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gPj4NCj4gPj4g77u/Q0FVVElPTjog
VGhpcyBtZXNzYWdlIGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBQbGVh
c2UgdXNlIHByb3BlciBqdWRnbWVudCBhbmQgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVu
dHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nIHRvIHRoaXMgZW1haWwuDQo+ID4+DQo+
ID4+ICANCj4gPj4+Pj4+PiAiTmVhbCIgPT0gTmVhbCBGcmFnZXIgPG5lYWxmQHhpbGlueC5jb20+
IHdyaXRlczogIA0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4gIA0KPiA+Pj4+PiBJIGhhZCB0byBhbHNv
IHBhc3MgdGhlIC1tKiBmbGFncyBpbiBFWFRSQV9DT01QSUxFUl9GTEFHUyB0byBnZXQgDQo+ID4+
Pj4+IGl0IHRvIGxpbmssIHByZXN1bWFibHkgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gaGFzIGlu
Y29tcGF0aWJsZSANCj4gPj4+Pj4gZGVmYXVsdHMuIEx1Y2EsIGFueSBzcGVjaWZpYyByZWFzb25z
IHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8NCj4gPj4+Pg0KPiA+Pj4+IEknbSBhZnJhaWQgSSBo
YXZlIG5vIHJlYWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5IHdyb3RlIHRoZSANCj4gPj4+
PiBzY3JpcHQgSSBkaWQgaXQgdG8gaGF2ZSB0aGUgc2FtZSBsb2dpYyBhcyBwZXRhbGludXguIExh
dGVyIEkgDQo+ID4+Pj4gZGlkbid0IHdhdGNoIGZvciBpdHMgY2hhbmdlcy4gSSB3b3VsZCBsb3Zl
IHRvIGJlIGhlbHBmdWwgYnV0IEkgDQo+ID4+Pj4gaGF2ZSBubyBhY2Nlc3MgdG8gYSB6eW5xbXAg
Ym9hcmQgbm93Lg0KPiA+PiAgDQo+ID4+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgeW91IHRv
IGp1c3QgaW1wbGVtZW50IHRoZSBjaGFuZ2VzIHRoYXQgDQo+ID4+PiBQZXRlciBoYXMgcHJvcG9z
ZWQ/ICBQZXRlciBhcHBlYXJzIHRvIGhhdmUgYWxyZWFkeSBpZGVudGlmaWVkIGEgc29sdXRpb24u
DQo+ID4+ICANCj4gPj4+IEJvdGggUGV0ZXIgYW5kIEkgaGF2ZSB6Y3UxMDYgYm9hcmRzLCBzbyB3
ZSBjYW4gYm90aCB0ZXN0IGFuZCANCj4gPj4+IHZlcmlmeSB0aGUgdXBkYXRlIHdvcmtzLg0KPiA+
Pg0KPiA+PiBTb3JyeSwgdGhhdCBpcyBub3QgdHJ1ZS4gSSBoYXZlbid0IGZvdW5kIHRoZSBtYWdp
YyBpbmNhcm5hdGlvbiB0byANCj4gPj4gZ2V0IGEgd29ya2luZyBwbXVmdyBidWlsZCB3aXRoIHRo
ZSB0b29sY2hhaW4gYnVpbHQgYnkgY3Jvc3N0b29sLW5nLiANCj4gPj4gTXkgZGlmZiB3YXMganVz
dCB0byBzaG93IHdoYXQgSSBoYWQgdG8gY2hhbmdlIHRvIGFkanVzdCANCj4gPj4genlucW1wLXBt
dWZ3LWJ1aWxkZXIgdG8gdXNlIGEgcGV0YWxpbnV4IHRvb2xjaGFpbi4NCj4gPj4gIA0KPiA+DQo+
ID4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHdlIGNhbm5vdCBjaGFuZ2UgdGhlIHp5bnFtcC1wbXVm
dy1idWlsZGVyIHRvIGRvd25sb2FkIHRoZSBzYW1lIHRvb2xjaGFpbiB0aGF0IHBldGFsaW51eCB1
c2VzIGFzIHRoZSBjcm9zc3Rvb2wtbmcgdG9vbGNoYWluPyAgDQo+IA0KPiA+IENhbiB5b3UgcG9p
bnQgdG8gd2hlcmUgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gY29tZXMgZnJvbT8gIA0KPiANCj4g
PiBJZiBwZXRhbGludXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29sY2hh
aW4sIHBvc3NpYmx5IHdpdGggc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBiZSBj
b25zaWRlcmVkLiAgDQo+IA0KPiA+IEhvd2V2ZXIgSSBzdXNwZWN0IGl0IGRvZXMgdXNlIGEgdG9v
bGNoYWluIHRoYXQgaXMgc2hpcHBlZCBieSBWaXRpcy4gSWYgaXQgaXMgdGhlIGNhc2UsIHRoZW4g
aXQncyBub3QgYW4gb3B0aW9uIGhlcmUuICANCj4gDQo+ID4gVGhlIGVzdCBvcHRpb24gd291bGQg
YmUgdG8gZml4IHRoZSBjdC1uZyB0b29sY2hhaW4gb2YgY291cnNlLCBidXQgDQo+ID4gSSdtIGFm
cmFpZCBJIGNhbm5vdCBiZSB2ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNwZWNpYWxseSB3aXRob3V0
IGFuIA0KPiA+IGhhcmR3YXJlIHRvIHRlc3QuIDooDQo+IA0KPiA+IFZpdGlzIGFuZCBQZXRhTGlu
dXggMjAyMi4xIHVzZSBHQ0MgY29tcGlsZXIgMTEuMi4wIHdpdGggdGhlIGZvbGxvd2luZyBwYXRj
aCBzZXQ6DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9tZXRhLXhpbGlueC90cmVlL3hs
bngtcmVsLXYyMDIyLjEvbWV0YS1taWMNCj4gPiByb2JsYXplL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy0xMQ0KPiANCj4gSSB3YW50ZWQgdG8gZm9sbG93IHVwIG9uIHRoaXMuICBIYXZlIHlvdSBo
YWQgYSBjaGFuY2UgdG8gYXBwbHkgdGhlc2UgcGF0Y2hlcyB0byB0aGUgY29tcGlsZXIgdXNlZCBi
eSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXI/DQo+IA0KPiBJdCB3b3VsZCBiZSBncmVhdCBpZiB3
ZSBjb3VsZCB1cGRhdGUgdGhlIHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIGdlbmVyYXRlIGdvb2Qg
cG11ZncgaW1hZ2VzIGZvciB6eW5xbXAgYW5kIGtyaWEgc29tcyBpbiB0aW1lIGZvciB0aGUgMjAy
Mi4yIHVwZGF0ZS4NCg0KPiBBcG9sb2dpZXMsIEkgaGFkIHplcm8gc3BhcmUgdGltZSB0byB0cnkg
dGhpcy4gOigNCg0KSSBob3BlIGl0IGlzIG9rLCBidXQgd2hpbGUgdGhlIHp5bnFtcC1wbXVmdy1i
dWlsZGVyIGNvbXBpbGVyIGlzIHN0aWxsIGNyZWF0aW5nIHBtdWZ3IGltYWdlcyB0aGF0IGNhbm5v
dCBjb3JyZWN0bHkgc29mdCByZWJvb3QsDQpJIGhhdmUgY3JlYXRlZCBhIHRlbXBvcmFyeSBzb2x1
dGlvbiB1c2luZyBwbXVmdyBpbWFnZXMgYnVpbHQgd2l0aCBwZXRhbGludXguDQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9uZWFsZnJhZ2VyL3p5bnFtcF9wbXVmdw0KDQpJIGp1c3Qgc3VibWl0dGVkIGEg
cGF0Y2ggdG9kYXkgdGhhdCBtaWdyYXRlcyB0aGUgenlucW1wIGRlZmNvbmZpZ3MgdG8gdXNlIHRo
ZXNlIHBtdWZ3IGltYWdlcyBpbnN0ZWFkIG9mIHRoZSBvbmVzDQpnZW5lcmF0ZWQgYnkgdGhlIHp5
bnFtcC1wbXVmdy1idWlsZGVyIHRvb2wuDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA4MTcxMTUyNDkuOTg5NC0xLW5lYWwuZnJhZ2Vy
QHhpbGlueC5jb20vDQoNCk9uY2Ugd2UgZ2V0IHRoZSB6eW5xbXAtcG11ZnctYnVpbGRlciB0b29s
IHdvcmtpbmcgcHJvcGVybHkgYWdhaW4sIEkgd291bGQgYmUgaGFwcHkgdG8gc3dpdGNoIGJ1aWxk
cm9vdCBiYWNrIHRvIHVzaW5nIGl0Lg0KDQpBcmUgeW91IG9rIHdpdGggdGhpcyBzb2x1dGlvbj8N
Cg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
