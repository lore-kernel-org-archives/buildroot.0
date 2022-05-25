Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C578140FF4;
	Wed, 25 May 2022 13:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-nBYHO-qpMJ; Wed, 25 May 2022 13:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE0240FEA;
	Wed, 25 May 2022 13:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 623851BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F32784285
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5tX3uZB9Pif for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AEF684284
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNDUTMVrIWxbyETRrUl/l2sM9lTIGG+D54mk1TW7P7uNxYl3kAU3V6hLVMcNe+4dboWekmCvVYSsuhivrNKJDImvwDGAIcQzjqGJbRsujaRgTC7knXbbXpvuAC31f/7Zx4LX5weXAQx9PRyfv1qvFkJpqL19lenAxSsF3zgLrMzbD2cDEnu4yCHDSJEF9ZkW3hGmObFiHacjfhsNYJVLl3qHlltt7GVuoRCJKFwnPrGuhyptocxrweJY7CIZChdRTPagiyNZzcgAJxxVkEvV1dkyr/6YsPYNj4x8qsyRoKseLLWfHvRI/ild91MadNeAhDTOQVK/zpMzMDZIDJ0w1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu8BBg59422NSIhkvgObpDa6Zk7mSrAWWLhBvY44p54=;
 b=g+dTK16m/nhEomMgWef8FUNwYFaeR+RXuLZjC1lQ6MwaKWRpJbTYng4SvDTbiUe61vNmKq284EjJ/cerJvenGTBptfhTRcEwmAf5MWoiVY2GXghgRiGnsBqvwB7TNJ/vkYPIBTEFXXY+OIiGVhif6Z5I54oQwnp+bCt1UsODJKBtq0lZvbJhsmghbDsqPQIW333RBryIuxnb9EKdm8U2lYtTfMcYApRGpFIIFgeP48DsSurAxrK9iOLLv3qCYS15w/O7yGVqKusExxeUEMCn2a5UQsMozYhgILHaTSh2N+/Q2co7vGGxL0Rn/xnH8oAinAUhfquX1mvem3hmtX1yOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu8BBg59422NSIhkvgObpDa6Zk7mSrAWWLhBvY44p54=;
 b=j7WW9aaZ0PCWy2i6XYb20zQqvAIDBAttmjLG/YeQgw5kkSAo220uatUiC0P3LMyg4JrjE0ZG4XqPCeca7ttXsCRWP5qy2bF6DOEYc4RRpTAtTigkDrdL94hZTeR8xWSKlQvTsIGh8Vb6dPzNfgxZokdSw5+5T3pgZB+qEO0lO+E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MN2PR02MB6141.namprd02.prod.outlook.com (2603:10b6:208:1ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Wed, 25 May
 2022 13:34:34 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 13:34:34 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 2/4] configs/zynqmp_zcu102_defconfig: add parameters
 to generate extlinux.conf
Thread-Index: AQHYbd4SMGfwWqo0h0G1wMJwPXUt+60vhkoAgAAWHSA=
Date: Wed, 25 May 2022 13:34:34 +0000
Message-ID: <SJ0PR02MB775853FCCD9ACE68A1B1F4CAD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220522131535.1498502-2-neal.frager@amd.com>
 <9a1b68a6-f3bf-39dd-5cd5-fd8a1fb8c1b6@lucaceresoli.net>
In-Reply-To: <9a1b68a6-f3bf-39dd-5cd5-fd8a1fb8c1b6@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1571939e-3c9a-45f5-f17b-08da3e534e74
x-ms-traffictypediagnostic: MN2PR02MB6141:EE_
x-microsoft-antispam-prvs: <MN2PR02MB6141F1B1F0E5FF64B9EE4806D7D69@MN2PR02MB6141.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IW1jHc5qZcANhdWVCOfsWWPIZv+785kZyZwHV26ax6+VvmvHHeu2wI1ktjRPkgyAs5uBtos+Fq/Y4RkHTQ7NUU+JsdIyVOqZ1EIDNnOVb4DJ4lKYGX1cANVZGpWYrQ3r9oQpptAhu3bZ7xadqqR3gy+fJ4MG2cCGsJ7/XDRmuRceTKmhziQRyXcie5ySeMnbk97U7xGt5hmjGEFEFwzZWWhHA/rz4TCA0BwoW3DIdNMZmpLLfibD8r1EKr4Nf023ylXBgvRDO9f8m7gBe8GUWlUz77JJb/UXo9Ub75d84H4vo1x8MIjdTScA7yuoOxxhiIguj0BWH3Za8DI8Lp9hhPQm5ggDqfniyAmx+sFDjtaAwgwwmpdeFNKvUV5zDtLmfNUrnu/NRzvwPYGNMMWfFFnzTU3TNSdsVShOJAnliSaaiuQs7LVsiwD1XqTTaxCr+zxdfvcRdQi8idFm9HWFFEzkMSD7yKxBmGgOILGT5+p1za+DSWRsSdEvezSSC8Sns6i6eN/rp+UMlOHIlBA/J5DvaQnt5xWHlHFzeDNYHCj1f9Yl96/gkCww7fqSqlrjsqsTI16Da5Yss0uXwlVKBoez8Y+sux/n4wRdQhwwfwocN+VRlt7ej1pfbYhdlSjfVAI1XXPKsSVTEjcFLGy8jXOeb72X2QvwJEXgen0dTfNKLQLDWIhJxmXJIxgiuvtKkBwlXIR30CzsfiE5uRYuLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(55016003)(64756008)(66476007)(316002)(508600001)(38100700002)(26005)(4744005)(38070700005)(54906003)(8936002)(186003)(110136005)(2906002)(52536014)(66446008)(86362001)(66556008)(5660300002)(76116006)(66946007)(4326008)(7696005)(8676002)(9686003)(122000001)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFhPMlkxc29ZTGRrNGFNbnorSVB2Z1VzaVhkTGE5M0FEYWVUdk1ubTlOREdt?=
 =?utf-8?B?b3FhK3N2ZUtPbFZYOHNnaWJPZER0cTJDeWJQbVZtbUNwYWZWQXorWEZpQ1gw?=
 =?utf-8?B?djdHa1NjM3p1bk9GamFTK1U1Y3JxdEpXSlFjUDhMSVhFUVdMZVdoYm5nd2ZB?=
 =?utf-8?B?eHA2UTUxYVZ0dFJmeEdwTW9tMVROVXJXcDlnNTFvUFoveFVtcW55eFMxa05P?=
 =?utf-8?B?TUVhNmQ1Ny9tZ0J6L1JBYUx1Znc3N2hQOThWMkUrV29JNHZNZ21YL2RmYXdM?=
 =?utf-8?B?bGkveXZNaWhGZjNGdDVvM0xOeTRCQVRNQnFVc1hDbkR3NzJOY2dkOW1KZzI4?=
 =?utf-8?B?RGtCaXVDQ2tTc0c2QjNCWFhiYUdxWXpnM3FyS3gyaURNSE5pU1B5L1R1bnRD?=
 =?utf-8?B?R2pVUVo5K3JKUnlQcUJybysvOWFJdXI4RHM1WXI3SEpSYUZJZHBhYTRCQWl2?=
 =?utf-8?B?R3F3VVJlVWltMFozSWk5VFBuQzgyRWVJQjcvNUV6YmM0ay9aY1dnYit5RmEz?=
 =?utf-8?B?dXRnQTN0MVlPYzNZZUNpZ25DQUQ1VUlvMDkvTWxjN00yUERUYS9WeXR6WGJS?=
 =?utf-8?B?aHdGdUNwNmZsM0tBOFBwY0ZNVGdHdE1xSUZ1MmVtdVk0cjZwRWNMUFlwdDdV?=
 =?utf-8?B?cmdMV0hRNkRiZmorZEVGbXd6STBMYVMxbXJ5M2I2dmpJUGUxMVc3VkRpUWlq?=
 =?utf-8?B?SWJtR092Q2p6N0Y5bllCTEkwc2pzd3JkTzQvV0o5L2ZYMk9vMWU3djkwRlBt?=
 =?utf-8?B?YzlUa29hQXUwUU5KSXJ1UTluNkNhdEl2bWc2MUIweEloVXlQZG9rNFlHU0lw?=
 =?utf-8?B?bG9PTHc1WXJ3N1A2TjcrT3liYWx4ZHgvT1Z3a2VMTjEvckxCZ0srZFJOYUJC?=
 =?utf-8?B?UEVSVWNuWG1lbHIwQmdNdzRCcEJiUnZOSEFrZ3VDY1dqNmlLVkQvUGZXUFM0?=
 =?utf-8?B?OURsR0F0SzY0bVhGVlhVcFRGdjJJU0x0TXpXWnZXRE52b2hpNVg3VkQydzUw?=
 =?utf-8?B?aVdFZnM4S2I2alJOL1dzTTdWVi91dy9GWERIcXRDams5L2IxeFloNnJvT3JH?=
 =?utf-8?B?c2ZJZU14OXRiNEhXQkxNK1NnMzJiZ3FzRlowVkM1U2hlQjRoUXovLzFXZzRi?=
 =?utf-8?B?bHdhUmhxeitRNzdPV0c4VG8yaHVIaUc1Wm8relREaklTZFdtS1lmeE9xM2pD?=
 =?utf-8?B?SXZnT0tNQ3U4ZXRvNWxjRkdLSVBNS3FmUkYrUGM3dG4vV1pEL3lSbjQzTGNh?=
 =?utf-8?B?V3dOZm0rbFl1d2J4NkJ6aEJiSEczWE1JUzhjMU5sVkQ5WHhXemZiaWRZRjl2?=
 =?utf-8?B?TmNVMStSWW54VWZSTUdNTDBDT2xyR1NOdFUvaU1QY094Tlhjak0vekgrdmhr?=
 =?utf-8?B?SmdXd1V1ZmVkYnRPMTg4b1k2UjZtVmVOeGZhRUxxd21FZVdsbFdYb2U2TDJG?=
 =?utf-8?B?T0oyUXEyNG94TnZiV0RBM3NFNVpsZXVqdGV3L2RWKzBId3B3aTFIM3RvcHRG?=
 =?utf-8?B?cUxEcGJseE4yR29TTnNKYjZtaVQ2Vk9GZ0ZMZVIweUhKMHE4d0U3eEV5RllF?=
 =?utf-8?B?K1Z1OStPSXJOTEszOGxzdFF2a3B6Z2lCVTdSdDBsYkNPOExtY1ljWWxsVjI5?=
 =?utf-8?B?a0F2TUxkRDNtTjdwUWJCQmN4N2JMRVpvZXplQmdxeHlRSUxMdmtQUUpicENT?=
 =?utf-8?B?UHFrQkprNUVvYTFRMVpNRmFWcWVTNWs3RUMvTkpSZGt5cnN0ZVdleVkvRGpD?=
 =?utf-8?B?UjlQRm1RbFVRTDdhaE9QWXl0dE1YeEc5dnJoNXJNQUdzMDI0WTkrWnNZbDIz?=
 =?utf-8?B?WDRqa1dGRmxJY0hKcWE3MHg1U1kwamlmSUxBTGtxdHpINGFrMVlEZE9KYVdE?=
 =?utf-8?B?Mk1sWU9kODU4S1p6aktNNTdpRTNuY3JoaGZ1VVFFc1QwdjBJREtuTkN3MnB6?=
 =?utf-8?B?MXdIOUkwVEl0S3U3ak03YnNSZFEwdzdQUDZuanhxSEZMV1VpdWZjcDFzcGVT?=
 =?utf-8?B?TW5qUU0xNXUvRnlXV20xODQwRTVydm5CRUpvc1Z2eEUvaTdDcTdWWElUZkMy?=
 =?utf-8?B?YXVtaHRxZUlKWkIwMDVubjRtRVlScENnelBJcitDcFh5R1NNQU1EZnY1eTNv?=
 =?utf-8?B?L0RPeGtvZ3ppSWhNVmlvRlJyZW1MVmRXdlpwVUNDQmN1S2h0QjEwNCtTek9M?=
 =?utf-8?B?Q2ZVL0gxWHhmUnA0enBVMm5PTytsT0wwZWphNTdxTVN4YmpuRFdkcWdNem1t?=
 =?utf-8?B?T1NGenhETGdkdWtJVXNWWGJhQWVsWVZ1Y3ZmOEJ3VnZHMFhHWWZaWDJrYzRS?=
 =?utf-8?B?OC9pakwwM2E5MUVmL3ZETVZDWlZXRFVMdEwxL0IxQmhDaGsweStrUT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1571939e-3c9a-45f5-f17b-08da3e534e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 13:34:34.5684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3pT4RABkTRPX5KaWfJZIiZtEHFVdgOBdR7xakfBG3Mt4g+ftsALelwu+DOXUWxeg84Tler/UMVUmmI6FR9dsgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6141
Subject: Re: [Buildroot] [PATCH v1 2/4] configs/zynqmp_zcu102_defconfig: add
 parameters to generate extlinux.conf
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch enables the zynqmp_zcu102_defconfig to auto-generate the 
> extlinux.conf file.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynqmp_zcu102_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/zynqmp_zcu102_defconfig 
> b/configs/zynqmp_zcu102_defconfig index 5361981f5b..217fa0814b 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -2,6 +2,7 @@ BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"

> This patch as is has no effect without patch 3 where the extlinux.conf file is actually removed. Thus, for the sake of commit atomicity, I would squash patches 2+3 together.

Yes, no problem.

> Otherwise looks good. It's a nice cleanup, thank you!

Thank you for your review!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
