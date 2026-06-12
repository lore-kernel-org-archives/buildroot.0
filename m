Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B108ACD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8105160F91;
	Fri, 12 Jun 2026 12:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjE0C_eh4Jk6; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2536760F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266567;
	bh=EFxf8jccMeIyU08ZJlPaPZOrhB7bIXAq4npasOW9g4s=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQuCdCYwRdWVZrv9OJZKw461atpkhQ1EyEs4BrG41bBi4NMwlBzw5ghj2gvsk5X9v
	 vLg9FwLtsQY6zHA24feTiPXUIzASQ8TrtaZ0v3GCRu43Kco5VcHC37qRrLITBWqzKU
	 ObRFV9piC8syXI4etUz586VvIhILu7Q3md+1N/tRr/nFlT796ifR7e6QTpfrBuwed7
	 fAKITYNOUO6wjS77WP9WB/J5SdBoY5xsliif/ZdMglxsV77Q1DM9k2CFj3FOS6Xc+2
	 53VT0HYH6NmWJyBFxN20ojYKiCAujW4pNndbD3I1H7SWfdbm6Jb5Ve+ExXhBy0FCgD
	 BXZI1qgW3hodg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2536760F36;
	Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5303237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9939560F25
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQIPe9sOOvOe for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E43960F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E43960F4B
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E43960F4B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXeOBcdWCydnUv5zbZyEYF8aLrsTpksaLtxvTukYcNVkjeNzVDdV79RY4vO6NB/z4wR8oH/O3FVJIgCGVxT/0NKJA7d2/M4VSHZI2YIOPkr7gE7VJEzSk799gFr2Tv5EW882qGPeGur0wuFF0+CvxGdKhKPbjHSVc9VIw+ODZmd6OQUOjZ1iZbuQATP9/9P25rNiXnompJBMnGBSaCA6xOKhQ/N0Gy53j9xc8EU3E12DHEhpjVU7KnOEVUW6Wh/2txswTAvWQvGZ7wO9TnhpuId4JXDtm7d2ghi39gxNMheyh//TOvqKr6KQgHzWrJiv2GofknlGeQsbt61WH63Afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTSjkBrJhefjIUghVwca35CS/ynHY0fwu7hTRsvVGwY=;
 b=mxDNxqfSdF1/7bIE8ncHPJkyNMGP3X+O+75B6bI2do7o54kLa11FqfznR/CRvInbV2/4DY0jF0iJJGeEIhfm624cA0bpVP/36aE3yPLMucL+U5wSdPgdRFCfEThqrN/i/3oNTElpubJd3NbVYAN3tsBTua6zBRiokOcvHGiz8LbR23/VLrYC/XwmRZiGCmQ0Ok7TLp3rC1AEOX6ZIZLTBzzts1i2DQMkAc3ve5FDR0x6hRUw2jcR4FDFEmkQSI3NB1hcrd6uDPUMw6JfWaa/OFtHlNxN9bcPoziXQM07j0xXb8O3YC41sMAoEsEv43Gz+O8+mCejHsqMFOBo52dnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:00 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:00 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 04/11] package/kbd: add CPE
Thread-Index: AQHc+mU7Vf5c6NON1k2+ljQylrY6WQ==
Date: Fri, 12 Jun 2026 12:16:00 +0000
Message-ID: <20260612121516.1634-5-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 5b6c3e7d-0356-4543-4882-08dec87c5db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: 21I8vP7mP5Cztycx5clOCppvMiuQQmWt0OLQzvHXdizToXwWGS0jsqjmzJc4jNAa+moWGGYbpATWwA7dl54s6oYF8/WLM79yS9YSUSwfPODxYUAWcWhdqkEXSE4nF3/2NVQk8ox++iYftG2Yvu1GFrylT95HbsMbkiaZm5+SSeKQeuIoz7tjrqaRI5hDQ+ZsPqUDG0LaNFjDxPfMGtuo6iMz5yu/oDCqmph2jTIBy9Jtt2RbWlTsfE/0tDAEwXXqYfu5rZ2N4FVYJDxb78jR+uD+VfaC+uAF62X/kou0VyV8wHTt+ySemMp5XhqRhV1Cq2VuswJ4t2tT26Qm8yr/RibfrRMjNeO+ZtLiFvTQtFppl2P9INeU0BU3hf8Ln5/Hd5aQtqhTPFtwBsItMhtemOgOQmuavErHEn6PIq6m2peHnw5tiDvXP0UUaiRy6wKdfrQhC5bmrrl06JgB4QhpMafkrGDtIGjmxr9/Xvo+ojrZLl3BquWBk4/L1qq+lLsRRyatFvTvNd6GenoYKkr5qoZqb9fY8OXW2CBi9BeGd4qV0J6/fiZq57LoBVcwwTWAIK9U0SeDsMpidTNBLDRC73PAMD+BYntqYIRJBz5TSIO/NOUhD+o0E5Wyc6tP92jety6uPYfLzotCrxckTEqtAMpJBVqlgzwr3ONLeX7urfprJV1An+4gT0IT7gj+Yc8Nb3cRNwzqoQjzvN8w8b6fEsR92Khrf/vi2xTnInW0+gpJDDBBCkAxnwBW0RRk4Atg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sZiJuqTA1Kjg1ufiVSzs/kHGToez2Cd6oC9+e8FLnmWRI4Udft95Qo86Li?=
 =?iso-8859-1?Q?wpxWnxUTo36bmPbw5HtLskS3nirVwcqVJIjezDhZcwXhs94Funp2CgDzhx?=
 =?iso-8859-1?Q?wkmscsNjfyoXUq6S3gGddxO6nWci/xPfXBZB/7qaRvtw3GxPFc88qYFByX?=
 =?iso-8859-1?Q?O6BgxWiKm10zSXMbCwQbjRXdbr2yUOApYNegffb+KQ49cTMYIWJIVVpNmY?=
 =?iso-8859-1?Q?atPfrhk3xc97jLiXh8M0rd5nEdeWmVGIErc+4E9leln0dL/f2hycrYvpz5?=
 =?iso-8859-1?Q?4uZSfgi5NWq6XsoAI9UDVGEwiYUya2IOYskS+PjUVn3NE9DZ59W5EQGGd9?=
 =?iso-8859-1?Q?DOS3ilDM6y0Kg8mdasnZQbsEAnT/jr7Y/2TpsNElD7skNNWWEUwpAp8if3?=
 =?iso-8859-1?Q?NVFFrM/3S/IbNOEdKA0Wea2RGFLgdNceLuh//KJWr8kfFXPLCGFFTUJUte?=
 =?iso-8859-1?Q?qyWmwyUV/nyUU4/RPeZgfSubSxrliXYNbLcIDQV9u3nZ+J0sNTfOywKSFd?=
 =?iso-8859-1?Q?nglgcTJCItW+JhmzhfUp4OPqBpGMFnuTGR8KAYXWRTd0TKsPxxbkqd0nm5?=
 =?iso-8859-1?Q?AjvOstZXSNjG4krpzT7HF5d7sjK61Pk/fddTApp5rGaIZj5o8j+dPjThzJ?=
 =?iso-8859-1?Q?NK2mhMhEEe5aG3yJQCIxFB7a4gQNXeRg5ZXPzocgkfnn3EI7FkNmWvws6x?=
 =?iso-8859-1?Q?vVn7Z+vtCvbI6G3dXXy9mEkOLyzUcex7gvlg7yAa+E6lPle1NWqrMvvk0T?=
 =?iso-8859-1?Q?jAcdbfrYsqbw9Us0C2qUYrH2vonjv7s4B1CxxxYBBoKu9+pzACfJmAw9UW?=
 =?iso-8859-1?Q?w1f2cC5fnbGJPM35K5IBm5JnePuDi2sU/uBQLht12T+K/UtYARtBPy+89q?=
 =?iso-8859-1?Q?9kV7+pafHh27n1ebIrm8Kd95JXyG2icDbmYG22QSNpmSKsKK/YOfbof1O3?=
 =?iso-8859-1?Q?hAxYI8r6Gk++QdNAmB87Cggh+sH5H3U8DL7DPqDXvq/cIPLWXCQ2Gs79b9?=
 =?iso-8859-1?Q?yF/m8cyjz3MP/Bg6kUXhdkbzB8mSPWPVDpQ9ISkURm0zbWc/mvL+7S5Z+3?=
 =?iso-8859-1?Q?bVBWvOTRYBuAeLNVuB/ivV9f6TDAU1tfiJ6MTw8Vvlo1NG1koNOo+eazMj?=
 =?iso-8859-1?Q?hMr9zegM2dhhjeww/FnmGL6bN0UKzUK1LyWNWiFuGdFV/fUbuLtH0CrRsq?=
 =?iso-8859-1?Q?bPMyHVBjJsEX2PtV3Ih9iuEKpA1mmDa73yZdbe1LkftIUZLIWaRU0A6TI6?=
 =?iso-8859-1?Q?zedfjtMHSYEsQ85o2Ovt+AG1nBGPO9Jt/HumVtCsqJCCSs9IY2OiFXxInL?=
 =?iso-8859-1?Q?8okcGOO0twH4AniLBzA7O1US3mdxbe2lLg/t9vvNXHIVKfS0+IjBniPHb4?=
 =?iso-8859-1?Q?iBlXQp1s/tCSQE9t+t/9xR8NCwaCiHk0baSk/s1K7qN9YD1NY7xp3fWVL9?=
 =?iso-8859-1?Q?uD99RqQ0BG55iZj8S+0WB/+l1M/e/m/AJSesbHIWv2AEJL/Rfhmvv0a879?=
 =?iso-8859-1?Q?Y1lB781Lj6ILNBMUbxBP3MPF9fwv6CBLNpm/u96IDu4GE6IBTTtn+sf5po?=
 =?iso-8859-1?Q?Lmh3kiVYMO12kdwN+cYUBoV/uOOHY2Mko+cY1UaMYUvabCNqbf4cQBWrnU?=
 =?iso-8859-1?Q?30jGn31GNattR27vkdKwRSkPIb7HqxGLuNp5If5pomYwTb2eAAgPplaXK0?=
 =?iso-8859-1?Q?sQqToBHKPX+dVHM4GlR50n8rWthiaZ3lV/xHlVCWEma3rZvm8fIrq5YoJ8?=
 =?iso-8859-1?Q?ioK7if5d1VrbqPXFMJ6BdJFl2JAgU9KivdY2Id/ZHeddmYC7K5rb/0jCp/?=
 =?iso-8859-1?Q?3BLPyBq6E3C2e0tog0VBjyb1YBtTZhU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6c3e7d-0356-4543-4882-08dec87c5db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:00.6159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVl9N2/sXsCs/EOR6XunEZVKTgT1MloYf3DoY12NGNNxDU5Ylu/AxUgd9y15ZNnR4K4WfA33f90XdxFFDAeiStacU5RSZw8iq/YocpJ86OmXuRobMAi0UQeQOQwoL/K4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTSjkBrJhefjIUghVwca35CS/ynHY0fwu7hTRsvVGwY=;
 b=s4VNvykZb8BC9DyVWxsuObcK914+ntCnI/PF+4GKmUWIzCb9k4R6GvOrO7yUoRLEUdCbNeOCRZQYuBihwsy2x/M+B2+uocS6fShewiPgimUi+fQwA6JgsA7EGk4NfoSvoRMV2oStGwdqb4/JSF7XKL6ZuvUCBx0XOTOY9LoiQWE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=s4VNvykZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 04/11] package/kbd: add CPE
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
 package/kbd/kbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 953adccd0b..24516a8dbd 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -15,7 +15,7 @@ KBD_DEPENDENCIES = \
 	host-pkgconf
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
-
+KBD_CPE_ID_VENDOR = kbd-project
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
