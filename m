Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B1BE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 11:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20589401F7;
	Wed, 18 Dec 2024 11:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj_B-ybWC4is; Wed, 18 Dec 2024 11:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA4B4024E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA4B4024E;
	Wed, 18 Dec 2024 11:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EEFE3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 11:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CBB80F66
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 11:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3laJRRVt7LM for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 11:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::61b;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E25480BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E25480BC8
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E25480BC8
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 11:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHudhqfuJGKZOu/xcAMQsOJFRX3jpsoDd0Nj+9KCV8kZcLtbc325oLb6KtHlxZVgPxbx6tyj25/gbzyybUWc7jkWOwJny73/mmyL8tb+DRaywAmCYS7ikb8fgvCSt7AFHfalhkTZxWAKK3bltJ0RFFwWd4lsL7jfLIHMOBRv4gOIgoW0JjSkXUavF7ODb9m0bMYA2duPeIRwjPPbKFK9duvKwjfrKQWr+f7LJ7Y9b1cBcrylAsvvvsYkqkPDAK2r3UW3egM468sWPAu+yjwYoF0WcKc2sY2KqtBd83e17SGyEYduyrbxZGnO0BHlaAz/rtNzolKh/XxGuD4NNCyqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJrkhVlXq3FxMajhMVzyiKHnre2s9DRkAch7A5w0444=;
 b=xjAEwy4MBICU3Y4X57mdePjEsIMueu0dr+mG9OBd2FfV5dms0imtd+AVdq9vnIBKQWBqDKcFGWcowOAvWO8DOg11s0UWfeMXuxlwdFC5JRLMn3+whoh8ozyqM1QSosxGw3Z9Fb8yHRBGvyslMTp5SnNrpt00qP6EUglhHpRRRR6a4q3fNI8cIywnfdOdvBbNjeyeliIT/A4aMRHw5mvEgEIJYUo3dvzPuXPkQwbSzt/qK8ssP6rh2cQXrCIIyrJeuQEoMpM7QkfcRfy1Au0CYnK5k839iUXiJwRn1BLgfI+zWuQTTj2Wr0MNZhl7nGaXjRutKQth69jEToLr1N2hYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 11:03:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 11:03:30 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig: bump to
 xilinx-v2024.2
Thread-Index: AQHbQkSKtlWfmoUmN0SctSPGEEbRO7Lq0m+AgADwB2CAADEGoA==
Date: Wed, 18 Dec 2024 11:03:30 +0000
Message-ID: <CH2PR12MB500407840D8CDDEFF4A2D560F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
 <20241129095304.950313-3-neal.frager@amd.com> <20241217184539.3f3c0bb4@booty>
 <CH2PR12MB500477CB18DAB3EF269AB9A8F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB500477CB18DAB3EF269AB9A8F0052@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB7342:EE_
x-ms-office365-filtering-correlation-id: 5859616f-3bed-4c48-d54b-08dd1f539b42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2hnbf5oAGcRA62LiI2a/TqAMrvRNyKlS+NvzshTmWzz0e660e1ElkGAFnfAT?=
 =?us-ascii?Q?6VJCMHQygwI8GT/j06y9RbwHdA9W5x8QYZ31McM7qiKFVQ73avjxCStiuIMq?=
 =?us-ascii?Q?jtLqEWVNEVDJsu8JEVhYVRH0K7KNYgD+Zou+LPE3hdUDE3K5Ti2cWgxyosMc?=
 =?us-ascii?Q?07BebtwA3HshEkSX1mCnu0jUMib2N5gbccb1e+bb8IsX/DhXNuoRRABSB8Hq?=
 =?us-ascii?Q?dvAy/qaLkv/mQY6Fj2uuiFnkW7EQ/i/bttQ8yRbHNois397vsAHGQd2yN44D?=
 =?us-ascii?Q?0LHVl6apdRRonzFNZktj9lwyWI4UXDnbLecPQoRzQROYgzyviI7VsQM+qo1B?=
 =?us-ascii?Q?NScv81AX4YJjisxusIOuaWLhqCSMpTV32PPvKVVc7BPCtqaGsD+sTYcNFVeE?=
 =?us-ascii?Q?CAlL4y2dJGJyKTmY/egUOEJ5/dvQKDxHl7cX9ggeqtPPEQk4S555glf/GOmZ?=
 =?us-ascii?Q?F7RmkVhye8DzAPUql6dkIwDmZmKCGVTVxCRFdofb4FFrcwtnNNPox9oFyZED?=
 =?us-ascii?Q?6pQIZ1iLAF2NtbZLLasxYmDI1d1JkPs+EubbH2WABiSK8O9+aHgveHYV2t4T?=
 =?us-ascii?Q?MDE5ntcbfrfzI9CCjP/Suw2oKEjbVa0Es3t97uq1wmX/GE7OoEGRjZa7Mrti?=
 =?us-ascii?Q?vlVHpo0iZK3x1UAEC6BanwiIkgY/uYI3Y6FaSbwMoDDmr7n+/obbJNdqlhdF?=
 =?us-ascii?Q?pz5tbx4jiYCwNWqroeS73Xh9gi1MtREQ0qSMDS5ncucCBo7lKikfmCmEYpGv?=
 =?us-ascii?Q?J/gg+LowBTmFOVijv+y0mvvcQWRX+cDg+9OiDPkcy1uhaEyETuOsGbjmDuv3?=
 =?us-ascii?Q?XS/djmzqQ2fpt2jCBTzxM9fRPZ93yyyO2TcryzpBNSHOyyvgk2DXkVEkUlkI?=
 =?us-ascii?Q?2mT+cDV/L7f6iupiOHQdCquC2yUl4QKDXLp9PH82TbWkmtifGRXZid2sAsUP?=
 =?us-ascii?Q?1I61MBUgHtncybhreMP7m2fLnyBMOx3B0sovL4fVJvsPS2dQzmx8WG9ZiP3L?=
 =?us-ascii?Q?Y1bPmGEYFjfnYu72GxzVUtJw+i5tb5530+rblInN22t8wTPIawSOqKoRFeR9?=
 =?us-ascii?Q?d4sldHIvfwN/37wIL32rJtjA3TBElfYETvF0ozLkU5LJQplKI05hdO9p2dxp?=
 =?us-ascii?Q?jniosopNANMyLemdQjTsjSRkwtkLQq+xmmCGaie/5llHk93bI2iqQzJLLQX3?=
 =?us-ascii?Q?Cmb1nGLgFClYX+jZgd1+X2mIg+URkseqwJcFse231lKSWTJar6n4BO89Cl9B?=
 =?us-ascii?Q?VqwixqhvV9W0RbIT9pCmQdOUqf6GNps8r3Y+hylD6MyocN9OXP2NrIEeJ7SV?=
 =?us-ascii?Q?HvQe3aFQ4PaXLuFqL4SiOLy5aw/gLadMRxLj1bhgQUPHD/jjOH+2rJsN2TcG?=
 =?us-ascii?Q?o73XZyeAT2ffR+y0XeGdQ1krDlHxIVSW//Zwm9zM0AW5hOEKNU6TN9v8n7W+?=
 =?us-ascii?Q?AQgE3A2j+8oPTJhmj0P1M+KDYlHTiCwpn9/lluihhXpo2umz108eRA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WiEUcodNt7mpfBHGJxnl+G6CteslxJL6m15zceWtyjpvUfezrE3JkBoVxDd4?=
 =?us-ascii?Q?O19NHwDETNQLohm281ZYa4E+Va+kgTOyA+iMGkKz2PQupTq93XtKJ7ylNN2Y?=
 =?us-ascii?Q?BEulTAlZMP3gxQ9jXSX1kITegM46ExbeeMJMVFQrKpw242dZc0vvHMyYU4F5?=
 =?us-ascii?Q?SUscWje3X/60LNMiP+4MjuiZ1eAosUmlnw2CZq4wuoKHBBulKU7D4rY5FQ9y?=
 =?us-ascii?Q?6S5Xk/kKoDjDWGvzCEwoqjCqnHbmi8G16xnYuGy3ipfcGyZ4FHMwO6TVA83S?=
 =?us-ascii?Q?kmyD6rORlI7spFWIKQ0d318N2NOxhq+nxX8ijoZ5VMjHnlirvWoUu/XyQSMe?=
 =?us-ascii?Q?ZchtZDe0F98gtMaTfLGChsC3yNS6BI/4Tgps+Pef5kqsswYb2t3Tb3+hwjgs?=
 =?us-ascii?Q?D88si5/zn9OmgwSqzjqjUdLFGPcrGk+B5GRhjvWMi6rlHVL3TXT2dHvo0pUr?=
 =?us-ascii?Q?Oy2VqllgEexNe81dEdOzndBTVGaOGfhqet/d1rJCN9K/wPr7K1UV/LZ0sNVg?=
 =?us-ascii?Q?Al9cmEo4+RZurt2cZ6xg9X5Xtj14FlMywqh2gWQr9dfEk7T45YynZRJ/gr/9?=
 =?us-ascii?Q?qy9nSh2wi6rrhTjWZTY9kIgL1CNS3ldV5XjkTr+R4NcWZqQXvHJQnKrSiVRt?=
 =?us-ascii?Q?k6ST3P8vk7ChcAjmfsbiLco2gRCWanDOl7Fmo1zC4hcHjoQA0EbyF8dI1rsE?=
 =?us-ascii?Q?YPrKdNYFA056rtveUND+V+fQcJr911Vj3dbcLyfEgsa/HoNSkEWGfLBSCw/3?=
 =?us-ascii?Q?SP3NDAxe2OyGucaixJziUbzj5NJoYawleLdt9kQ056MUAcuPIRrTXjGlanQi?=
 =?us-ascii?Q?+0bvC5MmZzi4WG6e65PpW0rAkl7N8I7Vvb/bCo/mjltk+Vas6Aa9/TBt1kO/?=
 =?us-ascii?Q?4mHUAZihTqE4D1YngmxMY4Eg/4xWioNdwoRZdQTOXgMxm47pKumivplIfOBM?=
 =?us-ascii?Q?MsnARBh7JOMIG2IzBYSsJw1mzCQMbSt37R/G/JoGJ6jK92des9A6jHqWzbV6?=
 =?us-ascii?Q?/l9n5pFyiag2B6SO9h3z7rOYYJQcpfpZTbgRkescAD6qrY6Hs/ihigDj3ggR?=
 =?us-ascii?Q?2koiNCEd4O9KyDGzeQL5G40bj4mtgVb+oJHA2H54sTfrGbur0P0sc/DXVcC8?=
 =?us-ascii?Q?TD8bEtpj8tOD37v5MH8tjT/fm6UmlVqCZxuvV2MBJsxoG5NziSbTkgteyJIG?=
 =?us-ascii?Q?Fp+TAyFo5M+mU15rJk71/yYJQs/2goWC6mHsvbotvKCn/LBTHWG4z60h5vhR?=
 =?us-ascii?Q?Hzgqg6ZP8y7oslxqH4A4qvtDPD7quHfKCP8kpBh095MX35GMA2s55jVljqVm?=
 =?us-ascii?Q?u4w0pc26rUlRpQxq7YxMdAwrcKXEdCWFDAQXR4gEBe+aotXKF3isiOFX3rqh?=
 =?us-ascii?Q?fd8UOCC83Y5rFYaV4yqqinUYAIoz3bTpjC5MGrAHYTpgUl/kyjDitOYO9iPy?=
 =?us-ascii?Q?ZH4yL4XC6uCG2tGP6mwikrGW6YjYG1IXITjeQ5inMI1E9d1tU1tqLnm2GBD6?=
 =?us-ascii?Q?5DxenqvkqSuBZGvvdp9WWCT5wjgT45zY/05t2ggk3g40iX1igBE7w+Xq8pL6?=
 =?us-ascii?Q?tcKlmYMoRJ0BUH/8cYg=3D?=
Content-Type: multipart/mixed;
 boundary="_002_CH2PR12MB500407840D8CDDEFF4A2D560F0052CH2PR12MB5004namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5859616f-3bed-4c48-d54b-08dd1f539b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 11:03:30.3827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+JwdAopGxZ/w+0ZhLeq8xCG6GrXJyQWkT7EbhnhX6TH7bavZNvh2iILoXN8+kp/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJrkhVlXq3FxMajhMVzyiKHnre2s9DRkAch7A5w0444=;
 b=KQZLRiP40NKl6mERhWkj4oFRvCkrXD17g+mdEZP0POFElvwiLVNvh5na7V6yuR2rWF+2xbbNU/AFRntAOECZv0jJc5fB67JlxqSIpRW6VjTB0ZleGDgpAJxJNAEXZm3/FRbvppWt/TMy1NwExDYBtdbzWvwTSHv3ozitDMJiSQs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KQZLRiP4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2024.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_CH2PR12MB500407840D8CDDEFF4A2D560F0052CH2PR12MB5004namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Luca,

> This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.2 which
> includes the following updates:
>=20
> - ATF v2.10
> - Linux v6.6.40
> - U-Boot v2024.01
>=20
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I noticed I am unable to boot a Kria KV260 Vision AI Starter kit after
> this series. The symptom is the boot process hungs after:

> --- snip ---

> I tested the following versions:

> 1. 2024.11-rc1-36-ga6db4cde0fcb (just before the bump)  -> OK
> 2. 2024.11-rc1-41-gd33a2cd51a3f (just after the bump)   -> hangs
> 3. 2024.11-187-gf97b67be7429 (current Buildroot master) -> hangs

> Steps I took to test:

>  git checkout <commit>
>  git clean -xdf
>  git checkout -- .
>  make zynqmp_kria_kv260_defconfig
>  grep BR2_TARGET_UBOOT_ZYNQMP_PMUFW .config  # =3D> always shows BR2_TARG=
ET_UBOOT_ZYNQMP_PMUFW_PREBUILT=3Dy
>  utils/brmake
>  ( cd output/images; cp boot.bin sbirt.bin; dd if=3Du-boot.itb seek=3D128=
 bs=3D4k of=3Dsbirt.bin )
>  # Upgrade sbirt.bin using the SBIRT tool
 =20
>  # The following three lines are not really needed: the problem happens
>  # before actually reading the uSD card:
>  umount /media/$USER/*
>  sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdb
>  umount /media/$USER/* && sync

> Do you have any clues?

> Thank you for reporting this!

> Unfortunately, it appears that our kria software is not quite as mature a=
s I
> believed.  When I bumped the defconfigs to xilinx_v2024.2, I only actuall=
y
> run tested one defconfig per family.  For kria, I tested the kd240 starte=
r kit
> and it boots as expected.  I thought this meant that the kv260 and kr260 =
would
> be fine by association.

> I have just run tested the kv260, and I have duplicated your issue, so we=
 do
> indeed have a problem here.  I am working on it with high priority.

> I am going to run test the kr260 now as well.

Please apply the attached patch to your u-boot build.  It resolves the boot
issue for me, and I believe it will resolve the issue for you as well.

Once I have your confirmation, I am going to submit this patch both upstrea=
m
and to buildroot, so that the kv260 and kr260 boards can boot without an
issue.

Thank you for catching this problem!

Best regards,
Neal Frager
AMD

--_002_CH2PR12MB500407840D8CDDEFF4A2D560F0052CH2PR12MB5004namp_
Content-Type: application/octet-stream;
	name="0001-board-xilinx-zynqmp-zynqmp-sm-k26-revA-psu_init_gpl..patch"
Content-Description:  0001-board-xilinx-zynqmp-zynqmp-sm-k26-revA-psu_init_gpl..patch
Content-Disposition: attachment;
	filename="0001-board-xilinx-zynqmp-zynqmp-sm-k26-revA-psu_init_gpl..patch";
	size=9157; creation-date="Wed, 18 Dec 2024 11:03:23 GMT";
	modification-date="Wed, 18 Dec 2024 11:03:30 GMT"
Content-Transfer-Encoding: base64

RnJvbTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+CkRhdGU6IFdlZCwgMTggRGVj
IDIwMjQgMTA6NTU6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBib2FyZDogeGlsaW54OiB6eW5x
bXA6IHp5bnFtcC1zbS1rMjYtcmV2QTogcHN1X2luaXRfZ3BsLmM6CiBmaXggdS1ib290IGJvb3Qg
Y3Jhc2gKCnUtYm9vdCBjcmFzaGVzIGR1cmluZyBib290IHdpdGggdGhlIGsyNiBzb20uICBUaGlz
IHBhdGNoIGNvcnJlY3RzIHRoZSBtaW8gYW5kCmNsb2NrIGNvbmZpZ3VyYXRpb25zLCBzbyB0aGF0
IHUtYm9vdCBib290cyBjb3JyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVh
bC5mcmFnZXJAYW1kLmNvbT4KLS0tCiAuLi4venlucW1wL3p5bnFtcC1zbS1rMjYtcmV2QS9wc3Vf
aW5pdF9ncGwuYyAgfCAxMDAgKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDQg
aW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQveGlsaW54
L3p5bnFtcC96eW5xbXAtc20tazI2LXJldkEvcHN1X2luaXRfZ3BsLmMgYi9ib2FyZC94aWxpbngv
enlucW1wL3p5bnFtcC1zbS1rMjYtcmV2QS9wc3VfaW5pdF9ncGwuYwppbmRleCBlNTU5ODgwN2U4
Li5mYzhmMGZkOWE0IDEwMDY0NAotLS0gYS9ib2FyZC94aWxpbngvenlucW1wL3p5bnFtcC1zbS1r
MjYtcmV2QS9wc3VfaW5pdF9ncGwuYworKysgYi9ib2FyZC94aWxpbngvenlucW1wL3p5bnFtcC1z
bS1rMjYtcmV2QS9wc3VfaW5pdF9ncGwuYwpAQCAtMTcsMTQgKzE3LDE0IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nIHBzdV9wbGxfaW5pdF9kYXRhKHZvaWQpCiAJcHN1X21hc2tfd3JpdGUoMHhGRjVF
MDAzMCwgMHgwMDAwMDAwOFUsIDB4MDAwMDAwMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGNUUw
MDQ4LCAweDAwMDAzRjAwVSwgMHgwMDAwMDIwMFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAx
MDgsIDB4MDEzRjNGMDdVLCAweDAxMDEyMzAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjVFMDAy
NCwgMHhGRTdGRURFRlUsIDB4N0U0RTJDNjJVKTsKLQlwc3VfbWFza193cml0ZSgweEZGNUUwMDIw
LCAweDAwNzE3RjAwVSwgMHgwMDAxM0MwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAwMjQs
IDB4RkU3RkVERUZVLCAweDdFNEIwQzgyVSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjVFMDAyMCwg
MHgwMDcxN0YwMFUsIDB4MDAwMTVBMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGNUUwMDIwLCAw
eDAwMDAwMDA4VSwgMHgwMDAwMDAwOFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAwMjAsIDB4
MDAwMDAwMDFVLCAweDAwMDAwMDAxVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRjVFMDAyMCwgMHgw
MDAwMDAwMVUsIDB4MDAwMDAwMDBVKTsKIAltYXNrX3BvbGwoMHhGRjVFMDA0MCwgMHgwMDAwMDAw
MVUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAwMjAsIDB4MDAwMDAwMDhVLCAweDAwMDAwMDAw
VSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjVFMDA0NCwgMHgwMDAwM0YwMFUsIDB4MDAwMDAyMDBV
KTsKKwlwc3VfbWFza193cml0ZSgweEZGNUUwMDQ0LCAweDAwMDAzRjAwVSwgMHgwMDAwMDMwMFUp
OwogCXBzdV9tYXNrX3dyaXRlKDB4RkQxQTAwMjQsIDB4RkU3RkVERUZVLCAweDdFNEIwQzYyVSk7
CiAJcHN1X21hc2tfd3JpdGUoMHhGRDFBMDAyMCwgMHgwMDcxN0YwMFUsIDB4MDAwMTUwMDBVKTsK
IAlwc3VfbWFza193cml0ZSgweEZEMUEwMDIwLCAweDAwMDAwMDA4VSwgMHgwMDAwMDAwOFUpOwpA
QCAtNTYsMjcgKzU2LDI5IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBzdV9wbGxfaW5pdF9kYXRh
KHZvaWQpCiAKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBzdV9jbG9ja19pbml0X2RhdGEodm9pZCkK
IHsKLQlwc3VfbWFza193cml0ZSgweEZGNUUwMDY4LCAweDAxM0YzRjA3VSwgMHgwMTAxMDgwMFUp
OwotCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAwNzgsIDB4MDEzRjNGMDdVLCAweDAxMDEwQTAwVSk7
Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjVFMDEyNCwgMHgwMTNGM0YwN1UsIDB4MDEwMTBBMDBVKTsK
LQlwc3VfbWFza193cml0ZSgweEZGNUUwMDgwLCAweDAxM0YzRjA3VSwgMHgwMTAxMDUwMFUpOwor
CXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAwNjgsIDB4MDEzRjNGMDdVLCAweDAxMDEwQzAwVSk7CisJ
cHN1X21hc2tfd3JpdGUoMHhGRjVFMDA2QywgMHgwMTNGM0YwN1UsIDB4MDEwMTA4MDBVKTsKKwlw
c3VfbWFza193cml0ZSgweEZGMTgwMzBDLCAweDAwMDAwMDAzVSwgMHgwMDAwMDAwMFUpOworCXBz
dV9tYXNrX3dyaXRlKDB4RkY1RTAwNzgsIDB4MDEzRjNGMDdVLCAweDAxMDEwRjAwVSk7CisJcHN1
X21hc2tfd3JpdGUoMHhGRjVFMDEyNCwgMHgwMTNGM0YwN1UsIDB4MDEwMTBGMDBVKTsKKwlwc3Vf
bWFza193cml0ZSgweEZGNUUwMDgwLCAweDAxM0YzRjA3VSwgMHgwMTAxMDgwMFUpOwogCXBzdV9t
YXNrX3dyaXRlKDB4RkY1RTAwOTAsIDB4MDEwMDNGMDdVLCAweDAxMDAwMjAwVSk7Ci0JcHN1X21h
c2tfd3JpdGUoMHhGRjVFMDA5QywgMHgwMTAwM0YwN1UsIDB4MDEwMDA0MDJVKTsKLQlwc3VfbWFz
a193cml0ZSgweEZGNUUwMEE0LCAweDAxMDAzRjA3VSwgMHgwMTAwMDUwMFUpOwotCXBzdV9tYXNr
X3dyaXRlKDB4RkY1RTAwQTgsIDB4MDEwMDNGMDdVLCAweDAxMDAwMjAyVSk7Ci0JcHN1X21hc2tf
d3JpdGUoMHhGRjVFMDBBQywgMHgwMTAwM0YwN1UsIDB4MDEwMDBBMDJVKTsKLQlwc3VfbWFza193
cml0ZSgweEZGNUUwMEIwLCAweDAxMDAzRjA3VSwgMHgwMTAwMDQwMlUpOwotCXBzdV9tYXNrX3dy
aXRlKDB4RkY1RTAwQjgsIDB4MDEwMDNGMDdVLCAweDAxMDAwMjAyVSk7Ci0JcHN1X21hc2tfd3Jp
dGUoMHhGRjVFMDBDMCwgMHgwMTNGM0YwN1UsIDB4MDEwMTBBMDBVKTsKLQlwc3VfbWFza193cml0
ZSgweEZGNUUwMEM0LCAweDAxM0YzRjA3VSwgMHgwMTAxMEEwMFUpOwotCXBzdV9tYXNrX3dyaXRl
KDB4RkY1RTAxMDgsIDB4MDEzRjNGMDdVLCAweDAxMDExNDAyVSk7CisJcHN1X21hc2tfd3JpdGUo
MHhGRjVFMDA5QywgMHgwMTAwM0YwN1UsIDB4MDEwMDA2MDJVKTsKKwlwc3VfbWFza193cml0ZSgw
eEZGNUUwMEE0LCAweDAxMDAzRjA3VSwgMHgwMTAwMDgwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4
RkY1RTAwQTgsIDB4MDEwMDNGMDdVLCAweDAxMDAwMzAyVSk7CisJcHN1X21hc2tfd3JpdGUoMHhG
RjVFMDBBQywgMHgwMTAwM0YwN1UsIDB4MDEwMDBGMDJVKTsKKwlwc3VfbWFza193cml0ZSgweEZG
NUUwMEIwLCAweDAxMDAzRjA3VSwgMHgwMTAwMDYwMlUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkY1
RTAwQjgsIDB4MDEwMDNGMDdVLCAweDAxMDAwMzAyVSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjVF
MDBDMCwgMHgwMTNGM0YwN1UsIDB4MDEwMTBGMDBVKTsKKwlwc3VfbWFza193cml0ZSgweEZGNUUw
MEM0LCAweDAxM0YzRjA3VSwgMHgwMTAxMEYwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAx
MDgsIDB4MDEzRjNGMDdVLCAweDAxMDExRTAyVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRjVFMDEw
NCwgMHgwMDAwMDAwN1UsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGNUUwMTI4
LCAweDAxMDAzRjA3VSwgMHgwMTAwMEEwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkY1RTAxMjgs
IDB4MDEwMDNGMDdVLCAweDAxMDAwRjAwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRDFBMDA2MCwg
MHgwMzAwM0YwN1UsIDB4MDMwMDAxMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZEMUEwMDY4LCAw
eDAxMDAzRjA3VSwgMHgwMTAwMDIwMFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkQxQTAwNzAsIDB4
MDEzRjNGMDdVLCAweDAxMDEwNTAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRDFBMDA3NCwgMHgw
MTNGM0YwN1UsIDB4MDEwMTNDMDNVKTsKLQlwc3VfbWFza193cml0ZSgweEZEMUEwMDdDLCAweDAx
M0YzRjA3VSwgMHgwMTAxMzgwM1UpOworCXBzdV9tYXNrX3dyaXRlKDB4RkQxQTAwNzQsIDB4MDEz
RjNGMDdVLCAweDAxMDExNjAzVSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRDFBMDA3QywgMHgwMTNG
M0YwN1UsIDB4MDEwMTE0MDNVKTsKIAlwc3VfbWFza193cml0ZSgweEZEMUEwMDgwLCAweDAwMDAz
RjA3VSwgMHgwMDAwMDIwMFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkQxQTAwODQsIDB4MDcwMDNG
MDdVLCAweDA3MDAwMTAwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRDFBMDBCOCwgMHgwMTAwM0Yw
N1UsIDB4MDEwMDAyMDNVKTsKQEAgLTM5Myw0NCArMzk1LDI4IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIHBzdV9taW9faW5pdF9kYXRhKHZvaWQpCiAJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDAyOCwg
MHgwMDAwMDBGRVUsIDB4MDAwMDAwODBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGMTgwMDJDLCAw
eDAwMDAwMEZFVSwgMHgwMDAwMDA4MFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwMzAsIDB4
MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4MDAzNCwgMHgw
MDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgwMDM4LCAweDAw
MDAwMEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwM0MsIDB4MDAw
MDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA0MCwgMHgwMDAw
MDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgwMDQ0LCAweDAwMDAw
MEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNDgsIDB4MDAwMDAw
RkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA0QywgMHgwMDAwMDBG
RVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgwMDUwLCAweDAwMDAwMEZF
VSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNTQsIDB4MDAwMDAwRkVV
LCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA1OCwgMHgwMDAwMDBGRVUs
IDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgwMDVDLCAweDAwMDAwMEZFVSwg
MHgwMDAwMDAwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwMzQsIDB4MDAwMDAwRkVVLCAw
eDAwMDAwMDA4VSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDAzOCwgMHgwMDAwMDBGRVUsIDB4
MDAwMDAwMDhVKTsKKwlwc3VfbWFza193cml0ZSgweEZGMTgwMDNDLCAweDAwMDAwMEZFVSwgMHgw
MDAwMDAwOFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNDAsIDB4MDAwMDAwRkVVLCAweDAw
MDAwMDA4VSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA0NCwgMHgwMDAwMDBGRVUsIDB4MDAw
MDAwMDhVKTsKKwlwc3VfbWFza193cml0ZSgweEZGMTgwMDQ4LCAweDAwMDAwMEZFVSwgMHgwMDAw
MDAwOFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNEMsIDB4MDAwMDAwRkVVLCAweDAwMDAw
MDA4VSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA1MCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAw
MDhVKTsKKwlwc3VfbWFza193cml0ZSgweEZGMTgwMDU0LCAweDAwMDAwMEZFVSwgMHgwMDAwMDAw
OFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNTgsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDA4
VSk7CisJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA1QywgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDhV
KTsKIAlwc3VfbWFza193cml0ZSgweEZGMTgwMDYwLCAweDAwMDAwMEZFVSwgMHgwMDAwMDA0MFUp
OwogCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNjQsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDQwVSk7
CiAJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDA2OCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDhVKTsK
LQlwc3VfbWFza193cml0ZSgweEZGMTgwMDZDLCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOwot
CXBzdV9tYXNrX3dyaXRlKDB4RkYxODAwNzAsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0J
cHN1X21hc2tfd3JpdGUoMHhGRjE4MDA3NCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlw
c3VfbWFza193cml0ZSgweEZGMTgwMDc4LCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOworCXBz
dV9tYXNrX3dyaXRlKDB4RkYxODAwNkMsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDE4VSk7CisJcHN1
X21hc2tfd3JpdGUoMHhGRjE4MDA3MCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMThVKTsKKwlwc3Vf
bWFza193cml0ZSgweEZGMTgwMDc0LCAweDAwMDAwMEZFVSwgMHgwMDAwMDAxOFUpOworCXBzdV9t
YXNrX3dyaXRlKDB4RkYxODAwNzgsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDE4VSk7CiAJcHN1X21h
c2tfd3JpdGUoMHhGRjE4MDA3QywgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDhVKTsKLQlwc3VfbWFz
a193cml0ZSgweEZGMTgwMDgwLCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwOFUpOwotCXBzdV9tYXNr
X3dyaXRlKDB4RkYxODAwODQsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDA4VSk7CiAJcHN1X21hc2tf
d3JpdGUoMHhGRjE4MDA5MCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwQzBVKTsKIAlwc3VfbWFza193
cml0ZSgweEZGMTgwMDk0LCAweDAwMDAwMEZFVSwgMHgwMDAwMDBDMFUpOwotCXBzdV9tYXNrX3dy
aXRlKDB4RkYxODAwOTgsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3Jp
dGUoMHhGRjE4MDA5QywgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0
ZSgweEZGMTgwMEEwLCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRl
KDB4RkYxODAwQTQsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUo
MHhGRjE4MDBBOCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgw
eEZGMTgwMEFDLCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4
RkYxODAwQjAsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhG
RjE4MDBCNCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZG
MTgwMEI4LCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYx
ODAwQkMsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4
MDBDMCwgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgw
MEM0LCAweDAwMDAwMEZFVSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAw
QzgsIDB4MDAwMDAwRkVVLCAweDAwMDAwMDAwVSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjE4MDBD
QywgMHgwMDAwMDBGRVUsIDB4MDAwMDAwMDBVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMTgwMjA0
LCAweEZGRkZGRkZGVSwgMHg4NDAwMDAwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAyMDQs
IDB4RkZGRkZGRkZVLCAweEQ0MDAwMDAwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRjE4MDIwOCwg
MHgwMDBGRkZGRlUsIDB4MDAwMDAwMjBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGMTgwMTM4LCAw
eDAzRkZGRkZGVSwgMHgwMDAwMDAwMFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkYxODAxM0MsIDB4
MDNGRkZGRkZVLCAweDAzRkZGRkZGVSk7CkBAIC00NjUsMjAgKzQ1MSwyMiBAQCBzdGF0aWMgdW5z
aWduZWQgbG9uZyBwc3VfcGVyaXBoZXJhbHNfcHJlX2luaXRfZGF0YSh2b2lkKQogCiBzdGF0aWMg
dW5zaWduZWQgbG9uZyBwc3VfcGVyaXBoZXJhbHNfaW5pdF9kYXRhKHZvaWQpCiB7Ci0JcHN1X21h
c2tfd3JpdGUoMHhGRDFBMDEwMCwgMHgwMDAwODA3Q1UsIDB4MDAwMDAwMDBVKTsKKwlwc3VfbWFz
a193cml0ZSgweEZEMUEwMTAwLCAweDAwMDE4MDdDVSwgMHgwMDAwMDAwMFUpOwogCXBzdV9tYXNr
X3dyaXRlKDB4RkY1RTAyMzgsIDB4MDAxQTAwMDBVLCAweDAwMDAwMDAwVSk7CiAJcHN1X21hc2tf
d3JpdGUoMHhGRjVFMDIzQywgMHgwMDkzQzAxOFUsIDB4MDAwMDAwMDBVKTsKIAlwc3VfbWFza193
cml0ZSgweEZGNUUwMjM4LCAweDAwMDAwMDAxVSwgMHgwMDAwMDAwMFUpOwogCXBzdV9tYXNrX3dy
aXRlKDB4RkYxODAzOTAsIDB4MDAwMDAwMDRVLCAweDAwMDAwMDA0VSk7CisJcHN1X21hc2tfd3Jp
dGUoMHhGRjVFMDIzOCwgMHgwMDAwMDAyMFUsIDB4MDAwMDAwMDBVKTsKKwlwc3VfbWFza193cml0
ZSgweEZGMTgwMzEwLCAweDAwMDAwMDAxVSwgMHgwMDAwMDAwMVUpOworCXBzdV9tYXNrX3dyaXRl
KDB4RkYxODAzMjAsIDB4MDAwMDMzODRVLCAweDAwMDAxMjg0VSk7CisJcHN1X21hc2tfd3JpdGUo
MHhGRjE4MDMxQywgMHgwMDAwN0ZGRVUsIDB4MDAwMDY0NTBVKTsKKwlwc3VfbWFza193cml0ZSgw
eEZGMTgwMzU4LCAweDAwMDgwMDAwVSwgMHgwMDA4MDAwMFUpOworCXBzdV9tYXNrX3dyaXRlKDB4
RkYxODAzMjQsIDB4MDAwMDAzQzBVLCAweDAwMDAwMDAwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhG
RjVFMDIzOCwgMHgwMDAwMDQwMFUsIDB4MDAwMDAwMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZG
NUUwMjM4LCAweDAwMDA4MDAwVSwgMHgwMDAwMDAwMFUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkY1
RTAyMzgsIDB4MDAwMDAwMTBVLCAweDAwMDAwMDAwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRjVF
MDIzOCwgMHgwMDAwNzgwMFUsIDB4MDAwMDAwMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGNUUw
MjM4LCAweDAwMDAwMDA0VSwgMHgwMDAwMDAwMFUpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYwMTAw
MzQsIDB4MDAwMDAwRkZVLCAweDAwMDAwMDA2VSk7Ci0JcHN1X21hc2tfd3JpdGUoMHhGRjAxMDAx
OCwgMHgwMDAwRkZGRlUsIDB4MDAwMDAwN0NVKTsKLQlwc3VfbWFza193cml0ZSgweEZGMDEwMDAw
LCAweDAwMDAwMUZGVSwgMHgwMDAwMDAxN1UpOwotCXBzdV9tYXNrX3dyaXRlKDB4RkYwMTAwMDQs
IDB4MDAwMDAzRkZVLCAweDAwMDAwMDIwVSk7CiAJcHN1X21hc2tfd3JpdGUoMHhGRjVFMDIzOCwg
MHgwMDA0MDAwMFUsIDB4MDAwMDAwMDBVKTsKIAlwc3VfbWFza193cml0ZSgweEZGNEIwMDI0LCAw
eDAwMDAwMEZGVSwgMHgwMDAwMDBGRlUpOwogCXBzdV9tYXNrX3dyaXRlKDB4RkZDQTUwMDAsIDB4
MDAwMDFGRkZVLCAweDAwMDAwMDAwVSk7Ci0tIAoyLjI1LjEKCg==

--_002_CH2PR12MB500407840D8CDDEFF4A2D560F0052CH2PR12MB5004namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_CH2PR12MB500407840D8CDDEFF4A2D560F0052CH2PR12MB5004namp_--
