Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BCACD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D921940659;
	Fri, 12 Jun 2026 12:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5vCP3PmNaXI; Fri, 12 Jun 2026 12:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 795D9407D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266575;
	bh=/FEdryzOHQq4//PM2WEtWSQM59eZgzvVAlrAERSQ6Cs=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+dH9IF4wN49UXWyPWXoyEFujTjUWJH1XkUnc2zEA9mgDx1CBuixb3KDfk6U33N/r
	 bHd9msHG8tCcw7O9NkEeYGvFLXmZdin0dXhj8CDwtdb/VMywG7A4Y6i6b/aqnDngY9
	 0arqUBA2Ec3v+VzRROp4fKDSgELtkU4MHCVIJazNfKHZGAx7sii6OP4V9gjWnF/GuN
	 Pi5nIUoYLNa2ehQq81EPCi5ZG4pPRdmN8MF2TTYE5371keVom4CYGj/R/fPPdtOPxO
	 5+Go2mzyd2OgBZ62tmQZwxOTSS/9SYrpuDCjcpIS0IL/GqvCOa8Cu1+7RpdYho5BUo
	 2aQR1JwozfBzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 795D9407D9;
	Fri, 12 Jun 2026 12:16:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A39112F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80E034067C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKrV99zxvR8Q for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D23540672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D23540672
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D23540672
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha6p7uDM7kTQoi4ia5tXkqJxZZdIeKbpCqrZ2T0WfvE7gKvhrn+kk2xLLLGmv/lfsDigRSHBffpytOidDr+PkzRSy5e0ElyrzKONiS2MPiW1f9+6q2W5rBSPgAP88gFJVE2Ne5uNDwseWJWCCPt7w6TzWPp2jXjcSDASpR1RhIvw6QwleRYFZ3RHp4u9Lpw3vtPgLug2kNCmP5KpejYo5hnL8odfFcqqpi8SvHi8yyhx+PSpVcXxBQTpQLAOdRqcnw7XQndcbKj67Q+TiqhwSgjgCcGXVIWgudoe/UJsuuoAVDMPgANQmOTJIPy9w6bhj8/HIpAuSErRFZWlRrbW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuY10KIKTuUV0ohtsjnOLAQE84F3++ewtT4vesNxL5s=;
 b=x6xXkIkIdR4jCA1FaDEK1HqY0BYcMwKO95qh1OgyJqJ3LAJCTMoQnixPgV0nvw3rTmPzTayyuIeUKDvPp5Tbdw4FAvpNHQmt3EYjWOswGr5N1oKZstYOjnOiT+YqNNsR3u0k9Hf5NmP4mzxf+TtKBSdmXhgVxZVAaydEJfUkFReHVYhfmbdhxfWtldnKQm6SNjbgD6iA71HFYOaaF9UGraPR4c/CgXyw5Zl+zKLsfQAHoH7Db8twW3l37CvOXPyGYwfmVvKPBqrJOiT7uNOXziF22x3fdvjLVyctGP1LmkBjKpCN7744+3wcQ1GSuO510DfSLx8Xff/HMTTlpIJCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:10 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:10 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 09/11] package/qt6/qt6svg: add CPE
Thread-Index: AQHc+mVAdDcm0sY5pEO1dn27ggUNBw==
Date: Fri, 12 Jun 2026 12:16:09 +0000
Message-ID: <20260612121516.1634-10-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 0f63d839-630a-4f09-cbf9-08dec87c633b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: cuNgtaDkjOIYWB+YRzKy3EL+H02Ez53Ndq/dfuiEGbmzZzCmtLhzOXtR6EbmslbQkCiJjhb1SA3Z48C8xDWUWKk2Q56gfxt6ehpI66iQ0N5qd2+u+Nn0UihJZh9odE0zV/qead8b4fBhG/Tb/8YFpCsifaCg7xbI3cPP1xQH0B7sMuRyxbduEkVfAjcmMOJd2mVNKkusE2r5bqe8TLgb4AU7FufX7NBnantEzZ08Sz+z5yWmjTguiP6IcLqKxwq9Iyc0Wb341kWJfgLJ5UWa2ejtpf4HfP1awR88+iRPtYwf9YCViqglvtWEjOllKXK6MBTtHzfRj+qOQ3TaGze4ppDePr/6nnEySk1TjnsOlwC8s8wFKraFP3WlY0pEMSOl/HW8my40ZcWdrtal7G8oI/K0Mt8rPueOFWOL914VhI7+8wQ2O+igJsz/gNgJDQ9fNHfunkp4Ybg3p9OUoAjpuf/OBrEa2IAGWrvtNKrfbeYuyzZwfzcSuAla1j/UHTWhk1OT4eJwPeJWVKQgfChuoJz3nOy5Sg6Tm8i/auSZwx/FzifAa+4mHXg/IIs/AB9vy+jqjIfb8J/WGefmTvIcDZzPh8FbrfgiOEU9Zn9pOez4DxdZOU8uXYn/LwJerLC/G96AKQe4ieb3LZAEiZa92AKs0dXcXkhIaxDfmiuqmcdASQ1aDxGivYkk7/WGReRnGEhNzITlyofNSG5SgXb5erf4s98j3XNZUmDWK5/eIktOkiw8goknApk1jLLT2oBs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6Ff8oSKzm3O6rOVtw7XJFxsFj+AwxNNC1gvozjE5gkzHYBhg/0GYDdGRNh?=
 =?iso-8859-1?Q?OL5sBD3D/p6267manDxqSrje4HQuhZ5oXtRtF9g/BH1BxYAJkqlvIzOvfw?=
 =?iso-8859-1?Q?5TOCri51kE6UDTzlJOn5vRCrO6WdESReVOET6V2oDjMPMb7On+jYdCNeDo?=
 =?iso-8859-1?Q?sYuFjQIBg1T2Z06THaGUYQsaXe4YTe2JF82+3a3NVWDu1X1dwNs+gpIy/y?=
 =?iso-8859-1?Q?IXG0mt5TTd0Wb7Fy7IyXvXEgc6qwBzxB1siy7WT+CsAAL3tWDdsL0PJell?=
 =?iso-8859-1?Q?QTutOxRDjJyH+fynqYAXwmH+LOFor8nOFSO8UvGeMGmCEDjFQaPLGpfWC7?=
 =?iso-8859-1?Q?ZFxTu9QkRuNkyk5N9gWaNes6m+/uQSLA7+3gCXHJkT88Are86UinhBVNOA?=
 =?iso-8859-1?Q?JUBUxw7Kdsw3N/q4AgbZLxQV6I2hghRBZwH9iyRAmU1RAvVEkfzMnpHdQN?=
 =?iso-8859-1?Q?woOnIQfhs4i1q043qMznSvvIC1xsbyfCaBOEVPW2oHjVo99aIpx4tSTQCX?=
 =?iso-8859-1?Q?H5jKiUGSN74dBxWJTTDhi8kZpUHEe0v97VyTPtrz5IECRYcqPzWygSz7Ht?=
 =?iso-8859-1?Q?3+eq2HjiHUYm1R0Smr+CrjAw4wW48xkURJLsNA9gXam0FKNdJjyPscap4r?=
 =?iso-8859-1?Q?1IWw7T5wtgn55Qw03jWQciBI21qFKo1t6N/10C4mGVUg/tL+DL0nTafLGa?=
 =?iso-8859-1?Q?Oo8JMhq5tei2cOkV2R1Pp5YAzdpGBcQhTRY1uz0Hqi/kLc+C1piyGO5Sg9?=
 =?iso-8859-1?Q?QswmuErewRTmF/stbIitDg2+bnuXlufzLfmNlZlaoa4Q3pkJj9nHEgJhqL?=
 =?iso-8859-1?Q?FxJ6Gu4yiPHdWZFoEZbpjpjuJjUFdFuGVh6JSNfyoanPW1jzNJC041CQmy?=
 =?iso-8859-1?Q?IFOgw0p3j1jcYTbeJ33DeiiB/dfzjdOVsQOswCVBe6SFLAjtd96y2oaZae?=
 =?iso-8859-1?Q?/eJ2tLNVsAg9XqHGm7sFbDvK0zd/Krae73/9iizpBx1guVf/Ek1/Q8xFVJ?=
 =?iso-8859-1?Q?o+50l52xThU7X2Q1vAbqprGRt2Z7kkGsyIztQxOFnZ5YElhBvDS1arzSIP?=
 =?iso-8859-1?Q?kACBdM66OEhj8Q7yXXWIzmZfH9j+BdoIIxhBQ+TEzaTvIgoDuVa8PxDIrC?=
 =?iso-8859-1?Q?R5Qp87Rm9lcnsCcDf80SPqvXYBdxEkXDNdVZRr8O64D1LBn2dYiSbx8ryY?=
 =?iso-8859-1?Q?F+bwIg+F0OhS7UXKU75lnJiroP6I799FNdNPQ+Z3F2gq9DimRSoZzp1DiU?=
 =?iso-8859-1?Q?lVUUX+poiXeWDgdx3DOXtUv6JK+odFzWmHjtKOVK6gByuTRbO042ZJqfzB?=
 =?iso-8859-1?Q?wbTsqoeKeZEGM3ST1uSgmUeAH1dQtbI7P94cpGhZAdLihda7eR6L7HWttS?=
 =?iso-8859-1?Q?DNQcPRVAoFgyXo9Z+iyMjPXw8QszCmU2Bu0qFK64iV2o64HzNZF0k63Lgl?=
 =?iso-8859-1?Q?uXN+ArMrrC9yu1BL6iJzIZCNPtc/o2MC3BHR0edQ7iAEDbEtHfzhXLKd+2?=
 =?iso-8859-1?Q?a675j6D+FGtGOta/uxhPPyr1C2Iq5us1dm45CtymRLIVphjJ2DFwklOoRP?=
 =?iso-8859-1?Q?heWEs1IU+Tf0gX1raw+75yNb5qROHThlaciqyXpXNXTqbIqwE+rDYLTRyT?=
 =?iso-8859-1?Q?9FRfCUI9jc91KAfoRYpqw+kthlvFIbKe0NXdM2vIWjvSmwezJmag3RTNjr?=
 =?iso-8859-1?Q?O6m2VfqhIV+uP06zMaTLE35zbdADk8Q5oxnzAdLZV2CBhbdg3mB6PTzY52?=
 =?iso-8859-1?Q?PdvWpajU3TSYE3XlIa5UUpPLq8KK1Z9dQnFdMbeoTPJnawwiIA0vVMsLhx?=
 =?iso-8859-1?Q?ItIyYU+KrZpaBLLaIC72ipDhxYWcgdI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f63d839-630a-4f09-cbf9-08dec87c633b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:09.9263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gmMbqrN/P3TOxH3TIN62ewajxKsif56tVO44J3ZmARLy8RbRb+Q3cAdg9OsS/oap5cSpoR4mrzkAJNoZ6CGtxqKiZFnI6obyckJaEpJhhXcnEYV6X2OvoT3FPOPrS0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuY10KIKTuUV0ohtsjnOLAQE84F3++ewtT4vesNxL5s=;
 b=ipc1nJ/UC1gBO+8n2SF2eLmYyEMVZ8akN1RcDq6CmXmJuX/cN3A1KTsOidoZpTaDR4aKQPzQ/SijywhH4+1kXOyLnl/IriXgY/itno6O7sEDw0yGHFjOBNVfQifE+dViFRek/aj8cRbvMCFMvyZsUPL6csCsoVclB54NljCPgdA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=ipc1nJ/U
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 09/11] package/qt6/qt6svg: add CPE
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
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 08570c7f9c..db0b11735a 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 QT6SVG_CMAKE_BACKEND = ninja
 
+QT6SVG_CPE_ID_VENDOR = qt
+QT6SVG_CPE_ID_PRODUCT = qtsvg
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
