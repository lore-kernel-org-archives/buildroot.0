Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1058C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59ABB4052B;
	Sun, 11 Dec 2022 17:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59ABB4052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jvMOs5bsd_B; Sun, 11 Dec 2022 17:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F4BF4056C;
	Sun, 11 Dec 2022 17:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F4BF4056C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92AD51BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2113E40363
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2113E40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1MLv8HUP0CN for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 266694053C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 266694053C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu/4JbgFXU75Hevjmfxgeobc8ICWhsEDfbCq/lJK5OMp19+zh8CtAgBSpwfdFJHdVkjuJgYNiOfYzPO0HQlq76Mm03FPc0olY/usl1n54vp6hPzLorI1cVGVG9tQnbBc0bmRRidMW7BVxhlT1G8lCmcCQa2YB/Pc/N/zBmRXllFAP9ER1yDx16CgZCr/qEp62Hyjlg19jCKCpcEhyYIxq/7nIuKSVjn/7g094EWkx0joQWXFeHNuLF73LEKlm/6uYXeTNr7DLtTAZCCXXQZfkIPqS9FnFVKsLwznFqI8RqgWbETYme/dnLhvKxhRbn4rgg3b/MLnzmSP8GNtyAbueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH28Ld2A8Al0k/U8tDwYwZGbPz274ucpMVy/4FDAZYI=;
 b=UM+z9T5kUfzWk6hWmp07DPT3kXtC13rKiI88mu1KXwaQrAbwAZoaVjU/tev9D/Sh+X6A7eEZv87bMA53TdAFcuHf+QDCxsDAU+1hEx2bw5pc6+8JUiYrskdmKigZLw8Y3Ec/SfthDXMDxsHRVLD4hf37sZ7oYhPQFdQWV0qcFvt/cSO+IZ5cVDxYMAYZS5MS7TFmXu4+o2PFCK3FxHNT5Ay1MCXnsSkMHa+bNy7lUzAvevqjPGTKkqElubkis71iPs0pROBuNqQpxHuQzsZIy95GoKj1jDt8o8v/NnzTQCbuR/8SB/KVQK24gpCV064CzZ4boFRfyxwqj3h09KfAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BY5PR12MB4872.namprd12.prod.outlook.com (2603:10b6:a03:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sun, 11 Dec
 2022 17:55:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Sun, 11 Dec 2022
 17:55:29 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
Thread-Index: AQHZCjpT0S0ONWlwlEyKRNS8isY6ba5o8I8AgAAMLwA=
Date: Sun, 11 Dec 2022 17:55:28 +0000
Message-ID: <CH2PR12MB5004CD2B62F990D72C7EDFFEF01E9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221207124855.1831-1-neal.frager@amd.com>
 <20221211180336.79ea5b05@windsurf>
In-Reply-To: <20221211180336.79ea5b05@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BY5PR12MB4872:EE_
x-ms-office365-filtering-correlation-id: f74a36c5-2167-4e5c-1057-08dadba0e3df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iueblA8i6TizbXVaDRjp0yr6/bsRaX4ioMsLQlPY7mKMpL/UBE5QK5Q3ZeB9VME/upPs/TC9Sc7QXL9qom7guBXJebodmul01nfJdFTKMWJ2krtvxOaF82v/VTdaKCsX5cTV1Ru6C0S/7fi5pXns0oLXvnyubEXmoyG6OD+vHQF9eOTULmCYwBzSZzbidJGpHpjOEaPQd/26fJ0HEZdVSLTS1v2U2lrZK28ZM8fsq7cK7KaYVuIRbRf2iccfiqHDE+RQVym3hfWOxOjFq2X+dLEppZnFoH26QbiAVtvdfiLS+lj1Fvf5X3lS8S6mlE+5A+Gn9Hw7SLLsjzYxakm1Pcvyb7l934E4g0ieBWRzbelcNtkzfpz+7eyxjeaUnfDdNozUKbopWiei5BMK09xYaUZQPyXjk2oNIJGISB23hgNIt000Ru6i3m87h1z3YP12Lbvk8JnVoPLNL1kNIg3cMSgsI9jBGAzfk2IM3NqTqccQVH8Hdqxs39aCL1UpL29LjGCZFPURfH+eUMB6g++ZRgq6BBrIoHr3r0v8NsISTJddklBI8BSqzrxKk7wkJ7Ta8YobKJ3EbIupWOa1tPk2OSieoclbKqflDe0aMJ8zHWu1ENSGBmFraLi9jqiIa9DultnIGodH3ZxSPmHxjhu3k9XTDRSO5Qwyf0IGaYfeXCFYfSUxBPUGPuBeBNEn6mZR2txvzcyDjHxXGQxY66M9o/lN+AxfIyMdCwf86m1wetw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(451199015)(7696005)(966005)(6506007)(8936002)(316002)(19627235002)(54906003)(478600001)(110136005)(2906002)(76116006)(66556008)(66946007)(8676002)(66476007)(4326008)(64756008)(66446008)(41300700001)(186003)(83380400001)(5660300002)(71200400001)(52536014)(55016003)(33656002)(122000001)(38100700002)(38070700005)(86362001)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D+F5fL/Bk3w8iPh33r6zCs2f8UeYkfgjF+Yblud5Mhq4YjQza+oDJyZSI8k4?=
 =?us-ascii?Q?pC8+Kiy38E5zkjz8HL4Wj/bgg9Y1cIbbAwJLy14KHRA7Jny5u/Kt0qyQmoXa?=
 =?us-ascii?Q?t0GECTKR27RRT28ZqgWvryVBcxCZdreMHxaDxa1rZ0H3tcsapx0vlOfD3/DH?=
 =?us-ascii?Q?cKqa3w5Bc7/xfy33b5wrU8wJ/nhTNm/tCJQ13FrQSFiXtimrftUkwUBMthac?=
 =?us-ascii?Q?HqjdaPiM9rPPRP0qvxQrxNQZRRknTRTkKS7YJ3dElzhI7016gXqz1WDGAkmH?=
 =?us-ascii?Q?azAqz4lA8LZSZX3tBEZ2uQt+URQWfpRF6MlnC0ykb0C8GlpbeqDM1TvhKgJI?=
 =?us-ascii?Q?zp8Q/Io3P2y0xiLlXV8l8yGylr2bH+oToUA7Fsg8uK/t8g8j3gAUvO9RIpwz?=
 =?us-ascii?Q?yncsyGCbkOVRTtYZgC1GoJdCY2yOBi/2Go71F7oxu+S2lOd1R3HDVFvFu6/9?=
 =?us-ascii?Q?ny4WqtT8EdjyTCk8heJrALhb4nuZyTQs9sUsB4lbt5UcCxy9z1Uzysal/eH4?=
 =?us-ascii?Q?OX4e5fYVifPU9Ox5Tsd2VakNUysRA343ilv8vcxBFuVwObHg36cSFimrIxCH?=
 =?us-ascii?Q?W4/Gb94oWv9gL3WtLh24kNPZ1hkKxSwNvQpN0EPNMRi1hEieyvC+uE1f7p7U?=
 =?us-ascii?Q?AY5/DEX7wOcDXaGaw6L7hgzVbZDwI+CFQhTYv7h0GaU7YuWz85+MyhRfj09S?=
 =?us-ascii?Q?rRC4sjxKtlT4SVBoRlSwNfW8QpHDxhI+V77T9zbhz52sAUjefhgVaYf3Cp8S?=
 =?us-ascii?Q?N+1eaLd1bZM7kVSI9bm55KDfcvIsXKy/7uoCF3VQWs3RwLvilVIcQz5KMGQP?=
 =?us-ascii?Q?APIzLUs0aL8nhWolN0CRGa2iurybj7kLt4SKv9wZrZughsHzfXKgIpN9BfVe?=
 =?us-ascii?Q?yf3iuDf6nfofIf3DnfnSkyUe9YZ90y+somDJniV3uAdNQdtCl9k0eJOqEerk?=
 =?us-ascii?Q?cJ3Lq+AhCTtPfq7Bbmu0PkhVAK3qIiGxoQsSZpclfU3ZZYUkIytXEwj157wc?=
 =?us-ascii?Q?pe6YTrDxyn27cYjyL9Cn6rmLvldo0V2oxd1cqUpHnHab6ehp9AsG5zBMSpO3?=
 =?us-ascii?Q?21FrKEz+GgqL7YbLRnao8gL8AhFndJa3Qef5WMLLklHZM5tO8n4WAOyFi8x2?=
 =?us-ascii?Q?RTFagGym+p5nT3kbIQZMYUPvWf63Q1QSxRwjCuGyum2N1zWyxRlzCCPx88G8?=
 =?us-ascii?Q?yBOvX0jjMqv+fsubV2fUZRtS6RwpTPGcnVTb305ocnCPYrzMBxgV9paPX0ij?=
 =?us-ascii?Q?a45BxLYlfzSrsCloSqsuPsD9JtGn0cJtVb6AqRmKkhlDQCYsT6wgg2W729nL?=
 =?us-ascii?Q?b7C3EZZtZ7PWEJGuJMxmf3hm8zJhpvR00ZIylD6SJr/vGalGLy4e22Ook2Kv?=
 =?us-ascii?Q?ZffYZJRAQG2MVW1Ryp7yaIqEPBaYo3JuzvNFIH3Sodqxx89mokQ2IkJaYl4o?=
 =?us-ascii?Q?2xYzijg26mPp6MdZGR7YgCJc1Ppw5BH5hMW1GGcFuqFI8Z1ixgq9anlftP5B?=
 =?us-ascii?Q?f9q17sNPZdNk8WTuEa/cUIEAMLlQCuThce5pfpEcYhB4PhDGD4D+Fs5PhTD4?=
 =?us-ascii?Q?27y+NGCCci8dsRWYlj9D7S3ybPdB+Kr3W1UxxZzohyxcRhDHfkOYoGz372hA?=
 =?us-ascii?Q?eD0kG3Cdyqyf1Sk9lEP1hZw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74a36c5-2167-4e5c-1057-08dadba0e3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2022 17:55:29.0174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jn+NAE0x0y3AcP7+9KeGJquhb+xSnREsrvbW2unrwtreYr16S1iGXXGy4Uj9xgR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH28Ld2A8Al0k/U8tDwYwZGbPz274ucpMVy/4FDAZYI=;
 b=tQTSDUiL+GWP2cvHNJE5Oib9dYACdVXUKEvmzFcQ4046rrcKGnnXXObdm1H6FDrjAZJeb2Sz594BFUcTDsAT/Tt2aBW95hBOIxDB5e7LrdAw9LMpaGuFDNbRUQ+xNfIRrPWl54oEM5ceRoViZm+w4kBbIQEEbXdzJycbvIwmsG0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tQTSDUiL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
> 
> Signed-off-by: Neal Frager <mailto:neal.frager@amd.com>
> ---
>  configs/zynqmp_kria_kv260_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/zynqmp_kria_kv260_defconfig 
> b/configs/zynqmp_kria_kv260_defconfig
> index df01ad30b8..aef67b3cb4 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y  
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"

> Do you test your patches before sending them? Because it's quite worrying to have some many fixes.

I understand, and I promise to do a better job in the future to diligently test both building and running on hardware before submitting patches in the future.

> And in fact, it seems this patch is also broken: there is no Device Tree named zynqmp-smk-k26-revA-sck-kv-g-revB.dts:

> $ make zynqmp_kria_kv260_defconfig
> $ make linux-patch
> $ find output/build/linux-custom/ -name 'zynqmp-smk-k26-revA-sck-kv-g-revB.dts'

I have done a full build and run test on all of these patches you have been committing, including this one.

If you look in the dts Makefile for Xilinx zynqmp and versal products, you will find the following:

zynqmp-sm-k26-revA-sck-kv-g-revA-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revA.dtbo
zynqmp-sm-k26-revA-sck-kv-g-revB-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
zynqmp-smk-k26-revA-sck-kv-g-revA-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revA.dtbo
zynqmp-smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo

zynqmp-sm-k26-revA-sck-kr-g-revA-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kr-g-revA.dtbo
zynqmp-sm-k26-revA-sck-kr-g-revB-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kr-g-revB.dtbo
zynqmp-smk-k26-revA-sck-kr-g-revA-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kr-g-revA.dtbo
zynqmp-smk-k26-revA-sck-kr-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kr-g-revB.dtbo

dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revA.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revB.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revA.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kr-g-revA.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kr-g-revB.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kr-g-revA.dtb
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kr-g-revB.dtb

You can see this in the Makefile here:
https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v5.15_2022.2/arch/arm64/boot/dts/xilinx/Makefile

Essentially, the Kria Starter Kits have a SOM board (sm-k26-revA) and a carrier board (sck-kv-g-revX for kv260 and sck-kr-g-revX for kr260).

With this Makefile, Linux is able to apply the carrier board device tree as an overlay for the SOM board to generate the complete device tree for the starter kit.

This is what is currently missing in u-boot, and why u-boot requires an extra script for creating the proper device tree for the u-boot.itb.  Linux does not require this.

I apologize for submitting bugs into buildroot with my 2022.2 bump patches for zynqmp and I promise to do a better job in the future.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
