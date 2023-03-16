Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49817C6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99684402F4;
	Thu, 16 Mar 2023 13:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99684402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idJaZh6-ZaYJ; Thu, 16 Mar 2023 13:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85EFF40058;
	Thu, 16 Mar 2023 13:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85EFF40058
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1431BF32B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 13:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26EC1401D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 13:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26EC1401D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NUpvBMrpID5 for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 13:53:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA60F40140
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA60F40140
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 13:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMIl6To9tuqJFyIf3ngNw1dkbgCP8b+/e+FuSAeAkWiDOku0WlxkgYs848afi5wyYYWojSw8egxWM51Kv49UcRue1+szwgQ/cRJsmRFs/FQZw1gUxM7P8EBqABBOhOtgZrvhE560bqgr6opJ7TJbSsqhdBqRw2Csohms85MIn4ICwExO6FYOkEp9PL2rGSLzNpinrpLAGdhbmrqLMG4hPEepUn4a+yD1xAoDGcpENRiDCGcUIibAkyHy8e6mkwLcSata3mGwiHQXRkzaMXlp9JjX46BfAqekIOFf0a8w8HevVT3gnr/UmU3wErH2EyqAk1q9yRRm8NNa2N9FeGcJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0FoQHfhftqUI1y36CjoavzCws4QKECZVyDn5k4S5C4=;
 b=G1grA3mRCBIClrIM9D5e/HE7PGTd8o0WKfVS/ppE2w1294IQoCljvMxwMR8K11c5YrpM4uPfYdoCvFv0hDcINy8HBgvc08+mmcRBeQ/sW1sQLOwti8zWpo0YS2pfRjaR2E5O+B7BBUacI+r4S80inSQFZFGWqKmRGMY3RssqZKBXnWjy2dTmf8BgScQDED8WSVNKs/zigQMAVQ1g99P+GbGnMh2hA0JS6S2JkNmvjSgxEdQ3Pc2uuJqFcz6oXGaQHyHtnOskg5QE3rfiMjU5CE8TSZJL8b3aXkUlDLqjfVMuD93js7Q2kyKqwJWiBtcpylqQgOTfYN3VaWFWxsMR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PA4P190MB1104.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:53:04 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%4]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 13:53:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] package/bluez5_utils: fix media control profile
Thread-Index: AQHZWAxu2llVsLI8/UKfw7bSV5eBjg==
Date: Thu, 16 Mar 2023 13:53:04 +0000
Message-ID: <VI1P190MB049389FDF2EA1D1EAB8292B99FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PA4P190MB1104:EE_
x-ms-office365-filtering-correlation-id: 403f5bd1-7723-49b0-3545-08db2625c3d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fHP2zQ9L8zBQKd4MdngWNMjjONOy0WytqR3RgGiFvgblNzR6+EXWTXnvSjWRP9dzpt6OOM3Enj/5yhfnxgb7qbvD8DAu+UYYGi83Ffs99Khr7Tf+yVH/5raYq4C7WLyzIsW5EJxwyXBMp4xx4qirS+18Y/EB676+U81vNKanP0XTidXllXwoYGaUSItQLudaPWxSwFGN0tJxSArqbIo1S37xl0Ue5voD79msrJJYduazw3h/Ju/hdgLxMeB06jIq0nNwH1jmY23FlNChblwmams8caoq7RPOLLWtq0U1ttS7CJvQsocWuJhEg6S2csoR2kd1MwSUGsXIouiqFy9jCdqlRB/4fwj7XCbVgVcR9vXA8X3m7QTKlIFAjgUPT63pfhuuEZMDtdLKlnfbTXzKIP5AXrj+Wsuixg8wdQy2dJqvNODFb+GM5fWRPvyLddBpzEOQ56rKDrsL+hZFslSTCEfsEzWgsXlpvQrb6ziCvg7w04PqWLDZVU2hJowSn5crTP9tKp3z9U23iACEWce/1Yu9oEWy6B8Jtx4N/TUucx+qpprlNAcKK4ODE5ZKdZJMLjn8BMWuARzqiRTX4J1ui5Oey4JH/obeGRV+MhnPxUeV0NlDXjUyd/iYHVAZHdHl1vKq32BZ5VefiiQB2Ag+M0R0sb6aWccgJWCtbN5mY+NQ/YMzP7ZvMTRsIKiW+PAq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39840400004)(346002)(396003)(366004)(451199018)(186003)(64756008)(66476007)(5660300002)(76116006)(71200400001)(7696005)(66446008)(66556008)(66946007)(8676002)(966005)(41300700001)(86362001)(478600001)(6916009)(33656002)(316002)(55016003)(38070700005)(4326008)(8936002)(52536014)(122000001)(6506007)(26005)(9686003)(2906002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q+9n29zpfkQUZvxAPHOBiZXGYIPB5WwNOQ4Fxqo5jzF8qDNtiXVoxGRIVS?=
 =?iso-8859-1?Q?+DbhymnQwt2pdA8ZRYKtAbyqgzQOC5dxhLZ8kDa2PxRGjYM6vyZq7pWRb9?=
 =?iso-8859-1?Q?G/N5E/cFvFPAfTdMargw//Q331+Vo1Ie6KEiPgvPuWTPRYXmDydTZbXFi7?=
 =?iso-8859-1?Q?vJtxRrKZ8eS4Wz/Q3LUflzA8s80EYXSXSy6ORTB/Y9dnvthjhw9ZVopSUE?=
 =?iso-8859-1?Q?Q+4DhF2C+EhqUH2poEq3ncxxIEKnT6FgMdegYD1IU6QHUQ1L98qqCA9S+q?=
 =?iso-8859-1?Q?yQ38M3UobOH12o7TUxVH4CKzbN1YFfofrjDSFRabmSYy7eK65pW/nFoQJP?=
 =?iso-8859-1?Q?CKU5hJUe/6Sk9I5oyGdcPj9VqJSJO2SvgzrLZ7WQ84MaQpRlVDaKeVyoAD?=
 =?iso-8859-1?Q?8J/mRbeKadGGCylY9KikyMWe28IKC1Y3siOsocyoDSDvohXUH93WjO69w5?=
 =?iso-8859-1?Q?TwnFE962kyfbKmBnRKb9S0USW5OzHqvk+zkzpitCJvs+at0VRHNTuVGfQ7?=
 =?iso-8859-1?Q?bQ1Txm2LqSaiKYdlOf8jxy3Qr2trW5z8EXaykitDp5cTgK+5bXEYYAH8x1?=
 =?iso-8859-1?Q?R34V1QEAI7p15ovUPEDH/rGP/7LPacN9Dhy9onyaWnvU9rRwYlDnJUIqmB?=
 =?iso-8859-1?Q?vE95mgurOQaJZMB0XmUBN+6L3ELV7Tlu7KkdsvtezAsUdK+W3Rt2rorlbW?=
 =?iso-8859-1?Q?be/UTbLnvdzrSELwbUp8fbT3Hv99qjCQsbR/GzKOvLFqrxt48ImSHvzgBB?=
 =?iso-8859-1?Q?iJPLDiUiOP7jeldDulkiuCz1m2iiaN1k0gnZoeZ94hlgJfq/ZDEu2sKfv8?=
 =?iso-8859-1?Q?gTsn+sTQ5N+v+tjxKDyk1bJvoK/wAFYlb6bqmiamTTnAfJ2UqRl8RfubcX?=
 =?iso-8859-1?Q?yR14BXXoKIka3sxLCh4yVheN0LB95CBN1/1Zsyh/NnkuK3gwD7wtrboiu0?=
 =?iso-8859-1?Q?mdSTBUS1zgCa+Lql16YWEMasy5+tYaGpQbrIRvZoG3TOSTllW6zXZ2pO+r?=
 =?iso-8859-1?Q?9mgExin2wT4Hpg/QAGRlwNfbUjrCnC98gcWv7LjDas7/cAfL4dPuTPF0Ib?=
 =?iso-8859-1?Q?LcTABVEihARy06HZKk348EZKdmn3V7BIbJJMsQnXT+nrOrgUaszyEwiDjO?=
 =?iso-8859-1?Q?IAvLS8Bl2UXSou4CXpnDtMBR1diEDZnjFFZvwEO2RZzUZeZq7Zh3zyASUR?=
 =?iso-8859-1?Q?lkj92KgnZrlyxNjN0KOQuIKgKfwJpNUlsimL0FlxMn4ggq2NAOPyd8ceEN?=
 =?iso-8859-1?Q?rkInfIFm6LDcLqoFMZ9s5j7xPHFasvrZm4sS5b8OqVvpCme0aEfBhiHWHe?=
 =?iso-8859-1?Q?deIGy+guXZb4XFjcCZ41MJxMJZ60Yf/dgnn1uIBEL48pFskq/cDdUP4hvH?=
 =?iso-8859-1?Q?HfIffAegCu6Qcj/ruwocwFYYy1yZBlS53fcvVstaxkDtcNqhbpxYWRhaMd?=
 =?iso-8859-1?Q?svWf5sDJyi7MPFF865TnGoCDkbJ3xoVHdRrLIm9wOJl42Tq0STxoyNbyGQ?=
 =?iso-8859-1?Q?G2T/vNVvj52VWks+ZiiE6L/qzACm6y2hqST0Gk5c3qGkFrEt6mn2REKTFc?=
 =?iso-8859-1?Q?mbIXX3a1phYRTKbqiOcyDGKYPNGxrQ9bSn8u4TTFJ7gQYOlvi9X4l9ADYl?=
 =?iso-8859-1?Q?Cayw1TTT1KBWA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 403f5bd1-7723-49b0-3545-08db2625c3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 13:53:04.4182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7Pdw2fY3SUwFjqLopEicC62fSsv1BL0EGLLw3Zvxb9ASp/5/U5MCol+agYHZWddvFH378RIJnfgoqzaoORVdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0FoQHfhftqUI1y36CjoavzCws4QKECZVyDn5k4S5C4=;
 b=r0/4I2p+dfhi3jB9Hgh9apKOKleJO8M80yzr0iTXOkj6rEfO0GsxnWbgfcu7+9X6J6GrFeGjmPEyko61p1M2+7ZTrDeepahKQGHEfoZj41mV1meiP/pURzJQaYIqme1YcUxwTR0sriDftJyU1LGasNioZmndlKoJCGpedpxOMTc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=r0/4I2p+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/2] package/bluez5_utils: fix media control
 profile
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
Cc: "marcin@bis.org.pl" <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With bluez 5.66 (bumped in c6c79d6) the Media Control Profile (MCP), Basic
Audio Profile (BAP) and Volume Control Profile (VCP) where added.
All three are enabled by default.
MCP only works if AVRCP is enabled, as it requires player.c which is
otherwise not compiled.
Only enable all three new profiles when the audio plugin is selected.

Fixes:
 - http://autobuild.buildroot.net/results/d62/d6260a5acf766657f683d85fa1bdc27b7a43551e/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/bluez5_utils/bluez5_utils.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4059b34556..46ffda6019 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -64,9 +64,19 @@ endif
 
 # enable audio plugins (a2dp and avrcp)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp --enable-avrcp
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp --disable-avrcp
+BLUEZ5_UTILS_CONF_OPTS += \
+	--enable-a2dp \
+	--enable-avrcp \
+	--enable-bap \
+	--enable-mcp \
+	--enable-vcp
+else
+BLUEZ5_UTILS_CONF_OPTS += \
+	--disable-a2dp \
+	--disable-avrcp \
+	--disable-bap \
+	--disable-mcp \
+	--disable-vcp
 endif
 
 # enable health plugin
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
