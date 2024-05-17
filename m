Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B5C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 15:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BEF260744;
	Fri, 17 May 2024 15:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFB9v_TWUNlW; Fri, 17 May 2024 15:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AD76077D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AD76077D;
	Fri, 17 May 2024 15:05:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15F811BF2FA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0124D80FFE
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cfqq-mEIaiMA for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 15:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:feae::725;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=marc.murphy@sancloud.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8EB980E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EB980E27
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::725])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8EB980E27
 for <buildroot@buildroot.org>; Fri, 17 May 2024 15:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXP7/+VR/L8VPBtjrxb7mZ4iQqBHdcaCKCVRntoVmCZyN9OssHCMT5fW2/6EEWAAnIDiLCJIRXj15dwLyI0037MN8yY8uRCq0gFUtRLzywyho9/nb0YCvUfkhB3XdOMzJHYuUPXeX+VfjWvat1u++d2E6arBVndMRrZ0ZSUVqfiXkkK1A4sX7afVN/GpUSjOwSF31aUukhrukzdBmcgJolBC9QtMSQUA94L+1LY3I0okfMIP3aSZbiJQKDRF3wCjojx0nMQCrSHIRFQd0dcyXBiz59l7LpGeWCgaJ5p0Lj2EKwzPW6d5tPLzJ5MG3q7GA74ENGZ4YNkuS6o1iLRC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtrWx4CUVr4xX9AYmfjiSHbEgGl9IJuxmmJop3YzDjE=;
 b=C8zAaPNoywMBxE0DTTFaf/36spNF16pEblMf3S//XgEL8zlOR6lqIscMqw+4rBn+A69/6uEZbRXHcTKIgd92mZMpjfoczve8hyFQ0QP6TDFucgYNhvSwkhRZf+9XTNZM65UtCJqRnGobfa07qOi1Nk4p1Z00l4tnCngATkmDnQDPYPlixlXLQxl3J//EuY5w30veq7MxiBCrU9LEajS+vIKGXtyjRZmgvrhzUaRwjRwvk7fKmaZ0p0O+AX+I1Nm0sKVZ67+trXz7yRL+IFuGG+HFjYcC/ozpmKb1QPODxOYOpDXOspRnw7atwQJUGKSy2vZZLuKkzmCj4athSRVPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
Received: from SEZPR06MB6485.apcprd06.prod.outlook.com (2603:1096:101:17e::10)
 by JH0PR06MB6678.apcprd06.prod.outlook.com (2603:1096:990:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 15:05:16 +0000
Received: from SEZPR06MB6485.apcprd06.prod.outlook.com
 ([fe80::31f1:8780:7a32:6d5c]) by SEZPR06MB6485.apcprd06.prod.outlook.com
 ([fe80::31f1:8780:7a32:6d5c%3]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 15:05:16 +0000
From: Marc Murphy <marc.murphy@sancloud.com>
To: Bryan Brattlof <bb@ti.com>, SanCloud <mailer@sancloud.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support
 patching in same way as u-boot
Thread-Index: AQHaqGbBs4KSzRKVSkKgwvhNrrKuKrGbgp8Q
Date: Fri, 17 May 2024 15:05:16 +0000
Message-ID: <SEZPR06MB64850609B6CDAB16559658FF80EE2@SEZPR06MB6485.apcprd06.prod.outlook.com>
References: <20240516200837.244258-1-marc.murphy@sancloud.com>
 <20240517143005.lu4x4afty6t7qo7b@bryanbrattlof.com>
In-Reply-To: <20240517143005.lu4x4afty6t7qo7b@bryanbrattlof.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6485:EE_|JH0PR06MB6678:EE_
x-ms-office365-filtering-correlation-id: 23cb7a2e-78ca-4f94-0e2d-08dc7682c27f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|41320700004|376005|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fWI1ZBUPxGrxeRk4+qNODthvf95HU4XtILf3RuRoYYi7VguDu9Fz36IoJGjc?=
 =?us-ascii?Q?gSRMEfYWxEBFGEgMiBRkLvRq2bmRKdpI+oeHtEaDuVSjYBtxa3UCGHWggVnt?=
 =?us-ascii?Q?+gLTABPeKLkqJwu8aDZaQo/pw7zTDszq0IKtsREHmF5dAgHAIyPdAN/pMC81?=
 =?us-ascii?Q?bjOnurDyrubvP4okkN+7c2T2IoUa0tmpDiLMEuaPdhrRdadAoIdRomDyIFTD?=
 =?us-ascii?Q?9cb+H/W9QazKzljmR5h1WqDg1IhVYJo7QXWRdooUDErjGZ4SPA88VAneiaBW?=
 =?us-ascii?Q?8q0UPIyYfaqJ+/xqmmkMGBtOTQ4qB7Q8MQlFBe9/OLsivm57X0mhabJnr6bu?=
 =?us-ascii?Q?09sHxuPp+YuR5s/t6/z/CwiYkf/MZoMU7wEkHdWqerkgYvQ1PkYmTccl14/a?=
 =?us-ascii?Q?Ai6FGFLEG0Bl9ljmBNIUG0biY1Cj0MqP81+FR4kxSonYPcwmjER0+dYgO9SM?=
 =?us-ascii?Q?ORg0qBwIy4cZknTyMl6rS76jG6hP2cyLPPh30dz4GKK9R9dsacOe0ZfCC4wc?=
 =?us-ascii?Q?4StmRcX3oARI/uq1soM27jFXd5jOSp5UaW/G9xrBPavNnUJp72AItxoNZORQ?=
 =?us-ascii?Q?tQluK8GLmdcxQqPQ/whpCokJXQHRWLnp/e9KyQH7FiKUnUmJLn0sOVGYDsmm?=
 =?us-ascii?Q?YV3IoUtY83NFrjivdSetneyoJGvKukt2FKrmKoXymOS4CAn0DOQAgWKlGjXi?=
 =?us-ascii?Q?qamXa9ZYbRii+YyLkRmf+sC1EZ8MHtysYO/djlcTfaviT4qEINC98gE9MSGY?=
 =?us-ascii?Q?7cC+CCSRWFiFqgPGQznm5eN/98uzukqVkwKVFYIHc8YO6chn7KfGbf9VCsta?=
 =?us-ascii?Q?fR7Mx64xWhTCU+NBr0lVS8FXb0qUL0+SyxqHn1W7VCG1j0tl/OdQYCkbaaDm?=
 =?us-ascii?Q?KTwkPd/iyLB2iDkIGvsZ8w3JyXL6+/tN/YxgaeWmLAxFoAOELzBKTcNuRW+t?=
 =?us-ascii?Q?hPE8Z+M5wIduJPjs/UwKy5wLArCiqp/cSqvc8YwkdEkaEQ3B8Br3zNwTAnGp?=
 =?us-ascii?Q?2vmcSHnTWs4q7Kj/6MzZ07G4jVt3OkyEeyDZ7UFjjQoXtNWit/TJ21+UeGKs?=
 =?us-ascii?Q?LNCCCL8SEEv0pjDwwBVzmtZKmcT7yLCZEuqLdGrz/6ZKIAvgV4bttIUu5bOe?=
 =?us-ascii?Q?noej8I7yQx7uIth7TvtPSE1Iiczqi0ibQvaXLaIg6EXdr0aVKMDAlxxh+3HI?=
 =?us-ascii?Q?cR47Cn1QMxvla8T15rtu4ZPfsRo3Xzt9YquHgxkAYiRRezFzfsMJScZU25HT?=
 =?us-ascii?Q?AiVcBp6mM5HnYO4YZk90Zd4MWzR2AJEqoeFAi5n1OQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB6485.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(41320700004)(376005)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q222WYdPUUbBbaUqhOCUmcnD8GTTrlP3qymXtQHwfN6q8O1qhhVuNd8pbfgZ?=
 =?us-ascii?Q?CiMreXB1NZZ3qRKuasy78bYgvXiHmOMJV5GvoPr7nuYsCbbIU5mdURS4Clwk?=
 =?us-ascii?Q?FRulmzE1trLPbf9d/NatNTGCZA9ZXL0cvCrJrudpfgtR7GKns53DigWi0Z+i?=
 =?us-ascii?Q?L9856VQlqwnkcUgGyO9r3cZdbz5sc0zqkSdO3XKhtNsMiicamofQ98aM8CIQ?=
 =?us-ascii?Q?s8ByIwoxz3JlwTb+1Ybn5eEMPqL3ofEBz17T/jXzEGmHGuZcj9yCy973ed58?=
 =?us-ascii?Q?SzsjTRP8sTMuFn8R05Z+emX57q8LF3G35Hu9qukQW2/VeS4/JPrrPh0miaPJ?=
 =?us-ascii?Q?xm/4v2UfDRJjZz49eqGg2KpkR02mmKWLhzmEJTNo1TO+egP1tjMhir5JqooI?=
 =?us-ascii?Q?8ydL9iKga8pKOK8Y3grd4J5AXLI3UWRZZbnlWoWbbkKzF57pdRoEDfhAip53?=
 =?us-ascii?Q?RIYrfTx6M/VEI83cTX9TR1MBKjF/+qrLD8ZpQg4c/CH+FG7PrbUpsH6JNz4z?=
 =?us-ascii?Q?6X4XatadbFmA8CnKbN0zWQZpU7XoCCODvUknyngmjJPz6NO3o3P4FpeY+6zP?=
 =?us-ascii?Q?0Z2XARF2saEjWXN8s9El3L2j8uSoEx6wa6Zv8lasObJY/7hNSUyPqWlGyw3u?=
 =?us-ascii?Q?5JHlW0Rt+Rzn3sMTXPFB8gGcodWd8EgqQ5Bo36b0qlmKgxBsx7GZSLrnB+X2?=
 =?us-ascii?Q?QUjnpWDfgewVIJD1FIUyXpKGGSEShgqlIEeoR13oqog9EES0jaHCaeFnN9C2?=
 =?us-ascii?Q?QTupWp9AbUdrX280pD+9Upg18Q6w4QoxhOSaGE1tqQQgoxHVw+ABHMSPA7PF?=
 =?us-ascii?Q?6hqAgiGU2fkwQHpwrP9tBJiuMK6r4iBo0L9gaeupPiISLzIm+BInNo/kSisl?=
 =?us-ascii?Q?BkfRALFV78bL+JRFrBLzU9JhXLJx3bkhtlh3zLsNb8pwvkSpoRFrc+I6qyu/?=
 =?us-ascii?Q?gx9gXlBOCCDTWfkgZiVnLL0ngW5bZSAPtm9VPftShTaA8I1lUmP1FosPJXR5?=
 =?us-ascii?Q?EjfkR60c2evkTMY0Z4ZMTwM1z50zpYWR5Bn7nfSaErYOBxBlGPDBk+GrOKYJ?=
 =?us-ascii?Q?NX5g9Cz1aPAP1vbUiZF82a95VuoCWowZm258SCmkOPIKzgESAD1jUAIxqg0g?=
 =?us-ascii?Q?3CHKHVYFKuRmrKIamgbfeLgMWLJDxlzXdr8YIl2/xcycNYJclKAjDrmzrIBk?=
 =?us-ascii?Q?iT8DGc6cApgsE25PjdNJ+1f49HESrfnFXwt8WGXIEnnpSWoWWd7HNCjg90Xx?=
 =?us-ascii?Q?M9LhaW7+F1phw8zk6n1a6pMIqTxjov+s00IDsDPOaC3sr7EonhsrY0Cxo3bK?=
 =?us-ascii?Q?Xb5+YregzSRllDOo/IGSUTFZ/cgJHbUAdwzletxiq3PnIk+jyoq3JjTrQ4Yi?=
 =?us-ascii?Q?R19of9RNFbbe40eMVLlzcU0f/yD7NBU91W8aQWC95y6NbmkNvC8prIwg22Hc?=
 =?us-ascii?Q?fHgFcuXqhywjCMdPf8a6J1/mkD6lTCcG7pWzYLZRxk9vnBxVrTgzWzNV0IE2?=
 =?us-ascii?Q?5Z383bJWGz52ypgMg97OB7q41qHcMNEk6JRsCHs4sFubyGS4n3wSxhpUeSR7?=
 =?us-ascii?Q?CliGqKYpChYpXtK+iv3hxBIz/C9wsjQKVKrxliL7?=
MIME-Version: 1.0
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6485.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb7a2e-78ca-4f94-0e2d-08dc7682c27f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 15:05:16.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3e0f949f-6a74-4378-baf2-0abfca8d5e06
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LO5iz3yHYQhULPsE2VJEPuEG0lTH1KVVI1QT5wJnE/oB5sBYNp3j8MgLVGF4TonR+9yluk6/Z0+6VmbE5YMoK5zZPoil0V3FLVb/EuqkQsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6678
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sancloud.com
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support
 patching in same way as u-boot
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

> Hi Marc,
> 
> On May 16, 2024 thus sayeth Marc Murphy:
> > Signed-off-by: Marc Murphy <marc.murphy@sancloud.com>
> > ---
> >  boot/ti-k3-r5-loader/Config.in          | 12 ++++++++++++
> >  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 19 +++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/boot/ti-k3-r5-loader/Config.in
> > b/boot/ti-k3-r5-loader/Config.in index c276528fad..0e26a15369 100644
> > --- a/boot/ti-k3-r5-loader/Config.in
> > +++ b/boot/ti-k3-r5-loader/Config.in
> > @@ -69,6 +69,18 @@ config BR2_TARGET_TI_K3_R5_LOADER_VERSION
> >  		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
> >  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
> >  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> > +
> > +config BR2_TARGET_TI_K3_R5_LOADER_PATCH
> > +	string "Custom U-Boot patches"
> > +	default ""
> > +	help
> > +	  A space-separated list of patches to apply to U-Boot.
> > +	  Each patch can be described as an URL, a local file path,
> > +	  or a directory. In the case of a directory, all files
> > +	  matching *.patch in the directory will be applied.
> > +
> > +	  Most users may leave this empty
> > +
> 
> Thanks for the patch! Just trying to understand what we're trying to do.

When we use an external config (BR2_EXTERNAL) and specify the version of u-boot to use we need to apply platform specific patches we normally use:
$BR2_EXTERNAL /board/board-type/patches/uboot

If we want to use a dedicated Ti release e.g. 08.06.00.007 and apply our patches to it, this is good for the normal uboot bootloader.  If we need to apply patches to the k3 bootloader it is not possible and buildroot checks out a dedicated folder for building:
drwxr-xr-x  25 marc marc    4096 May 16 14:34 ti-k3-r5-loader-custom
drwxr-xr-x  25 marc marc    4096 May 16 14:34 uboot-custom

We have dedicated board configs, device tree and some code changes that are not in mainline and need applying to both builds of uboot.
If there is another way to do this I would appreciate the feedback.

> 
> Anytime I have some patches I want to apply on-top of a package version I'll
> typically put them in the board/ folder and use the BR2_GLOBAL_PATCH_DIR to
> point to that folder:
> 
>     board/<vendor>/<board>/patches
> 
> Ideally we should be applying the same patches for uboot and ti-k3-r5-loader
> as it's really just a 32bit build of the SPL
> 
> Is there something you're trying to do that needs a list of patches in different
> paths and not in the 64bit uboot package?
> 
> ~Bryan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Marc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
