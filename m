Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC6BC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3539B4098F;
	Tue, 16 May 2023 13:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3539B4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urcCennW3HVi; Tue, 16 May 2023 13:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51A8840576;
	Tue, 16 May 2023 13:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A8840576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC9361BF2F2
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF72040576
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF72040576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmtWKaiiIVvH for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:01:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 752BD4052A
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 752BD4052A
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEwGvFw+QcB3AjQPYrXNzVFy7xTlJIEbm8eNJO9OP542dlvVRYMHQk4W88sbULi5QAAqjnOZT6Qn5Zj9MkzHGX3rguKc8Jsc/4WbPj85XelfNDJNV8jvKBo/SW3h6K75FiHjyjbQuNWocOrrviUz2xT+RToM+iXRPsayzlCTd10pJ2+NyJxsUmzb4mucnmUlBguoPrLC5fDFyazdqgAeKf5efTcw7bV8hwFq1B/cUzblkZwka7gt96+i4mUdAUW+p8WkEM4yv5Iy5R8g25Si1/RI1RXOiNsLArW9/SEnifDTHYqkS9AX17b0I5cIJNHZLDQwWHQgf3+ipaOYDP9qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzf36pXO40QbYW7iH7kK9TeMGlZEZkip/Ulcrrzu4tk=;
 b=BiOI57crjWcjyxDX0rN1KgEKzDY5tlBW8h6EYAjZ62GS9NXe5r76Wu1gq2lRJhZ1g43jFxOzbtTSImOOJqmo//NIcMG7kNM+IOuNhAsO8obvfDe3LHB+HpBxzABj8r3l/aeMH2vSIGdy/3bN4CsfjU/Kdhb619clgNK2HGQkdeuowLPegciWRg+1xGgwrHD1465DmLPyTNS/Oz9qQoYQGU8puK9vlUam1k0L7Ytrozy1Ohm+WpV/jxlK6lsZ3rG9GXgJTAHt8d/pHVOsTsvYSX1j9Oi7+7tyCKC4orWsaQrFbWv2ENo/X42EfMwp5q0JX44+p45HqV2R7IFgF6ODPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 13:01:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4%6]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 13:01:08 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump to
 xilinx-v2023.1
Thread-Index: AQHZh7kIMP+dUVQqn0+LJMzoeXettK9c1O6AgAAGjeA=
Date: Tue, 16 May 2023 13:01:08 +0000
Message-ID: <CH2PR12MB5004857831B3E58A57F20687F0799@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230516054053.22133-1-neal.frager@amd.com>
 <20230516143025.3efbe264@booty>
In-Reply-To: <20230516143025.3efbe264@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CY5PR12MB6132:EE_
x-ms-office365-filtering-correlation-id: 4b642023-b33d-44ae-6835-08db560d9dd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nn707Ont4uk5ipoMH/hFzCb7Kxso44GOesyV0t5jcLjLb/zvl7De4IZxZFWbGnRqg5nMXJAHuZqkAmopRP9nW3I4otwotaDaV9peAlgFYVbBr+iKHhSS4eeKMyWAFpQ9zJ1t9wcRcGkZ89aCL87d9NV67asQ2iWxiluKmQ/l0pYlGNFlf0JFBgWWqVkpaeJcCTw5n2brun9wTdDRDRkI78gP48uUgYms2ZUpdjEKcjNVkw5JcOTzi3CSzYbrbb1k24rLtrUIquqeLXxkTx3u6tz1RdtO+ng3TLmjb/6DR5jCohl8Zx44DUEIkXsiMbFL1KgRVfkvxHnRyKmV8xgSDgxxTcX0mgdTk4DsyOHpwApUOdVJy5rsALzvLvaDH+RGh9TZgfBzV3PKzeNw9fq4wXWHy/NuYDYQOwU1NYDcxtYyeUYymb2CpG0UDstdTwM831VR6VoXmnu3J950LiTz55HbZphchIVgOwfQE2NVLanYqtoXJdYFIkpLkDmRujJj3MfASHJ/jF7HCX7c6PBPCJl3YMhQ4NomNciY5BFQHHNWE/sv2ZjyKMb5F6QQ+GpsMUnFdWCCZ1zNm3U4euPc67H0UvT1R/zRm6aw7j2IeX8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(71200400001)(55016003)(122000001)(38100700002)(186003)(6506007)(26005)(83380400001)(9686003)(33656002)(2906002)(52536014)(5660300002)(41300700001)(8676002)(8936002)(478600001)(38070700005)(966005)(7696005)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(4326008)(6916009)(86362001)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kroZ7cpgydqLfDwa2wTyWpKFke6sisypL1m6iaxJtiw9I/db68UvhRR1yn?=
 =?iso-8859-1?Q?b5fjWvDjVpYIwjOUMsYYcr4gl333OGxY21f09iI9tggABMGnEEz09SsJfu?=
 =?iso-8859-1?Q?vBYTEfy1mQXUuYvGPdwJ+FfQRxhZiYLaUiKvWtBtUnGvKNYc8inCxuh99Y?=
 =?iso-8859-1?Q?AvtpeHRGCHFKaKxQHszeqygu0eZS2EdLFhBqC+sPPJTY271uMPhCZkMCd6?=
 =?iso-8859-1?Q?a4hG+wxoFIXfkNAfr6pAnmcr9jwZOoqhP+u9DDcrDUWD6x6jou63jfugKa?=
 =?iso-8859-1?Q?ZUMPa+fRAap5NMPSB4bweCjMgbn9REsYMXHTENxrHV+3r3GzBGYkD1leiI?=
 =?iso-8859-1?Q?CvxuuYFPbLegGViSFl8VfcdedsdBPoEDR9GHvineE8gh3/WAhJaiwMIY8+?=
 =?iso-8859-1?Q?wvmt8S7ksubamDpJnDAzxrsjblfndqVQilz00+hSSweS27qyn6MZcBTCoh?=
 =?iso-8859-1?Q?pn7giojqfc+wLc/2GAN/XE9Nbni8Q9cVyr48L9XWg4qpYxSWossa2yAA7i?=
 =?iso-8859-1?Q?ynMrc9ANKk4AuYGjgiKEURvfoy2zh099TmekbEsZ2g2UbgR2nL+kQ5Lqsv?=
 =?iso-8859-1?Q?wmm9qU0Pr3KPPhU5EwXY5ix8ZdCMQ9CIhoBq8aERlxb1xiYO+nSJ1fX0VQ?=
 =?iso-8859-1?Q?w2g3RxehWx6lqAdIo2+SZ2hncmRJ0gBZfT6kM0cFidq0oOzNn3S3p/WCAt?=
 =?iso-8859-1?Q?s/PM4wg2u1LMsKd52luxDF1yWc3TwlfScNK1VB9TFMzCRgMQHOT3z3/zHn?=
 =?iso-8859-1?Q?czPAqK7QQ1PO7Ik4QSFhk1XNfbKtB0duU+cVX/KOdN29ij6ck+qcQ9p4Y/?=
 =?iso-8859-1?Q?/bkCkS20t1n+5xsVtyJOBuP1T6BHud7IxPcaJNpz7BRhTu+Lh9pYYl8/ew?=
 =?iso-8859-1?Q?DW6HbQFrFIeED1Yp2dxeqnGW78E0Oi/JnS8NWxcIROIBFGdDXwxsybSuIh?=
 =?iso-8859-1?Q?7OGmn0utQ0TfLwHGjOsQX++kRokGhcFDS7aTxjemBc1WLXot6DNfTMe6HO?=
 =?iso-8859-1?Q?FVdgTcELBvOz+xJWu6DJNDEbWAr6RRJfg3zfGu1PXB5ug+x6waXSiwCoYf?=
 =?iso-8859-1?Q?gzaz39hS28ekb6cvPKSJubJQ6YKk5DxBT9mAzuixg8y4gQKQccjChNZX7F?=
 =?iso-8859-1?Q?ZrpkTszFEFNY8FuYJGbVU8Z71fvFgpmsVhJkcHwRWltFx0VDh4oe/+Xp+t?=
 =?iso-8859-1?Q?YoHvNHEldx63ZDDUAlv7aIxjLp3gEQ9mKnYsCmXFkCngws7i7WIeF5qctu?=
 =?iso-8859-1?Q?iCpqd5ZLyaHnl7z4DPgQEOTrJ6/SlTx4fHvZ48mwwvWNhEp708ADuCEVso?=
 =?iso-8859-1?Q?sDcZUKT5lnIbHQG5uYM+sLITy8F72kduTtjpWsW1WZqjg0TkPByhAs1IR4?=
 =?iso-8859-1?Q?pAsz8FKWcjO2WpK9SDUjb8kGLkJ6tExuTYTsXsuByG/y+G+TLGPFz/DyjK?=
 =?iso-8859-1?Q?MNur+1dvPc9dXiLWmp1CPvQYcG7PiGeSGVT38g9Nw7/HnGrWbVvwpCJwrc?=
 =?iso-8859-1?Q?a4BEep2OfCBXA0ExotXBcNY7PA5966TjxQW5/caNuQsaYxcc3l6MB3UmWE?=
 =?iso-8859-1?Q?YP3MaogQ+6/exSyj5hCUruVOcxHVk7o6NzO/5rHV6Z1yz8NOi1nD85OYWT?=
 =?iso-8859-1?Q?osyV4gsNp0GVo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b642023-b33d-44ae-6835-08db560d9dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 13:01:08.4998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3o6e56A7EFPcQrw/4ZaVw8yoo7Ns30S/B9n+mhmmuVBK8Ps5MYRW+b5Ot7YTS0p3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzf36pXO40QbYW7iH7kK9TeMGlZEZkip/Ulcrrzu4tk=;
 b=TStVcs8+my8JQMQ3hXJqpWD6/EC9hs8c/jxY0KwjKnMpln/rlLHkHCcslin4ifu3xJEho9rKw/O8gR510XSboOINNp/X+FYvKWc/1FXW3Ri9gr6xi832EYbP3WhAy4VyvVMLY+YKKYIdhRMkf0UFvc2MK+ImXi67wN1NiBIt1I8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TStVcs8+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump
 to xilinx-v2023.1
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
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch bumps the zynq_zc706_defconfig to xilinx-v2023.1 which includes
> the following updates:
> =

> - Linux v6.1.5
> - U-Boot v2023.01
> =

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>=A0 configs/zynq_zc706_defconfig | 7 ++++---
>=A0 1 file changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index 3ad8cbafe3..55e4d8ea23 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -2,12 +2,12 @@ BR2_arm=3Dy
>=A0 BR2_cortex_a9=3Dy
>=A0 BR2_ARM_ENABLE_NEON=3Dy
>=A0 BR2_ARM_ENABLE_VFP=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
>=A0 BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/zynq/post-build.sh"
>=A0 BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/zynq/post-image.sh"
>=A0 BR2_LINUX_KERNEL=3Dy
>=A0 BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,linux-x=
lnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,linux-x=
lnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"

> Booting a mainline kernel and/or U-Boot on is still far away in the futur=
e? :-/

Developers are free to choose the kernel and u-boot versions that they like.

If they prefer to use mainline for zynq7000, they can, but the only fully
validated and tested versions will be the releases from the Xilinx github.
For this reason, I prefer to keep the example defconfigs based on fully
validated releases.

The link below describes how to rebase the Xilinx releases, and
developers can see which patches are not yet included in mainline.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/821624836/Using+the+X=
ilinx+Git+Rebase+Patches+for+Open+Source+Software

Users can then modify the example defconfigs, if they prefer to switch
to mainline and apply the Xilinx patch set.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
