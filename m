Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E35CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8994051A;
	Fri, 12 Jun 2026 12:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4OgBFNnyZLY; Fri, 12 Jun 2026 12:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3B874052D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266566;
	bh=M+yNz8rmnvjl2tRnK5uJVquBE+ft3dkm3KaOYNaivPU=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDKxvfjyQ6yG8h0s8NBo+sb1C5qlZJs5MRIL+ZFTIpM+JOurniDrLPya9N+PRCK5K
	 6MTCwCFnGEqIB4bGFYkzhQNb4NgEKfvodvdw/rOYWcxplEgQ8JMAqtjGoU/Bo199nz
	 lIHvh7QGTHKZz63N6i1IO42fxnSBjAuLXJlOmL7TETWexyhvZFLIJDxfSx4gjrQ2f7
	 H5cHU1EEa87cg2dRp2PV1Bq2UKnKfgikCv/g+6AmewxVjI5qIE1j6SllBN9VDPXuXg
	 /ivUnWhzib36ME3QnSIKZvtJaQC0kWOOHEqknG83M/XIuphw6M/bKsa32syGRTIRXc
	 rSHgFNDXqYG7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B874052D;
	Fri, 12 Jun 2026 12:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C715237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A58260E9C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QldLnnkx61Mo for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9035660DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9035660DE4
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9035660DE4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijax6b05oFoPkQXoQeywULzt6R9lwrE6v149Hr77ujJwEwtP/UhVis+6WyuNkzttXnHuslBSgBtL+W4sSVyELlbsG9zL22lig2q443FBRKHkdX2Z9I5/NB+ByNtDY9AKUTMcMxCifEQWQPHNDhYoOStn+5OwPRI9sZsR8C8OBfsBspA1maizG+3vczmV69OcYSesRFJAcGH+JY2zbQ9rUX9Kdyvg8tSgzUygwATgdQtiK/5MUEKJB/rp7ZIHfWRD9XhupE0ZnPZyyaCiv4JumBm6F+24OygkRb7GuUSRciE/gS84iewwk4pMYj3L+ryfjMO9ZI1/ZNelur+7sdJF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUlWO+qDE0YwK+oS8+0ygsrAb76GiGjh6UzbQjXG+Pg=;
 b=iG3vx3mObESb7tUOsirYexir+IYg4CupyxXEEpV6J6nUlyKbeBi4svU/XIZhiIiHaNUZS3CVLi1owAuIqtQLfUdXVSnZiF+u+09ET/jrTRHnmmKr6Z20VjP1XLywrG9YjB/R3WHGIRiQF4Y11y4+3INShOAJD5mKGA2czJLbCztJ4WFu6GTZgalc9wT1ACn2FO3xm672ikO6CQN1DwZxYUdEv3XzpSwbwpBUaUT5H6oBGnQ4xIcrDAhWT1WGNIaJG5nkK5whRuZKz8d19KNE1HBCHLsMz9Ta9RQf3dxyRxAOmIg2siD9y/oSbkWyOTUGGc8gv5bBCBYyq9r+N56Stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:15:59 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:15:59 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 03/11] package/htop: add CPE
Thread-Index: AQHc+mU6Bg3dkeizJEmIUVe1keYTDA==
Date: Fri, 12 Jun 2026 12:15:58 +0000
Message-ID: <20260612121516.1634-4-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 3064ac2b-e835-4e92-a17a-08dec87c5cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: PAj3ZjlZcXyxgNK0S/w/5qOcFQ4ZhLqSWu8uY4bTRx0fOClbDWWbxnzpiV3wfgq93nLknn15InjeUFoKEYLuq+h7Ks12XOIsSQKMWTvnojRhdpRflUZwxU4G8EHevw5qG3jecEkK6HO/5tDTAKcClp1IJPctKM5SZR0Ziuz0pkwin3eqG+ULYiAuh5dLBN2ugH6VHpESL5yfl+f1E+qf2pKft1xjOAIZKXS51L5rtVdx3zfHw0ksI2WLM3h/I/aS446pmcL4GF/3/DamGAZzaw57xvfBrswd/r1A57XJdJ9SdoYIR1JT7hDrpDJr5lGDXVT984P0beOWzUVBVaHX4rKfZGYcEY6vQHJLWKTEld/CMhJobXJcUVaAyZjp4Oc54dZxt8PAeE2vQxa3BY7F3wHR3KKK2XjmHd9/yadcoxtTljEJ0Q6G0cu/NYmsXhHoIPoB/wc4cL1OYzjKGLlVumS5WlRRwb6OxYoSCFnvrhLlnYE+zzBZMuwpUVn5XeTwGG/R1NoyPNp+aqdW7ZEaGztu+frjOyIXsrog7smAOxwYoC5+kfVI6wn5Ig+hTePkCFUOFU7SGjmPTk2gOFD1gBUqRwbBd1bbukhFffRmPDOf+f7p4JaCJY6XXcf3Iox0F/xsRLzM5Pe3BWwhjXJNBF/7+6KU68LGOX8f/qKwJcxdZE7j+CMDEgKeq2whsiH12msCJxypmjwYDsl9m8LE3BMh3LQ6J+iwFihnHVSCW0DdciJIXotlnsF+qp7YLnG6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cgUIqgr/1ckF/bVprMpXK+77HkNceRl5eBAH5FREVphhk889dQu7eSioLL?=
 =?iso-8859-1?Q?vbFdKQ8zD6iutwXMJxu7vR29n/PN+JjQAls2veTldZ/H20cfVQX7GLomBi?=
 =?iso-8859-1?Q?9gDWHh/lXy9aK3ByLc86wFySfD+povasR5u2cATGZFFey1y7/Wkkg0VkXO?=
 =?iso-8859-1?Q?fpyppc3h0V6D4BKQq/IAw5aKJDjXmIs71FmkgQIQIvPjS+eoYj9nM2LSir?=
 =?iso-8859-1?Q?I1W+6V8oIP/IP2Fz1Ygbvnui6jupueK4BZxRI49DGGnK51Wm5TTGYbxm0h?=
 =?iso-8859-1?Q?Pl1zPVFQFNMwBj2BTqKL9rf+9Zktwzwy6X9k8YHiHIdoQ53+Q8m3gX+RO+?=
 =?iso-8859-1?Q?Ky1NBUVtxnJGH/VMf+gEHoiNfWGuyFrkTv5j0Qw/N1A1R+Nf0/l8Z1CvsW?=
 =?iso-8859-1?Q?n4UTCAM9z9KGznBjBmd32szimPg75ENcKMZbfWg+TlsLXET1l3QykSDaeW?=
 =?iso-8859-1?Q?cme1B/mwsh59VZYm4Hg9sUB6FVy37RBQPyc0pgGPA7nEZMLnTgBhOdPfYl?=
 =?iso-8859-1?Q?LP/A/SOdh08MEB4H2wDzrawnsnQpWMKLzs4boObmskMJdPD1qyU9aEWfve?=
 =?iso-8859-1?Q?UWoqlNKU1KyXa72QnYkhSak3SeSHmEFI3/TJPk8IwEiD8H/W8lRAEtUOpR?=
 =?iso-8859-1?Q?0c6izcE2l67RwAXPyLrNCI6KLJHQdTB6su94nO2IjhH02opYZx76C0D5yw?=
 =?iso-8859-1?Q?fvglY3LoKt0CKzY7jIZBF1SHh2FWLrTrBOy1CKj0N6MR8HKdB3lkjMkgeh?=
 =?iso-8859-1?Q?3s78sIstnZNIffWKkUS+vQ4VIxUnqBEAP8zbu4zdLbTdd2P4+9ExmshDSC?=
 =?iso-8859-1?Q?pgaIwwE45o5GldBcGhRSqPQq+Vigkspq/Hty+qxVOo3VaqCg6/AaJo73Z9?=
 =?iso-8859-1?Q?zOac3nJgSZJK4e6HsdZz+kqKhqt/MxhQR+TiHMCLrO0Sa3ADXtxAl4baGp?=
 =?iso-8859-1?Q?z7uTqkzIeWsrpan5mKPiMcX/Q96jlkVa2Fko282trB6x2imj4YYoCfzdj0?=
 =?iso-8859-1?Q?I6ewvSc3SDDKYAUKvWihdm32ixNG9QzWPGZuAubZ924NOQ6/sUqYqa6viU?=
 =?iso-8859-1?Q?Cg4txevnxhIzHgfaPZ0Bbe0a+61VSFfngogJm8GCPd98CnxCrKAwkvjKFz?=
 =?iso-8859-1?Q?TR/WJllL7Ya42npsXvp1i0dAkCXvWbPrJmUnsRX7Os/aJZRFH4HbTeF0tR?=
 =?iso-8859-1?Q?Undvty30YrnBV1ci8yJvFRgC3nXrdAOFU/aMB1vO8SYyF9/wvbVCXMSokH?=
 =?iso-8859-1?Q?zAUuR9OnYbU69KPFRiGFvmzykD0ubOJknM8jm+Mc+9qQ/mhcldtux0Zcnu?=
 =?iso-8859-1?Q?BVXFIcMtbQQR90SMsX3SJIW3YlTAgn0Z4bkZgtY3hct7QdPFg1f4XUdimo?=
 =?iso-8859-1?Q?/D1Zd5G0nfJxnPk6YmM0Cfqp9MHQ/0TrJ2nXZVTOshq4Ud1EwYeEORL0Qk?=
 =?iso-8859-1?Q?uQd+/ouXymWyKy0hIkRzrfeVNksmbD4khxlzjUB+0+bAiCvzXO8qVkkeQb?=
 =?iso-8859-1?Q?l2Cvf2ZYZbsuclD/Cz8+Xz6SyDETJfkO4P1fy6Wex5Ve9FAmrFh9uzv3sM?=
 =?iso-8859-1?Q?ttFrYcaqk1S//XQ5N+CHTxxuR94bokZSkEka5/ql4X7k6Rv1ZG8O7t7Y0u?=
 =?iso-8859-1?Q?Ssw92IpHkS9C4KPwIrKPLKBk+59jAz31RShFkFzDLmhufKLqbhvLRleb+h?=
 =?iso-8859-1?Q?4cIbyJnb6SfD8WYaSaiqerRk4Iw+uTF2ZgQ+BPPcbFc1jaV0/ceseG/Bt6?=
 =?iso-8859-1?Q?+8axUBwYnmz2GYBYcXhLsUF+lHjknB/1Zgx6itj8Z2LOlieHzJ1wSwS0n1?=
 =?iso-8859-1?Q?wzHXVVGJ8Z2XVdaDKh81NgO8HAqmbvA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3064ac2b-e835-4e92-a17a-08dec87c5cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:15:58.8661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GABWGLgrERtXtZjBg4NqkSN3xYU3SQxDcA3wMLiu4nUXqE7sxp4wW9xUsVZYpIvo7qPvyyP2A0wrNQODT6PVY3CWDgJpzsTZHKWDkqCRtUKde8pGATaebW3sgbT4SaZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUlWO+qDE0YwK+oS8+0ygsrAb76GiGjh6UzbQjXG+Pg=;
 b=mBWg8riors8dhMPLvB2WxPGOggLumSwMf9JiKE6LbmSRsFt5o7LnaNWMs9OMMZCSE+RDRPaNGlZ9jCXUBI2J0+msvNzoZ5DSTmETDo8HAtfIWZ84mQpiQqBRlTE8h7BPeFZcymNk1p/9aHTA3R4vyntRlCDnJ2+7SeTlQ88Rnf8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=mBWg8rio
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 03/11] package/htop: add CPE
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
 package/htop/htop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 4fa8e4fb5f..72d9755ef9 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,7 +12,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
-
+HTOP_CPE_ID_VENDOR = htop
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
 HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
