Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B62C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 12:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712C44033D;
	Mon, 27 Mar 2023 12:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712C44033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4CsdKx7j7lP; Mon, 27 Mar 2023 12:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3494240980;
	Mon, 27 Mar 2023 12:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3494240980
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 064BB1BF34A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D18EB40980
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18EB40980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MDHoxtAioML for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 12:47:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767EC4033D
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 767EC4033D
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 12:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6cblA3OvFzUvQX8wqZwYqybQOX8gzKW2DOVAFjQHp/EOcs9Vd6jUCzNwQJNMoWMmMeubVVf3KnHpZmE6O176rWdq7kOIHdKPNll3qjxU4CJcPwSk5cdA4rI901nIU4tMNXk1M4fSimyJk9hEFt1HMC937aRCUsPmxm4QIzzrEZkk470RGZmdw0il+nFXpRWmulILbD3GEyxecSWjEjVRt/oZwK2m0r2/1kIvfz5BFixyn43r4ZI3O0YG0qhk44b2QHJ3ITmFOta8VQqCYBIIsP4IuaBfKY9LDUMfhoElUB9LGiwhvl8TVupNZfSEe1Ga2Vb1HjwayUL086Ruq9zNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK8WszIHZCrT8Vr04b2IsXYKxvuNdd7Ja2d+ojEOM5c=;
 b=UOaONZAJAX1Rk70lBEovpVWv6RNAheMuMxb50OfFxFPEcXcuSEVo1qK05yMbQCbvPFkBn5PyuVgsULz/v2vLC9eRfNk0ip0H1ULq0NpRMkp7HKdycUEi2w8maGcegRefC+owUwSreFAzCe5laS9tkOQvbAVH8/uUkuxr0A/TtMzk/05ncTugzTQD4GK3HZNFMayc7Q1b45IMMXBt4xl0KR0mekNbz/bBIAU1B3LO5/nUkGXp1+BlptMMsL34Ac9qIHDWZbVkI0vNCtQRN8zj06vSXeVgKnBV11ZhMLMz5+Jsg57h1vVk3+GcFpwuJqVQYGskg4js1OLV97Yn1Mrb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 12:47:47 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 12:47:47 +0000
To: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgAEO8lCAAAOhAIAAA/SA
Date: Mon, 27 Mar 2023 12:47:47 +0000
Message-ID: <CH2PR12MB5004F4F2E8E3C96893712B8DF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326220543.057f381d@windsurf>
 <CH2PR12MB50044744141F901308BAAF8AF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60041E824606160DF5277406A08B9@MN0PR12MB6004.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB60041E824606160DF5277406A08B9@MN0PR12MB6004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-27T12:28:26Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=697d2ecf-694e-46c2-abb4-fcdab449eabd;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4141:EE_
x-ms-office365-filtering-correlation-id: 306d9ddc-241f-48b3-f834-08db2ec1777b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1NRBBXPj1jZ8BlChq6YPsytXP34wlpw7Wk1FcLN8vc2YzHOwsILducWL8Mga68HHhYvMClGyR6SwuJfzW8QUxK/j2jddTkRSe7WhOLCqM6hUuAZPHIBZdYhYA6IIRPKbwNXH2640czD1eZcYWy6WqG9NAd3dYDNGZxrcPMtjdVkVVWIo7z4lSj9cYnIxHo9UuC2s8hT56LjqeC+vmysuDohMTWebkcr2zdHikXz7i1zXfvNXbkz5U+aScKSvLU/FTzMt4hGmMso7w66OzmdDErJYacLsjRapAzqYu2gFqIp/YSZHriJvhh939FNaeXiPYyNqid4zo66IkDgGxlmMZQzne9HyR2E7C9sjysnJ+1F9XvFbNpSNP5T92KMrPrOr7PbC6kuY6aJ1K2wxM2miqZ7QLQzPr8DdPPGfYQ+Ia6PPjdiNi80miWLUEjSPIKJCa15CM0KRVTCCEaWD3KjOZyD5JH0/8akZ+Q/36fzCClC9ea1yehx2KrzCbsVT7wkSp2BwiVE4eHnJLmSF7J0IOkAcYx9ch1w64wThXh0Sh9N0EvCefnlh7hWcNAgsMB3tChe12GLYSXOaYYolILzGGc5DNVo9TFZvcKotuk2EsAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(83380400001)(52536014)(41300700001)(33656002)(86362001)(5660300002)(38100700002)(8936002)(122000001)(54906003)(478600001)(7696005)(71200400001)(66446008)(76116006)(64756008)(8676002)(66946007)(66556008)(4326008)(66476007)(2906002)(38070700005)(53546011)(55016003)(186003)(6506007)(9686003)(316002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0A7r+MJ7cCij84CX08TGo2VifHQVF7y9Lp9/x1fwFxRQVP+bviuMs2xte5Bg?=
 =?us-ascii?Q?Wcc6Uay0MOI0pSwcwJb8qAjfCJ293TlURkkoPDm2kqnlwahcMoW1qe4cwFDg?=
 =?us-ascii?Q?WIORJKyYmnpN+NMJl+1YB4WySMmyefWhL+TRdFgybGygd2op4Bakrws/HRNc?=
 =?us-ascii?Q?PcfGJFoPbqBZ9mdZ21UuPJh4PebOYqdIyPb0/8yRyzeEubd8c72ooIPFE7PX?=
 =?us-ascii?Q?XM46XEJfhCUP99QGTid32KYwedG7KdxH/ZD0wavVb/CvnY/X1rmLg0D99BKz?=
 =?us-ascii?Q?lNFQ3Js/Ej9wQgCQj6CH7e7w7fYFnTQhJiWR+GmhHhHLABjbU0GIOSJSeaHw?=
 =?us-ascii?Q?IigK1B2OwrOCIdfg3dtiQSWoSllXiEBFOqq/DrmUEc1CRbn27mixJVOlKBLK?=
 =?us-ascii?Q?Ihago7hDE7MdsZdcMfFj44aCYnSPb74m1o9VudGOzrz87Bb0O7KRS9RQVae1?=
 =?us-ascii?Q?fJ6nSuzXzHWRmqtYaeQGSruNbvLWHSof97OlOuIdcwn7LhoQXRfZTstMGLjk?=
 =?us-ascii?Q?fEx8cd/FgetWhguaevhTjVB9DYh5J0ImnEljUnIXLhNEM8A8PrP9Lzfe6Quf?=
 =?us-ascii?Q?pYx+T6SgKzLrcdy3iqrFsv7VEYPXnOpdB929uL+wZZJmaZN75lvLDMVOzvht?=
 =?us-ascii?Q?FoDEU9g0FkE7PL9tvgTdhjgV+YTkfPnTkqal7MMedgSS911t47c0CbuvfcWB?=
 =?us-ascii?Q?D7xA5GgPCjn6zQ25tiMr2MYHzrZbhwdjlvTjSAiuRZNd9l6Jbt3n1zmQbX1j?=
 =?us-ascii?Q?JkKQOW9h/CRGkxpSGWq8VBj9NFJX/l39/YypRmsipc23lw/Ra3vpYIZxPrpD?=
 =?us-ascii?Q?oZbmnCf5ExgLlQ6OIyQ6qFSzmXYmXyn38iq7SwAW2vWueB0INR1vBD9B8lg3?=
 =?us-ascii?Q?01IY8yLoBA2LgNO0KBKq1w+PxTKXBY4eP9segCza25e1EtrWzlwZTZmRtQzN?=
 =?us-ascii?Q?IbLgW6wYkADXTSS62oNkrSuULDZWoNaFzxjOv2f7Dp1n7l+m617o6e0QzT6P?=
 =?us-ascii?Q?aNqfKRZDB5uHwWNmTbStEyxiSARbKFm92gKrkb1dzyFAhTHe3oCLa9JdmKE/?=
 =?us-ascii?Q?8IvLpHNWKOkOY8oKFTkapseVvVvWIFbGpNgtRAr4WZhvmTuUl64PcF9HpSkB?=
 =?us-ascii?Q?wvN44mM7fzA67yQEllgdIS8JslYjLMDyZ/09AVFcOaAXVxwd2mEFItJ60vd1?=
 =?us-ascii?Q?spX9abn3U5J/J1hLJ/mS3TRoXS33ozZsI7HzEHcUs/eHD5tFZFr+tFsNbYFq?=
 =?us-ascii?Q?9lLTTqLpcfxg3EhZGotmDDGwzlUeuNI0HXksDRs4ZdbUpYU1NFSxCNMadmkX?=
 =?us-ascii?Q?9pGHugpoZudjcyDFChxqhy/BnQYa/LW4iIAm1sWMX4dEwBcZrAM679iMsrAr?=
 =?us-ascii?Q?9ntGN8HtVbqwkQPMSL5JjhFuRBw3GkK1aJR2f+WjZ+abkWx8ZxRcM+JeY/L/?=
 =?us-ascii?Q?gvVbwgEnk9HN+nqJRqF/TB6y/yOA7ZaEiYIzyb6vXVvbTMX45lk/p8uyeuoE?=
 =?us-ascii?Q?YMws+WpD+NtOPHDwYGx/8m6Jr3jW0Ykzs39fe/wEh3EG/RzVj28/5HXx/3Z+?=
 =?us-ascii?Q?+/XVqG2cYxeYBg5molmPWLWt3uKTO92H+2JeHTJfM731ksf1Ni9+j+FAp5lM?=
 =?us-ascii?Q?DcuI0YgXXfbZjMtxZ5/C+es=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306d9ddc-241f-48b3-f834-08db2ec1777b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 12:47:47.1151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcROmmuVL0MYPYF+oxbBxVEFPUQxD3VYe1hbqezonfSPdJ+iYbgfLicUnzqkimDc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK8WszIHZCrT8Vr04b2IsXYKxvuNdd7Ja2d+ojEOM5c=;
 b=UCFdLjqXJribQdHzpCbu35gU0U7eyvy3K7JGJPBBmqBNWpxmFatLzAWEAdDrEoHUa1D1PiFgbsCCraz0BpK0kEx7vB82fUjsCtoNgbugTC38NTeOSzLbeZMm7s5ZarNmkClSmQdyN1/9NPMWO0wrKOBODZ45vHFZ0VGyHlMMZ1k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UCFdLjqX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ibai,


> -----Original Message-----
> From: Frager, Neal <neal.frager@amd.com>
> Sent: 27 March 2023 13:21
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Neal Frager via 
> buildroot <buildroot@buildroot.org>
> Cc: Erkiaga Elorza, Ibai <ibai.erkiaga-elorza@amd.com>; 
> luca.ceresoli@bootlin.com; Simek, Michal <michal.simek@amd.com>
> Subject: RE: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new 
> package
> 
> Hi Thomas,
> 
> > This patch adds a new package to buildroot for building the zynqmp 
> > pmufw with the requirement that the user must provide an external 
> > microblaze toolchain.
> 
> > This is not really nice :-/ Was this the conclusion of the 
> > discussion we had on
> this topic?
> 
> > +config BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26
> > +	bool "kria-k26"
> > +	help
> > +	  Adds additional CFLAGS for Kria K26 SOMs.
> 
> > This doesn't look super extensible. Why are these CFLAGS needed in 
> > particular
> for this platform? Is this a per-SoC or per-board configuration? Do we 
> expect more platforms to need custom CFLAGS?
> 
> > +ZYNQMP_FIRMWARE_VERSION = $(call
> > +qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION))
> > +ZYNQMP_FIRMWARE_SOURCE =
> xilinx_$(ZYNQMP_FIRMWARE_VERSION).tar.gz
> > +ZYNQMP_FIRMWARE_SITE =
> > +https://github.com/Xilinx/embeddedsw/archive/refs/tags
> 
> > Use $(call github,...) instead
> 
> > +ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> > +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects -DBOARD_SHUTDOWN_PIN=2
> -DBOARD_SHUTDOWN_PIN_STATE=0 \
> > +		-DENABLE_EM -DENABLE_MOD_OVERTEMP -
> DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL \
> > +		-DCONNECT_PMU_GPO_2_VAL=0"
> 
> > All these CFLAGS are really weird... why isn't this part of the 
> > zynqmp-firmware
> build system itself?
> 
> > +else
> > +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects"
> > +endif
> 
> > In any case, this should be:
> 
> > ZYNQMP_CFLAGS = -Os -flto -ffat-lto-objects
> 
> > ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> > ZYNQMP_CFLAGS += \
> >	-DBOARD_SHUTDOWN_PIN=2 \
> >	-DBOARD_SHUTDOWN_PIN_STATE=0 \
> >	-DENABLE_EM \
> >	-DENABLE_MOD_OVERTEMP \
> >	-DENABLE_DYNAMIC_MIO_CONFIG \
> >	-DENABLE_IOCTL \
> >	-DCONNECT_PMU_GPO_2_VAL=0
> > endif
> 
> > +
> > +define ZYNQMP_FIRMWARE_BUILD_CMDS
> > +	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src && make \
> > +
> 	COMPILER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIR
> MWARE_TOOLCHAIN_PREFIX)gcc \
> > +
> 	ARCHIVER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIR
> MWARE_TOOLCHAIN_PREFIX)gcc-ar \
> > +
> 	CC=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWAR
> E_TOOLCHAIN_PREFIX)gcc \
> > +		CFLAGS=$(ZYNQMP_CFLAGS)
> 
> > Please use:
> 
> >	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> >		...
> 
> Could I possibly ask you for some assistance?  I have implemented all 
> of the changes except this last one.
> 
> When I use:
> 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> 
> 	COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(Z
> YNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
> 
> 	ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(Z
> YNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
> 
> 	CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP
> _FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
> 		CFLAGS=$(ZYNQMP_CFLAGS)
> 
> The build fails as it does not seem to find the relative path ../misc 
> containing necessary include files.
> 
> But if I add a change directory command before the make, everything 
> works fine using below:
> 	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src
> 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> 
> 	COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(Z
> YNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
> 
> 	ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(Z
> YNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
> 
> 	CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP
> _FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
> 		CFLAGS=$(ZYNQMP_CFLAGS)
> 
> Do you have any ideas why this would be?  Normally I would think the 
> -C option would take care of this, but I am unable to get the 
> zynqmp-firmware package to build without a manual change dir step.
> 
>That's because there is a hierarchical Makefile. I mean, the Makefile you are pointing is also calling Make and providing a relative path from the expected call directory. I guess the only way to fix this would be fixing the Makefiles in the Xilinx repository to make them more flexible.

Thank you for the tip.  I am trying to figure out what the issue in the Makefile might be, but when I build outside of buildroot using the following command, the build works fine:
	make -C lib/sw_apps/zynqmp_pmufw/src \
		COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
		CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		CFLAGS=$(ZYNQMP_CFLAGS)

It fails just with replacing "make" with "$(MAKE)".  Do you have an idea already about what would need to be fixed?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
