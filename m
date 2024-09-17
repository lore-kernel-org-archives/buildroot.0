Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDA6C35FF4
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 08:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9994540231;
	Tue, 17 Sep 2024 08:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIG_2Bg_XTDs; Tue, 17 Sep 2024 08:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 271F240236
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 271F240236;
	Tue, 17 Sep 2024 08:35:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6B61BF276
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8667F41E53
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3UWNS5VEtIZ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 08:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=983e09248=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F4A241E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4A241E17
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F4A241E17
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 08:35:24 +0000 (UTC)
X-CSE-ConnectionGUID: xUCpxnRVRouFVzum2ymYeg==
X-CSE-MsgGUID: isckXT+7SPK0yurj/mzIBw==
X-IronPort-AV: E=Sophos;i="6.10,235,1719849600"; d="scan'208";a="26224476"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2024 16:35:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6251u07MCzcK2OHKJBq+L6xMhGWxYjOsPJXLioTBy+UrbKxTkmzKCLZF5h1b8PtfovEakGVwunGDFuSRl3GYVB0oxCZN/PgtRflzhmOGU5WsCM5/qeOjPpbbmAkK8F+V2mS2C/UYw4uoLuBDPrw/K4XdoUCH+z2m+Uk/q/Mv7Hqj/SsyB4fU5xJ/iNa0hof//LF9GFxVcKQ+ZsE3Rsx0QQzZde3DpiAFBskyyVkHyVzk4HKWP1i5LF/P4OqhIHW+LslvwOjhB1GWwbJGlbuCBlgO7CiIBeZjBPB5KQG41sQYnrDNCyE7uZYd3rL3epZUueIiOIlzdKcUKkjMCsQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prEepr3NKX4HxhEDkpLM11+MnjeZvCe3AwEtL/zXhOY=;
 b=GEyPnYNkspZqU2hwcdt/LcOb0qwB25FSr2KZUA2TtbjNBM/fHfEYE4TI0SYq48m0jfeWJ+s0eDLjqp8d/peOmMiwRAbsnZ+iSymkk1Py1graCzkDTylrhi8eCICskZQyPLjbuTGbhtm390EvFevPh/nfImWUwdGyv91w7dpkDqBLmaLcLSnc788HLAbBCtS9BGOL57b1JXK4ExGIePV0i9J3N+0gijhueIMVqrOq7iD5JiQtEnE+b9v/7wO3Fgb2X9dfea9nOZqvKZsAvcavy3MKJ+jg+9UXH3iaFtOQ9yoK0KvAVicco0hsmE3gZxfimKK5GneMIeKi2ShVN5H8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY1PR04MB8606.namprd04.prod.outlook.com (2603:10b6:a03:52d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 08:35:17 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 08:35:17 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
Thread-Index: AQHbAuUc1CB3U8OPVUq64u+ENUXuQbJXwU4AgAPx8gA=
Date: Tue, 17 Sep 2024 08:35:16 +0000
Message-ID: <Zuk_RMVJAzqVO5s8@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf>
In-Reply-To: <20240914222032.3fee5e2e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY1PR04MB8606:EE_
x-ms-office365-filtering-correlation-id: 90e86a43-e0a9-4680-1c6d-08dcd6f3a862
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dYWS3H0ju3V7UfLDmhGLztFCXMkASbo556t0AMrHxfp3R76aJ+F1uyk5vCc9?=
 =?us-ascii?Q?K/LX4jP8QStGsOZspQ+EhOlivRo8S6q4XDxJhYM8t5i8VJHuO5blALGm67Lx?=
 =?us-ascii?Q?jCynMf1XD1cAJA8KRsINfFEFobCrrKq8oMus7vDaB9N4/syWknplO/p7jHn8?=
 =?us-ascii?Q?XheQPToXix/tDhbI4u1M+fnIsAyud+QbPdFvcM/gV/LRSI8vF5ZOqdKYDLth?=
 =?us-ascii?Q?cOgHZzBDyhe+WAjZ6jNb4BSfLpu33zVea7HwvF6JfxnN40oaDYgRdLSfL+P3?=
 =?us-ascii?Q?rC0TLRQGVXXRzHHEys8n40nzp0yQKJD7C0LrRHZfXviIyUYks5SB5Ry/DsNE?=
 =?us-ascii?Q?vf50pNqTQormOpRq9bcORfmaDUIpnHwXqVysc1aDAamV7D8/lVqsZRvoht5z?=
 =?us-ascii?Q?0s+wSiYi1yQs/nL7TMQujDRFvydXIelnAgwTwoi4uL6xYATG/DBGGfmI3uJc?=
 =?us-ascii?Q?fgbkWMCVJyWbB4ybiAvmdn6kw/Iu6ztcUmrXmPD9jUJ0ZAwku9haQh0CL9WU?=
 =?us-ascii?Q?W8W1JrcNPbr1sQGstAigno6RF44rcN2rwRY7Gi2XfMLPl3y5VcTU7cucZ/vH?=
 =?us-ascii?Q?eHTGQQ9GwltxM4L4qx+oUViA+r1iUVxrHIk217dhSLHHpw0ykSNKPpirNOcu?=
 =?us-ascii?Q?BMkYDqO8UiKP2+m695osApULFw1M+vPL22fIyypUMBLOqoIa07J89wkBDoDz?=
 =?us-ascii?Q?xHNu/nqmd6jxLQ79y3iDfKTWtlDSAEXCWUZptniJlGizOUgHs9mE6xlbSi3m?=
 =?us-ascii?Q?aP7JDI3M5s6LXlqwdxipeV3OPmyFgN8xk+w4dm7pGGEgVlxRggfGYh2dCv2r?=
 =?us-ascii?Q?xoBnwb5XoBCrR0uGAa9ywAGItmcTqDCn3zprlQc/TGETD2EPYJrLo6Kcr+aR?=
 =?us-ascii?Q?ba1Fw9aIfVUaE4ogVjPhFnMeBoRGBr73SsK/+iVBNPHmrEW8eTqYi5QCVNIo?=
 =?us-ascii?Q?HI0KJgT4JFsJUrY/8xbYSgL7TZ64OP+AfH5fVQ8+CCWG3z85gVoXN5uG3zLG?=
 =?us-ascii?Q?pjY4q40pPNwKKQAyT/UAOf3LkfLfH5js5ruaImiHGeMvShvfA0p/aq2bkO2H?=
 =?us-ascii?Q?yikQzIDGqRc+6d+px0y8QTofx01C6ncybRfPXwwqV6pZ9xHgz68qdibbN4PJ?=
 =?us-ascii?Q?+jMrMMGmPYzObX358Q4APx6Zc7NMauJirGxk7keN9wyr1QruxO+sZ7yJii35?=
 =?us-ascii?Q?RR1/W58W+mhGjSsCuKx0lQxEMPInzI5oCLB+f/ez7EGGSH9hAMiTqEMYIvZ/?=
 =?us-ascii?Q?H+9U7k4Wy93614IDyvykDo0ZnuyacpUTNh4hWW4aBcc11mMPP4acYE3EOJgx?=
 =?us-ascii?Q?BJDRYzHyffayjvBhXmIpXbzyoMgXvO02ABU29EW7vYxc+u2k7jKmqcOVdooz?=
 =?us-ascii?Q?RsAl/QFZxkz7obtOxa73cSaA/sIU6w5z24Sy9fJes3/VE9RaxA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qGJqhJfek/XgFfcbObzEBjJAynkWhNU48J8SIgrE1ujdHwYEcuq/OgWKMZOg?=
 =?us-ascii?Q?mQrhNO7zJ9KLMTLh63YRzmJRP44jKKgSb16ExtJ6pObGpBtouUQNshKRwo6e?=
 =?us-ascii?Q?c+8CObUeWUPcbOlRJJQ8vbZhCCTTnsHyZyth3tfSX1HUvJ3tYdpNBsGthzm6?=
 =?us-ascii?Q?mhyKSMc07OmoxmOWBQr/k1DEabeaz3TDkw2nIi+iaQj+ktYpqvq0sCKr9x43?=
 =?us-ascii?Q?AE9cFbyRus9Q9xPM/7j7CN+lbuLdN/zPZRih/j+gLoJCc918MAn5qvoWu8Y/?=
 =?us-ascii?Q?SY+lMhpIFiCp/TvGm/YOnVSCWVFBgBa9nrL+DxlUdP18T1X+Maoirndm5FFG?=
 =?us-ascii?Q?XlRg8ckytD9moFReFM0gzox2dhtfug7TrBFQ1cxCzJs3C6zWnIsQSjlO0ja7?=
 =?us-ascii?Q?uEZvNSrj+jWnSS2iH+lKdYP9mVVcJdYl/ruXvJh+a+mqYdk4Fduj5U/n/HZn?=
 =?us-ascii?Q?xc1qtZSeV0U+gp5SbF9dMaChJuwICjixlmbNYfZNuo/hNFTOPTfipGgGVn5E?=
 =?us-ascii?Q?wXBQfXIVWYK9wW7IqYWs2vEfi4OTo2vEggSpeiQNzvWolLteKTHSeibPz8uN?=
 =?us-ascii?Q?p41urVsIHiVb6qUW21qZxglNtGAqXmljEd/ddFq7fiR6NkCzDuvN/LDqc4b3?=
 =?us-ascii?Q?To5yK/UxNgMe79nniojDZmfPuy5TWQCjiGcj3TtarWmv8YJ/GI2pLVFxP9FF?=
 =?us-ascii?Q?G4Lu+gZpAwqu60DwqXZlvOvpL++6cqbbSNmix1AXx7gbdvWu+F2WsYh4lAk+?=
 =?us-ascii?Q?56+0cNR/ZI9QvGxfutkpqct9Wr86fuR+2jaibfIlNVxBCDkjXfqyww+YGU8V?=
 =?us-ascii?Q?9xzNiawmSQs/CaZ80seKNnDuK/TORJJtcW7jKtR/IJ6FZeZbchHwmkO7Zege?=
 =?us-ascii?Q?tXW1w9EsZ9qDJhzQKjaZXV9O6CqM4aPOd1D7Hwqi6TReYPqhjH90wKXJlp4X?=
 =?us-ascii?Q?ZzXFYhk8XJjL6HbJibgjATUjbExX6FSIwQFCQF/Ya77fD6uPqq0/j0gp90v1?=
 =?us-ascii?Q?EoDigDGdC+9kL+Dh2SqXwVrjO1W5gG8Leh/fRpiS+KBDUyXz1YtVe18YktoH?=
 =?us-ascii?Q?kAh+4bIym5RQQNhrx1w7Lu6tgSR/FPfuL60aVxLkJzGvQNnL+QpQzDvHaVEy?=
 =?us-ascii?Q?+uWPdbKg1dTM+CtPFiQt6Wxf2SmieRV6bhAZLW0clC9O1jUh1fVPkPOeTjUE?=
 =?us-ascii?Q?Q/RkvV1SsFbxNX8wQGqS9XpWUn3/9r8mE4x4jiVLGn+Y3mZo97KNQt4BOe6L?=
 =?us-ascii?Q?J6Q+2NOd5SRIlOCxr2y1DuSZFjRomWYTnCh67cjz+x6eNFemOI4scuBVRM4k?=
 =?us-ascii?Q?9bntkg3p1wbEXJR3z0t+5ZBrYYuylsz07vmPzz6bTdc85+9QC95lH5Wqs5Yh?=
 =?us-ascii?Q?tP4cC4b+Em2GFcxvXD87U2W48m+ZRkLfDIiVI1sije9MQbe8cJtWrnhnzqkJ?=
 =?us-ascii?Q?JfAcUGcd52c8OFZykpzB2g2Mosd7RBUcxGrLa2ro314CmKn1NojmemaiXYKm?=
 =?us-ascii?Q?U9qw/R7/3UqNXNjtdeiXDfS0SCUSjvRJult3eRUKmEQG8b0znIpt7Bf8/For?=
 =?us-ascii?Q?zRYli43spoV59hsRqdrI8/BCpvrWpNcZwHe8+Y0ABv5ReGLdZLOPk57Jk8k4?=
 =?us-ascii?Q?aw=3D=3D?=
Content-ID: <F5440673EFE6144CBF4458A40648278A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UBr9AsmuGFZp7b8Ic/2bubvHtOCFE+LjZowF/1yS2h0iUPKI38FXfZSwvLFJmHYuW0bhzBaVt8JddiJ1Xa24yPTfTKRutM7fIhtD+EpTiSPaA5IuyLH+SwE6Hy/XPEFzsclbKPkMq6P66thMgApyR8BMMybFXxurKvwVVOa2+JTWP84uJsNrgDg4FWhO9rjIYDaGqs2gCzt/+81c0wauPdf52CTvsxv1CrszBv/1px4nG5HETYJ60spaHq1mrM9iZ6MbDCgWysRmEtKuB/zWbEc9ksWTT/yQdAMxiewz8XF2Df40/MEksAgRA2GEFx8cdBDKESDHNgMHAyGfwb2rmBP2f1/KcDfxLRCC1Hd0yqN9hXUnQSqvmmA0DLHSwnTtemDfWjZCGfDe4KmdDbGd2HL8Z0eVIKDxRZzd8iLTFIaweCehE14SYvT/g5F3iDCtXk8uBcZe55EMoat/b7lOl5Qaw+CBErs7v/FY8TT68hzrSqzDGJXbysaAkorjELKkRyK4TlQQJLBponjDlX0bz6TEF5kbak50PFV/DvsURxD/r4y6ynO1i3rv9jwc/dTkZ7+tAZnqxh0op6gm8pet6qNVubXZM+rm9zQ2KkaXpB1fXI23wzfRqZKo/vFqvhn2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e86a43-e0a9-4680-1c6d-08dcd6f3a862
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 08:35:16.9762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: giaPPLzj4B07+9PW7+gDsmpA45E9v5euF4bdh83NxABBACFPawBrVF0WAhWRIulHC8ahs3UuIjVBJfKzDrDYlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB8606
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1726562125; x=1758098125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=9P90agL2WgBuGoXch2xGzYW+LQswwqI/shd735LdhCs=;
 b=pfw6oEIbsgtQaSc5ySX/pdBUTEpi8mb6vVok8zpY7wSAyVp8Qshokdds
 tagf90VLsX//WA0lkc01up8Qn5leudZ98r8gfNNpZAAQAKBa1OJkNAaO4
 olMcV04unvbmfSYQ2IbMR5wvVVDXvymB1OVoYXOHAh7gcYtTwAilbKMaW
 aTYmVfsz9CxfylX22terNU0GF3JjFt4GwQZicKs5c525Cyass1kfNHbDw
 9uJk+7TLtWAzdfjjmZZABObFn3ivmTXIls0HnP5QJ4AKFmNY0TlbqOqgL
 psFDlBsTcQ/Odr58hgiiv8ouxAd9giwD/1w/y3u0bU6kvRHjxzMDR4yly
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prEepr3NKX4HxhEDkpLM11+MnjeZvCe3AwEtL/zXhOY=;
 b=MkGCUUUd2WDjBc2qETcIm82k3QWXV9GrTyPmYLdgb655PRjxb+L5ITyAVs6aKSgL0HgRvFpBv5Yi/e8pk8ZjeryZfMTGLqS9tBN1k38ShhpSCARBkJLeBZxEurbaRFeL/vV290uKFipM5wjPiaQ4IkOgMXrBwzStmc7jvJDDH78=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=pfw6oEIb; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=MkGCUUUd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 14, 2024 at 10:20:32PM +0200, Thomas Petazzoni wrote:
> > diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
> > index 43bb65bdd9..cd6c4e2dd4 100644
> > --- a/board/radxa/rock5b/genimage.cfg
> > +++ b/board/radxa/rock5b/genimage.cfg
> > @@ -9,6 +9,14 @@ image sdcard.img {
> >  		in-partition-table = "false"
> >  		image = "u-boot-rockchip.bin"
> >  		offset = 32K
> > +		size = 16352K # 16MB - 32KB
> 
> I believe this size parameter is not really useful. Indeed, the next
> partition has offset = 16 MB, so if the image in the previous partition
> is too large, genimage will complain.

You are right, genimage appears to still be able to figure this out and
give an error. Will remove in v2.


> 
> And in fact, I believe we don't care about the offset of the env
> partition, see below.
> 
> > diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> > index b88d8c5da3..50f58d379d 100644
> > --- a/configs/rock5b_defconfig
> > +++ b/configs/rock5b_defconfig
> > @@ -15,6 +15,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> >  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
> > +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
> > +BR2_TARGET_UBOOT_INITIAL_ENV=y
> >  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> >  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> >  BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> > @@ -46,6 +48,10 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
> >  BR2_PACKAGE_HOST_DTC=y
> >  BR2_PACKAGE_HOST_GENIMAGE=y
> >  BR2_PACKAGE_HOST_MTOOLS=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="output/target/etc/u-boot-initial-env"
> 
> This won't work because the output directory is not always output/. But
> I believe this is useless, because you're creating an image of what is
> the default environment. So basically, you should instead not create an
> environment image at all: just tell U-Boot that the environment is at
> offset XYZ (or even better, in partition X). The environment partition
> will contain nothing or garbage, so at the first boot, U-Boot will use
> its built-in environment itself, and at the first "saveenv", it will
> save the environment to the designated partition.

Well, what happens if you simply point to an offset or partition that is
empty, is that uboot will see an empty environment, so it will see bootcmd
as empty, so it will just enter the uboot command prompt without booting
anything at all.

Sure, if you have serial console connected, you can just type:
env default -f -a; saveenv; run bootcmd
but not everyone has a serial console connected, so not booting
anything by default seems like a major regression.

I do however have a uboot script that will check if the env is empty,
and if so, write the default env and run bootcmd.
(So it will simply write the environment on first boot, otherwise
it will just run bootcmd.)

I thought that solution was a bit more hacky, but at least it will not
require us using a source file in "output/" (which apparently can also
have a different name than "output/").

I will submit v2 using this solution so that you can have a look.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
