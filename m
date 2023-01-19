Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C6C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B36E610E5;
	Thu, 19 Jan 2023 10:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B36E610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtFBPy4hDU1w; Thu, 19 Jan 2023 10:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF755610DD;
	Thu, 19 Jan 2023 10:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF755610DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 462E81BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21051610DD
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21051610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Lb1YRLo9nPg for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC45060F3C
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC45060F3C
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtkolJXB4GK1F6dbeLc2sClyoP0LNC6ywXKv3VbzV0xDU3NWm/lD4P2WxqltWRpecgt5VWg+YvQ62WHFHi/96iR+6Uroy8Bq5TnWIuOUdUwjGPiZq3Jg4RzaNspUZnaZYrnb6O9o/iDJEeC0isEoWco2HBSXYnjXKxTFev5Tg18PztJX/u+yzK8e+YGfS1OcAEp8OQsERRxsn2VmhVrptznWHbBzExcylMjZMZ0ovwOf0qCjCFRCes1JL/ezJ25nWFd2OMNTDKZmv1Hnwfne6o3f79ompt+fo5d8YPMhFF6O5IhVK9anzq6ybeQGKtPJqEAr8txf1Pl+FNJmI5GEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpwm+yarjoeIpbR77t8AsUL2DgZ4QFU726XEYzf1h5g=;
 b=IGQdRZKamuI9P0eTC+cbI7+iUUdFgZ4kKIg5Loeunm8BWhZ9Q7MKAdrSV3tNiEGxb5Nh8w/FXCDNi5XdBiC17GRPgaiVAUbQWKKqejZQVK365uxqY48uRiNvqjPPP2jJlhuEbQyMtIPPgvGns3XCU6awmaZBH+ecLNbuK3290OP7a4sHnp7c5cTRNtmV/bC73cF3AjKuLreZFUoYptUE5zu4PVy2z3FSE+6Flxh9HSHeHcu8IGLFXvrs8KvrDo7GOqRuUbxGdHE1bX78OKzmnXqnp+LGJEHVioaei1WK1TNfejy/IQeKW/T0y2jOfwI/WfV0H8BiaNW+bRb+HND0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:13:06 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:13:06 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 33/45] package/librsvg: switch to https download
Thread-Index: AQHZK+2FLiRlkia0jEKy8bWsRkKqfw==
Date: Thu, 19 Jan 2023 10:13:06 +0000
Message-ID: <VI1P190MB049398ED2431D7D34DFC77AC9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: 9816a291-887f-4a1c-06fd-08dafa05c22a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4DQWMcHnQBvUJc3p47aIZAqVgfSYN8JAndlApFrMuWbn/jrN2KGdkgLVpn/ULhsL+XZSPrXiBIx4wGUQ2ZXZ8wAc4MdzkeWWYdm3tRTNshOV8Ucgw92xuOvoSCzSGhtSfD5WD8kXCyQrvG3vHkFp2mDF9WFgy7zykyCOk8XYVxV5KVKPME/FQIhSY0YrwWHzZ/0O4jBPa0CuXhOJgTmGObszvIzgNnPK6cmPLyYvv9OsjOjP28lOandVk0H32AHMMyAXx79aV/yn5nIRsTcveAV3IBjpGvsGG9vQ8+ec4XK9DM0Mn5AKz4Pj1ya94+zuP0DuHqMbGJ5hcoOo+gBTjMPw8krkEXqngqzIjTad0Aq1hXfG/fQLm+Xssn3cumA9TsfVLcnZsKQa7IC0jxgH9nqBzWU1G56XA4mZ13PGg33grM1dI3PX9l/ohM9JkQ8bWh7Bl9z7pgq+8ODQDgwVylquv6zt3RBSSjtnclV5IDRXbJKpH8WecFHaZFmor69PKk/h8pJvn0guUZf4mDjt3JoxiUjZ0W3OYoj9c3bJmks85GTLL51PcW4ONIGTtj/oxvnLhvx75Lv87t/PaHiu5IvN1ZeZu5hKrLoa6on/UgtmgwUDwVboWgAhZTqhrIxP9GU0EzY24R2JPTQ7pOTS8k9MXEpQBr3/O/QAwtQn8NpGVsUWSSTaGWRwAPm4HmfwL2Qg3wltT6goWtCq2QSZaee54IolBnXpo2Z9KTBAKM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(122000001)(76116006)(38100700002)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(4326008)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MFdl3Fr2CbP13lZXIDasH5TPBBBBujMwg2iEIfnK6hSFjSjp5bn/qroDpO?=
 =?iso-8859-1?Q?VIeOwCi3KAeU5WSo5cLswKhpw+LNPtAMT/EEfPt7rUDkUz5+t2Y8gjJm/R?=
 =?iso-8859-1?Q?UeEwZcrfbUiCVTqB9qDrua7Ij10TbzJ4E+Bp0QL8UhgaJ9JFrI2hY9QgyW?=
 =?iso-8859-1?Q?H7Vg06H6SJyVN+oPXgq2F0h8CWIcvJsHw7bhgHSG4qijLVY5YnLuuWors3?=
 =?iso-8859-1?Q?4vAUpy03DpcSTVDTa1hTF8r1df5kl/Ge6u8WDuOkwO7ByWt3UI5/kQPBna?=
 =?iso-8859-1?Q?LI0Cr+LFMCVy3gGbWuxepvqU08c1dcttwbLihn7OiMVZ9mYSN6DbOiS1fD?=
 =?iso-8859-1?Q?Fy//tepYlPIkEwN9n+OEkzAaPz1p3zNswE3780Kc/4RIjjzmE3ikABIUe7?=
 =?iso-8859-1?Q?fyZLlj9X4KRiZkir7la3vCSoABIpe5FkDzhnzX3smKYHVDYs3/k9ApAEmt?=
 =?iso-8859-1?Q?EfvdYesMj8Tk9FE1t/8y4kGw5of2tZbFrNftlCOyYFnxnj6d1MczWSScEp?=
 =?iso-8859-1?Q?u5gVLksKJ38JS2y7/ZPgDz4xnPPp84bG3UbRYct509iMsGDF/0ooFEAL3d?=
 =?iso-8859-1?Q?KFE3UuV+G3oKGy5mM+m8saN0ASSqPMgHxKcvtmFEqyCfJp5KH1rXaNj0Ig?=
 =?iso-8859-1?Q?KYIbn5gCOFVK3Rw+cGXaz6htsGlTFk0H51L5So7L9l57RgPULOrMmrR/zR?=
 =?iso-8859-1?Q?0kHf0rb7mLtqVkNqEN6lRd2K2tfNokzExUaMVLKdLW5kPz1ZBDr5B95XX9?=
 =?iso-8859-1?Q?awM8hUdTu7p7O+DsMsRyucGowGJevcQ3D+zlrzV6xU+BDWHFaD0gmqG0EP?=
 =?iso-8859-1?Q?L8boCKZFkNU/brAmaPT9HczaXVdA1snZ4GZHa1U/S/4a4RMQP0xmOuq+oo?=
 =?iso-8859-1?Q?NgiNnz8jQfl0PwiTyMohZqJMa//r1W5RzPnJ+n9XGuTGFxz4UXtJV23X3p?=
 =?iso-8859-1?Q?rT17Ao5P52vQ2jS4RSX+3lAFbmIe2xfYWt79qO142K3f7Myxe003md9qh0?=
 =?iso-8859-1?Q?FADNpW+xDySdZGwBbLEJ24yjR9H1BzEOAm2iaiFYuXRBilbwj7DkiOHefk?=
 =?iso-8859-1?Q?PqTX+/eivjk9eQa1QzAsZRKBRNu88rfkHgVrrHdn8LPllhg56tuqe/HeiW?=
 =?iso-8859-1?Q?khj76mCf1cY3HaMO/fjj9J7Xuul+wjIRiEO29DgDNgg8FukNjzvz2auDec?=
 =?iso-8859-1?Q?q8SznJnf96X9JXmNyuRQB1KcAZch9BDu9YYAHV4AEPNegBy1dC9IT/VREd?=
 =?iso-8859-1?Q?Qt1akx5+ykJawKOnsnaxcXrzchUm3XMdB+pt/JWBJ0H/tWrVinWaiv/X2T?=
 =?iso-8859-1?Q?lTaWXp7c5COV5d6ZiD7JVjCKsm5QU77zb/7YGswLs5nCGIGDOCkMIW2kXB?=
 =?iso-8859-1?Q?m8M5JlO6Z7vbpyPgQBlbE5xI9BQCMDpMIE6gwdc8sp8V8Z5dPuWeIpdttT?=
 =?iso-8859-1?Q?7CEaushTABwtxcA1TVJEDfr6V6wL/zlgCn3tij95xiZeEPFiTZjL/00VXA?=
 =?iso-8859-1?Q?eOVMM53OKgD4N3siHx+RxoScjibrdRAMiNVmpPLvRWXuYNIws4lfSlm84H?=
 =?iso-8859-1?Q?8RW4QOSBb4P8RR8JSr4/Y5hq1GXTL+/jcqj15r7Hvx25cYAU9vNsFNnsQ8?=
 =?iso-8859-1?Q?8Za8GoagKxluo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9816a291-887f-4a1c-06fd-08dafa05c22a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:13:06.5192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jqBFOI3rDm4ANZreDSpj+inyFLmwLkPK/7JxnqLgTNooytAdGtkqSA7Z1rh5xMDvEds5AviFlG91phlXVSeMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpwm+yarjoeIpbR77t8AsUL2DgZ4QFU726XEYzf1h5g=;
 b=CpC78eAYHzVKpdsttWHGQIpXs5PyyfVLwRbjBKsN1/Se0l0P+2cO3glBfv5nibQLdwi7Qct9twkNfl7TtNilM8c0WoCZENIB4TYQaqmOsHIMG7MVzYrUQCci0oKkWXnFp32k+WW/OxLA1md2oSb0KImmNO+9CB52dTS44YFGmt0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=CpC78eAY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 33/45] package/librsvg: switch to https download
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
 package/librsvg/librsvg.hash | 2 +-
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 8b32c6581e..c8da3354f5 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
+# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
 sha256  fffb61b08cd5282aaae147a02b305166a7426fad22a8b9427708f0f2fc426ebc  librsvg-2.50.7.tar.xz
 
 # Locally computed
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 07a14b4366..df6559a858 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -6,7 +6,7 @@
 
 LIBRSVG_VERSION_MAJOR = 2.50
 LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).7
-LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
+LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
