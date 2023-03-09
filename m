Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E69C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 07:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4944E4171B;
	Thu,  9 Mar 2023 07:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4944E4171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9tZ7UC7s31K; Thu,  9 Mar 2023 07:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B4EE41741;
	Thu,  9 Mar 2023 07:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B4EE41741
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC9701BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 724E160E3F
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 724E160E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQos5tgYKzA0 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 07:15:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953A261186
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 953A261186
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 07:15:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqAmh6b9m39jp1nHtESvYi3VBkuDK71czZHL0HcUBtzag1EsP3PoUFckLQwDkF+jAXepN/dA9yKDC6dCGLSdPYoctMf2mnlEwhMpgWsgvUnCypFxi5i8nOmiJ9KXVgvLpDIaL9IsxW5tIkhepp1TcHk/QNDWQU3jlqV10RVx6BwZoyMhsJXifr1hvZT2/08KCI89AKyCoJMeSlIYx036dWn6l1+CgBeCBq9gDDsyOK4Cu7XD7vE178y71esG1wxC1R5QHkAhoicIDXifTBVMAPpyDWI7LPJb53w19wEaO+UKYgEohFEfrnLcO711k16W0YgabzqrpRumLrG/o/Hxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv9XkYX27zTy4+rVMJj3hGF21k7Ij4ZHSbH9kmg4RKw=;
 b=YADCrwS0jBp+mAfd4Izc+D3+U8ytbKnK0QcTaBNpEXMgiyF/Lj3lQX93Ezscstd7opfiHzf7h1T10RRgT8EiyiYh1kqFmZzKZHjRZsnuK2b9kbiqlPek/B8UY0h0lPxUV009qRA3GbzJN5THU78IF5AJcLOYOzA3dMCjI54isLQYaWRO7OKWdBFbC2spzuMVGKt56qpMHZAeNLLmy2LDNySKiLlvlZcpkiyhU23H342EVoUbB9JnHu047mOeXwOinWM0dh480FBCbtF58d2yJXsLSeOwnFxufnLchKOuTb7QcIxZZG+bYWcIuxSUMzlMrSZHOGoTkhejVfgw2Uggog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 07:15:00 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 07:15:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/libgpg-error: force cross compiling
Thread-Index: AQHZUlajuha8nav7yEK7jvHUQUAblQ==
Date: Thu, 9 Mar 2023 07:15:00 +0000
Message-ID: <VI1P190MB04936329051AD467C99376869FB59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: a1fd9901-df4f-4efa-2fb7-08db206dff24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yksHtTRHZL7BcBaxf8GRz9tq3ejXlNf7aKYTAkU3zH2BQYYTH5pcXnEU6zc7FKladQPudKHgeMagpf5RCTFR1NlRJ4/yXsmYDPdmEi5Ts/ksaRV5N9Wt9pPaFRRGzr/4SPxGxuZirNcYrpEKnlq6blWgA7OBzZ8/RQXLzjuQRcP09TY8Mr+muIJI4Jaf68hu3stnwq0piyPdjryaaYv2Y5vx6imX7O0l5ZsZ4wwalQarl7Ci1dkfOP+NfpypZ9ER+7LXscy5JI8HkMTOBNq2FDVHM0IqkXGFIm2VP+QSO1v9mBqK/w+uJxBAbyovwjrwlydjpR6+mFlj2h3xpoH7FpzZqjN8SUkIcF7BICJ2s7yxjHQFckGsf1qqHVqaa2Ydlve9r5gswymUfQknsp7EPigMQyip1+gEMtelVR6wr6NDt0L9az6UXIcjPQ4IOiIe+Pm0hm0LK/Yn4t4fIqF5M0gaMYmfr9/vpu4r45j6PKhIZbsEDnRJrt72JM4YqYU4tI54BL+hRNPSwH86JJE2Hu9fy0uxw8IuHi7EY6nSu8tGaZg6ZScDEQKlm1R+DdIkeq1qI4HWilJ+7lz4xKcAbUCX6QpahH3ImYZJ1tt7SabiKOk8Ztz7oHLNusgi8ZrqANcXMtIl+KvbxWQBDukxTlGyo5wxFOftesuIslIZtsOG5uawUi8SqAqTHyL2EYbm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(39840400004)(396003)(376002)(451199018)(38070700005)(2906002)(5660300002)(26005)(8936002)(52536014)(66446008)(66946007)(66556008)(33656002)(64756008)(66476007)(6916009)(41300700001)(316002)(8676002)(86362001)(55016003)(478600001)(71200400001)(7696005)(966005)(76116006)(122000001)(6506007)(38100700002)(9686003)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WAtq1uePI9ePAu2mRPJntQUiItvDl4t1V/sk/X+On+YWUwt77TYkJCx0yq?=
 =?iso-8859-1?Q?Ze8mbO1mCNINvyrhwG1PL3jJk8VfHjQ7w03Z1hcp+GTZOx7hSQrNoTwhI1?=
 =?iso-8859-1?Q?H0qqAbFXqb+hcV1SiVry6i4cEIqk9PF8vfBk5eeQaTJHNSR3z6IFvD2MNB?=
 =?iso-8859-1?Q?Z/ziL27lcdk3dSER/b+OU03XMH8K3uk/xFLqivGbuJpqYCh1w4L6+YOXNF?=
 =?iso-8859-1?Q?gGtVIZmPM0TWI2OieBGv4ks1KLcw5AtlwOMGhhK/j6cC+8DfhapZp3IKSx?=
 =?iso-8859-1?Q?ckEMFPDocuqjFkb8CItNiE20nzvHWnclHbdt/IEzHM63JFXaONoL75MSGZ?=
 =?iso-8859-1?Q?4QcR/aTHyWEkoth+zhWRFsuKy1Oo9FimqTMdh9LPWeYdqbV2R6fpQ6WY1f?=
 =?iso-8859-1?Q?VA38Tt0GXlByWtW7utHVMxjshScqs3rkgLhfrIqOjbEb3glRxC/Wny0lVX?=
 =?iso-8859-1?Q?qGMeHYouicB7ss4qz/IdwPWTf9GjxxhTeoqpPqDokI9gNzNv047HgjBcCp?=
 =?iso-8859-1?Q?e9JDHsb6OfsyGPrVbUqNCfF+w5fyYJMXGWTSCQJfub7yJPUFFks1I6YTFx?=
 =?iso-8859-1?Q?lcOmQbnrIFlZSh+ubeXanlo6DvFmY//biSyk7s6g/aFDFie+PedDMA55Dv?=
 =?iso-8859-1?Q?PbvMacPW91srVq+tT2aHMBXegBddL1e3wNwZ8SJYliCRJjj9UwOHJR4lOq?=
 =?iso-8859-1?Q?eFHzCQC/ibpLYzkrrT1EFBTsf3uGKDCx5r1qIMf/t7K2ABkRPpKbHGQgXO?=
 =?iso-8859-1?Q?Eoy+7RpQChitSGUI3rr1t0ROdTiVGID9p0fjzWbmQexh3v9pbB+xZak6bs?=
 =?iso-8859-1?Q?GTqBLqYVBqh4MhsCkaricsklBg2+EJahdKqr/uuptfAsv2iJxmPPZU4HUo?=
 =?iso-8859-1?Q?f8ohD+DPePb1gnKkt+IhBtPdNAwMd3K3Bd8picqOexZDIYAlTl4f0VI1JW?=
 =?iso-8859-1?Q?U+cTAYewF7W1LrQpOj4l88EsOPsQhh7lK4tdF2HhXHiuSWy3XSMc6yO8F2?=
 =?iso-8859-1?Q?YUCGk9FnuGLWlgbNG4GAI05knuVTBxGul1nwAZASPZHbIHztaQWL+bYlCr?=
 =?iso-8859-1?Q?t/4bwzkZe+V6IEhJhdp6+Y9S9ZVmCw6J6KRvoWdPC7W3XyLO8TyHFeeJfF?=
 =?iso-8859-1?Q?kO0hx5rV3tGV/h4brcpVNTe5buiFesJGXxfMv/+ScuCN7iNfHYFmh4ZIwX?=
 =?iso-8859-1?Q?KsVJkzohXjs3tt2/ZNzjrts5gXq0p2irbv8NQAUyDEZIKAb8VvGqHOvF/q?=
 =?iso-8859-1?Q?OP7yeHL9RnnZ80eq8qMT73G0XBxytN4Dm8UFfYhHjnPuFai4GtYiAIfcrg?=
 =?iso-8859-1?Q?/aq4BAGUY4vVsHeg3lnT1cI5xzi5lafyi4PJkUc0pJdPVN2ats+R+6jKeg?=
 =?iso-8859-1?Q?pLZhHBlDtRrnLSK3PvZkBWLHce/E7ux3MPZ+sWhwvFVrdnWy4/qhP957Tq?=
 =?iso-8859-1?Q?YukoiTqv92AN5Y3BkAEW5ICIK0JzZsytOif5RTGoYY6Y0qrmgUt8fwNSpf?=
 =?iso-8859-1?Q?z7em10kwzj1lWC1Csvc4kLupMeMs9NWCvVCko+yBZu6OmYSdv93c3yJeEw?=
 =?iso-8859-1?Q?zfKnp2Op7RT4MamRfmhW9wIwEU9gLQyzOJM+7shAR4GPfLk+XDp5rCgVOx?=
 =?iso-8859-1?Q?LuUQQuSoz0EoU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fd9901-df4f-4efa-2fb7-08db206dff24
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 07:15:00.6517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bApnvHV6oHUBkIykb9JCM4kh8KGI0x5ay/sIbhZ2SUYlg/FdRMphNWZfPV0361ClOen3L9hHZjGmbT9GDbwg8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv9XkYX27zTy4+rVMJj3hGF21k7Ij4ZHSbH9kmg4RKw=;
 b=2mWxRs8s87YxhRB/xsRu07kspbRM24DParGC06CQhFsTJa/2FX3hVLrrocaGhVh/Ma1Ofr/P1dx5GLy9eqdM1yCfGjdDeliMYQKRnmKgiaY1thaO5AB9xfFhWhxGP7lC+R/lB7gIY65i3kTGK/aL5L/OIzFfz0Sm0SxQ5dZbmTo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=2mWxRs8s
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/libgpg-error: force cross compiling
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

By default autotools enters cross-compiling mode if --build and --host
differ [0]. This should normally be the case as buildroot sets itself as
vendor in the toolchain triplet.
For libgpg-error the --host flag has to be set to a generic triplet
because this information is used to lookup the syscfg.
When compiling on aarch64 for aarch64 build and host would be the same,
therefore cross-compiling isn't activated, which results in a build failure.

Fixes:
 - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/

[0]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libgpg-error/libgpg-error.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 3f4a45a7e4..3ab8535a9c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -14,6 +14,7 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = \
+	cross_compiling=yes \
 	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
 	--enable-install-gpg-error-config \
 	--disable-tests \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
