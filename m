Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED07CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFC7406CD;
	Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2xZZ5scoPCS; Fri, 12 Jun 2026 12:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BF540620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266569;
	bh=LPLKpkyJPpxsxHd1YaO37uiXsAgt0DiaNrl4otpmDc8=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsENgc0j5YNvbtmOlY/QXKXJ6gRjzgAItffguyCm2SoVGz5PIsFzW3K6GG9KH7Pvs
	 8MkdcN/x3niV6aCJBOExPvwcY9Ni5vfOPQLWKS97SjNAV3k9MMIW27Z65YCQJL4jMq
	 sluDJQZ4ZJrKvtsqkCU9E2K2wd+O0M3yLToMwzLtYusnvWv34TlPe5CyBE94emElzN
	 h/fKmeNLS/H6oJEB0U+E5d3xxAoMTgETygr+NC98sozvKGxuAtO6miSeiYqWHO9XS2
	 xU1uGnDB1Zya930Akh4q89qDi7qlWTAIt84JljutMHdYg9JVDO5KardF7vrzHvJclP
	 2mCmbzErkE2Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BF540620;
	Fri, 12 Jun 2026 12:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D001712F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C20FA81F6F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDX9_xd_Ue4v for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B724681F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B724681F6C
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B724681F6C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO72thmAvfEUniaHqsQTIF6fqqkZxAb36ku9o/eYGxZ4e2vyzheq3akdsPkMub0G1mA2Zzm0mvBaMwD0QOeKy9OkJl3rJaTENYiYVW1Z0wxKdb6rqtnIQziO54G5TNDIrLRW7BD+Qv+T173PSeoJzPTSt8T0apjLjndr6WMBlkWGYTORHBgsGTsn5iyqjwxtYR8f4r2TK5JtWvtF8pu/JilBBCL5QO1lAWR9fr2kq98PdUpcRhT524NO/EcjaJAMLQRdy7TDGbiKt1Usd7Ud0LweXQqNtmY4GWBWAla5MtfvwbHIxttLevWRhjvVHkypH+fgaTK5wsFfKJnWFrp0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQR1gGq+XtcOD+In+LGMRao7YJB4G7glTc2gX7sK6kE=;
 b=YQ3EDDYKZEgpEh/Ez5OjPhtUCc9jw7duFHqD2vI3rMYEkOJw8z0yKAIwyt0+f5KSInaA5H2JQiOuiqW3Oto1yEu8/GJ7YOGZdeClcwtBxnjqzpzjoM+Rh06WOkl7wYZtkKA4F/KaDJ/jpyZC8pOHBUaMSj78NrNKnIWRbSPeKj1PJZ67rWMukyHwrEZQ/yE75HlMWAPDy+DO8fcAm+SYFUwrDHVNbh0i68EuFP5abrB8GWdFJmX5LNULR0981WPSEJTXZ0hO7ZbYiRZtJppziYZAjw3a5gAh3ziY6Ym2pPV7DSTBTsqpOJmrHRv3rPBEY5TygPUz9oZnzVS60BiQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:04 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:04 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 06/11] package/nano: add CPE
Thread-Index: AQHc+mU9v5tTBOOc6ESK5ZrKYedUOA==
Date: Fri, 12 Jun 2026 12:16:04 +0000
Message-ID: <20260612121516.1634-7-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 7901a081-4141-4319-490b-08dec87c5fd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: HLTgQdV71gTMnYN/ZbWH2DBEGAeY8GEZvXkAxoyqWlT0cq30rLWkDgDTIm5AZKNiIkvX587CgCGTT0sLcCS/WkxxZC259tvXOLIMiO0xFFlzL97AbYTwSF+RVmkFQAfXwK0Om3/T0x0oVZnbOtlW0qifP4SZzQuVYkWK0XBLGB/xTvRqRnD5aoid6q1EVDI31NpT2q6LIqiTNJ3yzF/eR/3bGRRjqqQMk1GRq+gXVcDj9F/B1SMJ6NdBJ7aeCdQ1iZJqsurGID3ZjcAG7KkAnFcwCCK/vKjHWNdtHci0YrVQr+a1YIxUQmgMv+xRZcnYgk2q0Mvj2IREwHMrWRSRCqQhOLuCdPE+ZziLVZXNIVlNC5o024ldKClCwVmnOgMmEDJCNjfGUN3R1IoP0k3U3iLNwqsYpSjbLRyqnkngLe1PW7uD13PjRW8PEva7moYfStjNpOCGZ8jNeNS/Qd/GTeNFO2EV6lNV87ZTivhao/i2YlHakMqyCIq5MMsi0PzyzN/K7JXA60P2EZu0vhr83ypK6uHDBDdMiSkWsfhbO1d3jLruDxtYEKWISH5JPb1soD1g7ZRD1aX3gkmPIQn73BXdG6q6FwHvFE8MbsVPZmI7uUmR/ZFkIAYaqjUakFW92NAdS0aIw6PDsev2B6SxGRhP/kyL7OWzsggRf85CQYHkYRW5TG55XkCwVJHIl4/64kfqfTQpYykuZsRKRwdnA7aM9Hh5pbXfgPiDvlZMmWMLX/I9Ei1DOL2hYQ3SRHwy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tg70rgAawDA4FQavweHu9lntByCNDIP8MT9yrV362Yk5CCLCQdbOSaXd5l?=
 =?iso-8859-1?Q?WOdhVktxtJQr7iDqMkGmu+GWMPiUop6QxllIwlZ4rvBMOth4IIzb6X7VJB?=
 =?iso-8859-1?Q?QTkhkzwsGCHBBfdKM9gUUuryJBewWIRrUCIdB6q2sIPmF6FGYAnQjIonri?=
 =?iso-8859-1?Q?fo3XGS+5bE/g+i/U1Ya8yUVEaw8TKZ+blA39ZWp1K9XqKFTLHBdkUT8uYy?=
 =?iso-8859-1?Q?Y++pqmmzEHBSSn0r4+pg4UiA0mvCCma9fRziAExvhqjOwlnD4RZzIxD1EX?=
 =?iso-8859-1?Q?lCfCIRfJsjne7yRRn5a6psRTX/G7f9rjTUu8NGZtT+LZZ7SUiIe7zDCfM7?=
 =?iso-8859-1?Q?C9DdvBgJjOWsLBQ/FB+rzZqxsW0HtU7GzH//wdKssMedshrwxxBQ014Oyt?=
 =?iso-8859-1?Q?F/nSK1KvNPybTvy6KYakBzsfcHF0K+f8j9zmFDboID1/5x5zvqMtGhIAGJ?=
 =?iso-8859-1?Q?o1x6AewhW1pJGZdNgpZ48mWyOdU4uWyWHHHqqQgEyC4pvJZUhqrPw2Fnji?=
 =?iso-8859-1?Q?koK0Dsj9qlO0SnLm2ahJNTT+InoAWrZQE8uJOVvOX0OvBTT+s+Wn14PUOT?=
 =?iso-8859-1?Q?CTo4iHjA/L2m823TjqREfEuRlfJJhmAuV6CZ6MU96SfMnwn8IeJ26KjdPi?=
 =?iso-8859-1?Q?bYKm0KWPeZ+3Y7X5fPBKGQHmMVy1d1DnNHEo9JjofH2y2X4QbVmseV8bSx?=
 =?iso-8859-1?Q?NA3MgQUTmXsG5aJa7Lu35gXL49d30XNt+1D9LktAHK4VsxglBBKsyRuwyt?=
 =?iso-8859-1?Q?vMZmFnldyhZNpXJ96U3DgE5LXClsfV1oWdn1WqKSu5rCac7M1F0TuqXDQ5?=
 =?iso-8859-1?Q?UFB1ToOftwCwjv1wZpgVyQXOykz/91KqhILG+8fymUov5U8/auwX7CZMPa?=
 =?iso-8859-1?Q?29Vl89SREx2OIrvFFJGHK5BtValUuQyVnt0vcPW9Y91IiGSrtNdF4SGuCl?=
 =?iso-8859-1?Q?Fk1jG+Ee0PYHFm2R6T/LLW5Mk2G8LrOFB2MhHlmlj8RgDbbvQlqrRH/7H0?=
 =?iso-8859-1?Q?b3/2nJVlH4XCZQ5l9YdMPctETgdUTExJaaqR3285gOUmwk6oUJwK3vSw3N?=
 =?iso-8859-1?Q?kQ2m/hyXfMD8grAFjc1bTyyLHld11bqPcBrQ5jdJ8KWchbLti2J9zdRWnK?=
 =?iso-8859-1?Q?sIEF6RSOSIwbi5aBoRXjFKQAlQ4ZxtTubugas7N/luI2OUXpDzl81kOkN5?=
 =?iso-8859-1?Q?alxky/Hga/gAtDOY7xEhuEk1zJwKpDFLDdyQ4XQ6hdTmRwv4A3+rOx2v1U?=
 =?iso-8859-1?Q?qeLHs9r/A5aUZNXRZBGpalCBWBhfSZ+de18eXPUPb7JfhcZHCfDOELHOJy?=
 =?iso-8859-1?Q?Cjixbi+pkMO9pfSnL5INcah1l/LQpJm365C16/Bhy1AclEF1bl5ipNFovL?=
 =?iso-8859-1?Q?p42jedi15bezXCorY9jPv8GEJGMjLYrDLhYN/jWELgkCc+wN3qxNcSgcQL?=
 =?iso-8859-1?Q?cjLwlCVM5WZ+kxP8FGMtBiXivfYq+XyCk+39FCZ5ykrgVfWu2ID69/3W2U?=
 =?iso-8859-1?Q?AG73nVrPArfwXftPRQLrpJ+B78Wx+41DZYZlT9umV/+A22oDcsTtATj2y2?=
 =?iso-8859-1?Q?uCBivFaObJgV0UtBKy7iejJpOTHDYA3L8EI30MuvtigQTuz3TkEXbsWg2Y?=
 =?iso-8859-1?Q?96WpBDt/WoBvJnDGuy658FpwMMfHhy2UX740HhAmgoekLXsIwq26EQEWaV?=
 =?iso-8859-1?Q?yb8NYjJ/nxV4KFHaqlQ3VSqVJv/XwfvdxM+MJbO0wOJ4YpwZsBhBBZXnDU?=
 =?iso-8859-1?Q?VIpSHBw4SicxhK/EFKt8QjnJF3Kfu2cYn93OiUwYJo0NaAFPyK4nqaf0Cy?=
 =?iso-8859-1?Q?UmTJPmY5CcEScpabk2AcprenOIPbfZc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7901a081-4141-4319-490b-08dec87c5fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:04.2344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfFvDJe2T9icJJwBi+0q0zdCB+jgJ+OPqUOC4Tc6D6wnpRb5JqrQzErmiWGLotez2EbtBtNL8YzGyRqikafv2dQ+ISNk3uFJ50DoQevuS3GIwvLWus9gRtGmHsMK4MZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQR1gGq+XtcOD+In+LGMRao7YJB4G7glTc2gX7sK6kE=;
 b=elP41CXQRBonPIHhPwateytrBQGasRhpCRRFEAh721xMRQ60tDQsEW1ZJsNMy6K2pVEBFkhpsWMyhFhDG70zsInPi5fPI1WB+7WDtJ9yMkhP36DrvwMHEZgzbk/+D+A4tb+9SCYD8gRMMUCdZH9yNTWO4PsecDuQliINWFOR0yY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=elP41CXQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 06/11] package/nano: add CPE
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
 package/nano/nano.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a1b94c90d8..4fca0db80e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -12,6 +12,8 @@ NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
 NANO_DEPENDENCIES = ncurses
 
+NANO_CPE_ID_VENDOR = gnu
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
