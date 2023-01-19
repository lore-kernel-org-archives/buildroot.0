Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA8AC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9E2402EF;
	Thu, 19 Jan 2023 10:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E9E2402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeSMrl8ndPIE; Thu, 19 Jan 2023 10:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E63CB402B3;
	Thu, 19 Jan 2023 10:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63CB402B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D8AD1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B07460A68
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B07460A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMOj4_9__kXv for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 106DA60644
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 106DA60644
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:03:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4d18jSyV4jNnMN8tU/C/dFqku/bzkyKYc+GvGSggq8k4uUgdY/iKU77I2Q5dqSxCNA6bFDX5e6p9r3tD8XZUEHhlJNZJH7deE/i3vOn1WpqOdiL+pG+pT4bCI85jN4d1kGu7jnPxsODo+sSK/Hq5W7MLYyLHrwVzxqe+WyR3vGt5eiYaF73JN/YM/MZMZU8BzElT7k2DXS1JrtibV0lDa3trlYirJKUBf/raHCoqdF9qQzorEs9OPU8YB7HjnuYupeheRxdLInnfMmVVPTHnP0AAlZ8dv8BqCQlz82tf/e6Aq8/8SmT/JRUpM2nHToodO53dXAFex2uHuxOaSmVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eYu/dDGw6GLHTJ+R0fEQjf0TNFbufUkxFbM6qfyZd0=;
 b=JT+A5+qmdlkEck2lleOGdDsRvMnqT1fNQJj8i/9H+GAgIquGM+XKvKjgrM86auUDU6dNVzoVuV+V+MqJ+UHtOON6Li2n36Dha4Hlokd9LrbJkrSBBo21LO4rr5Hy54pzMthLRsQNTfO5C/4LQnecKCSBJb/kQZ1slJb0JoYMji73fC509D4r5NG4QTedveCYIKBGnqjhl0GN/XGYBA3lhXvV6XxxVu5NHswazwx1JzWpQfazEzajBYs/v7RDfpcN39qRoKUHUQHMFh5RMQ7dJ8U3rdwxbNngCXYq4HvG5XyHKmnv73DjqvjnQuk5Vf8Mc1jzY+ldNrjnRz51befHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1111.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:03:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:03:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 19/45] package/gupnp: switch to https download
Thread-Index: AQHZK+u4kjAd+d0ujEe4FeeYNvvFNw==
Date: Thu, 19 Jan 2023 10:03:32 +0000
Message-ID: <VI1P190MB04939751DA701B6E066C32C89FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1111:EE_
x-ms-office365-filtering-correlation-id: 324561e9-5596-4580-c464-08dafa046c13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 60HudqU55IQuxIhHsY0jITpcdjkpb5UhVFOWqZw+zpwHtC5VvNGdoeFTDQ8n0UJMqlE6UHChRxOAuWWMp7xU3NAhQqHoVx9iMSfHFR38PDV/whS1S9eWo+YKH19B3EltmaoF0Fe8Uq8owK96Vi+Fl6WVeStCmk0o13KZZqzPfjphJStz3DZcted+iOufidZvFlmXFzv6D/Tb/32eImrp+3bERurOZ/r4YeLnN9rnPSPzYRuq5WvkYfUhirwSG/wxJYLP6xALqAXBGtTRpRtIwAM2RBPX0aQ+ZTvTPLWGfYiuOmgGq+R68bkTrsdf1uqhaJbwpb27YMna86U7n9wO6DHxjUfapvSUXZluMV/GRF41/YhTrsCHJKW638hDn2+ezd6kDrG0SW/VMudLm5iF1jfqws69fR2O8sGMpMjZEJFPyZOk3X/O3c38oQFY3siQ0tjXdB8kiG0ENMhARde7A4L3BIDW/ubpdt0bFRPdy//4G/T0i9Gc3714O8M0xdTwF4j7c5PmnDVfG6BnNDx3NcHo5ygb4Mkv4lUfhIpj2NH9wevEMiWxNp2KMjfygixdmXO+5OGroSxwBCr8uTipDz4ncgDBpAigikpgBD3EAvwyowp25t21DLtiQkCsqoYwkLV2I4wAvaS9ImYLnekZlEdEebHEtNVsvxioJw/w1MIz+HoN08CQG5D6iwKynd+ZqQzA8W7+U5y+Z/wdwdVX0Vdb47qqJmL3w+qPeQI/Onk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(451199015)(83380400001)(52536014)(8936002)(41300700001)(316002)(54906003)(4326008)(6916009)(64756008)(66476007)(76116006)(8676002)(66946007)(66556008)(66446008)(38070700005)(86362001)(55016003)(2906002)(5660300002)(38100700002)(7696005)(71200400001)(6506007)(9686003)(186003)(26005)(966005)(122000001)(478600001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OO/FfWWjbSFkaoktG8RKiyz/HcxoQubYjnQgXwItEsDvDhFxgbIXX7bf9c?=
 =?iso-8859-1?Q?nqBhhnHixW0i9B7yPmMYfZDg+U+G/d94aMW7beI7nDdslyoZm/oKhVmETh?=
 =?iso-8859-1?Q?lR/f7RMHsOj3REr2Z2mtIP2vDXhUZpSF+xZTnTnKIJLnmZQzNAnnoD+CMC?=
 =?iso-8859-1?Q?svG7M+pVclFvCwX1cgPTk1RYxyBl5fd75TUA279VSx58V5Q3556s3DMcKk?=
 =?iso-8859-1?Q?rCeNMuyaYGaU89mZ7eM0kvHV0ZXEXoq1ur8kInwg4V64HeHDhVOSphSW5e?=
 =?iso-8859-1?Q?8ITc8FhFNOEvWLtT6U8nZ5tC/3DgwUlt8GREKjcU/w3A2PG/Gx8R3ifsDo?=
 =?iso-8859-1?Q?wdnSulbZj7mqnQ4JT4LN4kJS6ivO51IfkmRPZyrbGhu11ng8H7TxqmGWoa?=
 =?iso-8859-1?Q?70xBgkW6yT6R9I8IbJRUXbouaQ3SBAqha0kW5RUzIIma8vRsYedCG09Vc8?=
 =?iso-8859-1?Q?0TRq8aM13RJFT3yEemdSVAsGljPuVUkl+h17voHccR2+MS3T0dquiIchvp?=
 =?iso-8859-1?Q?hXPDJTgFqii9y768/MFlFbXEVuvfCu+TgYAsKsK/5kXRnD4V3FKOxnLIZm?=
 =?iso-8859-1?Q?vGtdAmmRbtjGxZmLIkisZS2ZOM4WX2LtP90VpuFUmrEm0/iR3C56SGV4Gf?=
 =?iso-8859-1?Q?GcTEYLVS1Pgb88o5J/rd/GOK15QuKvyP1nN9XXcOicRvwlnNHSSRc8N2SI?=
 =?iso-8859-1?Q?twwZ8dMrUcMnQI7MiqFYjiMDkulEIPVNUSihmEpXzP69VPgTteeBR6mEIV?=
 =?iso-8859-1?Q?0fI0eYS2BJFamJanMbHkoKnlJhWx19TBxpG1HcCECgmv4YUnbk/sVygM2Y?=
 =?iso-8859-1?Q?gKxfeTLio0RSu8/eVMZ0qI3VWlesdMBmbwYJz1w8AQu313EhgvsTL5k7Fc?=
 =?iso-8859-1?Q?VO+ds50l1cRcRRyScwncVDl1rDWVZ9QqmFgIMwZing7XXgxEtG6leCzTfc?=
 =?iso-8859-1?Q?H1cdQUrVN8Bb46xSfCLclfhrXSCu0qK3q8BP/OJhv21E1boLhL0oge8VlF?=
 =?iso-8859-1?Q?cDhN37ffdsOpAxObgk6cqASf0o++D4fiZB5/gprik7vNaiW7LEI+TMRG7j?=
 =?iso-8859-1?Q?tNcOkKK3xbxorcOWfVrPhZuEHA3aJo3jq3NeL1AWZMuNSIt0+WLR53qNV/?=
 =?iso-8859-1?Q?1UMJP4c5GdSTL/q8FF0L9wnEi48s9DQM3wEovF98g4fRKCRAvBaNiPl/Wj?=
 =?iso-8859-1?Q?Z0YjvpWJ1QsPYxxTiAF0a/Ln4w+00mz4sr9RMV8i7C3VMaI43yTNNcG9/4?=
 =?iso-8859-1?Q?82uhyl8NFYDZhgjYojZN8z2UrG4W6s8zIMR2LcJHHnWdcAb7dHq1vo3IBG?=
 =?iso-8859-1?Q?NfumT/3ei0mi+NuxV/C1Nmo8Gy8VzHgUDfI2bdnbIDVngripnn/wWiA7k5?=
 =?iso-8859-1?Q?p50CJuHJz/wNa1DHhDH1T6yMmRQUCaSDhn6L6kKo+IwBALkgbX9RPTizCq?=
 =?iso-8859-1?Q?40nLu4MWGrDVu9myD8xaeMvpG36bVQUEoETKNfdzghcEbaErzSnoZo7cKe?=
 =?iso-8859-1?Q?m/X2SzzP68LQlgqsbf8vXwUkccMQK1twwJwFptujnWOE+jjuRnXvu4vNHz?=
 =?iso-8859-1?Q?62I2ZD5wdQt6ZOotmhZqnzpvnK4Fs99PrZW/ozitnYXN/TILHa6ZkDQHRq?=
 =?iso-8859-1?Q?F12XcJ65CjxjE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 324561e9-5596-4580-c464-08dafa046c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:03:32.6238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCCwxMhmZR7gjT3JV7cTHX6kPMbYK+c4kryeh5T1T6oF9/fSq7v0FQ06Zh3m1DKy04DY1LmJmzlasvgbYugAsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eYu/dDGw6GLHTJ+R0fEQjf0TNFbufUkxFbM6qfyZd0=;
 b=hyEIOUMCWzX2fBNW0Te8/5E59XWECnrjBvjYr3E8JHi1vvRR4L8arDv/1Uvbg332NTE+kYchS4hm8BKY/+JTOPYJw2/IUh1m9N62G3/JJeKOxl6+ab1XtWhYrj3tIaqY3Xd/EMPMLacHi9H6BVuhJp8UIVl3F5QUhn7l/hFnNR4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=hyEIOUMC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 19/45] package/gupnp: switch to https download
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
 "rahulbedarkar89@gmail.com" <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
=A0package/gupnp/gupnp.hash | 2 +-
=A0package/gupnp/gupnp.mk =A0 | 2 +-
=A02 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index cc5e2b5775..823dbd7927 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.3.=
sha256sum:
+# Hash from: https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.3.sha2=
56sum:
=A0sha256 =A014eda777934da2df743d072489933bd9811332b7b5bf41626b8032efb28b33=
ba =A0gupnp-1.4.3.tar.xz
=A0
=A0# Hash for license file:
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index dca747f064..f41f26d2dd 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -7,7 +7,7 @@
=A0GUPNP_VERSION_MAJOR =3D 1.4
=A0GUPNP_VERSION =3D $(GUPNP_VERSION_MAJOR).3
=A0GUPNP_SOURCE =3D gupnp-$(GUPNP_VERSION).tar.xz
-GUPNP_SITE =3D http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSIO=
N_MAJOR)
+GUPNP_SITE =3D https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MA=
JOR)
=A0GUPNP_LICENSE =3D LGPL-2.1+
=A0GUPNP_LICENSE_FILES =3D COPYING
=A0GUPNP_CPE_ID_VENDOR =3D gnome
-- =

2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
