Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F145CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CC540555;
	Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2dZstBSI78T; Fri, 12 Jun 2026 12:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36ABE40651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266570;
	bh=r+Vxoa8n/CdiMs/xIn6vg6VIvzaoodDNdMBF/lFUcEQ=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOV9fvCFALY+4WsfVPoHPEi7tNBAu/+Gn5QKy8Wl4IRIu8i94KN8lUXIIYQe4UWAT
	 da7MloivigWLxlOFFoHSOmndKzvHNG97NoZS6uLK93t4LqhedJAFDATScYGVdy+eET
	 77RpXP27mpdl/SzUHEq26QT3YwO4ZhNUcdH70yR/5bB7YstTGRv7ZjrzSvEBJ3iH8Z
	 roh0Viv2igLBP9IAwFGpyeMsf6Mb6kpiHBrsQK0a84QIf0+kSj9ar0Q+Z1NEWCaFNq
	 yOjUDugjaOAeBZuRc+K3wcE9IjnXTItlUIk581IA/IOaKHUgRpGyLODxPHkR62LcVB
	 jLK1zoZbTKZTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36ABE40651;
	Fri, 12 Jun 2026 12:16:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D80A0321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C58BC405CD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8Nu6NOLux5t for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96C5B40594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C5B40594
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96C5B40594
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq29LuBQb2NIP/tMwlER8Zg3aR3M2AXqx96t8J7r0aJ3i/+8NOKk7+JwTvuOv7bBX+FL/P7pFmWgmKOTKAoacl2wdt0kMYEu1T37dbSrVpNv073P4lGqlzl+AE+UfW8/lP5keSgTV+ReZdmiqQ+ctlwSGvgSXGBRjDySyFsUi66O4qOmFhjBbcKAD+78JnDnGJtjAdCvFvaKQirEqrCjA+qImqKAvS4Y9qyoCpr2ChrBnX112mjqr042bHZje87WykarHv8XiDF95iinn/mSrru/mlSq97Yez3CROuvB4HKXYqxgijJBj3apyeV98CsIELgrI9AUOSWHfIfolbYODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2QTaoBfSxYs+jH3Ncki9GNgiPNZ0jWxt/Xgbo2+Jcw=;
 b=BKOxN142fzJ4gIBp/FAfiYM6w3lNeCl0NVTDLH/gyrmK93cIWecT7ugSklEX7jkJaZYYoQdSHBif1dAeDws7WXgW/Di+I7mowg/17JCHH8c50zsGiEoh6EBgDTvhgJ6QAltuBGEQLoCtR6fArPPZWhuN3F2D/J3c+GjYye/GnpmGC4Qp5wdvMbt+JsNRAHhvf3DHtluGyZpYyFTMk0PMJnVPnhgvDIp5nc2d0qrY/Q9VYslZ4ResgTpnZ+IRszNZP2HQshZdEyzS3cTBOnWsnCGjlulSNXgJyUGvMKzv2C8U+mzHHY4Kxx5DCI4+gCgnx0/oNNPphIZvdJ3g0/QO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by PASP264MB7012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:540::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:02 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:02 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 05/11] package/m4: add CPE
Thread-Index: AQHc+mU8zNVeTiMBtUqVLunTzYVjng==
Date: Fri, 12 Jun 2026 12:16:02 +0000
Message-ID: <20260612121516.1634-6-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|PASP264MB7012:EE_
x-ms-office365-filtering-correlation-id: 0ca3f8db-3910-4266-3e5f-08dec87c5eb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: Vbn89EKtxxhG9JTrySA1kUYuXv01TC3kVg17o8U2TvYB3rIn1HJZasllH75qRXdnry2lbMDMKESIBO7s3Y+B9axRnBmcS1cRAVqOrEczFwS8nPJWMqqKQQO6zOAteOVBLtf23JjW8RphQGZi4tVvEgwEnchf85M+GzcuHkrireFo8gxqqBe8dXjxgis7hiYcie1HM9foyLo/1Bs79seoozl2ZIOrcFnKl3za+1OU6zsg73pL0c3taaO1SFPIN4K5OlKNtOyQEnDcGHqBggJDY5JOYHnuuIatMY3lFL8S2HnRLpV2Nyh7Ey8z272c4MgluGZQ3GaXgJy/pe9vUSsBp8I8gDTZqZKgKtO4Y7XN5hqsjUvi7G7lbAtJWncvM9Fm/s/CHE2W9ep0598Im9UlZAiLoNeDxpT0xjSlJG/oRehX9KrZsoex78Agxonf/oRW+ctGIxipcG05+wGw1U4G2JwHLd0T0WrEfxFRudxKfDD77zp0XniM9vqeAUzhH2mp8G8V/Fqme4Cz/P5NcG2uGwbJUsnooLA9nj1odpOpqy/AhZlNISJMyRFdpA2Q1lapWenw2r01EKTCGos0fTFTyU/J/JbxL1KChttfDKO5o6CYYWS5hFsYmih6NkBv5MoCJMyMD5NVQtjk3lQ4/PkGDLRAZprYnqHeGWEcqDrW3osWN4DtH8ntdmOI9IfioaUQaT3NI4VARu5dvzOGE7rpImlS0ACyhjtuYvPgxTC6veNpWUZvTdE82vQuQmMwbqy5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(6133799003)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QohKTuWzUxuwhTFH7B0a+s4UAxdNgZ0lw+m90V1/Gcdhn5Rh4MvHGecwEh?=
 =?iso-8859-1?Q?WI1hASdsY2H4ZXoKmtkHPXZcfU/2iC8CwLa7vFYcTX5EqQtDqPEv8SZhNa?=
 =?iso-8859-1?Q?+4qV6wuyaKzuF2Qk9biej/mAJidMIMZ+wuZc20Zc3/S299LIUCBx7012eD?=
 =?iso-8859-1?Q?emkbGOo3PM+LUr01K+SNeKWDLaRK3drpHe3AFJfabzi/ZofiWhO7wHd5GW?=
 =?iso-8859-1?Q?060Ubgl/0OjZp3Ij9jHUrw97ddoAITG+2rPUof9FwyBskgAi0RiFW/fX53?=
 =?iso-8859-1?Q?SJvH5I/yGAzmd/diRzLFRx45mNiHM7sIDLis3I1Q4lBF/GnJeiaPC5QSKv?=
 =?iso-8859-1?Q?5igQ59ByUaPfXCqrOnENBlzolsV11RaHpreTo/nZHqXHRYETSmbjeOFhjH?=
 =?iso-8859-1?Q?peCuXEhW3MvWnMOWhwf6WhmEeEfGK2Ybt0Wsmi7CgcmCi7ircfsHtOVdv8?=
 =?iso-8859-1?Q?7aANLZUN3/N2tvayCpgbaaHG77OsGY15/HdAQasawDANtGvXjwnFtxW3Ew?=
 =?iso-8859-1?Q?V1FdnLwQJCkVYismcYx5jP4cpCm4OJ6AookfCQS3QmPJknn8u1gR+Dm0Nu?=
 =?iso-8859-1?Q?JoFJ1TaHO4/g1zPnMRef6ZuqDJOg/kAu9Yfsma5As3RphLpDl0sLKBhBz5?=
 =?iso-8859-1?Q?6vEH4B8LI/sEjiUB/G/o303p/uEkU46t7lF5f6yhB0HMZiLmp5zhrIgvHB?=
 =?iso-8859-1?Q?j5ZfdTwNIjaAOa5KNGB2U8y7A/Nri6WlkPEXS3VPmjAPY3D3FcuBs5J24j?=
 =?iso-8859-1?Q?pb8D9jDap/SwFYjrnHEjWOWELyXfb+z0LbTKrNk9l6xRPGSklGHrC27uIz?=
 =?iso-8859-1?Q?2CbUcu6FciEQ28Uh1uGR6UlODHtAeEiOY0X4AhH+J8b4hjMu3tON7AgOUp?=
 =?iso-8859-1?Q?XDATeWr/V5SK6z0tZiDt0Ifm8wIhrKORIM5d6vtHmGvomFElh7v2tseagm?=
 =?iso-8859-1?Q?rYHG4pFiyZiLvZEzPh1n6cNDoLND4XK9aMu2dCVuf+ImPDLAPMXZBb02Ja?=
 =?iso-8859-1?Q?+HvYkuc6nKPeQjF/qI6PVQ0zf4BgMFPOnh4lw9Zzkf6aeHtJqXLnBvY9wG?=
 =?iso-8859-1?Q?Mrr1RK8B2TxrZ060JMO5/tB1bt1SYOLAmVMAoEji9vBXK20C3bY3b929qL?=
 =?iso-8859-1?Q?u+TSTQKullGq2RbOFkYnaFuLz9lLEtZrJTmiqI3WNvGB8Ipe5lzvSEMleM?=
 =?iso-8859-1?Q?UDQ8Ntvs5J8d9sn1reIkydt0A74oT8zwebzt5A1VGzk952FywkNJC10GUE?=
 =?iso-8859-1?Q?D2ZdcYXTaUM8u5/eHxDXf9ozcrdo8OI3JTALZe/oKWAg7MwW2AzxhsgvdP?=
 =?iso-8859-1?Q?6URfJDKY0z7N8J6v42Gr5uGrpnPs5mVSwM57ZF4Tx1iWQkgjZEnxkNfemL?=
 =?iso-8859-1?Q?ZXdcIbx7zHOdtX+5oHMxu4uyzZu1mA7wqumrcQrfPXL0rcPwMqRJJw1Dhj?=
 =?iso-8859-1?Q?82fIPrTYGhCXbdmXbcfpvJTvs6D9ey8x26SioheHQf/d4Z9M2iLvKYcJA8?=
 =?iso-8859-1?Q?odNxU8vLYIb1UgjSjVYDhnGqvKIoDj8JuXdOGz/E3xz651w8CZLNWhy4pf?=
 =?iso-8859-1?Q?A/jhv2WgViP9+fJvOk8vDGFRVMA7UlGLZutyWvYsc3ShT3vf3jNG0x17ZC?=
 =?iso-8859-1?Q?8fizLiU8g+045Wp7n2O8pTmUV/R5B1zggjor7pYEXp3U4v7FnHd3hW33Kp?=
 =?iso-8859-1?Q?Zb4h1iatFpFCX8c7wSfZadJNGDZSOPMwVZ6mT0FCcL4MPSqDHkZtWiWYm4?=
 =?iso-8859-1?Q?MUxoWG4OEm2H3znEHQWnhR5Czl67buys309HvasqybuBvTdIOseIHTIvV6?=
 =?iso-8859-1?Q?xo6XPYBt2X3ZAT53CqWci1DYBkmGAzY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca3f8db-3910-4266-3e5f-08dec87c5eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:02.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKzm3rbmcfkD3zXOx2NvwompmayjUwLNM3ATfBusgGBFJslLADFeY6Tnz6p8bDAljLCAVMl0HsNTEyCfTUjc7vK4S6k1yylU/U9xAaisRwMe77Hpf4VXAiItzM01QMXR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB7012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2QTaoBfSxYs+jH3Ncki9GNgiPNZ0jWxt/Xgbo2+Jcw=;
 b=JmIBpzGW8eEtIU66M36lkYoouwZh+lnmbw+R+MH7IXCqSMevG8MG6q5Y5yBb44iesTg2ItUPGaBeTytmq5YcxzjMh9npJJwLSjna1slm/ICi+9ADobRgy+FJmhnsUDVdvMTuf8n5LBKvQOkukqG+1CPDueiUI25x2U1FES5VZnY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=JmIBpzGW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 05/11] package/m4: add CPE
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
 package/m4/m4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 396c2bbee2..89a9989268 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
+M4_CPE_ID_VENDOR = gnu
 
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
