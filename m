Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397D6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC28B403C7;
	Mon,  7 Feb 2022 17:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rX1uKtfufake; Mon,  7 Feb 2022 17:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07D0D402A7;
	Mon,  7 Feb 2022 17:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C10A1BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1548A40533
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcmRVyjsdYXB for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBB0640549
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGbMpxsp0/AoL0gmXCdh3bD14CPccIe/A8HTSDfVTHMu0bNV/wjC+WLYbzi8KXo3kk5EFszZMnvg7l9kdL2Lw7cAabtbKR9fvkBcpPsBOW62HrSbIHLtGzp3whFYcTnr0kVn3AEXyArpBV/gJztLlpYaRhdehM4z5QKqhVxkJwLUNYNzLGtVwXXl2UEysUWkZ5QxoXqnBcnC00flKiznZB9OE8VlKoIEyhmznrQYBupKra1c3h9COI7FGXrIG+mp3m+7lVZZnugCgX4lfwg9pPLVUo6esv+wxM5/mFiC5tqkIR2O02NcJoVa2pxDF9cB8A1G6oze/tYrnKb1FeW90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEPkQPgSKn6rID7oSTHGrEV7QUWIwqge0b2X6Fp964M=;
 b=mtgx8kWqeS+0tHLC/S2GwihICRThqvUvFtNMMzmH5WLlMlic75LRScHxva3D+/esuWJXK28PoXgbKBJQ+FPVC5wVvBBeYk2gj5S0Svz7Gdchsvjq+YtYic/590KhzRw7jaqAo+NjcaRbumeY2N72i4e1+W0KTx+6JXqYpkbjIwzCljo/YJ19dV3/642XJWLPfQuj9ckatOt0zUsRDqt1+wVLOm5UAI9C78EWZjiqkACNQ2CJY0zPSA1OZEF0l90EDB8lCB6rsh9u6Bc0RQl0piZVElxM4aCaeGmnsS1cEyd25WiQiGK8Xoy/J5P9h4ac1SfAOv34hfAhLGKuxwuRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEPkQPgSKn6rID7oSTHGrEV7QUWIwqge0b2X6Fp964M=;
 b=GqFbGRDJt5+wB7wvNvpuhIAnQzcue/bnQ2iCHjro5L14gZZdZ6nWVaHwv1MUBFlXP/ncILx1p+v0jruQQjOFas6tbLcZpZiAxio8oTGZogFwEiwMR3kOgeCikAeQ1uT0egtAtQzEgq/SaeXnliKFjjKQ4slyLhdK3WtIMHgrLYg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CO6PR02MB8785.namprd02.prod.outlook.com (2603:10b6:303:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 7 Feb
 2022 17:26:19 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 17:26:19 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, Luca Ceresoli
 <luca@lucaceresoli.net>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9RdwAABtZwAAAVpogAAHAYRgAACe/AAAADXDwA==
Date: Mon, 7 Feb 2022 17:26:19 +0000
Message-ID: <SJ0PR02MB7758884FD57FC4A53E3585EFD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
 <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <fb6fd9dc-7619-5768-a1b4-00324516b4d4@benettiengineering.com>
In-Reply-To: <fb6fd9dc-7619-5768-a1b4-00324516b4d4@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66641ad-0a6e-4d99-3b62-08d9ea5ef462
x-ms-traffictypediagnostic: CO6PR02MB8785:EE_
x-microsoft-antispam-prvs: <CO6PR02MB8785BC797BD064A3BFDB3AA8D72C9@CO6PR02MB8785.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPVhm4WKLfDKgGBJwvhG9KXbS4GEmNNb7JchxH/t5UNFv67dd793ChDxAPyyiBSeK+F6GhsolKFX8CfX4vb+iskA9kmptgcfVHhgMyOCBGYJmwbL0vrv007qZu1tNeRcvfnxjPGGip5W2UdnwMbufJZ7FOjRuvlREko/8aEO0Wlhte65an0j7kKSREOhkE8GIwjSmxSaw/qYT3da+RDORU0wO14fttvNftG1LkdDVBR+uzclkD/4uPLZShUc0lGgxEE6kS2/qbGpS1tWeo33h2KBAPjsFG6gQXxFdftBANoAoTP2Vdviknpv4cehJEHrDS9yhkHmgS8f05yl1Bftep6YPk/Md2kmawOE0X4eUwEXkDM7xFITdTHIbT0uN7P96b6yNf+Qf/pbsH5CskZpRMOk8MUQEl49rdJgcBxxlTRUjIIo42tcgGlE7vrfnipe/QHAmqyBiV/nhdUKkzGSBl5/aXP6a5LWOsvberi+70CNy5/kVwUjoYDcaI8SPsBs5nhXTF0n7Zf9ULGDxgsFh5GialJml/p2UudomAMoU655z2POBdguEk+CaVx97jwcnb4+49O0P13jS676yGThvfrlHbfGS1LNhC6ugCxar7Jgi3L1jaEVBVWzVfcbMKGoewewB+JH3rY0VJjDw5DeqE5bc1o54+ciYdYdLmxamKoKAltvRbDlpttcplWwqc2isC89K39eOtkUx8Q6UdO3ZHySzIkDlyG1z2co9SEnx3e/lNQpaTCK6hrPsehyKTT/WGrWRbKUAQuEqrP4QvgppsrLaTT8MtZ3baB/gyjsex3GI8lD82WdnKhlmWt5ywE7D9qUnCbTh+Mi5eF718a4Vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(4326008)(64756008)(66446008)(66476007)(66556008)(76116006)(8676002)(55016003)(8936002)(2906002)(66946007)(33656002)(86362001)(83380400001)(316002)(38100700002)(38070700005)(966005)(71200400001)(508600001)(5660300002)(122000001)(52536014)(6506007)(7696005)(110136005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjljWjlHWUdyQjVwd1pvM0RZczNDWVYxbVFOd1lmY0czOWNyVHpwMUZTNGpz?=
 =?utf-8?B?eEtyYmd3TGRTR3BOc2lSREYzbUpOQ3gyRlhieE1laHJXcnVEc0kwTlhmZWFZ?=
 =?utf-8?B?c0t4U0lIbTRsWnkreTR1c0NjTWZXaDdrLzBCOWh3V0RVYU9QcUJ2UlFCeEZN?=
 =?utf-8?B?aXlqQWZleWhSZ0h1aThDcDZTRGVmTXQ0Y29SSWo0aytUYzJXbnYvK3R2NFVt?=
 =?utf-8?B?NElLd3dvSXVoYm5ocGdHeTd2aXBpVUFmWFJTQUxLVHloWmRFeXlQMFZIOE4x?=
 =?utf-8?B?eTFEdjA3eExYamxNbnZ6ZStIQnp6bmN3ZXBEQ3lMcjdOR3Z1MEE1OGpIUHV2?=
 =?utf-8?B?dXV1Ky9Cd2FQNENJZlptRnN5dHJtNFB3WHNueDhuYk9hU3FQbWVUSGMyVStF?=
 =?utf-8?B?dlQ3dXo0T0FSMGUrbkFicDFqWXdCRG52RHFCN2JvQUxURTdiZnQ3NWlsekJZ?=
 =?utf-8?B?Nk5OUnVOOTBSaVVrU1doU2RVNnFEenBMaEowWW5nQ1NGcHZZL01DdUxUbTBO?=
 =?utf-8?B?VHlvWExzajJQbVFaNDlCTTdRNTJSb0YwdlVITi9ETzZEdUN6RC92WWJnajhV?=
 =?utf-8?B?blpWa0ViekRyS1BjTWN5aTErZFkvSEhnQzNJd3V5eW4vdnNIaEQzcWI2U3JF?=
 =?utf-8?B?MW9tQnprSWxWc0dKdnNiTGQ0Tm9tS1RjMWF4Y1hybExQWE5ORVlaQTZTSHZ3?=
 =?utf-8?B?dEc1QUlab3JWNEp5bEl3NUVaT2J6SXlQM0QwcVY1NG1TUUxiWFNKbzJuOXJt?=
 =?utf-8?B?Ry9Qb3JINC9aSmZmemViRUtBVXkyZC9VeHR4d0xPMzgwOEMwdDN0a1NxdDFm?=
 =?utf-8?B?ZitYRTZCcjd6ZE5wOHlwTkhwNTZXM2FPQ2srVHdtMFVDeWg3UmhseDhCWkFV?=
 =?utf-8?B?ZVRsbVZiTzZmQjB4R3gvRmVsOUt5N0xEWmJqcUNGMEZrVUtZQXY2ZFU4Vkh0?=
 =?utf-8?B?L1o4emhmMVA0dzBMRnNLUHgycytQSTN5NmpHZ2VCRHR2RUxIVjlTOHl4K0xk?=
 =?utf-8?B?bThJTFhlWkhOV0FINnNZZW92L3hjMmwwcVI0S3I5eThuQmI0WGNVK3ZZN1Z4?=
 =?utf-8?B?UTR0TEdYMTRlaVQ0eVFqQmFJcnpOaGpRK2NJVFJ5b0FtcC9UNzJ4NjlkbnlW?=
 =?utf-8?B?YWtDaEIyT3Q0M0hnd2VWRHc2dGdmV2YyZ08vUE10U29ucG5rcmlJNVcrdUNI?=
 =?utf-8?B?Z0Rwa2JvTkxuRERFTm5Xc1hYdHV2MEJ1RzNEWDAxZ0szMEZDNnlNSkFyaFJY?=
 =?utf-8?B?SStkWmhBU3JsYWpTUnkrWE9peFpWTGhvV3JuS0w4OGpreWIrVkFCcm43TkFx?=
 =?utf-8?B?eTdScFNnUXpIaXRGTXBWU2hUMjBicVdVVDNVdk9pVmRzY1NPdkw4U2tkbHox?=
 =?utf-8?B?NGMzQUlGdUZGaUlhdzhQeFZLSElQbEFsc2VmR2VVWW5QUkpTS3dTZVhaMjJy?=
 =?utf-8?B?bENpR0RFVDA2Mkk2dkFaRFhLNy9aNm5pU2tmeTBzTHNGeGU4Q2xTdHpuMTlZ?=
 =?utf-8?B?UTZ5d3R6QXpZVnNRZlh3ZDJKV2lVTXZwRXNnUXVTa2xKQW94KzlBNVZzZ2hP?=
 =?utf-8?B?ajVHcVJtSVNEbHJnbCtTZFJ1ODFSVk1OZUQzTUxEb1B0K2FtOGlSVHl2RThD?=
 =?utf-8?B?Vlppa0plYyt1cFBjVFZMd1V2TGNveEJIc05OaVoxTTZYUUJmRlJFVkpiYUY2?=
 =?utf-8?B?alNUNU5PM0NNU3gvbnUxSW0xUUNjU2Fpc3dDaXpHdHB6WHB3L1hud08vbEsy?=
 =?utf-8?B?eEFKeWVCZXhFWGpPd2JLaDVmSE5sV3c3amdHRjd2YWgvQjlxaEZGQ1kxZXJU?=
 =?utf-8?B?NkVqMjJvZ0JOZ1pFMkpiVk5Fd0cwWlUvdFJscHpEZnA0N0tldW9NMTRnamdo?=
 =?utf-8?B?ZGU0aUtGRGlmTXdESDZYNE9wemcybkR0RWhaVkYvS0NYeUpML2NibWUwOGFh?=
 =?utf-8?B?S0JNNmllVTFUd0poQUkyV3RhaEZtaG9zazEvTUlpQVhWSG0zOFFvYjRya216?=
 =?utf-8?B?MmVJc1FNVUFhbXZLWEVuMHgrbXFNemJLMjEzQ2pEUWpYeVcySWI0bkhyMVlI?=
 =?utf-8?B?a2RMaFRXYStnS1p6U3Jsb1laaktiSjNHZ2lBOUMxNDZGMWgzN3BzcS9ybWpU?=
 =?utf-8?B?N2x2aStXdkllUDdjaVFGS3E2V1IxZVBxbDVBSEdha2gzVzNwLzNyQ01ZcWtE?=
 =?utf-8?B?OGc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66641ad-0a6e-4d99-3b62-08d9ea5ef462
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:26:19.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4zhPz+5U61Q1kUPIrSt23RUW0FH5hFNByrces9hERv3IRn6KNrPuM+e2ICMs5L35tV0SyGL6z+TqoE0kjIdqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8785
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> In the boards I've pointed you before:
> https://github.com/buildroot/buildroot/tree/master/board/orangepi/orangepi-lite2

> there is everythyng you need, the post-build script:
> https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/post-build.sh
> that copies the extlinux.conf.

> And as explained before you have to point to it like this:
> https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L48

> For creating the VFAT you can imitate this genimage.cfg file:
> https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/genimage.cfg#L1-L11

> that must be pointed by:
> https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L46-L47

Yes, the problem is that these steps put the extlinux.conf in the root directory of the vfat image, which does not work.  U-Boot only looks for the extlinux.conf in the extlinux.conf directory.  So what I was missing was figuring out how to build a vfat image with my extlinux.conf in the extlinux directory.  I finally figured it out with the following genimage.cfg.

image boot.vfat {
	vfat {
		files = {
			"boot.bin",
			"u-boot.itb",
			"system.dtb",
			"Image"
		}
		file extlinux/extlinux.conf {
			image = extlinux.conf
		}
	}

	size = 32M
}

image sdcard.img {
	hdimage {
	}

	partition boot {
		partition-type = 0xC
		bootable = "true"
		image = "boot.vfat"
	}

	partition rootfs {
		partition-type = 0x83
		image = "rootfs.ext4"
	}
}

Thanks for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
