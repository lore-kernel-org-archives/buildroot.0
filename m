Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46B9C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C82610DD;
	Thu, 19 Jan 2023 09:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C82610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQyPSSXu-O-v; Thu, 19 Jan 2023 09:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B640F60A7A;
	Thu, 19 Jan 2023 09:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B640F60A7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 297D81BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03B5341990
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B5341990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KxmKucMZDbO for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:51:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8281E4198E
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8281E4198E
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg6YOiWnH8B60+NxxYwHbNhORrtBvhzpbKdW6qFxfY9cOUCnipBftCBpXfJ/0dDCIU9zJ9SYQRu1iAikaORXCF2GAW0Y/0TKNAsQZOanoVVPyAoLZh4gagHZUxkBY/IwkhtVXz3nWxn/fm2yQePjsRZNFPZuuylTGRfrgk/caHWLT0B6Ep2UriAfGgPjpz1tg/X3SGxKc7QY0fK2puZEHqQAjnUXR2BvefQ/Vt7bSoA6dtPg0hVr2VwpnR2MFbWsBbDDIoYG7CarNrZ68YSbdQhScdrzi/p/YYYcC86T2Ablmz8ENowlVlFtk0uOTi6FfX03FSMvIbwkFmf+VsrQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc+hQb0mAC+7SW1kFK7eTE9VdZwVEydn4igEEy0RpQM=;
 b=LzEDfD6076yatZ73Prwx4V9f64GLCJ8mMsuMsbs1qOm5bNfXvqnVC/vCiCPWMXQKqALoYNmVXMNAl15Wl0DRkDBWIMsfWBVrSBLmEt8KGSsPNRwzLpBoOutSeWuCud8FqGt4fV1Eq0iSXdGm4mRG5ZBF/p+t/AVJVzG4lSYATOH7FxTTCC8EdGX42MYp8w9Q8ZJQlQ0LQ1kRP0K11SONL0LfHbCxBznFxBdAUl67U3cVJNQh54W3caqif1g7j5Kyix0CBORMsiedLL+TPkd3YBajxqJb8m1W63CALLIzwC/hOat6nXH/mL0kut9wslLd/Tpkpy9pcnsB4Q7TMohhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0937.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 09:51:48 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:51:48 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 05/45] package/gconf: switch to https download
Thread-Index: AQHZK+o8o78CctncUkyIIT9meZEVqQ==
Date: Thu, 19 Jan 2023 09:51:48 +0000
Message-ID: <VI1P190MB0493B5B2453CCF631F1BD6C69FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0937:EE_
x-ms-office365-filtering-correlation-id: 4eaa1da5-bf4b-4eea-2217-08dafa02c842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qr1hFju5zFk5qAUNicZmo77BmH83JobKxMuX9iT422yAtE98HtNZsSnvp+LEcwrJSW+q0bc8Ikat1lU6PMYqkhcO06JOgYA6J604REz0awetXT6gPvJU7LyVSBhqADFtBYh21fl5BG2tc3WekUmzkr31ELhqOr8lMpQrILUWMun2wpwTnFjfsSEp/+dFmGG/3cwPaIFosmDR3ViG6SgPG+ybEOjzGLB9NMz+ZRBDU3tujeSlZj6EcPYYsHq51cka8dq9n910ZoHONXk4+shNrlpTS9IV9sqqiYyxz0zaulrScBOtrtou0UePDxDSoA5xF1j6OZSZRvUY1w4Zl+tUSm3lPiC7RJ7n/od1/z0X0pZVKEcjl+Hmwl8Pdip4gUYWGKohFAtlh7gUnEAoElbZSsdXxdQ8udQSvVGObsVLfr32WKDjxOpYkQrG8Cnms6769/LETLzlPanYChTqzRSTbJll1KexKfNtXLk8EwYpxfavkptyFdLSNJ13/Jrp8WJPmf9n30i7aPpZ/CcdSnLXGBYLk7WUv0vWOSIzFpuJvLKj2q2u3wlEimW5AuXiznF3Oi8lP4io33l3mcAIMNfZSXQXd3LLITxaZyPHA2XKptiR7XzMVYZ/qXYQ6KKdLC2PXcTuLPI/u71L9ElNt+xq+myLJSVRbIB42qmMk9SOh7BvHRoUsEAx+OwqGrGhUGqnbZsrX2S4vHAXGYD6xiW8KIHUPJXmsZ41NSvzhZLdXr0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(38100700002)(122000001)(76116006)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(4326008)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Bdp0wLKgkpdGou/Ux3Dz05sMTektk1F6dIhQW+SdJG/P/c7ZucdcEcGfzy?=
 =?iso-8859-1?Q?rIafziR7DMdfoKrFkp3goRD6X6OT0RDd3NW9U3fuf+cuzU8903Bd2FpGqi?=
 =?iso-8859-1?Q?8ajJ1DpOFqoks9UzrTjXfc1r5/jNnI3q93uuBSKrDv17okiHh28fsOgUuP?=
 =?iso-8859-1?Q?AX2bNhm0xaPt4/K54h+lTVvappLQLaepzOZIxa27udc0g4H+PqwGT9Jssn?=
 =?iso-8859-1?Q?KVPY8ciXceJGXukpFseTPKIO6b/ag9HXoM/ORDHBlur7ot7Vz48u1uTYpl?=
 =?iso-8859-1?Q?U/O1pR+phEdsNe0KQFtqfsyr+bv2xP8d9H8Nz67/WLlOJeRpmxQ2smoGJP?=
 =?iso-8859-1?Q?M46f8k4zO66DwZwIQmaUK7i0QPariOcc+/CMy8M6ErxQSscCc3vWjrIq7R?=
 =?iso-8859-1?Q?rlhXF8kcDWYJ79vi369EdFtkjvcv+sde/A3eiZBEnzrsbuEnvQCSQBFiww?=
 =?iso-8859-1?Q?aBCuUU6sySZNhjDbiPyVq05gaVmw9CXfauDUsDrQKQRZgphOR2x2Mey4pf?=
 =?iso-8859-1?Q?U1uiKqdq2jE72T0JZEhLpLQTzQSRgVbESF03HZhOczym/Y+nsFFOg0dSoi?=
 =?iso-8859-1?Q?gueCD3hJpPbc6Tg3Kkbphq0PpKe6Da29oKUjdQbdV6KL9OfyNjcOcQy5A9?=
 =?iso-8859-1?Q?tksoAHrjf+JKXC4yG8HDzJGEmXLCVC+c6tDB7/rBEi3ncMxehfsPJbQNXq?=
 =?iso-8859-1?Q?DsK0a0mVEAlD0gw83Jrhz3XiCletLB3aybGaIuhAiTwJIQUtMVBLQfSZFk?=
 =?iso-8859-1?Q?HWgp8ybUnXfhBvlRF0MDXk+0fTm0TUKhSsDXvijEBWtZPdelAza5x075fc?=
 =?iso-8859-1?Q?8gqWVRvfQjd6fsmfU4AWm2H6VW3uo0D4o+fHyCG+8AThVQujLfVoMoufou?=
 =?iso-8859-1?Q?d4z13EhSzUNlicS2eACgwauNm+Couug59CIkoR0bOFZGgu6AEJEUrXxmp/?=
 =?iso-8859-1?Q?18aNAKOsm2Zj+jM59dGsNxsCj8NZQkQlxXWLEi8ou9W7FIkaHvzSBLLS/0?=
 =?iso-8859-1?Q?vt569ZwemnJwRPmRjHG5W6W75KMsyeSjUJ6zBio4F68z/GrGaIWlxP9HFU?=
 =?iso-8859-1?Q?ydFh2Io6ps2R5tTml1NTVlmWwvFCXwFvQKpjD8hrDEPYIuBtA+OWfIZSOR?=
 =?iso-8859-1?Q?dAvPd3styyonxl3d3XiwgaAAE+kgf3tGHZ1vuEBVPTE+H/+OaHvaIoPaPi?=
 =?iso-8859-1?Q?BwuVh0E2op7WLxlYDAszDhOX3zsEr1r1U8QB9XaVUyQrPT7wgLwno0FpYi?=
 =?iso-8859-1?Q?jxGUzLRCDeMspGDFZUTetCJ9Hc5KNXXfqvcPZPIMEBN1FbxcqniSWgcD0N?=
 =?iso-8859-1?Q?RwwyDYas1ZwbDPd1VuvMorvKN//aizNceJyqTmkDFjrieIL5fFA2INpPur?=
 =?iso-8859-1?Q?dAHeCaCgNnzsDYB6pg8EKOXjaLJyLPwc7yMQwR8VnPl8b1oY37IbJu8GO+?=
 =?iso-8859-1?Q?7nzhPSl4Dx2WV2J/gUYY4MecQDoyiClk+ck8aBrvWHfDpZG9fD3zakTIaK?=
 =?iso-8859-1?Q?etK+acOlN8ygJcMpq8myrZVsganLk14umnvNuOvUrVcMMmnMxNV1F+dV3W?=
 =?iso-8859-1?Q?MlDCekaUuZIJUVKJtr2CWXesbBs4WSFPIYIdfEB01je7YlydTHKC6xG1RC?=
 =?iso-8859-1?Q?pgcH+1SzYFkF8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaa1da5-bf4b-4eea-2217-08dafa02c842
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:51:48.2689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfmFJ1sGeStvvrovyte9aalezRxKCbdBDnDzDWwcwaxHAuBnauTOocdk8Szmz3ueFFmDL96W0Vabq5BSlr2bRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc+hQb0mAC+7SW1kFK7eTE9VdZwVEydn4igEEy0RpQM=;
 b=oTmwynK6gCCk8OvLxjJeFKkF22dy+3MwG9tY5v9O1qv2256U3IZEG7x01FTAF4psHog+Rh/RlKX4o+ffJQZAKtcEmoQpVAq3WgRV+42tqQDh4uoAeQZzmFL+4uOgnJTk/VLZGVrUJZq6mZU7DOhfWm+3bhcMcFTapusLeLj2p7c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=oTmwynK6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 05/45] package/gconf: switch to https download
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gconf/gconf.hash | 2 +-
 package/gconf/gconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
index 56d754a69e..ad0064fa99 100644
--- a/package/gconf/gconf.hash
+++ b/package/gconf/gconf.hash
@@ -1,4 +1,4 @@
-# http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
+# From https://download.gnome.org/sources/GConf/3.2/GConf-3.2.6.sha256sum
 sha256  1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
 # License files, locally calculated
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
index c468d1433c..b84fa96082 100644
--- a/package/gconf/gconf.mk
+++ b/package/gconf/gconf.mk
@@ -6,7 +6,7 @@
 
 GCONF_VERSION = 3.2.6
 GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
-GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
+GCONF_SITE = https://download.gnome.org/sources/GConf/3.2
 GCONF_CONF_OPTS = --disable-orbit
 GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
 	host-intltool $(TARGET_NLS_DEPENDENCIES)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
