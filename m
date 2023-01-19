Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C43C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C75BE610D3;
	Thu, 19 Jan 2023 09:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C75BE610D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPRC0sSSGDco; Thu, 19 Jan 2023 09:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E7AB60A68;
	Thu, 19 Jan 2023 09:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E7AB60A68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39FAE1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08135404D5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08135404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qVws9cAtjXF for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD19A40222
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD19A40222
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmdGTBczJtdkcJyhgdoHha/j17roH4tKAQMTeOwpIzuvGPbOGPw4/V0ReCA60fVBfulGHk5YgmqtmObFGx9+ciJLwOUSW1Q5s/AUMs7z1dkwhV1afaVBLPD1jdagg+2nDBCsh04CHeIDcYTnyiIryv/2eTOEU5Zy7eqzeF+KRNGBQa+8o4OKB/zdoP17iM9sY6lQt6Ah2L99CtqwkNS8/pvq6z/PJEQ5TH6+gEyT/dfMU5EavKnbRstsO2YF0dIU82bGmdS/O9HeLhtmbdORCHQFB6zOgvfg4SdZJYFhQ+BG28pdBbB/dCPmsPd71w8VYd3UqmIJhohcQwjBmMf6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSoH+TIIn2wML+h+ICMO/nPs3UFqMi9bk8e9uvLocLE=;
 b=bqRatQN8vbt1y4oGZXcDfn93tXTPBa2AosIyQWOdO5187/+MKBjUVChTt83FxNQkK8FcmnA7/M48qpdsm6mNBqxO5hswTK4uy/WVHl3qVdBlrNRWSKbrznQRqlBgvS89GiCfg6n3LEmQqESGdtg+Qsydev+uo1f0wDVBEOw0IvuPIToa32KI6BRdYGKDLaOiXgwSpZhLJQdaj6ZKwpFk470RS1ACDMABEozCNu0zFg80H2/cmILw4iyQFygo8ApPXik//IvLD0EtDFFONeebX2bwZk8opl9UwgYFRCaq+9KkhBcoDhqsWbFDrS8kBHuWJAFuG0MU5fskC/QA35U+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1956.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:55:44 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:55:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 11/45] package/gsettings-desktop-schemas: switch to https
 download
Thread-Index: AQHZK+tLgphD54C1uU+RFjpvXeTm+g==
Date: Thu, 19 Jan 2023 09:55:43 +0000
Message-ID: <VI1P190MB04934E2E1BFF0D3A982C8EE99FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1956:EE_
x-ms-office365-filtering-correlation-id: 38c7741f-4fc7-49e1-8423-08dafa0354a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PJd+h7IgQN4mD8bb352e3hOOH29mpJ4mzPhziC7/uDXkKDo8+iDacMqaFm5+YX3QryC2xKVYqvZCzahQEULzKirbtQwsScFQoHHM/ohgA1gHm0L7fGOH1vD5Mx7nhm9EUtya03FTtVZjuG+Ngt2p8hY8U8t6541SCkYtcFIkpQhkUzPLWXrarvqDESp1iA7BRWjamakGA3/N2jHsaYba9y6t/ITAIs6EVmHg5LE62d81xrhtvUj+j6AUUw/kfqqwmuVuRZbtSMKupmq+b126omMo3dnoujTLvQxNw4vL3sx7qJHQ8E3mJa29lh/V5Bd5RpG3VmKhYUlSpOMbP23p4bpD2/KPKawJx5BFab8rDEBaaQiK3PrnYSDMmuC9J2DRu5esxHRTeFEBVWCg5oV5n38d7M+vGoQMNbtBMYGIChXCWNsV3Ueju1tgHk4WrqhPnINsB2vkBH0SBdBLNAUFBV69JGEQgaX4Ou7XTb1pZHGY2oMmbMtkpTjPLwyj/f3lQ/Puziw5hljjO4kBquZWyf6qpjUVXSQMl46MY0/JE2CDgmQst3c2DOxyoFd1X3ESmFnkn6d3MRzIBcwhVjypDusojhQQi0bhx5Eo7H3LryI4+PhuOg/91W3j5ck5Cq1dBhWfSTRn+aSXyDlXm6vKS7skslNMVHo/JVgMnQ7BwxwtCkfqWoBL8XvL2xVylz9NyKd2sjD9+GD51qHSxk/gnx7LBppFvYvlvvqdVP88I7KjS0XSc7Hq0v5Ea2PWfLJD+roPlwnHmGHBSFZ+wmIxnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(346002)(396003)(136003)(451199015)(71200400001)(8936002)(316002)(122000001)(52536014)(5660300002)(33656002)(86362001)(966005)(7696005)(478600001)(6506007)(2906002)(38070700005)(55016003)(83380400001)(38100700002)(66476007)(66556008)(8676002)(66946007)(6916009)(76116006)(64756008)(66446008)(186003)(9686003)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mWANraiMsaeMTUGbvtaXbQcTfBVcqLbI4+U+XBkzPUYGmVJHnguBjCw4ia?=
 =?iso-8859-1?Q?zf92V+t9asQZmr/Mi7ypfgWCh2sf2Zn+leMzrVIsJRFdNVdElvJJZ766n4?=
 =?iso-8859-1?Q?MxFqqxYdkXCx8Zmtzk5n3jlAMrkyS8T7ttHSFYXLcfV7tFcVVKcHtlxtm2?=
 =?iso-8859-1?Q?McYKW0g1w1KL9e7FvaRFjcrEmHQ2OJrURt+oR++L2hKtd9iytpdxT1JD2l?=
 =?iso-8859-1?Q?5lkiQQJhk7yvCihTzdQRC5Io45oUzRLNpMSrUIPErWdU8QGolSYLa49/eF?=
 =?iso-8859-1?Q?NmzPr4CFux3RhlRA6hL6aaeYzc0LRVVIRTmwPGJAUEH4DCHgwbbSj1ZKO/?=
 =?iso-8859-1?Q?RIz15vhIfyoLjtCBbh1ANCQ6koy2NEiwqgG19CdlFnzyj+SDTVid3u9o7R?=
 =?iso-8859-1?Q?W9rnx4Zj6iiVrmr6CO7L+Jz5HcTpSHvKqrgAFSX7xWTRnX1uqvLvSSI97a?=
 =?iso-8859-1?Q?DUoVd6MVnKK7xB/VGQqua72ALJmVT4DR4ltbfwRdpFz6TQDCkndJlJ/idl?=
 =?iso-8859-1?Q?PgkjOlCtAHiBgAGnP5QnZrV/W6tgCJwkMHjtgPkmWrslH7TAPaLyJNZ8ls?=
 =?iso-8859-1?Q?NOfzw5dJRyjPrLkrdnzGMLbwPJAbi6vPB5EoUDgLK152BPLInlu8mEPD8s?=
 =?iso-8859-1?Q?CeNSzCAtn3AFocrL9n2qShtJh+SE/AtmLIS0bEDAtiZzPjTqIhEK1Rwo2j?=
 =?iso-8859-1?Q?WL+xY0cDnmdKAItmEmVz+RJ75xvoSAGRCPgAlAVP6oZflSYtqYbK/Kka5W?=
 =?iso-8859-1?Q?8DdFuC0KoueP4s29hTmLb8VnySl6fUjjMAEIi4s5faNdBAckR3o8+1uXa4?=
 =?iso-8859-1?Q?7rQ4BWXafUWmvs8UVsoJJtGkXduTJpg7gkbQmQpF41ODEl74iyU7ODGEvh?=
 =?iso-8859-1?Q?h93gtLKIZOqRLEv8JMP3Tnxxgx6rcCNd/0Rdm+KJ8pJD9FqtNX4GhZr5nl?=
 =?iso-8859-1?Q?Fvkyf+FVLR38xRuJPatJRXpX+Tdc4x6kcv/WJE0qRbujJvITjZ8/hnMPK3?=
 =?iso-8859-1?Q?aTpu6PggZneYH0tYXzUCCY5vLwWTYtpfwEQuYAHkEtVN6cJ+D/3BKIjwvq?=
 =?iso-8859-1?Q?rT0jAPzy3UBIUbAn8ke/v4sQMF4Sq457z9eEijFSY7KpNYN39m9GxIsbWU?=
 =?iso-8859-1?Q?oxIyWb0gsfTRnCfuqMV09B/WvqBuvlAjbr8gRVcViKJUs0MMMbAbemZbZG?=
 =?iso-8859-1?Q?gVt8I/ROH4FEQPVKFZPjOOWNwSoJ0BKUsb7mcIsPCdHbKk/v+zt+KlFiW0?=
 =?iso-8859-1?Q?ZjgktCLur94UL66TRBFTqUqVYwynM3bkFNJ4LBJTNHEU0lhwcRFVTaVoG4?=
 =?iso-8859-1?Q?Bskcb1r1cIUuI91Vv6Fx1EOYSvIsi/YAERjJ7ehw9sm3XoLMXr6yqORY90?=
 =?iso-8859-1?Q?ZU7QR6S7wmiTgxWeVy06NzAfrDjC7EfAC7OC6wGXA5E9P+wX0O4vfcM1mE?=
 =?iso-8859-1?Q?SqaueUMfGj2CgF3Fmf7Zj/8zFCAKMTpxaqAKDOKjHS93Hy9yJlF5HysgYq?=
 =?iso-8859-1?Q?XJ75OU/rBbbIGNfne7Nkzz2GgHDbbpkn2jWO9ADftvXVrHyzLQkMMuSOIX?=
 =?iso-8859-1?Q?9UNSbDkGft6bL9Ymxl5n9VwP8G2e+pvKZSKAp01xnMgarHnjZ8KS8Dak77?=
 =?iso-8859-1?Q?CT8g30OAPKQlY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c7741f-4fc7-49e1-8423-08dafa0354a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:55:43.7831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eR5lWClj81SI5goVDHU7S75ACcTBNt0xAyjWHG85r1QXYS89rAKa+AZsk59n0nFQuzDiItFeVhGREbtQaVQ9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1956
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSoH+TIIn2wML+h+ICMO/nPs3UFqMi9bk8e9uvLocLE=;
 b=5X3e4qid3BklCmoFtoKCMI5ImfO4LD+EuHTNoqNW4DOn/i/vvsrF5mfoRUeNYHe8v4mJom2YH6+v02fBTBOCMb3Y0+psdc0DIAB5It9P/eUZZgGf2QgDzIyIKx6KVPA7dBRUWpcCxbyXeIntnc6KqL7pNZmBzLWglV8HvtfNDMU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=5X3e4qid
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 11/45] package/gsettings-desktop-schemas: switch
 to https download
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
=A0.../gsettings-desktop-schemas/gsettings-desktop-schemas.hash =A0 =A0| 2 =
+-
=A0package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk =A0| 2 +-
=A02 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.ha=
sh b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index d530517cd1..bad8eab91d 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3=
.36/gsettings-desktop-schemas-3.36.1.sha256sum
+# From https://download.gnome.org/sources/gsettings-desktop-schemas/3.36/g=
settings-desktop-schemas-3.36.1.sha256sum
=A0sha256 =A0004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9=
d9 =A0gsettings-desktop-schemas-3.36.1.tar.xz
=A0
=A0# Hash for license file
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk=
 b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 8573c75fde..b77397d565 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -7,7 +7,7 @@
=A0GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR =3D 3.36
=A0GSETTINGS_DESKTOP_SCHEMAS_VERSION =3D $(GSETTINGS_DESKTOP_SCHEMAS_VERSIO=
N_MAJOR).1
=A0GSETTINGS_DESKTOP_SCHEMAS_SOURCE =3D gsettings-desktop-schemas-$(GSETTIN=
GS_DESKTOP_SCHEMAS_VERSION).tar.xz
-GSETTINGS_DESKTOP_SCHEMAS_SITE =3D http://ftp.gnome.org/pub/gnome/sources/=
gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
+GSETTINGS_DESKTOP_SCHEMAS_SITE =3D https://download.gnome.org/sources/gset=
tings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
=A0GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING =3D YES
=A0GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES =3D host-pkgconf libglib2
=A0GSETTINGS_DESKTOP_SCHEMAS_LICENSE =3D LGPL-2.1+
-- =

2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
