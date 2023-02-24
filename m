Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3521C677F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5A641863;
	Fri, 24 Feb 2023 08:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5A641863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77v5oB_aut3y; Fri, 24 Feb 2023 08:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C4341830;
	Fri, 24 Feb 2023 08:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C4341830
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182861BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5F64404D1
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5F64404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6tYZxOEgVd7 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:43:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE27D400C4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE27D400C4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YINsmfoOmgaGXgVOW/yQ/f8CUFogzKxSoIztFJ7b9377TvAUV6dz0zdcTdvskQicY0/J14/zuF2aoEn7Moq0jwW901UZXaXXjky4GxTDcNIAPaxEFXgLI7IHXzxhIEX7CrDto1YUF/eKf6gQbw66fUuJrRZySjYvVtiae3P8YPa9mJsy734zKkjN/fDT973pAa1fS+ZYMsVSQiOVC7z3R8Y/1yB4fYYv1zHUgejZphfi8fB9mgv2lm3zkbaKNXl7yCqVfqwvPw/o93xGRdwZz/rRGu5NJVvj/XhglmSfmOaWlwXhj1L4p4wkyMZLIK0dEB3M1Chu6v3E3ICmsJTMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMcCz+hrClCTYR0c3NWUYVOfXjuDSHD29uAQ11BFS/c=;
 b=ATFhY1Gm2rEQatcvKg4lLEzJ3WBSECH3q/9EgFCPcaFpkZcfXEJ/iHrZPeGu4jL268xKFRTkFzvtlNnYQ53vq1x+DsfxgPNQsMgF81QxxrnUD48dcj9YYy5vWpgbETr5n0kf2VyzBKlXL7dMTbXeFYc2nwP++oK51ZRlV/fQO5kB3FgVw3e5we8GI0P5XDINaNLM6ndeozQ4W2a2PU7aykMVejAZ7kmprZHbQ3a+qmxcDOUC/UeMECf2xCPG3taCEqyZDKsB5UVk27kIFla0i5++t44+2PPwOeCWJI7yOeCTiYBYaXCwPRPk9Su6HRB8g2JkyZ8zmDatVKUykPhd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0690.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:42:58 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:42:58 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 4/6] package/cairomm1_14: new package
Thread-Index: AQHZSCsid9nRDvjS6EmKMXiI2emhiw==
Date: Fri, 24 Feb 2023 08:42:58 +0000
Message-ID: <VI1P190MB0493026DD46F9FA5D21023759FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0690:EE_
x-ms-office365-filtering-correlation-id: fffb6b02-75d8-49ab-90ae-08db1643219d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T0MZpgmDK8mIBP/wVOt626FJyc8E9PtRd0Pphcn0hSMqjl/nzRCGt+2YpNVhnS/c0F9/h4PwcPf+sXzx4I+Jz+JqkilpJOGW2C7XO2yUqfF6mIqmc0Ko/dnoX802y/QQ2zGha9hkgMokywqPtKBzys0TvwEKLq/01JoF5fnd0SFzi+HN7iygkL1kEPey0i9JGmwW4wotnIpquXpfZVH3/wGFfmOzF/hC9nOAgQDhRCUp4rbHfGn118DhT0Un7JcSetKqfep1kZ3AwMZb7X2gFMEsQZw0h5mflyXmXjklXzZ/KTey+WD/d8H3cewhqe0yneJRIGJbt6ckfG3Atk/DIDDFT05j1PICuhgkJ4A+qwexVOlU5FHrNDA7BzDhOcEJunTmUvaQgq1QI8YasC+fxWRS/KeDHXFs1sxenzkUnBSZBXXyRL2mt+m/NIV45eD93ljxd4oapHG8Crgl8KGXq1zmh5PfZR2+YeiPyJ/VQb9N6I0sa4zuua/H6fl3RTdY/7VaIjvLOq/8UlISH6PHh+rvXPlQu86t5mtvUhoTAJRISw7iE380cB4JuTPUwQgYEO/KzRRFo7Fhdi3qrxOZVWfxSiXbuVwANvEB1e7Ouv8mtYSNawT0z32blacbkij6SrKew9saB7exQ+gGpZVqPGGMdVVtD6qPxMOL4YYA6+bFy8uoWsAiFUbG3Wl8svKt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(451199018)(9686003)(6506007)(186003)(66446008)(38070700005)(2906002)(55016003)(66476007)(8676002)(66556008)(64756008)(6916009)(38100700002)(4326008)(5660300002)(122000001)(52536014)(8936002)(478600001)(33656002)(76116006)(86362001)(66946007)(83380400001)(316002)(41300700001)(71200400001)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xppSxA7pR1Fe4oU+784rzyyNk9dyz7jt8/jWtO+cg/g67LslAtcOUkGaDl?=
 =?iso-8859-1?Q?FMnyivtN+LeXyTiPxUvY2pKUeUdgj//nbJ79pnQn0bBw4o+SvbCERwJZfG?=
 =?iso-8859-1?Q?iFb1vF7poLvqKf/iw6RHg+uQpCXw8d72dtilN4KY0R3npNFWT3HiN13f7H?=
 =?iso-8859-1?Q?8xC1EcFf33Mp/IwjBymg779v7GsvqPnKdUjp0FbqBbEZ4WNNrtTEXF37am?=
 =?iso-8859-1?Q?Ex3j6Re2LwOD9SsoYKJQyt0VJB8ACCCpgB3XXu6eAhZtmz9b1z8ZKa2h7z?=
 =?iso-8859-1?Q?aXRv4Faq98I1yLSc4uxgMEB4N0Hei1CUp20I6EokK9kf5nnoFTqdlwq41H?=
 =?iso-8859-1?Q?o0D7n0GFFUymkXLd+Z0J8wBOPgaaWBWlULSiQZNgLyqzG+Z7pJYXdWVmqZ?=
 =?iso-8859-1?Q?p5bExbxlrzYkS/7gzyAW1QHAdhAxeq6FSHjKZi4vvcfM3FJjbwNtQLLsZ8?=
 =?iso-8859-1?Q?uMsAIwKn0Nw1QNeUAnj5xIx1mNKJNm0RrWh4w7KC5U9GFjZGUhUkCGb9K+?=
 =?iso-8859-1?Q?AEifreXrUXT30P7jQCqm8tdkDHh4UVwIiL+2ntOkhd7AAL9Xwbvz0GMpil?=
 =?iso-8859-1?Q?ZOfOUeHh6YUtR6Fp+jvhWPNfXzyzbp1j9l+EkZhX/2Gxy5pfomGlLA7Alu?=
 =?iso-8859-1?Q?u5os0xhMaxleX1QwYeJL4iPWodKE4wavvVAnK82jX+Xb/FzsU8J9kTixrw?=
 =?iso-8859-1?Q?xkIohND5hD4BmlMn545G+TOtcjVwOkSYvRMkfUq5hsqZ/rhU0WV5TtSWmh?=
 =?iso-8859-1?Q?FYcm4MPuN8NviUUtcu6Lc5RP2exL4MYS8oJ5D6cTnEWHi+d/c1BnApBRTP?=
 =?iso-8859-1?Q?Srh8p+zfMmH4pW7UDJ9o31udM0/hdRudwT09E6B+JrDJjwkG9X4F94NWIX?=
 =?iso-8859-1?Q?3WG9grHvoM/c7/6DCsMSF6QLb5sHxKmkI+vd0kYawEMP/Cc8zGGT7YXlry?=
 =?iso-8859-1?Q?unSqR0M/3PdYG58TZwC4CRgK6e4EXqIprv0Y8QoDT+pM7LN1/sCo+SujZk?=
 =?iso-8859-1?Q?rg2TmK3HsLf5gG0P+NKTxRdQCTJCR5SaJPse0ZWHeBm5oot39wW7Orjg/e?=
 =?iso-8859-1?Q?kLr53ocUNgkj7DKquSoZ34z1lCUMY0qK+gkHxhqQjnhqbHaUtnMDpn7e5h?=
 =?iso-8859-1?Q?8+TPM11zg5mwg8oy0IKyI68oVwq5X7iK0mT5MPbp6qzyWGHZ8IeTNfxb9p?=
 =?iso-8859-1?Q?vgQtNsDhc9gINZ+YF4w4fBkl6xbBEm1pOO5t7dqLhhvTEdbtnuV5MwPPHY?=
 =?iso-8859-1?Q?yxDPD0e97c2oR18NrPEUuGz7zDsf0e8eT2YsXezuiE8wfcIROf0/He5aZL?=
 =?iso-8859-1?Q?midnW19xMJG8iEhmcZc15M2jAtDtR57VSC4m24nE5OMVLkKXDaafH7dLCI?=
 =?iso-8859-1?Q?8AMbX4cz56WLMqucfqQq2W1smTVzrdUNlZvAeeL1BnawOVIwfFo9iMuKHN?=
 =?iso-8859-1?Q?SBKwIRJuEtw8xw8U7/pevAOvY6cJiAuHW2vE9YI1QPBgi4wBGLA1GnrixF?=
 =?iso-8859-1?Q?a+RvkjMxkdopHnZdJsxmQqscpRIlzhnORzebNy0Ej/a/YBNVsc8het97Ys?=
 =?iso-8859-1?Q?flmWpj+18PeI4QhJEbMLqaCQ1uB1uXbuzwLk08hC5yxACcf6b0FzQ/F43Z?=
 =?iso-8859-1?Q?IauMmU7Asb1tBuYToMUy++vlSRnDz0+peJAwFYi3SEHLrdsa+mSXsLW1c/?=
 =?iso-8859-1?Q?siRLlWbzoFgG73MZ9QU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fffb6b02-75d8-49ab-90ae-08db1643219d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:42:58.5026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP5g8jz3kcMhgv6p5U9xDgaDkp38mFRLtyqOh4gbhy3+DsZei7dPlxLPs0SnSURymu90eI8PMdvDj2KWwT3YEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMcCz+hrClCTYR0c3NWUYVOfXjuDSHD29uAQ11BFS/c=;
 b=Euf9zutx0SJacjsF7MSnT/RYeS8Otyacvir+fV+ckpup1cpbeZizosZcyqYLBEHYUWGtCO7s4VHZ6n1yz8gMiqU3IqbPNvNWcewTMNd/feP85WnxYIaZDsf9NAxjvvHAL1YFVs1gK/+tTGvoNOCOA7g8blNn+OAYDnPuP7TsU4o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Euf9zutx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 4/6] package/cairomm1_14: new package
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

This is the version needed by gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                           |  2 ++
 package/Config.in                    |  1 +
 package/cairomm/Config.in            |  2 +-
 package/cairomm1_14/Config.in        | 22 ++++++++++++++++++++++
 package/cairomm1_14/cairomm1_14.hash |  3 +++
 package/cairomm1_14/cairomm1_14.mk   | 16 ++++++++++++++++
 6 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/cairomm1_14/Config.in
 create mode 100644 package/cairomm1_14/cairomm1_14.hash
 create mode 100644 package/cairomm1_14/cairomm1_14.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1294addea..de36a0cdcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -642,6 +642,8 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/atkmm/
 F:	package/atkmm2_28/
+F:	package/cairomm/
+F:	package/cairomm1_14/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
diff --git a/package/Config.in b/package/Config.in
index 03fcd9096c..e5e9d7f875 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1562,6 +1562,7 @@ menu "Graphics"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
+	source "package/cairomm1_14/Config.in"
 	source "package/chipmunk/Config.in"
 	source "package/exempi/Config.in"
 	source "package/exiv2/Config.in"
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index dae52f01f7..75f6692b8a 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_CAIROMM
-	bool "cairomm"
+	bool "cairomm (latest)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
new file mode 100644
index 0000000000..6e767d2428
--- /dev/null
+++ b/package/cairomm1_14/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CAIROMM1_14
+	bool "cairomm (1.14.x)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC2
+	help
+	  The cairomm package is a set of C++ bindings for Cairo.
+
+	  This is the last version before the API and ABI change
+	  introduced in 1.16.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
new file mode 100644
index 0000000000..521e7cc546
--- /dev/null
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
+sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
new file mode 100644
index 0000000000..5d076ddf0a
--- /dev/null
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cairomm1_14
+#
+################################################################################
+
+CAIROMM1_14_VERSION = 1.14.4
+CAIROMM1_14_LICENSE = LGPL-2.0+
+CAIROMM1_14_LICENSE_FILES = COPYING
+CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
+CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
+CAIROMM1_14_INSTALL_STAGING = YES
+CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
+CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
+
+$(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
