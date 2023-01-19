Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE648C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737EB419B1;
	Thu, 19 Jan 2023 10:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737EB419B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpIM-FH3hPRU; Thu, 19 Jan 2023 10:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621B5419AA;
	Thu, 19 Jan 2023 10:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621B5419AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE2F11BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961EE40377
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961EE40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UESFBPOI21h7 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:05:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A39F840144
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2071.outbound.protection.outlook.com [40.107.6.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A39F840144
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay/YVprLutXDUTPgIlz6m6YGP65nQJgrrxj84B/rF6wNxf4qfM+TlWroQgOmkkpgRsaPOb8tf9QINqNPaVmESqL/UDRyj5rwXTmNJuO/+clPpkCw1KVDYUI17ZYPKxRVrwhSm1o3Uj14CJGjg8dPcQ+ds978+10Q0cvPCsI3ppowGxNjc/SR0X4SZqiYr9kWxY8DjvzYzSpVYLebyetqDRxLpREDRl9qo1chl2gQ+dhQfRqhWYGPZ4onOadITFkIemzezTSzaXiE9XukhRIa1hWS80wHIJX14A6ja/pw52ItaAcwiKA/aBowo/kzOqTV8Xuay/VA/H8yqSiJ/yfhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg4bpHpgrSF51Di19VLvSxj9QlnSdNisWGa5EfMfcNc=;
 b=IcIbDA4Q4HAwv4XJtuibrsrsBs13uTWC3Z7qVT+nuTdotdqhqIIdTQ8XlpTddPdzOeCMnEBzsEZVwJWrCl8brdFLjR0kHDvzAqUN8jiSo0DA9VxJtWHnhZ/YuzDUGgPMrUiUxxYN563o2uf+6t02umVqFMVbcntoWxNE+g66TX8MhfbwXA+aeOuep96+DXEoRWLKmhnE6SxoxEDNFabrDjuPw5Sb8bjhIvOtCa5eidYU+vXI797OKuQ4VPTOPXx27DL7a8UN4bFdHn1seHg2EBYco2bXgPBn49/d3ZnonBWkv3/3mp4rPxATbl/vi9ze7M/j7EPHkQQelXhsu4ZqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0604.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:05:52 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:05:52 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 22/45] package/json-glib: switch to https download
Thread-Index: AQHZK+yDI6lRSnzc0kGC5K4Tcz5vUQ==
Date: Thu, 19 Jan 2023 10:05:52 +0000
Message-ID: <VI1P190MB04938CD708E874FEA2249C779FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0604:EE_
x-ms-office365-filtering-correlation-id: 8571987d-0163-4d9f-0f4e-08dafa04bf31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Q5j5ZQoJiqEiwtisocBSBQ5HuL7G0aG2b/C74PfHV1K+1A2+OQLhNYiR+zEfTq9LEVvVr2J13b8DUf2wfXi9Chla8EANO/ZQ2xmErdE2y8uNO7KMqw8zWqcvyTMcnxeY1zeZ6wYEXN0luAX+CVWo7c+YIDpvqkyUlYPRh2mKRUHh0an9zRtDTc1x0ja3i5Cc+NZ+CNynqgVsJlrwWcX//U5yPn8q3orGFSxJw+py6ibbuzGHyzeSwE/KxZAtpmqIpb3sB9U+lxocPRPzXCfXacX+i6i05pZimjXJCytEYmQGxyA1X7fK7qYnmXwfIMFk6BcO2r6sZsOmzQ/XhIS7McjXHOciJHbGG3iT4PVfLcHTCNEnpSaGVwawhSt8W5GILL35R+2m1pNIoEv2vo3hvuONcOppqpZ1JonI1wq1Vs9NFHVlQdWtLJqXsG1L7JI/pz2MXARP7Qvwq1zny92yHOpsCH/79vBDsBq14B0U2txbIv+EwplF2/fcRHM7RkLHPQEM/N+Rjod0EaGVThjG3cwAgShwosf0rETMRYAy8gn46Z2ioXcOaZAnqgo2dCCrbu7C/m0NwTB3b5tGKnHUJL5y2kd4Hp8M/x6yZlIHlHE561R/jkydLJ14P0RX0clXty62bNRsJHMVoaxitI5vdi4ASlz3bsLc1mLmdy+Ln96fy4hA3SsCtopmJEn81IShUUluJxVdl3LhDZZlLnKaa76NyvDcipjSC5C6PPIa2E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(366004)(136003)(346002)(376002)(451199015)(8936002)(52536014)(6916009)(5660300002)(41300700001)(66446008)(64756008)(76116006)(66946007)(66476007)(66556008)(2906002)(33656002)(8676002)(7696005)(478600001)(71200400001)(966005)(86362001)(38070700005)(9686003)(26005)(6506007)(186003)(55016003)(316002)(38100700002)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YJ5alinh8TteDr5DQZAQyzHjgLHPLOfedNqMcD05R2N+BxP+ZcCHevoYpl?=
 =?iso-8859-1?Q?IBrl2B3WUfuL7Mlta2p7GLGSqqmlGCyCfHRhB9+rrgsvuKypw1PZdzc/7H?=
 =?iso-8859-1?Q?HhX7a3qN8SAMZquns7WMRYEnMhDEQKwk0jI4ANcv23jvRr6Q2SeSxsil4x?=
 =?iso-8859-1?Q?tlgKctE1tD5m6HjYL8M7dMR31APyRuJZ64G+tOpZOj3siX+HV8JKPrlL19?=
 =?iso-8859-1?Q?xBdWc5zTYwmHkWh+vuCDmIpAoSFHEbOHI/QITFGKa4dMBvy/rjLk0Nuzkh?=
 =?iso-8859-1?Q?fqb6iWwJsGjdKrI6HuSShPvz2xR+qMw6bd5FI9d1EigA4ipnwQUPuB/EiE?=
 =?iso-8859-1?Q?iegDeNHLZ+1L7n0LXgzJS/qf4MWuvaHfE8NZQYyTnGmCUojig5lk4NbrEN?=
 =?iso-8859-1?Q?LTH3eI0MFYjc8sCHj5n0ZVP7T9C9p1FpApV3DldhjRclCLoCDtbb4mTQ2z?=
 =?iso-8859-1?Q?5LG0NKyu+c4NiGdlNmldxY0akTADjiHX0f2J+zs9iAjFZuafTOySD1T+I4?=
 =?iso-8859-1?Q?mXyR2/YfXLEDu3vUq4bajQXWv+uXM80L33N4W9swP1ZfGTycFFKbtdilTn?=
 =?iso-8859-1?Q?hq6PHhRRX9xabw8G7wqqRj4UtzbpSdRazlNHE6wnP5fU6wEwDjne+zgH01?=
 =?iso-8859-1?Q?hxgJlVqycwUAjZfmqTWyoa6MWZeVWzxOsvKRpMBkOAn5KNSnjlrpIWygWx?=
 =?iso-8859-1?Q?RsmmFY89M4r1l9rzFFnWprEhW+bTZqxYg0/oXZvudMjRAnlZRLuzJtVtKU?=
 =?iso-8859-1?Q?hLZN25F+hSTgn04tyIWnjSAj8sKgrp/n7Ck3zESji8OF8rIUe3F8J4AIWe?=
 =?iso-8859-1?Q?3AOo1D2ED0pnJz8sibfa2NkxSqUknP9B1jgiyP+GRIhagpiNkX0oqsDM50?=
 =?iso-8859-1?Q?uBS/vnF1gMM8aD8+w2IjRqw9Yj7TYTd278Qvlrgu7Y7XDQ/B6mhHC87vOG?=
 =?iso-8859-1?Q?qWlrvWLe+OzcF0Mh19JfcIF1w5uhDiyfB1mhCpb9Pdqrhc7v0v08Xlrrlk?=
 =?iso-8859-1?Q?CH5sSyw4d0nA6qUVdoQ/8HBC7gE8y8k3+j8E/Xtx5578BEyq6iYLd9aKi6?=
 =?iso-8859-1?Q?uiplEuiCwkxotLruH75H03DTP2yxrq/o371FiAU2bNXAW82UIBFRNosOlt?=
 =?iso-8859-1?Q?x5mr1llYb9Ih0c4Jo/D+EnLgnrrRqGgdez2TRjuOgqwqPQxUO0cvWR14nU?=
 =?iso-8859-1?Q?HjQONQ6iNZ/VxhC+bULcHz9XSN/cQrmgKBp2w2IzED0Go6j58rjG8f+eOi?=
 =?iso-8859-1?Q?m25RC+361gL9G7EC/vlQspaBDMq1pj7whPDNX7sNXn6akuTAbDEys7E39e?=
 =?iso-8859-1?Q?TmtqKqpekbTqTQnl8MvjfoLolicVtvdUjWuaoKezZpBIZfcZEZ3LVSIXZN?=
 =?iso-8859-1?Q?yUBihupUaQV3dRqus2JU3DVopiXzhecgFLxprFAitqfMjKqMvm6SOVnZHu?=
 =?iso-8859-1?Q?B0HtUlRAtiiHL9ggj73MAHYah9eAVDyDBgBsJqVBJjbklK5ERmUE5B7E/L?=
 =?iso-8859-1?Q?3LwdRbkebFvbzEYKchfOuLJ/cU1wlJHnsoG2zgG5OWrXvffLCCI3ZKy4uE?=
 =?iso-8859-1?Q?KXeoN5rm7ydL7eUNw2jG9Z+jRqUsPMohCAaIhXPVnTD6g5i4946I2KiwuG?=
 =?iso-8859-1?Q?O6ZunCIo3U/AE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8571987d-0163-4d9f-0f4e-08dafa04bf31
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:05:52.0510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6PFKcwH9YibxqqY7YgRVFaOHVv92pU45QxVVR5r1JuHTXfpY6n+r0mF2njh0O+ezrVM1naUhqgOhASoaY7VrAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0604
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gg4bpHpgrSF51Di19VLvSxj9QlnSdNisWGa5EfMfcNc=;
 b=Qu5Ay2RCojRb2PtmHg+WgQlTkDGdjejp4HglU6XSyR3rtQg//pHBlKxxiL4c5RedEKHIqri6AkG7m9P41gjFB9E66YdOEECwC8fJgFclA6Ig8lyj4MT5w+kV2zWik0yg5oR5HXgEB7hIxAA3Cc++76EoyxlNMIt723gNPGIn9FY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Qu5Ay2RC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 22/45] package/json-glib: switch to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/json-glib/json-glib.hash | 2 +-
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 680d404a4b..0c3cf7f7f7 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
+# From https://download.gnome.org/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
 sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
 
 # Hash for license file:
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 52ca47e906..b7ff0bfd57 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -6,7 +6,7 @@
 
 JSON_GLIB_VERSION_MAJOR = 1.6
 JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
-JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
+JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
