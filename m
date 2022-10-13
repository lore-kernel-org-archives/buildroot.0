Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBCC4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 13:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C5B83EFB;
	Thu, 13 Oct 2022 13:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C5B83EFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A-HayGsMlD1; Thu, 13 Oct 2022 13:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7126783EF9;
	Thu, 13 Oct 2022 13:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7126783EF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC381BF2A1
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560B383EF9
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560B383EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzWehUvo-93c for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 13:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DADA483E4C
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DADA483E4C
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 13:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVPWJGP1cgUUT/m40L5lPqfkmsuMNzd5l/Qef3xAWIizxVwFIz25dxOfJjFStvmV90wV/ccFOwESyFG8+IzZjOZTLKZJbkqYWSI/76pbvaqN8W9HIMcb77dnCfZlZfNrzZ7qQpCX5HvfdqaxSRjdNyv2sw8DsQbVo4u8EYHS1k7ZbIPkzDTOux12WncKc5hr0nVAnaP8G8pcW2d+BsgoURRjkOYubURFgwhEb9qEV945go79hBcdO7bztR7mwgMgSNUY8Fg0qmKl+aDarF+wnESESr1daLXY0oUwaWJW6+D9cb6c91WoKlH/vlNcI65s5IIBu5KAyTDUxAZk4NtesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC4LSZQLZCXH+VQ+d2dyhKo6U+SburG5wpW/dul9OiU=;
 b=JIn1wgPJwlJGWasB/cH6Xdf7TcktcoCbwrQ2gcQDs5g6TKs9i6ieJJtJqIIbYoqn/JNpo18HhE35m/a+hhkuEhOcbYa+n1S5Z0ZVEbMMrFSstLruQcVC1uIocvyH5zh2PVKZkx/vEAChaNqHgoW7MuCC+nM9xipqvb68AXgmuimFPKQRAsGK6zLmgAuXOZEkRYh0p4H/7uV3Fx/9RzU/50lkbpSF42vYUQoVIqyhRE13Z/jnwxkBYtiXevL+RqCrkwTkVOSj3aeBlFK82WKUAMs2jb9ZsyXq4UeCawgkfsvjGHV0jDjWhPX+MmYH39XX7MR/jN8gCgvKj1gIM/z9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB5419.namprd12.prod.outlook.com (2603:10b6:510:e9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 13:54:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df%4]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 13:54:41 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/1] boot/uboot/uboot.mk: add pmufw.elf support
Thread-Index: AQHY3s/3Hy4kct51qEebwTUilDU5+K4MTvcAgAAI3cA=
Date: Thu, 13 Oct 2022 13:54:41 +0000
Message-ID: <CH2PR12MB5004011A7846E69D1D047BD9F0259@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221013064931.60174-1-neal.frager@amd.com>
 <20221013151834.60d4a353@booty>
In-Reply-To: <20221013151834.60d4a353@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB5419:EE_
x-ms-office365-filtering-correlation-id: 6ab714d1-efc8-4e2f-f9a0-08daad227a00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkERvJ9vjp8dUY4DNYeVQnmo8M0k6eiO7zlbnQEtbcid6cNTze8E6usaTr4UCZMVIvZ8zwFQuX8K9bh7n/55LZikIdLpiVTX/GkG2cmijln+R6CH11BAca9NUbUn7kTK9x7fKlRYxGjVvhYJ2WUAkI/R36fr0Kfsm5YRL8BIquXw3yGD7+Zr4/sJotiFj8vBjd6YyRYLs8tQ8jSZsbU9WS1YC7L3mlcx+cSAGy84ro23j7sYcqrLep3sC3diTQBetTHyD1hr/fwcBtgbz7+frroHvFzHFwRkJXU2QC1R9Qg6a6K1Nprlgkm3mOfh/cX7iarCoXyDP5UaARJ0r80dYLW+ypQm98xHQXhowPIjf7BSuwkms/nW0LpSLPBX6npgYjc8MoaUT2jC3zhkPk3jHWcnDd7zdwXCx2/Jgw1SJCaFMN8VIhto1iWPTfN44U8BRRnlYu13WeM3NZjhDuy3n2yBGEa1KDd8+TS9AjE83nwa1RjV2DwXljQHZxdlX7DI7Rjzj5TpHqRA3quT8NF5X78mmQBWieOou+VCGHS/ujtQY3iPAGotCjuasNoJ/FLktfvCvX8Wksu0QXnTXEwn9xDyzawngA/aj747dWZVsjFTXcnGF4QXaA3eLL1kxTYVYY3Qivd9Je9VfTNSm0ZuxFECzs+Q/IV04nREY9Wcfi89BPgGM2vCnCjlz09BIW5P+zTO84OMXuskSegBWpE6ta79c2wZdylIzJCClppCK+kmLbSuaz0hGzC7lUn2O46hRZ2C0LDwbgzl7uN98CUM2uXNcQPWpW5oH3on8DYDXAjUdp5vVDq60pkiX4AjdwlN6aoBjRfO+02McYVDFlsFzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(9686003)(38070700005)(5660300002)(41300700001)(52536014)(8936002)(7696005)(66946007)(6506007)(76116006)(66476007)(66556008)(66446008)(64756008)(4326008)(8676002)(55016003)(38100700002)(122000001)(86362001)(186003)(2906002)(33656002)(83380400001)(966005)(478600001)(316002)(6916009)(71200400001)(54906003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mm27o9pCrVoTVELTNYAoAPHBv/tf4wv1BM6Kimf8IuQwaP5fhoPQJwgYgoIF?=
 =?us-ascii?Q?F8mIlOODF2sQZfzOuOzCisd/cNM1D4bjwvGXmBQw3wh8Eljt1tLHq7lGFfl6?=
 =?us-ascii?Q?uZ31mILa3F3hmV99gZAOsySICqw15Sdky/AQxy80qGGhqO9Mr9Sl6k2V8JwX?=
 =?us-ascii?Q?fFruhKCaIhBJbAoha6Al4nCHpx3ONDWFgFiYMXVItPkUH3i2USPtBmIbyWSS?=
 =?us-ascii?Q?Br7nWKw665rNP9iOKIJcQVAadfXQxKm1ApU+OVaJqzuHU7Vyje3A4s40cBv0?=
 =?us-ascii?Q?LYcFCLp8xyqrzPVyyU9pR0JE5WGDB/jyPanA0F5nlxSsJ28bA3khN0flP9ig?=
 =?us-ascii?Q?c148o4llf7WSdld5qHlCGAfQWcN5V4lM8EthKr79ipStI4kTSjUu0x9i/QuS?=
 =?us-ascii?Q?E/MkCF4CmnZsTfnicdgID+CEXq7xlRvH/XJqjlXwQrem3pST/bGt6hranIxY?=
 =?us-ascii?Q?UpYBtW+1LVqT9fSH64+S8mfmG079/3IDdgPZ7kV5ZImZPtZLCFxzgjCIBe4u?=
 =?us-ascii?Q?98o4X1Fmh7SMn9svsYztiTcMTJURTQ/cKOE/upx7PsVH8vdGMFOmIHdxhcSy?=
 =?us-ascii?Q?L04hVafWw1AHG+twC4fzmZQkFe0oR0Nsp7ny4UtRTz0Wmoyoc9dH5DCf5fs7?=
 =?us-ascii?Q?NSHdZ59oSncHeMDBeW3h/KYvZPLFeY6hIVIAqu7ji7BjdcKdkfVzvXCt3E7r?=
 =?us-ascii?Q?RE5xf5IUai1jCsUbUyMckXpr01Dc9urtGxEzIbOiVB8jhDUFfw5rnz+Ls2l9?=
 =?us-ascii?Q?XBLxYN9jAt8x8Y7BrPF/btVeLuotqIH1JJ+OFlvZHjFRcx26UVFfy6zTEnDe?=
 =?us-ascii?Q?XkYI6fQqcx72SAvsflz5Y7fixIOtFgeA1z7W6K+EopxSRyZXTHIpJCvZZPI/?=
 =?us-ascii?Q?p0buUQcHPzrWRLlywVvBD3IpVVAXmjjfNg0eMBhjF7WAbe/neNqp3DS8mu3y?=
 =?us-ascii?Q?qcAMegxpPbXNsWXZiXRD8I23xUZjc6DMUl3/yoA7n/anXeg2jGmn0ySvO6K3?=
 =?us-ascii?Q?8yhHD9emWhiSbwcbuy19ueX3zZPEhnRAlG7h890lb/DGKrtTHhkVSQ1b7HHd?=
 =?us-ascii?Q?GorufpLa+nr/NbqsVnb4+sC95M7wOlAd8r8frlnoCLrX5JjCdB2rTiX3OKF1?=
 =?us-ascii?Q?6w06E8AABekPFGU9NSCJfrsBAmOwH2WRv/AVjMC1au2yoA+DUuA933P7q253?=
 =?us-ascii?Q?gz45GghOkfiwHz9Jm5pBtBWD3IzfHabVksb422PQLr4WE0Knh1lBNU+km5y/?=
 =?us-ascii?Q?et130y21t0rR3upRj9X6xEPuEOCQDTQsUuxSY8m91c0Vq1kLZbpzKB+o05FX?=
 =?us-ascii?Q?kqVPj2MqxPzoqvOWsRkLfSWRCgaj87DsyITJtg2Pkp904bIPzBQKQyIWlFD6?=
 =?us-ascii?Q?f66MLStS0QASEymdFKIbuahucCRYEN3z62y1PxMTlEsb3fL/yaUuGQVW4Ass?=
 =?us-ascii?Q?UmYLA9GoBDlf3S6wwJxbWj41OkDrAjd2EyYeXFHhR3G/ezU++NWKFGW11WyD?=
 =?us-ascii?Q?cysuda+LtnB9VTDqr2MTD3Lh29V1uD/DPYe6pby5w4cypR3OHqy/rHv52+P2?=
 =?us-ascii?Q?9UZPm2P4/jWGJ6djLpUCPdeYidyAF1nvuEJvfH1ZDw+Zg/DOsIQju+gt/Kvn?=
 =?us-ascii?Q?sTHeIGCBcBWAPuIIiJ/Q6Z0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab714d1-efc8-4e2f-f9a0-08daad227a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 13:54:41.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iY8BkCz3rdMNERyaVXfyE5uB6xdhq/Pzqm41kdIzvc4CpiSRc0PNkQLyW04XfeyK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC4LSZQLZCXH+VQ+d2dyhKo6U+SburG5wpW/dul9OiU=;
 b=fqi5+ZO2xrRwSXl5MHFkd3Or44VzMBmBeUNAGmJ1WysZY3f+mcpHW4RNIfno2q0EC058WUI/Wos88o1MQSa/bl5VgOVtCqJHBETpiUbWMQ81HbEWNk16KV85V97GNZZeMYKIlkz9bzPIl0l320DXuNB6lgKmi/At0sVnXfy942A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fqi5+ZO2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add pmufw.elf
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> This patch adds support for zynqmp pmufw.elf files.
> It will allow buildroot to use pmufw.elf binaries directly from the 
> Xilinx git repository built by petalinux in addition to still 
> supporting pmufw.bin binaries built by the zynqmp-pmufw-builder.
> 
> https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-fi
> rmware
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> Thank you very much for working on a solution to this unpleasant situation. I still would like to address it, but spare time is not easily available... however I'm always happy to received patches for zynqmp-pmufw-builder! ;-)

Thank you for your understanding.  As you can see with this patch, pmufw.bin files are still accepted.  The moment zynqmp-pmufw-builder is fixed, developers can use it with buildroot again.

I understand the lack of spare time.  If I ever get some, I will take a closer look at how to patch the zynqmp-pmufw-builder microblaze compiler.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
