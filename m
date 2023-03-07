Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5784C74A4B
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 18:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0961C40B63;
	Tue,  7 Mar 2023 18:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0961C40B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04VRcZebSCfF; Tue,  7 Mar 2023 18:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20DAE40393;
	Tue,  7 Mar 2023 18:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20DAE40393
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 050B61BF59F
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 18:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE1C041796
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 18:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1C041796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWCac1ul-NRA for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 18:27:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA8041793
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1b::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEA8041793
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 18:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7XV+dZSXT8v4FuM5LCQ83hAXJMg6AfYfzd4jaujgWIopXvuWsmNFnAnIfseQ3Xnu0xtFocKmu8vLdsW4FoJmjHzifY4rnpWg1VyeXga2m9E+3r137No+595pTz2SPS0GGPmuZmRho21vO/elGkU4u2s6eCnY15Q0qZ5MfwZsgMsJlfm1W8v7Qllf9WI/qTD0yFr2hB6e6jJshBo9U5ojIBbxjfWetr7GYTT1WubGTZnaDP+8BIxF7fbr300XZxNKaarFgBYEDhHFPgI0A3nRQ9V47aUJSlDz4VJZVCxewMLVFVSG1xVf97BXIxUoXWGz7esrPi3+zNoiT0OYNMjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sr2qA98b1ClxcYpZst6g1uR4Lwa1RS6Kbqfab6GfWLI=;
 b=UsXoQ6+xoqDRi+CXsfEei3W761B+t+uDRq6/jhp1HP4sJEXFcf+8GlQ0sT89S+7MVy+shRQsOKa7hKflT0MrtJQ927CgwBGITGqDPjFGAaR9VoWWAphn4NqiTkypXzo2eFbomMLjvH21vEJG3gil8Cv8qvePb9zMME8oegxPftNr8unO73SZtUXu9g1OKhUaD+ToCHbuh8+o8hcVmzNiC92I0DpHYHWvexbIyYCx9yymbxR3C4niGb+MGh0bM/vr0LKNP1yEPu1LCc9xd8hmUxnwvQITY4Wug2EGmldScyes6dalaA7o8rBULRpOXzP6xg8JHMin15rZOilBx5Gv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0608.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 18:27:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 18:27:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2] package/freescale-imx/imx-gpu-viv: fix aarch64
 framebuffer support
Thread-Index: AQHZUSIuKkfj9FY/kU6AzLFEyq4svQ==
Date: Tue, 7 Mar 2023 18:27:32 +0000
Message-ID: <VI1P190MB049368DE3CF489381F94420B9FB79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0608:EE_
x-ms-office365-filtering-correlation-id: 032abdf9-8173-4fa8-17ae-08db1f399db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wFg3NuzkhjvQ/VUBKUN/96kRsEL/QX2uLIOk+AhSq6JNGYppjzo9NZL/600Bxdwx+qoTADskDxwApc3UtSJIJLtV87Z1BUAhhIJgZJ2aXCuwqDDzXOMZIrDku8WGcHAOWeF3DshaDY9Bf3bbw4aEchRx5rDvFhbp4F0HQ4kOnb6b0zxr+terhXmx+sJ+2Kwt7NOWpkEneeJTwys2MOwjupjorALH0McizLY0sVUECYRqVAKTV/U31QAUebcX0R0i61FNcV5MFnZAshEFcCR+D22ydthZji7Q/YICeT+34vTy+ww7u4Z58lahAawaUt1U6qM4OsF2O3Dv95Llt6DwdI6PXw32VKiikmy362+SXflKgc5wmJR6Qu2kjpdc5349RfDeEGDrtb7Zi14MnBZnK5ECmAbDVyL+lP01rm7qqg6yAAAmMl5hWCwAk+mSuU8rqcRdgPkxPbbjXtVQVEcYPybj6nKYSPmmwD68bSFBwmk21y+d/lCwrYdotmWdyYjxINa6DCtCchVOKA4SuU97wclp0iFQpgp0RrwKQKxQ6O1zw6PiDih2BjGMvTDBXamrMbH9zThdqnscABxvuiwb84zYXmIfCL+0Vg/kleUuIsURer2iOVL7c1VFONfk+AlciL3/fFNpEONXc5aaY6HmPFStp2+jTQplP5IbDk/wXTkINZvfkWKeVcxKritNyhHt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(136003)(39840400004)(451199018)(6916009)(76116006)(4326008)(41300700001)(66556008)(64756008)(66946007)(8676002)(66476007)(5660300002)(2906002)(122000001)(33656002)(38100700002)(86362001)(38070700005)(8936002)(66446008)(7696005)(6506007)(966005)(71200400001)(316002)(55016003)(54906003)(478600001)(52536014)(83380400001)(186003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cV2MLC++Ya1/etoR9KnRQQzYqyijZCOtlDUYF2mkX+SWRz8GpJN1HzI8Ob?=
 =?iso-8859-1?Q?IamzhlNz2LwKfXLjQWVsx3YENn7abDt3R6+mU+h7V/W5BdHQwJ8vIofMZ2?=
 =?iso-8859-1?Q?6JyNiq7Na7qBTwBNqRQioo2HQB80NInhqqMSrXbIKpnGykou7JywOeLtBD?=
 =?iso-8859-1?Q?RUBc4F40kfjmC8eppm9Wx3RuBZ8IKoE1LIBVu7IXDEHDgJcGe5bKRkiU53?=
 =?iso-8859-1?Q?7AfyK375T6zPPYyYCdVjla/9htvXDZ96QqYJi/ESceX3EjUwlIjXnj7ilV?=
 =?iso-8859-1?Q?lnyIT3fUks8G7+uMvxlCuOArkkBNQhDwrLLpjZNv4T21Oll5LkeXx8Si4X?=
 =?iso-8859-1?Q?Q82huepPlhDkazcDeXorugPGX9mnt6drPDgHdVB2cQtWVSRnbfxnW1oSUZ?=
 =?iso-8859-1?Q?RoVJhAxriCR2yYcZvYDsBSnXVPfk0AGLBrqWSt8morCRB5yoPD2bdntSqV?=
 =?iso-8859-1?Q?JBQDsvkm0bRm8GeqRK2N2YmJy+x/MsgTH1mSDMVp3KeE4jfgn3FDazfkUR?=
 =?iso-8859-1?Q?mHlJjgklkG+r79vZP3qoEj9dkVjWbX7arIx0k9C4U9KXUTxSncUrR87Br+?=
 =?iso-8859-1?Q?URu0o4Og5SIkRAvUBlCkn46/e1CgxVHW0JhxDF5SQtaUpu0JpHrDICFm9H?=
 =?iso-8859-1?Q?wen28zAu78gyibz/8KPCGFuU7WlzL7hUm1NDiPRennrcJJpdH8OUWD2+Ft?=
 =?iso-8859-1?Q?o4izGXA44GoflwpDlt7ZVXnxVMgpKC2zYxJeOkVu20qU/93fBAGuj3xhi8?=
 =?iso-8859-1?Q?wQHIWEtuUHKFBi5NV3+C2mcHPg45KjKety+8FtYwhGkoODIM9j4la47ysN?=
 =?iso-8859-1?Q?eChXMcDL6ugauTi2R3vboc7FMRZiwXrqiKekInGjSAUYjWaadHzn8vYYwJ?=
 =?iso-8859-1?Q?2vQRFu3CSzrPyBd/c8UkIfUxjM8uUMuo+YeOT9Mpvnr+8WeWad9TIkmidI?=
 =?iso-8859-1?Q?kVbj+RXmrFY72z5a556lA+n2TCGub2XSOCLT+5FFXKBYpErryCj39trFoA?=
 =?iso-8859-1?Q?xmYzq4Onj9KM+kdpOWxLjXlFXsZ8vyqD7hepZ+5E2Ml2gJEvxjCa3um571?=
 =?iso-8859-1?Q?nTodVb9aTmU/Ezpl3IrrXv0fC+pfL60bXYI5YWL1LY3b3cRxVYMe6s4gT4?=
 =?iso-8859-1?Q?zN0zbxDIEj6l+Evz9LFYGlDo/ZeuQLFIknYZ6e1Lz+LxhhAH+VWvqA8Cyh?=
 =?iso-8859-1?Q?OLIq44HGxdVbJ4YqPr8/ze54xen19H5XRMnFvI5gb74iWK7Pm7+HBFIlFO?=
 =?iso-8859-1?Q?p9eGjXhosqYlxqlKsvP5/2QQkgKNL9v/H8m5nu6Z1aNcvDHkAzzG0RMMtz?=
 =?iso-8859-1?Q?4YT7EiEbAj8vN0N5kvfxSdTbBw2XH4ARrYUgEVSBo47exgzH4r6aqLdy7q?=
 =?iso-8859-1?Q?bfawCPo6IWTkA/mQzqOPMFkGsc+OCpLVh2wZ157XKU3/2ZtmVOLjECJnyF?=
 =?iso-8859-1?Q?Cv+hfu8GJhxePoYq1VnYAZJdMr/OxWG9j/Z8kFBV8UKfQksei6sd8GH8HY?=
 =?iso-8859-1?Q?5B/ONp0AiPF72P43i1xPh0Uljnb9aY7Hpk+xxfjcaJHtxG0wt4d6uHCKiH?=
 =?iso-8859-1?Q?psl9wj4lWwW7VLCduT54IiWSMn9JF0dvejuo0j9Gatnt+08jQlyyrdb0JK?=
 =?iso-8859-1?Q?8mThTu4N9QOOlvOzlsL+it8Ywuvm1kn9jU03S54nV/NdmS9D6kqYVK2tAU?=
 =?iso-8859-1?Q?nd9sXjCQaqri3Rngvd4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 032abdf9-8173-4fa8-17ae-08db1f399db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 18:27:32.2494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYnZkIhz3bO1GqsMotmadLahvHfvPe3H6i4kIIDpT7g+ysaMJtK7mMktAh49JRuiZP9euMJoAdZo7C35/sD6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0608
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sr2qA98b1ClxcYpZst6g1uR4Lwa1RS6Kbqfab6GfWLI=;
 b=Jabvj2D0yrwB0WIfC+9UY1VZjh+lnRappZ+WXr17cQUHcBx+yoxp+l3laoDayCDeECznjVUt11mJYY9RajSlig11LTKVnD8A2/hKPSYVXple9VwiQOyWqz8Ya7kVbM/AAUa/Rcs7bwbetBXKbO0hb+/ncl/v/LTD78EjpRG+NB0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Jabvj2D0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
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
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
the fb folder is no longer included in the archive.

imx-gpu-viv 6.4.3.p4.4-aarch64 Building
cp -dpfr /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/* /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/
cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory

According to meta-freescale [0] the framebuffer output can be enabled on
IMX8 by using the wayland libraries together with egl.pc.

Tested on an imx8mn by running kmscube. EGL and GLES support detected.

[0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
 - Mention current build failure
 - Add information for egl.pc selection
---
 package/freescale-imx/imx-gpu-viv/Config.in   |  4 +--
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 27 ++++++++++++-------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 3e095b730c..1e3bdd6b3d 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -45,8 +45,8 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	# Framebuffer output on aarch64 is linked wayland library.
+	select BR2_PACKAGE_WAYLAND if BR2_aarch64
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index f72735e093..00c95cc5d2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -26,28 +26,37 @@ endif
 
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
-# Libraries are linked against libdrm, except framebuffer output on ARM
+# Libraries are linked against libdrm and wayland,
+# except framebuffer output on ARM
 ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
-IMX_GPU_VIV_DEPENDENCIES += libdrm
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
-IMX_GPU_VIV_DEPENDENCIES += wayland
+IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
 endif
 
 define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
+# The package comes with multiple versions of egl.pc,
+# depending on the output the original egl.pc is replaced
+# with a symlink:
+# - arm/frambuffer: symlink to egl_linuxfb.pc
+# - aarch64/framebuffer: original egl.pc without a symlink
+# - wayland: symblink to egl_wayland.pc
+ifeq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
+IMX_GPU_VIV_BACKEND_DIR = fb
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
+else
+# Framebuffer output on aarch64 uses the same libraries as wayland output
+# but without replaceing egl.pc.
+IMX_GPU_VIV_BACKEND_DIR = wayland
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
 endif
+endif
 
 IMX_GPU_VIV_PLATFORM_DIR = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_PLATFORM))
 ifneq ($(IMX_GPU_VIV_PLATFORM_DIR),)
@@ -60,7 +69,7 @@ endif
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_BACKEND_DIR)/* $(@D)/gpu-core/usr/lib/
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
