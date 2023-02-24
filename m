Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94292C677F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E9A418B9;
	Fri, 24 Feb 2023 08:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E9A418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TqzQIgCWTkO; Fri, 24 Feb 2023 08:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA094418AF;
	Fri, 24 Feb 2023 08:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA094418AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4491BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49D0B60EC2
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D0B60EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V31w_bwXpHl0 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422C760BA1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 422C760BA1
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LryV779fDnH7Z9UhMqsqnEKfvDtzwXexhxUhdtqBS/7Xd7ONVZWHXQ4jtb0HiLs3spuWbR9JY14mwZJ4JfvW46KxN+7JxA1jQf2/J3/rZu7Zn5pxPvK1+t8fJPg/nE77qNBlZMplkynD634yDxeXeWq3aj9zSFceV+WJjX/INXTEzrG2a6xG532WS1PqVYqVTsbnGFjAT3aODsVuIvsf3VS/oqT7HWYyYwYNIVZNzzPldA0RgkBbtsnqG9CSS6Rk6Bajay7v+pzKSxaQm86fQ0ZCNGSrsrPuXOkE6b0FR0hp8x+i0j+wBFSLhcXySZAah39BBHDSXt9tKROlqdRfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoJ+ugI2plF/NHxZnzuHP9EVPMfrHUxJMMKPYdSdd/w=;
 b=E+4uANdNUWtWP5soiiyxsGltnTJawCgXrTLxfbAwZNQ2WZJSWMrwu2TuYZZ+hwgOpVkm7b54jRZuunESE/i8jOMLByBdKvUxKHq//D1P8huXgK4wM4XPf3QHOK9EBSGPAzepBjESAfvadZyh5ZZexwc8ihVNqR/ueYfDnSH3/2HbwDSPLGPO1eG1Tmv659xf+hV+2bAsFB6xE1T4A5zcA2c1xys79SpkJYUduNiPgqc3o58Et8o5/hrD+kHUeVs4FPlLKwVPK/Zz/hs02g4ZGV+M3JSuwuXKLyhYDmGvI5nCcyEMryNtvYyZR0iXzyHK/tVJv8MkR9QLVAgX0s6LaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0942.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:43:23 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:43:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 6/6] package/gtkmm3: use correct versions of mm packages
Thread-Index: AQHZSCvD6vVeg4kM7U+iOA+jcKN4KQ==
Date: Fri, 24 Feb 2023 08:43:23 +0000
Message-ID: <VI1P190MB0493B84570239FD4970E44DB9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0942:EE_
x-ms-office365-filtering-correlation-id: 910e9c37-42b5-4be6-3a99-08db16433041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBEudYeH2sZarsdKH7uJ0Ir3isTjFbswxW+zFWcOXRN8As4/fa7elJ0LFzeoKAYkOxP2f4o1eg7kQR8/m83waCpbOd46kRelWcqjUILT1uH4RjKrQ0dyLQf6S+pDEoDxtZimi6c/Nq5QFNSJrOowH5vUD9ovIPWIMWeJrRR48l/OSG8BvyqzoEqqYwpZ9914hqpVOc2GLpeYnoasF39Iw08t2tSvTclXTJnZUHvhtlODJ2yXelOAlFtWcRyUDMUGHQ6UpBHFIBv2mF2Cx1t5MkNChpqpkSHMI7dOyCWdlV7eGwoZWxq0pmfKTKqNmrUi8ANHrHaLXtAXD4Os4w6fgHtA8ryJE7EQQjdNf49PyOv0K76+rDiTFSGb7Z6Yzxth+FyTL+MGw4/U8Dm2FAknV5iJKgsSs61osf7CtrhOAtdDnsmNqu9nMYvJCFvla/Z+vxAMsX/nLi7t0k3gBoo9bUtl96rq/vGIb3I+I9vhQwUcB3/lQSAgd/0zCTJG8tkiYTtdBDeTiekITuBkIBGEXy7s7cnxwo+72nA7mTaBQ2khNQ5w1v0FenFZaBjo8aY8YMIrtXnod1D1NBYRtuZSBP3drwvczdyeQfOpaXJK9AE6fTG0BrLYHCW+qfVUchiA+NabT5bJrkcPp/KKGmdUdJ0jz2F8dH4+Z1s0YiNYuaT4m9J1b3wpt2b0wOrntyiQaCOETvzbZOfQl4+q3VUe5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(366004)(39840400004)(451199018)(33656002)(71200400001)(7696005)(966005)(8936002)(316002)(52536014)(83380400001)(5660300002)(66476007)(64756008)(76116006)(38100700002)(66556008)(66946007)(8676002)(6916009)(4326008)(9686003)(41300700001)(478600001)(186003)(6506007)(66446008)(86362001)(2906002)(38070700005)(122000001)(55016003)(562404015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A2dXcB+ydPrf55NzzUPbfQDId0UJKE4bYYJWXu+QNQR7v0fn0TDNTAlsUk?=
 =?iso-8859-1?Q?XqtLTed6msZidYxcI7wO9IKqQt0JOn1ggtyoEVveJYX95T0O7kymgx+lGL?=
 =?iso-8859-1?Q?kD6/d/Rtr/J0OKTdB51fuVi0p4xcjAYkioVouEvZlGDsB2Fo0uYHR5AVpr?=
 =?iso-8859-1?Q?EaaKFp+eP+UhIrYZAwZQRGfh6Db0o2y8Arvy0Exn9nptE8NDbzVQHV0dKL?=
 =?iso-8859-1?Q?fg66IocmwxRRRvtw2iYOOgZRmXm3pstUsxcMDYRhyIzllu2E3ovuwXegin?=
 =?iso-8859-1?Q?pdmt+jrJxcQjsF5JEc3cRAgITf2cM7T0QauU+CFAAR/+Z8l2D7BP6JOWcG?=
 =?iso-8859-1?Q?9fvYGJsAYzGp7cXoIhEA+InYaoNiamdQrkhfRiaABBJdAsKISrX3v8IfGx?=
 =?iso-8859-1?Q?XXErL4ia3JcjfbkJiIKzkpE4Q53H+h8YJlNLecO6yXZ7Q6eb6tWOAnR1yb?=
 =?iso-8859-1?Q?wygzP6XNSL1qm9u5EkbYHPnsM08N/2If2lWuw91wZDa6QYIUbQfZfhhKb0?=
 =?iso-8859-1?Q?8BAjlWxWEDpTMPHtsHsXjejj8e9LnS65XPUXuXtpEMlmeuEkG8myW6pRP3?=
 =?iso-8859-1?Q?TlA9iGiA+O4afQ75Y7V8ZRZ3Yk3FmQhXPkaSkAAUX/zPNFgvXJT96BZdMT?=
 =?iso-8859-1?Q?nsKtgY4YO3p72qJbYtlLg31GHDxt+1+Q9Y421DwkpCUju2C5WWyWJnnP/t?=
 =?iso-8859-1?Q?9GrD8F1sgyVrFTwNMKoFDH85EQxM02mDhTZun1YyPTmbDrNrK3BArOuPcu?=
 =?iso-8859-1?Q?wWv4Qpm4Nd3op+fi2riE9Cz5YlWgtELkyopSrLPe1CtbyKZAzxmpEh0+C4?=
 =?iso-8859-1?Q?+Z/CjknlDVGs7jQVCrlcI+uEH6aezLHkKkR46J1m33l9xAs35DbVrYvOeH?=
 =?iso-8859-1?Q?Hsqa6mCZA7EGDn+aLyqhiDOYZx57ElYEWL1lLlWroBY+BHUjJWm/OmgmEj?=
 =?iso-8859-1?Q?evKjMOtYOYmbbX0WduwaBkWnzIgEfednzguqk98mdf1J1HPGrP22dba3+/?=
 =?iso-8859-1?Q?dVuhnYtNfMxEB0s03s1RufOe4vFBmT5ZdDghPHTkVCkVACKlhTgemNIp5V?=
 =?iso-8859-1?Q?w5AAFEvhDIkpjlAHjYMs1y/Cxu1Vgiu1LHQz/RUwYcfzVsYzQWckJr9xWT?=
 =?iso-8859-1?Q?6IU26RwczD7idDm5LLZYIyF9tIMIqLdNgD3IRHq+fX1krvSJlKtgjEq18F?=
 =?iso-8859-1?Q?2OOUJYPVW0tj9cXShuZOVfiVndCxejrVpE0Bk64rITpugRo/bNto32R2uY?=
 =?iso-8859-1?Q?5qYeh277v40EytL5IHu04dEfny3qTBMheQOrNKGtTVuzpmJXRjmI/Zzwlt?=
 =?iso-8859-1?Q?TkpCQP/iefa1VuuuGbzx1Act4tfiFG8hw0IOjA2PHMIvdDhRmy8SuDCRvI?=
 =?iso-8859-1?Q?H66Sh0rK4NFqtna8tcUSmsWVSq+nzaI/3BsBY6R4KDSvEl0c5Qx80dkNWF?=
 =?iso-8859-1?Q?djnnPiSlLCCVQvu2GhiQmTP012zckA6kGoDf3RX4LwE9eHX5ttIFk6ltyD?=
 =?iso-8859-1?Q?ZTgbj8NqRN98JGZ4sMl49E0xS9ZV0JVdez7OaIOJ2LE0BOwYAVXHMFxXTQ?=
 =?iso-8859-1?Q?8lossNv6WDu5FwAuOsIRO81QDf01+x+riT6+ce9m3XFdQZP0fBpqgZXxln?=
 =?iso-8859-1?Q?zXlstc34q8yaK+d8TkVn9GWmi2McVe+PXGVvrA5el/3Bcrs2go8c49OuwP?=
 =?iso-8859-1?Q?JJyDAHG8mRuOyXwJTug=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 910e9c37-42b5-4be6-3a99-08db16433041
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:43:23.0945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgKeSOrmzbcRq6Ssy/PKDElMH8ZhrD/hyA+/qVmwyl3UwfKNd13GzPDmDTHAzHnB2hcOOBzCNBTc9svbvmzN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoJ+ugI2plF/NHxZnzuHP9EVPMfrHUxJMMKPYdSdd/w=;
 b=mWh7laglQgSkPuhSHsIaAzfyropdtfXBct5bxO/4d6x8RdS1JYgvJnxE8dsUfCheso9m2Ou/2S5gj9gUXeV63zPVZB1NdLG2ROwFw/M0+HD7iH0AESUYxU+3OlVJDWqFjKBQsbZ7zTBl98KeUBSwQ61Ae4dwwyQZrb0r/+fvNw4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=mWh7lagl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 6/6] package/gtkmm3: use correct versions of mm
 packages
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many of the C++ wrapper packages had API changes. These changes where
never introduced in gtkmm3, meaning that older, but still maintained
versions are needed to build gtkmm3.

Fixes:
 - http://autobuild.buildroot.net/results/172/17263ac51f197031106eb7fd595126a2720f0397

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS               |  1 +
 package/gtkmm3/Config.in | 16 ++++++++--------
 package/gtkmm3/gtkmm3.mk |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c183c9a2df..c42ebeb6c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -647,6 +647,7 @@ F:	package/cairomm1_14/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
+F:	package/gtkmm3/
 F:	package/libsigc/
 F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 3c1c6f36e8..6b924c856b 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,7 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
@@ -14,16 +14,16 @@ config BR2_PACKAGE_GTKMM3
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
 	depends on BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_ATKMM
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBSIGC
-	select BR2_PACKAGE_PANGOMM
+	select BR2_PACKAGE_ATKMM2_28
+	select BR2_PACKAGE_CAIROMM1_14
+	select BR2_PACKAGE_GLIBMM2_66
+	select BR2_PACKAGE_LIBSIGC2
+	select BR2_PACKAGE_PANGOMM2_46
 	help
 	  The gtkmm3 package is a set of C++ bindings for GTK 3.
 
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index d717c08bd8..8bbcf224e6 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -11,6 +11,6 @@ GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
-GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
+GTKMM3_DEPENDENCIES = atkmm2_28 cairomm1_14 glibmm2_66 libgtk3 libsigc2 pangomm2_46 host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
