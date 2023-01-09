Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10059C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 12:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37AC817C3;
	Mon,  9 Jan 2023 12:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37AC817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaUTyc0CiBuE; Mon,  9 Jan 2023 12:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96C281379;
	Mon,  9 Jan 2023 12:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96C281379
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE9DF1BF21A
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8AE440643
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8AE440643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIVj91nV-PZl for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 12:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1344400CC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2044.outbound.protection.outlook.com [40.107.15.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1344400CC
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 12:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuRQf730YsR/yMOnbrgOnw6448IyKTxxKOGO2fV5yp1o1nKsMzNjnPW3X9QnK2ioKQ++vBsmkF3qTcmucKDjk/QZ3YjCfTQQGcmtT2FvqdPtX5iNc8B8a8A5KuCaY4M0Ud0OI/KGajxt+IIMdUcIBZwpV3Gb7x995UXLOATD7qOO0LrFfx27HvXqCwwx3M6b7ZyyQ/0pUUO9JGocyA3JNZqr4RVIRndBvDmom3+eZXO5QxEZVEwWV5HLqt3T49PspHguW6Rcl2V6zrqcLtHsHfvcrKJkzJ8/q080Hu7rFXBJj49ww7AnQa4B8UNKlRPR8Qg0v+Ma1mLhoFUMIJLiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywM1VfFAoZrTQRs8lzXLhmqYSptpHyeAWR2N7D8PUVw=;
 b=JHlKQaxDyCyCGeZPp5Q2WEMCA5o0ylXrkXD4Sr3bXBp0tJMvtHIUDNZ0k1df98gYsVhJ7bpmLTgSIAGnRSXYcxSuO+KncobzuKLBU8ShJ6MgWZzseTUSbdkPtI6h+/JIO+EiwS3pk20T1H2EBBbNOBp8gC1PR+2QGDzB5krM1+canzjeXOrc0hgW9K8p1N9jKW4HYokrHUTSJxizpyVx/cFCS6w0vBpDh8uwtfYN1Rxki+YeOmyk6MK7RWeZOUaAsUiQDI5S7anG8RoMHl8Ka4+zT82jItvoCPzyLhoVxV1HRFm+5l1gabpNkLWoB4ZWo1C3xK1ouGY/V/YopS/plg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1795.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:58:56 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:58:56 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/4] package/at-spi2-core: bump to version 2.47.1
Thread-Index: AQHZJCmL0mrO1mQ1NEufHtxqhEQNCg==
Date: Mon, 9 Jan 2023 12:58:56 +0000
Message-ID: <VI1P190MB04938E23C08DEF84242A4D379FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1795:EE_
x-ms-office365-filtering-correlation-id: ebee4490-b39c-4afa-47c8-08daf24144d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9TkgFooxs7D3UiMkgtr9r38C9Q202trkfKM0WB4dPXKU8+T/ShtZ3rimDpHVYozKQnG7kyDBBp47vhJfz6DCodqZTPyuAoT5Xjk/lUhNpyMBrNwMchzhH/EZCzfND6K19qBhHSiYZN0yV8jJCRWOR5lIsz/rfwmQrKlGthTifKCNuYWY4SO2ij9meGV62bBOzfK/9Dz7ARHuM4zTsnucwSWV2dex3geNqqp7VeAjAFcg/FVWrq5YyNnNc3hP3dccK8AB0uFCTU6qQdJ+CTlpORWlRyubiw/z9m4KF9wWJE25mDH7KeMZWLHxlLzuYNNR4CvMG2S37SJz9eFLMTFEscUr31A5zRRGhufd19v7rSCKip/jxMhb6pnV9ywWVKAMC+VfvMrnPAnkwXN6KK2mOy58ZtlSP8xUtMShnbbFsQr9pBYIxz/KUpg1JBnMJG3LPx8toe1/sEzMEa5iOKlrEz0pkV7AmPQVts46eih/0RzfBd6gK/jfZtum+6lr1P7FA9hfNgvTqp2G51TSWBanFgp4DYZ037B3gcCcon50i6m94u2HUOX/MldfVRQy97fPTj041IjQyRXNveD1eOyzhVDUFOEMMg4vRS784xYoVL26sn5c/A7DPtwclAc0lEf1aFjwD8Ng5/AlioVLSsAJdGtfuLRfbLeZ3CkC17vzmqp99oJ1hxIvmW4UB+V3IgmSN2CIkaI0LwwoB+SVmfKwhW/sFNJ2Flp2OoZTVOufMM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(451199015)(5660300002)(8936002)(52536014)(41300700001)(6916009)(2906002)(83380400001)(38070700005)(66556008)(66476007)(76116006)(66946007)(8676002)(66446008)(64756008)(4326008)(316002)(33656002)(71200400001)(7696005)(26005)(9686003)(186003)(478600001)(966005)(6506007)(86362001)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B969wAtOq/R1djNHPP4py4TICUBvcGA4NzmBE0glIfKyHNa7DWDPzYCN7f?=
 =?iso-8859-1?Q?I/MhkMnCK1GrHD7E6wHYYOGOwT4buVNKeO/I8BWSVgB15IKOKDzr0wseeL?=
 =?iso-8859-1?Q?agck1S+wGFnh9PhFdKdJHe0Z1CJJZt7RpFkA0yKCvkH48oUAj7QrTmlUW8?=
 =?iso-8859-1?Q?E8ebf3fyDKwWqSqzLU3mFixAO5MRZazxZYLgHKxjOWLwKPnPItNFNi8bVq?=
 =?iso-8859-1?Q?3Z4scELMOvIuviu5RG9zgQH8lN6ocqZYF9GIGuLh440ZrX4MbYnZRtdyoL?=
 =?iso-8859-1?Q?oBO4mUOwM9hEbn4fFHYAOCGy1DTnfLFYEQRBu9nOTwB2SgCT+G/kIlICIP?=
 =?iso-8859-1?Q?iFUJ2MkH/U2YoI08qOMp4otX6dBlnUkS73zsUDdfvyg9q1IcdWiSeA48mS?=
 =?iso-8859-1?Q?1DeYY6c0LS1RMsMkVXeDVd3VrPFppDOuAven3mERHroNCG/XOILu7j+GWZ?=
 =?iso-8859-1?Q?QGJpgFn0oUFHliWNlT/+QgkEEWYPT0sNvek0PpVfSCWVinZuiVdotPLDwM?=
 =?iso-8859-1?Q?Q7Q01zn9WllO2c6G7m8qv8zGCy1K4aoxky4dbcqvSe+VGYZOi9UYfi8fQi?=
 =?iso-8859-1?Q?AXW4/fPgY556RElD0LBwvhYFeWrPE/JRs5ELI1k/gVDKEtdKdr9aaEF6Zf?=
 =?iso-8859-1?Q?ZJ686cBQ9yDiub1tld3RdYI3d+o+nW4qQhWqLbS9VSHWIgt/GqnbK2elb7?=
 =?iso-8859-1?Q?SyzYEyGXLzxGBaq4qY0zDGk9yJdKHS4DMaIDFM1yaazUCFiZVgszA/oVyT?=
 =?iso-8859-1?Q?T9u0zDQrqvRJvdYDH3jNF8iN2g+sIXPRmsm90LOtAjIBtx5+KMAOWerpQ2?=
 =?iso-8859-1?Q?TkJggCUEB+u7L04mtWUq8xo2nlmQO+Rl4kpcF/Bp44rRTTI2V2KSEeVUq7?=
 =?iso-8859-1?Q?+VZt+8D5BCVPzgYIwpsypgGe3M+KioKh4CW2s9imqbRzEkFhkyWBu6L5C0?=
 =?iso-8859-1?Q?Lb9JY46cUcJlUSGKH/B9spSrAAKq+FSXuyXTBuYDUGxUlU3jrCPQzlbfXj?=
 =?iso-8859-1?Q?6Wrf5Uu8Fbv9mOTs1TZga21lgJld4KPSFGcSxnlENoafvevMxxTggpXZbH?=
 =?iso-8859-1?Q?KqmDR0raiCHvk8+Kvtjc9zIMLuGyimGeWf4xPXLliEKGS9hqi+HYqwvhyG?=
 =?iso-8859-1?Q?cI9muijeqBTAizBsZx4qyiBebuumuooS0bgCbJy9iOt1TmRUAMqbqWObFj?=
 =?iso-8859-1?Q?H/d1gbRgoDn/zNireltOVI36nNI5nfTiroZb4y012XOPfWRl5bjTVNWuv9?=
 =?iso-8859-1?Q?+soO4mvINsvYt2Y0+XUlEd5ZxJK9IHCHJIFl65Y4Sn7AB0fZlUZKznaMw2?=
 =?iso-8859-1?Q?Nz+OZ6gNNDZrgddnyPnY9CPq2ysGkxM3VIPvrqiBn6A/l/BfbKv3aTpUyh?=
 =?iso-8859-1?Q?mw5BzyNjkK0qFS0cWriGRPnlNPJyBkw8dvWi3SdqUCC8GajQ8OxSL3T2N2?=
 =?iso-8859-1?Q?FrlgIoz8b26dLI/6ds5+eKmJPjj9PgmWsdcP58O9Z2WjUA0H0X00XbtJ2m?=
 =?iso-8859-1?Q?pKK3L4I0EOQ7fLcm1enHrpXQIwnDLPmCIjqltEUVuF7sWZVykPhXtdUIPy?=
 =?iso-8859-1?Q?JaMjKcWtwnb/OHqZ56iohsLqEs8bxhlKb9vG1d47W//FpL2d4FGBCehMuj?=
 =?iso-8859-1?Q?1JSVliCgqfcGM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ebee4490-b39c-4afa-47c8-08daf24144d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 12:58:56.7345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPAkfCFG00qsS0ffQo3bNFsmy7ZT/DmaLVFs1KjDTBARew4SlAIvRhngWTfivFbIcW8vyoTrVdSJFYBIIj57Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywM1VfFAoZrTQRs8lzXLhmqYSptpHyeAWR2N7D8PUVw=;
 b=vv9/XDY+er48eQ1Yp752JYvnwae+4taUEnWUpp84KrF70uAFuPuZ6n6R0iEM7XouAq5NNfNshqWc7tjlAXqaRgov5GkpDOXqNCmpUNXmyUlkKjiva+1gu8jkm4FMAAchRFiPXE8XmrAK31kNKo7vg7blo1iOxWo86oQSv2k984Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=vv9/XDY+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/4] package/at-spi2-core: bump to version 2.47.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_47_1/NEWS

- X11 is now optional.
- libxml2 is no longer optional.
- atk and at-spi2-atk have been merged into at-spi2-core.
- atk introspection option added.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/at-spi2-core/Config.in         |  8 ++------
 package/at-spi2-core/at-spi2-core.hash |  4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 20 +++++++++++++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
index f56c5b93c4..1f6c421777 100644
--- a/package/at-spi2-core/Config.in
+++ b/package/at-spi2-core/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_AT_SPI2_CORE
 	bool "at-spi2-core"
-	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7 # optionally for X11
 	help
 	  The At-Spi2 Core package is a part of the GNOME
 	  Accessibility Project. It provides a Service Provider
@@ -19,7 +19,3 @@ config BR2_PACKAGE_AT_SPI2_CORE
 comment "at-spi2-core needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-core depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 764e4c3661..4531bf396c 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
-sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.47/at-spi2-core-2.47.1.sha256sum
+sha256  c6ba7c160434edebf09d2936933569c936f6ec972301766f2bdac5a4d418153c  at-spi2-core-2.47.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index f0b019c0ed..e98e779884 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,17 +4,31 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.36
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.47
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 libxml2 \
 	$(TARGET_NLS_DEPENDENCIES)
 AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+AT_SPI2_CORE_CONF_OPTS += -Dx11=enabled
+AT_SPI2_CORE_DEPENDENCIES += xlib_libXtst
+else
+AT_SPI2_CORE_CONF_OPTS += -Dx11=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=enabled
+AT_SPI2_CORE_DEPENDENCIES += gobject-introspection
+else
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
+endif
+
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
