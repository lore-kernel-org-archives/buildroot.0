Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0ABC4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D5C404EF;
	Tue, 23 Apr 2024 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grRvOqXoSKbg; Tue, 23 Apr 2024 12:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B56140425
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B56140425;
	Tue, 23 Apr 2024 12:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 099531BF313
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 12:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 033E4605B0
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 12:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jzx4HIoaiYOw for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 12:56:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2611::700;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@theobroma-systems.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89683605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89683605A8
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2611::700])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89683605A8
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 12:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikrE7xP9ZagcrqXKc8iRAnuBO7LEilmyNYcaP9kLW2XN+Zb6QJjxwJDfIxCpRfSUwabMSiBfh4CaVgayHQOufluhD48paXA56DEcHFBjifuCKDrBKKz4VMs2qplffC/vto/daXwciRNgVOreb/klwNeGKwjvq7VDwJMul5xl1oxlapwv4afehiR5G9lSgRJXrTvfC1SoUO2HXUKgFosCt70CXbx3YLsFa5psY4A0TDh9WUomG2AHAPNXeDLs9mMUsbLY0YOTNkDlN2veYOPU4xXdpSf3BHNYYxOBWMOdbSfS3EhYaeI/ihYB7dl+70kB1Js4IouSQz1yjIwkycrxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueO6ZvQ7tDbSZ7/1FD6dnkprGA6R6Sb7I8bJm45nlEA=;
 b=n6/Hb3hZ6UBxsqBQeKDRqLQES0hUI3yxtRHgnPrFcw96bdnE6vvf5eEJXKkmbzSB2IwkFGdGbJWwOltqSFPwSqKnC6CgMuW9tnEVuP1yYXufQjcNbmMl8vA+8mm/ZBlWlIbibTOcoB87U9nJtMJTBSoVDhf2X8krXIVeTjb0Tf7wwglwtITl+pZ0KScjVvaSlatx9WF9CmNP5bAtTVidYnXHRWPnzFuqddlAvrdD1BEAbPh0yhzw5hKwUEmojjuC9z9D1Q4Te9GcHo4Ey2Qx7spruv36Fq7aRaeCCCZLDR+JGEsbYJxHfut4qf93+CgH9yi62FmSotsJYSKd9jka+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com (2603:10a6:208:c2::30)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 12:55:59 +0000
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785]) by AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 12:55:59 +0000
Message-ID: <57d8570c-8825-41a3-8763-64d9589af492@theobroma-systems.com>
Date: Tue, 23 Apr 2024 14:55:57 +0200
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240423113313.GB527510@theia>
Content-Language: en-US
In-Reply-To: <20240423113313.GB527510@theia>
X-ClientProxiedBy: BE1P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::17) To AM0PR04MB4833.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4833:EE_|AS8PR04MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b19d14-6ca5-40a8-db18-08dc6394b912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWp6MjZIUEhDRXBadWtaYnVGZWMvWlpLZVo0R2pTUVNoSGcwNVM0YkU0cTlm?=
 =?utf-8?B?anFBa2ZKUlpJZzkxNzRyUm1ldkVJOVNoQmVTQkkvYzRyakEvY2FuNC9xUzB3?=
 =?utf-8?B?TC9rUUo3TEhtNjhrRWFSUTFHYnJVM2NYMllwR3ZmSExocDFBMFNJU0w4MDZV?=
 =?utf-8?B?OGt0SWpQVDNRMGRyckpwSGZNVXdRUEVsQWRuL3g0czE3L1V3bzNKVmxNN0t1?=
 =?utf-8?B?bmZoVTN6QU1pU0w0Y0VVeFB2L3BnSmhoUmNteEVFWERMT2VJditVTU1SVFBG?=
 =?utf-8?B?Wmt4cmQvVFltMTFwSEVzQldrZnVybTcvT3Q3cWxDQlFJQU9JQW1vRm82Q1ov?=
 =?utf-8?B?MjNXeXhDSUVaSEVCc2RzTzRxbHEvMU93N3dTNEpicjFOVnJESk1YTUVzNEtp?=
 =?utf-8?B?MG5BcmRMTVVqaUFTRGJnVzlVT2l0eDdISnY2M01sL1E4NzhraUFCZTRJRUIv?=
 =?utf-8?B?YmRlRS9laW9JaGROcHh5eHo1NXpMazlzWmtnZ2FERDIzWUtiNG9YZ2ZpelY4?=
 =?utf-8?B?SGF6aEp5WUFWVmdldThORUMxcGp1N0Fnd25HWllFYm85QzExSDF5ZGNKYjRn?=
 =?utf-8?B?RFVFNWZQRVZud3YxeWx3QmtwK2l4a3BZbmFTUENTY3R5R01XZUF2VisybDZ0?=
 =?utf-8?B?aDV5cVhiVS9Bc0ZtT2c0ZXZzSzgydzVRb3pWVWFWUThkQWpyYVNKblhlbGdT?=
 =?utf-8?B?OVZFcHd0WjlpNjFhMHAzVTFjQzRmVVIwdjFKRm5MOTYvLzN5U25ZL05GaU9l?=
 =?utf-8?B?OGt1c29oejhxYTMvYW5qbUl3V2Y0cE9LNmF5OWttR3hrWENiWmk0NUJ1bGhK?=
 =?utf-8?B?SVczNGtmVDM2VC9MRHlicFU4YzEvWUNaT0NYc00yeUpScVJxYnJId2MxVzFL?=
 =?utf-8?B?eG93K3RCbDZWRjBPRWZWUHovdXUvMGNXWGl3Sm5KZndWVmlVTVZHT2RRWlVH?=
 =?utf-8?B?ZWZ4YXNWUTVMU0VqTGlZenpiVERWZk5xNmxsN0JuR1hJaGlFN1l3ZTAvNVdD?=
 =?utf-8?B?cXZqazh1bnZZZFJSQ242L1Z0SUE1UTdTTTRzay9mcnNtV091ZGNIR2Q0QXhl?=
 =?utf-8?B?MzdJdldWL0puZG5Mdm1QU2dGMS9HeUZUcU1GcTE1dllmdDR0NXNWYWM0cWwr?=
 =?utf-8?B?T29vd2VUZEVFaTRpUkdHdUlHQkFTeVlOQTFyeHhOdzZXM0FKeXhEYUgwUnJP?=
 =?utf-8?B?Q09FbmkxMXorR0EvdnRIYlArVjVNU3ZuV1dxUVZCYlVKWXJMb1hvRDhobEZw?=
 =?utf-8?B?UXNvVnBYNFlwOVlYOEM5SDJZcnNoelAwcUxmZEFBVEN3UDM3dGZXNDNFdnVT?=
 =?utf-8?B?Q3k1KzBvTHJueXRvTFplTC82SXJGdzhMWnRVRjFNVjM0ZUUzaHFsL2dlVWFL?=
 =?utf-8?B?V3JycTZQVHBtK0d2a2dMcTZZUW9MNjA5QkpMWVRVRWZ6d3NObm81NGpmVW9j?=
 =?utf-8?B?RFQ2Zkx6T0M4dGE2clRTNEU0NTRCM0N2VkU1WHFSTFZLL1dkR0MwR2hBTW5S?=
 =?utf-8?B?UWY3ZFJ5bkdUUW1JVVpSdExvM0QwcGtUZ2tVd1MxRFBCd215U3RrU0NtNmto?=
 =?utf-8?B?Z3pyOHdGTXlxTG9qaHpPZVpkWnFXMWdEM2gxUnF6eGJmT1VzY3gvc0pkanhQ?=
 =?utf-8?Q?CikwzDo/ae8qDX52brCl1tkvjzpN/RkFQFs0RckEs2o4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4833.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0N6Uk5PMStSalJMR1JyK25qWTJiNlZqdmdrNHQ2YWEyYmh2S1pDcTFadjFB?=
 =?utf-8?B?RWd4VkxXN1c1OXhVMGhLZ1BsdjQrN053QktqblhqR1l2TE81L00zVWwxcDNV?=
 =?utf-8?B?UjdzOVdjNTkvYW9TTEJyeGtEalpmZTVaNFpnTVlsUURhRnd1M2tGL3h1OFJn?=
 =?utf-8?B?R3dFOUtpTzBJWDErcy9mV0pOb2NYUGFUSFVvM0F2TSthUUNkSUR5b3AyQUdq?=
 =?utf-8?B?elRzdkJneXU1Vk9vVlJWZWRZamhWbUk0bWtlWGZPckZnSlg1VVNYRmVXM0I5?=
 =?utf-8?B?Y21xN2dTZHBxbjhDSWwxNUxJbGN3NGRjZlgrU1ovOU5PbnVHWE9zSnRJbzh3?=
 =?utf-8?B?WWVtY3h3bFRxb0F5MXZMUkVPZ1A2MUEzdU5wSUhUNUFLOFN6UkkxNWl5c0dt?=
 =?utf-8?B?Q3BSYWFINWF6ZFFaVXk0MUg3Mm9XV2l3eHNGR090VDhUeTdRYnI4OXB2K09t?=
 =?utf-8?B?MkZnM04wakNmNms1amFZTWlyUjlCOFBqVFlzYTJsa3JBQ1pmTzRxUC8yZmg5?=
 =?utf-8?B?N3RDekFEVm1UVDVuWkY5SngxemRZN0d6NldXaThNOUJicjkrcU5WVG5ETE1B?=
 =?utf-8?B?WnFCTkxZaW9na3ZwMXhlMnU2Yjd2L2dacVF1VENmQXlsM0JwYW1YcmVnVlVp?=
 =?utf-8?B?Z1E1cW9sTzFDQUJTQ2JOV2dodkk4amR0VVlPKytyUXo0cE1xWUZ3WXJKUEdS?=
 =?utf-8?B?VTcxeEZ4L0xxd3FzdmNXN3hkWUlwZ2xqMUNlL0dKWW9xK1IvdXFWYVNucjZ3?=
 =?utf-8?B?UDkvZXViSldrQXhGL011cjhRRUtHRzJ4ZGVXbUVaNWJRaUlWWDdiNTE1bkhZ?=
 =?utf-8?B?TmZKanIxazBSb252ckw3YzYvc3puNUtRUTZ1WFZ4eUNjTWdBdDFkZGJpc2p5?=
 =?utf-8?B?Z2FaRVRjZFQrRGRTa09SNXo2WmtNd3d6ekpBTUxQVlY5OUF1cGk1aFNXVDNZ?=
 =?utf-8?B?T1JBRDBYenRzdkRkVjNTQWxwT21ZUS81TU1FTGZzK052VUpnd3hyTzc2VjhH?=
 =?utf-8?B?U1NZcXhsQzZIbWJLYXZhUENxU2Z3NWtERW4zNDdLalQzSCtab05Eb1A1Nm5H?=
 =?utf-8?B?em1rSzMyVjNsRTg5c2p1dlpkV1NCak1DVnZxSkFDTHlnbVJLRUVtS25SZ1dW?=
 =?utf-8?B?blFJNlpwMnlwb25Oazh5dlBIOUhvVXpEN0JvVFJwR3U4Zm1zekdDVXNBUkJp?=
 =?utf-8?B?U2F1OGs2c21pNnR3NHNlczlFS24rRXViSXBHSmsxMXN3dUdNN3FGNy9tZ2hK?=
 =?utf-8?B?S0k2YkV2aktKM3FVc20wb3RHUWZoNnJNTlF3clVwaCs3Nm9nWFhQRHZ2ZU1h?=
 =?utf-8?B?M3F1TTVseTRRVTNwVlZRMFlEL242UUhuQ1VOQnJUKzVlV1FTNEFhZnZUUzZh?=
 =?utf-8?B?WlpNMEhhMHN3MzFYL2R5bnJHVDgwZE1ISUlCYXAyVktUZ0ZYMldLc3NjYnNr?=
 =?utf-8?B?OHdsZG5NNGY0YVdZS2VabWNUTDdHaDlUYVFNZDJ6ZkN6c3dJa3RWclVjRk9L?=
 =?utf-8?B?bGhjemxnRllvNlEyeVNVc2FlQVFHQXNQY1ZmRWdxWUFyNkFpNU9sT2xCS0pn?=
 =?utf-8?B?Y3p6K1JyTURVaGM5dkFCbWZ0TllCT1NOeEpHR3hHenVBZTB4L1drclhWVFdH?=
 =?utf-8?B?VjRuMmxkUTFIeU5MZi9rS0hGREJMcUNETUlSSWt2Z1BvRGxqaGdCMjcwVXlW?=
 =?utf-8?B?Q1RpaTZ6amQ5RTN1R0s4d3lJb3pkMnBOT3UrNm1PTjNyS05wc3NWeHMxU3l0?=
 =?utf-8?B?dXZSdURXV0tZM1RRTWxTcnFrSkNKTm1rMHhMY2xHZ2plb1Y1VFQvRUN0SHlY?=
 =?utf-8?B?MzE1cW9BQzlFNVB1b0hMRlFnS1FKYjlkVU9SckZQTEY4ejVEblN5Y0Fld0FK?=
 =?utf-8?B?RXNzS0Y1VHgrZkl5SU1HSkVMRzBVeC9XODZLL3NId0JxU1RMMkdZZjRseFJQ?=
 =?utf-8?B?N041bStUOXpoN1o3dHpNVUgyS1V1bDJSSHlDdEpQSkx6aGwyRDduOFh6RTJK?=
 =?utf-8?B?U25CRWtacGxXdDJRYkpUSVFaTGN0SEF5Q09mNWxBZTFrVVNhVG9YZldVeGEx?=
 =?utf-8?B?M0QzcVQwem1udFZUdExKSy9yZ2Jnc0ZBVEFVSkxUQlE4QmdmZzExV2ZmTzZV?=
 =?utf-8?B?a1pSUDVVcExkUHJ6eXZ1SGVOTGNBSlF6WStVSEJWUFNqV3ZkNDVlSUg0c2w0?=
 =?utf-8?Q?4T/0bh23x/322hM+f30JB+E=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b19d14-6ca5-40a8-db18-08dc6394b912
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 12:55:59.5050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jGJxA5NHIq0N5EYibnn1aXWxF1C1cH4hil2tIjnHRdxrbRwuxt2SCRCXdhm/3Yr4dAvt+0O3OzmAevSamFVMIVFgGAsvy1tmzOXbTCWgViwg4jsFCfnI2zGgdd32yc6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueO6ZvQ7tDbSZ7/1FD6dnkprGA6R6Sb7I8bJm45nlEA=;
 b=PRtxaNym91+FLPhAdWQ4Od0+z7RosN8lL95SPAzPOozOZQP1SgsiAFL4NmuWnJMzVi2muRyruyqNZD4FsDgTfa4Opo4NsWRUn8YIc/OYq689lj/lfcJFsaCwxQNXqPpuWSJXoTi5gP9WkvX5hkF2ObdleEF8hgaWGs5yMgnVQdtRaSycBF339/9bydOsKoiT4vRATRYZ4KWdRPhmpQS9aAeyRYmeC/YqGnc20Ggdp6H5kgJq0sNkCvWEZT3aTnVVv76vHlyQ1Hmfi6Od1YxxIs2ZaBofdJePw/myeXs+OzMoXlWA4z/1JSJAHEAeP5DorT3tC+++hYz8dtQGM8R8DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=theobroma-systems.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=PRtxaNym
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2VybywKCk9uIDQvMjMvMjQgMTM6MzMsIEdlcm8gU2Nod8Okcmlja2UgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPiBIaSBEYXJpbywKPiAKPiBJIHRyaWVkIHlvdXIgcGF0Y2gsIGJ1dCBpdCBkaWRu
J3Qgd29yayBmb3IgbWUuIGJtYXB0b29sIGZhaWxlZCB3aXRoIGFuCj4gZXJyb3IuIFRoZSBpc3N1
ZSB3YXMgdGhhdCBteSBob21lIGRpcmVjdG9yeSBpcyBlbmNyeXB0ZWQgdXNpbmcgZWNyeXB0ZnMu
Cj4gVGhpcyBkb2VzIG5vdCBpbXBsZW1lbnQgYWxsIGlvY3RsIG9wdGlvbnMgdGhhdCBhcmUgbmVl
ZGVkIGZvciBibWFwdG9vbAo+IHRvIHJlYWQgdGhlIGJsb2NrIGFsbG9jYXRpb24gb2YgdGhlIGlt
YWdlIGZpbGUuIFRoZXJlIGFsc28gc2VlbSB0byBiZQo+IGlzc3VlcyB3aXRoIFpGUywgc28gSSB3
b3VsZCByZWNvbW1lbmQgdG8gbm90IGVuYWJsZSB0aGlzIGJ5IGRlZmF1bHQgZm9yCj4gZGVmY29u
Zmlncy4KPiAKCklzIHRoaXMgc29tZXRoaW5nIHlvdSBjb3VsZCByZXBvcnQgdG8gdGhlIHVwc3Ry
ZWFtIHByb2plY3Q/CgpodHRwczovL2dpdGh1Yi5jb20veW9jdG9wcm9qZWN0L2JtYXB0b29sLwoK
VGhlIFpGUyBpc3N1ZSBzZWVtcyB0byBiZSBkb2N1bWVudGVkLCBjLmYuIApodHRwczovL2dpdGh1
Yi5jb20veW9jdG9wcm9qZWN0L2JtYXB0b29sLz90YWI9cmVhZG1lLW92LWZpbGUja25vd24taXNz
dWVzCgpDaGVlcnMsClF1ZW50aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
