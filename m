Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89971C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 06:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E769E84113;
	Fri, 15 Apr 2022 06:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIOQEWhYFFnw; Fri, 15 Apr 2022 06:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE36B840FE;
	Fri, 15 Apr 2022 06:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9AEB1BF855
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 06:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B3F405C5
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 06:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbBe2a2ErnHO for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 06:52:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6141404D5
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 06:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fX/LYtivrUBbdVIbgrZicnJE0AVCQ/LHSjKpY2Vaa8gUziFkmWS4T+dQG156TrvjaHwLO/xWpZEuylz4Cpb4ILJnMhilrwNXitU4WeIpE3ZH72eMzRdE00HWIKW2o8BoVPBVyD6stDcteQOuyWE7qeU41IyzhmeDomnw5l6Vinhfx468sJgdOfQ7/1vgqWxZKXzfVZUFelqTpFKOyiK+kIAxomSnmdELa4XonaEDLpU4wgPKavmgLoouvPdFmhqkgRWAzahMvl9XR0+FQ9G5y6EI2MIjmKFwzBcWA29pr7YhYn47dve44w5izj1WvUnZaat70vXVBK0VAwvjR/5ThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86Gcgw0s56xnJs8sLXYruoV7GQMOzOcGLxehUt0qtC4=;
 b=nHG5JFZ0cwq9Tk5cyOgDdJDnKdFezut78MzXTJGI4phuPAhO2s4//M0CEFZLvomPU/tbqz5BiOirrXM2YrXonhyi2cwVsvSW06VaCUuWRvXdtu7V+q9g3VWwYx6X4sL+yhaqoH1/L0lNxoimrtZzGysn1qcxX2yes89+TnLmUKQaFL136Ey8l16MffypU2Ft7OCMmsCvHRiZ852FD6+RhIfFNfm5zZaX/yHoi4OgBQvItlmMqpXReI/GqnNEwNhONmPf5asnrKYRkhHF8IHZhmhWaQDGhiBXYCfUMlQ17ubOluSyXxdAVcqxNQbnVIA1Vp6uj0wL/Hm2u7d6ljXlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Gcgw0s56xnJs8sLXYruoV7GQMOzOcGLxehUt0qtC4=;
 b=I3CzoyP4IyN4hAtLAyzzC2te3Y0amttapEZBMW5bHHkyn+9/YcyfLqYqV5gDxJyuJhiwUa9UaSjClIehT5RrgVdsNetwm/ysLNnX19GRD4Vi8/VWdPRmMOfB1Z/37tvVemOzJ5u/fZNonxfJ4X/oPClTJjobKdul4R7dS08a/vs=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB4135.namprd02.prod.outlook.com (2603:10b6:a03::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Fri, 15 Apr 2022 06:52:34 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 06:52:34 +0000
From: Neal Frager <nealf@xilinx.com>
To: Arnout Vandecappelle <arnout@mind.be>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to
 Xilinx 2021.2
Thread-Index: AQHYS1jCIBhUrJ2T10y2XXcoR/MRfqzv3CmAgAC2VaA=
Date: Fri, 15 Apr 2022 06:52:34 +0000
Message-ID: <SJ0PR02MB7758E25006ADC3AAA0346C73D7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
In-Reply-To: <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa7afca3-09a7-4127-7f89-08da1eac855f
x-ms-traffictypediagnostic: BYAPR02MB4135:EE_
x-microsoft-antispam-prvs: <BYAPR02MB41359784F5B89D12ED973EF1D7EE9@BYAPR02MB4135.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dpu8xHH4R7okA7LJkfVWgLZLGWApxq2zoBVoqFiDWL84jDn5RZyaMz1/jQXMueanu7ytxF1SgDMONo7luZtdtAc4hzqDFxkNujpCPWA0LUnVh0lQDCQmXPwW5at29+4evp2lhtPErLLrAzwj/WEVeEQiMDPIBXD8vwtoHHAiDIl15M6zvzs8vWJXS1PHgHJfTebBInqg7EzFO2SdQVKP7+v2jzttOqByIz7R0vG2wkBnvqmW5aN6ECqxQ4b9yHCCrvvSwl485Msnl7BSL3avRjj2CG5hDY2vFUlVfvGg6K7eSpawbDAC/aqNnn9aZVIrCTFpH+98eAjiV0plr6SmddKdCki5eAcCxaRgFdy3eOdf78x5fOuvaNt8ceXHKZdB97vHtvZV9wwvu3B+p4VZQOPdrvNuTKen1QsK+alBbiI7qj8weANail7N4JINbuQtpklJE/nRZk+q1knzUw0nuDxFOn8paZ0YJmxud8MWGRnF4Ur/siJUipqp5awEQY/SL7QRYkBOw97AoB07Fx5etqt/2TvU9ZQDxTjfBuw5RDKcw8WIC7QptLBXkV+w+NIXHKbgfLR38eSWRZte5KesA3fmqyDUNOSc1F8+byLjJkvwETj6t9UusO8kTICnS+xe9Yx1vMNXTp1eTCL2ePjNEi6M4MuzZaKUd+9sISoZzAksG2UMfUH+iubLKP63hN23MF96nSjEkiyYkU6NLchirayVsEWumoGqJCrzW0zBM58815a3HkWIyQFofYlFtzBIw6n4IuuYmE9EJFKlsynEzSGYFuyrGAOLsymnI7cGIkTEy1WYo4A4SWMPIdja7I0LBB849r76aZ3u+bHhpX3Og4j9PH7XNdBxnObjynjVB7E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(54906003)(83380400001)(33656002)(2906002)(7696005)(38100700002)(186003)(66476007)(64756008)(66446008)(8676002)(76116006)(66556008)(4326008)(66946007)(38070700005)(122000001)(86362001)(5660300002)(6506007)(8936002)(508600001)(316002)(55016003)(52536014)(9686003)(71200400001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3BvZm9KMVRNQS9RZ1Z3bDVEV3daQ2FIbno5RTRrVDNSUnVaNlBnWXJPQzhk?=
 =?utf-8?B?NDBQSE5LUU11ZzJMRjkzZjFYdUlkaW90eS9oc3JOUjZjWndFT2h5MXFMbStX?=
 =?utf-8?B?Y3ZHV1N6Y1RGQUM4cDBNc2Rad0h4TWkyTUdCNnVOMGtsSTd1YU5YelFLUElo?=
 =?utf-8?B?TE5hUGwyTFMxWS9od2tCaS9nendtU3NVdzc4WDk3dXpvM3FWaWNCSUZhbWdS?=
 =?utf-8?B?Q1BxLzRJbVR1V0tBdDVaVEEwWUtQbGQvZUdtTXF3R1JhSHpRcTNESHB1ZlVC?=
 =?utf-8?B?cWpPRk5wTHdSOXByd1QzaFR3bnNyaC9Ua1V4YnhVQ2l1b3R0ZUdnSkU5VzZK?=
 =?utf-8?B?VjdJMFVzbDBjd0Vjbk54M25hSzdodHJNSHFXOStkenBQSktMUXBWNkNBekNV?=
 =?utf-8?B?d0Noa25PRzBBMVJZRGxxZTF4dzR0TWZFeXdscjc4V0oxY2JzZ3dkMnQ3Z1dU?=
 =?utf-8?B?akdOeWZqY2VjcWNjN0toVzZ4RDh6TkdWWWhjUGY4bnJmRnlRLzNWZG9NTkVR?=
 =?utf-8?B?dzZVTUV5QTRpbkQvbWkrY0UzMHdmQ0JXRWZJRjFHdTJ3YVFvbEt5T2xTbjJF?=
 =?utf-8?B?VjNNcmpzM3liYXkxeWp0aWlJN29icXJvUjBmZE1zczBrMEEzSGNlL2lKeHdu?=
 =?utf-8?B?aTVzLzl4QWdFSHZpU29LQTJxN2lKUit3UWExczNkSlJsVThSYkdSRld4UDYz?=
 =?utf-8?B?ZmVxa3dxU0lKNVFqK1FRcHIzS3dkRjJJa0M2VEZrdXlpdmFIaHZ2VktKdkUr?=
 =?utf-8?B?a1loVnB3a2kwMFlFOHBSVTYyMnhPTDgyTitveGlnRDh4ZStNZlBvTjdSYzlr?=
 =?utf-8?B?S3NTY2ZmcVlVUFlLckZBTC9zTnp1ekpKN1pBcDJQZU9wdm5DY1Q3OFM2RWtK?=
 =?utf-8?B?ZzhsRXovUTRXeEZKZXp0WFZvd2d4M1VWU1BBNHZJelFLWExUV25MUWRHeWtM?=
 =?utf-8?B?VEIySDhLcjJCOFQxemtXZXhZTW9XTjlqVUlCUkthTExFQlprT1F0b2Z0dVpJ?=
 =?utf-8?B?dThNcEF1RkFsL2V5WVVZRjQ0NW9maDBocmRQRG5BSE1IaTI5N3VWTTdKc0do?=
 =?utf-8?B?THlERUNJOS85eUFNNEkveGZQbEdickpMdktnRGVQWTByclAxSG1FbXRxcDQ1?=
 =?utf-8?B?K3E1RElvVDhVNG1XaVI0UGEzYzd5NUYzVGdCTHRjSmthWGNpQUNxMDBuZ0Uz?=
 =?utf-8?B?Y2pEQkJkSkhYY2JEMW1xbERQRGZ6OW5wZUppRE5BVHdLRW5aczhPV2I1Lyt4?=
 =?utf-8?B?dEQ5NjZMR1VkaE9MdzYzYlVnTmxKd252TFV6eEMyeUpqUklkaW8wQnZXTVB4?=
 =?utf-8?B?OU00R0hvZFRlTnc4ekd0WG1FS281RFZMSXR4QjcvL0lmMGxQQkdOekhqbFJK?=
 =?utf-8?B?dGp3eUREelZqMkhoT3JlZkU4RTFmbVhiUDVJYVhnNXlMWkU4ZW1NT21peldT?=
 =?utf-8?B?RkdNRURLdmhHMmFkYmxTVmFFNG8rYUlVWEpYdkNzNC9BZmM4M0pZRWdncmFR?=
 =?utf-8?B?TE5vS2RVMGNraExaUG1JaVBBbnE4bk5tOVZvNExNbHIvWXVxd0FEUmFiR2Q2?=
 =?utf-8?B?WHQwVGZrMTRnUklvTHcyYmVhYzhPajNXUGtNM0Y0cFd1dmYrM0xCeGpMc2hk?=
 =?utf-8?B?cEs1UWI4a1FkcENxaDVVL0twTkVJeWtYdGppQXlwVlo2Y2pCdCswYmE3TXFX?=
 =?utf-8?B?S1U2bTRqNGdSK0JPSFV2MzFrUWh1VS85M1ZGcUYrdk1zdGJsTXg0TEdMZkRy?=
 =?utf-8?B?eDZqYzF0bFhkWTBybEtTM2FLcDB3SUZvVFRYMzlJUkQ2VnhHRUtVT0lBQ0do?=
 =?utf-8?B?dHI1Q1VwbXpXN2EwTWRSYzJGL0h3ZE1DbnpjNG0rUlIwSERVZDk0cmRFTlJV?=
 =?utf-8?B?SXNUbk91UktPb1dBY2Qyc0ZNQnpkWEZyeU4yTG9hRmxkZ2pTdjNweTRHdEQ0?=
 =?utf-8?B?QTVpRGxWd3FXUWI4Wmt0MkpES1VIdWUvbHA2QnFuWVpodDN4T3ZzaEhzLzRG?=
 =?utf-8?B?SDRZL0xJdkFuR3krOW81WTVrNzg2RWRkdXBSam5pQnM1Zi80MFRPaEp2ZUNi?=
 =?utf-8?B?cnVWNEVEUmZCVVIwSEZqZ0l0Vm5XcVVwbVd3SVlIcWhkelVyeU1WVnNxdjJL?=
 =?utf-8?B?Wm5jWFd3elI4WGNPZUxKa2tsZ0Z6SEJzN3kvV282Q1VSZ241TEg0STFzSWxa?=
 =?utf-8?B?YUhsUUFMblVXN3Qvb2UvNzRKVEkrQTJNRlFpZnhReEtaM1c5S3hvWnhEbHdR?=
 =?utf-8?B?UDBWYTF6azkwN2d3bzhiVmZXMkorR2IrMlBldzgyeFhVbWRVZm1FZ082WU1L?=
 =?utf-8?B?bmo1WTN5TVBBUmlFSjRtajFqYUh6T2hZaFBDOTV0MG5Gb0p2elIweXR5b0Jv?=
 =?utf-8?Q?5TD+q3VMf8WnnpbpZW62xYWJ3ZreYSEvFZINcK8TaRBOs?=
x-ms-exchange-antispam-messagedata-1: 9Em+D140oncRkA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7afca3-09a7-4127-7f89-08da1eac855f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 06:52:34.6558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuURAWOUTmYn5paz+Srs6fqUJhQPl7NLTgehBFi+ESXPmEJg+brRMd8ppnnWG4ldDD7kPG3XPvFbw2w/3iHHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4135
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"

>  This is not so nice, we prefer the tarball download (it's a lot faster if the repo has never been cloned before, and not much slower if the git repo was already cloned; in addition, it's subject to github rate limiting).

I was not aware of a significant difference between the tarball download and git cloning.
I only made this change in order to make the zynq defconfigs consistent with the zynqmp defconfigs which use git cloning.
My only preference is to keep the zynq and zynqmp defconfigs as consistent and similar as possible.
If the buildroot community prefers tarballs, then I will move both the zynq and zynqmp defconfigs to tarballs.

>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"

>  Actually you could switch this to tarball as well.

Same comment as above.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
