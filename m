Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC0DC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B138404D5;
	Thu, 19 Jan 2023 10:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B138404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLqyl-hC0Ezh; Thu, 19 Jan 2023 10:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D4C40438;
	Thu, 19 Jan 2023 10:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D4C40438
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7579E1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50AD360C20
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50AD360C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SITArYG8M8bd for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:00:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C393660A7A
Received: from outbound.mail.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C393660A7A
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:00:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHcRy1cKONMiYpN52qd/H5y94n376t/VxghSjk/v+tu3zoO5BZzdlPjQDfoiXuMT4/kKmrvcTBfLHOXEZkka7TSFvY8+uctYfvgfTOW4SPqCS0uvLycGwp4cYPWb8JidtOhZfK7Uwe9fxssAuemHvb1uTNEbYs7oQ6aPiED1VP17zw+bnw2gmAuRYICegTKQW7jKFoF//5b0xGAevq3gjMtor2hieTq/chK69PmLLEsOBMhiJdB8nS3gqmaZqqa+5EeNyhPvLp5dTlC8yx7AEyF696nsPF8eAA3qZczknKwchZV0YKrbaHE1ZaNP3w0l/rGzWls20J+mIewB7kthdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz13mCfYd8xiube07TIdi7HunOkuLzG+RcpDoe5zxg8=;
 b=kT679XGk2f6KbVKTM4rgrTyqlaNmx/p4SP9Z/jtg1sNHzTkv1SeUIE2UFgdBDC7g31cjufiajiKBX8yCtEyw13CBxvk3NG8XZJmrqzySTgrmz6HxIjicau0enP9DDUAnamP0HCsQllv0FCMVyFj3O+9hbhwyL0J/KbgbXZtq1r1V9+igUaSpWhK1iiHeUo3M93ZTaDjpzgPlg2DKrLA3wLAE+Tql4xtOVXpS6omP4MI7c+f8tsn6kBMaASCGeA+aV8D4nYPxXTg44Of/ai6EqqaKGbibCmfHX8ZXZd6I4McWYIZWnXvTWTiP49oOvafd6piCeXAS2q0lQlh1FHtcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1698.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 10:00:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:00:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 16/45] package/gupnp-av: switch to https download
Thread-Index: AQHZK+uT7jW8m8NhwEGeYlcPmuFlSA==
Date: Thu, 19 Jan 2023 10:00:01 +0000
Message-ID: <VI1P190MB04936616A60BD10A53686F949FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1698:EE_
x-ms-office365-filtering-correlation-id: e6fd45a4-64e5-4966-8924-08dafa03ee86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oJyquh95i1qvFkni/azz0NSqsnAbfRwj/+6vL3HMZCM5qiuOWd6lA6mh75Ud74WbgJZqhLB+n6wDC+SR0DR/rUe4YmAnIGUb7K9MKgj/roMD/2xxRVx3PVh5W0SPcLPrKBAJu7uBxK8MJ3oMbbrDipE7Efrgo2jPKcThxWPoF/zuMebODmD37krrq5yX2RtbXkhy1W3XjgQcjn6md+o570c/6JUxOeOSYKO2w/h+wfpkvbvt6c9qyujbL1jTbBr5GtyHnU+P0RZEzXl7YVucinLCyhbjImuq2EMXulqDuRonSZyYXM8kMCeEM3xtfMXdORsZrk+ku3PAYYsVDqDFcQhIwIK4eejE4z96ol8MDrdxLAWLLxZy4/+1WV3RVnjC98G8ATxHOadrYDuejR5f471oNhmHttf3l6nDTVzFQbq8grFJqOQUPylemG6lOEaNgHN6QFg9kju3V9a6geinIwbRNDDUGHxAyz9DsCpAimyeJfXzN9wWPNFAShL1vnMznp5d/vX0GTITadnEAO+gaRVnZSNZPKmxGpCN4ClcjSlf1NrmjBkJZCNtjQdUySKy5FxFNK1kf4IGHmj0Y/D9GuFS6OOsv3ZdbDXnRzfskJmpce+YadLQmQaxnyDWP+UU6QRvDiErlOCUfaIcoP4ODxFZCUQoQyakE+L1JMy64QLRNTkLvAw/XIY3CXsjxWF3nJAebufrwPk7FNjUvhUrmhcuSVjmvrr74VoKAED0MRI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:sv; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(966005)(33656002)(478600001)(316002)(4326008)(66946007)(66476007)(64756008)(76116006)(66556008)(66446008)(8676002)(6916009)(41300700001)(8936002)(83380400001)(52536014)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lxAXJsCqbnpMIsNhplsz/+Bk+qVqdnf9JRaJ4Qhzzl7ZvxFdrTjqSIq0LI?=
 =?iso-8859-1?Q?apCgXTTRDhCJqcHRSuqsaOgDVm+LT8tTDZGP6d1McSa76sIzlKTwAxa+Od?=
 =?iso-8859-1?Q?5KW9ukQoPJHSqgtKfm5Q2Tnkosy3Y8JscOdTJGxTYbnNRuimRe4GT9o5Fs?=
 =?iso-8859-1?Q?6U0b/NWRS0Rb/NiVHeEH9RA5/uwoQIBu8rVon8BLxFfwPwJj2XOXnfFASH?=
 =?iso-8859-1?Q?P/A5SGGvl6eD9Jo6t1fuvFuh3TY3WyNx6RT2wzzAbHaElnr6b6n4AGWP9Y?=
 =?iso-8859-1?Q?hJKsBcfSkN9iFuOlK25ZhyQ1qWYJpNoeX5B/PPe3b01sL4OXDMKQQEAWsn?=
 =?iso-8859-1?Q?t/Sp/YvMJHpwjpji4kTEfJOkLDaVQu+kiGD7+dKzaa2hkmgS6yt00ydJBi?=
 =?iso-8859-1?Q?Hal6UqTMiC7hXTiGUaD57x8XJD/az58MnB5Y1d0e8vXmWYJ4RiUX7+utc7?=
 =?iso-8859-1?Q?eiN4YuOV6h0AtEndJ63K5t8CWVZSNBIStig+vdVSf3SHwFOvRxvCOlIWlf?=
 =?iso-8859-1?Q?a1DEFMAasOXNvva8sjIGHgqjvzepTvyy/2dGu5BCNRV43iz79sBB3n8Vol?=
 =?iso-8859-1?Q?NkCkhXaxQsT9z4jrZXqoXDmFAyFAMISKNP+LinHy8VBkd2WT9iOOyAhnss?=
 =?iso-8859-1?Q?Iwu9Q4rgor4VirbOiwNAsDVP+438iYSQAkWUET/J5E9+f41xRcN+YZgzuf?=
 =?iso-8859-1?Q?S+JgNwzZ6vMNPiueGjVGhO2R6uBsdGwshwzacdvyHxDkDpw/3dEg3QWLTn?=
 =?iso-8859-1?Q?eeu04/c0JwY2aZc7gZ+wlKstk69ocWFeKm4glzZSltQKBhQSpOaPMNuHDH?=
 =?iso-8859-1?Q?xthO0K6SGJNHbQVU8ZcgONtTsAfmO2ATG8SlyKYS2GgHnYTgAGtsD+b7Gs?=
 =?iso-8859-1?Q?JGvqS4TBD2oTQtzC+sQy7AzMzwNmA+XjBZCO5GJL5Idj+vyHI1qh0Socqn?=
 =?iso-8859-1?Q?G2NYn3yK8+Hb6RzstEfvB0sfV/+PPfOtNhLx/dyDSCI9CPaRL8+NZW3nox?=
 =?iso-8859-1?Q?h1WlkIddIDTDUcLQLdGCxMpRJZB4wioFxxYccindpt6pKGPvId0r/KeOAb?=
 =?iso-8859-1?Q?RCKgMXho7UFHWrSBUCieOyUDjhRnD8e1O3f15qMDF9PuJogYoQc6NWMhF0?=
 =?iso-8859-1?Q?em+X5f4dTl0WS3wyxOPcqneTD1023YpD5rsrU/rFGR3qtFebXaA7BEEqg7?=
 =?iso-8859-1?Q?/Y0pFXW0Xydr5j9cig+OPI54bFaDxi2wBj5DZChPaQOAQuE6WyMhwVtLzu?=
 =?iso-8859-1?Q?m9Y6Q7I2IMJjTkb3Am6NInSleUFY6LeklaEkTINM6kkjNDZvV4fflfLTD3?=
 =?iso-8859-1?Q?lMnU/5++7SPk9lB0oGwkvBWZsIFzVaQKi/OZWkblAI1c4BPw/QbQM5T7Sf?=
 =?iso-8859-1?Q?9/mu0fp8x+tpCU5FjZsb1ly6NGcuL1/2BWyXehtIeycTpUEiP3cQ3pvkxr?=
 =?iso-8859-1?Q?dlANabWme9ItOH1i0B161l4RNRh+rOPJ8eV5mh30XObMq72qi7rP3mwdl8?=
 =?iso-8859-1?Q?4sIUlvrXwnKdmzMJ6BVHfZD0wEKLDD/coKUeZMR85Wv2lllSMH14WtVgdi?=
 =?iso-8859-1?Q?na6tbuhxX8n67scg7JCuFafkwwPl5hqUDhGWgRLODnxrCZXa9dalrvrDuE?=
 =?iso-8859-1?Q?DNP1xypBpGrrM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fd45a4-64e5-4966-8924-08dafa03ee86
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:00:01.9674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEWXEgkEaWdLyuRl0j9+6RR8ZH6umdhAOJrpF7/6Qy0X1hKbVIZ2aDvy6UbJaDe8DFkOhTP+eUDudxH2tj+m1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz13mCfYd8xiube07TIdi7HunOkuLzG+RcpDoe5zxg8=;
 b=EByHjzvY4NQouljMf9ROmZoUxqKd0qYLllf5MJQXH+wjr2Vy6x08hVWnMTvHiMq42JBALPV4NYJtJGym+B6XWmMY33tTttHnmPH7NcYPk3Rwce7KvysXKaI1WHkIx9QKbU07dO6Iq7aXvFdDj8Dz1ET/d/o3gvVSw9w0OXZY+Eo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=EByHjzvY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 16/45] package/gupnp-av: switch to https download
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
Cc: "rahulbedarkar89@gmail.com" <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gupnp-av/gupnp-av.hash | 2 +-
 package/gupnp-av/gupnp-av.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index ceab42ef52..ab1739aaa4 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
+# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
 sha256  20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156  gupnp-av-0.14.0.tar.xz
 
 # Hash for license file:
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 655de87608..e83aa57bda 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -7,7 +7,7 @@
 GUPNP_AV_VERSION_MAJOR = 0.14
 GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
-GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
+GUPNP_AV_SITE = https://download.gnome.org/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPL-2.1+
 GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
