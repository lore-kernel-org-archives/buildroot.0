Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 07:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B4B400A4;
	Fri,  4 Feb 2022 07:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1GUfh3CkO1m; Fri,  4 Feb 2022 07:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A52401FB;
	Fri,  4 Feb 2022 07:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4FD1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 07:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D52B40924
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 07:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7Ob2jlrvKTL for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 07:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F289B408C9
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 07:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU0qg1zjn/V6kZdoJv3G4Al5CL3JZxI0DG+5Wbve65vFqGLJuPpMtj/kPhPd3bQlK6Ze/wsVAr5XJNwCkOYcaUZR6iRSV0o8l1uzG6WUnH+fAa/PikqRXYN4jylrdhvzhaFGdtIAcY3UHl70b3VNbjPybjLU8WkhGZ1JUx8kwfEP8JZA/IGnR4NejhWImiYS7McftSXm5CpRve/2tD88FvDy/xXgPAyt8WsjaRggFFBpkKvUdE/ulXXqDrSjD2rfVtfmuH9+WSgYptMDgMe7cFlLCR50WlKysYAgAU3WW8zktVoiLnWYYnAn4jK0V0uqngJmhWuybPmSKbfDP8jz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XejdYHWtbC+d/Ntde3AFh0Rlv8aBf5K9HJf/sR2CO/0=;
 b=UQ/GdUoOeNBjaaVuPGpedVywwSElY7QBdNMZlg8X6p++E6CQW0I4J+IKFVZFvefn4/vRitIL/PDE8d1cOnj0o0dkAh3ygTnAzPAQgFDhbvABQ7+LYWptyE/vEEBYt7BWaK9ZHrFcT4cSkmcAP4tW5GrMze4H9lbCwrU+oMb9du5PtanU0Zcek0gpYogsFRmLOxH/01tuRwGtXEzRfUBGGaaadaxYyXn1pVFhprk3kuIbjXg2YzyXHM48XALLd9t+m6TY1ForCp99bas/RDacNLpNiBWqiwdLUYtoBPBGkCLQ1jlCmrT8gnyQKRB+yi9Q6QZ+pVFypjprNbwRm2Ks5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XejdYHWtbC+d/Ntde3AFh0Rlv8aBf5K9HJf/sR2CO/0=;
 b=OPU/fxeOBGVGXNYKd4z8ZKoli3BM9jpfobn/2gLXREwkpVOFl5N76ZfaVkD0AXOIO9sxI7vg1h9xJNwcFaqxVqc41eBkuj9c8t5NxNqKUQKS+ihMrlRwe0AP2vhAvtXAf1TYWazl3RdKwaE8nMJRl2v8nx5BN3kBp+MmDAYR3Vw=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB5000.namprd02.prod.outlook.com (2603:10b6:a03:68::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 07:09:18 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.016; Fri, 4 Feb 2022
 07:09:18 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig
Thread-Index: AQHYGQQydb/7S89hikSD/2EFFt4D/ayCnlAAgABZiDA=
Date: Fri, 4 Feb 2022 07:09:18 +0000
Message-ID: <SJ0PR02MB775844C568A8974CFF89518BD7299@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220203134402.1647985-1-neal.frager@xilinx.com>
 <20220203134402.1647985-2-neal.frager@xilinx.com>
 <80d97a22-5159-3111-75a3-9286e4776385@benettiengineering.com>
In-Reply-To: <80d97a22-5159-3111-75a3-9286e4776385@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d7a8cba-c4a1-4268-2c83-08d9e7ad4292
x-ms-traffictypediagnostic: BYAPR02MB5000:EE_
x-microsoft-antispam-prvs: <BYAPR02MB5000D3390448BE2E7DA3D1B6D7299@BYAPR02MB5000.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NfHwzGoJml5cyVP/cCJHNXCIkX7B40Bnl1T7MgBPv2qkDne9dYtAboVdupUjgoHtzuZ13u98Au0h/MBJbAwREMIzIS6Yn0yRlolu9G4Nnwwc6H19OozKSCttHi1ORW045vsJVmONITwfNynthWp16gM75cTtzHKSRW8tGwP/85LrCUPxR49wwuil3mKEt+E6+JsPV6jnWoaKuo5XuWkH1ZGRJl1Jw4xNKGStBM9UgtPD08Y7UuF5QBrUK6ikWV00EB4InRWiL3xNifQHZZrJiT36YQoNnARdcsxTrrdbVDZ6GXkhklOhGoRTo8lUekslEccTPp9DuXKkBB6OphyyQeIjLdYjRvkti+H9R9fMCmW4Tb1Tie/BgNdIA8PYQEjuzGpvhlRxbrjxVFQ6cOv1XeV6eldQqfNgfFEpFMdvSpO3ZBXUMSNH5Gbg/9PfB30B2SlsxDWKssl9kQ9SinTjw7Z2Co/SoNMI0M7MSlmbr9e7YyiE16FnlgtRnLmQqebhq8dJm+Duns9dThPHYKfmcx3xGrSFciwGGAPIrRNNhnI6+x/e9S98UZOBpByA2lLbQFmUIHYaQLHWYGrlYxo6TiWZTyPi9ARub5exrIW3npvjWJVFkXTGe3IuLFgqSnsJdsH+8uX5bORWW2ONdi7Ya+N2gec76jXPMCjwRmyVeb4/7i8p/S1HIxcxRE7psOgowmMekOQPO3goW7RheD6cMYowv8OpNtsgWnRvBMzSKxwqlSPhi7f9eCbg44ptewSvBub0CT8CnIrHWpkIyekBVHNJtT12pAxQww70UGyzB0toJhu7OOJPvbBf63iGKKmllNWKhfV516domtLvv4P+rHunnVPHnQd1CEpi1ZqCaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(64756008)(8936002)(4326008)(53546011)(5660300002)(8676002)(76116006)(2906002)(71200400001)(66446008)(86362001)(66476007)(66556008)(52536014)(33656002)(7696005)(66946007)(9686003)(508600001)(316002)(966005)(122000001)(38100700002)(110136005)(38070700005)(55016003)(186003)(26005)(139555002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ukdld2JKNDl3Nld0clQ5TWxsc29ZeXNTRDg1SW8wYnVIcjc3NUNHVDhPZUJH?=
 =?utf-8?B?U0JsNGNWc3ErZUlFeThlNVJSYTFjSWZqTkdyQ2s5ckFvWDdOZGhtZXpRZWEy?=
 =?utf-8?B?bE10RGdRSXllK1BwWmd6K0czQmZ3Q2RUTjlxM2x2QTNWTnFldy82ZkNLMXlI?=
 =?utf-8?B?NFV6emJFeWp3NW1DaXRBV3dWV0FjZ0hFaVpqb1JmaFpNeDNmdTlqYUROTy9G?=
 =?utf-8?B?RGRSZjZGSjE5OWZ6UU5IWUhSL0lyNTF2cE9Dc2FtSEpweHVpb3l3NTJNUmg5?=
 =?utf-8?B?SjcweFRNUGhZajF6MGFqdTJ5VHJIMlBJQnlBTFZxajJRTmhpSVhhNDV4SlRh?=
 =?utf-8?B?K2czOVdaaXhXc3d5ZHhXV1YvTU1MRk42RTFkWlRqV0t5bWg2V0wzbkUvMFV5?=
 =?utf-8?B?Z1g0VWc5R0wwdncxUEJWdFBYUzBVdDhZWFFiQ1VkS2dTdEJ4QjJWSlZXTFlR?=
 =?utf-8?B?OExXRk5YbS9JKzVSejZPUmNGSHp2US9CNWoxVUYyeDZYQU1WNHloS3g0czRY?=
 =?utf-8?B?cXZrSnltUzV2OHRvcThSRW9LOUtIdUkwSnJXSG0wNkhxL25ESW52dDV0VXZG?=
 =?utf-8?B?NHErTUppQTV0Nmc2NzRZa2hrR2N0VEdsTkFpenBZREpmVVhVUmRnQmJHenNK?=
 =?utf-8?B?cHhuNW1ObHZYTGZZZ2taZWhCRnBubWJHZlFHbGhFdHlCaUd6RmhxWVFsWjJR?=
 =?utf-8?B?R29vdlBXQkJldlBJbDlTUmtVSlVSbCtYc292UTEvMFFQQzNTZW8xc0V0L1Ev?=
 =?utf-8?B?Ym83YXh4UHc1M2ZWdHdtNWxKcXZITDUvMWRWdFh1TUw3cE0zdHkxV3JpUWtE?=
 =?utf-8?B?R2toRGd5bUpRRFdTYWk3UGY1YkNkT1MwRklRU1I2YjhCVGhycitjb2U4ZW04?=
 =?utf-8?B?QXEyWmEzU3JPd3VGeldkTjFHbnZqcy9BMWRCOVU2clhZS1JGVHR5ckZsNU9v?=
 =?utf-8?B?enJGUWVULytHRkdlMURTVGxUZFo0WjErRGh3QVZOczRBVmZqUVVGRVpCeUJv?=
 =?utf-8?B?dXVreXpZRFNnMWxtekdSN0JiU3M0d3RKQTQ2NlJsUkswZ0dhZ3c1R0VsSHdk?=
 =?utf-8?B?TC9BMUVFWnNjcnRDY3c5cDVhK1ZDaUxkMERlR3dBS0FkV0JreHZOTUI2YmFv?=
 =?utf-8?B?TTROeVBoQnYrRWU1aWZpNnpEUk5yN1lKZDEyZCs0eDlEUDBXTkpvOWV5Y2Rx?=
 =?utf-8?B?QlhNanhSdDdVYmVaMWZwSUp1cHVySW9ER3JmMUFVR291UEhCcGZnNlYrSlRS?=
 =?utf-8?B?dEhjTXgxMUJxN0M5U3dWYlNEVTlzQXpQelE5bGszZ1J5LytNN3IwM3BjcDRG?=
 =?utf-8?B?MFlVWTM2LzVsZGhibHpwZ2h4UU9VS2R2UzA3ZkJmMUIzY1laWURjYUpPTFFS?=
 =?utf-8?B?c3RpY091eVJwSzFVQXZ3WTNXdGtqL0FlbTkvWG9NOW9EWG45QlNRaDV5d1Fw?=
 =?utf-8?B?UWorOHg1SFBhd1JMMHhCWlFPVEFmckZsUzZJZGlmb1VML3NKVTlKRWVaVVVU?=
 =?utf-8?B?cnRUbnp4Sk5hNWhZb1Q4R0JzWHVpQ3ZXSVJhRXRTSnRMNlFZbVFTdGpCK3A0?=
 =?utf-8?B?NmRnd0xDeTRtSkE4Z3Q1bG1KWjBWMHBYQVJvSG1FOURIS1hnVWNPV2tYYlNM?=
 =?utf-8?B?aGd3N25QdUlZVnpqQmsyT1MrV0RMYkcvZCtTdkpERmVRYnkyQ1FGOEV5WFl0?=
 =?utf-8?B?MVZhVjZFMkR4NjFlNTdDU243bDIyUExZRWZIKzhZMU05SnhhU1BHZUNJaW5L?=
 =?utf-8?B?L3EvT0hKL21HQWVVbHdUMlE4c0ROQ1hIaVBIR1lRQ2dBcmNGV2grQ0FGUHNO?=
 =?utf-8?B?UStIRXBtN1dpZVRHcUwweTl3aDQvdGt3Rk5FdElheGYrVS9WVzVlTWdEOEJ3?=
 =?utf-8?B?VTRPQXZsYkgvSGdicGI3cEVNRkgydSszbzVuUWdvRGJOd0hzT0I2K0dCUU1v?=
 =?utf-8?B?SUp6eHJBdlB2bmg2S3dwVXpmNm9mSm1neHc5R2lZeWpkbjFKcVE1bVZmSzJF?=
 =?utf-8?B?YnBvTnhaa0hFdWllVUNIb0MxUm84V0dLSW5yZHdxcDlsRXhHYkRMWm5uSDhs?=
 =?utf-8?B?ak9mZ1FaMnNHeFVDOVhlMWxPY3c0OTdxL2FwUTRhSm03ejhjdExLejRRWlFT?=
 =?utf-8?B?MXk5dWR1SiswQ2t4R0FFMFJiUWxTUzVrTWN1NUd5RUxVV2RidzNBektCbXRa?=
 =?utf-8?B?L3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7a8cba-c4a1-4268-2c83-08d9e7ad4292
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 07:09:18.0463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ViHTuIhgGFghs4OgVExKRxB3l/lchhAYi8mBYH5BeTkH07LnjxMrAlDhUibAf3sPfS3GaLGAt+xV8KIiK4Eixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5000
Subject: Re: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> Hi Neal,

> can you please improve commit log doing a presentation of what is zynqmp_zcu102?

> Is this for thi boards
> https://www.xilinx.com/products/boards-and-kits/ek-u1-zcu102-g.html ?

> If yes please describe its features and point the url at the end of commit log.

Yes, no problem.  I will add the url that describes the board to the commit log.

On 03/02/22 14:44, Neal Frager wrote:
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>
> ---
>   configs/zynqmp_zcu102_defconfig | 34 +++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 configs/zynqmp_zcu102_defconfig
>
> diff --git a/configs/zynqmp_zcu102_defconfig 
> b/configs/zynqmp_zcu102_defconfig new file mode 100644 index 
> 0000000000..5f98e72aaf
> --- /dev/null
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -0,0 +1,34 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"

> Here you need also:
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Thanks for making me aware of this.  I will add it to both defconfigs.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> +BR2_TARGET_UBOOT_ZYNQMP=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/2021.2/bin/pmufw-v2021.2.bin"

> This ^^^ URL is unreachable and I've found this as substitution:
> https://github.com/lucaceresoli/zynqmp-pmufw-binaries/blob/v2021.2/bin/pmufw-v2021.2.bin

> Luca, is that the correct one? I've switched to v2021.2 tag and copied the link.

Sorry about this one.  I was balancing a couple too many versions of my defconfig files and this typo slipped through the cracks.  I have corrected it in both defconfigs for the next version of the patch.

> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

> I've built with gitlab-CI, check this patch for the manual to reproduce:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/

> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y came out using the docker.

> Can anyone test it on real hardware? Luca maybe?

Regarding the board test, there is one thing still missing.  U-Boot 2021.01 uses distro boot, so for U-Boot to properly boot the Linux kernel and rootfs, a boot.scr file needs to be in the boot partition of the SD card.  I have been getting it to work by manually adding this file to the SD card image after the build.  But a better way would be that this file is already included with the genimage.cfg.  How does buildroot typically handle U-Boot boot.scr files?  I would be happy to add this to the automated build process, but I do not wish to re-invent the wheel.

> For the rest it built correctly.

> Thank you!
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas

Thank you for your thorough review and feedback.

Best regards,
Neal Frager
neal.frager@xilinx.com
Xilinx

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
