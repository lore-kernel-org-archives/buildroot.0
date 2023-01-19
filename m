Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B792C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78EB60087;
	Thu, 19 Jan 2023 10:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78EB60087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10g5PAOTA2HY; Thu, 19 Jan 2023 10:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E380460C20;
	Thu, 19 Jan 2023 10:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E380460C20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2181BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 081E2822B7
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081E2822B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ks-3CJCbjJig for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:15:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9708182297
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2049.outbound.protection.outlook.com [40.107.15.49])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9708182297
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXUd1wpv4lo+/L3Krwj3nlQjA9cHKrm5TPlp7VZ1fVmHTVihMdpLxB+3fKtxPALTyPs8OuBBBQMpRJmF9Q9FLrm/8l5V+BuclY4bujVU7HW3Q/2IEqdBPXJAyWTLPLkYK1fcjmeeiACzPe99JRIcUPdWsJsfzJGFR7nwGlD2NyZDHKNP6qaLMvHSyQgaOG7FCs7w8GWBjv6izDSfO4TSQdKvyzvBTDAOEdWd+X1RHvIv96ewbDetYSCj3NBuUnJhT1wrmM2a85xSLss45itMoaac2hK5Pp3DisQsxeHKGHVu2fxI/W2PkI+D4c4AppOlDiRGlmh54U3TAJ7URjALSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPpbXeBODLTJM0vaPwkYWHDHsbzkTasID1HxRBZghqo=;
 b=Q1IiVwZp44LHzBySaJP4wU2Ws1Up//q+NGA9uwe6nfWbwb9jrVKNcLS8cofwQiBHIjmwt3LytoAdJ8dECsp8xcrcKigC07CIoW9wRdqtUEmLWMLVl0K1nLHhTVH91//lc8trcpHTn8kMmD1LDTfoJQqsxxzrac0qgerMbq2OlND7fol2squoWdWq0/B40AaqTzeBWXNvjHuUKkphOf5owl/EzcA6ynf2KCRkcvZssH/iS3YZplC/GNxkNmWWHJ2cQHgRlhIF+v+w8S4OnO6Vs3ocFlAJ4k/Nr2zmqxdufzPjNCb9rtMm3bJtifnT2HCsFyQV4uljvI+t0v2omR6K6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS4P190MB1806.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:15:47 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:15:47 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 39/45] package/mobile-broadband-provider-info: switch to
 https download
Thread-Index: AQHZK+3cf1dUzt3GLkO6k3kHp3f5Zg==
Date: Thu, 19 Jan 2023 10:15:47 +0000
Message-ID: <VI1P190MB0493F803ACC90E01862865CC9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS4P190MB1806:EE_
x-ms-office365-filtering-correlation-id: 92deaa41-4729-4d81-8ffd-08dafa06222f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zwoqtHNVvB0Uk7YGI1kTT3M8lzp0XAACYqssWX1+0oiTfHB7kGpyWNIg86QG+CQ5gxdafbiUCzzWor8Ai2y8YSZcTAzwKtxNTdBmi6lloBQepMQqPPOqU+LeJBgijVn12NiqgVh4P3E4WZt5dP2p1pvCtKzW/N/IESq1VgxmO7g9434BxzNbPJvIKNKDuIXKZOgmJCqwBB2QF4b1BtgCPZAngyvWd/UYGqatv1S8ZwhNGIV8FETea/CP7jTbDulnmZfMB6D21IOxjBwJxRhVaqNI4zqnYU5BePyu/REohN2974ABmnastjiuY07VcHGpD5YlsA7qeEWp+9cN33M3Skv6ZUuHwpYWeETLdcut6Sb5MBU2Z2jTcM3b7OdK3YhQO+BvU9e2LIjYYLQUjZhaZ5tN7ajCCMueV93O+rAHwDkoOV44tuo7vhdJbB7XRWHkJ87tDucq/Bf+dB7F/iZozkomIaVSfw2Ce4j27bjmZzL8fj6K2ZJBEJsA9w98yU30/erzLac9jUzE5/KmiwEkRnrk/qlxJ0py7Nfow1LS6coUVEzU18gjUkNcSZ+rybWWQFvZbZlxALte7QHUtcQQszUKHJI7o7eTg246PaKgnu3v1VddR6gtr4S+dHCPKIDDHXaLquUWLWm5lXwg3wnoX+6tVyZuy9rKNE964J4OuEWpjANCr5RImA+K5NP3TW2XQgb6z8CA78Ll0VHlQ+ADGrNshPU7fP0BZYO7dnV6dGE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(451199015)(86362001)(38070700005)(5660300002)(41300700001)(8936002)(52536014)(38100700002)(122000001)(33656002)(966005)(478600001)(7696005)(71200400001)(83380400001)(6506007)(9686003)(186003)(26005)(8676002)(6916009)(316002)(64756008)(66556008)(66476007)(76116006)(66946007)(66446008)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cXDTeiiewa5Tr9RurbRwRoRHYCY/1ovUEKKL6oAV58RWNzryZw0OL2RiUV?=
 =?iso-8859-1?Q?EEXtmxhcfIZHAnLzkmCQqYkK6H6ZNSM5HWvcUNNkQ4PhtyXS1l2vkhFUr6?=
 =?iso-8859-1?Q?HAs/fYd2/AmWy8CisoU+x4A3kvt8bYg1g2vaI3I6aEZQ6CepqHw2C/uIN9?=
 =?iso-8859-1?Q?4Wg/2tBm8aBvx7r1DcNYGDwqWECDQwftKeun5bDvRp5IFBxMvaMdQ0P092?=
 =?iso-8859-1?Q?VUKd8+U9Epqp7RGpDpOpXsIeOx2nWbAtsVXYI4VDV0r3Rp0ly4Ufaza/E3?=
 =?iso-8859-1?Q?i8NL5laQymUO1Ii5Xmr919XpGKkLQmKFEWw26P+OjkdtxV7g2iNnFyIRKV?=
 =?iso-8859-1?Q?OmeeBlJOYD3TZ8DcgtobOnI9th8OK7WcnIB6u8VFAxugLrn2gbvUHBmVEa?=
 =?iso-8859-1?Q?QTnfE7H77tCvBcZ6VPWeTU8F/nmoIJFjoaKspQxiQqSz4vaUDQgWZ8VlG4?=
 =?iso-8859-1?Q?QydE9B0WsMumrZmlaByiDIavy0sHPTZzBXv3j7wsdFRIEpN9GCs3wJB8aI?=
 =?iso-8859-1?Q?UZrf1XhJMZwnTldxPDOyywCgVX54z0b4WdOIrqJM8WO8R/zrd16lRkX1Sc?=
 =?iso-8859-1?Q?tJubmr9Jrulyrev7tqwYRnpIaQ61kRI5PEy+CejJDKZqUs37xenD2knXeK?=
 =?iso-8859-1?Q?936wvRh4oNHB+1L1ycpUqM5CcLGeyP1Oevk056y9Rf9eJJeAmvU0+RodTY?=
 =?iso-8859-1?Q?O0O3zgDmeh1GzsTfh8HoWsgu3PKDrT3yMAN7Gm9TqBuvrowShFrPXtDccq?=
 =?iso-8859-1?Q?sWgu6SyWMHwCP2xQRHMtw5nlYlIavoy7Ur7Elc+QdEJWAiLdW1I4wOZ75J?=
 =?iso-8859-1?Q?ny2P+8XpYKKGPmpOai+C/ah8lbAVTy3FFnIyfVEY6QLYYUQoQeBZ0YktDp?=
 =?iso-8859-1?Q?yD/uAees+AsJWDyqz0EW+HPDv1d2XHmCR3xuaM5xlvlYpHYCJXj4Zl8GET?=
 =?iso-8859-1?Q?Nlo7+HB7R7a2EE2haqVP31atfyOQkpNb3dc36hPgUOcIh4NleFmCUqkbZu?=
 =?iso-8859-1?Q?kx6Mv7MVlpgeVnrRsDzg21W7nEgi7Qniuou3xM8ZNaeAECigP0z7LFICTe?=
 =?iso-8859-1?Q?bldSYYdrXfeHxBkYn0RKbpvo6zGU1q7rVDSMCr/kmCoszT3IcfWLXqXipV?=
 =?iso-8859-1?Q?eZDHm7ckSej5duMQt2aNlhUo884LL/NbV9bmLmsbMPFjrzizLz7wyEoQDf?=
 =?iso-8859-1?Q?sc2hONKaycjhIuqoofRf04qgczdkSoiSjdnd8MiQuAtQCCGHWWEJJ03Dmm?=
 =?iso-8859-1?Q?MK/cXlmn1XigClFv2KKvRwnnWDygTxFHtj09/azbdTQtpAR/EjmKUcBcXm?=
 =?iso-8859-1?Q?wrCrXDsdpWFL8tjZnTlBOBTBCCInOxbi7kojjA5kKLM39k4FW0FAGKY9Ks?=
 =?iso-8859-1?Q?h5SI+6WWxHhsorNai6I6USybFp1CU7Pj6MoY+da0IWC24byP8OFRoi9EoF?=
 =?iso-8859-1?Q?JYn/EPMiJaD23v+euJShegsMHAuRJUt23ogfpLOX6zj9xSyYtGT0Cn812O?=
 =?iso-8859-1?Q?1lUBmxa2g85ussQyp25hd1CtAsl4ATGk8ZdIQPxZX/jMIJeXdHf8P/YWaS?=
 =?iso-8859-1?Q?i9njBd3P760rXUBrdcajqiHWiMDJU3oPWtMn0oLwjGlAkkqHRy6R5X4oLZ?=
 =?iso-8859-1?Q?QMssh3dhf2RrA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92deaa41-4729-4d81-8ffd-08dafa06222f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:15:47.6480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ip5Qrlj3PYxnjr9BbZ8+xsk9lJvGnWj/Ki7tb+wtlsyee36QBk+44xeGFCHylAjuRdHih2QZl3dXTkHjACW7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P190MB1806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPpbXeBODLTJM0vaPwkYWHDHsbzkTasID1HxRBZghqo=;
 b=EYpzlQNGdlBblBWtEg60Zk7V1Yq9S59KAZXhLgtMwU4xZxCDvJ2wsMqFmbF5Zw7MmfYAEKKy8hWyaUwZZLIsbVrBrw6MK7pYRX9vi48Xnkerp0NZ/7+wDgpzdvfjkPGKeo2+60lDhmG1iruItZ6gpnVwDmq9wP19bDY06Kq2M2A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=EYpzlQNG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 39/45] package/mobile-broadband-provider-info:
 switch to https download
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
 .../mobile-broadband-provider-info.hash                         | 2 +-
 .../mobile-broadband-provider-info.mk                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index c3d7fe2c28..b0c0db1b84 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
-# http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
+# https://download.gnome.org/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
 sha256  c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
 # Locally computed
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 2986f92f69..ca6a8387c5 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190618
-MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
