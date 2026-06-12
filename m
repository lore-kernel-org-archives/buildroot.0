Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF8CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF3A407BE;
	Fri, 12 Jun 2026 12:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uFTX9DIC9YQ; Fri, 12 Jun 2026 12:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A5440659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266574;
	bh=57/wBv3ZIp7lUoiQHO2sEboqOPHA2XDasOpo9cpF9mE=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNN+WEiX5paaW/uIUFe5/BGpEFk9U9Ccc61JvsPoEFzWaFu7uLpJXTRJo9PvMEcZk
	 qm0zqpIJuBQVqplN/2xmxXfCdVYcd+xcoIkRv95gfd6j/5gQsr0NT2aecIukrjua10
	 oaDuUkBtOvgEbnRWjj66HPyNk6miRWX0ICImcVy3IeK8mjnZ1RYL24rI7q1qZA+rsm
	 Wk+t9hKsqhr+D4tViTklHH2Ob76oXn53KiIFgc1IE18YUDV8HjGNngX220tD9IVA5i
	 gyKUNfiRZj5vABqPfJB/FhY5PXupwsYHYVApWfiFoTRQV/hluM0E1xqLAugQEH/4+l
	 Zu1zNO/WZraiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A5440659;
	Fri, 12 Jun 2026 12:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A661E237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9854B40723
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eref7O_F7V3G for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DAD240620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DAD240620
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DAD240620
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkwoqSmbwFGqLYgqk9KJz1t3GwOlHfHvAxItZfS+fGx4wZeKA3BOpfGhymtf6MqVkNUqahQECq/ZhT2qmCxDk8bZqqzy2T2ePIUqtSfaarDlJucJpgsy3VJRW6itn+3S7TW2AMy32vV5vctMPJLIT0iJ4QvtkEL9MC11PknCSXGY0SbB+O+Guzl7uUZ2lvkCA8HtvsjqO8/a6QIfKO0V6Blj7n5jLRI/zGXVNpf4fsSNtlkvmfjdiYrC4waDi4Mg+1X6vcVvYyb/vNlnMoKrsqGCJFT+Gm2h4jk3FuKjsuLFt50XmhhBYGDGST52AujvT1R9zu5yNEMVUD7ol33+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCV+20WMcH/CggFPTCCJ8NAWYCqmqyEb9vxH4O66l54=;
 b=uSg0muuZbRedlaayN1w5/QY4Sk5V0VWE0ugnhKdI7UHSVoTej6jJqionAV5PLwCBfasshQKttQyfsoqcZCzFz6Q6wLVtqRAb1pwY3OHb8qCpRvytKwSxARz8t66O+duVNxbK1MDLpEM0f9TV7fzr9CogQcEr2LTNXNr5QwxCYjjcaE8luPsynOAQuIjKTlAiTTs6XMNDD9jIuRVGsevGuOndibqpqMyc44YP6EXx9JF0wdsKPSFQhE7ExlRRk761dXYtCNVctK8jSszm80McQGDp4pmhu4wCDS+4utSN9fFO3TQErxPeO8f1QKc4dsEdkpFdOfMxuzQV8IKdTi0bxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by PASP264MB7012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:540::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:08 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:08 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 08/11] package/qt6/qt6declarative: add CPE
Thread-Index: AQHc+mU/cBR8NCLp+kKOtL/nR9IN4A==
Date: Fri, 12 Jun 2026 12:16:07 +0000
Message-ID: <20260612121516.1634-9-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|PASP264MB7012:EE_
x-ms-office365-filtering-correlation-id: de737290-e8df-457e-faca-08dec87c6210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: hyqeWSv50fenHq0m8IlJQ6rUrLljWlz6bgUmnjLw5JJGZNXMMQHO3uIrr276ES/ctjsn6E5zcWFcht2Ena9M3heLR6Wzz2gs7G64OUlmvbxOk+3S5kVd4Mv9Jtpl2/5JNubYzpJ0xji9bTQh6fi7BPVjfM00tdAeBQxGLhVpIFpPtT/8GmuPVfDAEZgykfsScW0vaxllyXxWmzm/2nLegbTRX3j8W4uxNM1we/WWCPESbwzfzb3V68OB4PtYMKrIDVqzMNk/XEr5vQjAhiApmGuflwNSBinOT1Xcr0QDXTNa5hO2Sc/Ke5eWmyz+OVtqqHW0EHm1RnUetrJpM2KCRzLhyas6iCtrbV49Z9AfaEJD5LZ4Oz+dpDng6p+ZD3nUlc1sowbUtzDsQlMq7h0annmUXEeB70zh9e7+aZxBC4IQ9oMrCLWIK25KmqiUSrEp/g+7N8YJfQWeupG1d1rJSCZCmVDs4ApQdClHvmzM6fZaKWX1LOcXob6pab6JHWq0DBwi77iV14bOPCiPkec8nHepkhW0lKko8gLVsV4l3SCYMA8txzVy8h2B42piY8nZa/Fkt7PghaUUEfPkRXGlmqQLzQWfgVjv4YXEHvZuLINQohs47ad6rm+ywHthHqktdpFDUTJz1zT01lvo0KfQi7QPEMV9ZYwtecUB4jF0rYAEgq1Jo3V2tJ3hs4YXiLtcN4zWkuvxoM/kL0vJamuhHbByioAxT3OtLdXI/qUlqr05eKdrKztkUbm9x3rvqtCg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?C2bq5ZlhmaB8IrYFAZI2SRacFuywvOhE+MVuAp03Wj2mpRCUE/rVmvQWS/?=
 =?iso-8859-1?Q?UlHlr0zcDXgzhTGKWHaQrU+YwaONuCx1IjUe81f8lIMJ2QGJLRAjdDBHbe?=
 =?iso-8859-1?Q?Bwk5x66Bx/zi6cMCNgI1eF9ckgyXqsJNcT383zbBmuS6EKb5xvnuK+HjB1?=
 =?iso-8859-1?Q?E0/TWrixTlkEbC6d6qaVJ4g0UbfOKO1kpXQ6xdKR3li42Q3xZ8RmjZfQ8w?=
 =?iso-8859-1?Q?+HU27htTVBEZSN0yB8qJ+WpzzaDp0NzS6k1lr9k9hIRv1ju4DUtNJk9bv8?=
 =?iso-8859-1?Q?UbzG//Astjm4HRYzMXe3bPljhvANkRnpguDb2Mdb+awKXCfQaEa8W9NOAv?=
 =?iso-8859-1?Q?gzt1FLSjuVIA+q3+rPxf2608Yv7H6lJv7sTV3m0RoMPtB7tS1Yr23OlFcw?=
 =?iso-8859-1?Q?wuWc+/iHGT8Ct9Z5DvT92XVsfbNRwCqoyLiz7Y/cB2dtvz1mhTi9z74yn0?=
 =?iso-8859-1?Q?+U9k10n+WUli20smW/Gictp9q6VjzM9he3ZhQ9D6ji8x0sdSXRtrmb4EyC?=
 =?iso-8859-1?Q?NxDkBaKJYKqv5N3f5eDJzsWqr/6g6Q8ZYbdqGjA5DFnLO6a91rghTrD3pg?=
 =?iso-8859-1?Q?BHr4BaW7WIcbV8OBbwzH8LQN+gSaQhcg0z0UFM6hFRL1wD8yzSG77JxotC?=
 =?iso-8859-1?Q?kIJuHNFuZk1iTe8BGZwSvvDedwvRqjlN1r3rvIfm+lkdATXtNEo+mtSO/P?=
 =?iso-8859-1?Q?gveG3oktcGvaLz2HNXkzrl5XOh6A+Xa73LjvZowDceBqtFwcYpCBn5u1Ve?=
 =?iso-8859-1?Q?IqZUBrfCypYn3dIlyW7Ecfp2GG/pX7RbwHFfM/LbMsTeeheYuCzv/vfNIP?=
 =?iso-8859-1?Q?ObOrOu6r8/dfFWgIxe8ETr8E8tKRx9eKjfXNWB+Bntnkk9OaRogOia9djg?=
 =?iso-8859-1?Q?1YsACfym0NV/IFfEDDrFbS3bOuL0pbn37Cf0zMkQSHdnenKq4ly84dtpw9?=
 =?iso-8859-1?Q?rBeQdIAFKIiqFnDzFq5X4DOUUwSfzxY3ZsnbP45HgXLgJokj0Tdkbmk4co?=
 =?iso-8859-1?Q?37d3tj2jHl3t2F9XJ7x//0cy7Q+JMymVc9LGFuK+SoazqgyjNO1RCXoTf7?=
 =?iso-8859-1?Q?GRC6xg6qqOvsIjjfj3rWGzqEelFGHsdoug2k3WKN8ifWLBkqUFwaVcw/Ya?=
 =?iso-8859-1?Q?F6BjX1yBbjJf/6eXttW4Czv3f/SOKpo8qQqBVNKvh6wUGXUryTb5JWlc0x?=
 =?iso-8859-1?Q?ZVNa7tbi5Fhkl8DxCU49uA6oMbpYWPc0MfiQ7cieBK+LDwAyxlQTFEpRmy?=
 =?iso-8859-1?Q?fzMCi50MGc6PO5T0LyE4XWklnKn6t9R6G4e1HI3gxqTNXkyosZScuwjSxy?=
 =?iso-8859-1?Q?UFNlzuIZ9ERwYivCgvked/fw9pnP6e0k3l5T7DX3XZcPIzgWNfiknk0Bre?=
 =?iso-8859-1?Q?2NfDOL/emZETo0HWp/smrPer8XH2/+JO9StU1yKvBmtINhje3Q00ZXlHsz?=
 =?iso-8859-1?Q?kfp8U95XOK0bDfat4YWwF10sjrVlifpyo+k9XQwF+ngHjQ0noL5Pj6awxv?=
 =?iso-8859-1?Q?SyGtr2ziJfzxGeSKula++QyxOXObN6OFfHotyJ8j2/5gq3E8KljFRmcFDj?=
 =?iso-8859-1?Q?s125zIkAPwuceYLSzILn3j6Okl5V7C76qe13FQ01pa9EDvfFPcOz/J/259?=
 =?iso-8859-1?Q?nsy0CynUTxMeeKaNaWN2q0iJ4HFfpXaqgbm/9F/DoyDgg5Ig64OemLZoCO?=
 =?iso-8859-1?Q?KvHeg7A8st56gD+ubpfnxVhBkYXMTZ82ZmAcGqfJyPb0d2ibAzlzIXbT9C?=
 =?iso-8859-1?Q?DQi3ioXPp86b91U4Zxib+/CznFoc/x6dVASOcbSW3YqFkMg60CE+pmUY+2?=
 =?iso-8859-1?Q?p5YNFl4DCBFraMv2umezcdvSkBrb2Cg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de737290-e8df-457e-faca-08dec87c6210
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:07.9855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRMQ8rtuBUyoVFFq6ddc1ZWLXSEfUoksbppgbXUlgpmEu+TfgswgVtKd+3ljOWIfm6Pkbvz0IqSKMbmBrCyspp+XWrdf+VMvzGAmH4bpZL6SWHJL+tX2rKvukdlilP8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB7012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCV+20WMcH/CggFPTCCJ8NAWYCqmqyEb9vxH4O66l54=;
 b=KFoMpV//AGin6Q/aXv8eCiDJtwitjjEI20mHE3/AGzVm94Dfn4a9bh8XUuA5zzz93iQMwIYucV9xH3BKKNSffVUi9VXMcB5qDxrxVPPBoXcsVC9NCn1uLuJ5WJQRM5pVtZzQdwP6bxfN7Kk1pfgk8JR3oehZRDZW9UhCG8i9scc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=KFoMpV//
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 08/11] package/qt6/qt6declarative: add CPE
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
 package/qt6/qt6declarative/qt6declarative.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index edec67649f..a21aaa62f6 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -8,7 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
 QT6DECLARATIVE_SITE = $(QT6_SITE)
 QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
 QT6DECLARATIVE_INSTALL_STAGING = YES
-
+QT6DECLARATIVE_CPE_ID_VENDOR = qt
+QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
 QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 
 QT6DECLARATIVE_CMAKE_BACKEND = ninja
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
