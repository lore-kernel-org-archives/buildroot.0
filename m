Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157FAC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 10:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B7160663;
	Fri, 28 Aug 2026 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qP5NRKlDFnjK; Fri, 28 Aug 2026 10:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787913939;
	bh=7nRFH82YXX+UN2d4TKrU8oh4AucpzYAPU0lBpEvrDhA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h0COoDbem3VlylC+XDKdG4D/qIk1usisGAZPx4AT07njBi7SWiZiN+CjBvvV+J8Z4
	 LJ4IPI/LLA+ksR1I0/TCfe7jI83IuXo0rgwoqP34LnP16vqSGX/eiKvXkHlBBN3xqL
	 6cKbfA/b3vdqOVrftzYQaCfsGx5iNnhwgJvOkXYLDLgG8TjG1fsXu1aK7eV7afnDHy
	 TcSzjayy0Y4kAdpbJ/+31FdyVZ3HmTSC/VZDo4JUsF9AxrMWKJT+gBoC+WS/XV/oNE
	 YjsQikopdJttuWTKkvG8vB36w4HTjd50kpzxvHb29A4IgqZsmUkZ0BhjB1lNB4lkO4
	 nqS0ofok2XKIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5B0606A7;
	Fri, 28 Aug 2026 10:45:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F71A334
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3592540121
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dahp7l3LdLsq for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 10:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C16B4005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RN+CHw1uHO+qZl2ikNzzHVANdSvrpPxxBaUgNCj/j3/VZ36MfMbHv8+6Zk7Lm+dReZLcRv157TGKX5a5QVaydADkDNcbSHkK/XfygBA1n4PIdww0LRnCxV31P9EB/walLeSvWOc4SI02gavSM9u8IZrGI3PGB5MTL4q9sf4n33qA45xtPGFWvWfm+IpinvWYsPdgz/MbIOLriQldaOfEyDQCiLsTCs6F6UM7mte8HwyWT6h7HgMB5Y+kXI1xBPwQDOImAu+ZsiD2B6VYecWsyvPoRYZ/04DPXq79opysB6BwH5WeMmt9Wx6aFwZfP7JQN3vDKxFy4Npcsq95cKtiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4Cw7RRWZ3pBl3lnM+XqHpAhFcBZtvzUX8a3ImV006A=;
 b=iG1q3f32HIzOuQ0+Ok0QEFnMoChTAwbCRT4nxzokZZeXGlDgOVHsjCH27wblOGSg7yATD4oZX30K55+cq+ayjXzvWh9XbQLEC6/AsA1cbfoFyiXa333wlbWg2c5m8m2cka9qpJo7ARLpSRT450VgV/nSvJYe5dMOQ/BoLoeuJelu6WZsguwMWpGRjyxcnhSxRzUQ0tyn2bp/324k9LExz1pzr6GqZFeAs+QABoaaaxdt4N5DIcOph/3i1zJAsQui9IcA7I8vfMpG+cm4C8RHDVMy82X9jHOXpiwT2pSHt0oh1oP8uGirSaUO8b3W15YO5d2APnbWWeSiF/DWbz+pwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:45:30 +0000
Received: from PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de]) by PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:45:30 +0000
Message-ID: <d415236f-6fb8-4d1a-a81e-ff7e7441dfcb@amd.com>
Date: Fri, 28 Aug 2026 12:45:24 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20260826064649.292291-1-neal.frager@amd.com>
 <20260826064649.292291-3-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260826064649.292291-3-neal.frager@amd.com>
X-ClientProxiedBy: CPCP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::9)
 To PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6467:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe882df-647d-40bc-29c1-08df04f17a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: pCTLj93hkzqJqzWpoHPpdZCdfciBcn+Jwea3EyEU3U6RIGvIpCk7rK+1j2TEqLK62QfQJY0/EaY1s/1HsN4Fn+ykeoOBoDLJmwlQkvMUuFUdnid+6TaxcgFDDza7wA/5ooynJjmDhuv6iRPtFLCdO1tvZD5fhefC78bKVbONr3624AM9p6GgodeSjmyA0FCzT1ZXvy1QAIz3E+sxh1jL5wsjzz40+vEMvhmituh7P4LJ4QJ2xqJRf/LwG6WnImMpSM9PFAs0xo5G/hAE/hxcxZW/jS0GNWN8mObN6XW+UiGDqjWd/zduu1tZMIxTvfF/bjXn6KHCJxPysEyPJMbO4GPm8KHvWA2K+C13yfL18edOGzWTrVoX+K5xUA7EDimg8ic9yLjyNtym1dCm8SzUl6vk2rss8/YofyVJ0V4ofS5N5klFm3HMB+qgFCoyHo+QIhtxWnq1u60dstKj3zIxsIpAFsOc5sgnCS8XDBNFtqYiwcnLklQvgAOG9pla1f02SlxS+xe0yt4cQoiF71QEiODKsGV7DaCR1o7gTGCPcAzpQRmwmHGzBnTtYmOZTrArC04grtI97YwU8p5u6kTxo4oZrEZFkgq2/HEVM81l7mXL1DaUH5qjJnfHzsWekJms/QTZ6NnWfruCdxT+P9IkHpxCo4QvIuXDbT8Uu8xps8tzJPmTdzQpakQ/4zxPraKFZdo9p1KGfyhoio0Mzi3xUoRRyhcDILqiPfcof6mFMXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6467.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW4yaklmYnV2RDNOUDNBc2xoVm4yNnVRenBxQW16dnlpNnd1T1lXMDZha3Vk?=
 =?utf-8?B?SGdVWDFxdlR4KzhENEd1elNmTDR5aWplNG13cTV2TDZCRHRYemdPYXlkZ1A3?=
 =?utf-8?B?N05yRGtpdWpuR1lvVFBBdk03UTJRUmExYUI2NE9TQVNTQTVDWmViS3BNVG51?=
 =?utf-8?B?bFdDNFhTTkxNTXJyVDFmYkhYbTBwRENQb2JxT3lUTzErZmFDTFZxOFBVaGsy?=
 =?utf-8?B?TkZDd1pXeHdTQzVISksvdjdPbmFFSTQrQ3c2M1hLazBTMy9CdDFpc1NXdU4x?=
 =?utf-8?B?LzI2d0k3SW10N3ZhbS9QWGx6Z0t4UzVHci81NlpxRjVlZmpmcWFFbWhPQ2Ux?=
 =?utf-8?B?K0pFaUl6UGdnY0pxNHpQRllDdWFmTDJod3VDNnlTMzIvVWVPV1NFblkxcXNt?=
 =?utf-8?B?a1dEeC9uWDNGNTlEeENRVjJWdDVBODRITmJCQ0ovZlpWK2o5NktEMEFEOTRJ?=
 =?utf-8?B?YWxJanM2NDdYMFhsMFozVnJRQ0lSaUNNUEVvNklPSXJSc01zRGxQVDBnUWVG?=
 =?utf-8?B?My9DazRBVkdIbnFLNDJJMXo2RjJCV1FxSDVUZ3VqZ1k2ZkM5RXluZkxXaFV2?=
 =?utf-8?B?RytkWXB5RUUyaXUzV3JaMENxWWx0R0Y4RllNbzdPdW4zTVhEWnlWZ3Byakpt?=
 =?utf-8?B?RldvV09SRnZ3WDFKOVNBY3FMekZDTlgxUU5IaTlmZE5CTnJyekFnck5TSEgr?=
 =?utf-8?B?cDh0QnJhQzFldUlOMTZIYkVsaGdpaGQxWEVMa2pPNUhWQmRTdEJVSE9UdzN1?=
 =?utf-8?B?T3BpZHVEdmZkVVNteUQrODNWY2doTzhxSUVqMVJpanlrd1UyMFVyRW9keC9L?=
 =?utf-8?B?ZlJOblNaMEMwWkRoMDN3b3pBLzdTZEx6ZGdueHNmS3RzSTV2WXNBR2RnZ2cr?=
 =?utf-8?B?SDE5MmF6RWo1dUs1anJxR2xYbDlDSWtZUW1Zemh2QWc2MmQyNUN3d3BsZG9l?=
 =?utf-8?B?RGcrQ3FNOU53cWdlUTl1b2x6R2FXVWh4Ym0zbnBUUFpiTHRKWjVyeTZuVVFT?=
 =?utf-8?B?S1hsLzhMZFhBZi9YSVF2Szl0K1VkaWt0TTlkeGpYcXc3STNPTE43aHRTR3BF?=
 =?utf-8?B?djFFb3BmZDEva2szQ3F2SGNlb0pPcFJWQSt1eFVUZG8vcE4wRDlDV3NrZ3Uw?=
 =?utf-8?B?S2dya1JnM2ZOVGpwcXdGZFFjOEZubmFJbG9wWFE0VW9MME1wOGh0dVU1QXVM?=
 =?utf-8?B?d0VKM0NQV01XSFhZcmJaOWRMcEd5UWN4OFM1YkY4Mng2TVNKQ3lNc0VwWnFK?=
 =?utf-8?B?M1BzYm1PR1NaS0V0Y1ZzNlQwZ2N6aFdnT0dRZGFKd2taZ2ltN0pGd2dLMjJv?=
 =?utf-8?B?SzhFVVA4ZjJMTzRETmZLamd0M3B3emRjMk5KVitSMGdZK3NMSFgyaDJUTjVN?=
 =?utf-8?B?SjBlN0QzSFZhb3hNdUlBQ2ZzYTh2VmFwb28zNmdyYStFZ3oxekZPc0Y1Ujhu?=
 =?utf-8?B?TnNxeGEzVURrTTBKTmxJd1krcFNJZTZnai9HSW1jT2QyWUlUZzcrQ21LR0M4?=
 =?utf-8?B?MmJ1SGwvZEwwTU14Y2ZzNjdkb3Z4MjNhUTg1RUJ4UGRoakVUU3FXOFZ3SlJS?=
 =?utf-8?B?QzRkV2poZlYyNHBRdUtvSDlTWnkramE5VGF2c3ZtSUdXN2J6ZG1vNVBkY3Jq?=
 =?utf-8?B?M0cwNjc3cDBOY00wNlUxcFZWSVFUaExxZnA3OUZkbXNsOUJPWnM1OE0wYzZP?=
 =?utf-8?B?a2VpU0VjSVI2cVN1TGJqOFM1VmNGbllRQkEwVzArVWpDTXlRVUU5NjdyQWU5?=
 =?utf-8?B?SmtwV1daOUJsOGxGekljZTB3NFRNblc1bFQyN2JOWWxwSHhhTGIvajZVZUZJ?=
 =?utf-8?B?TFdGKzNxL3dvUGF4c3FmRHlyWnBPMVFwa0g0ZmsxQkNoK2g4YjAxRkZFRytj?=
 =?utf-8?B?UDRPMVFZcWJxT3k4ZXhJNE1XeEFPSlVxb1Z0TkVLeUNIQVlIai9EbTByUXJ2?=
 =?utf-8?B?aUVSZHlMdmhOUU01YVhhblZsMDZhcTczbDNVZVF0RGtFZG1KRTgzaHN4cnY4?=
 =?utf-8?B?S2dzSFVqSUwrL3orWWtXWktCV2pCRE1JR3J3bkkzNCtKdjMzSFZudG1Vcnhl?=
 =?utf-8?B?L0V5aEg4cHpNM0pUdXVWRjRzekZzVUM0cmJQM1N6NzZYU0lJLzkwcVdJZEtN?=
 =?utf-8?B?dC9jU2RCK29QTU8ybWFtcTFVbXBrRzhiZzgxclE4TnMvbyt4ODdCcFYwZGl3?=
 =?utf-8?B?NUhYdXJWT0dyVlZBUHNUb0J2RUQxNGhUTUJXV0xydHcxeUF0YXNOcEgwb1FZ?=
 =?utf-8?B?RlJHWDVwQVFlU0ROOVZVRXJsdzNLQzRVYmlXaGRSRCt3cTZmeU1HUDN0VUhB?=
 =?utf-8?Q?ji1JcRMGQDRpuP0UL7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe882df-647d-40bc-29c1-08df04f17a7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:45:30.1209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br/6Gz0FhgK2LcVUibxZ6RapkEU9OUnqSWXMW9jYbHKJPF+Mp57ToxzhZ0yv47d7clB39WILRJ6FWUX9CpcL1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
Subject: Re: [Buildroot] [PATCH v5 3/4] package/xen: add custom tarball
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
From: Stewart Hildebrand via buildroot <buildroot@buildroot.org>
Reply-To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/26/26 08:46, Neal Frager via buildroot wrote:
> Add support for custom tarballs such as tarballs from vendor Xen trees.
> 
> To test this feature, use the following configs to test latest release of the
> Xilinx Xen vendor tree.
> 
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx-rebase-v4.21_2026.1)/xlnx-rebase-v4.21_2026.1.tar.gz"
> 
> Add to package/xen/xen.hash:
> sha256  03498f51b8daae70c429ace4bde6e2be679b3a0ac28b886c7335c022feef6100  xlnx-rebase-v4.21_2026.1.tar.gz
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
