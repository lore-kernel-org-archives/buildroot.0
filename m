Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E52CE7D05
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 09:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29CA60808;
	Tue,  1 Oct 2024 09:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGsC-c87dnlS; Tue,  1 Oct 2024 09:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E56FE607CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E56FE607CA;
	Tue,  1 Oct 2024 09:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142661BF27E
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 09:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027894042C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 09:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INrdJwO78KHo for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 09:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::4;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4FC3400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4FC3400D1
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4FC3400D1
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 09:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8xyQOsJe0+wO+whSRrvjETT9lnv+WRWdUzYHIScisbZUAKgE7qEmqxw1VrpcMVkBpUaZ31Hxj5pqbKLR80GmoAB2iiPnWjzYdBgw2Yg2VanLyh8PZF+5ri0khTL9ZbAeE9IBm/A4wJMZCSbbHYJmKtQSX5btbL+fi5F416BFopqvQ9eWaiER30ZAdrudQajvAmKdLVqPITZCocpq7jpwhPvk7yd6pfHys1zWTGP2eGZmnWcWmvsinsbaGEK9ptuCC9XwpE2HduvMZ6rTvdqFipJFmcmIVsJI/6TmlsHRYXXbFo1GWW8ZM3PGoABbzklS48yE9DHqE374Gm0ieAvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SkoQiWGgFwYH6zecxGH+MX6jQ9tZZWu4YBP9Y3OZXw=;
 b=Ji0MQEKDq6Rw0D3Cr6cIU33hZFNxYkEL1kUmkFKaWPgNbXqQ3AOdpPUI+mPaIuBGG0PvoGxGsh+Q09dMfzbm+x+D2HGUkUvQ+jwbPAp+Rrk58N6kIMaaXLQtaIurUQfW3tdUSZPSDImWAwSNI0NBFND4fRMNqfO92UZASurZQnaCREMAm2eOsI62Auu2OW0W0CFdv3Nvq3PDBH4SdFD9ZHE0Vi3X7oI1y5YhhwyL2t41Z9B9e0vIRei35TPitzez2dFKiVttKjF+QpDp2wqx78nOSWJGXzdF/wFH5oUZVdNr+/hgZW9ympF4Ipa3Oxg04kOFqXsSQuHnd5Dqly9UTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 1 Oct
 2024 09:50:45 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 1 Oct 2024
 09:50:45 +0000
Message-ID: <05372228-2faa-4024-9be7-89e1b2ee07d0@cherry.de>
Date: Tue, 1 Oct 2024 11:50:44 +0200
User-Agent: Mozilla Thunderbird
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240929151124.103921-1-kilian.zinnecker@mail.de>
 <2460269a-e521-4add-ac09-6bd1b0a7a872@cherry.de>
 <79861be1-00c9-4f61-baca-2a276683910e@mail.de>
Content-Language: en-US
In-Reply-To: <79861be1-00c9-4f61-baca-2a276683910e@mail.de>
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU2PR04MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bceabf-6c33-4e89-4193-08dce1fe8520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFR0bTZ5Smk1YjFCdTM2b1p1dm9WbFVGSjlvR1c4YmZpWE1YZW5QWDRrWTdw?=
 =?utf-8?B?TFR5YUUxNkZ3cmhsL1JxNzJPNDc5TG8yendXdVhlQjl2ZVVUY1hiSTJhRHox?=
 =?utf-8?B?d3lFNGdmdVdKaEdCYnRTQVFxeiszUzJ0YXhnZ0N2QS9GZTNGbnljYWxmNU5O?=
 =?utf-8?B?eUdLVCtIMGpkMSs1ZXhodUViRkM5QVpuTlIwbjZEY3lFWEtzd0Q2eG9ld3JT?=
 =?utf-8?B?eFY3NlZIbVE4bnJobmd5Q0ZGelRQWDgwcDk1L1dFV1dyVzM5bEsramMxUmpV?=
 =?utf-8?B?SFQvbU5lR2hlT1dSb3BJbUVyMG9qK0JPNUlvUkFnc3RiSlY4ai9uQXFLV091?=
 =?utf-8?B?TmpqK05rYjExOTRnenNFYTRwMm1QRUx6UGZUMVU0QUR4eGpxNSt0Nk8xbzhS?=
 =?utf-8?B?OWxYWHVmWkV4Z29jZ1B1aVJYQnZZSlA5eUxaN3hDazB1aDJLdTVKeXBoY1p1?=
 =?utf-8?B?YzVHTzNhSm5FdWVDaEd6K0t6QnRhWkZHVVZZZEpnYzA3aGpST3hQUlFtR0Fs?=
 =?utf-8?B?emN5dmp5djRZRFZHam44djUvRnE2WSswV1dYN241cTFMMHdjM0JQM0pibFdG?=
 =?utf-8?B?MTZ1c2lOeEpjbnlqakhtWUlDN2lVL0JLaTJsdjFvSGtTSnNCNTJhaVdUa1Zi?=
 =?utf-8?B?VHNkWm4rcU9iVDIxQVRkcnNYVVRFQVBaclgveTRWN2k0NG04ai9ZaTdvaXBR?=
 =?utf-8?B?TEZ0cjcyWXNNeTlCaGlvU2dSbmRYWnRiU3JOd0g1WjJIeWp1aEp3bEJLZGZZ?=
 =?utf-8?B?b1lad2VuMnFiL1o5VkpaTHh4Qi80WEc1ZmhTKzNJOU5kYWVUMzBNb3dJTStt?=
 =?utf-8?B?bGRYWUczWVBGUFJrWGJVYVFQUFMweWhIaDJkUHhHaWU3dFoxaE90d2NuNTJt?=
 =?utf-8?B?dGk1cGRkTkxnQUtzQWVyWlp4NjFvNElzV3BzemgrNmxMTWpPaXZHY24vVnhk?=
 =?utf-8?B?RHk5czR5QTZXVXlKQXMrQzhWRzdFVXhwbXRVUG5ONDdjN0tvU09kTnpyZGxa?=
 =?utf-8?B?RDVFZzVzRllYY1dqSmpUdGw4KzhFajVxeTZGRUFNcTI1aVpSTWk0eEllMll3?=
 =?utf-8?B?aVV2c2VXVGVJSnhUYjNnMzJGdDhxc3VKMUw4Ty9SQnZ0c05HWHZaZ3p4dGlT?=
 =?utf-8?B?SGErSkZlT1pTeGF0M2FXRVNYN0ZPVXdMdEdLVDRxZXEvTzBEa1lCVzlUTEpR?=
 =?utf-8?B?QmxYNG9hRjR6eUtMbng1N0ZHWG1DUmdubW5tM0h1TUowMWJFOGd1RHRsVHVO?=
 =?utf-8?B?bndQMTdHdVBwOWhtcWpyZ01xU2w5MGRvTTdnWUE1c1JRYSsxVzU3WTZvdU5z?=
 =?utf-8?B?dkZzbVYvSk51SWdseGZveURwdGVqeURWdjI5RENyTHpkM0l6U0NuMEFHSy9N?=
 =?utf-8?B?UldPZlFjeWN3ZkdHeG4zQ2Uzc1FHTnUrOFcvYkhhTXJURlhnQ0JXcXFSZUF2?=
 =?utf-8?B?bWdWL3ZQeFM3MnB1TVNoTm1ydE00SVdhUmd4YU9SYjBXZ2Ixb3JCaVM4YzhJ?=
 =?utf-8?B?Wld5T0xwRTRDeHlielBHWDhBN1Q2RjBSekFXOFZHNGRmSGpOZE9aL3dOV0JQ?=
 =?utf-8?B?ajFOR2Y3RWNMTVp6blNhWHdaSlcxNDhLcDd2dmxvamMxZ04rQm5PSVFSNEY2?=
 =?utf-8?B?QzFBeGJLdzNSb25JcUNDWG15UTdLYWw0V3BCeEluVmcvR1M0K3pXU2N4ZWpY?=
 =?utf-8?B?WGx1dG1QUHlmZk1tUWJWVzhqckdGL1psZmMxZTJHVkVmVlp5SnM2NnNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8906.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2oxc1grb2JFSGx6Qjc0aWRpY1RmZHQzS2hHRzEwWnlMc3JOSXZFdnArMW9F?=
 =?utf-8?B?OXVqMGR3WEU0Q1doZW8xc25JdXV2UFlpRDZyaWZLbGt1ZHRyZjExRWJhU3lB?=
 =?utf-8?B?WDNsQjBGbFY1dGNhYjN3enZ0dXQzNG1nVVpGRDVZajlnSkFsSHN4QnRVQlN6?=
 =?utf-8?B?aWhxOEFNMDJEMXY2bVJvdTVFRGVBYUNKTzgwM04zdUx4M2tKV0lvNVBNdE16?=
 =?utf-8?B?MzBrZFVrOUJFV2lMaUY0dGZSbzdjM2hPTTlJbkdPVUdJSUVSakhuT3IyQWJn?=
 =?utf-8?B?WWJ4djFvMGY3aWlYUlV5eTRUdHVNRzJOTXZvMzFEd1Z3eCtEaFJTaWxUQW1R?=
 =?utf-8?B?N2tIQnpibGpwR3plVzFYR011dm9VaURSMktaZHV0djU5MnpFZUZzM3o5dDc2?=
 =?utf-8?B?aHc2SWRyRjlzZ3JSMTUzWDljbWJTYkVNL1IyWmFhcjNNWWZud3FJa0x5bHFj?=
 =?utf-8?B?cUtCS2htcnhGdms1QzMxZXVxQUVLNy9OWVhBbVBweTN5Yjc5VG9vVDVjZnk0?=
 =?utf-8?B?bWhSM05MRFo3YjVkWXJQTll0dituVGdJWlk0R1k2dFdzc1pWbm5uUnhkTkNz?=
 =?utf-8?B?TEhNZ2x5Z09KNFVGNW42QnpseFozNlIwYnBsV2RaemJ1OURlekF4VnVxV3pR?=
 =?utf-8?B?a0VLTWpDY3NsNFl5dVFVUEVPYWNnVkl1VEUrOUlJdHU2SkxPMkVTRjBSV01S?=
 =?utf-8?B?NndDOVB0MmlGdzdZYXJHM2dTYmFlOE1EdUozRUM0QmVmbTdUeGFScEtodFNL?=
 =?utf-8?B?dGg0MGViYTR4N0J1Wi95dWZRU04vb3lZZkJodkdod1lrWjYwWjQzOUhjUGlo?=
 =?utf-8?B?MWdzaUFaYk5HSlM5SSt2NXdMSWh1ZmN3cEMvRzlyNHAybVZ0Ly96aWxpMTVp?=
 =?utf-8?B?R044SnZmTCtaOFVHN0p1czRCb21TeEQyTHJDSjFnblFaVFNXaHhyOGxJYVpw?=
 =?utf-8?B?UERIVFdiSjVUMzZQVkY2azJmNDdtVjVjUFJFWU1aR25zdGJXeXdkVmsvS3N3?=
 =?utf-8?B?NVBza2tVMU5Ib3NnMmltS1FXLzNUcGQ2VkF1S1JtcDRiMnVvc0tRMlFRRWYv?=
 =?utf-8?B?N1JJVW1lQ3FPd2t1WVFXN1RkeTR1Wk1XRjI4eU9BQnQzU1pPL1hvNTFoc0RO?=
 =?utf-8?B?aW9YR05HSmwwTlFoclRvVHFramUvNzRGdDdpRjA4YVR1NXlEMjZmKzg2aU40?=
 =?utf-8?B?dE1wWFNRYWNIY2M5MFM5eU1sbUM4S25wdGd1SGZrWkZMZ3hZVnVxZmx2M2ky?=
 =?utf-8?B?YWdTMTkxL01yYnl2UkkrV0dMaUxpT2N2YUFaWGNZbGp1SVVHWlY0ZUR3Q0xQ?=
 =?utf-8?B?WFdYbnM2amx5ZTVnQ2s2bW8zN1ZvZDdSNlF4Nkk5VGZCUTZ1WW9UM3p4UEhs?=
 =?utf-8?B?bmtFSHA4LzlmNmdPZ0gxMUdVdWdiK0NWTjJwb2pueHRwdHFMdnhUd1VMMUlN?=
 =?utf-8?B?ZFYxV1dESlh4LzdPME5lNU8zakpBOGZpY2kveWJtbUp3YXdSZGdyQ0R3cUhw?=
 =?utf-8?B?K0JNSVhLSUVIRVpjUFpjbGllN0Y0RHNJS2ZpRTB6UW5kZXlQWjJwNHRidnZ6?=
 =?utf-8?B?c0hBUlJZSVpmUkJ4SGhqMk1LQkQ3S2hqdVJLZ09kbExKVWtOWUNkb3NPd3p6?=
 =?utf-8?B?NUV1ZmU0NE15clRCdGVBdUVkcUgxT1ZnQlJkcHB6UHM1alZ0cURiaTVseUpq?=
 =?utf-8?B?L3czMVF6OXcvOW5Sb0oxaUFiN3hVVEVnN1lGT2h4WUJHcjVGelVETXcrbktQ?=
 =?utf-8?B?WGZjcWRRemtLUDFNNjhSbkI1MnBRRTdDdFdPT3QvY2F6dy9qMFN5Y2d1OE8y?=
 =?utf-8?B?Smx5VnhhYkMzYnByQ2FHc2s2UjhzVzRHMEFLVGlGUUNCeERocWN6c253dHox?=
 =?utf-8?B?dVBlOHlNMlBzU3ZsWUU3RXZ5NGNHZWM2Q3Q1a244U1B4U2pKeDBWME56QUFw?=
 =?utf-8?B?N1JyNDVoTi9KWVBxZlFEWFBITkpDeEZuVjVsaU5xRWhOeDNWdFRnek5RckVM?=
 =?utf-8?B?eHlscjQvek1JbXh4eFBmQllXS3hqYnpJbTFjL0NXQUlLOWpjamlCSnhGcmRl?=
 =?utf-8?B?TExjamZMdFN5K2g5ZlZxcVRaamgwcitUUURLYm91eUN4QmNDMFd2L0RKVHRS?=
 =?utf-8?B?aTl6NGJIblR1SDAyUUpOUk9zU3cwQjBVaGRHWmVXM0tjdVRUM0NiMVNNMWJY?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bceabf-6c33-4e89-4193-08dce1fe8520
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:50:45.2166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i8OI0hvDdDu9sRkYx2+aEku6ii55H4f+kPaOEg9H+FLZAdS6vxhmRQEIu/c0yM83k+xcOzD4ys6HO7FPp0J5NfaQXasBRxdJ7TybCKaLW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SkoQiWGgFwYH6zecxGH+MX6jQ9tZZWu4YBP9Y3OZXw=;
 b=nTLKnFtjLA3ud79t4bZRflfBPKZL6ze3l75dyPh2tWRvLoq+OFisBxo/fTDD/4yGS6hdKwYSQdeBxn7Nq/8OjtXgs2KrLKCWfey7aa7tDuan2AzblPOrgwejcJHfiqEHlfWnAsEo1SXs3W1b7LDTK7lih0pP8vdsL93dy4cuErM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=nTLKnFtj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
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
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 9/30/24 11:20 PM, Kilian Zinnecker wrote:
> Hi Quentin,
> 
>> Is it really reasonable to use a random commit in the master branch?
>>
>> The v2.12 tag should happen somewhere in November/December if it 
>> follows the release cycle of the last few releases, shouldn't we 
>> rather wait for that?
> 
> My thoughts were, that it might be better to take the commit from the 
> master branch of the upstream ATF, than the binary blob. And switching 
> to the release version can be done, when it is released.
> 
> However, I also understand, that one might argue, that a rather random 
> commit from the master branch might not be so stable vs. the binary 
> blob. Hence, for me it would also be ok if we wait till v2.12 is 
> released. What do you think?
> 

I don't use the Rock 5B nor Buildroot for any RK3588 devices, so my 
"concern" is the only thing I can bring to the discussion. Put as much 
value as you want into this concern :)

Up to users/maintainers to decide, just wanted to raise that I found 
this a bit odd :) Especially since it is possible Buildroot v2024.11 
will be released before TF-A v2.12 is, meaning we'll need to patch both 
master and v2024.11 to use the v2.12 version.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
