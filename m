Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262F9C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 11:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E3F040A65;
	Mon, 27 Mar 2023 11:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E3F040A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIV-rMF9iHud; Mon, 27 Mar 2023 11:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C585240105;
	Mon, 27 Mar 2023 11:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C585240105
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA181BF2F7
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 11:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B98C41403
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 11:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B98C41403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjUdu9u8pIph for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 11:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCD941296
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DCD941296
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 11:08:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9n8iUIHWRHEuPK4SaPCG3GFCUIUxfpDmgrlUnPm9l/DbCyGraBTBeIabpP6BJOTM08zZQb8tcFphK5iLNd8Dv4cjfv/Y8WMP809n8Lqot6mkoZzJ5IbErpd9lUZ0VBEX9v4lp1OewOpiHF5BFBkohWqbwLtWIqQbQCIXDBiC/RrZ3P2B7uAUj66AlAlwJDFqOu1+NLtkSAjM9QG0K2aInjy62cEahfpn73NKhZNXV5lrPCy6E3Fl54pixqPwOrZTC2E8Fckk3IqrmdnJ5UKRI66R10+QPNOXn0gdwZddpE7KyPwlo3JezqdwKrKtF9O1mNgDjUteOlOb99mkKvZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibi95V7sJL8UrmZnh80h87ETCVyufiRNC+p6mA8edCk=;
 b=RC92AdfaVK9oSxgj5cJ5lkSVxUgVmydNyj2rvY+5YFNHvPOK6ZWX8c0taJOQUFBOi0690ZHMHHDL53Gv9KjnofUvZ488pq6PiHb8WZxDaCGrCHwVapsQIeaS33dhToYQTflvuzFWLz2vTEOL/CK9yGzNccbi1WBa32kVuSVFznqEPtjZAmxMzishBmKgIQ9dx3eTmgvCTI14qiRXmbwcmhzFyrDl9etvmR6yoiM54g0GeGeUktS8nVZpnb1RdnwsS9CRxcb5SzlitzNNxoLn3KK8qqfpck4nqilpFlaRDIzUJCqSaUKJbe1oXO0L9QPH8FbZ7ui7IlkbX/7dKJS7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:08:43 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 11:08:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 2/2] boot/uboot.mk: new
 BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
Thread-Index: AQHZX+ymUnTA8pRcbEOri4ovE6Wyna8NfcsAgAD5b4A=
Date: Mon, 27 Mar 2023 11:08:43 +0000
Message-ID: <CH2PR12MB5004C7876744F27039BC2FD0F08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326140949.11262-2-neal.frager@amd.com>
 <20230326220908.623ba0b5@windsurf>
In-Reply-To: <20230326220908.623ba0b5@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH2PR12MB4135:EE_
x-ms-office365-filtering-correlation-id: 0b63be59-2efd-40c3-1d26-08db2eb3a0f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BuIpxcaXw4//3PsJbr+X02VCC+lLQIKxDDF2X6hBYJLgIlinNXQ3HuEaZ6tW3/+pRATV/A/lWwYjK43+h3LlUv8QPnMej57Op0yvE8B+hQzU3ewzKdHh3LSzqDkPGzkANOXIg85g5LykAzfLUCgoXGmG+D9DBaZ6o9bljqbRTk5kFLl7ClFde8eT2rV637g6PU/3Dion0d6wdFO0msdFd99WaxziyYNGZnGjUqlihrXv2VTR9iGI7sDFG8+h3WQ+htUZrvcbwLTe7486ZmGae6JgP/o3g5AEohK0RoQxqxl9cVx52wH6Mbs8FCrcoPHQbk6mKOgC4UVkmIqKjUU/+GqRSjv7EPj5CzWNbQezcKwcvzWRhxybn/pbBDNY3eJ3vFQkPp0YzJU0XldUBO/ShSyZ02QXYA795t25zwwXRQpXIWGbkGnJ6TJPNh9Uds8hyo5i7YSR5ZivUZJHut68F1qMBITKdn5NSAUJrZuBXdZjKO6zXZ2Bdv/xUovwbZdKqqwKn8jnQG8vs723u8r3zdiDBDlQnZ3Ov0ZppMs/8aqVrFpgyacKEFqWMVZSwpeDjx4xflKs78gAij7DbuYeOgkuoTAIfm5KUXqwMXYQsFZgPcuw1DyR4KfXQ4B6sq1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(38070700005)(66899021)(55016003)(316002)(83380400001)(2906002)(71200400001)(9686003)(110136005)(76116006)(54906003)(478600001)(7696005)(8936002)(66946007)(52536014)(5660300002)(66446008)(4326008)(66556008)(8676002)(186003)(41300700001)(38100700002)(33656002)(64756008)(122000001)(6506007)(66476007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0swFlqEul83M1NFLsDS/Z6Mrdrnm6vjPbYn7r1wpNlSMzVnISARyn4rJCaJL?=
 =?us-ascii?Q?Wn6YgToIfze1iaI5idFb+DQkKcXzvEJcPDtJa+DK37m1TIDJftjHgfQbfv/G?=
 =?us-ascii?Q?2rxanFUaSNW8ooq73RwiH7UpzBKrnJVCMScLGYIscwr/8FQzawlhcvXi2VDC?=
 =?us-ascii?Q?7AHLHgUXCZAMqgYqAHF3XeEpggU1RyO7xoWSclMkfHdyCNUGN2LmM3bbXSpQ?=
 =?us-ascii?Q?5bHZWwLNGT4jNRxd4PVSyNpmxMxcGrzdz/uHud+L9ZjhWHimTdFvtj1jLmfA?=
 =?us-ascii?Q?k4Q3g/uq/N6UngvdQb9ZATFeeVDsqfMlgjkmj3gLnfnV3ySbAdJqBqGYJNqS?=
 =?us-ascii?Q?KXNd8pKwya5HwBpb6EwjzQkJ6cc3vqCgS5OTwEz6tCuMREc87ZWzjW5ci1mJ?=
 =?us-ascii?Q?cauHVm8mk6U7ZbWJGII+c3p3gGoDVY821AdhXFJt3v2IAp1SNOZmV+DtAj11?=
 =?us-ascii?Q?8qOBjZvV073t6LYXEKulSqCx7tQ4QXmvvIm6ap1FTP0scR14AxLSuIwkzhQ3?=
 =?us-ascii?Q?wz2ilTc+WNtIOcpcTrs3AoqjrfVCwlDGpIEaagbUonMRx2ZkZ37rSbVpvFTg?=
 =?us-ascii?Q?oryJFZFAya9PAj2O6Ty5nQxDxAjc/6ZCDFU2BiSbt/f2sUU7iqZUyqkfHi3Y?=
 =?us-ascii?Q?WYeBDBksp+EFXNFmyzx04i4gyBz1+uOn1MDqug2zCpRi1vdxo6ElXznjECuv?=
 =?us-ascii?Q?eofzk1rl+IkMckQodsvGL3GLO1gkzDRSPxb80DpqTijJPqBgFs3l8/vPS2+z?=
 =?us-ascii?Q?pz6BzW5pv6qWsbsY/g7vLib6X5JtETuujGVztp9woto00/8Kb9EWJyxdE9Ub?=
 =?us-ascii?Q?4RYO2If7PB9v+UAR7R3kqefJv4Lw5VRzs7h0Qu2+AaxmsQRjeb0Q+3NvdVDT?=
 =?us-ascii?Q?HxMeDd/usE5cHommfXyci907l1Wfj2z1AmzusTr9TD4ByLOGf+nLRYmgKH6F?=
 =?us-ascii?Q?fEfdmbG6xn3CuI+WEg1X1pExgFR2+etaCQPM4XAUwfoZQhHjLeSHhsZufhC/?=
 =?us-ascii?Q?6u0mUhm7N2C0u3BZiTE4s+PGeNrwQDMW9Vqx1DYiPNmsR18vxK8r/8GSYqON?=
 =?us-ascii?Q?uic0kFv2XeganIj2oLvt3H/tfDE8pTZ9UlJbkBxZIlX3fHhNRwkeJw5wVHex?=
 =?us-ascii?Q?Z4iPcgjF6lAhIzAR9uAH9ivyvuQAMD9yAQtO59lBWH5vE86vo6Lc5cL8vOLd?=
 =?us-ascii?Q?mKB1FR6KomYq7SXp9bjdwszZXgI+sNFIwj25ucKsnPYh5rHXtCQtGTxDfzsg?=
 =?us-ascii?Q?zMLFMAK+OY3OloT+SEwvOLqEqxypoK01gYlDqd3B3mPGM3VNWZRjtujCCmT5?=
 =?us-ascii?Q?m6xd4sCRtNnKNG0Q/W8KhynGo3JmD/effYvCD0T2WP+VtfLZJi0BVrAX1JZX?=
 =?us-ascii?Q?SBGfhJ3RmKs4DLmdFS2sa5h3YaUpPyqAuoKl2C3BraaMUR1xduny357mvsdm?=
 =?us-ascii?Q?XZSqXVZpx7ISS8GlVR1bBA/giNmmBl7u34qyocawHdkB8Z7JwAjW7ybNHNSS?=
 =?us-ascii?Q?U2++vj2c8hBGJdHCWHfIOQPFmYk7YmOO25JmPJhOOq5UwYI4+so+C84UYqo9?=
 =?us-ascii?Q?P+XQB+buSxASL166r1pjZC5kD7Ql4Y/xBbA1zBViilaxkD5ijRNz+SIL1ATS?=
 =?us-ascii?Q?9DY60snaXDX+QEuEeXkg+wQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b63be59-2efd-40c3-1d26-08db2eb3a0f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 11:08:43.7470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZ/iBqGBpgJimS0uXeSLQJRCAnWgySnb1tHLXPCfGf1eqyXtvj6UhXTaFKgsuzNz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibi95V7sJL8UrmZnh80h87ETCVyufiRNC+p6mA8edCk=;
 b=yGLdtY7z/hQUkm1MwyIXvcXW9kcFNEU3KkF7A2WUhC3bdSOh60Oe+yEmw4zuWm7WU7+e3Rv5tzB8QxNl8ofSaeE0Vx4ngOXpqMhCOpv7AfACYJfsoKDpbyc56hrhNmAIBCZO37TshgAERnHOPCHmj30eSzyXTxnnPyscC9wKDU4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yGLdtY7z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] boot/uboot.mk: new
 BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
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
Cc: Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Luca,

> The new BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE option will enable 
> u-boot to use the zynqmp-firmware package for building a pmufw.elf 
> that gets included in the generated boot.bin.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/uboot/Config.in | 11 +++++++++++  boot/uboot/uboot.mk  |  5 
> +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in index 
> f5c20f5168..116df71ea3 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -476,6 +476,17 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
> +	bool "U-Boot needs zynqmp-firmware"

> I think this naming is confusing. If I understand correctly, U-Boot now offers two possibilities:

> (1) Using a prebuild PMU firmware (this is what is currently possible
>    in Buildroot)

> (2) Building the PMU firmware from source (which is what your patch is
>    adding)

> I believe the proposed option naming/organization doesn't make this very clear. I don't have a super clear idea of what it should look like. Perhaps we should have a choice...endchoice that makes it 100% clear that the user can chose between using a pre-built vs. building one from source?

Yes, I agree the naming is not 100% clear.  Would you be ok with my changing the current BR2_TARGET_UBOOT_ZYNQMP_PMUFW name to BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT?  It would mean needing to change all 3 zynqmp defconfig files with the update as well as potentially breaking things for all users who currently use the BR2_TARGET_UBOOT_ZYNQMP_PMUFW config.

If you are ok with changing the name of the config, then I would propose the following:

BR2_TARGET_UBOOT_ZYNQMP_PMUFW - bool that enables the selection of either of the following two choices:
	BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
	BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

Would you be ok with this change?  At least it would be more clear for the users.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
