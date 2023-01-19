Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB8C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 093C240438;
	Thu, 19 Jan 2023 10:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093C240438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4nzUBpi4S0G; Thu, 19 Jan 2023 10:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4321040222;
	Thu, 19 Jan 2023 10:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4321040222
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4965F1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D54419B1
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D54419B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BG7N5Imz-b_9 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F409A4192D
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2075.outbound.protection.outlook.com [40.107.6.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F409A4192D
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REVKPxsxsx3j5rr/TqS6Z9qVPCYXSnXrE9CzktVdHewYBSjfY/hTlXEgWOVRRGDrg6UfQQ7OXXDs3fSAAdhja0h6JKcQLiOXQL+9GnSPuHl+eN5ux1FHYHzc8Nbt4n/oy/mRHfrTp/VOdjKbr8SK76cnQ7M3hxVTKE2kSGZv1VsojeaoFFzjkvCE0Liw0C4e+ROX8XbOILrM8zbAl0jRTp5pVw24ccFf24uFZ+TspUh+UXkmXslSzULO9531MpAO7xWzjiSFPHBm9lfeAotEykiHQOcEasJicNalH7mgLCDpNnKQmR41SyH+k6RRv6IC2KW5yIfD84Y1X0D5nAj5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXIVe1MCWWGqRB413b5B9tOrefUQz5gb6Hed4mX94nE=;
 b=PnyEY6DsSylm92y3n8tHHOw/FuSNahZF3LKw9BaA0z8eRccsM2w9CXlpVO5JfPMSruMhoMGJ7EV9qY4iLOjD3DuSYlaaSncPOmykjs0ml2GHFZrKRuoeK3eeV+41wsU6diCQkrKQQeE71RSnNHBU1Qcp+Qvot5S64L2w66sjhcDPIaMJtBsp5cYq/t5Um1DdYvc+gcBbiQeFKf05fVfVZdOFtBl7RXDbQ3mAfu04jOFGshYwWq4S3hE9tcerOqWkgIqsncOOdzw57N052cXxfMVAOPkj9RCqLHgJLa4u/JOKGit04LDKzaFMzbwPj9ChI+vA0P+H2Kry8XCNkqjGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0616.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:12:33 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:12:33 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 32/45] package/libpeas: switch to https download
Thread-Index: AQHZK+17HZg47o1f1UafgQmlXkeqnA==
Date: Thu, 19 Jan 2023 10:12:33 +0000
Message-ID: <VI1P190MB04933434A56DB36358D85C0F9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0616:EE_
x-ms-office365-filtering-correlation-id: 096d36ef-d177-4557-6541-08dafa05ae43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PVGVdEgpaK5XnI1zhpr43Togd5mVeGtxo2SMgS5Mk/KDjYwYUTpST3RdkzCwoxEYrM3Sq5pzCYGJxZj5557n/7t1X/86asARjiqfo4lqXOBtun4WCVUcSKnWw0OIPwdBVsdX+sHe7vpCsG7c6qFrelX810gq1wHqIen9GcCJQ6D+BYXdWaVHYHmzo/shAukpa6oGu2BDQZ+4covimgDbH2OXf+Z4h1R9cOb7q8RVcUHt7eGiYwtFwiJrzLHidfPlumSb4D6ruvIbvPkVd0OpUCYPzGn8at6A94B2wuSLQ/qRQutPOmIpc4WhIkgGPQf4nDfTnayrxV9ZfWkoiAzSfFGLdgT0G2dO7srnZijWH2518z9XINV5lpPIstWw6b9alqNHMPxlnbm49QDrOyeO9PcKivQ31N6uRIWL4CXYs42LG1IZ5oj2i2PKI+WX5ENv3zLhgSAVpYwoffregebGf/Juzm9CCxh/SciVdcvgcTC7LD51Mb3KpHQT6A30MJ1Y4eamp4/4pFUPZ3yj10+J75ZsUBe1RAVXvZxYUQBL3L/7HBuQixo/rTvJqTZjPznJAi5BhehyXd64+gnRpkwEdDWS8z8T6qgL70VMnWY2t5lHYhlNSfCWOmOaotQ7hLrRuVzs78VRp2hiSl1mQ/YTQYuv5MKEB6vJcBNd2tXlnJ19sTzP9OgjcwzxA01WdIpfokgl8EC38fnLZaLQ+CdJVK7kZX2dQ6UWwbwrGPnbtvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(451199015)(66946007)(64756008)(6916009)(33656002)(76116006)(66476007)(26005)(9686003)(41300700001)(8676002)(66446008)(186003)(86362001)(66556008)(5660300002)(38100700002)(8936002)(52536014)(55016003)(316002)(83380400001)(6506007)(478600001)(7696005)(2906002)(966005)(71200400001)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZNkfvIkXka6dgKbp+ejskrXa1S7HM+UICgtKATwC/J43MgTS5kr7iDNtkA?=
 =?iso-8859-1?Q?Ut6qhO70GNt2/uFq+WOmDDqqw8UUbODSX1IjX1Q8D6yi0Th/WBlgf3RDvh?=
 =?iso-8859-1?Q?FKPB0X9tBQGVp+hIgfLUTpJGUpx/EwMthq4MthLZubGC7jTuxhcoi7w+GQ?=
 =?iso-8859-1?Q?uIOdGtM8t4KUAYE3QmS2rBuCx5ooZ+D/9yBufUU7wVxIB4ZccM6qHj/fFG?=
 =?iso-8859-1?Q?oMPOHAf7upmnqnBFAdidOVCJHbqg4rLR+fsTQHcfUJ8buu3GaQOZTMUq8q?=
 =?iso-8859-1?Q?ozd896UHjHmaRJX0xpuY8zHvzkEatFl3IeRtSYki2oVGYTAZoxoiapz9cV?=
 =?iso-8859-1?Q?ajtbYEioJ4qnpzsHz+McNTLulhgJ0aMY9ephQxgcTuEDkfjkymqoQEBqfm?=
 =?iso-8859-1?Q?c2FfxzTUznFvPrV2scJlOjSiNu0BmQ/DIkXHrigBy13za3CxLcyXCpqJMB?=
 =?iso-8859-1?Q?j+I+QY2aR4DtfCxlSgGBsKCuWzpgUVziC9621bI4/fj0rNrcg2JVz5jpm+?=
 =?iso-8859-1?Q?jBfspkSgJF80fWhd2M0fgJlsBFmQCmC5HYE3ALxVrrQL/xhP6a/r7DaLcc?=
 =?iso-8859-1?Q?G8seXVtrW6PIVe/U6muDRSXM16M6tBbATQtXHTrN5HvHPL6kEEzJoabBK5?=
 =?iso-8859-1?Q?Jk5JLciP1MAUMfHYKNWWvYi9VL4mw2I4R93pdhcduQk9/O3A/2fDaBu6Fq?=
 =?iso-8859-1?Q?01mEm9y0N/LV17Nn82pb/XioPDHavML474Vy0SSw0w8kgI1MCfUwt1eK5H?=
 =?iso-8859-1?Q?HzkdE0BqIyHnAWM5XYrxvVtwOpw+mEDK+Af6J6gqM1ML5+AGnXr50Zos+L?=
 =?iso-8859-1?Q?1MCbu2j/t+xN4hg6fhGvpz1N05f3OEdiupwbiyZju8Si/cYZ2wPhNGP0qS?=
 =?iso-8859-1?Q?j5iiSm49XmDVpvGD6+zz2H7Aa6Y8SpRfUhAGkBPWAYah3hPrnSyRh+fgV6?=
 =?iso-8859-1?Q?hadOsAELqffmgWzwNrJwz356PbB7+W4KxlCHlSdzBYEVDgA9ag5itx2pUd?=
 =?iso-8859-1?Q?5hVNGEC6lbMGChJeUkzx+HPPuxRglTEMkr0AqDLR6RZMZskvPE6KbHEp1f?=
 =?iso-8859-1?Q?NN4AL1bTOnjTF07JIOjyEuU8ADzJVGEI2v54OXshOpgwacNFmOIaGZ/AkV?=
 =?iso-8859-1?Q?R75E0M0Bl44xjiZjYHJGNYnzItUJEBz42D+kyuQG2PxqRzz2F+Jl66Bz+R?=
 =?iso-8859-1?Q?FjDsJ4nHtvANOg+uyCLjBFG500mewUto+iYhKIi7Q3AsuKqRqG7AnR5CYW?=
 =?iso-8859-1?Q?QwuJ+11stDDmMOEhbYOUytp3QgOWvwilfrBT0NeNSejlKpzmvcDb6o19P6?=
 =?iso-8859-1?Q?aJauKqzVl0yqMbEOMSEKeoC06virgAo/jQhUyhQWAnKgZaAgOVty0Uvg9K?=
 =?iso-8859-1?Q?QTEt2h4p8W4Cf4eo6k8fAdj1UdzS/0dZI9ZGuAgTGtHdtcOrA+w79jAe7o?=
 =?iso-8859-1?Q?h5KjT1VZkNGpsrsL6JYc4vgw6uFN5BPWrJdCkTsA0qH3GpiUEB0wLOjNW7?=
 =?iso-8859-1?Q?aMpD/uPWmIEjw/1hKOVSvzLUxBd1/dVTVvNTW+W+lvcIV/N9lRYzqYF/kK?=
 =?iso-8859-1?Q?qMcuGAHg/ThXO27nTF19qGbLY0n4XRkLwGFUtNRWj7iFncg5Z9NFaDobvS?=
 =?iso-8859-1?Q?90HPhiPhdgim8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 096d36ef-d177-4557-6541-08dafa05ae43
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:12:33.1310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjUTkO52fU4b+/IHag+y28kNzPOBqS3vFSTqcOmnDOt5RSrU8uDV9R3FAoWd0ahnu3h/VSJcDEcV0XW1JCOo6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXIVe1MCWWGqRB413b5B9tOrefUQz5gb6Hed4mX94nE=;
 b=k0MELjDW11nFWMvBZYQZpgCzSxXQHWuXM3xlVxOFvcgZSQ7sVDS2EWzYGS8x5GrXjBZxAx37dQAw0/6pwheKox+sBoEy5pT4LUGFVDvzHkwyuXk60PxmCO+Yv6/ZyZybKqxyhgefchKZ45iqQNwmDU9RUqd7A6UCpLBIwXFS2I8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=k0MELjDW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 32/45] package/libpeas: switch to https download
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
 package/libpeas/libpeas.hash | 2 +-
 package/libpeas/libpeas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
index c503558f85..f69fd2945f 100644
--- a/package/libpeas/libpeas.hash
+++ b/package/libpeas/libpeas.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
+# From https://download.gnome.org/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
 sha256  d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e  libpeas-1.32.0.tar.xz
 # Locally calculated
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
index 5550162e04..3d2e79452c 100644
--- a/package/libpeas/libpeas.mk
+++ b/package/libpeas/libpeas.mk
@@ -7,7 +7,7 @@
 LIBPEAS_VERSION_MAJOR = 1.32
 LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
 LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
-LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
+LIBPEAS_SITE = https://download.gnome.org/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
 LIBPEAS_LICENSE = LGPL-2.1+
 LIBPEAS_LICENSE_FILES = COPYING
 LIBPEAS_CPE_ID_VENDOR = gnome
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
