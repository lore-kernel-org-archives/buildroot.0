Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F278C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E50840C8B;
	Thu, 19 Jan 2023 09:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E50840C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3E5o58o0_Dj4; Thu, 19 Jan 2023 09:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BA0F40CB0;
	Thu, 19 Jan 2023 09:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA0F40CB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BB8B1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7152F40C79
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7152F40C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MWej-CthLed for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D4940C69
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2078.outbound.protection.outlook.com [40.107.247.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50D4940C69
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGxrkUkIZua5gZGDoHbGsow8QJd4Sgb+3L1OYwWi3v4jATn52kRQHQ4CzGAc/8Tv/z4stGmmVrqwmvzCif0SO4feR+4yd2IYXLpceBww3GfY+OKDIHW+kIWocFpJsa56iZsJkd2bSebL0yTgr13pA7uYlJTWfTpsisYACbXsRywpKWijaHXv+1POCZAifta5PlHnAmQBPEJIHCDLfM0j2BnwAU33MN8i0yvLhyu4bumVQoSxNkwxSRgd7ACJNxMdMNNOXfokkvfqAZ8jQnf0YkQ3RsysGVimTHQDsKwbwjcdnqKxhSpEy0MsMf/f9m7dmdmmqq9ZNCJ8ZqGYNLuBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJWl5f8JxX56jBG34WcYorkPllY7gwjezBgpBdQvJfA=;
 b=A60Yv7cnUForngdSBUASWLxc5zGnwJdw/9cxYSCSu1q2oXnxeCHCAU5CUZz0Z/zqSqi2XVC12+66LH/ShhEXzndW0SeZbAuU5LT7pUur23jSWpO398lQA/QKxKKcIXtbbgi9FLiTc30f+5gohsZEIoU0dxDAQvtZgAIE8sRhPS1nBwkhzEgtC5fCMJbyiY6LTJYBPmr6od+DL3XRF5a5mH7EkqGmT161bYgw0Q6Ce5Z+x26Zlqbw1/B+bu8bGgnY4mP3GJFtvKWIM+J6yRK7ly/k3ek9X1iDHb8DqXGyoRA0Xtp5M2vs7NqEeHlai9F/Cj6xTJ1im2zh/0fbzIuSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0793.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:54:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:54:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 09/45] package/glibmm: switch to https download
Thread-Index: AQHZK+rE0cjzL3asJ0iomkRNqGmgfw==
Date: Thu, 19 Jan 2023 09:54:02 +0000
Message-ID: <VI1P190MB0493696AF9E0B519C94FDACE9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0793:EE_
x-ms-office365-filtering-correlation-id: 5531b4f6-8d84-4a9f-1fa8-08dafa031830
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /sn0J4AA1vJeV4mAu9iarSt4zpyc1pS+7B8lQRWzr8fmRN5XYDMHNlxHp4bLi0S42y2m2vngt/pkemqf2r8jNgPrXBzbwbjWVhbjX7RsVsu3W3XddYZEmkznQN+Nv8jXNZtcxIKyZJM7XIjFn3r63tHEH1KuOGpLmT38bO7sjpIgPYB6KjYu66EwB0LPJe9wlAi2wt+1q/i7UKBIWfM2Un83F73MlmMY2XWqql1jn+K4++iChoTuqSB/MmRWyvvKRE9WwayxmfRts/LpXi1Q+TyFaWnmrSWGYN89lAj53IsavgQkhonMEqUiZ/xsKGROcPaOqKsnKC8feyTZ0mu8LOTHUcPsb6SqqQ+EZI616rR3A9HlU0Fit/j/8O+O5PADST6IvpkBHO334ar8mYc44vOtfqczd8ZEQzgSeO+/rUlkoOT7mw+2mEEIx8KwqPofJrQlKAmI/VkZwjZEZE2v82Prl8ly3mW7Hk3P2Gl/9XZggsZulG/1vxOHTEPMA130c5DELJZC074X/Cs2MHvhPx5TeeXIUNptxRPdIACWCBKDDehc6TbQfkdYoDsVP+xXWT6keMF1ZA9FQx0uH4A0hLcenjIitHKqCaQXHd2XgNvfAmezKHgbZBJOEpIDa97/2Nnb9lZnCNwCaV//onrD7rPqbqyEMTECKngJco+iNOCmZyoYOzBH1kFjAM4Ean9cyZTlqyBSTcbnAllRGDDM+muNRxXlbSoawvc4Ok1/bzQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39840400004)(366004)(451199015)(38100700002)(122000001)(33656002)(38070700005)(86362001)(8936002)(52536014)(41300700001)(5660300002)(316002)(66446008)(76116006)(66946007)(66476007)(64756008)(66556008)(8676002)(6916009)(4326008)(2906002)(55016003)(83380400001)(71200400001)(966005)(478600001)(7696005)(26005)(6506007)(9686003)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7PEp6M2zHkLDb2je78WNUzZ7fjB419+FDAhAPMZ96FxcQX/VmWqLMQdi5M?=
 =?iso-8859-1?Q?Ym/QB3niyJjAF1JZojNh4iC+NBdiAGUS9hJ3b9fYGGUQnb4fT1Dy+dPEvG?=
 =?iso-8859-1?Q?9Pj0920c9gSQ1L3jO3iCfnjaI4LLZOxBiyNr1EZltjmjq+ad/rEgwFg2aM?=
 =?iso-8859-1?Q?vSF768Prh6cKSYK/6OxBxWd0cZFCUflveGoKBFKoqIbMv0yeEkhMW2AwbR?=
 =?iso-8859-1?Q?HZogzyMWwdhI/fZKzMc4oyYUjk7Ny8r2BfufebFaa29bQ0b7kEKTvrbSnR?=
 =?iso-8859-1?Q?kR7uRlJUXYg2B6sZtKo4DwklcsmjwGmU+fkKS/OMe08m5kV31bf8vnh8Lx?=
 =?iso-8859-1?Q?se5AOYm5IYleVhZbLWrwbmzW3bw33+AOwO651aYHmrk8cKJ17Nqpzvurx9?=
 =?iso-8859-1?Q?DRWYcgBCg1dLK0b17/EyRo8NeywMNWNUJze9yoCPw9Axn8bKfEK1CUBR/8?=
 =?iso-8859-1?Q?wdcN8VuAfjVBq0hb2128fuw909lDiKEX6P6VMp0VCDmKm5ciR1Y6Fp3XCF?=
 =?iso-8859-1?Q?4e1FWNgxTDttMLEaO3Ovydf4O6tvKeDpGNUzsdY6sVuEY32ysrYZFIvJJL?=
 =?iso-8859-1?Q?k0yHuS/gpQpQKoLUDwsRl/Noco7IMZ9GZnR5K8C2DV1Y8PYnXqtzbkk6rp?=
 =?iso-8859-1?Q?1YOKolKi1SAL73CzybZAXl4TIdqCUNI/9WSInl9gXb2DFxo+lhoxgEP2wX?=
 =?iso-8859-1?Q?qKJ5iNhmwBoc/IcOvLDacWw4HeO0de3X/TiAcMOVBM5OzI2HOxA8btumqY?=
 =?iso-8859-1?Q?gRhkc74ofGkvi8qhxHNj//YgO8EeisVw/FyiyeBKBNhCpZ9CabSJeD7OX+?=
 =?iso-8859-1?Q?rxV4Pa8Sr3BfhLZtBfCO3UL+XJDbTHCCuG+XqBD1rhmzddzZJB9K/S/dvW?=
 =?iso-8859-1?Q?/HPnASEK3ED3QMt9GBAofpv5LUOUDtNWUHp31PZHohfW140n4LysSIJuLp?=
 =?iso-8859-1?Q?NskdOO9Pe0J9VGH8QqoeshUQhxnbG9uDUzt+Adwg7BqJP8tRhE+LcIZUOa?=
 =?iso-8859-1?Q?SU5Wt5FzvoOI9BmJQJhXXuBkN5DY8HsKBI6BEi6yyoVrAXF9mXNab8rkH+?=
 =?iso-8859-1?Q?MXvZj51XFoOoBA4OwAweYHNDXCCKxGR0qDqmg/99FbBhRZWZ1YbQgD+J+e?=
 =?iso-8859-1?Q?uQya6Esu1/t+cTTBmd6FAykXybTI38hPGl080ajSNRLSi0xOtj+K79cEMF?=
 =?iso-8859-1?Q?67wUAgwxmdgroRoqTAfN8S9/6BLIl7UkI3or5BDBs3Ht33xB4Sew2/rDjr?=
 =?iso-8859-1?Q?KDhjIPGxtrV4a61Wx4JFxsaDPTB3ZmIP25o7L+Jx3w624DkN6XwqEMh/8L?=
 =?iso-8859-1?Q?T6hlG/J7Wr+ttPq76OSQiwTQxTC6yd3qCNhFJgoz90UcsC6ZZAVIDMFE6D?=
 =?iso-8859-1?Q?7CxCaZJVbyAaEiddgA3vttGULGTHb9UlPNTrU624J5qnAUXDR+gITaVpK6?=
 =?iso-8859-1?Q?Q3KwgHJG/t5uRqCdcsjhWR3qgaCnKcSD6djmnSy3YjC2pNP/R4A/Jlfpzm?=
 =?iso-8859-1?Q?z97Dster8+tqWUC9+w4TBfAtnpIDGA+daj9X5SGkhLsgB4RnBsQdaBiCAH?=
 =?iso-8859-1?Q?ZVzqSfOeucmhfy5nbZOCILKRrG65luymWh5MZz4EFEmDGhAX0hkJ1ogyMs?=
 =?iso-8859-1?Q?+xo6QzgC7MCHY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5531b4f6-8d84-4a9f-1fa8-08dafa031830
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:54:02.3686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrKVGpF6zR8vnGveJHOFQsJ+f1y/k/PlLuQGa1A0W+4uD8UDprDkbPxHNa9HrAno7TCa2ijkVALoSl1AYdjmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJWl5f8JxX56jBG34WcYorkPllY7gwjezBgpBdQvJfA=;
 b=WPUxnJ5nMBcg9EWvvHGFD2dj6g3XlB/9IejvpInkA1PTgjCFS6rQVGMoGHzS3yd9r8KoPkG8qAYPaUk4GCSmU0zzvPpcP2WCQK74GUYJlmGXUxTJQwUQBynv+vZoKOmQl+9YbH0mQoyOeQ9vW8LELE86EAEik25ZoR3Vm18TC2s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=WPUxnJ5n
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 09/45] package/glibmm: switch to https download
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
=A0package/glibmm/glibmm.hash | 2 +-
=A0package/glibmm/glibmm.mk =A0 | 2 +-
=A02 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index f0bc7f4e71..ea256c3add 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.68/glibmm-2.68.2.sh=
a256sum
+# From https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.sha256=
sum
=A0sha256 =A091e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8=
ad =A0glibmm-2.68.2.tar.xz
=A0# License files, locally calculated
=A0sha256 =A03ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60=
e7 =A0COPYING
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 525da6b618..7f37da8449 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -9,7 +9,7 @@ GLIBMM_VERSION =3D $(GLIBMM_VERSION_MAJOR).2
=A0GLIBMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)
=A0GLIBMM_LICENSE_FILES =3D COPYING COPYING.tools
=A0GLIBMM_SOURCE =3D glibmm-$(GLIBMM_VERSION).tar.xz
-GLIBMM_SITE =3D http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VER=
SION_MAJOR)
+GLIBMM_SITE =3D https://download.gnome.org/sources/glibmm/$(GLIBMM_VERSION=
_MAJOR)
=A0GLIBMM_INSTALL_STAGING =3D YES
=A0GLIBMM_DEPENDENCIES =3D libglib2 libsigc host-pkgconf
=A0GLIBMM_CONF_OPTS =3D -Dbuild-examples=3Dfalse
-- =

2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
