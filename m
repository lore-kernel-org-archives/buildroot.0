Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A40E77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 19:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C72504175F;
	Wed, 18 Dec 2024 19:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WflO9uRQy_bx; Wed, 18 Dec 2024 19:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 833B741695
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833B741695;
	Wed, 18 Dec 2024 19:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70C38CE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C713C849FA
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf4GLOH3nHPr for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 19:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::603;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5828849D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5828849D3
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5828849D3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9sJJsAIy51LTojt7R53wMEwm5mshjN+G873Gito/iFy8J59BhCY24nQgivbfyZ0vE5kekFy/qe3rf/i1UfuNiGFFal4oJ1NCifr4LFazHThJ+EnwzKorY8NaajbgiaTMW4rxRx/hNHkKdAbzsxzTaoxxV/RLlK3d2mW6uaGJogAd3iO1s9Z1jq/i/3s8oPAlJnLh4BszefNGLy21Wn7M9gbmNPoNaNIcwzD7XdGsmGVHYs6sJQuG9w9Dg9nNrPQDsLM8vgiA4iwWv+QAZ8pjE8DLpTHLlgfH7RHNG31d0qAT/cMcNn/IHaTASbzfeheG60ipATenX9rZ4x1wyWx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShiAtbTlY0TEkOX8PUWoyn58y1W2ntVdfo7EI5NJs5k=;
 b=M06T/w/fgzjiOgsLdQ2pB/el5n7SdYFot8TxBc6W4tVYaBaa/eIL92KNPzWbAtK+ops18+T/iTXYidrrEPAMBzjeewspa8djK9XpECOH/uNcULX4yw6awr7XN/vt8FEFxHya4BTdCe3/8s7RvwEHp3lFeB8khx29pwhtYL2IoCwsb+1EVb/y7cmiqBHLlp/8KaQUDzJBfme+zQi5pq1Qz92wa/1zliWiXCYcWmT3qKxsnc0yLqSB1RQUwh2XtIuZv+hSi10GS9JnNwV2FddMbigYitHnR5xpM08y8xd2x88qsKNVbF2XdNs+12ahdQn/jJvZHWOMsXHiwltkgV5ACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 19:09:19 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 19:09:19 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig: bump to
 xilinx-v2024.2
Thread-Index: AQHbQkSKtlWfmoUmN0SctSPGEEbRO7Lq0m+AgADwB2CAADEGoIAAZZ0AgAAfiQA=
Date: Wed, 18 Dec 2024 19:09:19 +0000
Message-ID: <CH2PR12MB50047BB1A73C7AE8D8E5D2F3F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
 <20241129095304.950313-3-neal.frager@amd.com>	<20241217184539.3f3c0bb4@booty>
 <CH2PR12MB500477CB18DAB3EF269AB9A8F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB500407840D8CDDEFF4A2D560F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241218180354.1a89879b@booty>
In-Reply-To: <20241218180354.1a89879b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL1PR12MB5804:EE_
x-ms-office365-filtering-correlation-id: 7d8c2c67-0c65-4e2e-c045-08dd1f9779a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jpgwuPdqVaoUXAD/MV11leXmX3VlskLdue2Z6se4mRxgSVRLBSFEwEH2vb8p?=
 =?us-ascii?Q?hlUOCBdVqFCLR/dLSQ4GPaoI/NAyCIKtp3sx1ptCCqjdYTAgrmn6tpiOBUn0?=
 =?us-ascii?Q?1i3dpgcNNMVP0KEWLyx6mMlZHWDEtDZShU89w6xqtHBGFkOsHztH7/2CNntx?=
 =?us-ascii?Q?Ts9k6xPjMUNaxWAJs8TAbVoB1XMJzjMrloVIiPOGkjyxrpoH1/5u1tdN1Vzh?=
 =?us-ascii?Q?UibrZtpGSxhWiT3i/8aTWlBh6WeJKdJPh3T09pzBDUiJsntqEHIEfx5HtSB2?=
 =?us-ascii?Q?lnD1X3TgyNTDEwlojaa9otpLa+LpojNf06ZyRMo/ifMGZNnltF89QnRvn4xR?=
 =?us-ascii?Q?HMvpFToARZyMnjXq8NhUSllGNl9wOR8DaQS4+R5eWMtSBqVpKa2zZRX1chc6?=
 =?us-ascii?Q?bAT2YXUKG1PAdQciFFfLwvLB3yW8g3nDk49wuIZv6euUojOfRtLw/Pospaoa?=
 =?us-ascii?Q?MimrGP+LkQGugvNUkkncGgtK/nTMigRXKrjXfeOg1M8aAJvvRO45B7sQ7di3?=
 =?us-ascii?Q?3lWueB8QRxy2i81cUV1UbN/249gVX0gMnsCr3a4URgAxY+5/Lcd5kc3v/5r2?=
 =?us-ascii?Q?cVRXl2Zvf4yfXWAU7U+iR0cQfrQJpHRckRcCoAfS2y0M3ugqI5JpySqgDYla?=
 =?us-ascii?Q?nSh78EeJFo1wwe/cVucHgaEMoeRFepVivS2Gcw8OkiZaDTlBN3RUaqvoyIZS?=
 =?us-ascii?Q?Xg7Qxhp598iEQDeWwjfx9KvQPFHd701/lpAWuTzFdDBmVqjqqxNvU44Gb54H?=
 =?us-ascii?Q?YWqKRhYlzVLpzMFyE8e5U676AvsELzJozjE6FtkGwpRpVrYo0IgZlV+DU6J9?=
 =?us-ascii?Q?HevdEooDZGPIArIgvhN4nhuKS38fQrQVbdMhEFJk4qqRwYA8g1qpExNfBL4/?=
 =?us-ascii?Q?zoycU8748LezFsL+EEU8VeNQKMq20ymV5EMq3IVmAmXiaAq/S2khSpaOQoti?=
 =?us-ascii?Q?ZaKvJOwdntrZfYCsIfP35kupOdaapyo5ICsYRq3803hX4nTHWLu0dNk+KIC/?=
 =?us-ascii?Q?c2yY88EQa6wc9srqJtaRgmsf5dYbvITL8BVdMApIszZcm16s6KWy40Rj5cW8?=
 =?us-ascii?Q?XtAV7Iqk/qUig3Bs4Io3KibQK2IoQZNPOW7VuZDy8vuiXMZbenBYPwq+ThJq?=
 =?us-ascii?Q?H72BfGkPGohIjzF7VkNyX8qLinz1hoWvQ11cnHIDiKcjd73fLW/tLIWY5S8+?=
 =?us-ascii?Q?voLFsfy7GzXrJT6E61mJCLy2fg+DkKkuuqNNOB7ZqNRS7eji62DU6a7MoCZS?=
 =?us-ascii?Q?NPvZKedM4Jj+eK4PrRNiz4rkXVdXhBJoUjQDhjiE+/Iryj5s0mesdYqa9tA9?=
 =?us-ascii?Q?wU+58MKf+BK7aaak55H6TbX9231Nnt7acaNvJ0/smsVZXrILmQoi/53jCGIL?=
 =?us-ascii?Q?+YJKg8w6a5aGS5Xi3E907sXQxvDN3TsQwgwmghhjAI/XVxPwMGWxaRxdJ0V1?=
 =?us-ascii?Q?sc10YtKztKq8kmznkjc93dQJ5RMZ2jErMvEbTPzKAEuhk1lgasKTPHtXh4en?=
 =?us-ascii?Q?AXGQwFSyT0EqI/k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lEzCSVm5CYNhb8DB50SHtSEB5HcNWbZ8q7WVo8h3PFCPMOxlPuA4OW7JrP1S?=
 =?us-ascii?Q?giPY+h4JAyI824gbwmAggN3tz+zkQnUwttYmsHJExlFgO8VSZb0nk5f5Tirh?=
 =?us-ascii?Q?iHd3GiEFGFxWsu0n61s3CaFWmw4RC8GbMZQRBaSxvyiGfjiP+DqRK9F9UsfC?=
 =?us-ascii?Q?7SLG8eLuIRs/3f5fVxoxhwxE7zwB8KxeiXNaeBwYwwCw1AUNmeU7BINAKEWE?=
 =?us-ascii?Q?QnU+wEk64erA6WnrqdLDaf5YC4T5lkEao9IruiUNkHZiQN4IUaVQnk5aJOQ/?=
 =?us-ascii?Q?X73FiIQIH3TUBITw9LYR9ksSKRrJPSSvMX7KLdYJoNKwQG3EVtKrgicgOxKQ?=
 =?us-ascii?Q?w3dWd7FZ7l3rAyg7ozllGzTR/IY3H0hqPxZ8yhNB5kxQ3MOmKRB79A0wq9+a?=
 =?us-ascii?Q?jTjTO8h70pyNtlsn8FwRy1rA7GCX62ahh2MwazJ6AJH8H514gBkfR4EK6vGc?=
 =?us-ascii?Q?PbMZ5KXLR2l9etNupMDFEoIbidS/c3k2ookYnzpH4xwhzbANzF61cQ9QwnQR?=
 =?us-ascii?Q?FU/3RQzMCMCQ9ROoIWu+GtxFou9w9rRQdG5wkRCZeoUWOJij40woGeYMxEh7?=
 =?us-ascii?Q?J+3VGed0s0h8yAv+5duKmsX2qT0SrQEJQqKdVqrUsx471MFOTl63/0bsN9wY?=
 =?us-ascii?Q?PcY14vAbdd8mBOnKqa6BAtY2jTdPhk7NOaf8zG4Ts95StDqVIcxuajAFofRm?=
 =?us-ascii?Q?q+P8Gi21NaTcC+iPH2KzDVGJY/qgsUcl2FMqghhOPWugDWHEJz60pQJJIP1g?=
 =?us-ascii?Q?7T+ZJOaZM2FdKtEaRP3c7Qp2a9YACNuEfulHVaW7Qt0y8AaqCEXsDGhB2gOv?=
 =?us-ascii?Q?DML06EpnacVXFGZe7mB+mmV7Y6+Eg0iWZ92/bsPbZAleGcGp0ERuyAdIFvIC?=
 =?us-ascii?Q?5h2nWwqeYoiRXsb9THopNUaMPPDA9y6yGiBTF1bsUse+3MwdJ4YMayGRlItn?=
 =?us-ascii?Q?bgo8508NW6cpQJlguGqGD4j/g9Ek6zfzWr8GZugDwjqofmjgoUC+29it9yh0?=
 =?us-ascii?Q?+V4obo5YFPBHW2J62qbxfw9+K/ye7j968Wy/B4Q3MnNel23/Wydeu2eZ4f6h?=
 =?us-ascii?Q?yKbLVnn2Dcp6Qja2NdgEQwuv+kqz6B7f2xw/zysLPR4+zOPdFa0+WE5jLpUT?=
 =?us-ascii?Q?hJiixB7HrXjL3GI3sQkkoWwSXsL2HqYRIAR8BKSiklTs3HYlg7/C3mmWYtSo?=
 =?us-ascii?Q?RFUp04iK6tZFBB3WC9s+mtGPs7OEtpWy5AO8kUXpr7/tWNgp4Dk872a9sxjU?=
 =?us-ascii?Q?3mUClxCcOLr9eX1SWENqitNMme7sx2FCfDtLI4Dn62jjoDWkVutD76JQB4fX?=
 =?us-ascii?Q?0aBltfz0zML0ynM5eDfcBFN+jCwSv8tR7aSdTjNjvQTvFSuDPieG6NZGmUt3?=
 =?us-ascii?Q?dd+8Omd7xcF3lLHNuG3UEN01DPVtLQsaH3625kcMGUY8uYm+83VYtXN6PuaG?=
 =?us-ascii?Q?FWuvwFl3Ov661W9nnRaTGYNxD4diQoyKLu5EhIFIw4TOaN5eQNZiPvrj2h/g?=
 =?us-ascii?Q?zk+6GKQH5/zWqabufiJ2vlxn3x7d57e6BfSYvHDVsBgD+YSO3Cvm5vl+jWmp?=
 =?us-ascii?Q?91FM9sNt44sHyvqyUo4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c2c67-0c65-4e2e-c045-08dd1f9779a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 19:09:19.7627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpl/EBSIDRPSm0rReDXxZqZ0XnXcGkMsNybUNWWVfshYim43GIlDIyQaqUHviZTC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShiAtbTlY0TEkOX8PUWoyn58y1W2ntVdfo7EI5NJs5k=;
 b=VTRK5T6CcrOQdEU7yWUpcSmtcv2blt/ordMDbwV2MPxu0lMj1+6tLZQ8IDtgJia50JQqehFQrV6aJBlt993eO4Jjkck2qa1VzyHeFyfsX3OAyIt848ELoV5Y1ibQ4vJF3ornYiujSuhy7y/Zps2U+lUSWHpXlA0O7BgYeuTafYA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VTRK5T6C
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2024.2
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hello Luca,
> 
> > This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.2 which
> > includes the following updates:
> > 
> > - ATF v2.10
> > - Linux v6.6.40
> > - U-Boot v2024.01
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> > I noticed I am unable to boot a Kria KV260 Vision AI Starter kit after
> > this series. The symptom is the boot process hungs after:  
> 
> > --- snip ---  
> 
> > I tested the following versions:  
> 
> > 1. 2024.11-rc1-36-ga6db4cde0fcb (just before the bump)  -> OK
> > 2. 2024.11-rc1-41-gd33a2cd51a3f (just after the bump)   -> hangs
> > 3. 2024.11-187-gf97b67be7429 (current Buildroot master) -> hangs  
> 
> > Steps I took to test:  
> 
> >  git checkout <commit>
> >  git clean -xdf
> >  git checkout -- .
> >  make zynqmp_kria_kv260_defconfig
> >  grep BR2_TARGET_UBOOT_ZYNQMP_PMUFW .config  # => always shows BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
> >  utils/brmake
> >  ( cd output/images; cp boot.bin sbirt.bin; dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin )
> >  # Upgrade sbirt.bin using the SBIRT tool  
>   
> >  # The following three lines are not really needed: the problem happens
> >  # before actually reading the uSD card:
> >  umount /media/$USER/*
> >  sudo dd if=output/images/sdcard.img of=/dev/sdb
> >  umount /media/$USER/* && sync  
> 
> > Do you have any clues?  
> 
> > Thank you for reporting this!  
> 
> > Unfortunately, it appears that our kria software is not quite as mature as I
> > believed.  When I bumped the defconfigs to xilinx_v2024.2, I only actually
> > run tested one defconfig per family.  For kria, I tested the kd240 starter kit
> > and it boots as expected.  I thought this meant that the kv260 and kr260 would
> > be fine by association.  
> 
> > I have just run tested the kv260, and I have duplicated your issue, so we do
> > indeed have a problem here.  I am working on it with high priority.  
> 
> > I am going to run test the kr260 now as well.  
> 
> Please apply the attached patch to your u-boot build.  It resolves the boot
> issue for me, and I believe it will resolve the issue for you as well.

> The attached patch resolves the issue. This is good, thanks for the
> quick action.

> On the other hand I am confused after having received in my inbox two
> different patches which appear to address the same issue:


> 1. A U-Boot patch changing one bit in psu_init_gpl.c [1]
> 2. A Buildroot patch adding a patch from upstream U-Boot [2] 

> [1] https://lore.kernel.org/all/20241218130129.687650-1-neal.frager@amd.com/
> [2] https://lore.kernel.org/all/20241218131832.693150-1-neal.frager@amd.com/

> Are those two actually solving the same bug?

Yes, either patch will solve the immediate issue of not being able to boot.

> If they are, why proposing two different fixes, one for U-Boot and one
> for Buildroot?

Since either patch solves the problem, I chose to include Michal's patch which
is already committed upstream for buildroot.  From that perspective, I do not
really need to send any patches upstream to u-boot to solve the boot issue
because Michal's patch is already committed upstream.

However, the main reason why this happened is because the psu_init that the
FSBL uses does not match the psu_init that the SPL uses.  And the FSBL
solution is still what AMD uses for our official release testing.  So even
though Michal's patch is not included in our 2024.2 release, the FSBL does
not have an issue because the DP is taken out of reset by the FSBL psu_init.

Since this is not the first time I have seen issues with the SPL flow having
an untested boot failure, I want to fix this issue in the SPL psu_init as well.
The register change of my patch is simply matching the FSBL configuration of
that same register.  This is why I have gone ahead and submitted a second
patch upstream to u-boot correcting the psu_init, even though this patch is
not required for buildroot or solving our boot issue.

Does this help clear things up?  Do you have any thoughts / opinions?

> It would be good to have this clarified before applying any fixes.

Completely understood.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
