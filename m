Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DDDC77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D7A60F06;
	Sat, 29 Apr 2023 19:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D7A60F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9bUGDJuXy78; Sat, 29 Apr 2023 19:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89DA60EED;
	Sat, 29 Apr 2023 19:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89DA60EED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60AB1BF2B6
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0BC241E42
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 19:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BC241E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEJ-roTQhACW for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 19:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E035B41607
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2082a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::82a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E035B41607
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 19:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2bupzHe15BpLek0GIZgbdiuu3DD+mE48qgTzxpLhD/ESv2kYoM2/NhEWPcs6w65A3F/y/lOXpElXbYlP/9ZadD6ObaJL8xtHVUtWsBfjiXIftuajWlN4Ihbt9sYkpFMkd7zZKJPqii1Y+hOC8kwhm+mVGs4+kuQUIv8csVWiUFSmDCCmWuNMxKdECNzcJrS4ZhWPQbO0TSlexPmkQhg+xIiLR+ZhGzi9yXCYnDvpz17CbCHC3+zG9n0XkfWswBTMVUH4BCpXNKhU/o7Mw6t5SR4uThLbNjBF53af/c3i3Dk01H/9fsKZpfRJwhwjfYELsU0l7lHIk/kiOC6kr0c/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSl2VKodKkImqyN5FaFUYinH5RVQ0UMNg7DDfYoZD+c=;
 b=iOt0pfPF90ThJ4seNG5My85YaHRzvEfaZnqVqYnJeIjkGM69EJV5T4C324IwOU3v+TtR2qXFojOqCMS7OIS+0WICesd5yTY8L23jWPNM/FbGbG21jeZ1kYfjoqIcIHFuAipaj4QxZGoqcyBYm7kiKoSvsL34sZ39Pa6Sre1JLw5x5kJtXHNtTTsbI4U9i7BySugYx76dYht3e0LyA01mNbgx/F190Rs8/T1wajhGewruwO+2QLCA65ipRSARWVq3x/YyTzFvqawCEAKMz2Zn7ePG2adzrx/zr98j9UY7HH5HLcX36GSV+BSJqjC6r1zqU/cEYn42I/BQ3Fp86a3QkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ2P221MB1085.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:53c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Sat, 29 Apr
 2023 19:53:00 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 19:53:00 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 15:52:24 -0400
Message-ID: <SN4P221MB068257366E0B70F2D1EC85B6A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [3G/1fWu/RzWNtaSkeUqGlqOLYlG0EBB2]
X-ClientProxiedBy: YQZPR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::13) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429195224.3877-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ2P221MB1085:EE_
X-MS-Office365-Filtering-Correlation-Id: 571a5363-1767-42cc-5046-08db48eb55f3
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mv3e5ZaE58Xp9xp3yFLq/qyjZLGWYuI80z8lUC483XZuyNHQ/A294/kf38rt/qWg6Lko0gSWqhw0Wm7P7KZSJ3HX0lGtEFflgagaY/b9xSPVvJBJ2Oz21/DAOpP2GPlQMD4j8g4qe5deJMdUm8U5h+4OIcwqR453oS3GHxVwxnwx//yuj6ujGKF4h9s2ylnPis2HXYrIr9Tq0+96Pv+1ppoqLPIcGZ+Q/9O4/hV72k0ZpE5/CNpZ08W6mmWccyV+TzIRprf2klgSavVw4jGzJQo+KWTHc1rZVj9UkSd7XPJBazxqWnXecPX+DbdMxQnJr+6biKu1xgLZ7MJELaGQaTr1Orfd0fP2nGu/L8aUzjRqk3+mefivqVOQEeusFnlBcj2Q8DkXi/rQOnCyUcRWs9KUW7njJjFMjhoxHqbkKmn+dvWh2TreMjLD3hvbVcYJNDtvTEzNrJOBS0GPyL1u2dcogYvggFNN0ytKqWYOV++GN62OLyNucWbjQG4dL0XB001Qks+DK7KHXamW9uMiLzHXI0mt65peO738aomxhNgOoTis3RZZLUO2wDosh23buELIbeXvQk1RhqiLPvwaaM8iFmsiJ3xPrwyPZmROLyaD2eEmaod2NmbWLfAtPET4S238H7yznRLplKTmmlHEVSrdC28yYLumBI7geIdD6wJd6g6UUyYM8g9nuoP6wWt1F2ep4PziKiupo7H0NsRC++2RT2GvWk50BVa4f5mB4mfyA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HRq8INiDgRBuyvsKyY/3oDUSgQTg/bu/b2iFhBqVD1FB0IgdCYu74fqjeAD8GjiMEJqb6VF/1UFfsklUTaLPUbwVYgKR45mW8W0WwCtJadkHBoSziUN6FJC5Vh3kw7yCEDwrdZgjeCE61hqq5kIvRv4oeBMStMYRFtDeg7PBYB6XQUfLSOD7QoRh2b4kqPJCiOBybCgDanBj9pb17LF6sO7/KbxhpsMNNYwW4UIBBkilHYh+Wx5s6BL9cRR33/Xoec4LoMvQhnu2O0s0pMy794BKNivODjIqx/saStMVmKeBPzH/CxO+hKOEXviJyrDnrLoPvPNjNagUFuNuKAu6c09obw2tsAUFincX7+GpYeTkO+kagCR/epmi+MvHsmrQadgvcGzopXZ/19jcgv4bXa5BEi6OM8eGcomL2FfJ98bjWnvb7pyuc2vl6a6YInff14/CKrF2EkZlAm8lGjKxCKLxGzy9ZCL1X8TZZz5jXa7K/glQz3ddVQ5Gfodqa4QIWVvJk8FP5aenM1TP945PrTFu5dKXvM9TIrks0thV/aiRPjWwOPh0N+sFvIfBk9fXsJXLhH6T/FEogZeyn284ZiGQuM1aDoB2RVn3Fpr6deRAGqr19m6PdHuhBjhvWWUynx+l9vdryBQb/iNX2lJ3Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t0zTlcwvLPvNYtjZzQ03YUBpgdMf9R5sFT8m9WK9rzfCeCY8/XepRTUMiQL9?=
 =?us-ascii?Q?bE8vhJ1s7CAxQ5ocvdejvBBpd1UdIQ2GDttAapJwa1vwiDf7cFWY0qzK+IVL?=
 =?us-ascii?Q?xDhC0zis6En+qC+OndruRbQktc9THBDcNGJWmfoeslUHrCqiMbm98wpDzSic?=
 =?us-ascii?Q?PqXPUdLB0X++ktHz13fhS310hYWuQDfs1lS8AgJiX6Ilo73SCvti4QNatpTr?=
 =?us-ascii?Q?R/jZBJSUrcnhyDDAFS0UDiYyMvoZz25mbz8efNcf/sv/in6KewPZdAaGTJnq?=
 =?us-ascii?Q?4qYn+Ikf4WggAb7lk/xSh4nff43wAX/lQ2+UUBEAyYrT+yA+kLGaWOwlQv5B?=
 =?us-ascii?Q?CNUfKnaixTWpBXAhXrJAlSDTtsVRdMrO34DAjp05JieYpkDREdcWyjoEcAov?=
 =?us-ascii?Q?m1ZKxu9bPuHdYSFiqzFZAAzZ0dcKXdI+xamCAqReYyPz9DwpL0qvKbz5wXOO?=
 =?us-ascii?Q?/X6GIVJ51X5jtQyllmR9lkZkrt3dMwrLl2uwF5rC2DjAi9y44xIopqRDc1I5?=
 =?us-ascii?Q?EfVNZAnimD/MamMwXV7xbVM144bfaiEPlyX2SIaIccXswE6tFcPHV5jdcuGf?=
 =?us-ascii?Q?hGo+/A0c1Kky3sL3/AZ1OBC6igJ/y4q2M+4Ji7xmDHuEIIhiaEtwloZ8rGJn?=
 =?us-ascii?Q?iFyeoZBhhAQObsb7++ej74dklHXS2eVACXTHzipXWrt7ixGKwPV6i1v//LLn?=
 =?us-ascii?Q?yqHqYtAJccXMJrOlK3SkoRT9p0xkJcckVX4dAMeCRrZOu2IR2h6cAVjkl532?=
 =?us-ascii?Q?tu8eB2SjvL3ebdJyUpd7XaX1/XYzCRsaYxovpbI/kY/fjF8MLLs2L0h08G8m?=
 =?us-ascii?Q?HSS6C7uUWh4rXXXCZ1DC5M+SVXM+QH5uuLZ/UFrh7vooM7iQIl6Z0uodiHwR?=
 =?us-ascii?Q?tNxKv1dGSSmBmtS4ZZG6VUIAMBJj4HzzrxHPQqzqYX3KBM0hLbcRDeISc2NZ?=
 =?us-ascii?Q?8Y8fpwAGRlxrJz80OEJX32NSKBQCZnhzHdVSpeq2qMqaJCbVHIRpKTtHYRMr?=
 =?us-ascii?Q?TeLiGsHd4E6s88hWKmfuhDAtj2t3mXv3jF4vKKq/BY4rnmWzFV46HLlwLIq7?=
 =?us-ascii?Q?yFjQHqtYt7eYJQKPQ2zntLpdyLQgs+luqB3kTDDLMobvVMjIxyOorSYxI9Mo?=
 =?us-ascii?Q?tJdSu9PLc++yNnI1pjy4kotufUVAGzBFLQp0CHBw2jmV5WF1mEiP5qj1Z6r2?=
 =?us-ascii?Q?xryj4l8d85mBbHqjHU7zdatgqXqjv+SknKW08wD3x9/1Qq7hzYsjxWD/9QY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 571a5363-1767-42cc-5046-08db48eb55f3
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 19:53:00.4427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2P221MB1085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSl2VKodKkImqyN5FaFUYinH5RVQ0UMNg7DDfYoZD+c=;
 b=kIwfgSk06psECNpoR2pOZJWpayl/z6XjnXGXpUZMA15C+PvO4EKbKb6IJP7J+pc4VruvF82oamOYwOGJxvpm0m3dGAsWt9GdjRjNeBsgCJHSELrIX5xdefpT+xW0eWiRLAembEvA5nJWuV4uHje3XQfp5q3seZLkEBd78YspMRU2kSLEjSWM3YfjeiANQlbwAHTFTNC3+NzPTtKCdary6pS41bGZTKydgHNPtg143hJDon80ctK9ioaqWJ+CYuh3WwskmyRTJt87oqPXxXvKrRRix3+WbOBwyFDg03ypcNC75WYOXb/h6j5WLUZ3gOvn8E9YsxlxaPrV9577/St/9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=kIwfgSk0
Subject: [Buildroot] [RFC PATCH] package/google-material-design-icons: drop
 package
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

Newer versions of Google's Material Design icon package are structured
differently, making a version bump no so trivial. While work can be done
to support this, considering this package is using v2.2.3 and the most
recent version is v4.0, it is most likely that this package is not being
used. Environments which desire Material icons/fonts/etc. will most
likely achieve better results be managing their own custom package to
have an explicit selection/filter of design styles (e.g. standard,
Android, etc.), variants (basic, outlined, rounds, etc.), display
resolutions and scale selection desired.

Signed-off-by: James Knight <james.d.knight@live.com>
---
This package (v2.2.3) was added sometime ago, to be a helpful for board
builds that could easily install Material icons under `/usr/share` to
be used by applications/web services (if configured for it). The
original (external) project this was designed for was prototype-only,
and is no longer used. I'm not sure that there is any value into
maintaining this package in Buildroot since I suspect no other projects
use it (mainly since it's two major releases behind and no one has
requested a newer version).

If this change were to be applied, I'd assume we'd also need a legacy
configuration option and update DEVELOPERS; figured I'd do an RFC on
this, just in case if anyone else has opinions on dropping this.
---
 package/Config.in                             |  1 -
 .../google-material-design-icons/Config.in    | 40 ------------
 .../google-material-design-icons.hash         |  3 -
 .../google-material-design-icons.mk           | 61 -------------------
 4 files changed, 105 deletions(-)
 delete mode 100644 package/google-material-design-icons/Config.in
 delete mode 100644 package/google-material-design-icons/google-material-design-icons.hash
 delete mode 100644 package/google-material-design-icons/google-material-design-icons.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01af363936edc8a0a8dd2450c458a38ae..696e9712e859682a09cf19bbe734df943d2307fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,7 +271,6 @@ comment "Fonts"
 
 comment "Icons"
 	source "package/adwaita-icon-theme/Config.in"
-	source "package/google-material-design-icons/Config.in"
 	source "package/hicolor-icon-theme/Config.in"
 
 comment "Sounds"
diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
deleted file mode 100644
index 775f258f277e8a5d6beab729096a421449a5da27..0000000000000000000000000000000000000000
--- a/package/google-material-design-icons/Config.in
+++ /dev/null
@@ -1,40 +0,0 @@
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
-	bool "google-material-design-icons"
-	help
-	  Material design icons are the official icon set from Google
-	  that are designed under the material design guidelines.
-
-	  https://github.com/google/material-design-icons
-
-if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
-	bool "Install PNG icons"
-	help
-	  Use PNG icon types.
-
-	  The default. Traditional format; simplicity and compatibility.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG
-	bool "Install SVG icons"
-	help
-	  Use SVG icon types.
-
-	  Vector format that is limitlessly scalable.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT
-	bool "Install TrueType font"
-	help
-	  Install the Material TrueType font (ttf) on the target system.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
-	bool "Install CSS sprites"
-	help
-	  Install CSS (PNG) spritesheets.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
-	bool "Install SVG sprites"
-	help
-	  Install SVG spritesheets.
-
-endif
diff --git a/package/google-material-design-icons/google-material-design-icons.hash b/package/google-material-design-icons/google-material-design-icons.hash
deleted file mode 100644
index 535eca8100447f100cad67af04c188b1af05e469..0000000000000000000000000000000000000000
--- a/package/google-material-design-icons/google-material-design-icons.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  769547061a51f81623bf5174767c08fc587fd6946339592fbd6cd0dd45f56b4c  2.2.3.tar.gz
-sha256  8ae9438818c26e4873b91d8c6ad620526c011e27e125677f13031eda903f007c  LICENSE
diff --git a/package/google-material-design-icons/google-material-design-icons.mk b/package/google-material-design-icons/google-material-design-icons.mk
deleted file mode 100644
index d410a45e303621aa525ef966f902dd2c4c5da2c8..0000000000000000000000000000000000000000
--- a/package/google-material-design-icons/google-material-design-icons.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# google-material-design-icons
-#
-################################################################################
-
-GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.2.3
-GOOGLE_MATERIAL_DESIGN_ICONS_SOURCE = \
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_VERSION).tar.gz
-GOOGLE_MATERIAL_DESIGN_ICONS_SITE = \
-	https://github.com/google/material-design-icons/archive
-GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE = CC-BY-4.0
-GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE_FILES = LICENSE
-
-GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
-	action alert av communication content device editor file \
-	hardware image maps navigation notification places social toggle
-
-ifneq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG)$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),)
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES
-	$(foreach family,$(GOOGLE_MATERIAL_DESIGN_ICONS_LIST),\
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$(family) \
-			|| exit 1; \
-		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG), \
-			$(INSTALL) -D -m 0644 $(@D)/$(family)/1x_web/*.png \
-				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
-		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG), \
-			$(INSTALL) -D -m 0644 $(@D)/$(family)/svg/production/*.svg \
-				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
-	)
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT),y)
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT
-	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
-		$(TARGET_DIR)/usr/share/fonts/google-material/MaterialIcons-Regular.ttf \
-		|| exit 1
-endef
-endif
-
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
-	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS), \
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/css-sprite \
-			|| exit 1; \
-		$(INSTALL) -D -m 0644 $(@D)/sprites/css-sprite/* \
-			$(TARGET_DIR)/usr/share/google-material/css-sprite || exit 1)
-	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG), \
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/svg-sprite \
-			|| exit 1; \
-		$(INSTALL) -D -m 0644 $(@D)/sprites/svg-sprite/* \
-			$(TARGET_DIR)/usr/share/google-material/svg-sprite || exit 1)
-endef
-
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_TARGET_CMDS
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT)
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES)
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES)
-endef
-
-$(eval $(generic-package))
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
