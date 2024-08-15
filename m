Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A2C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 16:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D8E60591;
	Thu, 15 Aug 2024 16:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq8MZv2xYXzL; Thu, 15 Aug 2024 16:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0C81605AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C81605AD;
	Thu, 15 Aug 2024 16:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34E141BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C5D40159
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBU6X23IbWW5 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 16:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::623;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8B6440471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B6440471
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::623])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8B6440471
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 16:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm7JT6OPGlqxg6RHHd4kS27rOLVtY1Wmf5qHIe8FtyjokNAhgOFnn7vVYJDELPUBe7dWtyaOHY0dXQB8t2m/v3NIXo7lmk3MqI1e0vCDQBmxvOFwvNyxOXm5Dw7uTWBTqj0249EzHcpWT3d/2UCi6AwKUxLpFtclpXqbnMR0lEw0A9hpr1JK8KyeS8NReJKJNxpQ/P+6rPaNrjzm70wdNIHFlxs+8l4uLRIkA2jECdCkHrnJyX4rpsi0P2/AjNleFKnbZk1hiIRZxuWMS1hFuo6d1Lyvk5Utt4cU54SApTAuyJX6HzzBEDceBal7gGgLkSmpB6vaTQ0bP6ASKr4Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNiUgra71Xw8dQVeIojLbmhg6QDQS+l2zR1MIKFrR/s=;
 b=p0pedHuZOIWhNJSd8wi8hKYqS9ll8z1VvKpA9HZ6TBameEyTm6OmAfWP7r68WF8c/PqQE/q/M82IzUXDmhEQM3Vr6jVdMQswQo5UPMclmapBi5PcZvUVAUoxiXbIJrT7LaMQsAMaki3jexlkp66GvqiOWoBl+KVErga1Lef/vae166YNh7M6Clbvc809AdbIbePk6rRqQLKyVv84LpTjWxDGoIrfo+y5STGJBin90EKeeaNTzMt3DyTwGaQcJ6QRAvqTSLHWuy4aHXAvhfEplEzC90VOrz2xmgb+fYARqiU46hxh7Nd+OSzmEmfa/GjkYFNSP5sgKTXoQP517Av57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 16:13:15 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 16:13:15 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/zynqmp_zcu10*_defconfig: fix parallel build of
 U-Boot
Thread-Index: AQHa7x378IRyb4pmuk6DLPh5CaiomLIofFJL
Date: Thu, 15 Aug 2024 16:13:15 +0000
Message-ID: <CH2PR12MB50046FA66DD021675C226330F0802@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
In-Reply-To: <20240815-zynqmp-zcu10x-defconfig-fix-parallel-build-of-uboot-v1-1-5fef12406c32@collins.com>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6627:EE_
x-ms-office365-filtering-correlation-id: aa895754-802a-493e-3774-08dcbd452b13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?iEwErg3buEpQk7nF43lbjgs25U+kUOy6WDodeVn/mO2yk7xjpDwz98Ty3p4z?=
 =?us-ascii?Q?cSinRts1m+Nls7mTTx7xF47z3AGNWkAo6mlatrxRZtMJttBZrHrOzVgeVzjt?=
 =?us-ascii?Q?OVvU8opqmr5oVTHaAxBNiZr8g3yuSveAEV2wTphXssRFAYEBH8VIdCx/fGIB?=
 =?us-ascii?Q?US5MqocFM6ppraVIgmHVydariI3zYGzbWTnTnC1ZcyCl/qn/pjCIHySjcjBh?=
 =?us-ascii?Q?mmpt2dZA7jO9N3hiz8xScg876y4uquL9/n39nJ52zKQ+AzwvAO84C1fvh7rU?=
 =?us-ascii?Q?lWvku6BerV1kLWDg0bE7pvuE1tCeIIN518anIn/r7cxzT5behcIQL3a/Hc9P?=
 =?us-ascii?Q?Kd2o+VTnfARY9kV8gy9uq5kVmWHMycuqOXWJ7rI67jLqc4KIl2xzf1HvFOsu?=
 =?us-ascii?Q?FoZsVKEv3Mmdek5K7YfcZDGrLeviaHVPPfEksiF4s5m3RhftGrsperQ+Opco?=
 =?us-ascii?Q?ItbCjFIxk550HwmZi6i6go/kn5jllsNljv3XGYkhtqmvpkDDir5gS3VJfSHX?=
 =?us-ascii?Q?g92SbrEZzG6+XAOCAPfNY+bXaxERqZfMajkIFqiNWtOUrPczYEV/YQBhqOL6?=
 =?us-ascii?Q?Ppmj71csi6UziZ236tvOUTuMBKZ16VAuHF/68AhRcLEJ3M/wDaxasJsmpPhz?=
 =?us-ascii?Q?LKYQ4swIhuo6bh6hFS9eUEKhRYd0Q0PTXZS6615BYCbr+NAkasHJw8N4ayqD?=
 =?us-ascii?Q?//Hn6e37fG+yytnt9y+D76dhCZJMhZY4aDFQLqbIXUChhr0bvW3C7riQi6nB?=
 =?us-ascii?Q?map0jNcudP9aqfBKpjSoJIcSDcFksoyM8CT36pzOpZqmfjVY61ZkdlCagUKS?=
 =?us-ascii?Q?82+1Bx8vs81lZZ78YlNrGB0ovX71r9+ls2rc0FbXW1k7vhIKSvg5ve1XuCgQ?=
 =?us-ascii?Q?8fGYwDUbehSjutLiruCiOpPZ1DZ2LP7MVxq5/DdK5ad1BDTuwBZQgHdCp1rN?=
 =?us-ascii?Q?OjXmE/n3Js2HQMdT8dKhCqjAidzJ8MFRS6rf8GN/B00Sr37F8EnlXJ0C1MzQ?=
 =?us-ascii?Q?925G54SMjeI+yOjCPKdyXeYocsFjc3LOvmQpz8hPZinJTeWnCRYJwG6O0B2V?=
 =?us-ascii?Q?C7A6tuwepePNwVuISTWs0iA30/X/+Rwsr/vXl5hk3i+3oV4xCJXMhvdbCjAe?=
 =?us-ascii?Q?dfCpUk1NTdPswGf8/7g+fT0QfxkPNH2QL5t1Zri6P+U1FoqKW3IxIS4LpyUu?=
 =?us-ascii?Q?dXtrFJd2DlWx1ghQ6q1p0wtQAfcV3twLhTM102UAPv07HbMXVkGpxQ68P0VR?=
 =?us-ascii?Q?YgoeK5nNuPdoMxxKOdlLsW+681SR4519OpsynwE6QDA/0b3tw2tBSvkhUbH/?=
 =?us-ascii?Q?MKqtNYEsvONlekio+KXbQTBMa2cdKy6VJE/m3AYfPEN/aPf+M+IVdnFOtIDs?=
 =?us-ascii?Q?+0lmbtdEyGRcTjcVgrJkIfvpz2MciU4UgHERWKtkmvArKYyqHg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?faOukNcnagWZiap40mmFJDcQE1gIJCYD3aUsi+C7kflvJQquKdhY5RX+a9Hp?=
 =?us-ascii?Q?3DyltLNj/mtC+mQmkdWeFQb76HKdh7BcqzROma9cO1LGerTYRJl9pJmIpSie?=
 =?us-ascii?Q?FyndZlvTuT0vN5n7CIMY+Bqu1njQIut76vV3mIbDxaOV6IkjvobvuNeLZe7C?=
 =?us-ascii?Q?wi8sMSf96DKwJC1HwsviOuIijQKrVA1J5SVcobR8vP9NujvR7RAoukWkdHJI?=
 =?us-ascii?Q?UT30TURDc/sxBmp+1Ba4LFidIrpY0Q7+OJ+DjM0+lg6atW3CPb6kLi7q8WsB?=
 =?us-ascii?Q?OGLlwW6a9z3c4MbyXyNJCB9/W4dLBhiXCeOSFPDl6YiGtXBHQLLUv6uZYrN5?=
 =?us-ascii?Q?A49R0rcdDxTKITpSCAIfX4D19pDvwe7YyGXvFKQOStiPIujp4WbxTfCsij31?=
 =?us-ascii?Q?ZkZd5+bBdr5BrH+0rKEWCoEOP1x3kNTvmNwv/oizrBYEN2+gjQHKPThe04Yr?=
 =?us-ascii?Q?KhAIMU+iK7j4pxzV7BURD5LivI72KRNvL7vtgJe4sQVDpvBmAyItMsV2/t7P?=
 =?us-ascii?Q?AFCWYacOoJIugtS+sdTuau0fQ1CYC+MCvOTiZFbw/LMHkes2DkHDYhohKsO8?=
 =?us-ascii?Q?m35mBAQxF8eD6M6wSF9qxutsHP5gwZBS859KDDzKHRLqtgdAXT/O4ilZJwOJ?=
 =?us-ascii?Q?P7LZSFvR1+TWxh2rODHhGmQgOcXGjhJxabYrhHwi/UzfOh6/pjrfN533rLGZ?=
 =?us-ascii?Q?h/20pFKFYZUD+Mr5UIq8TvsXOgVNPOHiXnmkOLURUVu5K/oLSH8zDVLsE2JU?=
 =?us-ascii?Q?F+rAlUVA4a5bYvDznu9xndZlPC7ylcUlcesyM6A9VfETkIW7OXwcZ0eZo84L?=
 =?us-ascii?Q?urSS9NDbZ/eZ25XOYFFyL4orz6UNy/Af2CC5wNCVp9Uub5lMsls6ZHmXLXSd?=
 =?us-ascii?Q?V9WWN77ohkxgaSVahsscWqEOwV6zvh/k0VROYSuoAFfQVW7Z4g751m3UANQ1?=
 =?us-ascii?Q?xKQlO/i/VABqa7U0GFcENApiUwOC9qGAfSO3IyF6HZEf/QWCNoWQmqK6khHc?=
 =?us-ascii?Q?vV6JyWpyAsACM4Ak4X/DTJXafocOMoapsRf5As1i5rMGlN+VlM3fcV5XlnfA?=
 =?us-ascii?Q?m0ZWxIMpZQG9oBbqpMk/qyUtjLwATkq0j4oBNLDW71bfJZC6gQSzqOG0JFG/?=
 =?us-ascii?Q?LOIEmEIkuwPekXYGF1VCGx8rRBR/sBwgqqkjwovBnb3VVqLLOTIV563SkyZf?=
 =?us-ascii?Q?lDvou5Bun1nkU3fZJOzj67wzTiLOkIABpqTO6P/PqKPlA31S6kcVdfDfnX9I?=
 =?us-ascii?Q?cTPlKcpJbkrPJ+Xte4D4KZ0L20ASwlbEQFNnVPiKWRYaPgxuPQktl7s7HDn8?=
 =?us-ascii?Q?hp4nNq70EjMWAmmCH20ZWrr3AlBgpxT1pKpu6WHP15EzBHd6oaFRT0/ZVz60?=
 =?us-ascii?Q?ARAZ4fYJ0xiU8EfZYlgHLu4rmHVKnT4lEEh0J5vGN5EfUZnIJxGvKh92CdYv?=
 =?us-ascii?Q?5vCyXCqqFgTmsZzs5xPyUAjr4lPjUNBJnRquRGC3HB3NQ5ss45f9mUC99Z7o?=
 =?us-ascii?Q?ssbvnaMq765siHLWBIUbBRe3b6gQlMW4mJGN2FPzm+ViP3q/PrWuyAj9mAze?=
 =?us-ascii?Q?T79m4dlKZNxwokbI1/ef2f9z41rusCbnBv3w/fmlk6aKCzYPVKgqslmI4WJR?=
 =?us-ascii?Q?nXfajJavsNrSJ0OhmhUy3f6O1iYvs77JCVJSgRW54djW?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa895754-802a-493e-3774-08dcbd452b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 16:13:15.2456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rn1WdlnvZB4ylkn3EwNtaB5FF+VIutrQ8zINu4AKQqOkUe4fQk9uucQjdpyOg31u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNiUgra71Xw8dQVeIojLbmhg6QDQS+l2zR1MIKFrR/s=;
 b=4eOpJ6CCaYC5/SJPpJC+SXNYPtXe9XXpmjJT7+VZUxXHWBPXGtqmFzbWLB/fgbU+WHeKfSDONoQ0yIPPaIrqMgeXww2U8uTgrCv1/WcCmWOT6FQa9YuFy3LyAHHkE0mZwlbaTZfQcBFBip+c+NB6hOo10kAhOwbNOOB/nNLJDmQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4eOpJ6CC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_zcu10*_defconfig: fix
 parallel build of U-Boot
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: multipart/mixed; boundary="===============7147726854019134316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7147726854019134316==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB50046FA66DD021675C226330F0802CH2PR12MB5004namp_"

--_000_CH2PR12MB50046FA66DD021675C226330F0802CH2PR12MB5004namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

> When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled, the
following error occurs from U-Boot.

>  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: > No such file or =
directory
 >    18 | #include <uuid/uuid.h>
>        |          ^~~~~~~~~~~~~

> The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enables
> CONFIG_MKEFICAPSULE, which requires util-linux.

> This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This is
> because host-e2fsprogs requires host-util-linux, and host-util-linux
> always builds before host-uboot when single-threaded.

> Signed-off-by: Brandon Maier > <brandon.maier@collins.com>

Thank you for this.

Could you also submit a patch for the kria defconfigs?

I am sure they need this too.

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD


--_000_CH2PR12MB50046FA66DD021675C226330F0802CH2PR12MB5004namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Brandon,</div>
<div id=3D"" class=3D"">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif">
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">
<div><span>&gt;&nbsp;When building these boards with BR2_PER_PACKAGE_DIRECT=
ORIES enabled, the<br>
</span></div>
</div>
<div class=3D"PlainText">following error occurs from U-Boot.<br>
<br>
&gt; &nbsp;tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: &gt; No su=
ch file or directory<br>
&nbsp;&gt; &nbsp; &nbsp;18 | #include &lt;uuid/uuid.h&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ^~~~~~~~~~~~~<br>
<br>
&gt;&nbsp;The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enable=
s<br>
&gt;&nbsp;CONFIG_MKEFICAPSULE, which requires util-linux.<br>
<br>
&gt;&nbsp;This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. T=
his is<br>
&gt;&nbsp;because host-e2fsprogs requires host-util-linux, and host-util-li=
nux<br>
&gt;&nbsp;always builds before host-uboot when single-threaded.<br>
<br>
&gt;&nbsp;Signed-off-by: Brandon Maier &gt; &lt;brandon.maier@collins.com&g=
t;</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Thank you for this.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Could you also submit a patch for the =
kria defconfigs?</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">I am sure they need this too.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Reviewed-by: Neal Frager &lt;neal.frag=
er@amd.com&gt;</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Best regards,</div>
<div class=3D"PlainText" dir=3D"ltr">Neal Frager</div>
<div class=3D"PlainText" dir=3D"ltr">AMD</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH2PR12MB50046FA66DD021675C226330F0802CH2PR12MB5004namp_--

--===============7147726854019134316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7147726854019134316==--
