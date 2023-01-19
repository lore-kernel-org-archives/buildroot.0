Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A937C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8F982297;
	Thu, 19 Jan 2023 10:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D8F982297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVttzdWreGgz; Thu, 19 Jan 2023 10:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33421820BA;
	Thu, 19 Jan 2023 10:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33421820BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBD991BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89327408DD
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89327408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1HdR9WPh3V8 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 345EB40897
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 345EB40897
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KStfDYFUqktLCRazd8PMvDBdq7kxjG7d3NTmONxdLUqRRgRTEhRGy0EhJ+6ilqMEF1ZqdvLBKzOPOJSNU5F2xiKIiE8AtW81c4KIIodDWGIXgW322WntDuJTK4exxVg045R22zag/tx4gv7efXUcrez89rphWzHtkjUIHqqTWJimX2ua6XVzYjvXtcXU4J5ornl7HzFh3XdHuYfkC/uTDYMNu5zsJ6Z6eupzUkWH9zjYJWh9P5iRqWjSwg3mOaO2ZSzU7bhiY02tC0vNmPdXB/9nskmnYyx9bM+QOgysTaOVd+JmxIvRvt/ivFSm2pzUYa1R81nyBv1WmVJYrqPI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3nv/1rKhe6y+hVFvhVh4HGAbKZXSfPS+ykN4gZq4s4=;
 b=bu1e3LThBBb+00MChk2QTQ65gt3Muuk3DHVS4Z3i8G4zOSzp+JHtMpy/5Vdn6+QSVmnTKefagv/QAXjNQfoQ5+ZOZeEPNj1Qq68XNnutsnh38fWWL3aWYaCopeNfr14P2+r/M6yfasLsnohhHiga7MQg1xvXutTdHzFjY5F2FBruAlz79/Zv2yfw2DgqtjdVbanL+xZoI34T5NH3WGYpML7jQEeCsz4g+p6k74KCDHFxms7Q/wqQNP8BLeu/b1NXEp2EXmQfa43y60jzGT3GCVRjosMhYppZhtzdchaOsJCqW51yjVnj3LCDq8Fnzg5lRqbFPGWl6iI40meed1vSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:14:30 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:14:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 36/45] package/libxml2: switch to https download
Thread-Index: AQHZK+2vfKMU6nqiX0C9blMAQNQA9Q==
Date: Thu, 19 Jan 2023 10:14:30 +0000
Message-ID: <VI1P190MB049380D411D5C22DBA3ED6749FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: 80496003-31f5-4a93-d888-08dafa05f45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMycARXqv9zXBQnjXc4GX7kQxc3W6IKUWEMn5JMtSxRYLU4fIoKFmwfbUf4RYqYqWvYeNVg9IDAMo1DKqj5S8ww1U93JGDX8W88GvsCVTchBxRv1fVWTL58owH6KYwFRHpAP1KUS/1IsUGkDoBJbZytVb82HaQz+eGjVD9YKu6iNE5lmVgGp41a8Ca1vEJT0EcuIozjRdFv91LghEImnrN42fE6wlNEXw8ERj6zjsCrXI4LP2NdDonXHPx/DYj2O3uPO5T/y3XtLKLGab2d088713Fd+zJKz6mBhCGauttmk7/PQ2odNoniHvPWabthzqG8jy1tPjqpISXBRQzOufq+N6Vpq4NL2zPjLfx91idIc5ay9TAjEr6Yg+KeSFYthS3dZGLI468qd0J/yGB/ATqZobGnkpvRlMd5la0ewLfIVlH5yF/0u73cgxMluNokCxQ0eBc4iCSSFhRMkLQ3g+eDq8y2UavneKJ7AJ4sMgSmtN7GVeuBPaQ2Qfo5lvXDLILZ2MwghfhT5poEJypcCaE8CJo1if5sWGTqPnPZ8ygYAnvmakwC6WhSdWsi49QE/KOHdak/tPzdjhClnd3ZheBRIALBJxhWomP6hP6GoJxyBDO65LPfi+bue+Bc0SkWQUMI259gnRqsUjw6xYausZWboCEeN8m8/5YpcRqY3KSCi51F4Kw46v2lqY1HqW6+PtgnQOhrdkuJoFXQMoEM7idLxfM55XhNXVjkknZVNLU8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(122000001)(76116006)(38100700002)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(4326008)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3an7/D39UHYdAqnbgrt7Z3bX2Erah2JqdI6S0qJ3J7R0ZnT1C9IedANfL7?=
 =?iso-8859-1?Q?707IRzwrga/D40xFCZwTWcxFFJnO9Q3q2DUmW5jXw45JNnkFEd+2w8Hkq9?=
 =?iso-8859-1?Q?JqCK7gBvDbk1YIhMQKBPKcmGpdfRJ7IU72z3DIRQiF2YF0XnHLR8lj6XC4?=
 =?iso-8859-1?Q?Cx8+uMcuog74T1ItdR1Nua2kM8kByr5fpNWlgcOpEOdlZZ6xaiEKSNIo3K?=
 =?iso-8859-1?Q?2FO3lU6bTSI2eTO27czuj6rLbQlDJ4UsJHMyudfXLXfakV+F4Mip8BXAWN?=
 =?iso-8859-1?Q?yZHHLfU3Z9adRiTX0op4CzbjEOh3+aFgFeYbaFl32+wQTeFMsL+dFTmwEn?=
 =?iso-8859-1?Q?89O+d0uHksprybDgNIJliXkt/fPyFSBK/hriRr6ZnZEHh0/mbn/HxnVz/A?=
 =?iso-8859-1?Q?a1O6svD9sU1cnFx+Fu1dXSUl5vYbLyLKxoFTdMgZuf2U6Oe7fZL4+RezoJ?=
 =?iso-8859-1?Q?0imWiDA7wDMNQWSkMdWG8SZeUJeF6q+AuyHcDLd0WRBamNdKFdPqjkD51Q?=
 =?iso-8859-1?Q?Szd0uMYTRlZ4u1IJ+tWQ09euQfnn4IgP9EO8WmGVDOizR7dHzCq9EAppTf?=
 =?iso-8859-1?Q?3zk1jfMwj/XdKQiqIo4lzhGqBvdV1jhDObrV7GaRWlgUtZvz3ahgeBw2nC?=
 =?iso-8859-1?Q?aePFQcoc1rodeRJsDs4hxcPixwKntHhmy+WQMHolgZRhjJ7BDhH4oFIQMM?=
 =?iso-8859-1?Q?lHwzMNuDcm6UleJMz5DoDiHywTkQ3zpFKd2+/6ssZz5JqxwKf/U9hOH3cq?=
 =?iso-8859-1?Q?DXgA11uHYqzkm2q+lYC5nIhGzzQNZw9q7Vr6aQYN7kD5V3w645a+FN1ZAS?=
 =?iso-8859-1?Q?idnGm7Lv49YXEpk94R15N+nJdcJRi1WBC0p3Itz4qTmU1ojPzKxbAb70PR?=
 =?iso-8859-1?Q?pSre2MY4KKxhO/W24TFnbayfyg3ZlTP7OkHG1ainqzt2H+An2dMIvEa4mY?=
 =?iso-8859-1?Q?n2vrARO78Pca8uSoPWdu5VSaOFxWr+vo79OJMZlAw4PWYUU60szuPe8lMu?=
 =?iso-8859-1?Q?7FQ3BywszYg+jX1iLZDV3skjMtu/miKHPcw+d/UD3YSOVYt+icJ3NPll3m?=
 =?iso-8859-1?Q?Uazk77XaQ8svxj3z9FShKmKsSk+2EDravC9HkpABa0E76OHNjP/ggAFCi1?=
 =?iso-8859-1?Q?VCfNYZGM60BTl84P7MQZL49qNvPFaxHkayZhmyXG24mdVtvDz4Wc+7UkDY?=
 =?iso-8859-1?Q?7XO/FzZlCmvoSU5d1rqQ/PrBLWDyyJpKpLlKf8KGdf/ab6CaoFJK6E4B0E?=
 =?iso-8859-1?Q?Fxc5rfHa28P15N1aedrErCELWVbfKPKH3fI0wxmwppS5/AUj57hVkz7GvW?=
 =?iso-8859-1?Q?xvkdiEoLNINsIo7t6g8iPnK5SkqNxIszHWyGsq6N2GFzGjSSOim4OO6lA8?=
 =?iso-8859-1?Q?vtAN3yvDX97H7qOkmv4NOWJkwOBCruOKkziW2QNPY3fo28QDKo5ihCIZrO?=
 =?iso-8859-1?Q?TzTNZ474EW/JkIJjI0TC4++Uek5fYlLJH3NsnHIjFRDsHixbOvpiXnyqYW?=
 =?iso-8859-1?Q?iBbX9Hq9E4PYZx8oUzqA9sD+JJt30Eyadbomurxk7QzCTwClNfr+gtqsad?=
 =?iso-8859-1?Q?wWhHlHljeSAss6SM461xb2Wp9U/zEdvcDO9nG56G/IFw+8ULS+g8o7TDn4?=
 =?iso-8859-1?Q?fptT9CGo2reUo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80496003-31f5-4a93-d888-08dafa05f45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:14:30.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+45iOMqE1HoXRt23xKb8THcHSutj2Hf9K4xalGOmNatKsBXo/ycQhSrTJCn+g3Lz7TCMaN7E4fhy1Cgh96ZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3nv/1rKhe6y+hVFvhVh4HGAbKZXSfPS+ykN4gZq4s4=;
 b=FdC//I5XeqBsEFbVbe6QO6vg9cVnHAW1x/im8qhJqEgfIykMrrPGAfeqCBd/TwO9eR54KDfo7awl7WrVHmeI5GdkSOL4GpU4UzikDelD56GHYVQh1VxxWPTwnZZ3qUn45IjHHGDJPwbi7lj/OYJ3GxjRhlGwJlk5+Bhp+6743Xw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=FdC//I5X
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 36/45] package/libxml2: switch to https download
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 00daa21a83..6957e2ed87 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
+# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
 sha256  5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c  libxml2-2.10.3.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 321e8b756b..7a01dc4259 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -8,7 +8,7 @@ LIBXML2_VERSION_MAJOR = 2.10
 LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
+	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = Copyright
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
