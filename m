Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B876C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BB483131;
	Sun,  3 Mar 2024 08:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T863E_77FYum; Sun,  3 Mar 2024 08:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 384E983134
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384E983134;
	Sun,  3 Mar 2024 08:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5511BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC4F608DB
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tv3AlJM493pY for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::601;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A91D608D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A91D608D2
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A91D608D2
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LELnrIFuPp/us5NjSIpAD7cwWUYKamgKKmxxH3lq/0WDTpXT7AnqJTyX1+6I/s6NcsMMfQfx5Xl9f7kDlPCG0wahTJ8N6SLLWOAYzBN3wq9W6PHhtqBBfWq/18jLxqRNCr5sNTL217fj9kX1rR2Fqp+ddR63drsAM+G+mQczESnEEadHCZZx3RSJw9d4sCle00W88h5O7KjvDy2ujVXoVbi0/p+23ljMxakpWq3ZSKEew73UiTiyqjS4srjjAnBR4uIW/1LiYfplFBU06bI/jLlRMsohGWD8O2P8a1NFbYUfxlZt05Ay8WJvwU+khOf0030ycRr3vG0147IB6otm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxcsQdzYC9ouTDEaJsYGsmGZt+ZIaP4wHRTsLV8q2t8=;
 b=XmAhrxcwPzxk4d90ld/R0pmLg6yn7Lt2n13+o0s9cf9kUDTcCLczn/VRiRLQRA5F93fusBMwZ/vtMYgPP+EJc7wQE1rIoBpDB2v+CzAFIVpjoHy+UwH9p6FuGvdhOcw/pa61Nm7H7lc6UhYk9OL6nfuE8EvYEYnH5IltCeeCwD+jQg5oK9A9/zMF4JLyXiQ24hh6ZyHEVR6WzquBVNNiW5rjkUZWw2D7roCMX9hIUYrBya4wjopOluRJEEKBmJLBKq1650Kk+f13wxoKlSbTCmSB5Om3VI8L1RDMmOlscOTX85Jm/LpIMq8NykMUTQJ/TS4etdGxsobxa32jPOosFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Sun, 3 Mar
 2024 08:23:04 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7339.035; Sun, 3 Mar 2024
 08:23:04 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v9 06/11] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHaVDf3iO37MvF83Eai9PgMImmRJrD+nZWAgBgT8RCACombgIAEo2WQ
Date: Sun, 3 Mar 2024 08:23:04 +0000
Message-ID: <CH2PR12MB500477B9BBE985C686DF0577F05C2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-6-neal.frager@amd.com>
 <CH2PR12MB5004CB6FA7EA005C4F36C796F0452@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F29862E7DA6B163B2C97F0562@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240229102925.62a9ecbf@booty>
In-Reply-To: <20240229102925.62a9ecbf@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4159:EE_
x-ms-office365-filtering-correlation-id: fa2935f3-e63b-429c-579a-08dc3b5b25cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sl7Xwbo7Fg3OhiwgJ2vt+m5tIuqGQEziCvG6mFJMd7NO40oQVKpDloR089gs786GGQ3GLkS8Azrs27MlFVCNII/6E4ER6V5lBbf2HpI+qrr/3eRWYM9DCa9VRS+QGR4z3+30VmL+ALQ4tyYF6qJyMxUWfMCU1YNORginGJfZI1byAix4n1Rypiy7Aru6MMtcpv5MCK3yPNAuZsDq0rtJrPt9Qk5Xg0WuWmOAI+i6s4xrfdQkvo+7V8AcugyvqD6KUaMqwYY1XTLvgSrOCF2JK2exJo0LOYPz6yQan+hCRjRTVhgpEsundnBbIaal4TARbq81zNqNCngMW5sFvVwMdZlCXwNg2YRaG4m2aH3scrx1KA4xETHMDbbjMHQbASnCltXpDgctxOtDPkGhpXhwEITp/MjYqBIt18dR50wONeH7FNAazylK0yGcXqOgj/vpvFcFvs2PRO1hz5k595jRMiOjBxrKPXs29OepX/hXuiLMhlUBczMVo76wlWtK1mcD97TZLKZNsTZOtJj4xPb5xfY3wBtmGz8TvAo8sM0dLrrbd5TY27QNpgZef6UmXgTQgtBF8RoyYueQvGcdT3g618HuCQcAdbMl6SNyeB7NYv2ycAiWJbrY7ZuR96eH22HqhUJtjl1JTrVh8rkOOFrSeHLAWNOJ0BpXocgdLaTsyIrPdlXx0byRtbEVaFVqHKIOUDb2UxWJLOC4x2YxfvLz/f6lx+h6x+T+7jdNXvlbpZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4DLBJnNCf2DbVthrlrZLGHF3RX38BGUPJCGSdxAZSkYJtHEo/Qb1tBKz8qyt?=
 =?us-ascii?Q?SVAtwZIKV08qSCelSwvAcn/mbBcmvCKBInNvGSJlVyRybtbONd0KZvlWky5k?=
 =?us-ascii?Q?WYBVk6Jfub8wCCx03oooCb1v7idVHzJ4+Ao47pEDZYP91X8As9S5MgIQmwr4?=
 =?us-ascii?Q?1lzcDMi8bFKoD4Q66EiIPJSWi6aBNHQRogmgOd3Y0CM6U8Uh23liT1U9fffL?=
 =?us-ascii?Q?3VWjs9EY0G9CyN9fF6zqRLKvoKX09ZuiWmBqDC7xMKLlrTQ1YkX56VQb1brc?=
 =?us-ascii?Q?FAYLKNboK2wzlQlnGvVbg0+DUrr5kkMAn6rrY5M0tnxPGSvvzM4RFeeI2D+T?=
 =?us-ascii?Q?nSzyMB8A88aeYwCQ+SH8AogieYA83PRNDUidOJg9gh2Di4WNOhhyHvRmh0Ls?=
 =?us-ascii?Q?n70BSSE0eSw+Eml+Z8H9bnYuXBMz2mhmcDdD9/O/WVA+ZgTts2abvJBft4Mz?=
 =?us-ascii?Q?Ba0vbwoURYg415heS5/EAclEU6rEbXIG/W+AIAfF1NF44FYYC6JnsNt6r3bX?=
 =?us-ascii?Q?fJ8r9BpBidWXMkxQ/2zUgMdfOD8w45ANFFtXwWseeESiB1ImP5HWbT/j1Hhz?=
 =?us-ascii?Q?KulwFoaJz8cMzegxP0/Rkopcwf6Fa6ikaxflZrF8NRjfefCbHC29Z+P0CQMt?=
 =?us-ascii?Q?HfeTBvVE5rsIETFJXg0f1YaJmNeiJopF+x8VZAj1Njhb4XB9E+Hyix3+OZ81?=
 =?us-ascii?Q?4y1ibNwXmWdCqOMdd3iJ0tsMbkbMK2cUowcoIlkMN7G2BiN6tfiDmWGeLo7z?=
 =?us-ascii?Q?AsqFwDRObBoqoOJ9fLgGZbRxItDgTW5BkX6zfj3FhR+5iPNPWs9DlKIWMP3K?=
 =?us-ascii?Q?RTCtUUieaQ/plVK/78WkPEwfddui7LnfUrxMUWfpSiEi7tGEFDahyvQHn0n2?=
 =?us-ascii?Q?/WwIKWgB6CeXYPOu3kaSObFVNhr/73Jl8hrhLWhB4UamNapn/iC0+QRI2FFl?=
 =?us-ascii?Q?uH6MphHIumSh1C+F75o0UYKBvYbTgynn/GeSfri8Lra10ZgxwWjB6JK4ATvi?=
 =?us-ascii?Q?xDqCufFcjf9ZhxWuQ+NYwT73rSotDADHxrUwjFy+DB/VmoGWkATbAawZLwWi?=
 =?us-ascii?Q?g6YRk0HAhwL4PkNFCD2gv9OV/UwiapWJuZKxbPLOyhQh30I0qWF5Jj0Qbv67?=
 =?us-ascii?Q?rnsQh2rIAccdfCuU5T3yuyU6xEVkf2X7est5WFmkmXRPUGMGNJYOEgcPgqzc?=
 =?us-ascii?Q?wmoZZYwV7UwQU3pVaPP6fUFrOtSZTgsu1WxrVw1xzqa1cSH84k4XtIEnOMrD?=
 =?us-ascii?Q?Enm6YaqPwOEuqbVckekzBTtqPSR1df5GmMHhG4RD1ROfbLLUTLSlS8mspuQh?=
 =?us-ascii?Q?tJzLEPET6I7coarQHHsS4VqNnnggLqAYW+w+1zpiAnshMBeSakL1Gi+60eTN?=
 =?us-ascii?Q?64QmofQiidZdDXF9nU6ir72+0l2NRMi13nrPAziBVAt1a1GeimlI7/eldLD/?=
 =?us-ascii?Q?NqBg9+SBiKBIl3BLVECdzGJ2SZalSfD3giCtePb0Hz1YWdEqdhjxmqBOUxMC?=
 =?us-ascii?Q?FBJLuuNghKf+AYYqYly2ypyoSSyR57bvaL4/LtSd0Tis7XTMrKaHbUfLdMnA?=
 =?us-ascii?Q?VvGba1syt9+4UGRjtPQFBORxd+UYciMstPOWLLZvIBMSO67cJJ2wedY8YDzZ?=
 =?us-ascii?Q?YTFRO1EtNfxdzc52zjDNTII=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2935f3-e63b-429c-579a-08dc3b5b25cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2024 08:23:04.2134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFJDpREKwJR1kQC6fLLnJtacJ2H+9AZnYeaZBfIqcnt9jJETno5eeyuPszSYDbwu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxcsQdzYC9ouTDEaJsYGsmGZt+ZIaP4wHRTsLV8q2t8=;
 b=ZgAhu/ulhFmfrhkMFbyGdJdIrfrX3CI0sJsQ7LtvkUiYIEF9L+6sYCtZvaKAilNs500VaTmRrUA08bFuqsp/J177n34tB5mdO5H8ng9KpqDXw4Fp0WANJAPKoFJftT7PT4+NBKWgF3IdNe9We3tF1H6zBgFYzlmh1YTf0aqP52g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZgAhu/ul
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v9 06/11] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> Hello everyone,
> 
> Just a friendly reminder.  Any updates?
> 
> > Now that the toolchain-bare-metal-buildroot has been applied, do you have any
> > feedback regarding the remainder of the patch set?  
> 
> > One open question I have is regarding the patches for zynqmp-firmware and
> > versal-firmware.  These patches are no longer neeeded since being applied to
> > release version xilinx_v2023.2.  I kept them with the idea that users may
> > still be using older versions of software, so the patches enable users to
> > work with versions as old as 2022.2 for zynqmp and 2023.1 for versal.  
> 
> > Do you agree with keeping the patches or do you think it is better not to
> > include them and to say that support begins starting with version
> > xilinx_v2023.2?  
> 
> What are your thoughts?
> 
> > create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> > create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch  

> Apologies for the late reply...

> I think we should not put any effort in encouraging the practice of
> using old and perhaps not-maintained-anymore software that some
> proprietary tools tend to enforce.

> We do have a mainline pmufw that works without needing any patches
> thank to your (very appreciated!) effort, so let's just support the
> latest and greatest pmufw version and be happy.

> Your patches are there in this series anyway, and will be, so whoever
> wants to use an old version can do some research and find them.

> So, I vote to not have these patches in Buildroot.

> Luca

I agree with your reasoning.  I will remove the patches for the old versions.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
