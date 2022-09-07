Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4AC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 08:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BD081985;
	Wed,  7 Sep 2022 08:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BD081985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmiWiqwW5rSz; Wed,  7 Sep 2022 08:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E078194A;
	Wed,  7 Sep 2022 08:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E078194A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEC651BF325
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 08:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F024607CA
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 08:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F024607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-ttb0IyUINt for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 08:35:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75BAC605E9
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75BAC605E9
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 08:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTSY0DDoNayfeaKLDo3AS01lsVDujhkvV/86q5w5aO9DP4x9EXy3gKXsdVPda56+ha8kPrLDEAmg544oF2VY5kBw7ulw+VVHAUMrYDR25h92Yik1SI9xRsYPKOhLZH42B6EsJVvko7iFhdF5UDG3r+CGX8haSj06Pb8X+PcWV4JLYkRTOlSEMK3IAMGWfb1X9+5oFClN8A6hLbOkDfo3qr3MyO5VG6V/xNtLjfQWH97FW77LanWvro9lR9QKlFtMpGV8JuuCvmsh3wT+dyrWmRIgaRJa7WPUE98WLu7y1/zOwhxL3RDawz8t15xqVw2R8Kf+YN7j+hYuvjxslJC2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ8f5/GMVE8xnRnfLDMgDu9mRmUsFyTVU2w3XJCENnQ=;
 b=EFhjgiRh25NvsRgYm2tcDtvAvsCRZd5yuudqXlMXkHGtjQhARqUqtSxr7d1+5IwlQqy8JvO+frr0KJe+5SJCnRYfJ05JCh++1OVGmxsRO/mEYqclPgpwIlW6ps1yhUP3PdWh9effbs4Hz4J6fjAEbprIVugKM9lxZ7kjy2OsnGJNF7fSghG+RpMfXxqCIydD84GZEu7zeacyMhG4LLj1nQMFp6tJs5tuWT0TLSlXp5Xhc8WX6xqwpsqFuWTBq6F4BYdFFxW1CF7HXfCkdTyeW7JSMM6KhZDLRC4WTnCWxOUzZ2i0ThsCoHzx85ZckdUH4DJwvtogEgyzVyaQQ9O4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0989.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 08:35:26 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 08:35:26 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH-next 1/1] package/libsigc: bump to version 3.2.0
Thread-Index: AQHYwpSSnutiniyvGkOTK21dLZ83HQ==
Date: Wed, 7 Sep 2022 08:35:26 +0000
Message-ID: <VI1P190MB04937082630EA11FF5512A089F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0989:EE_
x-ms-office365-filtering-correlation-id: 0bff16dd-49e6-42ea-98d7-08da90abea0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5GwIKqm7UvUVTDnj4gHSj3Djho2Sz7NYKzRIASiHLqjqwrwuUNBsobZ1t+m2o5PGVEdtDOdX2KuWZEK4kdADsNnX9kW8SIkcVg7T63C2WpFt3JNr7mcHwCQJKDMW2zr7XmeS8FBgA0BgDE8tnSzZo2rKqdWlt9RmTcZUaNk/+4Vw0ra2F1ZuBlp2EIw7CVidZHw2rDXyJ341rNUYZ6YBEhH4AsX4ykRG3t1JQatPyYR8UCmYZcyhir5wz6eJkhvTbM3YMqM9v7eLiOdw6Wk26eJS6dHwNPZQ62F/dGzxuYYqw4e2i5waP3+Z5haVePuFDxXZbXfkViyJ1u15USjpfekmm999svAp41FPFweUHmgC3SAzEEILOdqnjGH7idxY2I619BotybfycGm8pxuYlWbBjxzChZyUT/f0HRAjN/cZG+9JbwbSIpdVXUmOdxDxpya+LexHD0fIIP3T7IoQGzEFNz8D8i16o7fpJmbzgemqqjrTzgOD8J8+dYp8ncFPsy/Hzcp7Mc3rjno2wbXYpxFsQENGgkz+gdsRO9bF8DulhV7nar0wlWH4dB8WvUa+WEg/GK0H4LMGam+/g/oXlZsgUFuVcc5ElJhaQW8krzW5O+w15lAmL/mHrbX9cHABgZxQYgsoFE7ZA1dQgPUNW7fpCSeWqQrTAXXdLSfPa+CVuFLtTC/P2oGuQ+iG8DrxeSnZ0TzSpA3bXJdPqemF3KzAqkY/LgmnE0FG4O4QFsKJSL0MM0JCZl1faKZwu2DgCGdN+sgrpciGCNjOzqzcdInXl5FedJXP0pn3Ig79mI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(186003)(122000001)(8676002)(38070700005)(76116006)(71200400001)(6916009)(66476007)(478600001)(66446008)(66556008)(64756008)(316002)(966005)(83380400001)(66946007)(2906002)(9686003)(26005)(52536014)(8936002)(41300700001)(33656002)(38100700002)(5660300002)(55016003)(7696005)(6506007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RANJve2EX9al3LBL+QXVkvNXpYd/EYztegGrDIu7Hk9/G0tDtHIMIANOPF?=
 =?iso-8859-1?Q?Nq1U/0APlABDur1Igh30QCncInloTmhIDvGtUwVy+AHqNHwmvJq8VFNV+a?=
 =?iso-8859-1?Q?5U20w39E/YYBVHYLFmtWAioTgZD1rPBt1S5WSOrB9jKM7HSiknU2qgoc6E?=
 =?iso-8859-1?Q?DdpKRGYBC/CDq0JpzwITO99HaMDmcghyo0aLTB+QpnXOUNcHCCcZG2iDG0?=
 =?iso-8859-1?Q?G2USsG4nSvA2tBu1OdFJO3YH/Kke4/kMEQhC7uGyZZkEzWRL4pwfAqG3xg?=
 =?iso-8859-1?Q?ELBZqDnn1k0PLTdtB63KZ+fDEUje/CCMHpivgh5GsL6N29MuH6CSXGFdfG?=
 =?iso-8859-1?Q?kSI4H8a6+td+rCi6rE4ZTPMqtDj9WpBlimFVJGEDLdby/0k0SKHyQxZGEV?=
 =?iso-8859-1?Q?xUX7f/CJBuikTr4aP/u/GALjuodGm0n6Fva71eTs/syLc1+qvDF1E4IPqa?=
 =?iso-8859-1?Q?ecjXaFsYFRcldWuEQdVkNeOM689Twa9nVyeWlhu/Kxt5Vd0pWr5Tf87RHj?=
 =?iso-8859-1?Q?cJi5gHTVtsbvkET7WPUMDVwuMmTMfA84kaF6wgQ9erQmvPRTQhp36cfzA2?=
 =?iso-8859-1?Q?UA1eNgSSUaiElfENdq/1oZ7RtGtPPdvytoQk3cHVrxtK3RSJBUKRKilKSd?=
 =?iso-8859-1?Q?MinxbuezGQ4AZEwpXdryv25VpaiowQFlrh3W20qQeNqMSplKukta3hn2bS?=
 =?iso-8859-1?Q?S+uv9J0iA72+eLGau2M3hNR/v+ohh+Pn0V/nVfRguU4ODkc/gjDg0OTZen?=
 =?iso-8859-1?Q?yuwiYO0G+ifiSo0YsLk1gM5IUCAs0yyj6lbF6d/06ktt4+3o6s9+L/60aH?=
 =?iso-8859-1?Q?oxfebbOSQnjgdriZmqfNd6Xto+d8hRRx/loYiiCPVKBpQHuspSPnmm8LTQ?=
 =?iso-8859-1?Q?C6PYW1uXB90DYukOAgjwhzmM+Tp3HhMEAIcRUVZGP2Owdo0JGbh7iuaaZs?=
 =?iso-8859-1?Q?P1/YypaZ5/OWWkCA3sKlSgsIr6C1TbuKv5HDFxl/4zuSlUOw/lSDBkCIqh?=
 =?iso-8859-1?Q?n60MdqnileD1k8h/wFhHlAwO0JObCffih/LA5ETdkpdraU1hvjWUWgMXfA?=
 =?iso-8859-1?Q?wbxI3JZv4kNtqnTPa+NyQ7YfiuC7Tq3k8vE9W53ujRKhZHkBrIzVDe2Rsg?=
 =?iso-8859-1?Q?UOhisugFxRxyPlveDRaXWoQ32BFJ49UYZj7TFv+9ruIiY1hEkYStI2MjDo?=
 =?iso-8859-1?Q?nLObUgllrVNbneMcalHHbFQCoO7+bkUYLJZmTjEgG8BxYJC5Ol8yI4NxZH?=
 =?iso-8859-1?Q?AXPXwnT6helYrceLt9gmgTR6rl24MitlLpIoyHBLll6inm7iUXH5xw+50/?=
 =?iso-8859-1?Q?TnOJ0xXk+DZZB6QJrZk1kZO+FSx9Wbob3vyRWIO8wcdQuxkmyh4yxTdeFL?=
 =?iso-8859-1?Q?Sx8PTPVQDp+gBgsom3KpZdLn2Iv8i+3/qD7l0/JAtSkF6us4q/QkZhferB?=
 =?iso-8859-1?Q?wmhOodI59520Pur9XgSVv1qcW19ZPkf0lipVd4oM8DjMDCd2KdC4Nia7Xt?=
 =?iso-8859-1?Q?NnHzyuDBSBRcpcEQGCkfRfgy5xNJvOH48YlephJAXL0/pVWnup+Oj8Hse/?=
 =?iso-8859-1?Q?X2AaxqSQiTwW/hmq4rF43UcnjInSaLOqs2s2Qh6s/KnwnCyRJjyBAPbA1U?=
 =?iso-8859-1?Q?dxYlBCnNbNrII=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bff16dd-49e6-42ea-98d7-08da90abea0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 08:35:26.6444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+aP1oiQRrFlXD4rFaKrpEeFl+JC5GuVfFgmU3vUrYvpnhcOLEd6sHSzRJ98ypgk+3bk6PNgV9HHGw4MYwOurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ8f5/GMVE8xnRnfLDMgDu9mRmUsFyTVU2w3XJCENnQ=;
 b=5jENKgXlLQAIwpV9mNn7DnP9RQRFUL8Kyftl4lnRicM/w6E+zQpi5jwNLP5qVWPkDkw/xnRVunApCjpcu9Q56cXekNADrT8rEbXMecS5A89+X8LizuZDo43QHjdQa6GEMO9fpUJhSxXDTsiNoUL+wPOnK3Qf1xpehWTtjwIg4ps=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=5jENKgXl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH-next 1/1] package/libsigc: bump to version 3.2.0
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

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.2.0/NEWS

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index 97c9d0cc84..046584fc2b 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.7.sha256sum
-sha256  bfbe91c0d094ea6bbc6cbd3909b7d98c6561eea8b6d9c0c25add906a6e83d733  libsigc++-3.0.7.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.2/libsigc++-3.2.0.sha256sum
+sha256  8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651  libsigc++-3.2.0.tar.xz
 
 # Locally calculated
 sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 18be25fd03..eca4111ff6 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 3.0
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).7
+LIBSIGC_VERSION_MAJOR = 3.2
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
