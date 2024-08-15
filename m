Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B67FC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 11:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8B640530;
	Thu, 15 Aug 2024 11:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFzESQhLlKbW; Thu, 15 Aug 2024 11:05:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 292B940477
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292B940477;
	Thu, 15 Aug 2024 11:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E51641BF325
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 11:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D076180E4A
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 11:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyCZfDNkV73y for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 11:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::607;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7495480E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7495480E35
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7495480E35
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 11:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOq3iNoHpZA90xnC77CTQblhJO1JNVwDzQ5ooGEGVL4EWH34EhgZzQW98GtS25+bQty+R3daJBTcb34Ty86zt5pOplgl6t3GjluBEk46WXzIPYRKz2mhdG8lfQz3KktWtbcCrX3IEIQT89nLFu/km4ppcp+SsYhSmokHpIs206Tf7QnbsyzZUsOmOumYc2xAgzvXffnAffk1ZgrzAtKmKPBRGgMrIH7mNwHyIsuu9H1+LcXUJ5RCFt4izNITgvux67bDTuOzC9jXmGCtcCQczrzFSeA+OGFqqDrBRrOG188j4+rRaXlPDE6jQAwE3VFvgmzHR4YGtdNeQ7ZjM+j8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfrKzc15AiNZpuOg6fqThQcPxN730rJNh6z6jmWHeyY=;
 b=N/ZDH7B8X2HvOo4Pd/2vlLhM2SEz7fxD2AhYaC8X8j6f9BQxUZdAGWJNA0HS5w9UJtOyUDY62z0H3fjyLgLWske/wAyEnbNUGULXdrputSagtJksVdc1NpLZ/ESkNEPTY9FlHBbWsycaxrMr4i48I5FTDMekJrNvo+2PfilD+9Ixr+wf77FOa7I8htyfBXw3LxupZlFWvQxZ9X4269nrHsHXGo+EsbplNdqx+QXJ/GmNU/R4/rlMZdRtzKHmJDn6WHdThEQtyeRwUGoxbJBV0GKMlYC9HWrA1r3FAk215XOtvbdOOZrRry4BvrpuZyl1lZX9Mx/rRltm4Jx18jSZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 11:04:56 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 11:04:56 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Brandon Maier via
 buildroot <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] boot/uboot: fix dependency on xilinx-prebuilt
Thread-Index: AQHa6nl1/a0gc6z2W0e0vz3LmRz2QLIoEgyAgAAdsEM=
Date: Thu, 15 Aug 2024 11:04:56 +0000
Message-ID: <CH2PR12MB50048B6322A7CC81AE996E79F0802@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
 <20240815111415.25844e3a@windsurf>
In-Reply-To: <20240815111415.25844e3a@windsurf>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6911:EE_
x-ms-office365-filtering-correlation-id: c9006f5c-53cb-4243-7bac-08dcbd1a18ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3qPYgrZxRX3Sv0HNatbZgFs6qjwOAx30Nj6uGEI8bLVRbM8Og510jDzy7AHG?=
 =?us-ascii?Q?qIr+EvU3khpUWiM9Z64rQUjwnaUEA55fzOciMA+z+MJYdi24V1rCmrrUbpyH?=
 =?us-ascii?Q?C1g97xGdXE4u98UNfPrcLmmQ/PMW0HIJAVXGn4DxPIVn+XYwfnh3jdn5FEcK?=
 =?us-ascii?Q?HYFUMN6nsIBlXOSdBWolosYHlLJJ1POtaiXxLX/3kSJIA6j1LM7nZzme/AQ3?=
 =?us-ascii?Q?Rg8XQm1sjk4wpk1PcC5oGw58Q2pL/EyhzVZiL1hdTyX7eNtM+1rWb0cnM6V+?=
 =?us-ascii?Q?2fxOCbl6t476EyLxsiG5bo12YizugQumTa+wjF7vUAapFKQurZ9ppJJC/yVY?=
 =?us-ascii?Q?9sl8iNTNkQ5uDPMLlfQmc/nMQsYYKSS4cm9HAG625rDtlSxZ+YaFlvhULKId?=
 =?us-ascii?Q?QlchTi/6N6WmQ9OkT6i8jdCluULEPENDN1V5ODFhKuGCe5VnOLm/eY4jQosB?=
 =?us-ascii?Q?nWrCn8fsP2D3mCgInNAyKwSvr61CkMJ/qrF/TnyOONoY1yBrCFKEQ9VkWJRn?=
 =?us-ascii?Q?2WOSK1O7DiMzVO+JAbLxsg3IJjTfR6L0ZcVTNSL20Da2Zdg8QvcpQHvMGcji?=
 =?us-ascii?Q?7S1bWWfqpMv4iDJX/DxEzOGo9tfTuQILCheBBZi+kbZfjJUqjOY2gsZcU6Ov?=
 =?us-ascii?Q?uplDeeIx0yaF9GiAkSXS9jrXbaJ0U161wsqaC+9zLVK9sauh11JaAG+3QwgT?=
 =?us-ascii?Q?Hp+XjWhrrGmMNWilcVbhGe55x++tBEAVoXx1b5kEcki4FxZpkd+7xq5AhDmu?=
 =?us-ascii?Q?QjmymTTEeXHbbqu4TCODzaY7DV37T8vIbHhGWV08f7tJHMeXg4xWH/ebj7ph?=
 =?us-ascii?Q?fnS6Fys2e6aa42+x3fcQEg/9HVeq2LvZaYdyC+wbhVjNiMOhfRYG3kqT3az/?=
 =?us-ascii?Q?bUvP8S9nBnEHuiIHOcsmNl05NxfF1tXnMWvzBbQ+6gcnzrWw/dLt1cQfZfFF?=
 =?us-ascii?Q?rzPUkRXOAXh7jryqJisaKo/dJUUGm5HrC/RiTdEu4NRvhSTlNOfHYv43y9Ro?=
 =?us-ascii?Q?STsIXE0WZSeG13DWr1k65pfwmo9xSpfeT9onRgr+CKvpjKq7vmmiwVNustLZ?=
 =?us-ascii?Q?7tpwNuhg9MaB43Qsf11KW83Y1VbmBVgphLWJj5j5yYNek79S8qtMpx2AR92M?=
 =?us-ascii?Q?sg5vj0r5zpNhcQYcl+naiKAh9X9tz/LG6pYdD82+fo3pUq0Sj8lBz6UpMGr+?=
 =?us-ascii?Q?8W2CbF3f9J2snjw6OQJLTEU3iiAC2odZx34Qj1Gl4NODd7gqYG3lf0smQbbD?=
 =?us-ascii?Q?xZZNr4ogA7RD46nLU5pmkY7KXcN5kTl1/2zIGgRCituA/WsKAMLT/Oveujyc?=
 =?us-ascii?Q?NKO7gPGzNAMi8Ctzx2WGk1OlILPW2mZypWMGIXpxu5Qmr3qIsXnWLoItdAHo?=
 =?us-ascii?Q?krjrJpE0d0P07Hoit9n75lckcdiC4FvkvZhK5iIxTKCj3CwbTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dqFpIQfB1wxpgDu9fsV6vvQMiRg1tTH/XOMF7gD28lI/Jz5+gpUG0+XXnxv9?=
 =?us-ascii?Q?z+TAC5C6Y7PP2KuJu6hxPP4Js0DEQ9XKg5VdlDfM78DXCQtOdikOVKoRc6tk?=
 =?us-ascii?Q?Xqav5hpqPXsvJKCIpBGhgdGhUFj578pYlegJZ0kWGw/K2tJdbEjHDlQBB8Se?=
 =?us-ascii?Q?tx6BdDre2XKJejISHO7KvRDQ/8n96Rz3YwP32Tk/7vom6dPFxlE9/CZeBuo+?=
 =?us-ascii?Q?0Lm74pEzO7twmARw8Nhd/VV73UcyKxMMUK8haJkdlrCjspCHmxmCycUidWhQ?=
 =?us-ascii?Q?5RRlCKKdnhRHLIuD9whMtaIhHWsOTc6lJ34Hp5QEHaLwMt7+zd+ofKjySAPE?=
 =?us-ascii?Q?apdaTwDmBnAj0ft0wdDPo7DHgNKrdtIA8y/sTqz3ln0Q4JAki7dvFE7/FDF8?=
 =?us-ascii?Q?b4KJBhSr+v18Q7LQYGxFY5vZ9YQmeTzS9Hy9iUMxA8iBFSgREPU4q9ezJyvs?=
 =?us-ascii?Q?7SM0tNSvLfyclnjrM5ulsxwyOQ1mPgjkL2yycZUlNnkKTw7V8SZZEAi7TdeC?=
 =?us-ascii?Q?qAuNNJIb4wDMLdDpP1wjLaSEyq3wYPMrU41+/n2pl2VByi482hxn2uWhnm23?=
 =?us-ascii?Q?6wZm5UkYD4JCb6706WXrqcEGrZnOCIraUyLsreO65DnoXcLEuKdpJ67l0LLn?=
 =?us-ascii?Q?es2VKFo+oFiFVsDNImmcDwUVr7gFfLa9xu+69k/X95rBuDyvnK+IyNm3R6RA?=
 =?us-ascii?Q?MnAZD7LCumgnjDQXuiC3n9lXVpdEqsoWDnPx/5FLHrzCMSRxM5XtvI8yLjcq?=
 =?us-ascii?Q?cc5691gSL2vvrjzhwb/FAfYIHyk7vaESaX/PruS8e1KxBxBlxu5Bn3RypqpS?=
 =?us-ascii?Q?qvnimdgyPtPTHzXLzqxeL8ptUx1vXx9KbAVPQkY6/2TJZuuzc1fUQ23T+okE?=
 =?us-ascii?Q?IqCWdPepOLfekWb2r+1bIfJFOLdzEWaoZ9t4kIWMVHQSl7Zo4JE94QKmb/ZT?=
 =?us-ascii?Q?lNd7Z2FUUpk6qpLUPTtM3IYU3el3167Aw9HjZBbNrs+2b6WIYZxFmauASrhB?=
 =?us-ascii?Q?y9aNuKFibeVsfJqlMAArvfH1x+VE9/R2E7bDEe05MjvQr+0WoIw1TT1Rz9+E?=
 =?us-ascii?Q?d3nj2sDqF3at+Gd7Ii9zRaxnEdSzqzIhfkUsd0RF45lcgwQtufi5Lsb//FbB?=
 =?us-ascii?Q?IrEFfsTO+i0XmWZp6gGpmvONi5w3QMGQLlZNZHhL73GoAMqUvasp5VUdz3t0?=
 =?us-ascii?Q?lRwK7SZpPtcVw2+9lrZY/gtDa0bbUcyBRD9rONEUOh0+hMAB2MgA65dGkhFc?=
 =?us-ascii?Q?wLeTI/IBs2tLPMtEdQwSHj4j4dgsO0bq56fF+2WbiBuuBCmHze9kEJx7YqHU?=
 =?us-ascii?Q?AV3EFSW2kgjt069wfc5Xk9gAFzFDvECxEneuRQ2NdWIPSJRQ8JIVSyebuSR1?=
 =?us-ascii?Q?nIAmba+6N07Ve4QelnoorDL4N1SdLO3pSt6kP096mvRDekMyE/2v6UKzimtQ?=
 =?us-ascii?Q?eby/id06qpJw84b11d427k/YC+uzkMDMnURfqOwQ85ecFHxGXV6lUVCeIm26?=
 =?us-ascii?Q?PfxK3MFJ7tO1htJtoe4TBXLF47cwZURLgrLt6xMviYblgi/IC8eN3LTpnjrn?=
 =?us-ascii?Q?FUJeXztTS8iMVnBR4OBi6+wu4q+RgSzvY/FsUi3auO/HQzXaCkFTG4j3BViV?=
 =?us-ascii?Q?DN/XtZNiuTBvOwJ0pM+Gp6mNREJTE2s1XfIaHXpuXu9O?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9006f5c-53cb-4243-7bac-08dcbd1a18ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 11:04:56.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuhbUHOceJ1TmYYE22GiizMs7P/3Nc3HDzx9xsBCmRkcmHEfkFTQs67Q+9S7UEWn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfrKzc15AiNZpuOg6fqThQcPxN730rJNh6z6jmWHeyY=;
 b=uq196Gxmpbl091smc9nJc4PT8ycb7LGhCdsX/KL3IlSvFRWfSoTfxbm5t2+Dvs2h05ojIpeeMhEf7pmb6+DB2JMEv4r06zpbFpGm0Ze5zF6UUOZjylmKV24Q8IF+1w7IDeAlQHuFtczEGq6VBCPRCunvkU8Q3aJ0ijGegLg1nxI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uq196Gxm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: multipart/mixed; boundary="===============3841991829609873762=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3841991829609873762==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB50048B6322A7CC81AE996E79F0802CH2PR12MB5004namp_"

--_000_CH2PR12MB50048B6322A7CC81AE996E79F0802CH2PR12MB5004namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

> When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> condition occurs between xilinx-prebuilt and u-boot, resulting in the
> following error.
>
>   objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw=
.bin
>   objcopy: '.../images/pmufw.elf': No such file
>
> U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> fixup.
>
> Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> after xilinx-prebuilt has finished.
>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

> Thanks for fixing this, I have applied to master. I have a few
> questions/suggestions below.

> +ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
> +UBOOT_ZYNQMP_PMUFW_PATH_FINAL =3D $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))=
.bin
> +define UBOOT_ZYNQMP_PMUFW_CONVERT
> +     objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOO=
T_ZYNQMP_PMUFW_PATH_FINAL)

> Should we be using $(TARGET_OBJCOPY) instead of objcopy to use the
> target toolchain objcopy?

$(TARGET_OBJCOPY) would still be wrong. The pmufw.elf is a microblaze image=
.

> +endef
> +UBOOT_PRE_BUILD_HOOKS +=3D UBOOT_ZYNQMP_PMUFW_CONVERT
> +else
> +UBOOT_ZYNQMP_PMUFW_PATH_FINAL =3D $(UBOOT_ZYNQMP_PMUFW_PATH)
> +endif
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> -     $(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
> -             objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASE=
NAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
> -             $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQ=
MP_PMUFW_BASENAME).bin"),
> -             $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQ=
MP_PMUFW_PATH)"))
> +     $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW=
_PATH_FINAL)")

> This means this KCONFIG_SET_OPT is not unconditionally if I'm not
> wrong (so even on platforms that are not Xilinx ones). Shouldn't it
> only be done if $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL) is not empty?

I have to think about this, but maybe Brandon has an answer.

Best regards,
Neal Frager
AMD

--_000_CH2PR12MB50048B6322A7CC81AE996E79F0802CH2PR12MB5004namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Thomas,</div>
<div id=3D"" class=3D""><font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText"><br>
&gt; When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race<br>
&gt; condition occurs between xilinx-prebuilt and u-boot, resulting in the<=
br>
&gt; following error.<br>
&gt; <br>
&gt;&nbsp;&nbsp; objcopy -O binary -I elf32-little .../images/pmufw.elf ...=
/images/pmufw.bin<br>
&gt;&nbsp;&nbsp; objcopy: '.../images/pmufw.elf': No such file<br>
&gt; <br>
&gt; U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from<br>
&gt; xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal<br>
&gt; DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before<=
br>
&gt; fixup.<br>
&gt; <br>
&gt; Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run=
<br>
&gt; after xilinx-prebuilt has finished.<br>
&gt; <br>
&gt; Signed-off-by: Brandon Maier &lt;brandon.maier@collins.com&gt;<br>
<br>
&gt;&nbsp;Thanks for fixing this, I have applied to master. I have a few<br=
>
&gt;&nbsp;questions/suggestions below.<br>
<br>
&gt; +ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)<br>
&gt; +UBOOT_ZYNQMP_PMUFW_PATH_FINAL =3D $(basename $(UBOOT_ZYNQMP_PMUFW_PAT=
H)).bin<br>
&gt; +define UBOOT_ZYNQMP_PMUFW_CONVERT<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; objcopy -O binary -I elf32-little $(UBOOT_ZY=
NQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)<br>
<br>
&gt;&nbsp;Should we be using $(TARGET_OBJCOPY) instead of objcopy to use th=
e<br>
&gt;&nbsp;target toolchain objcopy?<br>
<br>
$(TARGET_OBJCOPY) would still be wrong. The pmufw.elf is a microblaze image=
.<br>
<br>
&gt; +endef<br>
&gt; +UBOOT_PRE_BUILD_HOOKS +=3D UBOOT_ZYNQMP_PMUFW_CONVERT<br>
&gt; +else<br>
&gt; +UBOOT_ZYNQMP_PMUFW_PATH_FINAL =3D $(UBOOT_ZYNQMP_PMUFW_PATH)<br>
&gt; +endif<br>
&gt;&nbsp; define UBOOT_ZYNQMP_KCONFIG_PMUFW<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; $(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PAT=
H)),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(=
UBOOT_ZYNQMP_PMUFW_BASENAME).bin<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,&quot;$(UBOOT_ZYNQMP_PMUF=
W_BASENAME).bin&quot;),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,&quot;$(UBOOT_ZYNQMP_PMUF=
W_PATH)&quot;))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FIL=
E,&quot;$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)&quot;)<br>
<br>
&gt;&nbsp;This means this KCONFIG_SET_OPT is not unconditionally if I'm not=
<br>
&gt;&nbsp;wrong (so even on platforms that are not Xilinx ones). Shouldn't =
it<br>
&gt;&nbsp;only be done if $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL) is not empty?<br=
>
<br>
I have to think about this, but maybe Brandon has an answer.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">Best regards,</div>
<div class=3D"PlainText">Neal Frager</div>
<div class=3D"PlainText" dir=3D"ltr">AMD</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH2PR12MB50048B6322A7CC81AE996E79F0802CH2PR12MB5004namp_--

--===============3841991829609873762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3841991829609873762==--
