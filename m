Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313D8C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFE1820CF;
	Thu, 19 Jan 2023 10:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFE1820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvI0eVIOxyV5; Thu, 19 Jan 2023 10:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9B5820B9;
	Thu, 19 Jan 2023 10:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9B5820B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E108C1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAF4E408DD
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF4E408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsfyN7A2Ekny for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:15:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CD840897
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95CD840897
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOrBjRuXqMW5ZFnXUFp2iNOzv3bruKUxHFkLGg/NagcXYlggPQE1dFGxdFWoXxkeBqXcdCdQVOFOb9D2A5Nek5Nu/A0wwzdKQ5eGqti4m2sqBHGLPBYD1vhCCg1O96LkHDzeyO9CpWAPJAjG7Aaqs1RZlQrHAxmDaW71XqiZwv6ePIC1rrOAw/5c6uvV9EQfQlOBovrI5nU+4u33kI8cLTmBcgwEjdZhh93xduNpxTJS3M1AfPoLzVo86+4I7WYhGoJAncfdK8Nf9vGhtHr0e3l/m+itPrJBBQe4aTpNB3C7Ozh0prsrlxqOUe5GfZAq4tFt70kzHjjcIDwPJ/0JLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQElCNfzmByADiDnhPLGP9FdoaDv+DHaYuvSEJJ4U8c=;
 b=SoJtdmzrCnao/Q+KtfH2U7bi8cuykK5R28FYItEYZD2R6GnBENC0eQX6PKUanUrq7gwnZTjhVoPhCUskcXqOWu3DyKCpq22OGe1P+7CgbNkN5mxkBDJDETrnpTwEP1Y+x9lYjVsr87loLhwJSRHQ/JJVLCGWAmxUUoak6mHZsk3wQqtweO5lB/scEK9uSsnP2/RUcCyoQEv0L97NXFvtGMX8j1+1VkD8d0qGxLEqYABucjQZu8Ew071p4+6HNxwkWMU4r0D/qhIG/fsryiENXANExgWOLb527MzTB11+Yf/MUBPtzE75K+9tWK9NO2aNMijjbjpr3I56+VZSH3GVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:15:10 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:15:10 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 37/45] package/libxmlpp: switch to https download
Thread-Index: AQHZK+2+p5k0tiD+hUSAuxIgf03otA==
Date: Thu, 19 Jan 2023 10:15:10 +0000
Message-ID: <VI1P190MB0493F44AC5C3A639C025D4299FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: 1a683fc7-f142-4f76-9c0d-08dafa060c24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ACGdrpcjbKf3xS6XsjsEzOs2JLn7ZZuwfnwH/FdthP4fj4Z4RL12RlOvkvHNkakdWJyGSZ7EnM9fG+/xmd0YsNxtP/4k02UknwTJ8Di/gpwyVTzezVqtIGb5UHopzDau5ZhoU+IrACg/kxXn9wYHoIgpao09cz/mGhfc2HxanlaYecfU/kV9PE6+QNF2eZh4Nq1HNQ3pHieuqL2+tbor7d6MDsIfEbaQjU0Nf3xlrHhMvlGjtiYkYl0ygtylfLewosGgM/2ec+0JywpvLawLp4WAxrlqWkYtmRxdPtO7YHTmcjl6wicWzoMckZo+2w970sU+iiD99P+8KO+e1wWyznpUKgrgxREGAzseTWHeGhyaQRQ04jt4jhvDKsw05yvd+JdPMsi8o46KM3o4e1ui4TLErBEojKSceYV8mohiKeJPBRp3Hq4O16M+Z/H5Rit4+4wi1dKQDx6lAlGWTvhwC8CCfV3DWNSfafCWt76PwPCw0ZODvsqxMHapS75HpEAJYoJoSdEU/xwahLa17JdVJeO43nz0zWJdI1lnvhOqJNZKkoimIDcHVAnh+RkLglerhcxjubDh5aSkhWJWBzUAEgwtf+vIS59Ehdeq4oV4vwJTClY9WPyDgXxxe9raEBUIh5TMwI866kiA1sBl1yLxiNsgrhAqetxzBbXQ9uKep9paxmFkGdjYXxQ1O55uAfT9ckY6dvl47kzWHUzoY4l/uZK0TKDmeX97pZNIZpOCFn8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(122000001)(76116006)(38100700002)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rF2HG3MsR41Ey9sx5lT8yfOcmtsmuYoIJ0nCQ6aBJUOIBTirHf6tIaaiZz?=
 =?iso-8859-1?Q?J/S7LUEm8gzo1HKSoa0DKAdTBoZtG2ediCu0BD7sQtnWniSilHw7EqD3RL?=
 =?iso-8859-1?Q?zWsgdbeO+uSS8ct2oVWNQ/sk29w8Zg4vsqDcj1bc4qJW6sJBiWDVBPEsJ6?=
 =?iso-8859-1?Q?7Dm48/BmF5ZPd3he8a8fYCjJcv8jLjaVFiL3FkU+CyF/jZggQQm1XcbavW?=
 =?iso-8859-1?Q?q27mTHqnic3PVDw6gVDBgsPeaxywxH20XfyzCV+lz6PM3CSwR0SAYaf3G9?=
 =?iso-8859-1?Q?HSsWeEKe5+k3JaUnqMOaB4NPhi36Yb7C8l5Tf1fnW0M0VdL2wbgLBt19u3?=
 =?iso-8859-1?Q?ZO4pHKRkCYdaSj9YDT0YAJdviLhgoC5LHNfZbZpc7pw8FXcJ4wfdDvSZJY?=
 =?iso-8859-1?Q?pI5pR1WzxSBTpu5gmO2j7rneib+kYss3yOBITuBdv+3L23QP8NtpleCWz+?=
 =?iso-8859-1?Q?QIV5gaj965H2Uu4wOIadN2MrZ+idLKf0+jx/oV2xKeRw6NpK7tBVrH6+fj?=
 =?iso-8859-1?Q?zY7f6miKC/DYCccmJ1cI3nL1P8/ImTmV8L5JG0rTYNWLy1JmcfkG0vKovf?=
 =?iso-8859-1?Q?WjPChpgzQzGWkA2q7btyKTsV9e3RYGKZZ4JEJd9blFxuYT2/EjOzyGxGrK?=
 =?iso-8859-1?Q?+0ieWao+ZhD42YwXaVeGKg0nD2lnke6TrjKHKbXHDm+fH6J0yqBlORKf/K?=
 =?iso-8859-1?Q?dtpLpadbt0SmPBlw0cQOk1RguwLFjxnuspDD5msphYZ8lw+0WrGxp4owPH?=
 =?iso-8859-1?Q?wbI1TJL5s6Q+jGWIfOA3gvGvCifojP/7Tkm3sLlmbmSBudeatnjjLywqZQ?=
 =?iso-8859-1?Q?LSgwxtBgHsYQ8b0vwqRp1PqQtw6sEN4u5brpAlntBdyj35uxys76KNKC8k?=
 =?iso-8859-1?Q?huOEWbzvMCa2Oc80NNM6LgyXp2R8/iN3IENFK9vczl/TmZH0n/VBw8BsSo?=
 =?iso-8859-1?Q?e49z33sGiZwWhXiFaC4ke0BHm+smPd1Rb/3mWFwdwEFDGH1p+TZQVeb7FV?=
 =?iso-8859-1?Q?C+OZU80ucvzhDXsqiICRMxBO0kpGPqU7YovbIZOOmw/uwx5OM3CpfQFkv0?=
 =?iso-8859-1?Q?2Ub0dbofEQL+yLZrI9XKGgOEs4bElKs+NLhYzukHvigTroiF49fP7znwkO?=
 =?iso-8859-1?Q?BkmffHrKlksOntcQrDccjdqaIoiadsg2BkRarur5CYQ4+DObxN9HBha9ix?=
 =?iso-8859-1?Q?4ZSjidSAKy4dpMY0yCBum6Ox1Rkq4aztDfNS+1L7bC65BCoxQ+qCKgVjVd?=
 =?iso-8859-1?Q?OB7BMB4lUxnHyocRUwzDwGeXAIx7faMrwCDiswy7iNCzs0EKQM+ns8KOa9?=
 =?iso-8859-1?Q?FcHK50Ggxoj8mnmHKSUQs3qc65JzVGkh/Tkdz8I3xJIp3BfyQng+pNodnK?=
 =?iso-8859-1?Q?79hNHcnRHLfVcWPM0p8pBO212KwkEXq1jRaTTG/PPZfLZvFYuBd+nx3wOD?=
 =?iso-8859-1?Q?VoM/UoXY9PPK+26QHpx5s2Lf1Ctc2LLIrdnP9U7WD+Pp6cnqkzjYcHyZ4W?=
 =?iso-8859-1?Q?BTGQ21v8tbUvICue/pnwDv8lYRQww6BXrFSByOMJ4wUAGSD/3hgLkouBiF?=
 =?iso-8859-1?Q?fM7ba0iV+ZfE8JG8B5/yWltUNGdA/mpb7ySu7MY8DknpZa50gSpyLeCojT?=
 =?iso-8859-1?Q?R1WQTIYIQngTU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a683fc7-f142-4f76-9c0d-08dafa060c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:15:10.6351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWjep1ykzkC4DJrso3xY5J3qPBAGb94EMbs+/h+ioow7+boIsq7olJpGT+E/+WlynUTg455kKeceFC+bfiX6qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQElCNfzmByADiDnhPLGP9FdoaDv+DHaYuvSEJJ4U8c=;
 b=PdNYZR4rO2IZtpb/kIVkdzmaXzDkEMO2llbSJACT5KJPuVA77mYMyJeFw0gE6lJsdCAi2Mbe63CT1ny64x8LJ9NrhAcr6RHgw1V5UK2vGN8p/FlGj7mTcECfpaMvybl2j6SE+4yaDMllvmF/OtNwhdhTXRRtvCFTwQ5hZU7EX8U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=PdNYZR4r
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 37/45] package/libxmlpp: switch to https download
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libxmlpp/libxmlpp.hash | 2 +-
 package/libxmlpp/libxmlpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index a974de57e3..1c1342a105 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
+# From https://download.gnome.org/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
 sha256  7c17cc3e5a2214314dee5a1354f4b436f266ded6185232a0534f352a76240d5a  libxml++-5.0.2.tar.xz
 
 # Hash for license file
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 3db711826e..dacd5c1eae 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -9,7 +9,7 @@ LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
-LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
+LIBXMLPP_SITE = https://download.gnome.org/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
 LIBXMLPP_INSTALL_STAGING = YES
 LIBXMLPP_DEPENDENCIES = libxml2 glibmm host-pkgconf
 LIBXMLPP_CONF_OPTS = \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
