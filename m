Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C3FC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 05:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B9960F1C;
	Sun, 23 Apr 2023 05:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B9960F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EACJ5qsIcOHM; Sun, 23 Apr 2023 05:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E906260F68;
	Sun, 23 Apr 2023 05:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E906260F68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86E481C29A1
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43BF5820CF
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43BF5820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 767ub9A-0t-A for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 05:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0142D81FAB
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10acsn20805.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::805])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0142D81FAB
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 05:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7S2pfvlhvzADPT80sZ1Cd/SlRPNaxhQZE48VlGiYQdgDPk1IiCqRPTemjRDDNVbcYJQa/wZ72P3Bke08QO3xqEM4K+TRl8wM25dvAMLSmNQJwRq9XDoNEx5QCGZVKdTuDffRJqrkriKv+EVLD1aSSMF3xhTgZilxoZsr30czrDO9WXmNnxv2n8Gpl7A08JokWrdrk10HoE3PRTwXIR47hh/N/vt9dN5itpyiyIV0fBguOxGJmxYqy4Rok17Fgt67nRnLsm9v9oz9Il4cJ/F10MtDSthrZNf/vPsPNYEhouv81Ng8PZ2C/+x5pLZRRLS0nsULijaJrZQbVmbp57UBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhrBpy7hcuP5EFBu7PqF4adNobO0oEBrACtygdm9tos=;
 b=CkK5E249BtjXLx4V2jZYDM18j1tb4i9SD4owHZqEZjctthneiXzOPEP4GGDh2jZxNQxFxSKj1EQeo/ta4G1M5CvXK9ji1OvflQLQGl+97vvqeSBk1v3ECthhJWjYkoiHu7A3kjO0EF9Pd1gaBrewXXgtoVGd6oKq+rnpfMx94uejoMsJoIRm97iuxzWCdmHwzdaCGMt6URUVUqPn3BR1aUHJtQFHnS5sLgRcIcFY3DEu0rPmiKXwvSjOTGiEF10LK6QjGPyby5MzKimD9WG9pNnLJuw6Iv+2Yd9l+Y7RydRxp2LMOR1k79aDnbCg1ubg/auN3Cv5F7GjqjJ7aVuOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by MW6P221MB1121.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:23c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.31; Sun, 23 Apr
 2023 05:49:23 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 05:49:23 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 01:48:47 -0400
Message-ID: <SN4P221MB06829C65329204195ED20B6FA0669@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [6MsJXXEXWI3SPNImTWc/nc49WaWZ0WTg]
X-ClientProxiedBy: YQXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::28) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230423054847.4166-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|MW6P221MB1121:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9aa5e5-41dc-42c1-0bf2-08db43be7d80
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvs+Zhh6OL35slIseIeUQLKVHHEJZgE1AucBCS0oQmiSLcPM8IQWHSsT14ELMwBvsswc9dSrOUwdSwgo1vqdyrItqb4bbvlFAZ17yd5wzpPKGUoGPt6oFcNtBGwtHuMJ1hhjgztaysXOhAGrEul+uECdyJk7/HGfoRGT3yF5HOu6ZgZh6Yh1r/IsGwLI1zy+EXgz0/JtHLfW18RCfGtFVUoaCvm4J4PW7juBYZO/s6lJV5pAuPTSLNebts861+UqxaU2M8ntnqAiQXdhUdAmDagmDEPLscB70f7cwcR18bkqzE2HqJvPN0PJWAhR4qq4+wVVBepxFhi2Q5fDCE4T/kPPon3X0UGWw5FDtICSrxn/J7cXFf/Ob8NqIgpvhzO1wqzHXjVPMA9GB2IEu1PbLEBYpxeCA/qPta0gA6plkFP7ZlzAnJmPI6Hyw7WENRKT4iuF2Tr4GIMXjBcLy9SUPISTZX6+DhsYOi8bjzONKJhIt93D5YXzrIZbxRnt0exNnDrgT7qcZoFDYUvlDzRYYwiXJCHidqBaWr5cFnLSA/uoeRvO5qJNtnDphY891C6Cfa0cT9fis+e3VMjd3E1Auiy462wy1ktOPDqea8SgFe7roIzlO737bkhxwYRnuP3gfR1VPPZUg3fMaDsaHnxDBeKt3Ka/ySh+n5W38DDC396Fsr2xI9RjiXbjyJyPD3zLeFWg18AFTvfNyvFutcvPMv6b6Jl20TzGq8VFphlJqYRddlTkcP+g9E5XgZXyiDgIPno=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JedFcdpbF+NsUo7qGvHQ50FxbmIoY+ix4czxunzKQOHG3AWgr/fx5mxycCe8QfAo6HbaKRai6u8jr9JGRzdkczE9fPm5AXI+oe4BocpPmfpeMsRnOOfoEpjh09tPprgENHkdqovkfyEqktQ596hSeUdyn4yN+pEHUyLPhdn5iA0s3b0A2Su3Luf2opePnaZvSA2U27CcVikFjJ7coz2W/vmPZIsZ0Y6vcU09nUfIV+IaCl3QDIwZKNp0dclx2Jld1EGo5xB6P+2DwpEs6mB09+f2rBhgEgd0OSIkw5dDulJn+RKK7at37gtJMWkpSFmwMZ9bwLNwbffoXF15n+Uf9dts3X1E0QhuPeeDjFRCv0IF4iNq1BqCQm3Smn3z053UAE3662iXqhrgmjjW5xkmWPZfAzYUmQo91XnvqUM1tMZhmGqZNjFpmCbN+45F3rEHNgg6QdLmredKKWuPC9VqXlVRTSIM4eCw6xDPrXaOijig63mwEUrRUeolg3Z9n8+nFDBF6tovxV6EqxA5MyqRVuFPOSkkDNek9cVwyjQRlhsbd09KIRuT6qoIUXpqmc6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9UY5VhCAQoPqiGn9SksbggVebf+98iQAu3UxAM7l+zEvIrgxRvVY+JWMt22?=
 =?us-ascii?Q?0K7n9Kda0FeI6F3GkaGHpGkGDNfWBICMWWVv/B1/e2by5MR2NABPUzbM7wyK?=
 =?us-ascii?Q?zem+L+XeT0o5+WFdMy3jUY25sXNGWWsm5AaSOrhI1DbMgv/p+iFuVUrfxaFK?=
 =?us-ascii?Q?F/tTXxgnjU6/ReldQKRsWFx3AkT/5u8Mm5GUHKmQrtNEj70L94DbHulsA3qp?=
 =?us-ascii?Q?CBvT4uaN2eiTMyGR6BBaoEyv7LOSlyV04UfCfkcw7vTpm4rAiR2y8rnQjbTb?=
 =?us-ascii?Q?CS420JDtFw1HVdASMK5tUIZ7lHLgN/SjWCRIJiIK6HjVeNZL5PTjFNcYU2e6?=
 =?us-ascii?Q?1jGq1vkc1m8453kzs1hJZAmArmRV5CPHW7txbjOVzI6XwYRKLwXbs3fJrfCR?=
 =?us-ascii?Q?AluyANXT8mqIry8mfEx6op8kCn8ZuEzc7D0r60ijrK/zVtdyWXPYipZyopdj?=
 =?us-ascii?Q?NZqp0B1iGiAYFSE9Q/JpE8xmkdywWwPYcrU2O+tKAgjYDFokWt4aOaJqvPBN?=
 =?us-ascii?Q?bZmR9t6Q3lAvwcnU4m8iA+//KRLwGicj1McHd22era2pO4+gvknyWAnEzVnQ?=
 =?us-ascii?Q?dH7VMz9vyQZVPx5CHkbhUgxRD89Znay+cpxLIdk5IUhYXca4EuovIdwdl1TI?=
 =?us-ascii?Q?P1lsXluydtryQmKlPs8fyIrNuGfly0G7BWqTkbsETq5ShZR+IFVea8glu6vN?=
 =?us-ascii?Q?LlORpvhiD5OqKlogVoq6eb5W2OS233QPeUjIiwCCjEO/xGFdYjy+L/qewqeY?=
 =?us-ascii?Q?zPIeO05QuWXEQ2F6+84Q0efIRsXCc/b/60tUeo6Oz5sE0qXqeZch554yCba/?=
 =?us-ascii?Q?VeY8eRl2rA0UiSrI2PpLYXQrY4A7oe+Sz3UGVKKLzQypLXk5sX1gUTaW4/jG?=
 =?us-ascii?Q?eA14BblZULGfas+p/zajg/7zBMkyOULD4+JfFxStjE6HOEOkN19E3yu0PRTg?=
 =?us-ascii?Q?xCwhTTB8cNas1bMwWQrR5hAg9IK7rK762VwXbrf5+bT8u3JHA0ADoaky0Fwe?=
 =?us-ascii?Q?krKmvBJEVtR/+M8Y1/WIkaMpyO/sIEwHVi1o1xJiAq+IhyRgnBz5x3ryi/in?=
 =?us-ascii?Q?TVytePYDjqMSC53tzWm33a9GyzVW/wOoLfTaPYFkKXvbT4I+nJly9r9Gedns?=
 =?us-ascii?Q?W5iIMOTT3eM0F7eSep64tCj4VaP6YWK/MHh8dBtIEli42/7q5QthgSMuh738?=
 =?us-ascii?Q?E7oNQGBfXrtA6d/f+ztHrWI8rknJhNO3CmMy3D9SoMfcXoGDL8KMnU33nto?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9aa5e5-41dc-42c1-0bf2-08db43be7d80
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2023 05:49:23.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6P221MB1121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhrBpy7hcuP5EFBu7PqF4adNobO0oEBrACtygdm9tos=;
 b=fQPoZMgVaVIyjIDOhMmZ87R5DimLRcQ+qihBJ64Z04Ox3WADKAc/N+k238ESARSdMyf5/FAOQELyNBp/21/LaG9EIfeWLgIuZ837UfxH801KTyGxVfQI7Zy5MJyaZecWKU9/u9l9pMP3kCm1bgHMw8/ZFJMYMjt6eCdF6NZpBy/U1QHzSYgKu/D5ZjQn3CQjmKY2qSBaJphPmvLOZU5gUzooCAQ5L+L5xam8WFIzMXiqvjvwdYttb2dZ6h5+ZjGCgEGX7J82CjQF7Alt3wKjSXMFwbPU2rN40KNdJd1p8fMUYm9xK1fSOoNWhsNT2TuwaEvRJEDNKIbS5tCmflsi/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=fQPoZMgV
Subject: [Buildroot] [PATCH] package/plymouth: new package
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in              |  1 +
 package/plymouth/Config.in     | 59 +++++++++++++++++++++
 package/plymouth/plymouth.hash |  6 +++
 package/plymouth/plymouth.mk   | 95 ++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 package/plymouth/Config.in
 create mode 100644 package/plymouth/plymouth.hash
 create mode 100644 package/plymouth/plymouth.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01af363936edc8a0a8dd2450c458a38ae..cac5c0e388a7794e7e3ae65f58c439e2cfd1e816 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ comment "Graphic libraries"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/ogre/Config.in"
+	source "package/plymouth/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
 	source "package/sdl_gfx/Config.in"
diff --git a/package/plymouth/Config.in b/package/plymouth/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..5046a2a0fc65a9aec10c23c5899375abda33e839
--- /dev/null
+++ b/package/plymouth/Config.in
@@ -0,0 +1,59 @@
+comment "plymouth needs a glibc/uClibc toolchain w/ wchar, dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_PLYMOUTH
+	bool "plymouth"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on !BR2_TOOLCHAIN_USES_MUSL # rpmatch
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPNG
+	help
+	  A graphical boot animation and logger.
+
+	  https://www.freedesktop.org/wiki/Software/Plymouth/
+
+if BR2_PACKAGE_PLYMOUTH
+
+config BR2_PACKAGE_PLYMOUTH_LOGO
+	string "logo"
+	help
+	  Logo used by boot splash plugins
+	  (default: $datadir/plymouth/bizcom.png).
+
+config BR2_PACKAGE_PLYMOUTH_BG_COLOR
+	string "background color"
+	help
+	  Background color used by boot splash plugins.
+
+	  Colors should be provided in the format "0xRRGGBB".
+
+config BR2_PACKAGE_PLYMOUTH_BG_COLORSCS
+	string "background color (gradient; first)"
+	help
+	  First color stop in background gradients used by boot splash
+	  plugins.
+
+config BR2_PACKAGE_PLYMOUTH_BG_COLORECS
+	string "background color (gradient; last)"
+	help
+	  Last color end in background gradients used by boot splash
+	  plugins.
+
+config BR2_PACKAGE_PLYMOUTH_TTY_BOOT
+	string "tty boot"
+	help
+	  Default TTY to use in boot mode (default: /dev/tty1).
+
+config BR2_PACKAGE_PLYMOUTH_TTY_SHUTDOWN
+	string "tty shutdown"
+	help
+	  Default TTY to use in shutdown mode (default: /dev/tty63).
+
+endif
diff --git a/package/plymouth/plymouth.hash b/package/plymouth/plymouth.hash
new file mode 100644
index 0000000000000000000000000000000000000000..bec4dd022f128bc4ea92a6f7dd4f515785a7b053
--- /dev/null
+++ b/package/plymouth/plymouth.hash
@@ -0,0 +1,6 @@
+# https://www.freedesktop.org/software/plymouth/releases/plymouth-22.02.122.tar.xz.sha1sum
+sha1  2a68a69b674b643cd50c48685669bb0523aeb68b  plymouth-22.02.122.tar.xz
+
+# Locally computed
+sha256  100551442221033ce868c447ad6c74d831d209c18ae232b98ae0207e34eadaeb  plymouth-22.02.122.tar.xz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/plymouth/plymouth.mk b/package/plymouth/plymouth.mk
new file mode 100644
index 0000000000000000000000000000000000000000..20dce0d92b792e01e81a3513c2714d6ee993942c
--- /dev/null
+++ b/package/plymouth/plymouth.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# plymouth
+#
+################################################################################
+
+PLYMOUTH_VERSION = 22.02.122
+PLYMOUTH_SITE = http://www.freedesktop.org/software/plymouth/releases
+PLYMOUTH_SOURCE = plymouth-$(PLYMOUTH_VERSION).tar.xz
+PLYMOUTH_LICENSE = GPL-2.0
+PLYMOUTH_LICENSE_FILES = COPYING
+
+PLYMOUTH_DEPENDENCIES = \
+	cairo \
+	libglib2 \
+	libpng
+
+PLYMOUTH_CONF_OPTS = \
+	--disable-dependency-tracking \
+	--disable-documentation \
+	--disable-rpath \
+	--disable-upstart-monitoring \
+	--with-release-file=/etc/os-release \
+	--without-rhgb-compat-link
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PLYMOUTH_CONF_OPTS += --with-udev
+PLYMOUTH_DEPENDENCIES += udev
+else
+PLYMOUTH_CONF_OPTS += --without-udev
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+PLYMOUTH_CONF_OPTS += --enable-drm
+PLYMOUTH_DEPENDENCIES += libdrm
+else
+PLYMOUTH_CONF_OPTS += --disable-drm
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+PLYMOUTH_CONF_OPTS += --enable-gtk
+PLYMOUTH_DEPENDENCIES += libgtk3
+else
+PLYMOUTH_CONF_OPTS += --disable-gtk
+endif
+
+ifeq ($(BR2_PACKAGE_PANGO),y)
+PLYMOUTH_CONF_OPTS += --enable-pango
+PLYMOUTH_DEPENDENCIES += pango
+else
+PLYMOUTH_CONF_OPTS += --disable-pango
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PLYMOUTH_CONF_OPTS += --enable-systemd-integration
+PLYMOUTH_DEPENDENCIES += systemd
+else
+PLYMOUTH_CONF_OPTS += --disable-systemd-integration
+endif
+
+#
+# advanced customization
+#
+
+PLYMOUTH_BG_COLOR = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_BG_COLOR))
+ifneq ($(PLYMOUTH_BG_COLOR),)
+PLYMOUTH_CONF_OPTS += --with-background-color=$(PLYMOUTH_BG_COLOR)
+endif
+
+PLYMOUTH_BG_COLORSCS = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_BG_COLORSCS))
+ifneq ($(PLYMOUTH_BG_COLORSCS),)
+PLYMOUTH_CONF_OPTS += --with-background-start-color-stop=$(PLYMOUTH_BG_COLORSCS)
+endif
+
+PLYMOUTH_BG_COLORECS = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_BG_COLORECS))
+ifneq ($(PLYMOUTH_BG_COLORECS),)
+PLYMOUTH_CONF_OPTS += --with-background-end-color-stop=$(PLYMOUTH_BG_COLORECS)
+endif
+
+PLYMOUTH_LOGO = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_LOGO))
+ifneq ($(PLYMOUTH_LOGO),)
+PLYMOUTH_CONF_OPTS += --with-logo=$(PLYMOUTH_LOGO)
+endif
+
+PLYMOUTH_TTY_BOOT = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_TTY_BOOT))
+ifneq ($(PLYMOUTH_TTY_BOOT),)
+PLYMOUTH_CONF_OPTS += --with-boot-tty=$(PLYMOUTH_TTY_BOOT)
+endif
+
+PLYMOUTH_TTY_SHUTDOWN = $(call qstrip,$(BR2_PACKAGE_PLYMOUTH_TTY_SHUTDOWN))
+ifneq ($(PLYMOUTH_TTY_SHUTDOWN),)
+PLYMOUTH_CONF_OPTS += --with-shutdown-tty=$(PLYMOUTH_TTY_SHUTDOWN)
+endif
+
+$(eval $(autotools-package))
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
