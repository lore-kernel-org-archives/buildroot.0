Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E2EC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 12:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0423B8134D;
	Mon,  9 Jan 2023 12:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0423B8134D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQQufCZpnwSm; Mon,  9 Jan 2023 12:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA1A8130F;
	Mon,  9 Jan 2023 12:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA1A8130F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9122C1BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A78B40866
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A78B40866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GusBKm8ZlVla for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 12:58:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFBBF404AA
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2049.outbound.protection.outlook.com [40.107.15.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFBBF404AA
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 12:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+BOA8zh8Z2pOGZ0/ZhaJFvn5kR3ciW3bP8B0QyVdWIqS4+9cgDh6ZWFrWVO1PP5nqAWW6lml4F0sLxeeF9d2Qv+OdgkxT9poeLoep5XP6Sy/ugYTMFOH2K8V/SsoqHrlWR/KaOg1ZO5M/A5OjeLta4dHN5uNHZ6OjXwmsKIOSLBNBEDHHWDNuAJe8ssiA2qzag2ajhraHYrD0cOK6olDicXPXX8beLh/yuXp9OsaQSXLS2MSqkcRLkhm3VOr6fJGwLfYJ0jL8LGsuUG7L/LhAaeu62i/2lQPorlFrts5wBUavHwmjttnPqJ9welb33KrTfePygFJVuiObq8RQX+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIpbdC/smAjZYVq/0JHQCf1bAZ2ebR7IQc5M/VNRTUk=;
 b=lk1dyr1TUI8w1lN8tTeSej7286QbbJKys5MSBW3T+YLYNtjJLY5+dh7sYAYIuTM7U2CO4EWGHCEc1/kse2khvksvarlVpLJzAGMicfnxLrMa2s8hOZUBuPY2fQkE1fseaJOVo/037kb0AVnXxYJctV21p/YjmNDaNIucveiv+07ePT5YgBK0FDyZXHt5OYf+IOhOb7QcHjgTeZM+QFMAMQYBr0kxriKapweUCHpHz0+17oOIFQZ2ZDYVLRmTW3NiHctHdBVXDzT4FAHNAk5DbgjNsR733dOgx5CN70bJQoJgVE1vpwQQufzU+GsBi4Jusx6/M/8YTte4GYXCFt4uOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1795.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:58:35 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:58:34 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/4] package/at-spi2-core: switch to https download
Thread-Index: AQHZJCllkZyxa/GDg028lfcUXNXWgw==
Date: Mon, 9 Jan 2023 12:58:34 +0000
Message-ID: <VI1P190MB0493C09AEE44D73D081F39059FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1795:EE_
x-ms-office365-filtering-correlation-id: d2c4bd9e-2415-4cb3-85a8-08daf24137a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b12JFt/saojym2aeb5mjvC5Vj8OGVuPTE3G5qOWJhvJQChFRv2HNIHZlKNXEWSD6TZdh9FQvI5fA5F2Bq9aj0/3QngZdQPO2GjIAdRq5FCZxTX3uM0Vhmt3yMWNGa+GNqz5mxjtp8pT7k98ekEI+AM8o5/kJPK+RnLDvqagpiQVMg0BUv8lN2nCKjwnVPgl1+E0vU9ITrgkOimiseFXLDxcUatNT1aPGnPCsEaPBj2x3ERONbNnnPF9HElLajH5zHbPBplN91bkAwL1EV28UwiLLfCJ7lolh/0a6SLQo+zkUjR/Z8BGDAzYYLQuxxbgeNJzVLv7zND2PEvUBMo9b1Wk6O+KT1ezBJ0mRbb9shsI1V+LnLDxg25WUk4UIePFZ9q8VcnxjPpVa9bfVawdRFrkd/Vy6L0hS6sTvqbrSglaLMUxjQHwbjko9hVqGKtCUZVzywa4734nGYXD+8DSXsadwO/oO2IhevYlgE9Q/txxnoDkHyTkWc9KzLzrA+QH6E7jf3zjdB9M9AZRN+iKtijYtB3iHUM8IjEMDN3+mILXTBOuiDMPdWdWXiZvVCXvP99WZHtCTFoIVrvxpgTL4hmAnmPhyh5UpVh9oaT1UoqAaYffuC0qsUjDuXLle60GIDPJ4AEFy6boTieZron9ZaAhDjx9p6aajNHxjgjlBFsw5LhApXGks+yWh/PGo/1BPExLbtAaasvO0qTpMZjcgqGfq+fFVj833KgkffV69RO4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(451199015)(5660300002)(8936002)(52536014)(41300700001)(6916009)(2906002)(83380400001)(38070700005)(66556008)(66476007)(76116006)(66946007)(8676002)(66446008)(64756008)(4326008)(316002)(33656002)(71200400001)(7696005)(26005)(9686003)(186003)(478600001)(966005)(6506007)(86362001)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zzNw/vnzC1JgyHmsaurgFzxVjP/hUxW/73Lezbe+p98OTknxsAqZxaN5m3?=
 =?iso-8859-1?Q?eQkO4wJT0cauQ7I8X/x5k8Wk35TDREWV/klHu8UUKmaODvRF8c5onWXNM0?=
 =?iso-8859-1?Q?VpYhnsKzC6ryxjGDy8osX37JWWB7Drzp0luL1QPaXSo4ej3oXU/MZuG0wj?=
 =?iso-8859-1?Q?bhKwJZLSdPWqE8KXH0LTsvwIt3qF5Jc9wl51iLPn22x2gjk8eP8dXZGMyy?=
 =?iso-8859-1?Q?Sg6/wwXrmQGTwCic0uFZcqIrB1V4036vDMxcH07YSXK8xcChiuDmwngFb2?=
 =?iso-8859-1?Q?AMbS51rD9Htgd1Ik7wHq0EGqd07pHXCley6BMvxnNTIg4rgV6umHVV5yKC?=
 =?iso-8859-1?Q?GOIYk8F90qzTB95DsvqI2dKrjzVoFKWDX2WPpFZNa4bglcibkh1MWTZyBx?=
 =?iso-8859-1?Q?YSqo2heCaCjO8zcwbcFGigMDjeXUWxKW5mvpsDbx69GFaI0PZ59iMLfmCz?=
 =?iso-8859-1?Q?NPfRTstnlf3isybaRBSBjTwFh9dohaCjep/Mjv1jt/n2keyXvtW1zAQkME?=
 =?iso-8859-1?Q?Us3AP4v+QUk7H+1C9tinv1Eo1bX3U1H2HAGEqwXvrVL9LJM2IUhbNfmCUq?=
 =?iso-8859-1?Q?F+rGLk36+oleGh4fG+eKmJR7FgwcCgS7DtYh2sYrLWvRAMKQkaHEz9/++Q?=
 =?iso-8859-1?Q?1HdzKHHskChm3KREPD3MZi7w2gQKpT/+DoOoAMrfKDnu5/Nal9ICoYKpeD?=
 =?iso-8859-1?Q?97ah8XwvM0lCBrKJgvB30NSJPwqIMiwtIWxkq7Ef3LXOUShDvxh0tk9Wh/?=
 =?iso-8859-1?Q?zkyocHBRhOp40tJhbm9UL+t3DAJfRIdrQKUOOWbb9LMVBLMOp0XlwevhM0?=
 =?iso-8859-1?Q?lQapJnjvJ7LpT1wXFYq+yQU26bG2/9qx9j/7pRVG1/MtHLi4xmq8imCgAA?=
 =?iso-8859-1?Q?Z/y05vy2HGGQZ/4Ktttqfzw+T+UrQkkXkiyVKAj0f+uVb6i/i4XfK41bGM?=
 =?iso-8859-1?Q?2JISSeUivYMVaxbm9aQdI/uMs9HtsfvnlXK2UpKLLFcT18l5O9w8LRk/bw?=
 =?iso-8859-1?Q?ynsEXVDgSehbjPjiT9X6YDsoXaxVRJSuRafNMvI5/xoM3Qq1sxISj1jF7G?=
 =?iso-8859-1?Q?grNVf2orUUMGhLiOK2C709hi3Idh6EWEuHCPMHLJ4YdLFTTmhAYHpw+uTw?=
 =?iso-8859-1?Q?XfdF5SewNQv/IiHKRToERHsyfnfgjsib55XZD/6hJwiEXAY2a4q3nXUtx+?=
 =?iso-8859-1?Q?6zsuYhWWSSME4L7/nEnIRSbwTDowe545/A00TRyIP0k/7BHHvBIx0k8t0E?=
 =?iso-8859-1?Q?9ynzTXzrPNtJsRAXf8XaHpFdJanKwGvCPAQOUN1Ll+WJCXj/i/Tx+JCtE1?=
 =?iso-8859-1?Q?+Yg3PG0CleEgOHD3nOfyO9u/5zUYSIHdNqaCUfyT6+J91VKqqpIvJQl4ex?=
 =?iso-8859-1?Q?ofdcEOwqhph3L2JJ4a2yTnL4RlsFGgzErXPz65OmPu+mwLmjWGiq5yIrQ+?=
 =?iso-8859-1?Q?eYOCyY03Q/LlefhHjWCBhYnM2UIFDTkoKO4lc0JOu7IVx4eFkOSQFq/N1L?=
 =?iso-8859-1?Q?wiz/BoBwFy675aH0xRzclKmqLDhxhtQE1bOKg4WC6JHXjaJZ8O0cos+kK5?=
 =?iso-8859-1?Q?xk9V+wm2ebmQLP0l6BxlIqG2lc1ahFOuXvTZh4NGwn/XmVJUPx90Ombmj2?=
 =?iso-8859-1?Q?+MEah9RyozJUk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c4bd9e-2415-4cb3-85a8-08daf24137a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 12:58:34.6580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pBkW8QQrVzVYspQ2x5/Qc8gSAQJQL0gTYrGocEOVBNUqLVeARpOdZK4QbmMvA1PNdUSNOHaXM+V11zZO5kRcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIpbdC/smAjZYVq/0JHQCf1bAZ2ebR7IQc5M/VNRTUk=;
 b=Oe1BhSxExfCAcDQ3APcXs3ZOUzSF7M84oEjKtm0ED3R9m01fnr9lvHIaeGiAuUI+dyPqvtqFfToKifuyesZ8Z6eSDr1fzBjETzEhO+/3T1GF7CPp61XYEaFlKLDSKNy3e/KdViNS/MLrOsMQwANi9TIzMwykwsUdPAm+5HzFynk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Oe1BhSxE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/4] package/at-spi2-core: switch to https
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/at-spi2-core/at-spi2-core.hash | 2 +-
 package/at-spi2-core/at-spi2-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index e2cc403e71..764e4c3661 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
+# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
 sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
 
 # locally calculated
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index cf7fdd297c..f0b019c0ed 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -7,7 +7,7 @@
 AT_SPI2_CORE_VERSION_MAJOR = 2.36
 AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
-AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
+AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
