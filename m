Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91AECD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD9F460F74;
	Fri, 12 Jun 2026 12:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5MiAp3cQ9FM; Fri, 12 Jun 2026 12:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B4061047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266578;
	bh=cCOFC2JSUS1wr1g+GEq/XE/YV9FOxZA8WI6i1XqWoXc=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv8e9MbhNYa8edceAVdxj7WPrUwoTULrFSmB6zhDZimTMeDXVIWxliBdswxtid3BC
	 wuKOfvn78TICkAHi0DNMzJEfVYDxzA+hVk8s212Ne5pXNukqDelYPQd+Upb2eAzHtm
	 N6ifoxufT+6+DdNPOHFal2Xq1kj1JGiwIIuu8KSDBCPH3tENhNzAJZT2VxlQ2DuPBb
	 GZNm4Xkmbhlxuv2TpJPtMhGpI7ExYM4d2CL6uEwOPEu9CfU2iBPuwn0UiZG9PScv/N
	 t84RfpI4CsbN0F0uq/hoZJBgMGyRSCqPL7DVVVRLjVzZwZbbeqZh15293dHdMqDf54
	 vIYaz9MewEMbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B4061047;
	Fri, 12 Jun 2026 12:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C234012F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46704067E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMo4CslBGLxf for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DCA940672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCA940672
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DCA940672
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa35PIO5Rsl3/eU3CLPQd8ap6yCxYgNdS97iIuuHkWIMI5yA2dhpV9Fg7oEE8qe61PxkRrkRp5fdQgJLFaAm44xfVKOsPvvX3GowbEGzZ2p1BjxjG69PJN7CY811D8vuEq3okoLr6uLGtqF3RNCyEFs4/bWLjeB6YCtjwzkqaIOJDttq+DtvMV4TY2jgwfnccSMXp04KrTAFGbsvCzC58yk9B6uU9C/Zrx08bqcGkoJdBRY242VOVJmQSWshKCk28HK5HZPCtF5IPK4wDzXe0BsMOi2o3F2h0pOpB+09S/uQdCoyFkRbTGx5W3h3rhrJjWUizDkWhSPMlaly9q1ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3vdhXeFzlPBaM0/tC2vN5L4x1YXVLHnnqnMIyg8zYA=;
 b=MEJdI9j4mPEgsKmokBnwodpur+XpJv/I1Eql0fYK/B6kPCFxnXEqElFK/5E6Q9+Rmd3qHHQh9nZT3pvEONlq0Fhp7sdUoIFsqtjEDprwH61vPRiMzHSYUVWuLskSmDklHpBnFg3C//aRNs9fwzcSELGryDaffQve3I2YOCe7w1ZcYgXZZxh4MaOA/CsoXrtLDf87pmlY0o7/dQy9a4mJZyydUAHSN9yrVEM0WtuqvUUUR5nPf0T5zWC5taWUALoXQjKaE574C71uIUoFZSI77xDnpERd3E0F2MhcafPxtIrRvXOz+viG6GiuKgaldCbL7vGknVZg+3AK3tKsreB4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by PASP264MB7012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:540::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:11 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:11 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 10/11] package/seatd: add CPE
Thread-Index: AQHc+mVB89bhKsEVZkGQea1NFeaZbA==
Date: Fri, 12 Jun 2026 12:16:11 +0000
Message-ID: <20260612121516.1634-11-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|PASP264MB7012:EE_
x-ms-office365-filtering-correlation-id: ca1bfbf3-9478-4fa6-51dd-08dec87c6456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: LksgeKb/1AAokcCGMZB3fEtaHweACPb/WxzMqCl0bhzICVoBGVjUpkhJ6/aRMnOGy7qjrMbCtnNvIxlpOt84e0UV0iE+ShleE9Aps1YgSKYJd/Nph9ESvUn8Pt4ZKgCj0oBFptYTayLVPgXu1XHwAwz9b9HwQPRRM1rbOoObRpZ958lRUOliZMZRWlwIZhYtigrBtmBzC3nE6QDJ/PH5Iy+9LkmYXvZ/mEnKnAYvPYDVisWAGDs5Lm39gbWM3zk50t/Zjm4mXVv4y+qjcsg2qMKd9zOc08EoidOk3P5iNJn63L4Ee2RH/kyN95pO6HeV6qlR/ZWOc+xdc0KRfQ0QJ19NA3PfccfPiWXkQ1VTisZaonAzsPZNlLt9Bsf8p7fRHl5D5//vUNBpu+I0OxBeNnbmtb//l9ajGFzDKe6MXf1zaZv3ldbhKa5Pto3riA+WOnFp75onvVlcdIZ4oVwP3ZGVhvn6OZThQvl+9ofCi+cN6Y/wYk2Ue6tWHxiBpmbgdJmoi6txRQ1SKmvSe2TaZ2Egx5/eJcbpoLFIearlxNOaosDmx5dLiwo6mDTdeUtzTtXIPWI+UEOUD99LaRxiEWchlrYorfeMJGOA/Sg6BpgczcwE/KBkPlBdYQ3XlZstOOoq9/mj7iNey+wl0uFP2VRH9CdeyEJo6c6Amb83rwuqOVui4oFY9U3Hu9+86hHFuFtYr1ckkHX831388yJIxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?K0FhCa5loEANYavtcBWEsPHDh+6YisV0xz/Yjl+ujXA0lt63A9eDqbuwub?=
 =?iso-8859-1?Q?x9NxYlQ5oq1TW2Ntl/VE9J0GP9eGylInTX2KeD1OcUm2Vga+nG8vwJI8DO?=
 =?iso-8859-1?Q?yXnWCGPpUf2i4vTwgFD5QhR8Hx2NFAbcPGd/CBoMTadKA15NBPyNe7aUGo?=
 =?iso-8859-1?Q?zbeQhnD7i/BK56GWpbfnjdRtpShJ5ScHQaYjOLezqwtht/v64Ax07WoILi?=
 =?iso-8859-1?Q?iLeFGVCBPeH+WxXUsgKwM+nsifV1nWF7X+krOuUqVfcjoQXXpn4YbMLScM?=
 =?iso-8859-1?Q?kaoTOgsOBFV1LAcxlQda728Cp7l9z2oqvGjOK8/nbEW9aX705EDFMkmw/f?=
 =?iso-8859-1?Q?/7A94rIjCmSm70Jbg19N+j6Nu38rl5I2s9PtsX6uw0avUKaM33dOiP9JDK?=
 =?iso-8859-1?Q?tayadR0Lzz7qGkgCe6UpK3nb8u8gngVMqtcVFECwZJUObp3c5+cKkz1tu+?=
 =?iso-8859-1?Q?02XpTnp1CCY7z2uEaRihV4cfl+XE1uXYgAYid/uVChzSMjoEHxiO1pDixw?=
 =?iso-8859-1?Q?vTAP7B1IsIDiuAlaK7mo7ej119ksDJ5wBOtNAivJaYXr8EORiDGoDbPfde?=
 =?iso-8859-1?Q?mgdejWZR13UHP5nmaRtfWe4bxu4H2CD9hAK+0s2j6S1gmFoOeoXh7RESUC?=
 =?iso-8859-1?Q?UpwVHk60htx2DFSJj8YYlN0ufMesm2SyRX/OL/Zdrf0Euz2NvxF1sUu5GP?=
 =?iso-8859-1?Q?d3cl2zUFu7ckUaR3t3V1ev3yDJidBKY2yRgg8M2d0Z5CO/LqG4YkoExejv?=
 =?iso-8859-1?Q?qEN77uv1EwJCc5/kbh6S0ooJMyNSWYpIhF1hEXr7vFrIBiRmxR7/dqmhoO?=
 =?iso-8859-1?Q?ucbiM3kLwl7tq4bEPBbJVorO9VKNWQ5durvycZOqNJL3xhRcLYGbda+o4b?=
 =?iso-8859-1?Q?gx31D9dKhe2rS8NwA8IYL3CkHzOiA7aZrn2Auvjjhri0dL9iktnNkfecjS?=
 =?iso-8859-1?Q?7KrwFAgYnT1fbvlZRXM1hHkK5azHosO9OwpStuiq79V2pNWfmP2iYuKiLG?=
 =?iso-8859-1?Q?mhF5V0BdhXiLzMV04kyGcbq7iLHOmiNa8L2tbouBxLiLgq46imJgFnhNwI?=
 =?iso-8859-1?Q?EVMB58I1NsEUhYlXompXvSk+r37yWr3Xq7SksXwrQeVQfMt0bDbERtw3Xm?=
 =?iso-8859-1?Q?sZzoIwBtz0NrQN4Y/e8eysNtVXVhRNAgT52SK8En/iy+v4c1BJox7k1uub?=
 =?iso-8859-1?Q?WuPn346ukB+PY+ojeprzAupBCSzZrgsAiNCqRsnlf68nWVD7+eqgN4oX67?=
 =?iso-8859-1?Q?m3wr/AJ/kMkvYfFYCLnuT5blmKgeFQVAiAknlIDrJ5RfH6nXdjfuBPr44Z?=
 =?iso-8859-1?Q?l5jWghhp8sNIsXqCiao7Nb0HBv2lwSd8KFVRb3yUnvxkD9xlEVKDxFDaz9?=
 =?iso-8859-1?Q?2VHGrC1bHMJij9wWzGbd5C/M69KcF2DqiAolhHz6yhbyTDOCi5e7wvguNt?=
 =?iso-8859-1?Q?g3XTyYmNFlPrEWU0JvmMOsKKBo7J67BQ14M9AxWJ7FIN+wGQj7RzapRZrp?=
 =?iso-8859-1?Q?Mm2Vrf6oB8EWQFHrIalHqGiS1bjJswzG+4JcLSq+KJbNU/XUCEcISiyykI?=
 =?iso-8859-1?Q?Kf1br37mgzELEAU+rzbXTlfVfDOcFgNeONS2cqiSefaN0Os8jpKsTPibAn?=
 =?iso-8859-1?Q?EmVDTBbMnuzQgr2MajT2J/RhY3dG3ak22O0dWaFRgadTxqhzuiHG4nyR9B?=
 =?iso-8859-1?Q?eBEj5rl89i+EI+2ufsvuwxWi2h3VZ5mTUtS7r9vtNYmHw+3LkZAfk6S38J?=
 =?iso-8859-1?Q?E0qhXEFS5z+KfdXF58wMqN5NVPcY/eo+3ofcd8hUSB4oO1Z6P9Fl1z/QtY?=
 =?iso-8859-1?Q?9757dm3DPpnhcJwbKgKB3jm5VtEzzko=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1bfbf3-9478-4fa6-51dd-08dec87c6456
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:11.7921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vz2yxId0a3UZwjnom2aOiYcPuYTC8oqDgxM72qf6I56ZepfPXmt3y/krVAxW3a06EkpUU8fHUJ0YrBh1LfWJAgTK7vP8FZ+RQGgHrWD6xcnRNlbNwSm4zdLD31tTGiow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB7012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3vdhXeFzlPBaM0/tC2vN5L4x1YXVLHnnqnMIyg8zYA=;
 b=PMLrC8j45jCYlWsaqCo9lHl+4NfYAwIbBhNWSp+7sPHVs1NpeWi+SWS39tcPdU7aPkC/Ue5oRVqwbpIWzuuHXo3uOrZ9d4pozHbAgLiTeFImoK/QQ/gztkhMyEjL+IoCDzsIW/DT3YBdneEITf0C/GKOWMvQzaa3tBPZd1RNzDU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=PMLrC8j4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 10/11] package/seatd: add CPE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
---
 package/seatd/seatd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 69be691cf6..583755a560 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -10,6 +10,7 @@ SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
 SEATD_LICENSE_FILES = LICENSE
 SEATD_INSTALL_STAGING = YES
+SEATD_CPE_ID_VENDOR = seatd_project
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
