Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A924C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E676061B;
	Sun,  2 Aug 2026 16:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdGZfwFlFMQD; Sun,  2 Aug 2026 16:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B40E6061D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785688659;
	bh=hCZmMDk4jLfKk05l9Vpvx0fXlZBqjW/v3M6krxaNU4s=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ryyedhHiiI3+5iVJQf82o6GV9YYVCZGM/+M/kpxLheGD/GSUfaMdJp5VEdrJq5/WK
	 uceBWqPW6bChOCkv+j5LG3nsJ7gtbMTWSdULTZksEpEcBFKNkj6F3eW2cczMacnk2B
	 cN+ZkGkw/lCPpToA9hZ/VrDyqYYCf7+OvAi3btOS4jgJA4jt4pfYqKg8yj3pyx3rp2
	 HXYb/Zzm/weHMtz0cCqwuyWOftE7DhQ6Jc/I6vLeS7B4CXo1vxsC7z7gu58rROg45k
	 tYWjDRznPdAfMMP0GwDQEhGHLm4nD++Jkx4sEh0sPHpdYoicabUHc8VKzTY8zShNMX
	 KVh+42KD1mLeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B40E6061D;
	Sun,  2 Aug 2026 16:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 922063B9
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7875A40594
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNf4dmams2zT for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 16:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38C7C4058E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C7C4058E
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38C7C4058E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db68RgaaT9jJH+XSHOpE2T6bJ92Za0aW6sccAJ6mQzeqDCKzF/ZowTmUU8evlCMLWZ1FRICYfs1y138EpcCUmsR8f2aHk5a9V6/42pOVvP09hIH6bSzamOBLFet6MseImNeUlRWTN52IX1m6jLOFLDdyhJ/1aJdrjWYxks4uC0v07jj0gQBtgcXc965bc265pVD7rJMkyy+SQ6h5X6ZmIbrLdcopbkMR7NBWR46oTSboDE/2aChV4NsMwRpyUBFp3Kev0hae7nWU1OGcLY+QsLntzUUj7a+z2lwMRHEJ0BvcCoXGyYtOFCFRlJzE1HXrx2C5oZV4asiPMyOJn6eiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo7fvrN44sTvhu3sOMyockp2zlQi22Bm7FQETZ+7USU=;
 b=jrzJPjJ1kLB/cWbgk8RzY+QVmJL4RjyrpjRF9J9TAeHrPS6MQ2Vyry9MYbxykYY6KzLusfxVz/igziEZACuYK9YTIgE1G0jYRv7eK35Lul6OOUTYHSq1TmZdogkQ7ooi8oRPDUMvgBR3mZXDh4K1LrqZVmvCaBqFv20a+OM61TrLe5h5SLWli0exppY7IGwmbqYXcPhx8UV+m3ZEpJ3lF7Fvq3FkBSfKOVRDaI+SDjlUJbtgv8ejCSjch5sqJHKHfadjQG1gMBk8NFzM8hoF1H1rN5xvuOfuSkIYtnoYjVEWFpACzz1/egmOH83x7WuSnWrR5tkZ6ECFMalpq7R1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sun, 2 Aug
 2026 16:37:29 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0270.016; Sun, 2 Aug 2026
 16:37:28 +0000
To: John Ernberg <john.ernberg@actia.se>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "matthew.l.weber3@boeing.com"
 <matthew.l.weber3@boeing.com>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "brian.j.wood2@boeing.com"
 <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
Thread-Index: AQHc+YuX4ZbUnC0k4kGRj6Tu9c1iTLY6jHqAgAAGpkCAULLR4A==
Date: Sun, 2 Aug 2026 16:37:28 +0000
Message-ID: <BL1PR12MB5032FE2DD74892018E92A4DCF0D62@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <b2810e66-cb1b-434f-8991-3bffe94a5d80@actia.se>
 <BL1PR12MB503266705EAD51DC752299B2F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB503266705EAD51DC752299B2F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-12T08:11:44.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB7589:EE_
x-ms-office365-filtering-correlation-id: 9b0ee372-cccd-4cb4-d01d-08def0b45764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|56012099006|11063799006|13003099007|22082099003|18002099003|41080700001;
x-microsoft-antispam-message-info: aEhMfuF9tqHZtQGdJCoMkgXqq0LDsBUHhTRTdSI9430SFaROKImflxdpmN9nih+XECINZ4Ndv3K5rnvQ0WMGBs2Vc6mKg7TU1LhPjxYt4GNZek6kwVxZSTFceAFph0xxmOXSRAJNGTw9E6g93rMdTZ+z4PkN9StdlMyuD+a24XO+6UHQ6IpnH11gZF1X3tkNEiwttmf28Q1yzAAyo09p6Tl7a+T0VWT5NDR22E2x7YNoTPYDFsG5/EfvwCL1rwXeeXTVdMRsWSnM9PcZGzIfWGJ2PQitrmMIpGUs8waH1msFz8P3ZawE5EZzK8V5l99RvRw4NjWE3UUgjD7uTeQE+U/Q88T2EIYRWLW1RHYXIGZA6oJNE2C/APsGi2bMI16/bYP7WFMkmuewKD6imgvu2fRzlBal/Yy2K8vLOpwKpWnySqJF8d82SOa7eCYOb97hTMWqdNA1kAvDImFV7n5+zawJLVPY+8luondWNRlF978tmJMSpLGK4rQNrF5PvmLG0Ced/8rLOTRZvEp+jpiyByW1vh1tlgn4P9kiSs30MPnJWJNu/LNsoUcpdqT7oVjezYRt5ahXl6GghhxcW+edC6fV8zWPL4VZOI+/Rvteq/vXASH5/4txMBeGMuTskeuhuPLNqOb7cr/82n229os0uw78CkTtIksFKrFOXCv0LJl0yP3nycgIoqbAIyqEG1BS7GSlkG/0VVnP8/JFVAIPSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(13003099007)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVBBQ2M0eVJSWmhkVXliQnc4cVA4UXRQb2E4NzhSOFIwbTJkanpYbytpcEVt?=
 =?utf-8?B?dU0yTDVzWXZoQ1QzT2xVenkzUkJZbWJrcHN4dkRodDNzMG1IMnNKbUdzMjcr?=
 =?utf-8?B?N0R2Wml6ZnFiZ0lDYkZwbkowTmtJRW1xQjZnSWdSQmZlSWNCYVJDUC9zY1dv?=
 =?utf-8?B?ZmdsRVdYYm9SZUF1cXNQdVp3RWdOZFBkc1dma0w1clllR0FpNEVTcVI1Y1JU?=
 =?utf-8?B?b1FTWFFuZjNwWXhnY2lCTzFhZzdOWjY1S0tpMGJzNGkxS0I1WkpCYVhSM3JZ?=
 =?utf-8?B?ZW4xaXNrYXdDK0tnaldpaVpPZEtGbXRzR0w0WVRwMkNnSUVlZENoZ2REQ01V?=
 =?utf-8?B?ZnlKVVh5V0prZmFWUWxneWRhb0JFVHJlNVY0aHl4QWJnZkg0d1dLQ3JuSWxH?=
 =?utf-8?B?Y3ZkamF1TnN2czVPYmFzRmVaWHRKZnp5MDlzRGwzSWhIMVpvYlpDUkR2ckYy?=
 =?utf-8?B?NlVsbks5N1FhWGx1UzNKODB5cUdYOTNxa2Z0cG9WOE14M0MvRjRJOURrMEp2?=
 =?utf-8?B?M3ZFeUJyUVh2anJHNk5lRG1RWk1YeXBwMmErbXpxOCt6VktKNlg3QmIyQ2Fm?=
 =?utf-8?B?MS85aXAyYnBGRnpicVpLcklsSTJmNXMzSWUweGthMndxVWNIcG5DUGNlT2hY?=
 =?utf-8?B?WHFTcUNWd25IUFUwdllsTFZSbUZyMFlXYXlWd0IxaDlZUUw0Mk83dExyTUor?=
 =?utf-8?B?NnBVQzlBcmJXenc3NzNuN3RHSmFVZHVxMEJxcVFpd3J1eHIraWJLZXpqVnJ3?=
 =?utf-8?B?MzJUMlJSWGo0N2tndVRyb1U4STVwa29RYno5d0ZLQndaaGZ3OXQ4dHU2dS9I?=
 =?utf-8?B?dWRUOUxGbnIxQmJhZU9DS0kxU0poVWwxR3NETzNta3J3VUhucDZaVDNvNzE2?=
 =?utf-8?B?UUdueER5QXZ2VEwzK3BsRzBrQzZBQ3FUY3BXTDNIWG5GdVBmZFpPaGxVTEhz?=
 =?utf-8?B?RFZDSWorOHVqd2RCQ0JGQ2h2SERKNHNYNnBOaUhDRFdGWitJc0xKUDIyblcw?=
 =?utf-8?B?RGphRVcxTTdQWThXVEczRzlZT3N6V0ZXSkM1S3dyYzFpVCsyaWxtYThCOTJ4?=
 =?utf-8?B?bnFBUC91MUNSb2ljRWxYTFpaZHcvamhyTWsxK0Vocmo4ODU4S0R0VGNzdUpy?=
 =?utf-8?B?WXMyUldiN2VVQlpwQUt4bHZ0ajlwTXRoVWw5RmdXWmNRSWFIRU5tZllsQlA2?=
 =?utf-8?B?WWplT005cXUzYm1rZWxySTluUVFNWE5MRjd0eXhaQjFpaEs0bVM4RGhRYXlN?=
 =?utf-8?B?cVJYSjd5ZXowK0VHeDE1Rk5tNjZqZjNaQWtjZFJkU3Q2RlNzZnVTQ3lGL2x5?=
 =?utf-8?B?UkU0U1FGNjF2TzRxdWF0eTFDMFVQYlJxR3J2VTc1T0FxUEZSSXdWVjU0c0px?=
 =?utf-8?B?cU52MjVVUGV5TDBhZjY0eERKZENDSUN6Zm1xeWFKMlRNOS95eEFaUVJBeUpM?=
 =?utf-8?B?VStEdXZ1QzZQNXBucEljdUxJSGNtZHJVeThzbEZlS2E4eVJjZXVwNisyaGZ0?=
 =?utf-8?B?UmdsU2hRWklCLzFkRmFCRnp4RzkvS3E2M1FzNENIb3dhU29wVTEwYVNBcTRl?=
 =?utf-8?B?Z0F2WXlYMURmNFo2SUdqYWMzM205R015MVc2ZHVJd1JoVHMzZndEU25UcVZ6?=
 =?utf-8?B?dUNqcFdaKzU4UlV6YVM1SkxTK0MzREg0Nkt5dytmMEVsbzIrc2ZLSk9kRU12?=
 =?utf-8?B?RlVTSGpTSEpuQWUzZDJoaTlBaEpndnE4QnY2bHV3RFo2dkQyM09LeE5wODQ3?=
 =?utf-8?B?UWM2Si9mZEtyZlg1TkxWSU03Yk5xL0JwNnJIOXNuaHQ1bkxETEMxQkJIc1Fs?=
 =?utf-8?B?Z2R4dzJDQXk3WmpGNzI0Y2prQUkvZHRvcVZHdkJLRUx3WXoxTHBJOHFoRDln?=
 =?utf-8?B?dU1ZWDNvS2I2ZFhmSkZuYllnejBtM2k0K0kwckJRa2FzVWJDSHp1eGxpRUp5?=
 =?utf-8?B?SzhtRVhQejUwU0Fia2c4Z1Jaa0IyRk5GcldNM0RlRERXd0J3NnVJb2ZoVGhj?=
 =?utf-8?B?T1o4YUx4QUhUcTFxSHFQbHlYU3MzdDluYVo2Q2dETVprMTl0QWFlWUJLYnFL?=
 =?utf-8?B?RFZqNFY0bVRjRGN1QjFTRWo5M2hldW5FZHplQWpYdFFhL3Q5TjlGbW9YQ1Y5?=
 =?utf-8?B?bzZTMWtpOERFMnRMZWRrYk9JRGhCb05BLy80NkRaVFRFVUpJUW1iRjhvNWtV?=
 =?utf-8?B?TDRRR1krd3U4Um94Tkw1Qyt1RHlUUEkrM21HZFU0T3dIRmptNjlHQXZBaFVB?=
 =?utf-8?B?cVphTVZCVGVLbHRkTlJWME5BanB1THV2MndvVkY0a3o1ZWdBRGptUmxkU3RO?=
 =?utf-8?Q?0d4GjQemC16ScClUWk?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0ee372-cccd-4cb4-d01d-08def0b45764
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2026 16:37:28.4132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kZLjG+IOJpnUap0rPmgpG0+TnRBYkDleZfjAgesN39CvgqaHUCcfY71WlVvqeMg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo7fvrN44sTvhu3sOMyockp2zlQi22Bm7FQETZ+7USU=;
 b=QneLfHpMyk1D2Mn0hP/mcnIcJNzSGFToeKz7n15DYBdnioVHDCoEhICGTJR1qwzC/XG1I/V7j6uyTdDtkM/V7s5CRxEbAt2QpgvNHudzIYB5fmyqqL+2kFZI/eYYLjtz+LKjVkMuA314ROiY33A21DmofHbAC5lbpImZGIRb608=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QneLfHpM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi John, Matt,

> Add the ability to configure specific Xen versions while leaving the default
> version unchanged to avoid breaking any builds already using Xen 4.19.5.
>
> Since the version can be configured, the 3 patches need to be moved to the
> 4.19.5 directory, so they are only applied when using this version.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   .../{ => 4.19.5}/0001-No-trace-backend.patch  |  0
>   ...2-Arm-platforms-fix-build-with-gcc15.patch |  0
>   .../0003-Update-linker-flags.patch            |  0
>   package/xen/Config.in                         | 25 +++++++++++++++++++
>   package/xen/xen.mk                            |  6 +++--
>   5 files changed, 29 insertions(+), 2 deletions(-)
>   rename package/xen/{ => 4.19.5}/0001-No-trace-backend.patch (100%)
>   rename package/xen/{ => 4.19.5}/0002-Arm-platforms-fix-build-with-gcc15.patch (100%)
>   rename package/xen/{ => 4.19.5}/0003-Update-linker-flags.patch (100%)
>
> diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/4.19.5/0001-No-trace-backend.patch
> similarity index 100%
> rename from package/xen/0001-No-trace-backend.patch
> rename to package/xen/4.19.5/0001-No-trace-backend.patch
> diff --git a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
> similarity index 100%
> rename from package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
> rename to package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
> diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/4.19.5/0003-Update-linker-flags.patch
> similarity index 100%
> rename from package/xen/0003-Update-linker-flags.patch
> rename to package/xen/4.19.5/0003-Update-linker-flags.patch
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index dc4d434810..bb44202824 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
>
>   if BR2_PACKAGE_XEN
>
> +choice
> +       prompt "Xen Version"
> +       help
> +         Select the specific Xen version you want to use
> +
> +config BR2_PACKAGE_XEN_LATEST_VERSION
> +       bool "4.19.5"
> +
> +config BR2_PACKAGE_XEN_CUSTOM_VERSION
> +       bool "Custom version"
> +       help
> +         This option allows to use a specific official version
> +
> +endchoice
> +
> +config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
> +       string "Xen version"
> +       depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_XEN_VERSION
> +       string
> +       default "4.19.5"        if BR2_PACKAGE_XEN_LATEST_VERSION
> +       default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
> +                               if BR2_PACKAGE_XEN_CUSTOM_VERSION
> +
>   config BR2_PACKAGE_XEN_HYPERVISOR
>          bool "Xen hypervisor"
>          help
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 5756dfc68c..e354718021 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,8 +4,7 @@
>   #
>   ################################################################################
>
> -XEN_VERSION = 4.19.5
> -XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
>   XEN_SELINUX_MODULES = systemd udev xen
>   XEN_LICENSE = GPL-2.0
>   XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
> @@ -13,6 +12,9 @@ XEN_CPE_ID_VENDOR = xen
>   XEN_CPE_ID_PREFIX = cpe:2.3:o
>   XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
>
> +# Handle stable official Xen versions
> +XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +

> Moving this seems like it should be part of the next patch.

> But doesn't matter that much to me, so, with or without:

> Reviewed-by: John Ernberg <john.ernberg@actia.se>

> I see your point.  If someone finds something that really does require a
> change, I will include this change in a v2. Otherwise, I agree that it is not
> so important.

> To be honest, my original development had patches 1 and 2 squashed together
> because the second patch was the one I really wanted to test and verify. This
> move in the first patch is a remnant of my splitting the patch in two before
> submission.

>   # Calculate XEN_ARCH
>   ifeq ($(ARCH),aarch64)
>   XEN_ARCH = arm64
> --
> 2.25.1
>

I am going rebase this patch series tomorrow since a version bump was applied,
and these patches no longer apply cleanly to master.

The only thing I will change is moving the XEN_SITE line move from the first
patch to the second based on John's feedback.

Given there is no functional change to my patch series, would you like me to
keep your Reviewed-by and Tested-by tags in my v2 submission or would you like
to review and test again first?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
