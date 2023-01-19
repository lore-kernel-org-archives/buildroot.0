Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE1C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D810A82290;
	Thu, 19 Jan 2023 10:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D810A82290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krDCfJFlIFeA; Thu, 19 Jan 2023 10:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1129B8224E;
	Thu, 19 Jan 2023 10:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1129B8224E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2161BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0199B40438
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0199B40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrsIhhh0uYnL for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:02:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE1140144
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAE1140144
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4XP5cnB++B/o4IXyno/Pyx8BQbIK/7jBb8ID0T8D4mLAvmBibYQcdPJSA/AYBO1BOKXrNKnhtM7sDK9g1h67+IvOnfVdh10h1Pz4RELrERfJ3KTJGO0UYM9ILOGqrrx15aVivqr4Bva9j7pTfM36Z0xB5q7sLSJBbe0/P5iKC47uKLTsDdOytkDCEY1W7qjnSMb+cuYPP42hcryC5/8SpdulZt95ML1VmomVtVWaKBNF/g1saEfC7oE49FyApfuSr/y8QNYIH7hMrrrpkRpjxCr4chPqX4qDfA13FSnv+M/aDRQkWGe6hzK80xoopmVR1NE1BoQs+GC92EpzwFzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pehaBoC8gdQMZB9EIHTGb6w/lefGW3M1CILZoA+DK0s=;
 b=Uw2p/jUlzPCMnD92alOM0NxkYFJRik74pvM7Iu3SJ0U4w053jX6WdOdvBNmgM9iLV+gqT2ztqPM46lf4yz77bjZ9NHEFOgV5mW+KYlN1AYjT6q07YVNOaFrnDUsL916EDaKDpov0rwktM1k8A2UeRS6i770wXXiUhKrLdURKEIIvFRIFqSUTjumQm7Z/MuONKYHY6bIIbi+wakeIfOHTyVUOdov7PX6vsBYehGACSNYAliJWt6DbXiv7J+PnhEl7jE8Csai9pVACwnxiTr583rqe54rrwqvrO+7T81Iar+FmUtscUczKBnb1qrA5uvJ5RLHRHCV2w+gnqoNeDqBAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1111.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:02:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:02:17 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 18/45] package/gupnp-tools: switch to https download
Thread-Index: AQHZK+uxwRLXEpxux0qdCA8jrqFQlA==
Date: Thu, 19 Jan 2023 10:02:17 +0000
Message-ID: <VI1P190MB0493A73E01A00D2AE79100189FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1111:EE_
x-ms-office365-filtering-correlation-id: a1c2a2a9-b6ca-4b52-863c-08dafa043f41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O1c1uo5Hspvg9+zU2evg0aBB2SDgyKAd1WWaiEIzHIC6xeMHrxUe8x2PHtDjNRzLhvJsDJvQI1RmqeG/PMv7Liuuez6JcyHI9rACVCtRaOOk5/F0yfpOgVcfuig5FGM9XB6ExlKi/v4np5aRCdl/88Gm3Iu6qYMe7R/GAUQMeDvsu92P3wSeYTJaKyo/rP1GmYrBTQrGxKP4/NpMCAetBL8/z4/U/fvizV5N3iEWf5QzoGj30TJx/CnJIARyhfK02D057xmNsjZASdq0sWJ9HWm9mSBcY76OBfTRfxvgyFH/eOVLy2QZS50eF2Nsse4Gu6skgZIoQkwR/l944U1tZJwKrQ0AaIiRdvxFBvhn3TlU5vQT2VUsvqtTKsaovoTk98B4hp2mrhXsGKJVmgZwTXCHvbWOrBSBEk2+lCmVkqcsgIOwMnLpLnONYoxfcNSmQghnHP8FaiEfMh56yfoOKbt3DxRlExJoctBP0Fba6M/f8NteoKTaZ6nt1wi5GPX5eIlapUvzIxFxVZ0ETojW5WRhyl+ind6o3W1PGOzR/kM5X2ZcaS/nQr9RqBxk5o5syPV5Vgz/AcG+C4JaY4V2DQlaL/6Gbwer8UN29tXNxn6IKg9HAtnrz+dvQ3g5uhIQNJHGQ+g+XaoLdBiL6IxCcOGGp3XLCl6wTxbHt/zllZQjV8sufAZGK2yvtBa1bEszep9JtpHKZppFKpGv88o12jNFwQ0kwsTmI+3MuHAcc7Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(451199015)(83380400001)(52536014)(8936002)(41300700001)(316002)(4326008)(6916009)(64756008)(66476007)(76116006)(8676002)(66946007)(66556008)(66446008)(38070700005)(86362001)(55016003)(2906002)(5660300002)(38100700002)(7696005)(71200400001)(6506007)(9686003)(186003)(26005)(966005)(122000001)(478600001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PNd0HmzE2IjBhlkqIlwA5S1KTMnL+YphZA1eKtKBU8COPHdnYmZtgOy1qD?=
 =?iso-8859-1?Q?+2DwPP1GcY5xYqHIyerUVRLEa0K7mZBntLXepYYNFWLDMq4mjUZFDFwDuS?=
 =?iso-8859-1?Q?CkgfbdOpOYTjSZ09yPNxWq0EA//QUYzEzHGlsA+w/Xxurho++WHZV0e7+q?=
 =?iso-8859-1?Q?GXwCXYTO4gA2Zbwh3NlhL43Z3ozIzJxZv2qvRrVbI/A7WpIEvz/vXDu6ZS?=
 =?iso-8859-1?Q?l7Ks4wCenyXCaxeoz2ifA1Y270ptz+9XHy6v3eMhYaYv/8onAVi5UY08Cx?=
 =?iso-8859-1?Q?qLGiC9buJH0cg4ef/I+en9Cvp933bKcms1L+b0v4HOcK8gYKHbkZgcnzs9?=
 =?iso-8859-1?Q?4Py3MJXWmFHIqsaaIpX+iY19WnBoDO5U35Y+H/6LI8F3ZNLzvH8IXYsiY8?=
 =?iso-8859-1?Q?Wgfs/A9it84rcpgCovB8NlG30/u7lhQAxZKK+LXsflBPV3WY8CeTwwbpoB?=
 =?iso-8859-1?Q?Ga2FJefaH9YVXYkAQJV4wL9zkoSW6CGYbJLBm8pHc7iBK5rcH2bslF/Y96?=
 =?iso-8859-1?Q?NlrvnS0BnQ9keugziqSK19EH3KMeNfKjJF3PhCEc1x+hA9sG6gdAsJpHPv?=
 =?iso-8859-1?Q?/pae3h4kWF9tu3TooJyLejAyXqALxm4kt7a2ieUUbXReJeLjsN1JhovMoG?=
 =?iso-8859-1?Q?jGwkq/+jxbX+WRevseakjTFD4VafbiXl7FKrsbuECVyoOoXwq5F+ZI009j?=
 =?iso-8859-1?Q?sWSecUlxEl/TKCBo5EHLO//9YlLm4Q1cJ6hU6WiKaM0o41JQYBKWzc52QJ?=
 =?iso-8859-1?Q?0l080Y4iAtZBeMHFQP9yE3Dw2ZBLiZ0cEEIR/AVfRetTEfuos5I5JBNMlP?=
 =?iso-8859-1?Q?yAEEI9vWt3ofkyfoP8etcialDyI3fJP3ImIGOm+nfQ39lKt8Jg3wYMeqhZ?=
 =?iso-8859-1?Q?5baUp5msc6495Kj7QEYyKFdOmHAJ9XZIcKfSMnG3c7NS/owe5bd2e9z8QK?=
 =?iso-8859-1?Q?WTX9QWenOLttH7x5aDiVa0Rk9sb2wXp4wDdMlL6ZFhgBLHDl5UmC4e+3Aw?=
 =?iso-8859-1?Q?MZ3nQ6zObS1HfQmvQ4i7s/FTPI4G95mHWAiowpIp/STm/9VYTIjtRWzPk9?=
 =?iso-8859-1?Q?+6ozYd96PoxNfxWAgzsSUPGVIKX0kipPv0/PNZBenHKtIIUKjpsbHha0x+?=
 =?iso-8859-1?Q?gbmphquJbFzSmH3VfJ4MlQzjTnsYayZfIaiKMyRGjO0dxsh+uOTzwGU3p2?=
 =?iso-8859-1?Q?wkKTvrO3zrpi0YWI9pW0ebQXhsxUw56zct0sAfTSgF8X5boW+MPqBr8ixU?=
 =?iso-8859-1?Q?qQXCH3TMl/acRRiGUsADJHZKh6FVEoMDFmPTY+3ZJPdYgeoTnS8DB+7pw4?=
 =?iso-8859-1?Q?ZyMDEgZ9h4tGjfeBUuWQ9i6JteIg9VP+nvyqrI8M6zHZlWJHUYyiajE321?=
 =?iso-8859-1?Q?tZ0AriQ+TGkRvsrODHvYz2Urfw0ZSTCvon7jLXUZQrDUMWV0yL3Hx50Crm?=
 =?iso-8859-1?Q?pjs2+pNVCUy9XaalfGfjHn6Gux6wbF2RqS0jNnzhMdahkMpMOuIRi1umLq?=
 =?iso-8859-1?Q?EF1vERM+Mi5+MA+wlDK+S+VsO4BH4O+/WmIuFlZBzMVidG7PWcAqo5/Q16?=
 =?iso-8859-1?Q?qHToFkBrp4VCH6JjzP8PaNaijY0AMUSYTPV5DbpGG4hqy5AEvHRB8Gv6bQ?=
 =?iso-8859-1?Q?67dnpTHNt3juk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c2a2a9-b6ca-4b52-863c-08dafa043f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:02:17.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV0DK/SMcSZb3R/f3o4ZWaBWawq962uKXMJOQKJgAwyOfTnDdSEsh37A4iIK4Ia8k7EialbuYS6i9wGdw3KLPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pehaBoC8gdQMZB9EIHTGb6w/lefGW3M1CILZoA+DK0s=;
 b=0fj4zZexRZ3EbC3kZvy5anfXiKNI4FeWnR6ENKeG/U15v4XIZIewtNFyYzAs2vT0U3uxrK6n5pNUXYlGbgIzVkJvbU0QgzekADYlweIb4X2v1VolQ7HVW1Ik6LX+1ClwH1N5mtJbl9OZr3fkgA6cTRwHtk8TngfZFiz5ahGSmZ0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=0fj4zZex
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 18/45] package/gupnp-tools: switch to https
 download
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gupnp-tools/gupnp-tools.hash | 2 +-
 package/gupnp-tools/gupnp-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 37983b0c92..c3808de6e2 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
+# Hash from: https://download.gnome.org/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
 sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
 
 # Locally computed:
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 96bcbffa49..f87e98ef03 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -8,7 +8,7 @@ GUPNP_TOOLS_VERSION_MAJOR = 0.10
 GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
+	https://download.gnome.org/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
 GUPNP_TOOLS_LICENSE = GPL-2.0+
 GUPNP_TOOLS_LICENSE_FILES = COPYING
 GUPNP_TOOLS_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
