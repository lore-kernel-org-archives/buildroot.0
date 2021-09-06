Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7817AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D8F60F43
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11D8F60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D034440470;
	Mon,  6 Sep 2021 12:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyxGA6iGleDE; Mon,  6 Sep 2021 12:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D52F40141;
	Mon,  6 Sep 2021 12:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5651BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B68A140359
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=nxp1.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7nahvVSVjw3 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:45:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B3334035A
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmsq1XvuxqpruhPBv6A4HMxXZz1Mrn/dTPAxFloR2tYiAIrJTK3twu6HLlOErR7+MDVitQaFI9do/Jhp46KBbWDkm73p4SR8KZzBPEXZRsOr2F3RiREy4IhiJHNJkACZoe2BE7AABqlkTzYaDQcN1T3mALsXDcPhCrXVIv+uNDB8jWhrgbsfRXV0esYUevDK+OqjsUAcECbdsZhpomWwPWhIQM0VAzU9IYTukdik31BM9FLhvS3fdHtkKCeWLfhvdB70CGVOk3yHeOTWIBf1kCykYVN5tuh2RjiOFD2kpbqQmkNoqZPVyj7PaNZZqKXchFG5/nywjoU9fAdg/v9mIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3FG7S90vV5PI5EQamEqdiVu3FOE4tTGNSz87v+tfYcY=;
 b=WYrZBpeYwLFEPsVHuQTFgz25xWl35k77hSyJ9FnOpsbl/VM4WfSYiu5J2bR55+ZHbLB/sSJonm7TXaJG+8jlzH8PjKoOYyh1mlMIlAUjKJ1iTn62F8jPoGHuKHUPuw21Q+aJ3Bdkyvn8BZwcxZWEz0pYljfbBj9u55kQI29JdMAGAPBFgL2kRD97IVOoftbD9s2ke43dZ9CcJle5BziYN3OlpBkBA59TaKWonT6ZQwE4cQzKvyJz0lr77F7Isn+6nhHLywBlU/8Qk/u5ixhReAwyDDv/Hnhk0WIkubyX05iZ2a3a8kKvfZjyZlwfKWDUg5WFhDfur15dWUdQL1wDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FG7S90vV5PI5EQamEqdiVu3FOE4tTGNSz87v+tfYcY=;
 b=K5NhkAvh28KMOJcwHQIbSjARdVHXYgUo49HcQGyTq2sNKR6EqNbxEz8vdWhxCgdIzg7Jja+JimCG+9yAtczpl8o+VTrh0EsXcUarim2uzXFNt4PdfHSgvQUmNpFwQSyI0cOmibjd/vhUgw003S/4xkdWEiWaQH/WwBmyhRkiFms=
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 12:45:10 +0000
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::f573:dab3:ac44:45ac]) by PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::f573:dab3:ac44:45ac%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 12:45:10 +0000
From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
To: Heiko Thiery <heiko.thiery@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] boot/uboot: copy IMX firmware files to uboot package
 dir
Thread-Index: AQHXowOQdGcQMvB+i0atJKfre3rlV6uW8lxD
Date: Mon, 6 Sep 2021 12:45:10 +0000
Message-ID: <PAXPR04MB8863813E1952003264B49565A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-4-heiko.thiery@gmail.com>
In-Reply-To: <20210906094214.6142-4-heiko.thiery@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64285f56-2478-4cd0-0dfa-08d9713429b6
x-ms-traffictypediagnostic: PAXPR04MB8441:
x-microsoft-antispam-prvs: <PAXPR04MB8441FC4198A448341C8A3176A7D29@PAXPR04MB8441.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsKdsvYfKV1o3j1258twvDAOQiNpJAkhFTG81Jp+Iq+ht5kBQDwSddDpwOojwPk6JYaohFwIELmOOABAvJWwIzhD9HhnnNwhFvHAGArSkuDiPit4Flt/eoajSKNo/JnG7JZtDuLKZk+LOgAXr1QIwQe1pslDO4I1/6zKlb+J5v7i+fGGZkdvWYcizo0rmH4JrFc7i42ToBGnQi+38JAUoyEDdZJv+DDeV5L1sVv9Oq2IwJz2TR6+XggR2eO+raYWZ4lwjWOS9QrSK9oy7i5G69D3embPMIVNN/Wx7Hr19HFgEv0whGHFjhSB+3kNATuUV1ilt0TQH6huFL5vuQ5VRVLF0BANKOHK+SqDSGoX2Jk0RK/izSaTKE2jxOmDOVADk05eZDwJf/lWUudgdkFlTyqcYFpLXVrP+sNGKLONN0ZIHKdKPXlsLKNVMc+R4WDHjNtaBxvLH+n8aJ3c9+xIiHv+zwrFARhjCJNX9a6IRxutJ3eFkmphQ9ackFlstE6hG9+PfmGrnOO3qm+GRNHnsOj7o6f8nFIr+UkwK9kfeA1udNblZDfo5VW+rPmgejrg1GVX21m1DHL7PbzBxYhpuj8dBEeRBeb0mfwTy0i3RbivdPdl/hOtqc8CswA29mtKRhnrSoozXKrrtO8IKNTv4tHy9MiTZplcyS0qkUrdGzlo72/cEKRGngKVVIS+KoTs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8863.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(38070700005)(54906003)(186003)(9686003)(55016002)(316002)(71200400001)(26005)(38100700002)(76116006)(86362001)(110136005)(8936002)(122000001)(2906002)(66946007)(66556008)(33656002)(64756008)(6506007)(66476007)(66446008)(8676002)(478600001)(52536014)(5660300002)(7696005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?74iKfkvasfS7zNEZvl/jS0lyA0KAOIFpNomjkixBDTyXa6U1KaPBcllvuu?=
 =?iso-8859-1?Q?xrb7RVG8iVCcbsJE/XnhreCCnxG9yXjMgyJoqVEQGG4tvDinc6pp8T1E2N?=
 =?iso-8859-1?Q?4DPBmTL/dTL+dtmeC4NSwLbnSXZOJmMIuu11htG6Y92jittBwUhEBgrkcz?=
 =?iso-8859-1?Q?zTDhRvyuKMt3fDC/jHU3TYB3J3m2MR4eiWknTB8AO3bob+7bXvOQPQfycA?=
 =?iso-8859-1?Q?xOMTVlJ/khyWAX8up/B+3qs0T7AfcsJPwr8Zocx7eD4qZHFvOHbqYLjcSE?=
 =?iso-8859-1?Q?3dG/i/x5pXYdWF4fccz6yiKS1Mk8+9Zh8yk8kiNt4kDMJwdeQGts1cNPl0?=
 =?iso-8859-1?Q?kblzj/VT9KI/dMR32biaHxhNEGyaMMf/ce6QUYC3XgsM1BG59Az23Oawsc?=
 =?iso-8859-1?Q?A4yFWKnB9sjo83rtPBB4AM25PAf1ve2NO44DPKwY6Ig1kZNYL/HS00oM81?=
 =?iso-8859-1?Q?+O9q/HyGTIZWVuOC5Jv+RKjlE++HSXzgcRgGIUUFg7LaCrq0G0daPRqpne?=
 =?iso-8859-1?Q?7u14sNGSp0DTKSYPAvdC4oFNLye4rxZoe4c61Fhw62s6OnFehLynOlEEl3?=
 =?iso-8859-1?Q?zkpWpgoxxna6RUlL2juOTym2ZGSvuFgxt5faPdloeM5cW50/KvSADYkWwa?=
 =?iso-8859-1?Q?6agC+jtj7Qo6A90wtVySMjNAXvlTELo1k7aN2PXH1+DGNrI9kLy2otd+7Y?=
 =?iso-8859-1?Q?VB0CuJYiNf3rRQ7bu/SYZk/wZUXoMHGWUe4dQAZwfh+6lwBW/wyCqWEmOF?=
 =?iso-8859-1?Q?CXOCpqI9XmWAN5vjqzG8dG2weH8uELEr7wXMBOT7j1j+BGywfv8CPm3nUt?=
 =?iso-8859-1?Q?rmqZxOfg76d8JGrg2stmUW2r//r6p1rLHIBCUJbOpZA/ybZirBPfSI5VsR?=
 =?iso-8859-1?Q?0sOh4Yyram30uX7MW95pXVpMf5xYQmX0JZNNJMYonNOKM+74emgOu2T6Qk?=
 =?iso-8859-1?Q?B8xf0zGIM+FwWPO2NDocM8FdBYI9zNNTxvlzgyeqrb0KMRDQ4ukVJIrWyu?=
 =?iso-8859-1?Q?+VhYglFCUOjLOC0FygPK+8diDP01MO24sKW4ic5KwGtGipgZq1qaBqv/Fw?=
 =?iso-8859-1?Q?pw+MWiHQxLNlMrKBd+lRV7BmY+5ZQxKTmtbSGByz0OlcXeN7IG1OI9gqjX?=
 =?iso-8859-1?Q?+FusGouxPii8o8LEijIAhoLgDN2EOASxZwAi1lWobMYhovMh4whiyhHW1a?=
 =?iso-8859-1?Q?WmoowZuBoWBt2K3FUNRTqxm7NcLAyHlCgqtcOdo+5oXU/TswsHIqx7ka84?=
 =?iso-8859-1?Q?kfzgQHPTY6j+uC2rwPu4DZsUwp56ePEp2YNzx7X6Cf3GBaFTi7QuCM6FEC?=
 =?iso-8859-1?Q?TqKcFQGiLX0ksGvE0QpVGX/F7zUqtwN2HkUQMRs4ih0t7cA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64285f56-2478-4cd0-0dfa-08d9713429b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 12:45:10.1113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuzkNZvIZAt4U0CRqoNOZ6awYGQrAR9dsQksCU4TCBi4wOkWNX8wRqGgtbqGiOMF5WPuKT8EKBiyYUwGKWeXIi68SGqlPIpLmYx11TeT8Z7MYHC5f9xUW2RTXOBBkYNh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441
Subject: Re: [Buildroot] [PATCH 3/3] boot/uboot: copy IMX firmware files to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Heiko, 

Thank you for the patch set.

>
>If the U-Boot image is to be build with binman and one of the IMX

s/build/built
s/IMX/i.MX

>firmware files (ddr, hdmi) is used, the files are expected in the
>toplevel directory.
>
>Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>---
> boot/uboot/Config.in | 12 ++++++++++++
> boot/uboot/uboot.mk  | 27 +++++++++++++++++++++++++++
> 2 files changed, 39 insertions(+)
>
>diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>index 0854fb13cc..da518db118 100644
>--- a/boot/uboot/Config.in
>+++ b/boot/uboot/Config.in
>@@ -239,6 +239,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>          and that the OpenSBI variable pointing to OpenSBI binary,
>          is passed during the Buildroot build.
>
>+config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
>+       bool "U-Boot needs firmware-imx"
>+       depends on BR2_PACKAGE_FIRMWARE_IMX
>+       depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
>+               BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
>+       help
>+         Some IMX platforms (such as iMX8m, iMX8mq, iIMX8mm, iIMX8mn)

You could use "i.MX 8M." for consistency.

>+         encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.

Are other firmware binaries also concerned (I did not check the U-Boot code) ;
such as VPU, SDMA, ... ?

BR, 
Stephane.

>+         This option makes sure the imx firmware gets built prior to
>+         U-Boot and copies the files from the buildroot binary dir
>+         into the U-Boot source dir.
>+
> menu "U-Boot binary format"
>
> config BR2_TARGET_UBOOT_FORMAT_AIS
>diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>index 1a840d9cc1..cf8d6b1f39 100644
>--- a/boot/uboot/uboot.mk
>+++ b/boot/uboot/uboot.mk
>@@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
> UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
> endif
>
>+# New U-Boot versions can create the IMX specific boot images
>+# and needs the some NXP firmware blobs.
>+ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
>+UBOOT_DEPENDENCIES += firmware-imx
>+
>+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),y)
>+define UBOOT_COPY_IMX_DDR_FIRMWARE
>+       cp $(BINARIES_DIR)/signed_hdmi_imx8m.bin $(@D)/
>+endef
>+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
>+endif
>+
>+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
>+define UBOOT_COPY_IMX_LPDDR4_FIRMWARE
>+       cp $(BINARIES_DIR)/lpddr4*.bin $(@D)/
>+endef
>+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_LPDDR4_FIRMWARE
>+endif
>+
>+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
>+define UBOOT_COPY_IMX_DDR4_FIRMWARE
>+       cp $(BINARIES_DIR)/ddr4*.bin $(@D)/
>+endef
>+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR4_FIRMWARE
>+endif
>+endif
>+
> ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
> UBOOT_DEPENDENCIES += host-dtc
> endif
>--
>2.30.0
>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
