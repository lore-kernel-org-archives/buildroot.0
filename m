Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8FC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 10:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3576082F8A;
	Tue, 18 Feb 2025 10:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsrK7UtTiCsA; Tue, 18 Feb 2025 10:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB0B82F8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB0B82F8B;
	Tue, 18 Feb 2025 10:48:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B3DC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9292F6059E
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekU4U_Uokwsv for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 10:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=137393274=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADE0D6073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE0D6073F
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADE0D6073F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:48:20 +0000 (UTC)
X-CSE-ConnectionGUID: Tayi5mlXTGeW6fR/489qiA==
X-CSE-MsgGUID: w2NGI8c0ScO6xL34sHvfJA==
X-IronPort-AV: E=Sophos;i="6.13,295,1732550400"; d="scan'208";a="40014550"
Received: from mail-westusazlp17013076.outbound.protection.outlook.com (HELO
 SJ2PR03CU002.outbound.protection.outlook.com) ([40.93.1.76])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2025 18:48:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tf6ds4N0SUcHkoj06lpJkAOZv5Mgldk/2CjO346zhLRXVgw64tLhQ/2FONBMyRWzVUQONoKzBQkrHeEZR7m5VtV6aewqTUIyV8Ryk/dIQpYmoUICwyhU5jse6/1jmbyafs8+7OqW/3/2+kopuzbRxA8M6UgVSn/E3+5eZPTkYzq96iPhRLG/jOUtqBdjP+qfL7UD6aREVoAhIugFOKBvzzjieVj//JRR19nuMTiCI0o12h54R9/goBSrBLkK4nO6XPxpC4kNT/SdPW40I44HKpFFKxQCKToxPjKc/oZZDB8GunrkFJkwWca3vfomRcPPL0uWrz5LU5HwiVjl1XGxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4ROJ52D1NYDryUhw6b+uGALuoXuc2dOI27seRbkN+U=;
 b=BUAk84F1tKey6gTqhaCkc/U8x9TJyrayrQpZeXbb4cwCJfQ4796a6gr1bsDKKtXy9NMF0GttE8ZhRrMMw5gTSTR261RGK/wCV9OS+YpkbBnsjM39ZWs1rafIljJhCWRFCyGGCpHuwUgaYpB9M2mO131E4D6+LzQpuxoaoykZgtbFPYre2aG1WTVZ+70ANGlyjt0TScdtALgTm4pzhd6nZObz5nIPS87WS/JBVV1GUwkDqzdq6bul9c8d4ONCEOu8oXoK8SCrMBKYxZrrjtlHAOHgHtGjHbQMT4oez2OwxhDhZzDvbu22V9MhTYc2a/dKI0UhpOADoU01zDezv6kQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB7247.namprd04.prod.outlook.com (2603:10b6:a03:29e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 18 Feb
 2025 10:48:17 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 10:48:17 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Yann E .
 MORIN" <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH 2/2] package/linux-tools: selftests: Add path containing
 BPF binary to _BIN_ARCH_EXCLUDE
Thread-Index: AQHbgfKeXGXHHFuhvUaLgtfbrLA52w==
Date: Tue, 18 Feb 2025 10:48:17 +0000
Message-ID: <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.48.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB7247:EE_
x-ms-office365-filtering-correlation-id: 2ec030a3-1cbb-4c30-fed6-08dd5009c0a2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/QSj1nu0nJN6dCPl2NAS/2UT5iY3sDEkSUDp7K1UjPS2zw2dBt8mBpo6Q1?=
 =?iso-8859-1?Q?9d1GKNKa+oLRRbDPJbGjPAuawppnmwyVGDZl3Hjk6/uQk8iZWz/X9f67sk?=
 =?iso-8859-1?Q?nz3pVX6eejJAg5JeFt8kzdt9QRKZWmZ+rfhOFiuv46/SSw/xJvZr2MJeuG?=
 =?iso-8859-1?Q?96AsOdpjrmirR4+Vr2GYNxn3dtupJEHSWav373W3w0JUV9xUPovutfvqvA?=
 =?iso-8859-1?Q?YHXFLur2kyk7k4atfmImFeZX5j9KQ+Sb74QlizA2E70xjZGHpTeCfPb8th?=
 =?iso-8859-1?Q?LQHn7bqWEEdGmbeTNYWPA3JGrSDfnoNWKGXFf+RsdfLPVbORnoZTi8lui+?=
 =?iso-8859-1?Q?kWQS9LKhvTcKNKeena/zoF8+AMMoqFAFGtSLPcrOdsSitCBH+qp1XmvV0t?=
 =?iso-8859-1?Q?NMnMblJas0M4aAx7205Ku9vPfa5t7iOdoznoXd5LecANgm7ywJHIpbT75s?=
 =?iso-8859-1?Q?Wuo0kS4GPnbRXzpMDuQ71vUMrNNCuaVgldBnBgWMHvW9ZQolj+FhSU4ue1?=
 =?iso-8859-1?Q?/e75weNsvIiC2Rgb30koxvxQt5ZQnH0K2mtXqyxLoQc8lfwuxH2qsnR2we?=
 =?iso-8859-1?Q?XYRKVJG6Oc0Qqa2k8ksHrl48eCQMJxayaTPuO2hUZa6yNUpVgA89v83Hzb?=
 =?iso-8859-1?Q?zc/f35RPOMtgsEs/y4mxhoesOZXDQbysWU9KyvG6Z5AMK//Zv2pPubjXND?=
 =?iso-8859-1?Q?j7iTYpMi+3tc7KYC3cM4kNuGLR/3ZndotMU+bjVWl79lHT7rB89V25D7Yl?=
 =?iso-8859-1?Q?y4XvzNYUNZd6LMX6Hc4JUTXyhHD8sJrNGOaXMRW6tR60YPrcT+PHc8P3Xv?=
 =?iso-8859-1?Q?E1y5NtGxNuYmNEPkfD3ZxMY9PNC58XFrtF3eh9A2JXZ+z2HOmX0lQhQyIZ?=
 =?iso-8859-1?Q?VXxasMei1JAHxKQQPoETt2Zg5Jj5vZCLmpmO16fj+2t1fxOSuuDELk+gCE?=
 =?iso-8859-1?Q?vqlQwaOgc1gRWI0wwaDpB3afEOzZ6XtTl9oE+ZVH3RG/hTI0RRNJplibRP?=
 =?iso-8859-1?Q?l7WC+MCE5csnv2dSSbTh02Gsu1xJVGyTIDrbDQBCJGTFdWW+Ni5Mj68YZq?=
 =?iso-8859-1?Q?NSaiuw/QLCwhp4/46nnvNwtUTX2EWD9Sf587uUBHoEQw/TIaK/sEGMmm+x?=
 =?iso-8859-1?Q?x+/nYI/7rdTIZB6lpNt9f2i8y1STS8hdYK44cK79P7X/j2YES+/XKi4LPG?=
 =?iso-8859-1?Q?KZZG+9d1HGQINFLhfi8DncjTBe0LemDpXlb1yiVUAx6JH2kX/zKfvi7+xb?=
 =?iso-8859-1?Q?94YhAL9MnYQFmN0ER4RgofEo+ZFbpdz9q2TRfLfbBy9feSSx1MCHQ7T3gM?=
 =?iso-8859-1?Q?lqQTgdGRLangLMNaK5uaN8BYiCaazl/5dXeczml/doSgC61HFPG29/d4ND?=
 =?iso-8859-1?Q?A9hM880u67Z63YOsOxLsI/Ek6fXGmFN6yErv5ttI71JqIbIz8gOb1hdQI6?=
 =?iso-8859-1?Q?BP2rYPvXu3vGdwQZgKdKl+5bXyyhUbJFGIn5BfdMqX79RcfhHwq5XBHLsz?=
 =?iso-8859-1?Q?KVnIARVmisG09BQ/bD2L+HMbOPLJY7NQBSEYAwNZW+NA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mUn/mfLiDFy8FrmvQMSQC8tFQxrdfjn3Zg1FUSbD+bULQ9aB/bsiaBDcXn?=
 =?iso-8859-1?Q?s0mHHwLXPz+LuSZUbAK+XFm+NbJu32TsF3sYzjGtwP96Cf6cD6mhtTNU8J?=
 =?iso-8859-1?Q?9GViMcwwH0uTl6ydKyLvHr4FnVPEfSdQRzJVVPDoNO5sRzimPyUcHKG9yC?=
 =?iso-8859-1?Q?orJiSP6gI7yPfB28wxnBnEw3F7t+UgEeHjD1adlXjMTVRI9d3AKv90+FEu?=
 =?iso-8859-1?Q?wKlRPRhIC92LMZuWSu2bSFfE3/TFGsSLJjHRhOjQ3zho7c9Pmx4er1FeOy?=
 =?iso-8859-1?Q?/DlnIgIa7i6ysxjmb+eh8IXYunQ6xPVEW9uZCl/OCbM8JhSJXGPQ2JXk4f?=
 =?iso-8859-1?Q?g4Ys6l5p5URjcxDch39wdtcmOuVpaRKjeWOqp6NHNG6vzXHvF9hpIROtmj?=
 =?iso-8859-1?Q?/ZilPaxtpUOYYjxgD9f9q+lGB9y0fVEAI4IxsMypbNNaSYyMDbF2HPSW3p?=
 =?iso-8859-1?Q?/IT3j5PTz+m+EOn58JY6tlRmwRZKaElCFJiv42IoI+2JTuBraY4I7ZM/K5?=
 =?iso-8859-1?Q?ECXzu7B0zn1kRhkrMioxS/6xPGFdmu4qnMp1pjCQQiHg1X4AKVz1XtZe2N?=
 =?iso-8859-1?Q?HKtre0ch95C3AdEST9cqAKPFJRftMmwzopEfKQQWdQ6fINoU6YhCTCzwvJ?=
 =?iso-8859-1?Q?llq8LA1awDoHSBYQxSBREsn+ZQsi6ngs/VxSGeN3vxtMTvINad6XR02Ig1?=
 =?iso-8859-1?Q?C15QG5lu9S2hJBKDJ+0t8azyyVooMaOupJPYeyHmvtr9nyGLovwdRul8YV?=
 =?iso-8859-1?Q?azefCZbSjrS9DoTHrC0unTxytdTcU0cNLVvThBleDog94l+EaLo6j7RiP7?=
 =?iso-8859-1?Q?az1/ASmbakQr6FH3+frLk76oP1hddYZKxkqeB93NyidaXCUMPIXwByOLbH?=
 =?iso-8859-1?Q?OCCN0b+FOnX6nMEWHwC8Qey4d/ohWP8st4YkSd3SVDwnl9WTp4677GVayy?=
 =?iso-8859-1?Q?GQSlLJdcoOZoVqLXeIV5sLjkXbjTSwRjX/DknXcnSdWrVuLxNtkW7usK+y?=
 =?iso-8859-1?Q?srNKmbZPwHRG5dr33aOH7zw4kYbMXwLkkjeFBiUv7Xxs7T3v3ZxkzjHjf2?=
 =?iso-8859-1?Q?Tl8O4HzoIjIgo7GvGLJfYoQSBIs+7MR7l8nB4cO9rTI6G4wvv6/swAgl6r?=
 =?iso-8859-1?Q?DNVXo8NxRMY7LerUf66Okz5r4jxEF23MSoqQEYW8KLRp8HNZeDHdk8IdAi?=
 =?iso-8859-1?Q?XY0dYdg2uM+goi1cNdaagkfLE5rQFNy3P+0lSPrcRaFa/BgnTUxoJAH4O7?=
 =?iso-8859-1?Q?sf4gEE1fllglPvLMYmFF4pF4X7Az6WZVmC6SLYJBPni2nMopaA6aVxLgON?=
 =?iso-8859-1?Q?YgPtpEM9co7VrEw3GI+TNPjbacqpa51jnvXe1D98rMoqKsIzcCVNuE8Pq1?=
 =?iso-8859-1?Q?wpNBqxwE9ZUXwfM6PCNtE1ZI5vYg29ilqVo2AUqjKQZaZxkg9T6mT4VRyi?=
 =?iso-8859-1?Q?RHHHN0saHz5V2Gh2RdfAsIf4LYmVRdeybmxr43I3OUeL9OvSSsXHRx6D2o?=
 =?iso-8859-1?Q?kRapegDYGIcNbIaiei6hn/gVJ5QLQp8Hz3LIkPpNEli7bwfYaywl24D6n8?=
 =?iso-8859-1?Q?wDblBQygh22Rbl/l+avTQ75KEHoPzddZmrAbF9+1cvQw/KiXWhSoja7+e3?=
 =?iso-8859-1?Q?pmS0qJJI54WhTelmiI1a0LmZEeFXmfpI0/nkZmtAlSsy9B6gJ6YkD0BA?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IYFI8I4whdF7Pnaq7nT1uuvDwdAj0BPP4fwj/iA7Oa75L0QeuuVGqwQcWw/jG+XOQY3XVg/rf30tHdvXud1KnhDquT/RBoC/8IYzL3OFvnbWZsQaGyZxcnQrRKTMm3QInT7TAZAJkfSv5yzSXyig4Ut3nukxzgs9WkecNv7cfQmoSfaiVwf2owWNXxey1ZP8FsmhztGIzOV8dqZFr7wtuRulPXqkw0K1rFLRUPv4iMf/uwucLhx12uOGfpQhyLKEEAJM8KEZ0RFnM+o2WUrfDRbL6vsPwyCfJlizMP8F2cK9NzH5upBY//fasDAMfXTuDSN9DW+u4Z1nN3Ya8AR7kkibMNSzUfwdH/3iZTOzpTVS1iPI8jLsIikYDtQxgPfdY/BK3QvVli6+meiX8SfBaRLTq1qLFH6u8a1g/cVAbzfRMSu+rVUujMpvggyT/zovmUJkkxhXjk1SXZQoq65flB4RHY+ckdoGNuodcfPfBttZWpaD8acmC+WH7JVCB9F1iDlqynmNLxH5k7PWBu1bqRMBvCOhahtZGgdEI2lf7KGYMXOYP+Vavbui4LCFFkwTY1McK0eOmPZojNi9UPXl3erw/0mOBiM9O7ukRKoq+nZTTeE1M9tXW2fJmnK5rsxr
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec030a3-1cbb-4c30-fed6-08dd5009c0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 10:48:17.2800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlmGmgYK2cfR4/mrMZGNwA6iv/eMh0yjDkZZZ3rWle6xxSeAgadg+V+PT5+ngrNk6LH6wZXG0WxXwIPAVAffKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739875700; x=1771411700;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bBZi2iSTL0AbdQELmYrtZ6SnVjLRCyK3v6nHD/GqFP8=;
 b=kul1NrCcDknqUeAkXV1wJI6KiuQ72HNn4uMW31l3HHqf2ppkLdyRtMHA
 GdhG6F9j8CWYHKp7KLdOicBV2j6wCDPpqlxZeNt8lCzyQGsg66TB9ErvX
 WhFbtjdp2kM/TS2rNBqJdaSG8nZReu9GYtGvkPRu4eSYkqK9FOvL1Wk8i
 QaWFpACzs55EhpuDtfkKjKVcuRddiEuYcHEPTpLWoZayJmTDlGlfgDbTU
 SIdBPBjxnMlPek6jevjlTP4aZJ0s+XRWjfwDTmZEmXZ6yjGre+5kQj9zy
 0VB+KDDE+q7/Cs0GyKqvEi0NrDABLH+bKG5BSAZyCRduzD2rsjquOCoG5
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4ROJ52D1NYDryUhw6b+uGALuoXuc2dOI27seRbkN+U=;
 b=ciBV8eSNRw+9mkbKC5+h2WCPzBjq+Ve6l+nQeh6E0REbu+5k//TOdXAQNTqEtLdKTULsn7wahL1ZZ0KlMtHwgqUnXYjekQn5BkHmdohoRGpBFh7storE/e0bUIMMPnQdHndcWnRck12D4jxXNwHiJtl1ratvnG9esaEYhvR66JQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kul1NrCc; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=ciBV8eSN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: selftests: Add path
 containing BPF binary to _BIN_ARCH_EXCLUDE
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Enabling BR2_PACKAGE_LINUX_TOOLS_SELFTESTS (on rock5b_defconfig,
which uses kernel 6.12 at the time of writing), results in:

make[1]: Leaving directory '/br/output/build/linux-endpoint-test/tools/testing/selftests'
ERROR: architecture for "/usr/lib/kselftests/tc-testing/action-ebpf" is "Linux BPF", should be "AArch64"
make: *** [package/pkg-generic.mk:402: /br/output/build/linux-tools/.stamp_installed] Error 1

To solve this, add /usr/lib/kselftests/tc-testing/ to
LINUX_TOOLS_BIN_ARCH_EXCLUDE.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index 0bcc47af0a..db7e4fa1a3 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -26,6 +26,9 @@ SELFTESTS_MAKE_FLAGS = \
 	ARCH=$(SELFTESTS_ARCH) \
 	KHDR_DIR=$(LINUX_DIR)/usr/include
 
+LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
+	/usr/lib/kselftests/tc-testing/
+
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
 # not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
-- 
2.48.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
