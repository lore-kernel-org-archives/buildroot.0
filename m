Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204DC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E932C81D5F;
	Sat, 25 Jan 2025 22:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oYuKP8MBB-I; Sat, 25 Jan 2025 22:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DDA812DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DDA812DE;
	Sat, 25 Jan 2025 22:58:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23ABDA6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EAB040AFA
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Of_kQ-jJ6Q5 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::610;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0186240B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0186240B0C
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0186240B0C
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGFL8CYSSyPeD0ETWAg3NEp2a0K0HpHuyqYGuvmxBt+tVxPx4xbi9rFd7HEPV/HyRd8NEPXfL8PmT50c2SF3N5TfKTyuuNWHBOivYQWne4j8U9KElD11CERgegmf1bABbZgOv8HRcKEyDe/+Nxt6gY6t3YpcBa2VyxF7wsSvQuOWMENax7ALyG053BS0ReDl1kb4qAK7Rf0SEiOBAbtS+YvDrj9TAKGzCeQ0IEOe42n4jx5CnVV3d13ZkjSFdmiKDOtscV7Ke3SNnRSsV0HvAalrP6TYXSQ9rsMc4HFdDhhjvBXQ6/Fnyj2v9gzj2n3CHTjwRuKaKlOG6pJcTmkj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xUlrgKyxzhW9ofVUuDflQGWXXQfb5z16iRFvG/QXkI=;
 b=sYRk0GmW58GzeS5TjsQOD4j/D5YnNaaQkrFlsxEpKT4/gaCDZSyoRzdietiSGaGAza1NEotzs5KCr1VkrLXgHhOI3WhAwLCH2qs+YUjoCXzkmPoB4c61aEpV1m24FYzddOYh/16X3gJ1Ia2/fTPcdldysUIBiMaMja3iSSzHJ/giYxlM9kPtcbFnizQpIG0MXdNwUo5jXsTDDoZkLOlGUySdCCItfToHguglruAOfUmxyKiXXwi8qOSvCPxMos+hVz84aMNT9ZTujuQ4paTSTeK9yzlAZUpGZhJlMp59URistPW+48dPLKCNike4P5rqiVXpilgZ7bnHDxjUhGV82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sat, 25 Jan
 2025 22:58:14 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 22:58:14 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v6 4/6] configs/zynqmp_*: migrate to binman
Thread-Index: AQHbb3ty+137Zig/aUuL3c5sLbhAp7MoGIog
Date: Sat, 25 Jan 2025 22:58:13 +0000
Message-ID: <SA1PR12MB5615D71450446D92040C933EF0E22@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
 <20250125224930.3639111-4-neal.frager@amd.com>
In-Reply-To: <20250125224930.3639111-4-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB6653:EE_
x-ms-office365-filtering-correlation-id: 1423cebd-f5fc-495b-5faa-08dd3d93bf74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NLYv8Hy3jNWal1zw8+u3lR0OGXLJPuHx0YINEoWgQRhhXdBIhsN4yN3bwm4l?=
 =?us-ascii?Q?HJ9ZpbOxAR40ABwSaZSlHw6wm0dWlM2hMS5LDXDx7TdnKApeRaR7ES0g3hG5?=
 =?us-ascii?Q?4q++w1uZGes/aNxj0yX+4TEBi/oypsvDD4wMzExH8QD3ItJcyDy81NrIlTUh?=
 =?us-ascii?Q?8cVmREdr8p6m4YYfqTuPCTVULnb89e3m1GFX4YMRyMXr1qbKVCiGD8vn3wzX?=
 =?us-ascii?Q?nm1CwTcMiReTbIjz7X+eV57u8rINgeoiJ4i8WC86CRNAXJ1EibAdbO1lzqY1?=
 =?us-ascii?Q?nlOsPckRK6D32B1X4lSIuXGkPf27T0HILwCUsi+Y9gPUmD+2tsLBcu/hdPu0?=
 =?us-ascii?Q?2RDtYrV0ZTXsbWYguBR5t9wuGJ+jt+Hz1OYJFhjmJXhWVXnLk3zuLKIeAYzT?=
 =?us-ascii?Q?9F+D6GryY6MrNm1J21jEicUzqh3shWaI3W0UtUIHzBxqp1MrIdgKAMSJ+oIY?=
 =?us-ascii?Q?6LiGTNgg4Sbkvm7zm47yO/uQxG18/eHL59ESTDa7B6+ufLFywFG2W7r6B+MN?=
 =?us-ascii?Q?wqPA29Sy7KMS5rkfPlVnmSuE0KzrRoIdIZaLUMiGH8LZULJ/rox1SC6BB2pC?=
 =?us-ascii?Q?7DB2ZmzZN/TFqxmDq3DL1v9qXLZUpHzBTwPtjizYEuBd15fqhfKAj3n2zUe2?=
 =?us-ascii?Q?Yi7hnSwwUUYk1pK+pnsFFP/bSzlSQ6qhoGSVuE9wiHLOZQL0vSezDSAioTGh?=
 =?us-ascii?Q?g7beKItJ8ZLHrjEy1cVkfR0v2pgY0A/vxfOhZaHrCj0zJH2idMvTodsJ5pzE?=
 =?us-ascii?Q?9asN9bcezG4MPPQVwUcXMtXhccpAluWvUvteFySqIfvQT0hsLuIIwfACgH9N?=
 =?us-ascii?Q?z6mleYzankstjlHPWWoHltCk4T7V3tpShUaH3dvWnbLszgr6M4NoSaxc5/Dm?=
 =?us-ascii?Q?7YN8jyswSlTuVINdsinzTWp5vO9ZwE4YnFrIInsYBNLEK6gtS+tOCefCPovO?=
 =?us-ascii?Q?BV0XLy04P0aaeamX6Su+yF+vyVyQkKN4zbJogUt3tkPmFLv5wzidStEVeJBJ?=
 =?us-ascii?Q?ZWL0pJCJJL8kgSv/qpEpMyquaMUzWvYhVm4QXKKcbH1YuEdDjYGVSpx6xsfO?=
 =?us-ascii?Q?HzspY/ZiRPJHagpU8XK6zcEqtt8rdMz31M6CJ8PdpKQKODlginC+A7P2Wclz?=
 =?us-ascii?Q?UvoT4wUy1hc2pSPNkvYA7qnIASPnOXqXIDp0Mz+RA7DOBak93zazK7f8Novc?=
 =?us-ascii?Q?rEhKOBsLAn3YDTA77pe/2tZ1rx5gYwOd9b4LCwhrAvm0dU5O8UzdRJA1Zu0f?=
 =?us-ascii?Q?i+OXygtT2pKFik1QU+EjgtJOektWtP/ehLZdE7gQSaCDRJ0RPD+AHKf/6e7n?=
 =?us-ascii?Q?d/oXaod7hN07G22Q+RMg6r59iWkuvUjeuT3U9SZKeljfA/Br+B6/fXIS5a70?=
 =?us-ascii?Q?5bakGSPpOdo1J0Iu9Duc0P5yb2eEQJVi/oIOuz868Z2nSEC5dU2iEKAXezB/?=
 =?us-ascii?Q?7aalPeJPV3t2gL/okaAwZWXJ4ChGEoXozy2KQeRJpTV4O1Ho9pnkhw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?To+5WggDcaJSJfhY/SeCimnEdKAGq4WtnubKbMDMaVTXZk8FM8Dinn9kJJ1o?=
 =?us-ascii?Q?4UjfBeNuynxHPDImOMywWYFYNOjx5286Pl/GS+aqleD1GR4HWavuea6D3WhH?=
 =?us-ascii?Q?+umm4LtgDqvZ68IGJ8fY4/8RVUoUe7RFmJaqcWCfj3Q0/9P9Kd0K8EPFaszf?=
 =?us-ascii?Q?UkWy644oZ/cJumhuYP2rNlfJnjKgYp5MUz8oFjLVPIv5LaavCd+uHG5ncv8N?=
 =?us-ascii?Q?VAA/DC+t5tMZC8vWlz8nmRr5M0gTFJabGK91wMg+RokZy8+eshUBXC+iDAAK?=
 =?us-ascii?Q?6rMyZRU1zHqj/eafzdVYp31PHJPTlU4jpTfQkmENhAy8o3X2dqAsVNVeJbjD?=
 =?us-ascii?Q?mi+cgcFg4XcwInjzMRfQ3TtsnXfqe3KJrHtO7LLdouTaMPm48qUfC3Hw8Odn?=
 =?us-ascii?Q?KSb+fdyapN0yDzudS4Jbho39s2sQKvA9uQjvUtTK11azB80+cipGmLxWPcEA?=
 =?us-ascii?Q?zwdwHzGQUZTQ0hmRjdFaPTQl73Q7H4PcQWTJyz/hrfhTBTfLPR4qM90PrgE9?=
 =?us-ascii?Q?Ppwpn19+NVlCgkAWdYh7EUGJ8MMBkJHzEwULvF4u2Jy/oXP6RMcSgX93dacw?=
 =?us-ascii?Q?mLDtPVnTA4lLc0piW+SbmigKbw2c9bQCf1Y7WQSf/7S2QGFBBgcAeB9QSsHC?=
 =?us-ascii?Q?blaVmTQsSHZh1KcWPzAHF3pb6x6FMIb4rpFswB/U9935sDmGW339UrciePiQ?=
 =?us-ascii?Q?L7pSijDNy4uck99eHg9YwCFSbZD1Fk2fe2hlQapZKz+4F+m+HXTyMD6uaCm/?=
 =?us-ascii?Q?PG5rkRw8szOggabiLdrUfgNgzh0Jzu5wWkHJ3y6iQ8sXl03mmYdSV9yCXM6q?=
 =?us-ascii?Q?lVJR3Iex61vkUpC093JNiqhfkN2VlzeqyMCXTIuyvZbQJd/VFctPvEpLxZCe?=
 =?us-ascii?Q?Pi2UeuS6JMaGygfB/lkERY1M9FBAgoRQJQRbvU4SNjxgMqPpM+UbMVueEX4b?=
 =?us-ascii?Q?rinaQiVjSQvAmLbgGjWzH6IXNOIw6Ai7DMDIriOFWZwlT19QroymwKF6V4XB?=
 =?us-ascii?Q?4pvvJjz43iwhSvi9sAaHPGnwDwZq5QAzJF4jxeJvnDbnAmuuinrlwfim3AWa?=
 =?us-ascii?Q?FXkKyrrZXGjuSaTzPUQCUQ50g9YJQXFYvW3rYKGG4lc+QBDRcnL44vQDk0Ze?=
 =?us-ascii?Q?UhC6tTzTnVL92iqbeWrFSQeO3iMFiG3OETuxzvdGlQ9IIrsID9SUQmIl56jz?=
 =?us-ascii?Q?lCUO1ZTu+kBcMFuiQycggtoMFkrh/XaYG+bcGawOGiAiCMIjPVz+6MzbpAjv?=
 =?us-ascii?Q?0EAowujU7pqgO+6b7VDIavfeG/eddNSpvFdmzUmBDvSAFOIX4BPSvvjdH7oH?=
 =?us-ascii?Q?+gaFwSwVbt33x7W7ER15B6+V4kg0Jk2yfhzvTsU2SPMS1h5WIrIb+fGCL534?=
 =?us-ascii?Q?SxkVRVyZ1/leAwURhG2VUKj5CHn+0ycUkF8YI2vmfZe30cWD7D/zdLUoG/XD?=
 =?us-ascii?Q?AqUy2fundDc6xeOL8dp7MD+VVZUoS1/LBF80HCmSJRjagJ49ZVzdtNpSe21M?=
 =?us-ascii?Q?vyu5RJASWhNJiaigm5S/YIglZ4Sx4Rf+gp2bO6yy1m4ktiML4tdJ49GvnzSQ?=
 =?us-ascii?Q?ivRVQOkqXtQy7Y2BukQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1423cebd-f5fc-495b-5faa-08dd3d93bf74
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2025 22:58:13.7455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25kEtbWdm7584fuY9KjUoL+nW9+cyBO8E9E9pcq+1Gm69hQWJzglA+ZcnPAnH3HJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xUlrgKyxzhW9ofVUuDflQGWXXQfb5z16iRFvG/QXkI=;
 b=kmonwnEGDPAW4xx9yxR3Q09K2l3O2o0Vd7b7ZDyGzXOVbZlQdekl/izepmCpUrKNZNHuCRZRs/hRYfWHKSHpaREcY5cKAhRTNFV0G4SjC3BRc6enPfJ7al7smEAv8Xt5vmmChGx7pftAr++wOkxJDXXts39x7wDX2rfWBex8TfE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kmonwnEG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 4/6] configs/zynqmp_*: migrate to binman
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch migrates the zynqmp defconfigs to binman applying the necessary
> upstream uboot patches.

> With binman, u-boot can now build the correct u-boot.itb files for kria
> natively.  So the post-build fixup scripts are no longer needed and can
> be removed.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - new to patch series
> V2->V3:
> - squashed patch that removes the kria post-build fixup scripts
> V3->V4:
> - no changes
> V4->V5:
> - rebase Buildroot for zynqmp_kria defconfig changes
> V5->V6:
> - rebase Buildroot for zynqmp defconfig changes

--- SNIP ---

> diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> index 6a6ed87dff..139ad7157e 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -2,11 +2,11 @@ BR2_aarch64=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Fantastic news!  The xilinx-embeddedsw package has been accepted by Buildroot!

For this reason, I had to rebase this patch again since the zynqmp defconfigs
changed.  These are the lines requiring the rebase.

Would you mind testing the rebased version?  Nothing has changed in the patch
set aside from the rebase.

> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"

--- SNIP ---

Thanks again!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
