Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EA1C54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DC0B60F82;
	Tue, 10 Jan 2023 09:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DC0B60F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORY3F0_uNG-J; Tue, 10 Jan 2023 09:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA4E60F78;
	Tue, 10 Jan 2023 09:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA4E60F78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40E7C1BF86C
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8EB160F78
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8EB160F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaLO_wQSWRCx for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 09:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286BD60F5C
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 286BD60F5C
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8kbt18gzoT7ayhceP2SxGQw74DRK5q2jlSIitct20kxqtk5MlTR63FFLWRLZm5G3t0X35AU7XxNBUhQyj/QDGR6s8aR5eGoqTrjQGsTRF4F/sSLQyQEZZc2WzOnrAb75Ickd+wNsP2oDZ7J561mXNT5AErkHXlV+8NhhqWwBCzbuo25EURg80ZWZtbVyPD4sF4pbMCnSCLRipZf3cfKn9JPGUMug3hv3morAkYxpEqiNsTmasVOuDJT2uiAzk/Xcd/VYx1gi+rNLaowHEGSOejt30IwXUdLMhAWjYqbG5vD8aeKfL8fdwv0NcWPG8FlxFx/5ryMEFz6HZ25wpyteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvIMZFL4Z6dlc7iX9cLYbWnvzbW3rHckBkBifSwZT7M=;
 b=MHJihAV2XRjZVH5Xb1Y28h2TewUUpxMNQ22qBPd+5MYwQoJ/D7DH+/DuA1ECwSvAOwih8BOzfFttDQdgbaRq+u4i4EnK2P0lFDbUrxf7sjBpObBBsi8jr8oOReZ+8dNIxwGUO1tafK63DOsKuSHFeqxzc0NJhRA91qeoMMSmpQdiS93p80OdHpCr8piepMG9UVBgAKVJW6cjgyKomp4Nl74CznElrMViSmtFYq99dLqSiR3tXAjtev/xNfrAvH58ynu9bD78PqHohj+ScCSbLB5eXBmphoFyWR1PIGHpzAw2yUzzfVVHnf+XiCAmDEGmG7FXCRoavl21RWpO3peHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1770.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:324::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:32:43 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:32:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] package/freescale-imx/imx-gpu-viv: drop X11 output
Thread-Index: AQHZJNUZl0snb3c8X0mMIRP+GWYqyg==
Date: Tue, 10 Jan 2023 09:32:43 +0000
Message-ID: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1770:EE_
x-ms-office365-filtering-correlation-id: 5a236102-b4cc-459a-cf07-08daf2eda018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5bDR3n+IWKoJd55YWqA0SOueTX9dzjyTFCliI1c+hki0T1sIQKvZU0ua/Lj0gIRRvv83rhHdxUQuwXsAdjBnogYx4cY5AT0x/kxbRO4eNuI1CAskxSCICCbTW04h4fVGePA5fq2OwF/DFFk2lD8thPnYE6tlBoRmlGDhJfUiG2Vfe4WQcHYoHH75zJ94wTSUmOF4yPzHIKvgFQh8tTy0OSIoyeGQBTGvzdKztOyxDcpCI1on3JaTeo7PDbG48TqTCvGj7S8qm+d5dwxPqCa4ltCa4FM49mfqC+9DlVYtfZ/2tTA2KInTT5RRUPQllNHI+lhkjVLvXcn8/g6P4yzR+k37lL8mDMtirPN0fFHi6YWYjeayNsUXDB1df5eFlkKZayAB6mK9Zm7ifiB9+r7Fb0ZmvtveO534PsJyQU9BwAocy4H1gn2s88ox0jyw47WDC7ElK48qcYxr0YXdZAQWHgoF5ZxXTBKMLB4oO+tEReCwM55mlu1CAcizMv20g0YoFp7DXbrz/8RMN+B1eke3qAfEiVePsoBoHrg9YpaOE2B4loYyAOmF7emIoeMNsCC2AWYNJKJ27FQApRN0wqGiLZFJIW7bc0XsToRtTfrLD6ric4SKKJeOoPqX8hjQ7yO6Qf0gXQ4+WAoDZNgeYM5T3EE/x74OU94jikXLrhHEGUTDosj8cvf1jyngJ1UK6gABFE2HVaNv/PO1dzeuKdi1/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39840400004)(396003)(366004)(136003)(451199015)(76116006)(8676002)(54906003)(41300700001)(86362001)(6916009)(66446008)(66476007)(64756008)(4326008)(33656002)(38100700002)(122000001)(66946007)(38070700005)(6506007)(26005)(7696005)(71200400001)(478600001)(66556008)(55016003)(8936002)(316002)(2906002)(186003)(52536014)(83380400001)(5660300002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KiFapjQureATrCy/HbAAmS2pSQieOfFHZb4yYk++NeiXfkp0ycvr6fKi4g?=
 =?iso-8859-1?Q?QHP/hdNElJaZTI0/LNHclRRgJO74/YZy2xM363wbFNWua3DsESEpOmV3Of?=
 =?iso-8859-1?Q?hJ4mFpR+E/5qGZZUnEEoKVetGRAA8V9/8gg0fdIQt6ED6LkAL2UQmHPtEt?=
 =?iso-8859-1?Q?/PqrWGoIIlwP8mtL/IE3eQX0li8Jo6c4sVhQy0MCaiyjWIVVXJpicfC22d?=
 =?iso-8859-1?Q?JHITu1rHvF4LjRTjYpSETXUtP9kBM71LYXSKQ8TwtQb8aPTAxWwQPBd4qd?=
 =?iso-8859-1?Q?d9BrTW7f2Iph3C8GoPcwj81XRH/nZWDAhHkPFyrjd0DhRMr6zTWoLj57Tx?=
 =?iso-8859-1?Q?RuJcUhmxvika958VdyHG0a/nrwUfVT8FEKIw7NM0S3bKqn5IEVpKjDcIRV?=
 =?iso-8859-1?Q?YTnbOWUipnfrVZ+9d5hpxda5f+J20MWmiOHz01Lm/VMH1uXkF/PkFAIbfW?=
 =?iso-8859-1?Q?J5V4s0zrr7eYMeaJyF0wM6btFYtB4mvHfshoRXVECdm54Yf/UutaEeG9t7?=
 =?iso-8859-1?Q?RorON5tZnoFebwhsd79yJZldTAVvQ1ckzZIPBio0gx1xedazMKNPqifcRf?=
 =?iso-8859-1?Q?+9c7YHjJ+0NakRwHPdO8yBSaqz/fJrsTIXrnBphS2PXI1Ir1SNjQ3DcEVr?=
 =?iso-8859-1?Q?wyhAJio7zoP1icZJMipOeU5uFTgYhhU0rzYla67Ix0tdrN8Mj6sOZR46Kb?=
 =?iso-8859-1?Q?p7L+XJDI2iwcQeb1b97tmnZ0zKm7QKHwp2asoVVn5TaCs0P8V0lvo4KyOf?=
 =?iso-8859-1?Q?/DZpJFcNt0kC/LULsaOOzxZzOHnymLSobIaE+OP77eX67/AYbFgxRR13Fp?=
 =?iso-8859-1?Q?l94y1ktkeSxXLHOdVq2+sowbBVjaaRYoigJGyWFE+9k0jb6Vof4ibtTgdh?=
 =?iso-8859-1?Q?Tsr+omEdy4kw9/qshGK7vQVSviVCY702+kDL5iEmDXYdq7XZaIPXZOYvSK?=
 =?iso-8859-1?Q?fN9t/Id3fYdrV8a10E732/RsALhcNSOX4j0VEAdnGQGYhpPzHZ5ldr/Unw?=
 =?iso-8859-1?Q?6jfEuSuG513Py4m0V9Xg31oZHPG2CJagR+s577JxM73gglF4jcPQ4RYRiJ?=
 =?iso-8859-1?Q?PvNtoV3KhVgCB71xeFSy/9OlTpRvsIVF00DzRUbKiaC/jiqkDPWXYbNAN8?=
 =?iso-8859-1?Q?OY6UujPgMU2p64s0FLd30AX9ay5XfsFwiYqjv4NRKeLiRZ93ocCCPS1tbZ?=
 =?iso-8859-1?Q?/em/0Sc01y84YMqRS/CO2Olgqfm0CSCNMOyTY4J2nS9dCVj2qGLQ34PcRL?=
 =?iso-8859-1?Q?mgQNjSvJVqHmSXqaM/z37dRyU3aWyKvAFnjFWrVUt8af5Ebwi4Vck/+yzV?=
 =?iso-8859-1?Q?RbasDcRRA/qTeqEXC4XbiLy4efqpGwG45V4XuLFshU/H0zrXIRwldZ+Oe8?=
 =?iso-8859-1?Q?P0DY4Niviwb/CwHkXrNOd7MM74BfVEH5d0oSPTLI70EieytFpVDYeZN32j?=
 =?iso-8859-1?Q?4c5D+i2yl9XXwRLbe86TC44BejSpTrMm/mJqzV7IRmtYQ3RPA4rgmfX8Ad?=
 =?iso-8859-1?Q?NYNGeNqM+x7IHKj0+qESQlOVmNalXtlPYEoQKl94WvEDNngiIoEOJtWIM3?=
 =?iso-8859-1?Q?iGyy0PWXSBkUAx5upoMLHhafQzeCWwXpx2t1oxact5U4JAmB/76OISyYNb?=
 =?iso-8859-1?Q?3DmoBhuUkMN8I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a236102-b4cc-459a-cf07-08daf2eda018
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 09:32:43.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgPOMZrdcwXGIIavja2HjFbWr5VriPqVNiqliFe3+B/kidacY+Ebf88E9KJbWTBlBwKNXHCKRk6oj+G0xMsVCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvIMZFL4Z6dlc7iX9cLYbWnvzbW3rHckBkBifSwZT7M=;
 b=2ZM0TkZ2FNiZt5N7pQS9Hsa/GfmEtueiBe7X+H67iGmBBKdYPiwwukLeQ/tUo5TkG9WijnmK/QOip7o0Rzd6WSycvkBsPuOxdizvrrzfF8U7XwzDUEK1uJMVIshx5VLm96VbkSg9n/eRzhxvMRxU+LGiikf5dpmsBrAopW5p1y0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=2ZM0TkZ2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/imx-gpu-viv: drop X11
 output
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
the X11 folder is no longer included in the archive.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 Config.in.legacy                              |  5 +++++
 package/freescale-imx/imx-gpu-viv/Config.in   | 20 +++----------------
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 16 +--------------
 3 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d66f1b958..d2c69fa31c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	bool "imx-gpu-viv X11 output has been removed"
+	help
+	  The X11 output was dropped by NXP.
+
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "the QEMU specific targets option has been removed"
 	help
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 9ba3d0428e..bc30798ca5 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -27,8 +27,8 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	  Userspace libraries for Vivante GPU on i.MX platforms
 
 	  It contains libraries and headers for GLES, OpenCL, and
-	  OpenVG. It also contains a DRI plugin for X11. It also
-	  contains a plugin for DirectFB-1.4.0, but that doesn't work
+	  OpenVG. It also contains a plugin for DirectFB-1.4.0,
+	  but that doesn't work
 	  together with buildroot's DirectFB version.
 
 	  This library is provided by Freescale as-is and doesn't have
@@ -40,22 +40,9 @@ choice
 	prompt "Output option"
 	help
 	  There are two versions of this library: one for
-	  direct framebuffer access, one for X11 rendering.
+	  direct framebuffer access, one for wayland rendering.
 	  Choose here which version to install.
 
-config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
-	bool "X11"
-	depends on BR2_PACKAGE_XORG7
-	# The i.MX8 blob doesn't support X11 output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-
-comment "X11 backend needs Xorg package"
-	depends on !BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
 	# The i.MX8 blob doesn't support FB output
@@ -70,7 +57,6 @@ endchoice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 	string
-	default "x11" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	default "fb" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	default "wayland" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 06fbbc7343..e0e8a31533 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -26,14 +26,6 @@ endif
 
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-# The libGAL.so library provided by imx-gpu-viv uses X functions. Packages
-# may want to link against libGAL.so (QT5 Base with OpenGL and X support
-# does so). For this to work we need build dependencies to libXdamage,
-# libXext and libXfixes so that X functions used in libGAL.so are referenced.
-IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
-endif
-
 # Libraries are linked against libdrm, except framebuffer output on ARM
 ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
 IMX_GPU_VIV_DEPENDENCIES += libdrm
@@ -55,12 +47,6 @@ else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-define IMX_GPU_VIV_FIXUP_PKGCONFIG
-	$(foreach lib,egl glesv1_cm glesv2 vg, \
-		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
-	)
-endef
 endif
 
 # Instead of building, we fix up the inconsistencies that exist
@@ -68,7 +54,7 @@ endif
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
 	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
-	$(foreach backend,fb x11 wayland, \
+	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
