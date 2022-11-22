Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E0DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 16:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF664183E;
	Tue, 22 Nov 2022 16:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF664183E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlNeUBjZ_fY8; Tue, 22 Nov 2022 16:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F64E41856;
	Tue, 22 Nov 2022 16:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F64E41856
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D71531BF841
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7094641856
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7094641856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5Sm3NezP5tm for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 16:27:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1966C4183E
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::602])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1966C4183E
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 16:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqUXyj3ne1zEE/8vgVE9RQg3oTvZWk2oy7r2La3aig4mFemquC5vXqzuKc0eNTJEy7MqFOc4n8gdpRB2UccorQkstwfbYC92klKAZO5T+8fMvXw+YUIJypBfQ6WiL/YpoglfNKGtJZ9HFjbVwE+Z5vovgxIbM+L7IszCQh9tCK99VbHl0/QJzJTIa0bBaCz2ioROBpdn10o/38Lv7x0/ePEavoqrC+X17jPRtgwmGD6/6+BvqpLz4n3TloZr85pBAWcfvB63xB8up/cXkoLM4PA6/YjJ26BlC0u24i2byQUsLGyJ84De/qiGvCnsXknIfe5szgznpI0RE++Cf8c1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVp4zeoTm6ErIwV6Zd9WaE+x2FYxKcjZr9ErrIxWVUU=;
 b=WkyPl7NRmk5XCdBTp2WWYqGyRYutzMAmRNPy83ctHrZw6xotkJleKgrebv+PYhBQm+DOuCmzJxy5A+QBz740pOaYH1IQeVUyendW5M72++VvO+9iDrzs8vIq9KcATiJfx060w/KBqBsBbhhO2bGpLRmAHhXwbv7AGog36ceA4EUD0Lc6dOAI9DYYQsFM6OMOZ4k/V8zULUmM65jDIsVGHniTdBIgUz/z6TJ4/YLBxWEY5M5+TOHQC7/qDjRNOv5x2uMdS3XT5IXvWnReXaqNmzWdwg8qgGU6bevgibQ6W9hixkO2mr5vYbyBZdTaKNehVFaZ/dDvBnrzq2VyZJLZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1802.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 16:27:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::2e8a:56c3:e3a7:7bfd]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::2e8a:56c3:e3a7:7bfd%6]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 16:27:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/polkit: bump to version 122
Thread-Index: AQHY/o73YO/klnDUX0Sg2oNoqgrswg==
Date: Tue, 22 Nov 2022 16:27:19 +0000
Message-ID: <VI1P190MB04935B828AC5DEE6D76E6CFB9F0D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1802:EE_
x-ms-office365-filtering-correlation-id: 5851ac31-4bd5-4b70-9f0c-08dacca66cf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6y+zhxKIHydKXk5qyyuHmtfLCmpSrDQ+eik/yMEmVSocw0i44LbHwBBi6+3VzbmAp+9tKsDhVbYtWC4fW5TbwSumQ3l0h9XGpIeFxs5KbSQYngyTuSftymBhZ801OBATzkq8TFsaXt52FecrGM+qBHHGBIJP6Mi7SeyNtjEwUuW/pZd4dYTnNQbBSBFK3ND85o6HuVznIBKglldRMp+W7pvJRQEZqmMaitrsSe6ZWWmsj+Le1m6dHAdfFP1YnyW2jiur8AmxP4mBFziPo9ePMHz9rwiihl5l5hFuXiXFdhiqu1pb0yrMSB1aHprz/iSUfOYQztDTXFFUXAMajGsqAqmIqR0jNy58K5nT/JomjyEyNOCPSTwEMDmgzlXUoYoy9pPshbHFp1Ub4sWkAHT5e6+SXDbF7bYTled5JAbTRlc6BjUufnxpZOraHsNaGuzQUNVOUO25vLNFXlBi6WMU9vnFJ5P/usxk3+8vvXReMTpWclgJ0H8NV2/Q1XLYfx8fHpcatzQa0XPJu2aGXi+MsmjOe+WhN+5E30z2qlGe5f0kxfoMbZhl8qZMrqLgkV9pVTdSJFQDMroNQ0XpUaLZrKUMIIIiSUfy1Won25kW6jW8iQ/FhPKAd0AYazg8QNxjtJTRPIeU9QJ1/vw6A3Ch9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39840400004)(396003)(136003)(346002)(451199015)(66476007)(2906002)(64756008)(66556008)(76116006)(33656002)(66946007)(66446008)(4326008)(86362001)(7696005)(6506007)(8676002)(52536014)(41300700001)(8936002)(30864003)(26005)(5660300002)(9686003)(122000001)(6916009)(316002)(38070700005)(478600001)(19627235002)(38100700002)(966005)(71200400001)(55016003)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WVU0vY1eUXAubYCBqKVRPPAjBRcAPxNq/BMrqCG8iK6fRXeEZdwTQoprqg?=
 =?iso-8859-1?Q?J8r4S24/v28H1emKvvIjPQTAdxgvK4lNHtlmyHKocxDbx5UIIm/9nCnozu?=
 =?iso-8859-1?Q?zJnqu6QHnmn82wV2N4SYxXFOjl5jQiRB8vSPUeP2pytTrLdOE9Dpd7G7W1?=
 =?iso-8859-1?Q?JmR5hlx6a2qurjZc02pV15H2BGF0X3XkmvTeD2jShaFbg+qVSwJzDPN8OY?=
 =?iso-8859-1?Q?/Aiztt9OeUmF3nOWd/iiUU5PBFWqcV78tBZp1D2Z9pMMtJDg1gylhjXCd5?=
 =?iso-8859-1?Q?obBLaDGKsrZUv57bB0nbphmCwizJ5vshEeC3j3gcF/0w1HV9uV4WG1BHrI?=
 =?iso-8859-1?Q?5XqOwLRfnEHobYPtuE0Y65B6uulKk2iGY8JA5LLTCkrVhcrhgwGUkU5Gs2?=
 =?iso-8859-1?Q?djB1yriBiIrRlrtI3SgqsqGR0GT2gfR0Q8311MU1NGJGBV9Mttu4goxY49?=
 =?iso-8859-1?Q?BBUQvPzXb6ocMUTZX1U7PrvIWqNRqMfuCUlKkteq5mHhRIIXsI/kCBHs1D?=
 =?iso-8859-1?Q?/NfynqZXhz96cry4pkMIlufIzfdXlVTIbJ5maKs4kTmzJ1Ff9zMqzD7Z6X?=
 =?iso-8859-1?Q?2Hf1aaOiNku0M5ezEkTk4O1wgnITbgPgQJjIJ/Gu+mrDI82Lpe4ZQSdKRt?=
 =?iso-8859-1?Q?wTuQpy/vphXei2VP9X2hbiL+xAL3l582AbTnTCTDJIkYJwGNJ8nVIzKkeC?=
 =?iso-8859-1?Q?dR/m1wg9tVr3hbHg52irLDe+p1a41P5n1zmq3iJgWEuBtL6ZYPpw4MTwAL?=
 =?iso-8859-1?Q?ktlvjQOZjfpKFCxJlGAaXfcYygAgldeursfdR8uUyIh3vuguPAqbT9cx3s?=
 =?iso-8859-1?Q?CjGZSdog8ojwyH9CaZ+im6zbGvAGJD0fyXlxtFgDT5HARx7NrkX+DEBWLc?=
 =?iso-8859-1?Q?y/5Inlj55JMNuLPtDGZ32UDZAG18P28NQAIr4a92bQdcL0qcXE/nqHHFeH?=
 =?iso-8859-1?Q?s3RHslPY3vzPk3g05nV54I2T72WyYZEISCIUcLd/Pt1u5/1Ses0ygLCtyg?=
 =?iso-8859-1?Q?PNOrQj6JuPhGNLICdm3XR46FHfg216AT0KKGOr40Gy+mPbdQse4FmngCxO?=
 =?iso-8859-1?Q?EtHBxQyZO4JIPzfjd34m4z6JKVhLLo/vgqbC5xT+8dJ8N0uY2mGJfre0YI?=
 =?iso-8859-1?Q?pMxz1HeG6AritoK0OusNEl1lGsiw8GwOzXSHSkJvvguCHMUsQyWKdpRz5z?=
 =?iso-8859-1?Q?yCvJdWCbGQIAx/pUHgOpTMY+UDwWn+VV7ku5vUNbXG0osGvDpuGqB6aNlW?=
 =?iso-8859-1?Q?anAEsHMR36oflB4SWUo+A/sEviqLcbWqaNDoIZuSEGFVjG4NWpG9qGxZ6y?=
 =?iso-8859-1?Q?szS1KzQK796kH+jviAIWx2CG89G8bkd1mvLRurNkvIzs9UIk9aiF7zeYuI?=
 =?iso-8859-1?Q?K9dJloVidiO21Ucb+1eIOovoei2BIQMs6wVJh32Fn7GnOzC+yTyKUmnMVD?=
 =?iso-8859-1?Q?cmHpJfb945b5IiAIdTfo2PG6+SS8+noudLtB6tTuhqIPJdSakZUldubbP3?=
 =?iso-8859-1?Q?bPKH86zBA4mZH9UBDc96w0i7IbpAXBrVxNlw2LKBcr2m0+BRbObfKu6GRn?=
 =?iso-8859-1?Q?tdiPPuLvJxUi4D2h+AM1r8arYLGkppdmPvU008i/owSbGUJcWSMc76tK8l?=
 =?iso-8859-1?Q?mDZzbeVXuyeN0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5851ac31-4bd5-4b70-9f0c-08dacca66cf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 16:27:19.0133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCcnLOIHSBtoxtR4q7y9iw1uNN3sc50MMrD9QzThksw+glEcP6vFnVAvy1KeEEp4K44kASoL4KEyBNGJ3EhGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1802
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVp4zeoTm6ErIwV6Zd9WaE+x2FYxKcjZr9ErrIxWVUU=;
 b=voeArPb+aYA/bH38/QlPdMZhOselt5LlaUaJkNZmcwishilDUIO5am2sBKu8/dt7pp6OMQpOPnETQlkiFQQxAIptVmrQt6GyU/dn6LC8K5renfnGtHgLhrIw6rR6pgJ+Y8uSNhmP8hu4xlJjN1kDTLn7eIOtX/yd/Klo/5dQp/Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=voeArPb+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/polkit: bump to version 122
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

As stated in [1] this and future release will only be hosted on
freedesktop's gitlab.
Archives hosted on gitlab are missing the gpg signature.

1: https://gitlab.freedesktop.org/polkit/polkit/-/commit/49bb905131537dde062d477612456328a9655e30

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 ...make-netgroup-support-optional-meson.patch | 260 ------------------
 package/polkit/polkit.hash                    |   4 +-
 package/polkit/polkit.mk                      |   4 +-
 3 files changed, 3 insertions(+), 265 deletions(-)
 delete mode 100644 package/polkit/0001-make-netgroup-support-optional-meson.patch

diff --git a/package/polkit/0001-make-netgroup-support-optional-meson.patch b/package/polkit/0001-make-netgroup-support-optional-meson.patch
deleted file mode 100644
index bddeb339bd..0000000000
--- a/package/polkit/0001-make-netgroup-support-optional-meson.patch
+++ /dev/null
@@ -1,260 +0,0 @@
-From b57deee8178190a7ecc75290fa13cf7daabc2c66 Mon Sep 17 00:00:00 2001
-From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
-Date: Sun, 15 May 2022 05:04:10 +0000
-Subject: [PATCH] Make netgroup support optional
-
-On at least Linux/musl and Linux/uclibc, netgroup support is not
-available.  PolKit fails to compile on these systems for that reason.
-
-This change makes netgroup support conditional on the presence of the
-setnetgrent(3) function which is required for the support to work.  If
-that function is not available on the system, an error will be returned
-to the administrator if unix-netgroup: is specified in configuration.
-
-(sam: rebased for Meson and Duktape.)
-
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
-Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- meson.build                                     |  1 +
- src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
- src/polkit/polkitunixnetgroup.c                 |  3 +++
- .../polkitbackendduktapeauthority.c             |  4 ++--
- .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
- src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
- test/polkit/polkitidentitytest.c                |  8 +++++++-
- test/polkit/polkitunixnetgrouptest.c            |  2 ++
- .../test-polkitbackendjsauthority.c             |  2 ++
- 9 files changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 908f0aa..66c4e9b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,6 +89,7 @@ config_h.set('_GNU_SOURCE', true)
- check_functions = [
-   'clearenv',
-   'fdatasync',
-+  'setnetgrent',
- ]
- 
- foreach func: check_functions
-diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f..793f17d 100644
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
-@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
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
-+
-       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
-       if (v == NULL)
-         {
-@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
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
-index c89dbcf..f4b4304 100644
---- a/src/polkitbackend/polkitbackendduktapeauthority.c
-+++ b/src/polkitbackend/polkitbackendduktapeauthority.c
-@@ -1035,7 +1035,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
- 
-   user = duk_require_string (cx, 0);
-   netgroup = duk_require_string (cx, 1);
--
-+#ifdef HAVE_SETNETGRENT
-   if (innetgr (netgroup,
-                NULL,  /* host */
-                user,
-@@ -1043,7 +1043,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
-     {
-       is_in_netgroup = TRUE;
-     }
--
-+#endif
-   duk_push_boolean (cx, is_in_netgroup);
-   return 1;
- }
-diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index d935a7a..1cfc88e 100644
---- a/src/polkitbackend/polkitbackendinteractiveauthority.c
-+++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2248,25 +2248,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
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
-@@ -2297,6 +2298,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
- 
-  out:
-   endnetgrent ();
-+#endif /* HAVE_SETNETGRENT */
-   return ret;
- }
- 
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 2568e8e..999269b 100644
---- a/src/polkitbackend/polkitbackendjsauthority.cpp
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1271,6 +1271,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
- 
-   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
- 
-+#ifdef HAVE_SETNETGRENT
-   JS::RootedString usrstr (authority->priv->cx);
-   usrstr = args[0].toString();
-   user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1285,6 +1286,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-     {
-       is_in_netgroup =  true;
-     }
-+#endif
- 
-   ret = true;
- 
-diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967b..2635c4c 100644
---- a/test/polkit/polkitidentitytest.c
-+++ b/test/polkit/polkitidentitytest.c
-@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
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
-@@ -181,11 +185,13 @@ main (int argc, char *argv[])
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
-index 3701ba1..e1d211e 100644
---- a/test/polkit/polkitunixnetgrouptest.c
-+++ b/test/polkit/polkitunixnetgrouptest.c
-@@ -69,7 +69,9 @@ int
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
-index 2103b17..b187a2f 100644
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
-GitLab
-
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 398f924275..ffdc2a7568 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  9dc7ae341a797c994a5a36da21963f0c5c8e3e5a1780ccc2a5f52e7be01affaa  polkit-121.tar.gz
-
 # Locally calculated
+sha256  0d69656d60800835c3d7d1f0a8362b32e1ae3ace2875a35bb624296fc52d5dc4  polkit-122.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 39048a988d..205d6aff4c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 121
-POLKIT_SITE = https://www.freedesktop.org/software/polkit/releases
+POLKIT_VERSION = 122
+POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
