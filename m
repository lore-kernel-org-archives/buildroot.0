Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F90ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 01:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9072C404F7;
	Mon,  5 Sep 2022 01:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9072C404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fU-ABXek3v-t; Mon,  5 Sep 2022 01:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE664050F;
	Mon,  5 Sep 2022 01:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE664050F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92BB61BF2A9
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 01:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D3828137E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 01:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3828137E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rM8z3wbP7jom for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 01:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF448137A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2068.outbound.protection.outlook.com [40.92.22.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EF448137A
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 01:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/PsmkSHC+NXobErEGRPYMMgYMNWX2yPufGwwPXiayMomv3LwkOD02rj+CgDI18KhmeZxwvl5xBGFOV0CGWEwflCHL3YWJIXXESyjUSYM4GSZWwVLH3O+arTYlbhP6OEs6BSkLGwxDykGyQpDCO0jhMJERNDEPBgmqAF+0dB79gjN9yogXjAcs5obW3W9rklr953MnOwViYDA5gi5KMhu+RevHOVfTn/cFMkv7K89c0OU4yue1h+rka2ZVLPAsYxplR0L4g4FPw6Dw3APRJb5tmmdpaoIgtQhH4ULq1et8U1fJXU8MrPVjlRe165/xpcrqKEszf3ibYN92EL7TTNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xACM4LttBeKnpc08usZi6li/4QUp532rn7qWmV9eFfQ=;
 b=Jc3/C0BsQYc2Z2zQ3wGFdL+obWz9zGZZ59hYbgw6W95IpL1bzLGbCR4YojB/yShcfFrqBPnNM0k6svVzXCMi39DbtOZ/fZFoNOjGM94jnBVcYfNxlG5Vd28rK6VK5yIA20e6H8MikDUj2e1vi8vi66GbmAWrMftyqe95ftEaQqAoVRj7lsWYZIeMnzAnZ6DOie2S8AM1dqAbHfv2rqPD9+Ss1leITDET4eBEwxlTocmgKsFXJJ8xvy8RwYD5TcxdOzAXVHy9kpKsnj4L4x66fIHowgDwBVC5rN6ElvvL0Gm2BSCd1DgWQ12hXeKg3LYtj78pQE/CKJ2zc51gqKk4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CH2PR22MB1879.namprd22.prod.outlook.com (2603:10b6:610:85::16)
 by PH0PR22MB3403.namprd22.prod.outlook.com (2603:10b6:510:169::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 01:21:18 +0000
Received: from CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236]) by CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236%6]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 01:21:18 +0000
From: Alex Roberts <alex.roberts109@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/octave: add config support for
 ulibc-ng and musl
Thread-Index: AdjAxcvrCddXgVCVQRyW7K/Nge/fdw==
Date: Mon, 5 Sep 2022 01:21:18 +0000
Message-ID: <CH2PR22MB1879D831102DE31542D924D7B57F9@CH2PR22MB1879.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [hcGuDiDlE9PyaIldMUUhRF+58no718m6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d113f912-38ac-4c54-4b36-08da8edcef34
x-ms-traffictypediagnostic: PH0PR22MB3403:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: USZmdNz0PbQynHotyycq5r4bQTgRw69pOEWUBR5rIDRZRWieZmJqcJHFWhRQD+2zHAmRWFsDJsCyjGKqx9FYM7SIZerwb0jkRynBNruRgbyboy1GHCUqRpzJwsOv4odnc3IWjq7e3AtUA7eXzp8Yw3X3muz6NHwz0fyiXWKh9detx8627kiKX5sF99pAQSdDfdahJBxaIM0fA51SeGSd8Emk/6X3XsDeL2q8dLfJoKVw4ITmQ5JHdMBVdONtwOvzGEjeytXdzue0GoK8YlNmVuxjF1OMCrnhMhH2bWMg8I+P+YWmFx+HzRuJZYTvA6HISnBfRJK4AmZuK08+35XQuOizGMOuG7DSqHzXXk+vSWZ6EPezSNhNbB+iWOS5ybhFb/y/cbB7cg0hrjUH5vW7x2MWFDjJHmTUsHkCFIXEWTQCB6/j5N4B1ho1HGR+itlLQTBTdw+NhzrOhZsHMoA7lpr4w0mmeEqoBKOjy/jDMQtOKZbLtwUxPyap2Ma6fLrc7ZNcOc+9JTfR8mBmIWdB0hET+zfl+BBKZtpDG9IC2uxxJseTf5XZkJMe++7ByXxR7djaqW3t9SPJz0KiWNNF9e78X6TrBZOsXpCYZXe43udOS5buoXi/8HrXnk3yovxn
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KijJ2q98naZ5f9OASePngPcVJ8koCS3vQcQzOUBe8Hdo0IdW2zjnW5cGCCb4?=
 =?us-ascii?Q?3RfvuJuoYqU+G0dxpT0LWYIZFtSmXXqfbMmM7n5adriK2qPhJnsZo8MZ6SlW?=
 =?us-ascii?Q?3lDYpF64Z3DdnvyfN/9veN1sK7x5s5KHv+ye6T6BPUpmBDp2/zqQLwnpwelF?=
 =?us-ascii?Q?bSf6EN5CBxNm/9fmj1a8ldK1OTAQqJ+gxPJ5TZpLMVt1yGwWVMiPTw64F43e?=
 =?us-ascii?Q?tRkrLPqVkpLul/+2HQ1C4GAdgH6Wlueu0RMunzrkEgtIgcTS1hRod1Ko0JCa?=
 =?us-ascii?Q?Kk/prqiSozUP5dGlCtFpxW3DgwVMIsi+TemXI4rXOHxfk7QqdK2fpNKxgAi6?=
 =?us-ascii?Q?KTjinKE0McNk7BDvzipMs1JE9CeJpjQdDSJGhmcYJxMnEXVcj/sxpQ9C6zfH?=
 =?us-ascii?Q?z5KpmVOmGAIqRmIEJE+baDja1lyp7eVcx19GL5thpxDndqT+6jNQKpzLvIVu?=
 =?us-ascii?Q?DYJXC1VFU2TWXDoQcW4zgH93aLh4QKwjx79CoXtRCZ5Ko00wPqGXbh7L0c6x?=
 =?us-ascii?Q?ArDQUHbhLUP4zfSsOwcnn2/gphTx3akEM7hr5XBQFxFX4Z65FxMg/vwQx9tb?=
 =?us-ascii?Q?jYWTWBY5xPTo1kqsYS51/L2nFMIKrMN0aVLZTrhn2bzMXCvbw6S/vjGV6fNS?=
 =?us-ascii?Q?nxBEQSupL84/JjSrtIk6txJxO/dgyKD3XXRsZnFZwpNYsMg2IJH+w0jJdweq?=
 =?us-ascii?Q?DKV67wR+VZerz5coMN0DuQzmt1sP0WgJWA3hc/EXzxeXoRiI/OdikmBvDnbA?=
 =?us-ascii?Q?BmGAnVp0/F0ICZeOuPinNqF+ZCPb58EP/Qq0Cr6MmHgGi4GMBBdFWGB33MRH?=
 =?us-ascii?Q?jWmSvSA1iFrA7D3stYA+8OQrg7Wy9BIEv87c8hqYEvtKTGP1MDJ4klOT6Brw?=
 =?us-ascii?Q?Vvh4xvS6RLO/QbtiTCFH4i3SvGR/jh8uZowjRZdX2yoeRXkmgdy7OtMU44zr?=
 =?us-ascii?Q?L5SbBeKNoiiKz9BKbw3044PHm+VrQk3ZPHlkQNRh0ipM5yDUNnRDqwiar//P?=
 =?us-ascii?Q?wQFdrKntqYuOPfPpNU8xLdlja8WmqbQx8sSMOd9BB5Hy3o6ArCSaqacviyIT?=
 =?us-ascii?Q?0HNTEtojN8tCU2I9z72S7JIxEpNKsf23Edi+2a3JXu/C28eJagrdM3ILS79E?=
 =?us-ascii?Q?UPf8m2I1S2ibMeKUX6sBMU/EGVPKrFw4ODkCQHrh6Tl11tRG5WYQSjnw5nM7?=
 =?us-ascii?Q?j6sTHxO54mjPhGNSC6tNGzA+JbVF7rBPLwtTKV+KcJLA/EhQMvGBTnm0olzr?=
 =?us-ascii?Q?BcmMSW/o/mKIh6t6l1W0t112Dkkd760bFzq9VscFyg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB1879.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d113f912-38ac-4c54-4b36-08da8edcef34
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 01:21:18.3322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB3403
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xACM4LttBeKnpc08usZi6li/4QUp532rn7qWmV9eFfQ=;
 b=f6ES9kyaDV5Z1eb3xY/Sz2+QSTjCOaywmW7tbVOpSR7DgB3/DeeACe9yi4y8kcBh9HCvFTJb48ySFGEKESv+nwmOfI2Oj66UhQS5A3NR0UX4tAclCnv9PYuxsdzQW/iXRJp12SmoDAqKSHP6Tb3SA8cqnExSJRslnJbzjFYNema0q+G4prl/N6McQpIZDB8g/H/w7ueROWSHGgi8EO/ZJv2/kU19N1KqPST5wbszW4XF5+XzePeTjnriGspbr4EZZY4Up0QXcftV7IgCwz+o776PLkaMFqI1qY8FrsZvJngH5F5A97bVuCseIMmTi8Db8cRjKg/UgdfM82msP5Vyqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=f6ES9kya
Subject: [Buildroot] [PATCH 1/1] package/octave: add config support for
 ulibc-ng and musl
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
Cc: "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From e00afef7a1811db5cd0a26e702ade0af1cdcca23 Mon Sep 17 00:00:00 2001
From: Alex Roberts <alex.roberts109@outlook.com>
Date: Sun, 4 Sep 2022 17:43:18 -0500
Subject: [Buildroot] [PATCH 1/1] package/octave: add config support for ulibc-ng and musl
 toolchains

Modified Config.in to allow Octave package to be built with Buildroot internal toolchains. This adds support
for both uClib-ng and musl based toolchain.

Octave requires locale support, this can be provided by the toolchain (default for musl and glibc). Locale support in
uClibc-ng is optional. If not enabled, locale support can be provided for Octave by libiconv (BR2_PACKAGE_LIBICONV).

octave.mk is modified to check if BR2_PACKAGE_LIBICONV is being used and will include libiconv as a build dependency.

This was tested with on arm32 and arm64 (aarch) targets with qemu_arm_versatile_defconfig and aarch64_virt_defconfig.

octave-cli --eval 'oruntests general'

All tests passed. uClibc-ng has issues on aarch64 and segfaults on program termination.

Signed-off-by: Alex Roberts <alex.roberts109@outlook.com>
---
 package/octave/Config.in | 17 ++++++++++++++---
 package/octave/octave.mk |  4 ++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/octave/Config.in b/package/octave/Config.in
index 171bdfa156..c74be51c26 100644
--- a/package/octave/Config.in
+++ b/package/octave/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_OCTAVE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	depends on BR2_TOOLCHAIN_HAS_OPENMP
+	depends on BR2_USE_WCHAR
+	depends on (BR2_ENABLE_LOCALE || BR2_PACKAGE_LIBICONV)
+
 	# Some Bootlin x86_64 toolchains (like version
 	# bleeding-edge-2021.11-1) has a file
 	# "x86_64-buildroot-linux-gnu/lib64/libgfortran.la" including
@@ -11,10 +15,12 @@ config BR2_PACKAGE_OCTAVE
 	# to linquadmath.la on the bootlin build host. This breaks
 	# builds using libtool with libgfortran. Those toolchains are
 	# used by the "utils/test-pkg" script.
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64
+	depends on !BR2_x86_64
+
 	select BR2_PACKAGE_OPENBLAS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UTF
+
 	help
 	  GNU Octave is a high-level language, primarily intended for
 	  numerical computations. It provides a convenient command
@@ -33,7 +39,12 @@ config BR2_PACKAGE_OCTAVE
 
 	  https://www.octave.org/
 
-comment "octave needs a toolchain w/ C++ and fortran, gcc >= 4.8"
+comment "octave needs a toolchain w/ wchar, C++, Fortran, OpenMP, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_HAS_FORTRAN
+		!BR2_TOOLCHAIN_HAS_FORTRAN || \
+		!BR2_TOOLCHAIN_HAS_OPENMP || \
+		!BR2_USE_WCHAR 
+
+comment "octave needs locale support via toolchain or libiconv"
+	depends on !(BR2_ENABLE_LOCALE || BR2_PACKAGE_LIBICONV)
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index b28617438a..65552c1f78 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -25,4 +25,8 @@ else
 OCTAVE_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+OCTAVE_DEPENDENCIES += libiconv
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
