Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2E6C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082A5610FA;
	Thu, 19 Jan 2023 10:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082A5610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsvazL3mI_5Z; Thu, 19 Jan 2023 10:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C63610F7;
	Thu, 19 Jan 2023 10:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C63610F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3C3C1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F40940438
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F40940438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSzDMDyO6qso for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:16:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C76E40144
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2088.outbound.protection.outlook.com [40.107.15.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C76E40144
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDpcD7FA5FCU0htnpukHVrkquzloUMiCxoH9Ieqp5ETEplND0EQUJt9ZHvw4+xkgn4r4y/7TQee0hmYKmP+ymtR9RYz9B3sLHZd1kSrHdWrov9rvpz18OVQj71QhMvpDSODcv5l9D+n534T5AU7IyabnUyFUrvcEzPRN7MseXsT2z7WmKsFsFTUqDBtuvYBAvwGojrD8XwQUeD9VfCyZ9rB8pjLq8aznmNkrsN+eV0v8zZDm9uOcAQqyIO+Q9Cwv++mfgE6pn6J2sT3PVVsOgCbuyRitUZUtpum9uqW2YHZuIQH7vE11oxiOeTR0aq/zDaJ8awjNyXvce6LXVRq/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2hfjyLVNnnqIZAd5mMgdTMI0BYSUrl9OupxtWUTCpk=;
 b=GdHt4jf+6MuXQsk9yGkjKjsfM3e7O+vzCdEjdpBfty8T0VwyBr1TS5rJiIT5TzKaEqzOxqrUdv7VV2A4/goBFCerbYYqXczNIfcyu/kY2bj8j635NoxRDufXUQ2/VvzfRbTJBkk1rXofijbDMdmi7m9yQZjRogRCjfU3dPFTt9jvmVXyUSRh1H1ZcJRFu3cx04Y8h4lRBXgEeYodJICUaCzJ6A6js/azQObC3nt3rUGI29XkB0Z4Jbh8+v+mujt/FNyjLFserxX1Ly48Xb6dACjZij2LSJfqKnY+jiZv8XSHrZ5SK7yoKW+DJ9BvZXIjNZLOT/Fc1dQ5FjL56Om1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS4P190MB1806.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:16:26 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:16:26 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 41/45] package/pango: switch to https download
Thread-Index: AQHZK+5WAycs5uKZU0e5Y7QzboQdIA==
Date: Thu, 19 Jan 2023 10:16:26 +0000
Message-ID: <VI1P190MB04935BC0D65B0167E3AB3AE49FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS4P190MB1806:EE_
x-ms-office365-filtering-correlation-id: 34c84383-db7d-4508-0f88-08dafa06394f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r4yq4TCUeNaTQ8anF45OPbyorjrCF+i4f6yrtbdQhZ6BkZpErO69kP5Qc0myVh9XzjXZA/i6ltqVaQ1PaTR7NuDDmET9cR+Z4SMn4ORpZ9/70WkUbOg6+rIdUsH4lzR4qsnjIqkvC6kyAtdHT+yLcFm1g8RdiX+5en7ZzVPPM8X5QhD+B3hHBFTubye5GPVv3vHiHMb4CCJ/b17SjuOY09bKiwfV8+EJkhKN0VgjVWugjvYr3bM9plq23/hjN/PFH1z5RWqQqenki0IFKXIDWTV+qYasg1cIGI8Lqhdtaux4wQJZXRuKzU8E0nPe2AsS5+TfTNerP8DvpIHpi+EdHydYhfI7MpLixhDc0CGUgEzZS4PNuXmC5gpyUSlULwVH2BrVwnqDjcC7HVQk4LBz+1kyCSbSsVeIcLYwmF3ZLDmwJ5mi/vf15JTpWycqMRqIpfMul16CoUCAo0uwk7GVNXSCuwY4XH9/HvtkxSaP2IKS/nb3tqLz2uDHyW0I2eKNtuGKYHg5i/W5eaoydGsV6cFYYHzOxLoa7RPtHjLe9oBMOT0Nu+dPUelendIzsCgvq0zeUm2eAuA+USX3p8mE4kIxRgT/vtOgErGLv0NFyxPIeVAys863GhinwWhIhJcqJdU75f/i7WjpQMIwlq8pWfQEVSEVWiuHHL4YoDmpEHGa6Rlu/4r0Z9liPKfFS+lU6UrsRzOuWoF77xkLYcvMurki8HbZSaw+pccbNr7AIM0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(451199015)(86362001)(38070700005)(5660300002)(41300700001)(8936002)(52536014)(38100700002)(122000001)(33656002)(966005)(478600001)(7696005)(71200400001)(83380400001)(6506007)(9686003)(186003)(26005)(8676002)(6916009)(316002)(64756008)(66556008)(66476007)(76116006)(66946007)(66446008)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?E1uz4IbLjLYv4L3NQp2rq8QaDx6klWn5R71w5bCw3gkHLxM8r3qqQZ8z+O?=
 =?iso-8859-1?Q?3Qtl77ZEMUtZrJaNtR6bB//0RL3fbbh3uZxjsDIeILaFcGinCifhLLGYRR?=
 =?iso-8859-1?Q?CTkfP9EK8iBQ9Z7UOzeGIPwAA5Zy9u/bAEuUPZqGk78qgDWzHEBxiLkE+J?=
 =?iso-8859-1?Q?7ppWAsIf2NaIXGB25cA8Q4jzWB8STctK0t38ruP19Oorshjz9wpw4Y1y4P?=
 =?iso-8859-1?Q?JYkmZPvqox5QwdY46Wo2z3ImvEy4Vge8XOlfqABlmt/E4Df8ykR2+M2XLu?=
 =?iso-8859-1?Q?t1gkGYEXfHgnRfbbEOhhAeYpRrf1zmOnrT09+D7WGV99HivDEJTXRfUMm9?=
 =?iso-8859-1?Q?B0g/iR+kiRd/EQRmLSpn0IFnrD/NF3VZsfsv7V7vBkQH5y1IcwlPYN1Iij?=
 =?iso-8859-1?Q?jdX9WF6WTeST/v4zhfVe00TBD6nG/xj7InGy1rW4jFIUm+fPvCAdLQZT69?=
 =?iso-8859-1?Q?G4Ke2HOgeuDECOSpj7gp/62o9IVy8oCBcpsKjJeE6k8u3J/1G7jASnsuX0?=
 =?iso-8859-1?Q?CMazuSUc9+lYD5VRXhh+Wx19B/TCwsD3sU7C8RMkOMTR1fUHtOnkx4XkT/?=
 =?iso-8859-1?Q?xQ0uZpNERKX+1atyOOW//mTVxpkZ93QTnkX/Tj1zuayv4JDJvksAYb+Z0E?=
 =?iso-8859-1?Q?pmNJtEqxsu6nmyLhXZ42wujkYbzITRy5LiiDiMpIFlMQ1SEYrqOtdD1Fpe?=
 =?iso-8859-1?Q?u/WAJtP8eHYK/b7i87ffplh5HNX61m0dA3gZE3BYnBKg3/KLAE4JY4VTVj?=
 =?iso-8859-1?Q?1YVJbTTj8MOAlCy+13goJtKa3rfv4oVGXXj8BPnqX4HxKkZ16Ue0tJ8k/A?=
 =?iso-8859-1?Q?ZE9yhc4NUhuWKvI2TaKfyXLWXWOwXUVdfxwtTWIYPD0WWtWf/OfDk2Vk9u?=
 =?iso-8859-1?Q?0Z1JPV9OQxdFB8bHfTmnCm1AOeC2xzHZYVKD8geMGIJOo3a7Em6HVVXJZA?=
 =?iso-8859-1?Q?xUNXiNUHyAIqANi5EZ36USLrOF5MGzPM7W2HSYWCFTr07vuBIEZxKVLD/L?=
 =?iso-8859-1?Q?XTQsg2qZcY15aCvJy/ZBsfhelvNimse/XhJTMRBWJFLN2rua80ELfyUOne?=
 =?iso-8859-1?Q?1BGJOBfWGxACynpUsCPpjKsKBO4nfxl+bskZ6x3qJ0i2TiD+o2VlQCyBAL?=
 =?iso-8859-1?Q?qXkvuwRUiE0xzbtNTKtSi2n8JRusN00xBB7yKkApk3yRXQuif9pvGKPTG2?=
 =?iso-8859-1?Q?TOUQMpGFq88RThmQ4gfhv5KBNYvIxDur4gXDU7fpbd6OrgC5bLU8Jn0vpo?=
 =?iso-8859-1?Q?jik6D+OVWdZx5tYc2mQ/qbJNTmJmPUA5uUBqZheYVRxZIWSv4RJK71D7n/?=
 =?iso-8859-1?Q?JA8bfQIfCt8QuRcVwEYnaYsvWz78NHuO838uiFcjNzNXp3NihU2q1Kt/k9?=
 =?iso-8859-1?Q?gndJAb06GuSQyr57tqh/T12ubxNn9x9nC/L6ZF5IygGkAMD0Pg9nlSfKo5?=
 =?iso-8859-1?Q?Z8ST04SGks2kUsFJZdaOzaHnANIZujTijL8dCIx1wuci02+xH/pZlLYWIR?=
 =?iso-8859-1?Q?W+n8jnrrUTHcepKqb/mixFfsk+LeTAtLXJQUXN2nBLGWK3C2+1WrwhTxEo?=
 =?iso-8859-1?Q?N4lR4ZtbDtBlx15R2zDV9yVSWkiajI51PdfNrBOUG0KcNInvT9LGn3eXr2?=
 =?iso-8859-1?Q?/UcLLIlPZ6NS8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c84383-db7d-4508-0f88-08dafa06394f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:16:26.4264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mGSoGLtR3rb8DnB7n05Dst0GM0aHQ6Sj1hEWubkDtOJtXGsd6D7MW82WLpBrogfWDG4ebYZOEgIM+94crVY/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P190MB1806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2hfjyLVNnnqIZAd5mMgdTMI0BYSUrl9OupxtWUTCpk=;
 b=FrpJU+5o4242B4PoXH6jTGfEhCUlFVZ+DyJUuM/hppEMi9sUJHU12GDYczbv5XjobNxrhHIXvIIJeL4eOwh3tPsDyy+vpFl5EU6tQXDc4FHZ6imtiF+bchZ9pWw1IkL52DyiPBb0ucidX93ZBiBLJSCUFj1PVyQX4Fc3oNQmPZA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=FrpJU+5o
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 41/45] package/pango: switch to https download
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
 package/pango/pango.hash | 2 +-
 package/pango/pango.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 60a6809ab5..1dbc5c9197 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,4 +1,4 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.12.sha256sum
+# From https://download.gnome.org/sources/pango/1.50/pango-1.50.12.sha256sum
 sha256  caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3  pango-1.50.12.tar.xz
 
 # Locally computed
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 698894d0c8..f19faf0502 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -7,7 +7,7 @@
 PANGO_VERSION_MAJOR = 1.50
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
-PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
+PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
