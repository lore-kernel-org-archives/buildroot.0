Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED7BC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 12:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A238140866;
	Mon,  9 Jan 2023 12:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A238140866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAok98VGmfAo; Mon,  9 Jan 2023 12:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402DF4150E;
	Mon,  9 Jan 2023 12:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402DF4150E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8448E1BF21A
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D36F410E3
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 12:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D36F410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iay4sLTZxVq for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 12:59:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7181A4150E
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7181A4150E
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 12:59:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJH7nKcixMfwIB5SCWBtDm86WpLGvqo7hjdse4STH6Krey7JFzQrWib55HM3PFtD983uoOkBkOTalobzVhDhCvWneapV4ETajiqWt+SPW3xQtlcPVgKwEhjcRCRLExbGMPHwhiPhPOk+03m/XyG/V72OXcs2Tgj4AxmsOtgxDbFLUqhID0WPBgRCLJqMsKtYrWiMz/m9sxuFRSD2zxaF6IhOIXg46SzohaybcluBPQfeARscNmkmUUShVL/rduJFnLCaJZLIdKVHnNTbT3xRYOnJVsHRu7ZP2TOHQhPLd34cw3q7dCm45uMaU9YYjhrCnpAr2lrLWS9FitngptBHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa3i9F/oD2kRJmp+SXnrJ2yR6xVyKJ8/8FBlkXJp+S8=;
 b=nFJ8VlEVJo2QJ0f9YGZIhPsvgWZhPnd7YaeqjA7SGTkcGfOODW4K+x706VjwQ7W8HgJgPE+Su4aF6n/JNbqNuO8Zqbo7PihFfF2Bwq0Ac1POMc5IztQaryrQM+FGuVFh6+OQUCL92WXr+uGkqtachZmqC8Ulvi7Id502YcprM8ysyf7OFUZbjdz7OYnIGFDZhOZRKBWPChK8x+tx8d8WSkpxisz8IbKkMhoy5Uh7sgRDNNdu4ADlRwzgK2Zwzsl/6QZWfqn3h8rcWyY1EXgLiCZE9ydo6FVc1Y3U7Ai+GFCBjiMCnvbWiANIYWsD9FUSaZIhFBJTcDuXcnIVTl8Y7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1795.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:59:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:59:14 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/4] package/at-spi2-atk: remove package
Thread-Index: AQHZJCmr1O8YgSYn1Eu1pQtaSS/q4Q==
Date: Mon, 9 Jan 2023 12:59:14 +0000
Message-ID: <VI1P190MB0493C32FC5DA7515166664C69FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1795:EE_
x-ms-office365-filtering-correlation-id: f3e33875-3c45-4b91-9a87-08daf2414f3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FuOUqyYa+EdZP2GMHpLAJumuUjL/EpWZbarjq2G7tWJ7epKszcmtjMHDuf60yj6luhN7+uKe9Db2qh02JO9YLnTfgJabg4xElwOnTl8UhtXRQh/6+nOfOV+eDFl3j9J6HrAtZCLiPJSXPMuKuFM+bSOpbagPkwR2HBSToa4acBHdbi4VNvFJJGF8aIVbP4InphtQNQS4ecOhkn2m2oEOC3kBq5MyHswtEPDgg+hDhTX7/RiV/NS+mvxbtFMUpxxal76fAlev0aYMbIzAntYw2Zn0wNZY1GZioePY0fhs2nnTSdTwBdsaQkn+zMN3BklV0L63ivyjDnCevIlARt3HGq+bqoaVgdH7CD1QKs5oYMjnnFdG+uZW8tNvC9gwFhr/adhOGp57N0lS/pea9fuc7cWnAZB7eEXz57aXAy3+7lX031q+zU7Fytynkv+QZxwoBjDkkUhAUOL6xadAJ8BKfr1CbFj95pAvhSYtjYP9rgCF978eSeLVMJ/85LHhyVDcAW2IrEJ5Fd51vpzsokTptfadEgVKyz0y4Pd6UobRUjklpYAsxcq3J54z/dxN7RhjE2GlskERi/dJFCs5tR9Y1KHHmMqgL0sflIgg/Bo98nxCmAbsAHfdtARW0qyV+dqf8Ug9mLSaK3bhQCqbks9UodCLAzkekgGldYLprsuSJ3jS+8Vmqs20iSadV5TGm8GLvmQfNc9gRKe0MbhRSnzI6SUWfHXsA85qP1EducliEY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(451199015)(5660300002)(8936002)(52536014)(41300700001)(6916009)(2906002)(83380400001)(38070700005)(66556008)(66476007)(76116006)(66946007)(8676002)(66446008)(64756008)(4326008)(316002)(33656002)(71200400001)(7696005)(26005)(9686003)(186003)(478600001)(966005)(6506007)(86362001)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+1vulClAY3x2iFfVvKkBrjLJbnsPAKcGnstnshtRHJ1QtZGt+3K+DFTIdm?=
 =?iso-8859-1?Q?AoVNxpC5bSI+v/iuEBNgj1g77caSnAZRO1a5JnnGTXzujxMeyV0IpzstpS?=
 =?iso-8859-1?Q?CnFPUKt0opjRQE+oTSQsgABBLKdA2zi45ebtVi3UGUtHlJoaQJNCWv3//3?=
 =?iso-8859-1?Q?0XmZqacd1aWnJDNYQ+xRHne/dbdYMRCC8+/+i4L6CDE1tUfzTXTWKCJiZi?=
 =?iso-8859-1?Q?UIJTD3euZMVsbfclz7sijU0Hr8X+rco7RR2XSVVRMGVG6cW+bn6j7vr8HX?=
 =?iso-8859-1?Q?sJTaXRhCkgrgQ5r2mvA09LqhkE29ZRFUfXmW4H2Pgkwm0g6Z7O67XJyRCP?=
 =?iso-8859-1?Q?pz5scexvoQylQCIheW+d4SYu2etI3pmtQSKLIfopSZIJuNRXyIRcWg550Y?=
 =?iso-8859-1?Q?uxRYo1NFhgALNxn8DcuPr5+iafq0Ub/uiSbZumzK8zF2Uj5GBIYENDyvte?=
 =?iso-8859-1?Q?ms0rpZVv1BSCkNE/xZHDhzcSA6VkVAzlowi7C18Pnq8otsvw3K2IPAG73S?=
 =?iso-8859-1?Q?orSYlJCr0D/GyYTaxVY0oDEa/YoyClUMjnJZ3XiDOqpXK/iaU1XLG18+4p?=
 =?iso-8859-1?Q?Zl0yrJcjmZJXzCn2ih9L7FBZahPwBmNiYBz07LjLiuQdVmGOHRrhOjY1Ap?=
 =?iso-8859-1?Q?eHlf4aGo8bnkXFN/V0Fnj3julEfOGbRubRQ4sZoxt2jGP2UVwyO6AJkU1Z?=
 =?iso-8859-1?Q?v8SMqtLGUfVNljKz2fRAo240OgpaJTX3Pv9mIihaFEjCJ+Jo/GD848HJ88?=
 =?iso-8859-1?Q?Wn/CcPP3yRNgWhhEhz6S40T0anrrkJ2wKpyIGnjMPS4pipqhSlADV2YZFL?=
 =?iso-8859-1?Q?nnHDsud9+RRceeTV3YF2TXiHu8rtpO0+K1EC1tjAyPc/aoSIKVFIMJsjMX?=
 =?iso-8859-1?Q?To+r31RGQ+ajS/N13Sm/bNz5PqNf8zM2+yHVTfM/Klghz6QPZiWp87tvno?=
 =?iso-8859-1?Q?kYADgCz+//HHC02uCubjqAECGg5qpabT6BfquP5Rcpz5wKs88sl4+1URjF?=
 =?iso-8859-1?Q?OW0XTJkloA4dNcSFCDyp4ICG66RP46iysB7mhG3CpUdFr0/GBa26dLWLEA?=
 =?iso-8859-1?Q?TuH0tBuFvZ5By1ITfUBGTUehbKMqqDLbU9Qguh33+rMtwoYR1W+V29xPHz?=
 =?iso-8859-1?Q?OpLQbLRO3bvlkAPnHzcUS0H/psHDPvFY2j2FZxpuhRSIoWgZufC9kuGr1Z?=
 =?iso-8859-1?Q?GrU5aM8X2/5ufh4Xy1PtsR1ae2VCPwSieWalmlV8DJJhSUr5nfEIMxmLYi?=
 =?iso-8859-1?Q?Q67VWQU5sJwFOWxvNJO1ASsgolbU+OtMDLWQvH8yqQ07N7t3w2xgsdQ17a?=
 =?iso-8859-1?Q?Hzg5RQ19uCkFHMEO36CY3HAS1NeK7QN9MrJzdYOkciheCc4Dlv7B7mMOJz?=
 =?iso-8859-1?Q?GGDM9avxK6JXge/yyltj4PHgjD7nvUwDncCrL2GyWT+bK56e6Q6ODtGiIZ?=
 =?iso-8859-1?Q?UzViGuW3zJ1ljpFLtFbSKDMHxxHnlj73+ETKA6mg9OHULfVfKgSJPm9Qdu?=
 =?iso-8859-1?Q?d5n9VoIVrcWjcSgd2AghZkJtVHPIz5TrNLSGQUl3lSmYHElvA34qnlrW3C?=
 =?iso-8859-1?Q?2r4eErBcW35IxUhm4N482DifvO0InMx0EXBAOtCul76D75Tb0UC2gnVqND?=
 =?iso-8859-1?Q?7kEcrCj4Ip4pY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e33875-3c45-4b91-9a87-08daf2414f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 12:59:14.2332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYUktpLdhMxJn/8wYZnhuOACUdpjHngs2se7k6QX5jwqXTSwyhPdjNBHcwiPMRNuNvPRNJHO0mwA+R3e1//itA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wa3i9F/oD2kRJmp+SXnrJ2yR6xVyKJ8/8FBlkXJp+S8=;
 b=HqVrN2RohOYFrlITIxQjUcVZR5bKC4bRoMSwmFoChbyAfGHHT6hMx3HFEwDCXLjViIAyRxhRx7zeapnNSDsB+fyESbD/fSIFqaF/1FlHedU8QZfwYNqj/vmFj0N5spY5OxONxuM35tZD31PjJKYGBA579lKHTYbgmTo/5CbLbis=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=HqVrN2Ro
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/4] package/at-spi2-atk: remove package
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

at-spi2-atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-meson-add-tests-option.patch         | 43 -------------------
 package/at-spi2-atk/Config.in                 | 22 ----------
 package/at-spi2-atk/at-spi2-atk.hash          |  5 ---
 package/at-spi2-atk/at-spi2-atk.mk            | 19 --------
 7 files changed, 7 insertions(+), 91 deletions(-)
 delete mode 100644 package/at-spi2-atk/0001-meson-add-tests-option.patch
 delete mode 100644 package/at-spi2-atk/Config.in
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d66f1b958..184bab6097 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  at-spi2-atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "the QEMU specific targets option has been removed"
 	help
diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..b3e02154aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1609,7 +1609,6 @@ F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/earlyoom/
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..5c8dcd849f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1530,7 +1530,6 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
-	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
deleted file mode 100644
index 3a2aefa090..0000000000
--- a/package/at-spi2-atk/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 May 2020 10:29:36 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to build at-spi2-atk without tests,
-it is especially useful as one of the test requires libxml-2.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9fce5d6..61bc93d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
- 
- subdir('droute')
- subdir('atk-adaptor')
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 24c9228..a4abdc2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('disable_p2p',
-        description: 'Disable peer-to-peer DBus connections',
-        type: 'boolean',
-        value: false)
-+option('tests',
-+       description: 'Whether to build tests',
-+       type: 'boolean',
-+       value: true)
--- 
-2.26.2
-
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
deleted file mode 100644
index 9a7cfde0af..0000000000
--- a/package/at-spi2-atk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_AT_SPI2_ATK
-	bool "at-spi2-atk"
-	depends on BR2_PACKAGE_XORG7 # at-spi2-core
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The At-Spi2 Atk package contains a library that bridges
-	  ATK to At-Spi2 D-Bus service.
-
-	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
-
-comment "at-spi2-atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-atk depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
deleted file mode 100644
index 9c564c32af..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
-sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
-
-# locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
deleted file mode 100644
index 232b577230..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# at-spi2-atk
-#
-################################################################################
-
-AT_SPI2_ATK_VERSION_MAJOR = 2.34
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
-AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.1+
-AT_SPI2_ATK_LICENSE_FILES = COPYING
-AT_SPI2_ATK_CPE_ID_VENDOR = gnome
-AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
-AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-
-$(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
