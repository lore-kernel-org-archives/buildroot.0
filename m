Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80630D10399
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 15:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED73281992;
	Fri, 25 Oct 2024 15:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTdEQBXBN3Qm; Fri, 25 Oct 2024 15:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E76819B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E76819B4;
	Fri, 25 Oct 2024 15:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D63281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 15:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3397E607DB
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 15:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IugRyrD1pJ0 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 15:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61d;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16BDA6078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BDA6078A
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16BDA6078A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 15:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZID8yT/qqEiGkA8V2XzunE3e6gBJsAQE19bcnUZKXl+dZrqQ3ON6Eyj29W1E1Q1aBnQnZDPTm+sSx8xgbUVM1WHk1M/oPXFbLm19lAjPOiYnivQt7oYWOMuKEPZjsUipXMNK6lDKroMUVme1N3xdCw8QOXwsi1uhqs6HMmlBb6foBj0jnp/T9FLapOMVbU0lhv7TGNRbZOvuu/TuhlXV5j4JR+GLPIm7pDo6JLRZhA02zh+ZjfTrIBYKYbpTPJdvQ+oFQ9xPa3fKLjxo7O849+ARU6tal2XL4KijJvmJ7iwg9cTzfEH3Qw0/YaKGL6bDCMd8mM6kdq97IRyHiL7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS7rthiNrN348XojNMjVdYkt55vsVY4RL8VQDtSnv6M=;
 b=XZVLyTLDW9dLhgPfTyzSsg6JXtjRMfpUqruJXIpJbEwoYxVtyWQzbsl0DHf2ihwUvyqkiKW1wID7hBWZlRCGgEhFrj1TX+jQHJwxfaMHCz9F56IQBdwNJvg1OP5crpq6xWrzKlm9QTRv0Ww3gIzjdT3l2XQ3h3Qs+eQmSddDJJZB4qJiT3VhcgYW2S+Tswq3E9VSpiBeGU3tDkRJ8NPK4+kgaZ1QJ6f/u9DGw5U+GlFEohRcSadkdGF6UQs+tLRa8zrvbhIprMMdQ/vNfCgbsbaRy5AASQfwiCvje93tr9y1sxdYTT/7CJgjs6IlZQbI3z0BURhMbZFItLnmujRIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB5007.namprd12.prod.outlook.com (2603:10b6:5:20d::18)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 15:58:20 +0000
Received: from DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::8ff0:83b8:9d31:e8bc]) by DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::8ff0:83b8:9d31:e8bc%7]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:58:20 +0000
To: Peter Korsgaard <peter@korsgaard.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH-2024.02.x] package/bootgen: add patch to fix crash with
 -verify
Thread-Index: AQHbJUzOsoUyq40ffki/gwMuEGXoYbKXooHg
Date: Fri, 25 Oct 2024 15:58:20 +0000
Message-ID: <DM6PR12MB500711AA056607D67C2593B4F04F2@DM6PR12MB5007.namprd12.prod.outlook.com>
References: <20241023130912.966121-1-peter@korsgaard.com>
In-Reply-To: <20241023130912.966121-1-peter@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5007:EE_|SA3PR12MB7922:EE_
x-ms-office365-filtering-correlation-id: 2d4f453f-b60a-4244-3a4d-08dcf50dd8db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?y4zU0fcL9+TJnQci1kVuTFhbLNYMvQIU9oHmfTHYyyaZKBq5qwlMo9k+Ywmk?=
 =?us-ascii?Q?p3PuFqlxFZ9ch9oD47tPERF5uYqEHRBXvti+rWauYv4QH8OJjmDoL+A1DvTG?=
 =?us-ascii?Q?/oLtJd2qDgNknfB0XHOiCWE0zAq1n9TEp27MryybOc2QZcKNvYIyOv7oP7ej?=
 =?us-ascii?Q?8NabX9pl77CVYMvcMGuGhlBfyL1s0yhHAauIfDIG3AHfZIbt23WmKlj2pOhF?=
 =?us-ascii?Q?mInC1KaHq05FTMMh33usk5lQ8MzrwtxFEMgrxDUB0Lt5T+VNYT3IQIoO3Mp2?=
 =?us-ascii?Q?ojIvMa5Yx3Pdwa2neQimLYHwCuLMw21RM3GIY0fvhtuwWjmbtCItOmptiBbD?=
 =?us-ascii?Q?34McdMMaRLep9MaDrbRy0EzonA8kloymwzAqFkOWUhKYOt8QSH1zTfJjo/lg?=
 =?us-ascii?Q?KSRUY/mBUQbxfOI52K+bSa1Zn2JTNZPnYchzcpHoG9bnbX0X2friSGRulbqt?=
 =?us-ascii?Q?/xx3pnujXJDAu76WlSQirShptHz+Yo+jjQYaZXsequOc7rjTgnzXWxYQFhuy?=
 =?us-ascii?Q?F9wp9ZMCx/goHayeg8WASASGCv6XV6HVW7mFJZxHGThD3o2/yKE+3WBeUPra?=
 =?us-ascii?Q?KNDrvYVZyKUdJZJDBhtLg0sVKuv9y6IhYPeiHuyv9/Sn2Z/s4bjveW+36adX?=
 =?us-ascii?Q?g5WQsb3fQk1+G6Lf6NEN659ccqjWGwBfNZlv5eG1cAmZ2fCeF2rRGXxTZCkv?=
 =?us-ascii?Q?cMzaiW2T73xayq9djyH3KI+VmRQAruJnHkHI2u2Wx3/c9+KxrT+GG9Vf9X+e?=
 =?us-ascii?Q?cwvJnRJelWREISx2jX5RI9Ao5pLgGxLqiDtJl9R80Q5jCXPiyVZjgpLhwrl5?=
 =?us-ascii?Q?FnmPVRYMnkE4myI7OpY7R3u4g7sPqGsyem6rAS6k0lj033dZRHC5IKD+LaXH?=
 =?us-ascii?Q?mNijll7XVtWBtK1GG9gX/acdaNS8O69ebBHe5KCq3IL3TgwjXnFEe/CxPQD3?=
 =?us-ascii?Q?wdybJ51oR9b15JBfZvmgpvCLaXqJdba6eR5Nr/9nKDPuEIhacgbd2Tx+X4NC?=
 =?us-ascii?Q?k8tWJYNs37K+0JT3/WQtU53J+fiuh899wbIOaRx5LXj2zaCF+W/raZddYSJ7?=
 =?us-ascii?Q?Yar2kdlkVm1abrCUujJoPbFKyaeJE+afDdxrnuUkknuswMkeL4mLyGIpPHxK?=
 =?us-ascii?Q?VGGOWvA9tXs3c5kQoMSaMz69zvcQ4KefTRtGGeRwhqYcKHhZzS59RBMYs4yY?=
 =?us-ascii?Q?gERifSQchmNHSMEkad1ceLfE1Ul4kvJNeHsaIvJYn3urfEffnElvIQ72TQ8a?=
 =?us-ascii?Q?71YXV5E2spppAaomKH20JcUKeeAQzLosRvIBP7HIlvZ3gs7q//xW4NCpw2yn?=
 =?us-ascii?Q?BpjQIXYB3vVWZR6GTAg9Hucy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MdC52siET0TYr2vVw++N2XjTd9sE0jIGVckveN2BKxk+WjZewp5Vh1xrTFO0?=
 =?us-ascii?Q?8EEaYA0S2u/KeARrqYbuNtx8LD++mYdwhoXKSqB9oY/E/a+qg+kAAvYaVwtC?=
 =?us-ascii?Q?2bPugXMKupzWnBoNbU7JyiaknE+c+OMlaXeeEsAd0QtkQextC+MIzlb3vxUi?=
 =?us-ascii?Q?7P8Fg4ZLwydx3qUoAxxqI0X1+FBOuSdZctQdJZBXkGr0H2JR9BPc4wP70ldo?=
 =?us-ascii?Q?lzmnxdoQ8uo1x/4m6CN1AlWNi8nMrrKe/H3oEg1tXj/6idw4hWnAY5rTNZO+?=
 =?us-ascii?Q?TUq/rJRa3HYzQ5lJ2URDmc4BFsfkstX3ka8BWCLcgWsgXOqxXtNOMmXFl+rI?=
 =?us-ascii?Q?b3rdgW0uZrX/bFGX5pK5jjA12muTX+jj/S6c2+rXrrRE5uXi+bRD4Lm3F11r?=
 =?us-ascii?Q?xKdF0e7x6+b4CQIG8YH+PMieTs43lrB/qvYUoqcmZYKk64a7FfhWxHFwzhPm?=
 =?us-ascii?Q?cRJctsD3iTeldkwxr0TldAqU+T53j9Kl3yHucKRmkThVAgTlMwdi7+4D8kxg?=
 =?us-ascii?Q?ygOKDcUeqcFfIgIe7VXa3CCO2peLfsJ1n7JNa5Ax2MxNH99IDxFseOmZResu?=
 =?us-ascii?Q?tNLSUS73TWDvxUPBKssRLPCdS5UerRmOW9t0Cb//YRuQ7kQ6wS4sEZFxCG/9?=
 =?us-ascii?Q?oSbLwJCkzaEGXGmQXoAPAd/X2yLVljrMwMRpYtvnzpNf27HIZA+S73bQ/zpw?=
 =?us-ascii?Q?Nbe2qk/keOG3PmWqWD4n5pY+owrzi+3VoIOotRsWrv+kLVXrJwy9gNWsVtJu?=
 =?us-ascii?Q?wKKCtR95gjyqf+SIefBBIvzxcseW93hQJGgj/HkD/7rQkXLghUhI7tXNufpz?=
 =?us-ascii?Q?KaJMWdc1bOSvE8cNG9hjCbvyCfckJh/Zn4kYRnLXUIOmhCaSSRrA1i4lofPY?=
 =?us-ascii?Q?oPezJ1Y7LS82xzn6bw6lXnLnyLKtP7blgq3IlV32heW9nhoU5EcPiJU7e5zF?=
 =?us-ascii?Q?OruFV9KhvY0eTjm0V1esdhh4HP3P6osX96qG3xNklSxgzWbFYeHTTetdrlTf?=
 =?us-ascii?Q?NF9tzwQkbe0Dc0fOJ8ngc9b7xYUcqoaKVEeG0kUw7g4q1aSR4bo6VRP4xSez?=
 =?us-ascii?Q?GqvCslqcuhOO7WmZB/+2/smOtindVCZdQ2NdlxNdz+qsx2hJ5tNAhv+KHlji?=
 =?us-ascii?Q?YB+zM8mPX4XEVjiIgh4gHJchecZvE4eQKBSmUehwzXvjP1tNKendwYevgbNZ?=
 =?us-ascii?Q?bVYfWWOJxGIoP94jp+RLInXP5ywb6T/w8kBhKW1JILJYi01JdACzn9VMtW/U?=
 =?us-ascii?Q?sYQl7h1jpYc8NCAnxLPQtDGUfaIbhvAfuu6TNsG/oXcAGBfvc4hJ4EbDneoe?=
 =?us-ascii?Q?+mAqezPzIRlBN8VDhEq2voqhnGUdlATVPtKSzmCay6QpvVgNxm84HR17hW5A?=
 =?us-ascii?Q?TyfDigW8pOnDRxZgK04lnT63/jchoLTmPkAGZpZVYEqHtyFJNnSbxJ2dAAcM?=
 =?us-ascii?Q?3N/nJcnrEIHtM7ISZaLgoidMQske8e0F6nuXdCRaVeN0m5OyH7my9L+SY8eB?=
 =?us-ascii?Q?Dyuq+uPG4Uwn3ANvFC0xigaFiOLVqacVUyWDGJOpGjtEcMLqSHXn4ggdoRoM?=
 =?us-ascii?Q?4LnD04syk0BRRYTzxHk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4f453f-b60a-4244-3a4d-08dcf50dd8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 15:58:20.0591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7eQoAbGPJU21Xsel8AJ6TcaZxABJ/aStvRRO7bWNb6FICMdt5gN+9baR9maI6QMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS7rthiNrN348XojNMjVdYkt55vsVY4RL8VQDtSnv6M=;
 b=NERF/hhv4e+XgHYaNzvr9Pl9kKaetLJHJ9XUjr2efBH5UzDvrdJsU5OLOxKqCYnH59ZUAXaZ52+W8FtSvYtBUO2JmigDZteONMzYmr0JW3+yF9oyy5DQsyfghRc2XTtNQCqtyfyfxsc47A1i6LfIBa/C6QGtP0WuTJ6PwhICiYY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NERF/hhv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH-2024.02.x] package/bootgen: add patch to fix
 crash with -verify
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

Hi Peter

> The 2023.2 version forgets to populate the iHT structure before accessing
> it, leading to a segfault. Add a patch submitted upstream to fix that.

> Notice that this is fixed in the 2024.1 version as there ReadBinaryFile()
> now calls ReadHeaderTableDetails():

> https://github.com/Xilinx/bootgen/commit/3a0f879c611d67072aad3461f1c72d1a284cd5fc#diff-404aa20e03f1035b725ac1ea6e64c28477bb65c1663da67f64ffdb1a60552cee

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Excellent job identifying this issue!

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
