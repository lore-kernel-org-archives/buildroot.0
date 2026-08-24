Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38F3C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 10:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6753D807E6;
	Mon, 24 Aug 2026 10:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGZT7SfuF6Xx; Mon, 24 Aug 2026 10:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787568128;
	bh=3ySEc4Dw0sMYOMFV3OkYe1PRJBNKLRvchPAgytnTb0w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pdMgQvvh6WrmtOwi6gN9+6YnJ9UqAwwh0/X0uBx6Ti11BQFLh3+r7hogJg2wzVWIN
	 I/Dxf20M0PV4ZwNw1xzQ8yUK1O2tnOwxr5E1YMrwqBHDKgb4XjFGLU72J1FxAYYzMD
	 uFZwHmIVbyd2/Yt+W61iuO0mZs1fTj6U+U9Yj88EFr0nzSqeFPPgGjAY4wm+picjli
	 z+F4mBgRRDYHOHctRXlswS86QekVVqWiytR4Jse3nWNiLMfNYRCopYes7VmJ4zkYGc
	 DK1uLzOtYbSPjxiSNmpfPqB7Y+qom38zALgpASrGVjLa82P0ZTTGYo/S2/3JadteCi
	 Zke7vN2WdGEhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713F480807;
	Mon, 24 Aug 2026 10:42:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C63C279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12ADB80807
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeNyOP_Y3m62 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 10:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B257807E6
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL0Py2skgTW9PENLp1hdAXyysfQLX4kBPK011T4jQOZa9FQ1Kfc9O6jmrlqk0l/f1axwiXrNHHXrPX0d2JcTPQMhqwrqoIfLwu8ViB+YD5kkIjFcThk1WSzFWKtPAE+453dH6dF/PU8Jdr1XMN33TuzKT0smCqzF2pg2D3CJZLF/0V2vQ2WXa7TeARzjnG2wZZrgMgSMRcT3bfgBDdgr/S9qPT/HISLgqMwFLLSQOcTpR7TLZa2BHmLB2G8fuNgy9dvYzHa7BjlhcKeL8emXwVe4K0V4julxkEVd4xinozKhBRndn8ZUYh5VMCU3kfXx5oo2XcHIw7rmpK2xpE+79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkPs0NFSeBuFkmwQpFCNIuS2klK833x8B6vMqnX9fJM=;
 b=hNT1xSQk8FEKAIJCKsTfxnCgapJV9AsgYCduiz0U94hJwTL/AtMBo2U2uwCQWbJazKZk7dNZgt2f1xI/umf/NXi4rrnntUTAMOVBIZNb5aajS5bMu8Yx3fpzwbocpcau4je2obX5X7SpzxdTJ1/ID7hvOQQPfD/iE1Ljbpv35NjIF6mKlEERQSlH00Wn0JQJ880VfPfySeY702V1N+vpeJFsfh8Z2VFVrAMI28mnSiUWo5eKXABK35WB/rYSWZUhBqCOcyjRIqRDqHSb7NMwandN3AuBouU3nAlk9Gj5TojidTE9bGsEmn95IszpWSTVxW7jl6GqbapONfluEKp5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 10:42:01 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 10:42:01 +0000
Message-ID: <85f125d6-df38-4e3d-a503-1b6443b939da@amd.com>
Date: Mon, 24 Aug 2026 12:41:53 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260803145152.102135-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260803145152.102135-1-neal.frager@amd.com>
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To PH7PR12MB6467.namprd12.prod.outlook.com
 (2603:10b6:510:1f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|MN2PR12MB4271:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ee2925-c2b0-4280-90fa-08df01cc53c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: S8HuEOnuaGc4/UHpnmkM4xDAvSuef4Y4nL/2+zlyxEfL9qV2MgEE663oq3WIQPlKtjW5Oj+gabt+YdzrAAzj3zOoYoU/jEOmBqfC9R1/BA3jNWgnjZa4LgsCcUDItEA4CIFv1T0PMMeouioRRHTm7O6Ng0uyLy9VPgON8hoMIGfW4oqckWEBHB74K6ufy6ZmGxQHZWRQLzuSouBz+Fnggxc0Ud/+watUnrHYxrbkUvJZZQhMWp8ErK4EXcyIXe2ici3FchGjsgiTBzcBIrUraRLq9VjaBA6C+kEPUJGdrf8otVzHkck1NLCHXYBF0Pd+xCjLWz+MqhZfjYdfOJDPVfOCWmjw6VdH0vqJ8mjIOxjTf/0V21NqpMBdJSMafLYHIN2paFdcJF8kfNSTv845n9Ojh+FsWNLp0fpUxAoXFaPxGcISLorA0Si4ZHmpMMp2c7S5XtP+2TSmJuegMOPW5NROLDD+GAqwZ49DpmYQzos8OaS3Xebjsg8jFZPM0BDjPJxRnJpkwdzQuSPvzWBx7RlvGm2xB7syfEEZJLY9ZYfNCFmVd5AhCVULAf134+ykmnSz0kDaQ5eYpbOLRiKQltWaFaupX01dDmSX364Zpkk5gnZR2XNntlrTSgZ6cnlOq6uvRWGYcptLvZxkKpI+9EgQGy4PFuUi/7yvxKeG5pkTBO6BgWCx/X/GAfJBUFD29e6Ea5AiqRfK8zn+AvX8dy5FfnuYKwBqT5i4N5B69v8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6472.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlIrRjF5OHdZTXozZWV0RUVpV05TalhpNnBScW83Qi9CbDZRQmdhazBrWjdB?=
 =?utf-8?B?ZUNDcm5IdXk3Qi9DRGNBdDhsNFAybWJJZ1gyZGdPQVQrcURoTmtuMlZ3Z2dL?=
 =?utf-8?B?dEg4SDVHVlJHbXEyUnRRZ0JkVy9ycXduaDJTVGxkSnhjZmxVcnRNZ0d6M3o2?=
 =?utf-8?B?Tlg5K0N1SGNlTVU5VWFOZXdtcDMyQldPRk0vdGFRTmtBaTJqeFdnbmE0SGI1?=
 =?utf-8?B?ZG1tNjdMZW1lZ2lnZ1FONHFCbVk0emg5c1Z2K1NEZ29mZk5DU0NNUWp3L3JN?=
 =?utf-8?B?ZzVlWXFvejYveXp5R2dGN0M4WWk5a3B3YkdyLzY5ZkxRTzkzelQwbE1ZMUha?=
 =?utf-8?B?dFAxRnZQVjljT2w4WTFESU4xT2lMRytvUmtRbmhxc3BHTUptemgvd2V1WE44?=
 =?utf-8?B?Vm5WdWYrRitEcHM1ckR6MFJzNEdtR1VXek8wYVhucjJQZHRYTlovWnRyV2ty?=
 =?utf-8?B?b2loeDlUQTB6UzREQVN3U2d5MjB5UzVnalZRVWZRSzVSREdrYjY0WWNIQytj?=
 =?utf-8?B?SFVPcUFCbEszQ2JCVFhCNnNaTlN1UWI2bTlBZFNSeXZsWFFLRTlNczExSG5F?=
 =?utf-8?B?cWdrQzNFanY0Y201RXRMWERYZ3ZPazNMQ1JTeUd6aDU4aHdET0x1U1FZMVJT?=
 =?utf-8?B?YWFrU1lFWnJTYzJNWmd0bnFUOFBkcm80Qm9Nc3diNFhWVm9sSjV0Q0VtTlJm?=
 =?utf-8?B?UFgwNWdVWXdQNWhMYlFVY1d6WUQ4WkE3WmFHdDBkNVlMc2RpSTg2a1VVVVZI?=
 =?utf-8?B?U2JnMkNTbFVsYzF6b2p6aU9JZEdsUitnNXJibG9hNXZ6dzRER3hKTXJFbFRF?=
 =?utf-8?B?ZHRWSlJ6MTBLeDJOQldUM0k1aWkrb1JCWFlXVWM4T1JYNXFVYUNyNEpjOUcw?=
 =?utf-8?B?eGVGOHZRSVpzc3NhNGpuVmgzT2M0SHlKSk5KbWtXWDMxbitOSGNmd2ZLYTZZ?=
 =?utf-8?B?TUY1L1hka0dVWk9mZSsvR2RvUUJjc2laSW9jd0RmTnlKZkdrK09INTFzZ0Qy?=
 =?utf-8?B?M3crai9RR1pNZGVBemV4QUo1dUFzd2R5K292QkxkRE55YXpWYkNzMHlCQ3E1?=
 =?utf-8?B?MnRXMm1JUFg5ak5yTW9sVGdnZmxybWVqak81cWpNY0Y5ZmRPZ2lLSnVaSWQx?=
 =?utf-8?B?TmIyZmR5WjlmUXdUVlBZSjRJaXlNTlZlZXplZ0VsMzR4VnFBWFdleFZwbnVt?=
 =?utf-8?B?Q01hazMwdzUwc1RhR0VNQkluTy9UbEpBSVRiRnNzUDlMMUMxSndyVlVzSDc0?=
 =?utf-8?B?eXBweXRuZjhmNjMwVjhTWUR5eTJYeG12U0xUOU40cGttSkZiZ3Y2anRCeENW?=
 =?utf-8?B?dDJWM3JLRktBWnhzREIwS3hzVzVYN1E5YmNXbEx4Uk9kM1p3RnYrQU9QVEo2?=
 =?utf-8?B?MHVJUm13SXJNUW1EajBpNGxEVjc2ZVV6UFl0dWo3cXZYMzNpUFRGS0R5bndq?=
 =?utf-8?B?eFdDZkZMZ2VVcHlXR1oxeUp3bDNZVzlUWlRUdHdpblJ2NDFtQ0Jrc1JUMkNE?=
 =?utf-8?B?TFBoNHJNcGpUVHRSUDVnUmtDUzBuVDhJNlk0ZEFHcnEyOGV6YzQ1YlVOdnFC?=
 =?utf-8?B?VXJqYjhGOThqdXVRUE5UcjZCTGJLNnhhcS9tNDE5UW1rY2xCTXZhbUtwTDBy?=
 =?utf-8?B?Y0lKVlZIeDBGRy92NXMxRkZEYlYwbnB1VmtBYmcvOTRSUTlMVDdQcGJKSXRv?=
 =?utf-8?B?NTJsd3hWeEJaY2h6VlllN2hsbzBpeEM4YlJCSUtNR1BZZ0tsTnJkalV5NzFO?=
 =?utf-8?B?NFJrem9aZmIwWTI4KzVPV0REemRsZi9vbzdEU3JrdVBJUmMxTWJCaTZqdi9z?=
 =?utf-8?B?czQ0M1VWWmpmOXJ4UXRnbXdWOUdvM2F5WDhuTWs2NlIwM3NCVEpsSk5LZUlU?=
 =?utf-8?B?QmN4ZXczUURRQlVVeHlCVTRtZmtXZDlVRjdrbEtFSUc4Q0VtT0c3VWRGeG9i?=
 =?utf-8?B?elA5K3E5UE1VeGt1S3RDZmNqZlBNWnc0cjZXWTFPcXpKUzhOSGdoYXcyQXZ0?=
 =?utf-8?B?SVRzRDgxdkNrN3IxcEJzam4zc3c2VHJaZG9sKzlNb2dPZHVSaE1xaGR3Wnp4?=
 =?utf-8?B?K3prYzZpWFVSTmZYdU91TDlsb2VNMnZ6SHBWNWRZYlg0eEJodmpLVHBWVWJp?=
 =?utf-8?B?WDI4amMxK1NObHhLaTVsNjdSSXhoNUcrWEZWTWFjQmRnbzREU01kbmxZMi9z?=
 =?utf-8?B?c0VvL3lBaDVzTXF6NzN3S281U0kwK1c5YUpIM1lvSEIvM0dnS212cUt0REhv?=
 =?utf-8?B?cHJZNEdSRDZUM2hlWGoyZFlxaXNmMkNIZTJ4d2o5ZEZIeThBNEorUU1Dc3BG?=
 =?utf-8?Q?YeWWRckbmF5oxWU8Sx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ee2925-c2b0-4280-90fa-08df01cc53c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 10:42:01.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2ZHI7/MtYLNL2g2Y0ArjyhoWYDtSP7g9w2f8U7KEd3mjl3vV0GDM0UMhMf8B8GrqMFZknbt00ucz7tfom5SzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271
Subject: Re: [Buildroot] [PATCH v4 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/3/26 16:51, Neal Frager wrote:
> The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
> in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
> qemu-xen dependency will not be handled and the patch will fail to apply with
> the following error.
> 
> Fixes: build error below
> Applying 0002-Update-linker-flags.patch using patch:
> patching file tools/Makefile
> Hunk #1 succeeded at 36 (offset -1 lines).
> Hunk #2 succeeded at 185 (offset -8 lines).
> can't find file to patch at input line 76
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
> |index 6bcc83ba..2590904e 100644
> |--- a/tools/qemu-xen/include/hw/xen/xen_native.h
> |+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1
> 
> To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
> 0002-Update-linker-flags.patch so that the part that modifies the qemu-xen
> sources is correctly moved to a patch in the qemu-xen package.
> 
> Move this:
>  #define QEMU_HW_XEN_NATIVE_H
> 
>  #ifdef __XEN_INTERFACE_VERSION__
> -#error In Xen native files, include xen_native.h before other Xen headers
> +#warning In Xen native files, include xen_native.h before other Xen headers
>  #endif
> 
>  /*
> 
> to:
> package/qemu-xen/0001-Update-linker-flags.patch


Can you undefine __XEN_INTERFACE_VERSION__, and drop the xen_native.h hunk
altogether?

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123b7..bddfdbba38a6 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -40,7 +40,8 @@ XEN_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	HOST_EXTRACFLAGS="-Wno-error" \
 	XEN_HAS_CHECKPOLICY=n \
-	$(TARGET_CONFIGURE_OPTS)
+	$(TARGET_CONFIGURE_OPTS) \
+	EXTRA_CFLAGS_QEMU_XEN="-U__XEN_INTERFACE_VERSION__"
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
