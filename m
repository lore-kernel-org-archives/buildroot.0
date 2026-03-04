Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8450EF8FE1
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 13:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61DCA6069E;
	Wed,  4 Mar 2026 13:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wngvbjmYvVg3; Wed,  4 Mar 2026 13:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53FF7607CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772630571;
	bh=1hGMI2YWc3DZMO7cgBOotbCTVMFtSp+MVMiih2aF4GM=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Dhv1H2A/2b2fkA3b7p+7jRmJrMWG20bmN6giQFRoiKr0Cx+/0eDRvZUae6MtAVPpf
	 bw+4UVkc7EojiJjt67ffjqQi+Gq9Mt2vsW57maUx0XGLu6w1yLBwslFSLjou8VatfK
	 HokJ6ZSnckhYfG06bW3Amp5ltjADmojsn6zAfSlupQAovf/wAUO48QPpUxpTbELcOJ
	 eVomeco7iTI9ubVikiFa4piZLXjOYWPk3INOd9EIto1BnGjtMSNYWr4uY95rh2UlCH
	 n+n2zPNgUG8hYy6UgNxUA/pICITVmEpdG1F2u62TA3STJBchKlNwlWsHdm3s8C2VvB
	 WirloRQSouAlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53FF7607CB;
	Wed,  4 Mar 2026 13:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75FB1231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BD95607CB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Stu72C4n7tif for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 13:22:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 764876069E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764876069E
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 764876069E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSSdK9bRxK3IF7pmLX0wpHc4Cir0SbtKegcE4EihfoUV5+f025I8kXTwly54jdJMmnmryJTlF4R0YwhqKA47alWJSwWkPVu/Pd7Dpmt39rC2KIgqcnN0bDE0sUluMyRtoaR/M5WaAy0J2ZX3BM+DQj5dHQBpxGPp7nBkT2rk8HW4vlkcilGkGhIr3vVhePQu3jBFRWDBZvg2TLtpktVzs5joTAiBANnqjmgAErRG9n+6l3X9gl44c29mwTBAuISXuGMcXO9wtQrl+lD7dG//2IXaCqQEbGNhhIsGw75Xudp6rLFTIZAwekyLdloYUbDVe6HR4GLQNfAtpFgsmeRsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iqHBmvnkMyZdCwRmFOcQgP25DOKVFPt1FsGp/T213g=;
 b=a7dxnIaEHQal51B4ZENSPm88uzO0NEaIen9ZYWnNEBEskl32+4zivGjBwZIhrbNcX2rTIjtsIRG3GZxckq5XMk8Bk2vPYxvgW7XFTdxneBrPNs/i9q6/FxX3LFbnEZRUG0HgBQkSbIorZtBqCZLkB0kscZakpKP8Cs5QmcjrDcJLju018HOs/SB+LfoafVlNrd0EQTqAYkEqNHxTYwezdzi+ThbexR9L82CmxylhxVN/KKZP3ERvId1MpdDYKqG7xEijfZbqaI/aALPwQC8HYy2OrXDFsVpj5JhEWvSeQ4t57GNfFDVlLqutn0kxxsevEVQ5dj70ps/DgLIxVZcUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 13:22:44 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:22:43 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 2/3] board/zynqmp/post-image.sh: use LINUX_DTBS
 variable
Thread-Index: AQHcqyUKa3+DSmbK2EeBIqH0J9ispbWeWvUAgAACaVA=
Date: Wed, 4 Mar 2026 13:22:43 +0000
Message-ID: <BL1PR12MB50325C4F51B6208A77BE811BF07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260303154716.2122822-1-neal.frager@amd.com>
 <20260303154716.2122822-2-neal.frager@amd.com>
 <DGU0VV815IDV.21AG43M00GZWZ@bootlin.com>
In-Reply-To: <DGU0VV815IDV.21AG43M00GZWZ@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-04T13:21:37.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|SJ0PR12MB5674:EE_
x-ms-office365-filtering-correlation-id: 43c4a859-9049-42ab-2a35-08de79f11e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|41080700001; 
x-microsoft-antispam-message-info: Vc1ri/GmGkJ10v35wvPIH3tMVDVj7yrqWteDbrgT6nPvPv0lg/Elt1xXQZomyOS6M50L5K1A4LFBmfI6ChsNSjzLKuB5Ak+HVPD1uHjidDZHhIRu80ORREeQOVuSo6dTDr/R+qCGE2QqDVGsGKhgLKdf8b3xKFvDGdc7nrAFfwwVZ3iTXqumQASBoVQFDTwteqzVWHJWXOqeNetRsXoeFtPS4EThWtgqB8E0GEelgwqRvbM3f01ok4fSVhpazu5Pur1Na3joXT0krmrqbkx76iiZPP15Qo5JD7NUGtNv7nxUmy55UzA6rL9j/9Q+0DfQF114lRlm9DqNZWe5/ofAmV4l/7dRaqfSDKmj14AEqiv35VsJaVJ5aSFxtFreXbEt/aGfa0QvwbGDHZKv3OHXA3tNVCuzxC/fZrpynxLkqmw/ZZ4U+VpDOxYP9wgvnlfn1y5iaNFLtdVCz4Y1rY8pv71NCgg8qsTWZeWBzTZEcprECpai8YD11ndt1oyhRgfLGr3XnV9wvtJiTL+YhW3hx5koaG6+TU4RSr6gpYJBVZ71zxzjXT7PraMFJb/6qHkCaAMZerRgxI+A+d8IeCEBfncKlY1J/lOOIU8jJBAJMkboKKxm+oV+eAR15ag3IbXWEFpvcx646x1sONMRv62YqWs28bk2C30qnpQJT7BLI1zFMOB05++46Xqa+9HpyPGebvbKXXG+aJnPtzWF2JlOt0JBqE3CpY8R44YT7gUM4UOuc+iXIKEnDDSmdxC0VuKTPhHfOQZAaJxgwoMsTBu0IixZZUhd83a1X1GL3RZ3OBgqoSMpO6mbIi7WvHG0caqibVdD4F+wQFS1ZP5GvLJEng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2JHN2VUOFVwU2hEYVp5NCtkM1JMenVXblJYL0RHU2NhUlQwRkd1cHdRUjFK?=
 =?utf-8?B?T3IvODJialRSc2RsS3VObEUzVjNQdWZDOVdGSTA2TExIM1FrbElCRFhxRUtx?=
 =?utf-8?B?TU5kK0pONTRQVzJRNHhWc1E0RUNkSi9XaEJuUm05bTh2aExnaXdCMkFOMDVU?=
 =?utf-8?B?TUpQMk1JODlGV3laSDRjWmJnOWsxTEdvTTBDWDJBR3JBbVVnWG1NMTJlKzBv?=
 =?utf-8?B?TFcwSXBDVStoaklkMXRwN1BRTzFVSjFkaEg5VGJHUVd1NGRObmN1WElSblVO?=
 =?utf-8?B?c3FMOWs1N0ZCaDRjZTBpUEdlSjVIbzZEcW5ma0YwTjRtZWEzSGJlVWdDeFRM?=
 =?utf-8?B?b2drYW9zN2JCZFNIRDU4cHRZbk14VDBhYU1oQUI0bkQ3Nk5qUlc5ODdFNjZv?=
 =?utf-8?B?L0h5Y1E3MDhvV2Y0TisvblJSN3dZblIzelhLaXZVSFV4d1BqdzlEUmIvUXZx?=
 =?utf-8?B?Rmlyd1pRSkE0WFJnMkJCNUFiUjMrNXJnd1JVVTJrK2N3UFVENUhOS3FyYTdY?=
 =?utf-8?B?QW8vUXJNNDZnTW5RSy90aWVjcGVkUDI3T2Q1NXRlVnYwT2ZmUnVoT1hVdUor?=
 =?utf-8?B?NnhEYUlZUUpMNjZlZy94Vk42QXcxTzF1dCtMQ3hZQ1UweUhEbVF2TXpzbyt5?=
 =?utf-8?B?R3d5MDF5K1B1dkFrVGlPRHlkZjdkbVdINEpyam52T0w4bHRhNi85T01SQUQw?=
 =?utf-8?B?OXJ0U2Jvd0pNdytWTlkxSEJtT0xnTkZZL2h5alNOaG1kYk1jVW5JeW5XZ3Qv?=
 =?utf-8?B?NXJYV3N3YmNwL1pKWTU1Q3czQkEzYUJGNWJ1M2JtSTdaMjRxR1JwdW0yZUdx?=
 =?utf-8?B?QlE0N0VMWVhtYlNXSzAyMTkvdmdIcE5NeXZsMzZvN3gxbEJlbHZLUVorbDJv?=
 =?utf-8?B?aXUweEZsUHV0Q0dPUlpKZEhtRGZKVzVtTTV2ZU1wMy9pU0VDM0oyaGpXMUl5?=
 =?utf-8?B?YkQ2MzRFQTBoK0JNb1BuNWVENjViZEo1UDNZbXczZWFzS1lUb0U1dmFCOGI0?=
 =?utf-8?B?ZHVLL00vbHM1Zy8rdW0weXNMQUplOUZUV3B5ai8rMWRXVEJoSW85Rnp2TDlI?=
 =?utf-8?B?VUhXU0pCd0d5bjNaeDFFM0JqZHM3RjRLM3dCSFVoY21jdDBqN1hWODZ6cVIx?=
 =?utf-8?B?YnNERUh2WXV0eG4xTi80ZGx3Y0NoUGhkSGFGWFk1N2oyeXRsMHpJd1BHdDFF?=
 =?utf-8?B?dTk1ZXpwRVMyMkd5bDZmOWFuZHluQVl1VkJSS3lwdVZSZklJcklKWGo3V2Jw?=
 =?utf-8?B?V2ZNOXpFSUdHbmM3RXhjTHZKeFNRUXdNcmxONEd5YW03RjB0cmpXWVEwaDht?=
 =?utf-8?B?eUVST0piK21uaFBpTmpadm9UbisxK2U2Z2FRdHFkU1pyNmpmaWVBa2FKVUti?=
 =?utf-8?B?dmhuSW5BWmNLUnppZkF4MDR3KzNUSyt0MzZrQWVrWVZ3ZmtWN09CeFlUYUMv?=
 =?utf-8?B?STdWTTh2bVVrSEZoZ3oyMGY5OVMxTXdMUGVZa291RGNtdzJFMUZJb3YrQmd3?=
 =?utf-8?B?a1M1eGdVMGM0RnBVVGlkbzVaaWFJeFhOMDVwUE12d05DNk8wbVRaWVB3d21E?=
 =?utf-8?B?MFJBdk9zdzNZOW0zSEoyd0xNM1dFZ1VrclZzeHpYKy80RGlrSDRCdThiRkRw?=
 =?utf-8?B?b3FHa3JnL0pjZHBBWHdPWXUzQWg4cjR5M2ZvOEZEM2dOZ09Cek1VODNRMFBM?=
 =?utf-8?B?cTJhTW5BdUdQZWJsZ3pWS2psR2h1WG5pVFlqMmdINW00L2cwRXZLcS9wN3ln?=
 =?utf-8?B?WnNMU2xPZmJ3NlQ3TG51cnBhci92c3UvNlZZUWQrY3hFVGVMcGE5ZlI2ekt4?=
 =?utf-8?B?bDhsbjVxbW0wNFNiSUdvWEdQeEpYNHZXNkVrSEtaMTNHRDFtdnc5NSt3V2dh?=
 =?utf-8?B?b1dTcEFNQWtIZmNQcElZVm9oYmZhWDA5MTJGWVd1NkhNL0g1MnlHSWdNeTll?=
 =?utf-8?B?b2hDOFM4UTFIc0tBVit2Umh2YTFmTDBKMHFvdFNyTmxScFZ6MUVJajV2N2Zt?=
 =?utf-8?B?SnU2ZExGczRGRXBlYVFaemJLMis5ZmxlOWFLNHdLMEJacFBncVFuSW9TUFZ3?=
 =?utf-8?B?OHdESFptVVduL3pYdG44VDJFTkhxV2NUUk1QLzJ4RTZvSUtWaDlEZTR3SHJG?=
 =?utf-8?B?WmdRZDltWGc0Uno3TU1jT3hNSjR3YjFTQVJUZkJENGlCWHJxSlJmVVJETXF6?=
 =?utf-8?B?YnNWZWRhRkpDOUVQWUxOb2VYSWNWMlhpczNkbzk5bTlEcWtQaDc0ZFFldDlX?=
 =?utf-8?B?cUVqT21TY1lIRndYemIzdURUUUYveklZcEpFN1FNVHhiMHdwM093UVlxcDA4?=
 =?utf-8?Q?ZvYQ3Zy07sVCjv50R0?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c4a859-9049-42ab-2a35-08de79f11e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 13:22:43.8182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9hHI8IbSGpC4MtiTUIAqpPACMvVUG8Mdgj7HfaIavsshXKA8Nr7YuSYXGUZ81cs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iqHBmvnkMyZdCwRmFOcQgP25DOKVFPt1FsGp/T213g=;
 b=I79KF38GXXiUkIGJnEH5HQtdBmUvC8QHXDl42YHJAwSsJPo8JFB1QlE2HrPo4RgyJ/GloXaXLp6aBeBMwYAaj7qWgr/8WtUK9ND/oA/nqECcBmaoxrdUQHfqT6bsh7ujqmy1fQZpzKxuXPZadEKjHPwD6qmqxSY4BfGVCbwuGrw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I79KF38G
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/post-image.sh | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..c1a9062909 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,8 @@
>
>  # By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +ln -fs "${BINARIES_DIR}/$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
           ^^^^^^^^^^^^^^^

> Is the added ${BINARIES_DIR} prefix correct?

Yes, you are right. This is not needed.

I will remove it with v2.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
