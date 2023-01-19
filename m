Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EB1C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058CA41973;
	Thu, 19 Jan 2023 09:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058CA41973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENZEsZxYqmBE; Thu, 19 Jan 2023 09:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE44A4198B;
	Thu, 19 Jan 2023 09:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE44A4198B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9705B1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7197C4198B
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7197C4198B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ah529b2qqBma for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3749441973
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3749441973
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/n8z9bP9/Zw3NkFIHSCl5SafYKmbQMnnGEBCH2kTZAbaciaO3jebOxzjkJpUHV42n6WWikDr69m9PRJg0X9ViCDXSYRSrJ76KlwMAwp1KcEziissJiliqfUD7asmY8q9EiD56bDA5POj5rgsCj/859MCGk8MscHzOaYQXQddeR/Bfxf3o3BxsAroVr+jfryHWGUFr7duD/b6Ra8Zp9rM1F98NsLyPAdGkWQgRnjDk6//Sr1qcKDsCmSvEN4ZiknaW0KaCOtox/rrq+aHvAJLaCR6RnRI9Cj+pMYde1TV2kFTUOqGR5p9xGHhihy8sx8EXlBEynICOO1XhzmtzYBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpM+ce+N/Q/Ms0/e1QstQrf4prdH6LRNbgAQ/YocIqg=;
 b=Z19kRxtoIZ31zZNKr024OK/bvySANuZpmQ5CTJhMdnzIoyL35dtY1qjKFA3rD2QOS5Ivv3wqgWZAYV1zVTdVW5ZTdL3EVFLZVcCVZfoUW5M6bOa4uQrqSKNhjmM0Wb9L10QvFDabjlkSilMOHV/obPBNiatk2YLh6k/DPZCjROzHD6+qFvwILk/Ypa/mBBdFLx54P/IMwtCtMfV76CQ3oel9y852jCqKxfalvydCMzs5LIJ3HhAU2Pll2GWydnxgwMd/BMx4HctPoX7qyT0EFZw0YCcb5tzJT7D7YJIRub3texTfndB1iGzF5gEqUt3s96wd7G2gZsIi1oXxbmHAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1936.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:521::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 09:52:48 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:52:48 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 07/45] package/gdk-pixbuf-xlib: switch to https download
Thread-Index: AQHZK+pUJGanzHVjOUepobJiKu1JGQ==
Date: Thu, 19 Jan 2023 09:52:48 +0000
Message-ID: <VI1P190MB0493F8F0A0501E972E7F652F9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1936:EE_
x-ms-office365-filtering-correlation-id: f54fa582-1416-4f3d-3854-08dafa02ebdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1IxjTXIyRlioq4B6Br8TzOJZn422ADzviZWw1tQhhjva5FSonhqs5miWeqQFAz/p/KHOAXNIBNWwap2060LBQnDgjWFb4HQSSDdObLvvFAPS5KJvteFxW/v1AkW0bFowYJBSl8uJG4t8rkhvPBNUsuxOSJvr2j357wE8tjiNXuNsXfjsQIdlzmSNf2gLRJStxPKqel48C5d8iMW4T4JVgsS1D5UJ68A5ck9kgyegJiW2Vbfn/lDp2TLS3M53VjOnM1lOcZs33/+uuNTIZDPq4WPVdxug9Mgestxs2Oo8maWRLdK+WXQLwOhXnWBuqTmlnqGBhF+edIACoXPwRopaxi8q5TKPuHTSBD+PIvOnOJwI4iKBh8tbprTHw8k1rTNbAwJrnFt0Na1mKew/ifvsyUPxJBElXhHC/ErSM9u9IhmaFwS6TkZAugON98LzrsipM1gMUnH+7y+Il8uGvQENVPfh3Ml4/lVlQAY37pzQWAtVzdu18Oj+/VopQTLTqCSAkSWPOLDvSzIXoDGycLYCspBDxwlD8Q2V9CHHjksdYByouD4+w/F7WzPTuCJ+N80CQbYB4T2zNYXxU/2lYJ+zvf1e/aqjKP5PXmc6aEcYSnr0siktB4ICU2sXH4m1W6xFyNf8GxALxZbF5vgY2GnA5YMUgLOuvg0wqRJsuiAGFEahdoC5Ot0hyoCoacI1NY1GB10K8/MjOP/E5a4DnAz8vBGq6fgp4KY8m6XqdXc4sQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(376002)(396003)(346002)(136003)(366004)(451199015)(86362001)(83380400001)(33656002)(186003)(966005)(9686003)(71200400001)(7696005)(55016003)(478600001)(38070700005)(38100700002)(8936002)(66946007)(122000001)(6506007)(4326008)(26005)(52536014)(2906002)(64756008)(6916009)(66446008)(76116006)(66476007)(8676002)(66556008)(316002)(41300700001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?odraAg8f7eCpLwSABrxAfmWVGbroOzRednm7Dyztj/bpuZ+wzh1+KmzSQ0?=
 =?iso-8859-1?Q?gP8bSs2SO5qFpQfjy6e0/2X07O0hoeHQfmBHqjSuI7WjvN3cZGDyKaP3DI?=
 =?iso-8859-1?Q?M+PvX1deQHHol4QV1RydegPnIO190rcSvqXGee+x/O8G8QrvPmY6LSCnwR?=
 =?iso-8859-1?Q?kFJ/xzYvhv4xcGfwLpJKjLs2EzANHy0lWd5UqhQ+Eu8/JmPYcJHP1HFALO?=
 =?iso-8859-1?Q?IdTof8Cq5x4XlYMgA1826gq+UJNXOmt18SaQPQflAK2uGgVx1C4AuVyipf?=
 =?iso-8859-1?Q?hfM29jlBrfr8CKAkLWzj5bHMpYYUi3Q635VQyrF+zNIsp5W8zNztQs1CDS?=
 =?iso-8859-1?Q?vide29tPM/jMFsEWlUI0l3X1JfONpSuWzN9n/4c+Ujr/j+Sc23mrPDIei5?=
 =?iso-8859-1?Q?mt8jJeC/sLuEaxDrqB9wGQEz2jbt22NECpTINHEcNnAKdqqWHJHKwIsePR?=
 =?iso-8859-1?Q?8TDVpX0Rzs7PqKbTC3JZi9D7Qf02RpTQclbIGm5l16nmNBmZ9OLtkSY4jB?=
 =?iso-8859-1?Q?vqQ7JT+Cxmbl/48MvXPXKkU8hwr3GEs12asJX9Tv/ccKHfcW1G0H023KRR?=
 =?iso-8859-1?Q?YmQzUvh3wiOihaiuzJXwVaslqbz+NCYnW3BH1RTER9UezP4WdPmNyq+TJ7?=
 =?iso-8859-1?Q?GbdS7EEm/BvnDUQgJUXpvWHAdwi6JV3qLZ7z5TmSjoG1YamU0xuEaa4TfO?=
 =?iso-8859-1?Q?O2GZqHdFIuPbtvIlTFRKhS0jnwofaY0jjfI+0kDPCNoLcsGbV3sbA2ra+4?=
 =?iso-8859-1?Q?eRPIuvkOBq+rjr8ci83HASOdLz0gc8Wkk9vcDfe7MNCnIcVtDKwDp8C54I?=
 =?iso-8859-1?Q?IhsX4MAcDofNRNy2y9nY9ZJjYgpNmutBZEKHXucd+lOvUoH/ieiM/T0eXH?=
 =?iso-8859-1?Q?ZH15mzfLP90bulfhLe3LJqpmd8Hi49hQbK80hB/j7aKjC1xcN5Ic4zAcyQ?=
 =?iso-8859-1?Q?QbTl0x1gy6tRI+BXq0X3+GvOoqGTfVniTU6vmtH4JudBo6Fwu4NrepMg8A?=
 =?iso-8859-1?Q?gsuiLz/se7+TdhUE6CxN+jC9Iw6pEOhQXHM+3YhMUbdvmEE7NpFgUiH29I?=
 =?iso-8859-1?Q?KLvgI36LIudcs5on4OFTUBLfC8G2qmv6KvdLbeMpRzZl3qFzuBku9x4fF3?=
 =?iso-8859-1?Q?4n4lcbEXy0JxaikNScuiEhYbDAFSPe+HlgL9TkhHzQwFcw1DcVwDcwqbUM?=
 =?iso-8859-1?Q?0xTRO8PzahEyRenM+1xpSs4wxXme88PYNwfIceSG7gv5dLKhNhZuPB1W4Z?=
 =?iso-8859-1?Q?3QnO+6ZHerwaBaiSQgZb5SBZc2yZctujcXjwUa23E8x+ARpFxeKgFs39Z6?=
 =?iso-8859-1?Q?1F+xyNY5IZvQCAFOAPYO+QKvadvzOlPmP2h34VLHAUg+Sv+ygzJQ/NVws5?=
 =?iso-8859-1?Q?uFDvNttn6Dvkn6hPWjoeya8GXsAs8cQy+NOdxE9GfoITPMvDlwYVg2eLfH?=
 =?iso-8859-1?Q?+or7zTCB8k3HpI9k52FrbhNc6ife0KXYOPLIWu0jQUCROOtpLX4Rg6m1oY?=
 =?iso-8859-1?Q?3huckws+XdZMjQo4c6XTaQ29eWzXP4XrEMPOlJMEK44cj7o1lL9EGr+2LX?=
 =?iso-8859-1?Q?62nET6pXrSUsfNFQumWoQf1vGCq1HZCdhZMTOt4yunUKyeZ7u2hMQj68nt?=
 =?iso-8859-1?Q?P844r5o81tTHc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f54fa582-1416-4f3d-3854-08dafa02ebdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:52:48.0146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Z9+wIpA3j4c7TMYjpNm+rXkuhOVyBfB/Y/hmnGfCZUrstz3L4Eol7uPB4CYwbL4K6AxaTfNxMQpfS6L/UvUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpM+ce+N/Q/Ms0/e1QstQrf4prdH6LRNbgAQ/YocIqg=;
 b=Gy8HthmAcUjA6ywFkV8otiY813o7So+Pl0vZzFD9APlTPEdTzaYV2xw7VcKFCiaNc7PnBqTT/tsDDYD/dFIlNadbdsKxutUWYSejfJeHYDTwIuw0fMlfo4QNCoo0lxbC2SAkKrwjLYBoSrAyb7HOmyKF9V6CMlwwFHw7QX2d9eo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Gy8HthmA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 07/45] package/gdk-pixbuf-xlib: switch to https
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
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash | 2 +-
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
index e7f74e2b4b..7298ef50c4 100644
--- a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
+# From https://download.gnome.org/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
 sha256  8b8e1c270ec16a06f665ea841f8e4e167eaa0118d0cbfeeade43745f09198ff7  gdk-pixbuf-xlib-2.40.2.tar.xz
 
 # Hash for license file
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
index 3e61373b3a..5af33c6aea 100644
--- a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
@@ -7,7 +7,7 @@
 GDK_PIXBUF_XLIB_VERSION_MAJOR = 2.40
 GDK_PIXBUF_XLIB_VERSION = $(GDK_PIXBUF_XLIB_VERSION_MAJOR).2
 GDK_PIXBUF_XLIB_SOURCE = gdk-pixbuf-xlib-$(GDK_PIXBUF_XLIB_VERSION).tar.xz
-GDK_PIXBUF_XLIB_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
+GDK_PIXBUF_XLIB_SITE = https://download.gnome.org/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
 GDK_PIXBUF_XLIB_LICENSE = LGPL-2.1+
 GDK_PIXBUF_XLIB_LICENSE_FILES = COPYING
 GDK_PIXBUF_XLIB_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
