Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA858FA373F
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB0060AE5;
	Tue, 25 Oct 2022 06:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB0060AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPxLmwjCiO_s; Tue, 25 Oct 2022 06:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6D660ABB;
	Tue, 25 Oct 2022 06:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6D660ABB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3CD21BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 818CB401A3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 818CB401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLHM5xJpa_4K for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:07:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5006E4019B
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20055.outbound.protection.outlook.com [40.107.2.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5006E4019B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOwkjkFYqMF3P7ctWk3o9Y+AY56OkrC08vIdp34MhJ7XEG4fo5EDKHQIOF0Kmk6JdRD/uxoNTs42CvFd+NG6vzwvNY8LYxkv0vK+y0Qm3mieYUXx1ofymHXTNKGARXqE3NocqAj8tLD+Y3YBr9igWqRw55Tcuvx7owX7npxUHEJQ7KKGE6ZQyGqE1YZG7Q0pf5T0B6Y/ddkx/IGb9U+CF2kqJn3XAmiYGOFQ6gkkdX38Me6yTHsugkGcklcZPPSI0FYADf3Lzlk4RnFEnt0ynix0d5kHyMeL2fL883b1JS243Di2BOoGobqKZvVh2uM1Eoq1gO1uupUDlmEeFbrOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Opc5PsAiXtYF8f7y84mwLkTirlr0aVv8gfJJeHky4=;
 b=lzwAklM+25/e+3f5WSEL20RpFqBnr2TkUgwe3LJ60U+NDQJNp/jJVsB2aH68t/CLRs+7RKDPGuGHUi1ecm7XWHA10GLP7rh7/KRkmV74qYhcLmEJwuiA6vkxizhMmg9N+EqRo4VybzbV3hxwLCGjnWWzPy7rjLaNUT5/blPHAsOT5cnF+rHT987oYtwkZaeP2sXPZkwRibOLaFbyfW1QSpOpSklpLXNRLO3XcsePSpgoAXkU9Os55TI381NAuo3gX77o1af9n99XSP2le/z4FSan2ItK2SVMUs9PNhdxl7GF2cMxDSFaigJ5gfgEdT38oyhAqY9m6bm0iPPOcxEBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1793.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 06:07:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:07:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 03/11] package/lld: move to llvm-project subfolder
Thread-Index: AQHY6DdBKWAzxIVjAkW+LaFwCvivRA==
Date: Tue, 25 Oct 2022 06:07:02 +0000
Message-ID: <VI1P190MB0493C88AA8516546768559B79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1793:EE_
x-ms-office365-filtering-correlation-id: 06cbcf97-f655-4939-9b1f-08dab64f2299
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZfJcWn0tZgJ7Yu8MDIH81UlM47fmEeMK7ZV3c8YdRVqpspN1q2ChxhLgENoGm+PEeJPAWZ3WbQ/Uzsa/2pewx14zloB2K9/odZW/4QIsVmO5z016Di01uWyxm0XvntvI+GYDNzeD8tncCXASkU5daQvB1veb4Rpes+dKqcNTkXOibH5o3Qgd4sNq9HM+1I5oa083XBCaOn0EHFMyoKdOJnHg/1enlnnt8s56CNc7U9Jnj3o58/4hiyzQ6U+ZN8lRvOTmVBDH4+Egi1vYEaByjArbwAo1ZYVlJYkulmivyHx+zLLZ1bx4gPM2V0hjXm8qnMdmaUN2MkjZxpdP5gDimZDIiGQdRpEw2C8cJ7+9Pvy5IleTN0mfXiXpSqCtsPaD+o8B1CEHAgotefsCcFlsGsZjLM9F2sllH4N2kCp89Ob69ST6hDA5GS9aGmdqlzZSgVFb14lrq6w4O31Jp+fBnPbBpT4pBV8RDS9abw576K4WC/MbkCfV/zKvhEJt4gvLAZGnHsaRjBHZv0shq1dnLWMEVrNyT+Tb3LpXqmdD7hQPS1Bdw4sISouWnPH021DfHVgYBeAfXXMNpfDjX+kDqZgwk72k9zehbJQAdclUU5ZNRd6Ogy5+8OP5oHzxXuvXVeTjFiSxGLVBIEerfCe5ZhdBa7p8hvCvVMpik1UO83zygZBP8otYtfrOdeOvmZfzbCL2ENrbmgdR8STkOWTh26OHvqQCRkQ0J+7KMUwCZ89kwANUd0yYrqCnfAuTlWMD65OJ5Mmle0ah5XVF2I1vMte5foGtjVP9VtLqHIdlqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39840400004)(451199015)(52536014)(55016003)(38100700002)(122000001)(83380400001)(186003)(66446008)(33656002)(8936002)(4326008)(76116006)(2906002)(66556008)(66476007)(66946007)(64756008)(8676002)(6916009)(5660300002)(54906003)(41300700001)(86362001)(316002)(6506007)(71200400001)(7696005)(26005)(9686003)(38070700005)(478600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?se5KU6ZqaEOzU3YCqASsiRPWoXkb4R1BIkcbcpCahufuwJfwYJn+NKkyJj?=
 =?iso-8859-1?Q?ynCF6HW5eV6AyBsmjJi1sxTCNRYcpPTArT1/gzafii2XGOiiL2r6EgJ37X?=
 =?iso-8859-1?Q?+eEWuU1NFajAhi7WQ+VzJnlKJ5UqpKEaMC/fqVSO2w4ey0B301j6xb17Vt?=
 =?iso-8859-1?Q?evU+wmoDbU4i3nZMH0/wSqa2aGkub7mg6/oSE9+HSLv5eUHuOFTJfBmsjf?=
 =?iso-8859-1?Q?E/11Ql5Q9OLGf58xfLem+B6QrEqHQX4B1Ck5AMB78K+Mg4n8rUhD0r8yI4?=
 =?iso-8859-1?Q?ebyNfDQIsKDX50o775KI2KIcr0OVYQlvRFWJBAKxKc/ghBtD8F50ebuYFZ?=
 =?iso-8859-1?Q?xIUJmPHRfli+iKWq1d+jMxGAAj4Lo+0SO5jfQYqm5kgfVqbfqjgLwSo+Sd?=
 =?iso-8859-1?Q?nitWCYL17cODNoSK6DKAO9FTaLEwKDg95luoQaN2iO7nrf2R3ED/pjMVfb?=
 =?iso-8859-1?Q?TpSURFNaIQcT7/QzkKn349ji+mY7lQCfKzX+QcvPFypNn/EjPdDKdu0YRf?=
 =?iso-8859-1?Q?rROeNA3+0P9f0GqTitPtMkz/DP2LcSsBQ0EcYjF2cZsoKT/AXLTkgWDifS?=
 =?iso-8859-1?Q?juJHo3NEFdllDpesFRVGXdViK68EfyYzgy2U/EYqGDfI+8PjUYPCzDqLbW?=
 =?iso-8859-1?Q?pYHit8PzzJFA3DxKPDpWE/r+7Xc3e7tIzOaEkxBvf0g13xx3pmXG//oxuj?=
 =?iso-8859-1?Q?kXkjDagPNOxJUEdGxTqexiNOBjW4wqXs62i6w7zmw0xTBpZmt4M7bcpZw1?=
 =?iso-8859-1?Q?m+AY6ozUcDa7LxLo/y+/jeuKwbNa56peVOSAOaa8hrnMiGwvTm1fFjfKcp?=
 =?iso-8859-1?Q?zO3kAj8ava2Ornie26U/e0SGE5IDS5k/XIsOrSuOSOmoA1cIJgongKZ2MD?=
 =?iso-8859-1?Q?JaRQFfZyNnNGs+3HfUvdKx/pLjfg+TamxsOlwMd+f3j1WVhRbEUoKxl80M?=
 =?iso-8859-1?Q?OLNbBGHtdJfvscGnfNE9gy8i8d9F539JF6EsVJkxst09lhFRBNcB0A/mGR?=
 =?iso-8859-1?Q?PiGLwaeHilBYDZHrkixQQJT2sX0nClNWpB5/Df0lXFM6GXgL3qKIUEM1Qt?=
 =?iso-8859-1?Q?7KZoGi/LPyJg4ccJl14fRSUBLXfF0KhMfR3PqjFhyn81qUJ/dUMs4lxiCU?=
 =?iso-8859-1?Q?CqNmUfW91Wh/z6UDjPbiFhjNTlNanPqDmGP1vKTFfv+h5DNVWlK+mycsri?=
 =?iso-8859-1?Q?VQI9KRWB9VZwC9slqkFaDguhKqEfUpbLq37gsZvgqzVkBR09UnRdAr4spj?=
 =?iso-8859-1?Q?CRIh1ok4lRaDChL5NpBjXTGO2JfErt+BSHKwPjP1dxhRc4MaSK55YcqKqw?=
 =?iso-8859-1?Q?4sBEj4FmIQy3CPqatjhYxN5uPL9JosHWpEwm59/Hi/9IzoQD9R0y40K/Cm?=
 =?iso-8859-1?Q?FnIYCS2UAcllADuFos0N7JNQYS+oMdsH3uXsfa4WsGGgUhJym5iFXJtxPb?=
 =?iso-8859-1?Q?Vvw3xKheSmsp2dUS8hj443NbEvWTs5QSCR+WM0aLGZh3tdtdTj/N0CUnCR?=
 =?iso-8859-1?Q?x+kKI3peFq/+aNttxFOBeAZYZ6+qtj3Ma7o9uBtBFhXhN2TF+mVgGQrwQT?=
 =?iso-8859-1?Q?hSw/dcltZJWLFRKEGNW/mPKbWJMminBivbnABwAWwe6GDgf/IL2fqxcG8I?=
 =?iso-8859-1?Q?BTRRi5R+qOsgw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cbcf97-f655-4939-9b1f-08dab64f2299
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:07:02.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9TlJk5W+40bcJGGNWPnjk9I1ZJxckhajwvKep+qr5BdsigST6tldPpKEHaq2hANZ1LrCtvKCwL9RzVUBmyaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Opc5PsAiXtYF8f7y84mwLkTirlr0aVv8gfJJeHky4=;
 b=Eh3xJjfsON77zj9slc+3xcvkk0snK8NNNUbP6Vbi4OGXGX5AA0Jc1FKB74o6SFnVJyQCC7d6QLKRxiTqaLeWFHcT1UnIWk/Mtd0tdbVVFBOkDHudK3eyV7+qC2MvzHfFuck+s9FUN8hMCrGAJJyCWIwRuegL9uWiI2N5QXTyQrE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Eh3xJjfs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 03/11] package/lld: move to llvm-project
 subfolder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 DEVELOPERS                                    | 2 +-
 package/Config.in.host                        | 2 +-
 package/{ => llvm-project}/lld/Config.in.host | 0
 package/{ => llvm-project}/lld/lld.hash       | 0
 package/{ => llvm-project}/lld/lld.mk         | 5 ++---
 5 files changed, 4 insertions(+), 5 deletions(-)
 rename package/{ => llvm-project}/lld/Config.in.host (100%)
 rename package/{ => llvm-project}/lld/lld.hash (100%)
 rename package/{ => llvm-project}/lld/lld.mk (87%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8763fde182..d4bab1aa36 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1609,7 +1609,7 @@ F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
-F:	package/lld/
+F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
diff --git a/package/Config.in.host b/package/Config.in.host
index 8ccbf40a84..60ec97a39c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -50,7 +50,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
-	source "package/lld/Config.in.host"
+	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
similarity index 100%
rename from package/lld/Config.in.host
rename to package/llvm-project/lld/Config.in.host
diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash
similarity index 100%
rename from package/lld/lld.hash
rename to package/llvm-project/lld/lld.hash
diff --git a/package/lld/lld.mk b/package/llvm-project/lld/lld.mk
similarity index 87%
rename from package/lld/lld.mk
rename to package/llvm-project/lld/lld.mk
index 4bf903cda0..46ec3b13ff 100644
--- a/package/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 11.1.0
-LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
+LLD_VERSION = $(LLVM_PROJECT_VERSION)
+LLD_SITE = $(LLVM_PROJECT_SITE)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
