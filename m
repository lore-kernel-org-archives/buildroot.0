Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED88C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 12:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF35240AEE;
	Mon, 27 Mar 2023 12:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF35240AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiAiykg0g-dt; Mon, 27 Mar 2023 12:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F04CF40AF7;
	Mon, 27 Mar 2023 12:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F04CF40AF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCC671BF409
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F60D40AF9
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F60D40AF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfB0RDbNloAG for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 12:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA0940AA8
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::626])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AA0940AA8
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 12:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgbyVMmhJzsRn+Ewpbr2D7mSsRQLZKa+PouOTt/kr+ERUE2NSaBklnnBZg5bfHqzgu7WwstaLeaUjkTkVvgUlhah7r+QDNTV8cTEQun06et7wCuBepkc0KQrHKXxZZ4c+49MFNPijGQHPTvPq476x7qe5QyclmMGUpa2y44k6ZLdNqCgZDdQPqHLSpzZXkc71YOBxiTaRwZqO//z6CDwEGg2wCP8y0EaS91eCnse9bq229SoLrOOf1v+rrDzIkROZ7TDap+m/p/di0Sd/bNVwiHsoHgyGvOoE3rpCMKzJir8J1gvJtGGMdXrWwUpoGxdWt7ggkOSfT4IdWQKIYzd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCiYplZT8mU23lCgwhQ8Y7vcVuLjYQ2U8ibFAz+5+qQ=;
 b=FsH2w3N9HQmyp52m+Xxc6lwo64dqysG4yF2AmJ1EuwDI4BG4g5q/jrbu2MItuPxsBlEzEd2MyKjZ7xKrYuEq+YsIbMIMaQj6sZNzUusjr82+XiIx7bu1brnr5GgCF6JsnvB6AG/P3u6bXADiSyLLsqdCrgVptGisV5AiCVxuwU3WlrUy/HLGfHEZsfdWfeHnerONrXhynqQ0ZUYPvmacp3C9nAwq3h1l0A90vT1MCMxeRJaBf9RrcJEMpN77BshzGCmIdgQ21f9nFKBdVyAgB+y1asXfhQ9+wGrCn0UocL3NGU1Ph1YFw2AaAVHlJ5PNLtK7WQod9zJDgud/JDLCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 12:21:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 12:21:16 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgAEO8lA=
Date: Mon, 27 Mar 2023 12:21:16 +0000
Message-ID: <CH2PR12MB50044744141F901308BAAF8AF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326220543.057f381d@windsurf>
In-Reply-To: <20230326220543.057f381d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB6392:EE_
x-ms-office365-filtering-correlation-id: d7d0b423-a1d0-42bd-184a-08db2ebdc35f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJgkt87eYEBqU3gUV9wVXOLvVS3/sqn3n1U39YyiEum+jDLqWakm7Gi2gkug235T+RaZ/7tC2p6IS1ukf4ehEu6SZWtUqTU/ux2BaQEIpeO0IoemSyrGDgI9N6fcGiaF5Ldli+ghQB61W8h7Y53BKLRtLW6wTQZR0+JMsjjfFTQKOp3xtiIKeGS57tWp0nOMiPFIxKtzIlOxX5hgk2to/H9tYjZY9cqzywQImaq0QA/iTj/B70ogmAliFgWnPZmLHbJEpynqtpRiWUXafBXG5NyWuDuWVLg6komQzNj6uhK6jrNMlE4tcSIot51pj6oiYo/2NEUmOMnOD3ux7DIDqgzVDMwNFNT2TihJ0z39khIG+7I58gWst2IsleT55AKhNT1JY3riSjHE9VMIv5kVmv28xWApGcVMiUKmbVNEea4bSnRxygGZ8MPJJnD30Jx0fFJ0yTF9c4vwFVC0yuNx/zMo9tLGC3MBRwmAZJmgkS82lRMioxLU6gnvP5FmykGy0KUdehzsw83BdpcihuvMabVGe7mHNSUYhpqAasQN3WitUCNo8Ha8StgRRFMOFzxxeTWZgt/ILppGkUDn7xS9MLloj0wp8gkSPw4XBjAc1tM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(6506007)(9686003)(41300700001)(186003)(55016003)(7696005)(71200400001)(83380400001)(478600001)(54906003)(110136005)(316002)(4326008)(64756008)(38100700002)(2906002)(66446008)(76116006)(66476007)(66556008)(66946007)(8676002)(33656002)(52536014)(38070700005)(86362001)(5660300002)(8936002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uZlzav7S8KE08WIuEjvKlqyI8+DLNdMBTC1OeP9eUmaAEKeI1Ne5YPFKgEQ3?=
 =?us-ascii?Q?56qTESEXGvzBHkrZGog5VPlK5qA/LQ41hIWJ1yEjbVFu5slNOG2BF7PvODMr?=
 =?us-ascii?Q?Xrd04N05vPo1/CixyDyfcV0rZ83CjCrJoFUsEB4wJLc8jfE8BexpygyHZePS?=
 =?us-ascii?Q?8OVo1Gxly2FcoO03rRF8e4v/OiECJWDNv6s+gg10qQkc+MDzG/ftlAVhM/79?=
 =?us-ascii?Q?OHob/mKj7+xu3mnSkHIM7OeW3PHHo8RPe0/LICzxVAAJ+mfQOM7cPk5OsRzW?=
 =?us-ascii?Q?SAnWJzl7ionyY0UzuSUT/1FPyVws/bj+L8s/RzuaZAG8Vg7fk/WacVd8TApj?=
 =?us-ascii?Q?CUS8e6t2rW3m7w7QJttqIbbRQ6PmXdMr5UXjqH0NvX0XuPmCFHcEefyPZRTZ?=
 =?us-ascii?Q?jQr0gEsFKafi7F89IZmf/3W2IbVftkD34paPOS6nz8tYFQ7z8iRARk9mPKFs?=
 =?us-ascii?Q?kiVMDp14wDGzSDzqNnZuZIlkYZeCcor8vUXaP+knjEb5UIsJbHJxLGSespHp?=
 =?us-ascii?Q?dDzHCwbgKD7+jL/sGai6JJD8MAShswTDRNyGq1r7iMcKy6ztNWellqPejfCD?=
 =?us-ascii?Q?DB19X7bEUtGaEGLw6Dw35Z32USYoUEup9Ityl79JxCP329GWeqwAXbRdKeq8?=
 =?us-ascii?Q?Ng1tnqb5osxIKlzfP6impjMfBB2bHddo7Fm4im6OTm3RjEB/cNCPdLetMym9?=
 =?us-ascii?Q?UkeIxB9dhG10GfGU17wyX5zm2aQD6WTFPivWmWoUX8vxnR316gArfzpiC58H?=
 =?us-ascii?Q?zurwmRwsJ3GNL0e0DIlCiVm9wKYK541B/T5yfSbBb5AtpTwQLFOX5zyAem52?=
 =?us-ascii?Q?IOhS5vjJmg7kIY+2Yl5oRzk+IGnSgDQml2T0ZnsLdqx+K1QUmp3DHAt/EK3P?=
 =?us-ascii?Q?gyWmdbQffYPfU9rJkdewMZGkQf+NnrVy1tfLZBqtDWmr+DcrwFSCghuBB7Yi?=
 =?us-ascii?Q?og5G1/2pgHuYB3N5gREVrLm2FXLODsc+jmbZTcZphs8sSwsgcdTqGhEIRjpf?=
 =?us-ascii?Q?MsjAm2ECB1+8HAGbIHvNCBBAKp9hd7hi9if2bg2iJXuiYj+fv9c3puyk81bD?=
 =?us-ascii?Q?IQDZ24TBfRsEprtWHsxg4Q0xVVOYnJnfVRXx7qm65xGu3+wW5xICsA2gC9eU?=
 =?us-ascii?Q?pKXwFPhqHOwFdGMMB6EVJX3NAJVNmy5ivgqZuBe01Ifm6Tg70uRWrOuilIOL?=
 =?us-ascii?Q?2q3APi8ntG4H8K89/m3dLIsSn31CHSJ92C/fyzpsgZMrD29xwl3UhLlmTkZH?=
 =?us-ascii?Q?j/ytjcsFe6KX7PlOghU0wSE43GRTlD0pSGZNOg3TigBmjKTzZ1drkI7Ous7L?=
 =?us-ascii?Q?WyfoCQicrIpZoNwMIr1eGI5cP+1Pvq54/yMLIDhMzAx4jF9gwZ7oWrviYmu8?=
 =?us-ascii?Q?Kgl47u435KSILWEVjVYxlxx/5Yot+mq1aLadyPweB9AU7l8pghDKs3psoF7Z?=
 =?us-ascii?Q?rPjB91d28NoeNBDTrd9U2Gg90NbeEfdsb2gFgEmbP+u3ztwAyYpmnhXANcqw?=
 =?us-ascii?Q?4oZLTULey1Q4uxrghOJCJb4FSvEt9RvNo9nKRTq546lfCKycA51evphrpxgU?=
 =?us-ascii?Q?/ibpDvPLvKqVRM1FRjNhwOqVQBxydPOC8y0J5LuVsRpkoIjRkluL9vFKdZdS?=
 =?us-ascii?Q?KldKXwIW/+jWW3lu/YIzy+E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d0b423-a1d0-42bd-184a-08db2ebdc35f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 12:21:16.4373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br18Q7iC57Cyr0bZxgs8mzMoSWiFNbFBO3FKO36czdAOkJll9X20YL8AOp4xW02M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCiYplZT8mU23lCgwhQ8Y7vcVuLjYQ2U8ibFAz+5+qQ=;
 b=bUe/ZrzCZ9rofA0e2qjaKLmj+Ww4d9dVWCtO8lyCMYAsScTdoEO+IsvN7ppx9jveixSiSGcoNDsf2AV1thvETb5D/hN9kLWNqlFfRq6mkVLADlazPlVxW6Aimt5XwBo3pWNqmd4skYPBMS9mXmaGWmbnO5nPKsAOOm+Yt6joBgM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bUe/ZrzC
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> This patch adds a new package to buildroot for building the zynqmp 
> pmufw with the requirement that the user must provide an external 
> microblaze toolchain.

> This is not really nice :-/ Was this the conclusion of the discussion we had on this topic?

> +config BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26
> +	bool "kria-k26"
> +	help
> +	  Adds additional CFLAGS for Kria K26 SOMs.

> This doesn't look super extensible. Why are these CFLAGS needed in particular for this platform? Is this a per-SoC or per-board configuration? Do we expect more platforms to need custom CFLAGS?

> +ZYNQMP_FIRMWARE_VERSION = $(call 
> +qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SOURCE = xilinx_$(ZYNQMP_FIRMWARE_VERSION).tar.gz
> +ZYNQMP_FIRMWARE_SITE = 
> +https://github.com/Xilinx/embeddedsw/archive/refs/tags

> Use $(call github,...) instead

> +ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects -DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 \
> +		-DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL \
> +		-DCONNECT_PMU_GPO_2_VAL=0"

> All these CFLAGS are really weird... why isn't this part of the zynqmp-firmware build system itself?

> +else
> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects"
> +endif

> In any case, this should be:

> ZYNQMP_CFLAGS = -Os -flto -ffat-lto-objects

> ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> ZYNQMP_CFLAGS += \
>	-DBOARD_SHUTDOWN_PIN=2 \
>	-DBOARD_SHUTDOWN_PIN_STATE=0 \
>	-DENABLE_EM \
>	-DENABLE_MOD_OVERTEMP \
>	-DENABLE_DYNAMIC_MIO_CONFIG \
>	-DENABLE_IOCTL \
>	-DCONNECT_PMU_GPO_2_VAL=0
> endif

> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src && make \
> +		COMPILER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> +		ARCHIVER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc-ar \
> +		CC=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> +		CFLAGS=$(ZYNQMP_CFLAGS)

> Please use:

>	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
>		...

Could I possibly ask you for some assistance?  I have implemented all of the changes except this last one.

When I use:
	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
		COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
		CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		CFLAGS=$(ZYNQMP_CFLAGS)

The build fails as it does not seem to find the relative path ../misc containing necessary include files.

But if I add a change directory command before the make, everything works fine using below:
	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src
	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
		COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
		CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
		CFLAGS=$(ZYNQMP_CFLAGS)

Do you have any ideas why this would be?  Normally I would think the -C option would take care of this, but I am unable to get the zynqmp-firmware package to build without a manual change dir step.

Do you have a clean way to fix this?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
