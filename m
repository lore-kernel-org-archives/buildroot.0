Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC014C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 05:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 345C640C3A;
	Thu, 13 Oct 2022 05:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 345C640C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mKqQDoXof-8; Thu, 13 Oct 2022 05:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F768402E0;
	Thu, 13 Oct 2022 05:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F768402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2BD1BF576
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 05:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12D52402F7
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 05:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D52402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvkl8GHXboIn for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 05:57:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CAE7401AD
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CAE7401AD
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 05:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7fcCaI8dfl4QZ0Cjr9fkyRkmR7ZuEOBOssLfaFm7PrLW3hTVVqEH/dJbUHm/NnPS7+jJR1Yt/N5MYKfF6IPZ/V1Gobgyf4rNQq95JMj6cr/q2QwRZm6ntsGffCBEqmDQMBWqoI6AtalUpbKjKbek46ZboRTq0DaurCgR9AZM57C0dONeZbQOSVOGqQuCw3dpSWl8nb4B9IJXAqAhxEKjDfbxkOwY/JwBFseG73qd+0tIomC+9120hAANYIclRdgXt+y54InLStztPnyYfLghhYnG2Fil8Nu7vNByEskijdQdcb3Lf6ApF6EIzsRt11X09oQ88IihXn3Om4RkGBvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpLdR4BZe+aw+NXxTJ9YegrA8sLxT/a+S2W3CgzhGg8=;
 b=U8BICRlCozg+eGTDMLvK6mqxzc021fK9/IksOkHweLNwgLy4/QaDOmrD/dzeiF0XaflrFmsHKwOU5lhH/M5y/BclugBgUWdY2JICUWO39PTxcmbczRHwp8L5XxAp8Ty7HaCw1jR60xekGH4oAw9pEQPH66zqIzOdAqoThGZyLUjbGjxi+h4jf5YO+NfId+XLyq2GxY6Zi0tkG3bVriMg+Whx5qkGAUAni/1bjQM2WnWpH50P9wnLzMtNHfq4Z9SiMu2Q32fGtDCzU0xz3l0OqVzvM+hrtM4KAnHvweMGMQjAIXGwQE+AMLeDPihoIoAockgjL9+T1/i9hWod2ElCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB5007.namprd12.prod.outlook.com (2603:10b6:5:20d::18)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 13 Oct
 2022 05:57:23 +0000
Received: from DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::863b:7437:18d9:39f7]) by DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::863b:7437:18d9:39f7%9]) with mapi id 15.20.5709.022; Thu, 13 Oct 2022
 05:57:23 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
Thread-Index: AQHY3mO/5f6jErhqgU2i36HVqPyNE64LNu6AgACcO6A=
Date: Thu, 13 Oct 2022 05:57:23 +0000
Message-ID: <DM6PR12MB50075AD3D83E1AF519324C86F0259@DM6PR12MB5007.namprd12.prod.outlook.com>
References: <20221012175426.32367-1-neal.frager@amd.com>
 <20221012223315.68f43720@windsurf>
In-Reply-To: <20221012223315.68f43720@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5007:EE_|IA1PR12MB7664:EE_
x-ms-office365-filtering-correlation-id: f1f79fdb-bf0e-40a2-5852-08daacdfcc99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uGCIj8sAjJVY0XDRubvztiJ4FrM1WGs5+iVP5AXHnb2FUyQzwUi7lSj4xHevwiPlxJ2t9ZrWd0ZqIDKojI1WHuBeGn+3F2CgN5gxBZyXtTOkb1m8AtwzN29fmQrkKJIXb7lwi4wdpNz7hHr8JComjku8NItuK+D1PD4GOE1YnEmaeduVqDpZ08FDcQbVmT1iiBK4Yh5JcPO+flHFteGON9CmXKfHvMhYXi/0UrDAx6xLQikpPkEYsHT5Wb1+KHQkQ8jI7HhtZJzE57PG9mUnB05qnPq562D5vRWUd53509uSVlc1Xvy7i9WZQWOaLFLa/50dLpfo0L6zlguxpwWy5FIeyZtnXGRPxo1nnOSSRG96LbeBTYdJp5klLsfv4IM4GLgjjWZ2P6ugfsbOjcupZiOOXvcGI9992EbHcsRCy0rIf7pR4v/DmNs6d9cJlI5cuYi/7CsljR9OibrJ9C7eXYPfUVMm+oEZLjY1TpLXYTornMWIogKpnZ3f3G8TDDuGG96veQIFumF67q3Dfb/2mTkjkPE3sdLNeCXv1F7bGLwIRvMyksp6Khs2hgOPPFiQ59XvB50VZTggrlL+u51vl/LvU5kCpOgPJAFMM3ebOF0n6jIq1CNRZE0oG7iuMl+zGTz4KUxmcZkSCrCukhdjH1qNCnINdmpSkFYwsXGqViCeWNvn+HwUI6AmNQOGF5FBTI+Tj2HrGaDU/o0Jmkx7ajBTI9JP+WDZaWrYtbzQkgprY2iAprXuUSHgIXCFVzCDRIeqOvdjJcHhwydZyLzw1X+MrZSHqLjHXN3zenovKIkEwgoVL4rwXSjmbeksWExzsStmm+JCzUpxDwDQL/MPki6KL6Pzoai9nOONllrbTWuKQPB8s+McyIpOV/192Ad5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199015)(186003)(41300700001)(966005)(52536014)(33656002)(478600001)(8936002)(71200400001)(55016003)(38100700002)(86362001)(66446008)(122000001)(6506007)(2906002)(7696005)(66556008)(54906003)(110136005)(9686003)(66946007)(4326008)(8676002)(76116006)(38070700005)(64756008)(316002)(5660300002)(66476007)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ek521EbWdugBlsf+xCeYRs9f8ZkSiDwllGqKjJymjOqV4C2CTo4fZrZ4X3FE?=
 =?us-ascii?Q?FaNu6fE5eAW6UO6YN37i2oKhnVH1Z3OvubbHOI9aN2e/kLCyT8RtDnjcyqwl?=
 =?us-ascii?Q?rVT1Rw4MiuQo1+L222JzTlIfd7L+83WADNvdQSiVRd++k51Z/r3bzCgtv3eJ?=
 =?us-ascii?Q?2O3GCXutqzJKT6LmWTsr66AAIt3MSUD6TIkkyurod/rnHC8NQNANCniDwqK3?=
 =?us-ascii?Q?ytKugstKBmgAmxpwTjQj/9W3VP/w5KgpC4lBrMCMfY+pQCLP+QFzo8fDdjpZ?=
 =?us-ascii?Q?+Bf5RxFhVBNbp4of2HroKkwTem3JXV8Ta/OM5f/F0JDFdemK2gTg6Y+kwFhu?=
 =?us-ascii?Q?neuJZ1WaF2Ssfk4CwhwIH6RGJWZA1OpSzGpj3yWaIfHRyObVyR/qb9rPRFoU?=
 =?us-ascii?Q?UGo7FyBxEr9N+fnEqM1GH4yQ+d41Z+HE3BZCG8J/iuJaOpubtDPiDKh6BKng?=
 =?us-ascii?Q?umbcvN/D16tfg969dFB2gM9kmZqjnNmrKf+uzEsVbCzTPoQA5SbzcT6pXMSS?=
 =?us-ascii?Q?0KnY3Qz1SyqMvAjz4rbzjloH/tBKVHdvOopWWxDcOb3ZImCZV9q0E4reKhyn?=
 =?us-ascii?Q?RjlsLU+Te4bdhS91Gr+QqiR87HDtIjH3ghC815jmuEs1u3KGHyHNOd/oLhmN?=
 =?us-ascii?Q?3ZjgiZUzYh4SKzJtOoER8TbZ5bZzIwlVB9pinvQkOGmV258MaHOPpLzPzzBe?=
 =?us-ascii?Q?ZkA0MY0hT/Q9ZTsbE7wjJjHPPu5k/dFqQrTHhIU5zo85LR8CMeUnwN+j6iMa?=
 =?us-ascii?Q?IXpMADyUJWMDI8QhP+TYDP/0WWmW8KuX3zRrDoJ0cx5PS1Vm3e8dMdJVpmeI?=
 =?us-ascii?Q?/lljeFcBYdM+/kmMletZjOOjHHgClnfrxvDE8TJIz65IXpKnsYEF4Bzp3Hs9?=
 =?us-ascii?Q?3VptBKi2jv67LLOWuOI0CUhwjQI0FF62865gejqBgUxC+mrTyvclzOiaSNsE?=
 =?us-ascii?Q?nse9DbiijawuAP/oFpRy/AglbPGJt+TyH6qBHEUZsyYhJjnUnbpOrMviVgh2?=
 =?us-ascii?Q?K9myFMzGzsZjFR6G68itOJNVJdtRMrTX+53f+P3fW7vqkZ+AAFxFW7hUJQGS?=
 =?us-ascii?Q?kvCrc3UUfIzeV8QhOw0zcod/cUKll8nujG0fgg+w16tqeKA9qv98I+KKjove?=
 =?us-ascii?Q?mpUu52MpjLkdsMAOsUbbf4F55N6ZXmC6L7Rlw/Q/eQjE/kyeCkSBY8P5GLdM?=
 =?us-ascii?Q?6nsLjMfMAz8xyBjAvBf3nqgImdUvJqnRKTyEgKfNkaRo6GQF6ZsXc3f+ULsJ?=
 =?us-ascii?Q?fH0B4Nbn5ank0s+wrO5aGvX9TB7Jlyuvio05cpwiabX1aHqq5og++JpD+hUX?=
 =?us-ascii?Q?iHF2MZmOguRf+j3P+zhs8yrOhtBCPh4NX58fYGOtLgASDBwVvWoBqMs1oY0O?=
 =?us-ascii?Q?4al6A13m5p5vUpnm3qpEwUNl5YeSm1m+fIcsh1+VTOrcs9ivEzHitzxUz3eW?=
 =?us-ascii?Q?0yHGhX6/F7GQSVncEgXE8YRIGRNR7mvoelAnNVYJGIAYvZ/YKe1CtqE5sdq5?=
 =?us-ascii?Q?B3dg6a8/JBItqq2KMTX773c8zzwG7yc1WZAQ27DBbAOqz2yt7zSduLW9OPZs?=
 =?us-ascii?Q?jZpQYG5bo3tg+aQAbTau6AzpMwSqTYwMRqcibmf+/OEBvh5LkqaEqyfeWDXD?=
 =?us-ascii?Q?XdOKo438BBtkGXecXMGmCHE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f79fdb-bf0e-40a2-5852-08daacdfcc99
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 05:57:23.6476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HE4POIDISdx4zsbHVuZbuYMFGpg75XYUKe6iDcodhs5HVXrcIkS3cs55odNRjp3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpLdR4BZe+aw+NXxTJ9YegrA8sLxT/a+S2W3CgzhGg8=;
 b=PqRTPV67eDZgpXfO4Pm3bJtp4TrTIBqA3bdAPHkryESeYt2ohL0PxxwOPMV7jgPcLTkn5WBcqRkXsxEcL3pRY8y/+Poxn+x20XgUzaNqIZJ9JGHM5NeuhmI/14RHMO4M/P4pd+g7MXm7tSusd1hK1OSEL5/dFsdzK+publb29Nc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PqRTPV67
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thank you for the review.

> This patch adds support for zynqmp pmufw.elf files.
> It will allow buildroot to use pmufw.elf binaries directly from the 
> Xilinx git repository built by petalinux.
> 
> https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-fi
> rmware
> 
> It will solve the problem of the pmufw built by the 
> zynqmp-pmufw-builder where soft resets crash.  Details of the issue 
> can be found here:
> 
> https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/
> 
> Instead of using a pmufw binary built by the zynqmp-pmufw-builder, 
> this patch enables a pmufw binary built by petalinux to solve the issue.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I think the whole commit log is a bit confusing. What this commit allows is to use a PMU FW as an ELF binary in addition to allowing to use a PMU FW provided as a raw binary.

> And indeed, this will allow using the PMU FW provided by Petalinux in addition to the ones of zynqmp-pmufw-builder, which is the motivation for the change.

I will simplify the commit log.  No problem.

> +UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH)) 
> +UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))

> Spaces around = sign.

I will take out the unnecessary spaces.

> +
> +ifeq ($(UBOOT_ZYNQMP_PMUFW_SUFFIX),.elf)
> +UBOOT_ZYNQMP_PMUFW_CONVERT=y

> Ditto.

> +endif
> +
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> -	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
> +	$(if $(UBOOT_ZYNQMP_PMUFW_CONVERT),
> +		objcopy -O binary -I elf32-little 
> +$(UBOOT_ZYNQMP_PMUFW_BASENAME).elf 
> +$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)

> You could also write this like this:

>	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
>		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)

> and get rid of UBOOT_ZYNQMP_PMUFW_CONVERT entirely.

Thank you for this!  I was trying to find a simpler solution, but when I could not think of one, I figured someone from the community would help.

> I was wondering if the usage of objcopy was correct or whether
> $(TARGET_OBJCOPY) would be more correct. But in fact none of them is perfect I guess: the PMU FW is a Microblaze ELF binary, while
> $(TARGET_OBJCOPY) will be an ARM64 objcopy, and plain objcopy will be the machine native objcopy, very unlikely to be a Microblaze one :-)

> So overall, I guess using objcopy is fine here.

I ultimately chose the host objcopy because you are right, the pmufw is not an ARM64 binary.
I think using $(TARGET_OBJCOPY) is a bit misleading.

> Best regards,

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

Thank you for your support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
