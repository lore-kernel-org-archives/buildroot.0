Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFF3C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 09:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54E140905;
	Mon, 13 Mar 2023 09:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B54E140905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyXV-stfngUS; Mon, 13 Mar 2023 09:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77450414C2;
	Mon, 13 Mar 2023 09:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77450414C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03E321BF2A5
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 09:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA71E80C37
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 09:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA71E80C37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQwXmzzvO1qn for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 09:16:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5091F80BE3
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5091F80BE3
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 09:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh+jqBbweE1hnHj9gtozaEs8CB9kDs+OF3zJsVsD1/jY3caxn0F2F/eHOT/em8zICoSMsuNQ4RIIo2WrXQySSoGj8gyJMDJ2AUqW5p186olDARaKKfG/EdDFn85BDou2xK3lTUwew+mWbGJ0QO52V2qN6G2Vbm63zksBOj33jJorAALSiQ1YEoYVvidx2fD5K6gtDQVvu03maUl7ycZIUUXJJuJCilRhpE30WvHk3hKw2v8RtXETz+Wg5+mWoflbb04l99NRVVphvyKrmUOf6Rjw2BwNgGscbQCMeoaDDqHhwa3ap/PuxCRBtv5ntiP7/FlDFFx4rkoUhyIFBqXrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Itafvd6arHnEoFgRYDeRyRqRCHAYGw4ntmHXRmJdOog=;
 b=lCGGIEK7ybj+4XZJ358Z/hHCYhTjSpZrXI1nuik58qwGLgNGmm2LMESZOwLFUPi3mMa6t7yssGwz06m4vDf5eyrcuofwuzDLpSFWszvHp3ik7d4m0FLtTUJ4F/BC4aiFuLDe0GVz3uZB3mL583h+/0VXCWzTrd43EDgHOLdsOBOwmg4X1saBDWW4Va5A1xtgmV0fy9+11dLyC0xzOgZkypqew3YKlcGanOWAKPBvHphEPotAW8Ef49AnmxttnBX9O+d70i5Cv+LPXH3uiwIL2XnI8RqjSQwz+YpNSciUfZZsHthZ6AlGko56L7MPqVK60kXXYNa0GohveUUtbN0atQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0727.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:16:31 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:16:31 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3] package/freescale-imx/imx-gpu-viv: fix aarch64
 framebuffer support
Thread-Index: AQHZVYo3EOKXACjOcUqEhXr/dlHYlg==
Date: Mon, 13 Mar 2023 09:16:31 +0000
Message-ID: <VI1P190MB04933DDA75BE1BC9A23B06929FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0727:EE_
x-ms-office365-filtering-correlation-id: 89143499-3335-4e12-6143-08db23a3a24c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djaNWv/IQDqqcsGOFg1Xu7LZ6SapHjIDbc8frAjohQj0hi4gVNSJKrZIhzc/B+IRpiTpmO8exEPSNjaVbVUXtBcAu8WDNr5TamMkZO7IHVBlp68VcmU3wYCXvO/hxMdtUCQNQZudEDWMISLYsW3iPrFkBNFoiqMKF7oKx05xkG1VpQKWBP1EIjn8VcbPCp4YjBnDyHq0bVRqKYb1QXe94FErcmRGeYISvS8Q8BVrf42LB/TVtCBYJMAATRIv5Cnh1NCEKKrO/UHor8+Y1/d3ALaZHd2iwrIe/3MPVWsf+9K0I4JMr7W4DGvwxFOR3BPVkkukezLfoJ1GSKjawgdAGJq2YnK0lea8TDO7EU5fYEvu9MyF0PRtUlrubTVYUNedMHgQJ58F5a5fkp9s9jAP0x1sVNBVNxe4veuvhxXwYTS6B8b5BrpoFHV6HRCeRpgok4bqPPMus3WT7m+KkFjCWz4pFXSBmtYY3Hogd2JBvx1FqH09TKdaoP60HmC/qvguBoB2SvAd4RmjzJHIqdE73mOPl13nq12QDMGxgo2oKnGxx8kiapFLFnzsJOyYEI0+8XevS9QnrlYpKv9ChiCXx7sHJB+zzApspxI+zuUCCsF28L+7EZPMoHWWyCcZWddfp2Bpg7xm4ZVx1DEgGOkaj5lhzdksNf/47NsqE4nQS5/Kl5Yx4/Y4kz9BiphgCfO7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39830400003)(346002)(136003)(376002)(451199018)(86362001)(33656002)(6916009)(9686003)(41300700001)(186003)(26005)(6506007)(5660300002)(4326008)(52536014)(8936002)(316002)(54906003)(55016003)(71200400001)(478600001)(966005)(8676002)(76116006)(66476007)(66556008)(64756008)(66446008)(7696005)(66946007)(122000001)(38070700005)(38100700002)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SE+TYbjK/k0/FO1qNyHGmKxQrntRK6OhnvZSBjrHpoMaiHJQUzrmxVX8FV?=
 =?iso-8859-1?Q?dTc8TVcpvFGvbA7Cm4AiR0xjO0fPHewOcY0Cit/JwnJD2kjsV9c1PBH0+3?=
 =?iso-8859-1?Q?hrMJrTfxkksrsTKKnq5NcVIsI2Sit3zNCpd/ZbaQ/wQwfjgc+9XzjBCXQQ?=
 =?iso-8859-1?Q?S1ZRAoyTdqv/cofwie+mP6jp2qik5nKNLMff3cCDpoG5JYNyl8E4xIWo9g?=
 =?iso-8859-1?Q?queJ8Z78uRPL/eBvQos6/0UjACUPcWg1mHK4EW0nsCp16eZl97k2inIneg?=
 =?iso-8859-1?Q?M9TL5fjMolE2b4jOlOzyoUuYAuQCMSec/fM+BnoNQsWuA965h7732tyrVt?=
 =?iso-8859-1?Q?fykWUBVxpGm9eHlwl2ARv/okfd8CSX0FRhOPtwArYjXz5PLJjaM/+SJjQp?=
 =?iso-8859-1?Q?AdKa9xYPvk3t5rA2UW64QUAC4asOixIHuotjdFo31mfk9iAAjfYCIqPpEL?=
 =?iso-8859-1?Q?0cduuqYfVtGT859Fzrodm3G4l3NhtAsClGMAVnXT9qIiVZQSyIgtfC3RtE?=
 =?iso-8859-1?Q?7LEeTl5ZaUgZG8UXhI2ThKGoofcL9m2e8sh5lioS/lMMIzfnx57rFofEdE?=
 =?iso-8859-1?Q?/E4mfE29se18rAvYZZ+UhShgTk0D1EkkJe+vlYbcymXRIOEFbK7e1z1HgJ?=
 =?iso-8859-1?Q?wP3X1e7UupbjW1aQCwv/mFhV4LoRWTV2+6R5iOlAMywx/gD75ZVlfisiSe?=
 =?iso-8859-1?Q?h8Qduvc/RBjiXrhMWUCLQC2kCTGlH3I3RyU5i7bU1w0/3UE1Odc/29q42v?=
 =?iso-8859-1?Q?tWKDkiPxMOvQBr5bRe74KA+ZGEqhwKgaSayxqp9MDssnyxSe4aoA0WZhee?=
 =?iso-8859-1?Q?TvPngbjI0xIJDG2eJAcSQikx3g4ZRi1dmHXt3Ka3H0yDu9lUgrKbDcpmrx?=
 =?iso-8859-1?Q?mptr6Kxvai3SOOfDH/K+90Upjq9zYPTZu9FVv4cgYME0HiSIsWHo43Y9v2?=
 =?iso-8859-1?Q?isSx0RtNwEX2pwm/46a85pJ3KbXspn7uZdGBLG9R6oUFKXPjj8yHbCdFaI?=
 =?iso-8859-1?Q?jiCseUKVTI2McxwjZVSjX4cKnDCzTeCpIxGSLulnq4D3HhsJ1iss/fNfHM?=
 =?iso-8859-1?Q?dLQz3QNWu1xd0cNtZlKunWx0TpJgoCZWIQ6rB4yBdfvHMjdSCjYJoBAOuz?=
 =?iso-8859-1?Q?pJ0bM36zIPS4tQ/u0wtm8MeMtJmi2k2POAfXdWkxXg1JIqh2Y3bFMeuI9e?=
 =?iso-8859-1?Q?E1Fo3UnumQnJR0rBsPIbHnrSW/+ZFOf7QbRSDbW3+sq2SrtdGZ1uclmyEV?=
 =?iso-8859-1?Q?IWhHsaq3B8X9Vjr+dv7TtFaFtVW4uDOeCYocEQy4PIos3Vv2kizNwzYE+Z?=
 =?iso-8859-1?Q?q/vUtW6q7tmZV917OR8QL57u+r/gV2nLfMk0DkDbfmAfwb8RWV1m21NMe0?=
 =?iso-8859-1?Q?HrdvhwpdmK+fPGruHt02Ho4c7cihEIlzUOCQrTkyJ83DDK1KXnOshmAmuL?=
 =?iso-8859-1?Q?cEgUA7+kMO6kl2j0xn76o6AyM95JDBQmf2bvH2pFogHwUIN8jhK+Sgtjw4?=
 =?iso-8859-1?Q?CovsEAdF4fczDHLf5dVC9UroCm/leFQQZuwuVyGxPpoLlw6O/9/0sac2Tt?=
 =?iso-8859-1?Q?yN9/LE3Ut48MkggI2L3wG3n7xQH/geJKz7b36v4GX72jBwAOqEAHu95IUB?=
 =?iso-8859-1?Q?QXkHcHko8UBj8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89143499-3335-4e12-6143-08db23a3a24c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 09:16:31.2144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: baQ3rkdq8R0XWgKiw5pX+mCCJvktS9TUgtnlHqs/bODasCu1/YcM9ZUJAoqDTtq5SHE8Urpo7lq+NqVCqeAiMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0727
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itafvd6arHnEoFgRYDeRyRqRCHAYGw4ntmHXRmJdOog=;
 b=1P+ULxsXSvfTtxfV6cwK0Xx5K3CgY39+mbnureniuJzaDQ0MQC+cyp/obW6YJJrXHdiLRYuTrSKbk5fA6g7DCqwpfzq0S7MbKI/WrtixyCyadkjBW17/mUJLF3T3c8RT7c/5z3FchgZBMz+sZCFI9hbwDP5Ur1tkZins7QmjBXc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=1P+ULxsX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v3] package/freescale-imx/imx-gpu-viv: fix
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
the fb folder for aarch64 is no longer included in the archive.

According to meta-freescale [0] the framebuffer output can be enabled on
IMX8 by using the wayland libraries together with egl.pc.

Tested on an imx8mn by running kmscube. EGL and GLES support detected.

[0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc

Fixes:
cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
 - Mention current build failure
 - Add information for egl.pc selection
v2 -> v3:
- Introduce BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
---
 package/freescale-imx/imx-gpu-viv/Config.in   | 16 +++++++++-----
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 22 +++++++++++--------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 3e095b730c..0e759f6183 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -12,9 +12,6 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	# Library binaries are linked against libdrm.so.2, except framebuffer
-	# output on ARM
-	select BR2_PACKAGE_LIBDRM if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	# gbm is only available in the aarch64 blobs
@@ -45,12 +42,9 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
 endchoice
@@ -85,6 +79,16 @@ config BR2_PACKAGE_IMX_GPU_VIV_PLATFORM
 	default "mx8qm" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "mx8qxp" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+# Library binaries are linked against libdrm and wayland,
+# except framebuffer output on ARM.
+# Framebuffer output on aarch64 uses the same libraries
+# as wayland output.
+config BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
+	bool
+	default y if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_WAYLAND
+
 endif
 
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index f72735e093..359dcc5923 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -26,20 +26,24 @@ endif
 
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
-# Libraries are linked against libdrm, except framebuffer output on ARM
-ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
-IMX_GPU_VIV_DEPENDENCIES += libdrm
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
-IMX_GPU_VIV_DEPENDENCIES += wayland
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND),y)
+IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
+IMX_GPU_VIV_OUTPUT_DIR = wayland
+else
+IMX_GPU_VIV_OUTPUT_DIR = fb
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
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
@@ -60,7 +64,7 @@ endif
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_OUTPUT_DIR)/* $(@D)/gpu-core/usr/lib/
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
