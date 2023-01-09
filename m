Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66472C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 12:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE4C81375;
	Mon,  9 Jan 2023 12:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE4C81375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfi4Us8Bty0V; Mon,  9 Jan 2023 12:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE19181390;
	Mon,  9 Jan 2023 12:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE19181390
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4C81BF21A
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A50660F1C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A50660F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBvpfqPFCkQU for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 12:59:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD34160BE9
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD34160BE9
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 12:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM7GvVrvTAG2T/VivyIfhRLtOIpNdBn+16nJCFdLfbJDdSwUjtN7W64sL4d+zNiEIa4QV1uzfN0b9V+vaR17hWvhTlx9dnkeIuDaUSu/nzAhEIFpxBZiqf1X+uCtb5cR3+Rl7ReiFhTG6ayd8Hcg++ACG51MGq4dVblRwxJh6AggAJqzFwjUaaMwDo8uVaUsmg5mJlGh6oX6OJ7Qp2b80w7mc0cyPakf8eImOZ4wykJ3hW1p30eveJvA4OESpyuRWulZdMmAuiwWUjgQUBcBuJA4AvmrGsert5Urme2jjh0VqMROoctww4+ph0nl5tvldwmhYzoErwPNiO1qE2+oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Cv3CrVYip+hvlZ3VeQ/gsJntTt83n86/73rvoeVjmk=;
 b=Aw5tkox4eclupTNLhQt5PtRFRKQl6UtDHukJaLZu+2AfltA81zeiBv7QNSJR7y+oZXqo1qqQkBqzNogazvjMnrOHASh7YNJUR5JS0tYQUv6gnGzHxvjCHGB9xhCjab3ICy9FFG9G/71XwMHuOBuVdy6kGgm4IGfjpHcBk4XEuPGzOIEekqAleyEeErDWPzGZ0YL7YQ6+cIKFcKKy1Fw1O7omNjOK/JEr23abR55OFHCHlpn2lQFty15hRBD4yWAzaXTRzcl37fCjnT6d3+h/bszmX2avUZa9QpPkz43GcbuG1l+ZSbH0EACNVBd6/B2uQLtgvnyWXi1ebXqMyejWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1795.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:59:33 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:59:33 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 4/4] package/atk: remove package
Thread-Index: AQHZJCna76x930sTekq7e1U9I+ZGsg==
Date: Mon, 9 Jan 2023 12:59:33 +0000
Message-ID: <VI1P190MB049320A6AD3502E69083DB819FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1795:EE_
x-ms-office365-filtering-correlation-id: e89fd99e-3eb2-450c-1477-08daf2415ad9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NcIE7jMmCKo0AOo/Tg8K6k0oYZoqeSUME2+AHbu2aeOptIV/bCp5wWfCHuUW3HpzMa/5IAHP23uMDa4DmZpSmqXfz7qVwosiAwM7+A1ozTRwC+8g98fQ8ihK4FDzFiz9tHJ2JBXzrMdsXKldN/W8cxaACje9yInJfKjZffxbfOVyeIcSe5S7yaJZx3wT1ooee2d/AlMfzKQcZMGXe7ginrL1Ql/ER7NoR5Ac99qnc1lJhKy9LhvU9gIcxJPiU29qVfwFV3ame04/cm2ZyAa93FFrKcHGy97N6iYiIjXKcd15D5A6/icpjpyMGea4U10NPTtQ/3UyRCDlpRZg5phE92yGlqQf578LtF5fRsoZq7DKhS2akUWWR6kBl4kjrzq+h3ieX2ZtqYPRKVyRprZO641h6KzzxiELKXIxWpu1CibzhkTVYud9fg2ZszhhDOrjQy8ps0Cw45FO4QOmQ1r5JP3anfslYfm/82xOnBdcFUhweqJmBgEEpLbPjs+aqE4Po4pWKSY/UiRxRtO+RmNaczMvPWq2z2BP1NJHmbR5l/Jidg70FFdQBJkjS1qd6JPcJWx3FRA2gEeoRZw2V3kvXjAcHJExBWliSFTRLNrNlNqXk84MirsZI5Wd2eT9zMRMyELJR23yZBIGulkipGP/4gKcA8AMBrxpl/LqtYmQf5ZQHmLQtJ/JnUOaMudbwpfD/0w4sL4E7t8bigXn4Tr6amcsxxZ1Ebu0bbWmXR/5+UA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(451199015)(5660300002)(8936002)(52536014)(41300700001)(6916009)(2906002)(83380400001)(38070700005)(66556008)(66476007)(76116006)(66946007)(8676002)(54906003)(66446008)(64756008)(4326008)(316002)(33656002)(71200400001)(7696005)(26005)(9686003)(186003)(478600001)(966005)(6506007)(86362001)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v+4aoyf9qsi9yqSjK6eXUDEj4DTDKUvg85nWWgTrFFWfr9bpaq+uhjXwyk?=
 =?iso-8859-1?Q?//sPzT5ofraQJaCZSDz2sGJgopMhuS622Iu5pUEKSbYafgbXWs7876gTQC?=
 =?iso-8859-1?Q?0XG8UNMZaE3/txRvsh9OAmz964v+N7V7/g5sZlS7DOcOo+HTwy5vKkDfpW?=
 =?iso-8859-1?Q?CDh5OPNNXi273DzyOUjUZRYfkgx9qXiOJhuYogPY4ZyOSkUUBxHiw0FO+c?=
 =?iso-8859-1?Q?ZNumqa1NRc05huuAw9+lAOnH1aMS700IM7yeW8Ag04EkVP/kentBcEcr01?=
 =?iso-8859-1?Q?eThWvlxj1KjEqdkmgoyXGI+KLSM06WJCwmjttGN6cuwK1eM3pwKg7LWV6R?=
 =?iso-8859-1?Q?97xISrSi+Xd/QoONw+Tqnmz6YyxW7p7vSsFnNhEERNrDjLOTXLHfceh+LY?=
 =?iso-8859-1?Q?B0djuQ35T4L2u7AeATFgMB4Q9IHcL6yorNlMM5ncSgSXlQVqyOF9+Bp/up?=
 =?iso-8859-1?Q?KIXuUn3Qn19sWpY03w3ELDAboFhPBKfXysisYnAz8RTJqgt1Qhl6ekJmWE?=
 =?iso-8859-1?Q?u+yW+Zja8s2D6Zfjmr1w6ic2jPyiMdUl6A0YUdAJkHn2LA6xM8oiLwxBFt?=
 =?iso-8859-1?Q?4E6hlPQJNT5Iqy+o3W2sbtLHTHyRM+vbiV/CKdcHinYVISkN9R/fj4d7vx?=
 =?iso-8859-1?Q?VlLcxx7PhRAjCp08xDlaCpzTLNuOKAPY4ilVs9jLGyrcPC5lBQ3Q0HPNzB?=
 =?iso-8859-1?Q?EdxnZ+KD62HX7IkI+0i5jTvrKGp7vJQ2KM6mjkhthhR5Lqcp8kjJWWxNgo?=
 =?iso-8859-1?Q?wDhDz87jqWWknLhI/O0Wvo0HdUBuYZwwPFSpY04D72kGhhZLrium9s73rz?=
 =?iso-8859-1?Q?9TNbMGZpL3IAHPWAf1ub6zGSxxSzmhxexbEz/zMVrsCXUOhZ0Y19b/KgAr?=
 =?iso-8859-1?Q?0aE6xR9xRNYTt8RdxglUqDL6DH/u3g2+X9OIQ/XJQO9WZrLBLXQqLYmtda?=
 =?iso-8859-1?Q?vLJYa9lhN/fLGftM9Dm63RBqoYunWg1qeAdjRmOXCmUsgmYo05zhk/2SYZ?=
 =?iso-8859-1?Q?Vtop4K0ziSn3x4GYmeBNBuHixys64iF41OsXzAk2ioWqmnKjQgfxwafhna?=
 =?iso-8859-1?Q?5hntCpsu77/tngiPqvBrhOmZOPI/OfkFNYd5/T4UReuY0hgrVHP1qufCMW?=
 =?iso-8859-1?Q?OS/PWGy4L22AR9vjcgiEsoIX/EFrA1XsXOtM0olECf60oFovY+5XjIrlcz?=
 =?iso-8859-1?Q?rdG5ahkmdccmswKZ7cqvVQHBTWTWQPy9jHnbVdkKGIJdC60AH/T6yCkjzY?=
 =?iso-8859-1?Q?p9rl93z6818XFZbZ56sbpI6TCtVeZUrpcOcTfoSgI1zHcj9I1m331jI0/G?=
 =?iso-8859-1?Q?QLfyNiVrhAZws2k0WJVgtT5Bv3+IkVdcnSN/Y8Nhmd88NaE9w8VQ3sHgaG?=
 =?iso-8859-1?Q?9tcAg1Lncwau5E3uw0h2xHh0JsSRGeNWYeIhmmTqVFLzIa6eJ9iZc7TiWB?=
 =?iso-8859-1?Q?Ol9AJt8c/djoQjr5bRLKPpVLkccZ9S0q4i+PGL2a9I7YwAA6JzPWB9bB2I?=
 =?iso-8859-1?Q?rwO4vVs4akKXRVAXFT9Fr5Mj8WUQWI7KSiEx5AYZkEaoUHuPd+aeL/o0px?=
 =?iso-8859-1?Q?4mYxXgFKQSbHgxst3MWoW/9RQGk7StjqHqqnVOdHpShoe54WpfRGyhcBRb?=
 =?iso-8859-1?Q?2GmEUDw/vRBNk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e89fd99e-3eb2-450c-1477-08daf2415ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 12:59:33.7006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: st/0zE4oHVHhEpsEATlBD29duTy+iYZnM5gNrVWPJZ9Seg4WhckOhEgV0F2JfYCc+FgbI6fiCrUBJcLqjxQkng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Cv3CrVYip+hvlZ3VeQ/gsJntTt83n86/73rvoeVjmk=;
 b=zcgJ4b7U7Kb5ieinVYCRQZhz55rJgGO3z2IBckKFNXNB5h8aBI2Y+X9TyHkZ6uxedNvmUl8KAkVvOSOmGsCSkCAEx5+CYZ7EGF1fHGzswWxCTpmmiHOD6EBN5NtLDek1VREkviCc7Cj7GViSJAQThSIZS0gJfMVxWMsanQWx3Tg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=zcgJ4b7U
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 4/4] package/atk: remove package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/atk/Config.in        | 14 --------------
 package/atk/atk.hash         |  5 -----
 package/atk/atk.mk           | 25 -------------------------
 package/atkmm/Config.in      |  8 ++++----
 package/atkmm/atkmm.mk       |  2 +-
 package/libglade/Config.in   |  2 +-
 package/libglade/libglade.mk |  2 +-
 package/libgtk2/Config.in    |  2 +-
 package/libgtk2/libgtk2.mk   |  2 +-
 package/libgtk3/Config.in    |  2 +-
 package/libgtk3/libgtk3.mk   |  2 +-
 13 files changed, 18 insertions(+), 56 deletions(-)
 delete mode 100644 package/atk/Config.in
 delete mode 100644 package/atk/atk.hash
 delete mode 100644 package/atk/atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 184bab6097..ac5943519e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_ATK
+	bool "atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_AT_SPI2_ATK
 	bool "at-spi2-atk removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5c8dcd849f..95db7c627b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1531,7 +1531,6 @@ endmenu
 menu "Graphics"
 	source "package/assimp/Config.in"
 	source "package/at-spi2-core/Config.in"
-	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
 	source "package/bullet/Config.in"
diff --git a/package/atk/Config.in b/package/atk/Config.in
deleted file mode 100644
index d9371b879b..0000000000
--- a/package/atk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_ATK
-	bool "atk"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The ATK accessibility toolkit, needed to build GTK+-2.x.
-
-	  https://gitlab.gnome.org/GNOME/atk
-
-comment "atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atk/atk.hash b/package/atk/atk.hash
deleted file mode 100644
index d8cd69ff1f..0000000000
--- a/package/atk/atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
-sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
-
-# Hash for license file
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
deleted file mode 100644
index 2820fb486d..0000000000
--- a/package/atk/atk.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# atk
-#
-################################################################################
-
-ATK_VERSION_MAJOR = 2.38
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
-ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-ATK_LICENSE = LGPL-2.0+
-ATK_LICENSE_FILES = COPYING
-ATK_INSTALL_STAGING = YES
-ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-ATK_CONF_OPTS += -Dintrospection=true
-ATK_DEPENDENCIES += gobject-introspection
-else
-ATK_CONF_OPTS += -Dintrospection=false
-endif
-
-ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-
-$(eval $(meson-package))
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index aa58f8d593..f6f2ca8fc2 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
 	bool "atkmm"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
 
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 3bcb941c9f..76371aadbc 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -11,6 +11,6 @@ ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
-ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
+ATKMM_DEPENDENCIES = at-spi2-core glibmm libsigc host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index e269a07548..4cf2ae4086 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Libglade allows you to load glade interface files in a program
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 32fa595f5a..24865fb8ff 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -9,7 +9,7 @@ LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
 LIBGLADE_LICENSE_FILES = COPYING
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..f2888b2f51 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d30e1d9d43..ad4dd74e4d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango at-spi2-core \
 	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index bc8cacd9f5..cb44607b7c 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f277fce2ed..15190efd96 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols \
 	LIBS=$(TARGET_NLS_LIBS)
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
