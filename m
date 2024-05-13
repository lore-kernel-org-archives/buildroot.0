Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DEDC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 18:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF746084A;
	Mon, 13 May 2024 18:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfeHSbi-t4Sd; Mon, 13 May 2024 18:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E9860665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E9860665;
	Mon, 13 May 2024 18:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A99DB1BF2EB
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 18:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A395D6082C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 18:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUy69W9_b6jU for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 18:19:08 +0000 (UTC)
X-Greylist: delayed 943 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 May 2024 18:19:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EEF760653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEF760653
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::708;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0708.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::708])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EEF760653
 for <buildroot@buildroot.org>; Mon, 13 May 2024 18:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OPn+KklzaLCpTuprChdt8c7GjFW3zQKAIEm9ds6RlqSKNnHwqy1SI3G7W7QLxgh57xN1eQZT/f/bC4IDXvYqsOxlm01xZzz9EjocbyGqCNyYP2cPJtCymxAvEyFxy6AuEEjBFYoiNWmDxSMSMHnusERheMJtWTYnQwnsjpkbs2VieZdUgA798B2TIYOb3Plqv3IqNpLNtIH7Enz/a137kvlhq6ThszP1HsSMcmmk1j0uhHLRT7x3xc4dbpFmH4/urQtRP56dOuf/doOZgplh38IVehv7D26c9NyrXR1IGnR317cGe0KNC5exP/POhx5R6+SH0q2FaRNAtXlplVlgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noqUAPj2TgS00dsjGLO+sqfHaewpsu92d0HabNoQz/c=;
 b=mCbd+xEtoSJ5O+qMucXJI9OVtj9JLmjleIJ+ro/9v8dudib/pmJt5ypB/03+1gK6bRhq107vr1yHtrdaoG+q7HzH/iuJtg8+akuWBzBnhFwKKClPw4/MfNLB+wHY9YJHCo0uMEWVJhypWuB+D39irGmxQMOUIhKZrNsRK6twRtc7PNYTUo9NE6hFOep+GhWUh5fKHnJ6ZL4t3p9i/V9x6nfgChczHrLUOBcpcMdXVQYUp4RK9adf1TIdaFDvk6awd2Qd+48Ue0P4/WP1juqBNL5ICF8b24eHyfQn4boxvQAISpIuS27o1ZDy8NK3xkDABvzX5i04uPQ1HdiZewCsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1650.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:03:18 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::3824:5e24:4474:45b7]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::3824:5e24:4474:45b7%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:03:18 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Nick Whitlock <nick.whitlock@eizo.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump
 version to 550.78
Thread-Index: AQHapU6tpiwT0hNY2kWJmLMA+6f/L7GVcfpA
Date: Mon, 13 May 2024 18:03:18 +0000
Message-ID: <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
In-Reply-To: <20240513155907.104270-1-nick.whitlock@eizo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1650:EE_
x-ms-office365-filtering-correlation-id: d88ecc1c-b376-4e7d-a7ee-08dc7376f7dc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|41320700004|366007|1800799015|38070700009|41080700001|15866825006;
x-microsoft-antispam-message-info: =?us-ascii?Q?rcho0nC1X8jlpV8TwgzfnZ9hl/jPPp3nvhyfBiC6zN7FFRK5Y2T33tABZ5uI?=
 =?us-ascii?Q?Gl6DoH9nb7LnMhxxx5fQEagiTPAFgjAyzZtLoJtLIcK6hxZyZtVfWm9huiYz?=
 =?us-ascii?Q?pTntM3H/pf6ROjJHTEzPLI+1p9IzDyj+ixKYzgBt5Dk5jAE4eAq7DrlQrdBO?=
 =?us-ascii?Q?bNsmfBx6oC/x40l2Mv9MMnbeyHl21harG5rfl7I9s6+3jYNGF9+AjvAK/lJs?=
 =?us-ascii?Q?Y/zwygwGnMycXnwNwUnDQGYOgD1jtF84xoBfL+nMeQJiapVWgwQZ9fsgAMdF?=
 =?us-ascii?Q?xGZ1nHOhgnFALt1rbYlYP2Xrl3TUQiMKSH6sLwqr2JZQYtSBK9hMLWxgFBAd?=
 =?us-ascii?Q?kooyLC7T+9dgPWaDn0hdYAYoZ7MTxfCDrU4a6Cd/fCI8v+1bq/Iwgt6etrUA?=
 =?us-ascii?Q?PJQDq/O6LjJtZ7LxY43Mk87Ea1UMP684Z961y6dd26hzSWQiZd57Yg17mbk5?=
 =?us-ascii?Q?7WThMZgghp0cOtbziK/1vLgL5ii2JD/33vDoJvyu/0jnvTb8iz6O2l6WhUmN?=
 =?us-ascii?Q?BS/EVjDeB8Bl9q9JhLFhkAxTN29616EonjmPS8sUvwy/fxhPF5I9Z/7384Lq?=
 =?us-ascii?Q?hhwpZfvAle4KP9E5KdlLcKckGkWX3gJxczg+sZTOSah6yXb8BlswSoO3L5Km?=
 =?us-ascii?Q?vpuNkXaXnFRmliOoxjcvFjjRdt5+qDaXnN3cyonn3H+F+Fl8FJ4QvDQzVzm4?=
 =?us-ascii?Q?4AhLjY/zZjoaiBEtFDvwSg419n1Nng7s2a01otkIabAddc7iB7fNTSHpYY++?=
 =?us-ascii?Q?MPg4lcS39qswzeCOgwzA8j7KQyVOHI5b8zvWmBpdx29iUsJrXvBx/uyqJzaw?=
 =?us-ascii?Q?QAP21fr3Cam0XRzQU5zpGHPR5ksapmC688cNu5h2CpYTgKpWyRcu4oRUc68l?=
 =?us-ascii?Q?3Y2X16b6YOkl8VFe7uXfO6B3ZgFwAYqPpTHmAANMKZFBazqtw0XG0L0p6OQd?=
 =?us-ascii?Q?RI8RL54gNrShDDMamOWGDwNsXUwu86q7cRxFrmwlcIq2gc7KIK3GLSHoa/kE?=
 =?us-ascii?Q?bFe65H/a0zb5IWS8OxViS7ZtZeKatPtoj7wamYF5hs0jxa3b+TivYaDgEp7m?=
 =?us-ascii?Q?AwSH+Ojj8epReMMMo+yaOLt7W7oriSps3tYExNG9r6n/RHQ/4LSF1cfxfrUN?=
 =?us-ascii?Q?cEhjouIKeF4Q+yon6jLP3tFDf/vzbmw/FHjnyRvc6w5EsBv4XctlmFyG7VAY?=
 =?us-ascii?Q?FNeh8vrWCLNJ5oCKBpKRGhPemqitIza3XAvxXF9XSkY6Sf3xc7GdWeZ5sLdQ?=
 =?us-ascii?Q?+Uyv3Opec0DcTmVi8AmmWUpGlZ3d1bO09uBeGZhOXHOMJNXPbCJSMc6Mrhiu?=
 =?us-ascii?Q?B0D4kP1RzYelnig87RC//LN2ZIi9KnPOccpvyd3j98fzQQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(41320700004)(366007)(1800799015)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k3276E8cywrAtXCFLr7MiQMGjQqVouqKrRdRa6welbDQlnKw+qVifZ57e44b?=
 =?us-ascii?Q?UVzx531Qyzdrq1PBvBuGUA6erJ5W4Gd0HhOTaN4QElNxX97M1yeTvoeZ6Xw0?=
 =?us-ascii?Q?z8mqDRq7X4vm1vQqnaWH/PSHuSp95woAeZ6LcCeHf2Rt57QPqeQW7RagD5MY?=
 =?us-ascii?Q?PMNqtvzza6lCG1HOXfMJpcnpS01GksJphwhDqFO+Qnq4bTTiCWUnryEygWcq?=
 =?us-ascii?Q?1mAGVHf1Gpsre/d/RuavKiYWgn29YvYcE0/bErnZDFEm7V35SRthvkKrxJQ4?=
 =?us-ascii?Q?cwXW31s/LnpQsVH4p/V54hy/ioCoF41kGNUxf1l2U8iN1OX/iXz6cZH0rr9b?=
 =?us-ascii?Q?fPFTpJE3TM82v8uJk3uQksTJXk7TwmwGRiizecbj7Qozj98H/aivQSdf52GG?=
 =?us-ascii?Q?SRflnxtnVlSNpSRStR+b5JzWeCD6Ue3jwUAj3DWXQRYWQHUCSLiUQrfDF3Ry?=
 =?us-ascii?Q?wyqABXbv9Hdw6VF9LCE5iDL79EdhOF0OpmfDXHVYw4ERhiDOYsWz6bQgtayi?=
 =?us-ascii?Q?Qw642GYHjE2XLVroGkA0aMg63SZa5i8KT6nU5jLnWrOoucF3nE0Xx2he0RiZ?=
 =?us-ascii?Q?lCa5/lTgPtWBXI+x1zbvOA2d39lzpshk/KO+drZY17hrnrXqKmH6E7R2AKtc?=
 =?us-ascii?Q?ckHsorJKsIsz3Pxq5oHeNiLWg1k2RQwUKFW2kjfO3IWqXdIpPDbiW1THs9b3?=
 =?us-ascii?Q?Yk15rRdaR+co8IuiJ1+zqzUUMFTzxrBVviz+dUeK2RVDRVWC30h0DkiqUwsX?=
 =?us-ascii?Q?Odq5w+RPdoXnrKpmW7BPHL8ysECY1mSAq3NxJrmwNwxpDOow8T/vwqWZastQ?=
 =?us-ascii?Q?dcdDC3xD9DImVcH2tRIxBGiFurn8KBFENI0mPw6YWLSe+Uon4gq1Pzb4ganr?=
 =?us-ascii?Q?oOIfVywEGNZUrh0kSwVbEVZobdKLMOEidnE61sKbF3WgiW0ajjkr4WqN9LTa?=
 =?us-ascii?Q?rwtCbox13DsEv0VmWuVocchWs3BEFDdalCxwveLqWfsZRwBmfuNYkkZInIxX?=
 =?us-ascii?Q?1AtSqZWeYD6CGUUKMsMGkurdl/q21cwOoz34BK2PN4weY3HaKod4/51sj2ly?=
 =?us-ascii?Q?1dJ9zdQGIX+KYeuihMqcrNQZNCAVO53Ov+b/iWj2BrXzhvBILY0g1hdWAT8w?=
 =?us-ascii?Q?5Wo8eHdY+4FVadoK9/sBNTPy4XGhDQwSAlJIfRc378zdSFoOWOG+Efk7bBOF?=
 =?us-ascii?Q?QMEjac65KZ8PXRJMG9BssOgGsCqc8E0XeC+f3kdsa0XMfCZDaYgPUKZEDX0G?=
 =?us-ascii?Q?zxIbweC5M6giJ+cUIILk9wh0oBjFvqHChdtrcPH+iWQLT0diuXUcYcTLwYvb?=
 =?us-ascii?Q?GxBeyFArKi1PIiUhkYJv/YM1+/CVmkB5BYy+Ps2zK3SzapgD+yjps8lzWlw4?=
 =?us-ascii?Q?j3iw4eCNvwhrHe99eXjw8n5c3GnHezggfDXcKXB4ycqSu2hJcf1/NkWfLKg4?=
 =?us-ascii?Q?EnlP3WS3WlU48+MpT5DHvNNHXa+eh6Bz4IZpfHYUxbffCvj3djZdmWHS615O?=
 =?us-ascii?Q?luYzb9kPSQi8OeM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d88ecc1c-b376-4e7d-a7ee-08dc7376f7dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 18:03:18.1451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1650
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noqUAPj2TgS00dsjGLO+sqfHaewpsu92d0HabNoQz/c=;
 b=4bFceccUDq+WbzpdaRwMFPZ/F4UB4Uk0Qfu1aaKyJr79/jI1k3isvWHnULRnXTZLK0JE8jGBYWoz9Bj+423d/0DRycleI/4sb1/FZ8zGfiCQ1QsPSJYXyJXQVJuyh2CMdR41BPYJkvHsYxNhCjs81ZegTLcHmlWip+wQqVw3/Jt65b3B7aa6o+cvipLcoWDKwizqRr/NJc44zNlQdha5YOEgMovSapfLO3HBhmqo7HIiZsIM3ICWfVROVhJFeaodFa8FcAFoMJuhfN/ddB1IUO6j2XpOJTos6RFiIjzEd6616O/OwIsU8RM4+VUIEvoRRJ62QwzLQ3xqNnPnwWXw1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=4bFceccU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nick, All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Nick
> Whitlock
> Sent: Monday, May 13, 2024 10:59 AM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Nick Whitlock
> <nick.whitlock@eizo.com>
> Subject: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump version
> to 550.78
> 
> The NVIDIA drivers now have 64-bit and 32-bit versions bundled
> into one .run file.
> 

I believe this was always the case. See the /32 folder in the x86_64 run files for 390.x

> A configuration value was also added to check if the user wants
> to install GTK integration for the NVIDIA driver.
> 
> The legacy version of libGL.so was removed in favor of the
> vendor neutral version.
> 
> This has been confirmed to work on kernel 6.1.4.
> 
> Signed-off-by: Nick Whitlock <nick.whitlock@eizo.com>
> ---
>  package/nvidia-driver/Config.in          |  3 ++
>  package/nvidia-driver/nvidia-driver.hash |  7 ++-
>  package/nvidia-driver/nvidia-driver.mk   | 69 +++++++++++++-----------
>  3 files changed, 43 insertions(+), 36 deletions(-)
> 
> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> index a8617a939b..0fcce93e28 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -90,4 +90,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
>           provides Unified Memory access to the GPU and CPU memories for
>           CUDA programs.
> 
> +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> +       bool "nvidia GTK acceleration"
> +
>  endif # BR2_PACKAGE_NVIDIA_DRIVER
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
> driver/nvidia-driver.hash
> index 620112e6c8..06e3314d53 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,3 @@
> -# Locally computed
> -sha256
> 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677
> db  NVIDIA-Linux-x86-390.151.run
> -sha256
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c4
> 7c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
> -sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997
> 526  LICENSE
> +# Locally computed:
> +sha256
> 34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf7
> 3  NVIDIA-Linux-x86_64-550.78.run
> +sha256
> 5ac626496a6388d37cdd53e0300525267a4b8c89fb5980da060783afd561faf
> 7  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-
> driver/nvidia-driver.mk
> index f1217b00aa..9ea97a2a9f 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,10 +4,9 @@
>  #
> 
> ############################################################
> ####################
> 
> -NVIDIA_DRIVER_VERSION = 390.151
> -NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> -NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> -NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run

I think we did this so that 32bit builds didn't need to: 
1) fetch the 64bit bundle
2) handle the /32 subdirectory based on the target bitness

If we used the installer's native logic, IIRC, it would install both 32bit and 64bit libraries, hence we stage the files and copy out what we need.

> +NVIDIA_DRIVER_VERSION = 550.78

We had some discussions about a bump a year or two ago and there was never any real consensus about what we should do.

The challenge, I think, is that the 5xx series drops support for some common NVIDIA products that may be more likely be used in embedded environments (like some of the Wolf GPU products).

https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/

At the time, we discussed having different selectable, but mutually exclusive, driver versions so that users could choose the version that provided support for their GPU.

I had intended to do this but never found the time. I was also rewriting the installer to be manifest based but that too stalled due to lack of time.

> +NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86_64/$(NVIDIA_DRIVER_VERSION)
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86_64-
> $(NVIDIA_DRIVER_VERSION).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License
>  NVIDIA_DRIVER_LICENSE_FILES = LICENSE
>  NVIDIA_DRIVER_REDISTRIBUTE = NO
> @@ -23,30 +22,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
>  NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext
>  NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
> 
> -# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
> -# has been replaced with libGL.so.1.0.0. Installing both is technically
> -# possible, but great care must be taken to ensure they do not conflict,
> -# so that EGL still works. The legacy library exposes an NVidia-specific
> -# API, so it should not be needed, except for legacy, binary-only
> -# applications (in other words: we don't care).
> -#
> -# libGL.so.1.0.0 is the new vendor-neutral library, aimed at replacing
> -# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The latter contains
> -# NVidia extensions (which is deemed bad now), while the former follows
> -# the newly-introduced vendor-neutral "dispatching" API/ABI:
> -#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-
> opengl-abi-proposal.txt
> -# However, this is not very useful to us, as we don't support multiple
> -# GL providers at the same time on the system, which this proposal is
> -# aimed at supporting.
> -#
> -# So we only install the legacy library for now.
>  NVIDIA_DRIVER_LIBS_GL = \
>         libGLX.so.0 \
> -       libGL.so.$(NVIDIA_DRIVER_VERSION) \
> +       libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
> +       libGL.so.1.7.0 \
>         libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_EGL = \
>         libEGL.so.1.1.0 \
> +       libEGL.so.$(NVIDIA_DRIVER_VERSION) \
>         libGLdispatch.so.0 \
>         libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
> @@ -57,13 +41,18 @@ NVIDIA_DRIVER_LIBS_GLES = \
>         libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_MISC = \
> +       libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-api.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-egl-wayland.so.1.0.2 \
> +       libnvidia-egl-gbm.so.1.1.1 \
> +       libnvidia-egl-wayland.so.1.1.13 \
> +       libnvidia-wayland-client.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
> -       tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
> -       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
> -       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-glvkspirv.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-rtcore.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS += \
>         $(NVIDIA_DRIVER_LIBS_GL) \
> @@ -87,13 +76,26 @@ endef
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> +       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvoptix.so.$(NVIDIA_DRIVER_VERSION)
> +endif
> +
> +# Include GTK libraries (if required)
> +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_GTK),y)
> +NVIDIA_DRIVER_LIBS += \
> +       libnvidia-gtk2.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gtk3.so.$(NVIDIA_DRIVER_VERSION)
>  endif
> 
>  # We refer to the destination path; the origin file has no directory
> component
>  NVIDIA_DRIVER_LIBS += \
>         nvidia_drv.so:xorg/modules/drivers/ \
> +       libnvidia-pkcs11.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-pkcs11-openssl3.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>         libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
> 
>  # libglx needs a symlink according to the driver README. It has no SONAME
> @@ -107,11 +109,13 @@ endif # X drivers
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
>  NVIDIA_DRIVER_LIBS += \
>         libcuda.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
> +       libcudadebugger.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gpucomp.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-nvvm.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
> +       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION)
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
>  NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server
>  endif
> @@ -152,8 +156,9 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE ==
> y
>  # virtually everywhere, and it is fine enough to provide useful options.
>  # Except it can't extract into an existing (even empty) directory.
>  define NVIDIA_DRIVER_EXTRACT_CMDS
> -       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only --target \
> -               $(@D)/tmp-extract
> +       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only \
> +               $(if $(BR2_x86_64),--no-install-compat32-libs) \
> +               --target $(@D)/tmp-extract
>         chmod u+w -R $(@D)
>         mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
>         rm -rf $(@D)/tmp-extract
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
