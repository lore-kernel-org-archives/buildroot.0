Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3595ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 06:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484CD60AB9;
	Mon, 12 Sep 2022 06:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 484CD60AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMfbHXJsHr1E; Mon, 12 Sep 2022 06:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF0960A8D;
	Mon, 12 Sep 2022 06:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF0960A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 107B41BF4DB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23D260A89
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D23D260A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Lds-9Vh_qfn for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 06:11:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA8561131
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BA8561131
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 06:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekZ+gtIiaXDca57pdqVwKbqmsoC832dvaV97JcwAz2Yt/izPGO85xrMs064yRWZDapTwnU6uY5nNqiYtPBx2lwx6Q9eEe8Bgt9DIc0PMCwIKeuQD9F9+44igoEwwIh4wtB3dbwSY0cVc31C+X7vdjGbtYaricZTYq4a4kb/12sbcYdvN+sxBKI/4ktre8OoMzzTbiFZZQwn1PUnFjH/ws4lG5mwk6BScvu6slllv0HkuOV31neuipnNGdxcNbhf6dOw9JUSa3SZ5ZIcQUjLOFivxDPZf5mkHbLSHBXTFYUPRrvDmopd12jpUIL3nxJAr5XBqsQLdPJhV+Lk7A+cTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu/nq1FsA10J+HCZWBp7/oIqtN+LOZBqg8ZvKlfJMcQ=;
 b=NXtlSqJ/obsdmbuW4vhlh6BDwJdW9lQSQzANuReXRaxO+8Ix9ScVCF4yjlCtFPt9AhVwEjpcoNALEvYBI8AeLoXKTMEsIht2MgqoXaWcVcS4QJ3aGxCwasUbwb+fo3VJP6y52YpXjRlrELRbiY0y3Rh6PnGEB3chiI2iovobzTv1+lnMpvtE8SzTvROLNWJayekCQidZHqimUe+Qc/vBDLzaiemmxvODs+U76Bj9otV4Sbewy17h68NiRbz8etH4fHH1cxQaGKFuBZSkMUjHXZOu+p1S0Xm2czKqDzwSU0RJufwtgmIVhHxLPoFUTcR/5FT73jOv8cLXC41JnZKg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0672.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 06:11:05 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:11:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 4/4] package/polkit: bump to version 121
Thread-Index: AQHYxm41tnWct6UkAUKIcgh27x7pYA==
Date: Mon, 12 Sep 2022 06:11:05 +0000
Message-ID: <VI1P190MB0493923502DA9C7C7BD25EFC9F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0672:EE_
x-ms-office365-filtering-correlation-id: e49d07fa-e560-48b9-650d-08da94859380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T8BXpQxyRILWhKK1pX2JdvKzXAraOJKTG1ZG7sCGEphsyM+HnBgdWrTTnXRvL0xhMrsUUVEt1QBtnHMCKimMTdBR6RGQhBxR8G1rnvgXICaheXnQ1as6fuDW8I6mZL8iyRLb2cAleB0ppW1RvarG2GJztlgO07BHPjA8HJfIysIdvSnAKevuU08aEH4lBQs6cF/GDTKFgMMVoRBssXqNqGfQem3fGw12sP6kMu+FgJJon/UPMeUk4FRfayL10VQ1TV7YP0RWLAoPsqVrOKxPdfjGfudel7ps+OPUSil5oI0QJ5jbmubO/Rl4e6VpQtpeZzlYO3xgYWFE0Xx2Ihhe+H9Ij+cVxRts4zXjyZi1Ury9ZupkQMIftrZrU8xdvRpZitlzgjPL9MvFtFGorSPVL9GZ2pEWuo0Jzz0Uky5zUQKsX0qF7DVoUGgil42g2zSs06IjPyE4nfMGGhRry5xEQwzwYG8Lg6bk2srUsCyENxt7cOXdVYv5SaJ4Scs3FboNz8G5cYUEnY91YTEfyGDZ+dAAGJfICtyKiZqjin1LxZmoUnpGXv+C8c80MX1Vxx/8dsUv6MYAib3cvnZwIIcpcW3C2ZYru+hroDF5mXm9P2Y/T8Du4nbo+4VocEKH0za/aAv3FknJIOt9if3XiAe4XldB0opMuRK3gNWoMfGwFnIFv+/o39iEoM+s0Da3ElwvV08zMHh+bHD9vMYpijT/6KqMTpjSZwrDDgyTzdOu8NBoiLLlgpNZASSf/bbRSCbmN9yIq7IBSGPIuYzP2CNaukwx6m8+cyg9DyjaojcKHchTOd83m2Wi4gn1mWi+VPt5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39830400003)(376002)(346002)(136003)(66446008)(83380400001)(122000001)(52536014)(64756008)(66556008)(66476007)(4326008)(66946007)(2906002)(76116006)(33656002)(5660300002)(30864003)(38100700002)(7696005)(8676002)(8936002)(55016003)(966005)(86362001)(316002)(19627235002)(38070700005)(478600001)(41300700001)(6506007)(71200400001)(9686003)(26005)(186003)(6916009)(2004002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aduCgzxFxROu9wrkyqL3y4Lg2n/BT0icmhI9Lfgqk9duEMqT95B3z9baiS?=
 =?iso-8859-1?Q?wafYKW8AK/yQkkcd4cdXYtchCcZYihUthUc1GalCjx3AM++QDU0RtjFitd?=
 =?iso-8859-1?Q?2NgqNvyxqbW1cq/lcMru/YB+2BEjzAE7FuLRpCkfuc1P5YVf7Ma274hqfN?=
 =?iso-8859-1?Q?NB4PzW4H4nf4C70fWdkeYYORnthH7+/e+yna8SZI4FyLoTwzHrltqWElLK?=
 =?iso-8859-1?Q?5KmPmV1/pc55aEHpT5nOfdOHWzJiRLGzoVA5aKHigyR13GY7V4HzbcTa7M?=
 =?iso-8859-1?Q?GY8lAoHzdoZOaAI9V/AQCh4Dn8XQ3Ky2mnlea+5GGuT05nHxfCfE+l+p/N?=
 =?iso-8859-1?Q?HZKVVTC8yf8l+/8YZoLmX1PAcGHanPaS16vUyqJU0fYNOO85ONaQ6zgk51?=
 =?iso-8859-1?Q?cy2J3J1Knf236pIUg/9wUg1pz0Ue0+uPhND4/TdrxoqjkoUONWJyvUhYpW?=
 =?iso-8859-1?Q?b0GRFuohWBeGHg+rLyA3cwZrbKJTj38AyU2C/2bSbTWQ6g21J9vZx9aC64?=
 =?iso-8859-1?Q?tL46LAGUNQl6pmWr87kGREGHWrZEqY9e6Cx+Dw1D6chMLhzx/OGcXZcfz/?=
 =?iso-8859-1?Q?Io/kjSl5UOaWXfR0gcaUUAhgVZ53pVDKMCptX81jC9aiAu3ACSR5MWLN6w?=
 =?iso-8859-1?Q?3kBU9dTcPe581beEuXPrm7FCVG4kbswxT0wqn0Qd2WcU6C50BHaZbUFBPJ?=
 =?iso-8859-1?Q?k2abgAt0Ixi0kdwd7Y42XVHbA9TnLXeZYiZhdCJoRRZMLG/Z7oMKwdLtUq?=
 =?iso-8859-1?Q?WXOENQd7gWrJZT53lzJOgqrIJlGYFmgnLeR1eEzcH0dex6/4+ermhquroy?=
 =?iso-8859-1?Q?tSVi2GwRtXo0e1OVXESLjkJGfp8NiT6bDJ/xy/kHa7Lng7g59Zw872MuC5?=
 =?iso-8859-1?Q?svpGb5fHtWv8lo1rkI0jORZA/a84+7oPjNLkNJNRdmPs4SmIjhUua8qhBZ?=
 =?iso-8859-1?Q?si4YimAsxWqjhXJM9snrtT+GG2TlkKjui4Yu1ZV16/3hLvYAoO1cjb8NOU?=
 =?iso-8859-1?Q?ITab736u2THSBNWZa6t1j6pPG51ERbWwY8jpwuMaZC9wIhsb4tEhXb6k90?=
 =?iso-8859-1?Q?xUA2ik3eDFSotiuSR/fwFUbCa/zu8C53MEcs5nROUQGbvXQd+6Z8dWq5eB?=
 =?iso-8859-1?Q?xqwa/mPUnREeaXiaznrkTBnHKu7fFSaIx0eSrKAYhWpy7GNeJ4j/MtfBAP?=
 =?iso-8859-1?Q?eoA2Mn+AJ9gzyOXCEB6ix6Zh6ddRNpC+bQ1no+f5CbILBFmLrpiEFkB4B+?=
 =?iso-8859-1?Q?zAGy+acMYl4KOcYdvhM0/QMRDNmBg9LzankZsP/Y1Gej8pF/y7iz+Uw4h6?=
 =?iso-8859-1?Q?2OUVzhwzhYB1XYAbAtVjIV/L5h8FbHrL8n3qLPhnc9bIWyhwh1WIFr/bTM?=
 =?iso-8859-1?Q?0Gx8vStCGMI4z+YYBjcg4q2ZXeMR8h4kkTgf9WMAB2N0iGJ55C7FLr36Pp?=
 =?iso-8859-1?Q?2KnVfB5qrjOF0Yifmcb6qjzR3EGMj4sl8lc8ulQ/dVGuIbOnWpWE3Jkq8a?=
 =?iso-8859-1?Q?A0Q/d5thLYSSEH4EzNLpZ++irXnsHT5pBWTzAm4MRuKcW7kBULWM7N8R4e?=
 =?iso-8859-1?Q?W15mYfR7qHvULuNrN+ZpjCnGeZFFtCfkUfGxj5oCJV3YJQ455lCM+NwbJE?=
 =?iso-8859-1?Q?VGd38iTksdY8E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d07fa-e560-48b9-650d-08da94859380
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 06:11:05.2416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjNgqqpGwgEthYACfzfpokqMAQ0NSkVh8iteu/h0AXR3PnFIJLmaTdlmffpWqGE14UmMcli48DF9zUJVFM4dpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu/nq1FsA10J+HCZWBp7/oIqtN+LOZBqg8ZvKlfJMcQ=;
 b=5pEogQ8BSQM9f/zgWJm9HDRWjHZjO6onpqZ1dAYl/cZDThkZXrrXRAbbHivgyeK6H6gCGoK97Htehme2GU5WqP87Jib0DWNruPRH7e/9CW4uXw4+gAEaQVZH4tFM5SryvYwnbzXikKB86oK6mA46TwgkFjuHlC5aEJ3d8BZSgXs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=5pEogQ8B
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 4/4] package/polkit: bump to version 121
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/polkit/polkit/-/blob/121/NEWS.md

Highlights:
- new versioning
- duktape added as backend JS engine
- autotools build system removed
- new translations

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
(no changes since v1)
---
 ...make-netgroup-support-optional-meson.patch | 260 +++++++++++
 .../0001-make-netgroup-support-optional.patch | 426 ------------------
 ...tional-parameters-to-i18n.merge_file.patch |  45 --
 package/polkit/0003-fix-build-without-C.patch |  50 --
 package/polkit/polkit.hash                    |   2 +-
 package/polkit/polkit.mk                      |   6 +-
 6 files changed, 264 insertions(+), 525 deletions(-)
 create mode 100644 package/polkit/0001-make-netgroup-support-optional-meson.patch
 delete mode 100644 package/polkit/0001-make-netgroup-support-optional.patch
 delete mode 100644 package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
 delete mode 100644 package/polkit/0003-fix-build-without-C.patch

diff --git a/package/polkit/0001-make-netgroup-support-optional-meson.patch b/package/polkit/0001-make-netgroup-support-optional-meson.patch
new file mode 100644
index 0000000000..bddeb339bd
--- /dev/null
+++ b/package/polkit/0001-make-netgroup-support-optional-meson.patch
@@ -0,0 +1,260 @@
+From b57deee8178190a7ecc75290fa13cf7daabc2c66 Mon Sep 17 00:00:00 2001
+From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
+Date: Sun, 15 May 2022 05:04:10 +0000
+Subject: [PATCH] Make netgroup support optional
+
+On at least Linux/musl and Linux/uclibc, netgroup support is not
+available.  PolKit fails to compile on these systems for that reason.
+
+This change makes netgroup support conditional on the presence of the
+setnetgrent(3) function which is required for the support to work.  If
+that function is not available on the system, an error will be returned
+to the administrator if unix-netgroup: is specified in configuration.
+
+(sam: rebased for Meson and Duktape.)
+
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
+Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ meson.build                                     |  1 +
+ src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
+ src/polkit/polkitunixnetgroup.c                 |  3 +++
+ .../polkitbackendduktapeauthority.c             |  4 ++--
+ .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
+ src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
+ test/polkit/polkitidentitytest.c                |  8 +++++++-
+ test/polkit/polkitunixnetgrouptest.c            |  2 ++
+ .../test-polkitbackendjsauthority.c             |  2 ++
+ 9 files changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 908f0aa..66c4e9b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -89,6 +89,7 @@ config_h.set('_GNU_SOURCE', true)
+ check_functions = [
+   'clearenv',
+   'fdatasync',
++  'setnetgrent',
+ ]
+ 
+ foreach func: check_functions
+diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
+index 3aa1f7f..793f17d 100644
+--- a/src/polkit/polkitidentity.c
++++ b/src/polkit/polkitidentity.c
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
+     }
+   else if (g_str_has_prefix (str, "unix-netgroup:"))
+     {
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine ('%s')",
++                   str);
++#else
+       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
++#endif
+     }
+ 
+   if (identity == NULL && (error != NULL && *error == NULL))
+@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+       GVariant *v;
+       const char *name;
+ 
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine");
++      goto out;
++#else
++
+       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
+       if (v == NULL)
+         {
+@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+       name = g_variant_get_string (v, NULL);
+       ret = polkit_unix_netgroup_new (name);
+       g_variant_unref (v);
++#endif
+     }
+   else
+     {
+diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
+index 8a2b369..83f8d4a 100644
+--- a/src/polkit/polkitunixnetgroup.c
++++ b/src/polkit/polkitunixnetgroup.c
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
+ PolkitIdentity *
+ polkit_unix_netgroup_new (const gchar *name)
+ {
++#ifndef HAVE_SETNETGRENT
++  g_assert_not_reached();
++#endif
+   g_return_val_if_fail (name != NULL, NULL);
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
+                                        "name", name,
+diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
+index c89dbcf..f4b4304 100644
+--- a/src/polkitbackend/polkitbackendduktapeauthority.c
++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
+@@ -1035,7 +1035,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+ 
+   user = duk_require_string (cx, 0);
+   netgroup = duk_require_string (cx, 1);
+-
++#ifdef HAVE_SETNETGRENT
+   if (innetgr (netgroup,
+                NULL,  /* host */
+                user,
+@@ -1043,7 +1043,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+     {
+       is_in_netgroup = TRUE;
+     }
+-
++#endif
+   duk_push_boolean (cx, is_in_netgroup);
+   return 1;
+ }
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index d935a7a..1cfc88e 100644
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -2248,25 +2248,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
+   GList *ret;
+ 
+   ret = NULL;
++#ifdef HAVE_SETNETGRENT
+   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
+ 
+-#ifdef HAVE_SETNETGRENT_RETURN
++# ifdef HAVE_SETNETGRENT_RETURN
+   if (setnetgrent (name) == 0)
+     {
+       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
+       goto out;
+     }
+-#else
++# else
+   setnetgrent (name);
+-#endif
++# endif /* HAVE_SETNETGRENT_RETURN */
+ 
+   for (;;)
+     {
+-#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
++# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
+       const char *hostname, *username, *domainname;
+-#else
++# else
+       char *hostname, *username, *domainname;
+-#endif
++# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
+       PolkitIdentity *user;
+       GError *error = NULL;
+ 
+@@ -2297,6 +2298,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
+ 
+  out:
+   endnetgrent ();
++#endif /* HAVE_SETNETGRENT */
+   return ret;
+ }
+ 
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 2568e8e..999269b 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -1271,6 +1271,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+ 
+   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
+ 
++#ifdef HAVE_SETNETGRENT
+   JS::RootedString usrstr (authority->priv->cx);
+   usrstr = args[0].toString();
+   user = JS_EncodeStringToUTF8 (cx, usrstr);
+@@ -1285,6 +1286,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+     {
+       is_in_netgroup =  true;
+     }
++#endif
+ 
+   ret = true;
+ 
+diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
+index e91967b..2635c4c 100644
+--- a/test/polkit/polkitidentitytest.c
++++ b/test/polkit/polkitidentitytest.c
+@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
+   {"unix-group:root", "unix-group:jane", FALSE},
+   {"unix-group:jane", "unix-group:jane", TRUE},
+ 
++#ifdef HAVE_SETNETGRENT
+   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
+   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
++#endif
+ 
+   {"unix-user:root", "unix-group:root", FALSE},
++#ifdef HAVE_SETNETGRENT
+   {"unix-user:jane", "unix-netgroup:foo", FALSE},
++#endif
+ 
+   {NULL},
+ };
+@@ -181,11 +185,13 @@ main (int argc, char *argv[])
+   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
+   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
+ 
++#ifdef HAVE_SETNETGRENT
+   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
++  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
++#endif
+ 
+   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
+   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
+-  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
+ 
+   add_comparison_tests ();
+ 
+diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
+index 3701ba1..e1d211e 100644
+--- a/test/polkit/polkitunixnetgrouptest.c
++++ b/test/polkit/polkitunixnetgrouptest.c
+@@ -69,7 +69,9 @@ int
+ main (int argc, char *argv[])
+ {
+   g_test_init (&argc, &argv, NULL);
++#ifdef HAVE_SETNETGRENT
+   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
+   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
++#endif
+   return g_test_run ();
+ }
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
+index 2103b17..b187a2f 100644
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
+@@ -137,12 +137,14 @@ test_get_admin_identities (void)
+         "unix-group:users"
+       }
+     },
++#ifdef HAVE_SETNETGRENT
+     {
+       "net.company.action3",
+       {
+         "unix-netgroup:foo"
+       }
+     },
++#endif
+   };
+   guint n;
+ 
+-- 
+GitLab
+
diff --git a/package/polkit/0001-make-netgroup-support-optional.patch b/package/polkit/0001-make-netgroup-support-optional.patch
deleted file mode 100644
index 09c48d7791..0000000000
--- a/package/polkit/0001-make-netgroup-support-optional.patch
+++ /dev/null
@@ -1,426 +0,0 @@
-From 1b854ef4bb15032091a33fed587e5ba6f3e582eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 May 2019 13:18:55 -0700
-Subject: [PATCH] make netgroup support optional
-
-On at least Linux/musl and Linux/uclibc, netgroup
-support is not available.  PolKit fails to compile on these systems
-for that reason.
-
-This change makes netgroup support conditional on the presence of the
-setnetgrent(3) function which is required for the support to work.  If
-that function is not available on the system, an error will be returned
-to the administrator if unix-netgroup: is specified in configuration.
-
-Fixes bug 50145.
-
-Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Adam: Extend patch to work with duktape integration.]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Thomas: add introspection.m4.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- buildutil/introspection.m4                    | 142 ++++++++++++++++++
- configure.ac                                  |   2 +-
- src/polkit/polkitidentity.c                   |  16 ++
- src/polkit/polkitunixnetgroup.c               |   3 +
- .../polkitbackendduktapeauthority.c           |   2 +
- .../polkitbackendinteractiveauthority.c       |  14 +-
- .../polkitbackendjsauthority.cpp              |   3 +-
- test/polkit/polkitidentitytest.c              |   9 +-
- test/polkit/polkitunixnetgrouptest.c          |   3 +
- .../test-polkitbackendjsauthority.c           |   2 +
- 10 files changed, 187 insertions(+), 9 deletions(-)
- create mode 100644 buildutil/introspection.m4
-
-diff --git a/buildutil/introspection.m4 b/buildutil/introspection.m4
-new file mode 100644
-index 0000000..b0ccd68
---- /dev/null
-+++ b/buildutil/introspection.m4
-@@ -0,0 +1,142 @@
-+dnl -*- mode: autoconf -*-
-+dnl Copyright 2009 Johan Dahlin
-+dnl
-+dnl This file is free software; the author(s) gives unlimited
-+dnl permission to copy and/or distribute it, with or without
-+dnl modifications, as long as this notice is preserved.
-+dnl
-+
-+# serial 1
-+
-+dnl This is a copy of AS_AC_EXPAND
-+dnl
-+dnl (C) 2003, 2004, 2005 Thomas Vander Stichele <thomas at apestaart dot org>
-+dnl Copying and distribution of this file, with or without modification,
-+dnl are permitted in any medium without royalty provided the copyright
-+dnl notice and this notice are preserved.
-+m4_define([_GOBJECT_INTROSPECTION_AS_AC_EXPAND],
-+[
-+  EXP_VAR=[$1]
-+  FROM_VAR=[$2]
-+
-+  dnl first expand prefix and exec_prefix if necessary
-+  prefix_save=$prefix
-+  exec_prefix_save=$exec_prefix
-+
-+  dnl if no prefix given, then use /usr/local, the default prefix
-+  if test "x$prefix" = "xNONE"; then
-+    prefix="$ac_default_prefix"
-+  fi
-+  dnl if no exec_prefix given, then use prefix
-+  if test "x$exec_prefix" = "xNONE"; then
-+    exec_prefix=$prefix
-+  fi
-+
-+  full_var="$FROM_VAR"
-+  dnl loop until it doesn't change anymore
-+  while true; do
-+    new_full_var="`eval echo $full_var`"
-+    if test "x$new_full_var" = "x$full_var"; then break; fi
-+    full_var=$new_full_var
-+  done
-+
-+  dnl clean up
-+  full_var=$new_full_var
-+  AC_SUBST([$1], "$full_var")
-+
-+  dnl restore prefix and exec_prefix
-+  prefix=$prefix_save
-+  exec_prefix=$exec_prefix_save
-+])
-+
-+m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-+[
-+    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
-+    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
-+    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
-+
-+    dnl enable/disable introspection
-+    m4_if([$2], [require],
-+    [dnl
-+        enable_introspection=yes
-+    ],[dnl
-+        AC_ARG_ENABLE(introspection,
-+                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
-+                                 [Enable introspection for this build]),, 
-+                                 [enable_introspection=auto])
-+    ])dnl
-+
-+    AC_MSG_CHECKING([for gobject-introspection])
-+
-+    dnl presence/version checking
-+    AS_CASE([$enable_introspection],
-+    [no], [dnl
-+        found_introspection="no (disabled, use --enable-introspection to enable)"
-+    ],dnl
-+    [yes],[dnl
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
-+                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
-+                         found_introspection=yes,
-+                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
-+    ],dnl
-+    [auto],[dnl
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
-+	dnl Canonicalize enable_introspection
-+	enable_introspection=$found_introspection
-+    ],dnl
-+    [dnl	
-+        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
-+    ])dnl
-+
-+    AC_MSG_RESULT([$found_introspection])
-+
-+    dnl expand datadir/libdir so we can pass them to pkg-config
-+    dnl and get paths relative to our target directories
-+    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_DATADIR, "$datadir")
-+    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_LIBDIR, "$libdir")
-+
-+    INTROSPECTION_SCANNER=
-+    INTROSPECTION_COMPILER=
-+    INTROSPECTION_GENERATE=
-+    INTROSPECTION_GIRDIR=
-+    INTROSPECTION_TYPELIBDIR=
-+    if test "x$found_introspection" = "xyes"; then
-+       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_GIRDIR=`$PKG_CONFIG --define-variable=datadir="${_GI_EXP_DATADIR}" --variable=girdir gobject-introspection-1.0`
-+       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --define-variable=libdir="${_GI_EXP_LIBDIR}" --variable=typelibdir gobject-introspection-1.0)"
-+       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-+       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
-+       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+    fi
-+    AC_SUBST(INTROSPECTION_SCANNER)
-+    AC_SUBST(INTROSPECTION_COMPILER)
-+    AC_SUBST(INTROSPECTION_GENERATE)
-+    AC_SUBST(INTROSPECTION_GIRDIR)
-+    AC_SUBST(INTROSPECTION_TYPELIBDIR)
-+    AC_SUBST(INTROSPECTION_CFLAGS)
-+    AC_SUBST(INTROSPECTION_LIBS)
-+    AC_SUBST(INTROSPECTION_MAKEFILE)
-+
-+    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
-+])
-+
-+
-+dnl Usage:
-+dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
-+
-+AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
-+[
-+  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
-+])
-+
-+dnl Usage:
-+dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
-+
-+
-+AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
-+[
-+  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
-+])
-diff --git a/configure.ac b/configure.ac
-index 5cedb4e..87aa0ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -111,7 +111,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
- 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
- AC_SUBST(EXPAT_LIBS)
- 
--AC_CHECK_FUNCS(clearenv fdatasync)
-+AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
- 
- if test "x$GCC" = "xyes"; then
-   LDFLAGS="-Wl,--as-needed $LDFLAGS"
-diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f..10e9c17 100644
---- a/src/polkit/polkitidentity.c
-+++ b/src/polkit/polkitidentity.c
-@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
-     }
-   else if (g_str_has_prefix (str, "unix-netgroup:"))
-     {
-+#ifndef HAVE_SETNETGRENT
-+      g_set_error (error,
-+                   POLKIT_ERROR,
-+                   POLKIT_ERROR_FAILED,
-+                   "Netgroups are not available on this machine ('%s')",
-+                   str);
-+#else
-       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
-+#endif
-     }
- 
-   if (identity == NULL && (error != NULL && *error == NULL))
-@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
-       GVariant *v;
-       const char *name;
- 
-+#ifndef HAVE_SETNETGRENT
-+      g_set_error (error,
-+                   POLKIT_ERROR,
-+                   POLKIT_ERROR_FAILED,
-+                   "Netgroups are not available on this machine");
-+      goto out;
-+#else
-       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
-       if (v == NULL)
-         {
-@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
-       name = g_variant_get_string (v, NULL);
-       ret = polkit_unix_netgroup_new (name);
-       g_variant_unref (v);
-+#endif
-     }
-   else
-     {
-diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
-index 8a2b369..83f8d4a 100644
---- a/src/polkit/polkitunixnetgroup.c
-+++ b/src/polkit/polkitunixnetgroup.c
-@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
- PolkitIdentity *
- polkit_unix_netgroup_new (const gchar *name)
- {
-+#ifndef HAVE_SETNETGRENT
-+  g_assert_not_reached();
-+#endif
-   g_return_val_if_fail (name != NULL, NULL);
-   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
-                                        "name", name,
-diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
-index 4b4f8fd..e19b009 100644
---- a/src/polkitbackend/polkitbackendduktapeauthority.c
-+++ b/src/polkitbackend/polkitbackendduktapeauthority.c
-@@ -1036,6 +1036,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
-   const char *netgroup;
-   gboolean is_in_netgroup = FALSE;
- 
-+#ifdef HAVE_SETNETGRENT
-   user = duk_require_string (cx, 0);
-   netgroup = duk_require_string (cx, 1);
- 
-@@ -1046,6 +1047,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
-     {
-       is_in_netgroup = TRUE;
-     }
-+#endif
- 
-   duk_push_boolean (cx, is_in_netgroup);
-   return 1;
-diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index 056d9a8..36c2f3d 100644
---- a/src/polkitbackend/polkitbackendinteractiveauthority.c
-+++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
-   GList *ret;
- 
-   ret = NULL;
-+#ifdef HAVE_SETNETGRENT
-   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
- 
--#ifdef HAVE_SETNETGRENT_RETURN
-+# ifdef HAVE_SETNETGRENT_RETURN
-   if (setnetgrent (name) == 0)
-     {
-       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
-       goto out;
-     }
--#else
-+# else
-   setnetgrent (name);
--#endif
-+# endif /* HAVE_SETNETGRENT_RETURN */
- 
-   for (;;)
-     {
--#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
-+# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
-       const char *hostname, *username, *domainname;
--#else
-+# else
-       char *hostname, *username, *domainname;
--#endif
-+# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
-       PolkitIdentity *user;
-       GError *error = NULL;
- 
-@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
- 
-  out:
-   endnetgrent ();
-+#endif /* HAVE_SETNETGRENT */
-   return ret;
- }
- 
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 9b752d1..09b2878 100644
---- a/src/polkitbackend/polkitbackendjsauthority.cpp
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1520,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
- 
-   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
- 
-+#ifdef HAVE_SETNETGRENT
-   JS::RootedString usrstr (authority->priv->cx);
-   usrstr = args[0].toString();
-   user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1534,7 +1535,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-     {
-       is_in_netgroup =  true;
-     }
--
-+#endif
-   ret = true;
- 
-   args.rval ().setBoolean (is_in_netgroup);
-diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967b..e829aaa 100644
---- a/test/polkit/polkitidentitytest.c
-+++ b/test/polkit/polkitidentitytest.c
-@@ -19,6 +19,7 @@
-  * Author: Nikki VonHollen <vonhollen@google.com>
-  */
- 
-+#include "config.h"
- #include "glib.h"
- #include <polkit/polkit.h>
- #include <polkit/polkitprivate.h>
-@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_test_data [] = {
-   {"unix-group:root", "unix-group:jane", FALSE},
-   {"unix-group:jane", "unix-group:jane", TRUE},
- 
-+#ifdef HAVE_SETNETGRENT
-   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
-   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
-+#endif
- 
-   {"unix-user:root", "unix-group:root", FALSE},
-+#ifdef HAVE_SETNETGRENT
-   {"unix-user:jane", "unix-netgroup:foo", FALSE},
-+#endif
- 
-   {NULL},
- };
-@@ -181,11 +186,13 @@ main (int argc, char *argv[])
-   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
-   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
- 
-+#ifdef HAVE_SETNETGRENT
-   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
-+  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
-+#endif
- 
-   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
-   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
--  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
- 
-   add_comparison_tests ();
- 
-diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
-index 3701ba1..e3352eb 100644
---- a/test/polkit/polkitunixnetgrouptest.c
-+++ b/test/polkit/polkitunixnetgrouptest.c
-@@ -19,6 +19,7 @@
-  * Author: Nikki VonHollen <vonhollen@google.com>
-  */
- 
-+#include "config.h"
- #include "glib.h"
- #include <polkit/polkit.h>
- #include <string.h>
-@@ -69,7 +70,9 @@ int
- main (int argc, char *argv[])
- {
-   g_test_init (&argc, &argv, NULL);
-+#ifdef HAVE_SETNETGRENT
-   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
-   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
-+#endif
-   return g_test_run ();
- }
-diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
-index 71aad23..fdd28f3 100644
---- a/test/polkitbackend/test-polkitbackendjsauthority.c
-+++ b/test/polkitbackend/test-polkitbackendjsauthority.c
-@@ -137,12 +137,14 @@ test_get_admin_identities (void)
-         "unix-group:users"
-       }
-     },
-+#ifdef HAVE_SETNETGRENT
-     {
-       "net.company.action3",
-       {
-         "unix-netgroup:foo"
-       }
-     },
-+#endif
-   };
-   guint n;
- 
--- 
-2.25.1
-
diff --git a/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch b/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
deleted file mode 100644
index 25fa4ef19b..0000000000
--- a/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 30c368a6b729bc8a0a9d0d023739c4fa07b0928b Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Mon, 25 Oct 2021 20:21:27 +0100
-Subject: [PATCH] Don't pass positional parameters to i18n.merge_file
-
-These were always ignored, and Meson 0.60.0 disallowed them.
-
-Resolves: https://gitlab.freedesktop.org/polkit/polkit/-/issues/160
-Reference: https://github.com/mesonbuild/meson/pull/9445
-Signed-off-by: Simon McVittie <smcv@debian.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/99]
----
- actions/meson.build      | 1 -
- src/examples/meson.build | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/actions/meson.build b/actions/meson.build
-index 2abaaf3..1e3f370 100644
---- a/actions/meson.build
-+++ b/actions/meson.build
-@@ -1,7 +1,6 @@
- policy = 'org.freedesktop.policykit.policy'
- 
- i18n.merge_file(
--  policy,
-   input: policy + '.in',
-   output: '@BASENAME@',
-   po_dir: po_dir,
-diff --git a/src/examples/meson.build b/src/examples/meson.build
-index c6305ab..8c18de5 100644
---- a/src/examples/meson.build
-+++ b/src/examples/meson.build
-@@ -1,7 +1,6 @@
- policy = 'org.freedesktop.policykit.examples.pkexec.policy'
- 
- i18n.merge_file(
--  policy,
-   input: policy + '.in',
-   output: '@BASENAME@',
-   po_dir: po_dir,
--- 
-2.25.1
-
diff --git a/package/polkit/0003-fix-build-without-C.patch b/package/polkit/0003-fix-build-without-C.patch
deleted file mode 100644
index 8e16de256c..0000000000
--- a/package/polkit/0003-fix-build-without-C.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From abbc04f6f3acfc2dfa34b1c07decaa658786e142 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Apr 2022 18:33:08 +0200
-Subject: [PATCH] fix build without C++
-
-Fix the following build failure without C++ raised since
-https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:
-
-The following exception(s) were encountered:
-Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
-
-Indeed, C++ is only required with mozjs engine
-
-Fixes:
- - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/polkit/polkit/-/commit/abbc04f6f3acfc2dfa34b1c07decaa658786e142]
----
- meson.build                   | 2 +-
- src/polkitbackend/meson.build | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index c6765fd..da60930 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project(
--  'polkit', ['c', 'cpp'],
-+  'polkit', ['c'],
-   version: '0.120',
-   license: 'LGPL2+',
-   default_options: [
-diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.build
-index 266f280..7c5d443 100644
---- a/src/polkitbackend/meson.build
-+++ b/src/polkitbackend/meson.build
-@@ -38,6 +38,7 @@ if js_engine == 'duktape'
-   deps += libm_dep
-   deps += thread_dep
- elif js_engine == 'mozjs'
-+  add_languages('cpp')
-   sources += files('polkitbackendjsauthority.cpp')
- endif
- 
--- 
-GitLab
-
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 1fedb5a707..398f924275 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  243fa69d1e480510c504723487716cda7d6fb588360c7c8f7ec6ba4a3f6ae60e  polkit-a2bf5c9c83b6ae46cbd5c779d3055bff81ded683.tar.gz
+sha256  9dc7ae341a797c994a5a36da21963f0c5c8e3e5a1780ccc2a5f52e7be01affaa  polkit-121.tar.gz
 
 # Locally calculated
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index f94579a149..8718728dbc 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-POLKIT_VERSION = a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
-POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
+POLKIT_VERSION = 121
+POLKIT_SITE = https://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
-# Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+# Fix was comitted in version 121
 POLKIT_IGNORE_CVES += CVE-2021-4034
 
 POLKIT_DEPENDENCIES = \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

