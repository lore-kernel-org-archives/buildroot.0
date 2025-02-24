Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6B3C021B3
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 08:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C0D80C64;
	Mon, 24 Feb 2025 08:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4vnSyAW4vHr; Mon, 24 Feb 2025 08:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0709781098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0709781098;
	Mon, 24 Feb 2025 08:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E3C943
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FCBC4062B
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHQR1HXROWxH for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 08:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=143548ff4=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01A9D405F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A9D405F7
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01A9D405F7
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:14:25 +0000 (UTC)
X-CSE-ConnectionGUID: FW0Tpe2iQnuGtBgCA76lqg==
X-CSE-MsgGUID: L0WfUrGPS5aa4KbUALMIyQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732550400"; d="scan'208";a="40278887"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2025 16:14:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tP1JbqcU9ebW/342SV7mK9jg/r7GNh3K+94AwyD4lXureB5yJUs3fOeG9cgpV6tSjV/ut9+hvA2/Te+26y8zGr62O1pQd31om8HAbVIE2y7CBYh3nBoQTWM95PF7v9H6rMTYr3vSH/aB0BOSqJvkP8qO95qoyRX3d4OqhjczzbKxtcLNrp2CqRSNibCWuBQkMeGGYTUaHkDdNJa8+uNYnA0SRRJGfCjm8y75oT+0tjw/rIBXi3abMn9UitVXGu3ulQF2q3JTF69d0NTYYr0KFPYnljZiqqV7OShKqy4QfZoBg/gGZqGhG7f3DVXXpKcD8qy41mBNfHgj+0xx3uwwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ9jCWQJ+gbaY7OXPJaDrDDyODy6j+OffqZN8ZPYMG8=;
 b=QeYrcfXwVhdpFS92MM1BxBNhYq+O06OOef5zpP4hH2BM1LvPNkUAPrqwZvHsDeRwY2Hnn1uMRHUXbzuz9Emur3UbdUCtUgTXeWDTOgB3NWEbSNIllRkMaJVhtLjpuImcX06+CufJlCToqO4/rWy0tXQRvbFd7Y0EnSWlpSWQY/Gtm4hvyMUEp5KjEiN1HhGTNzCxe3ttGRmq2xX5WNPUcSVTEqki9ltRBaBo2G9djdXpSiWjcMZbkfq74Ds6xhywP31NxXSPybg0gNxTPB6bGcpoBlBU7shHdehB2KQsLqe76r5tnvPBovFpXg4zCT9z1OQ75+vDmkYHk8MacFaopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6358.namprd04.prod.outlook.com (2603:10b6:a03:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 08:14:16 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:14:15 +0000
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Yann E .
 MORIN" <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH 1/2] package/linux-tools: perf: Fix _BIN_ARCH_EXCLUDE
Thread-Index: AQHbgfKd+HnhM9TeK0CK3zJVMv5KAbNWJEeA
Date: Mon, 24 Feb 2025 08:14:15 +0000
Message-ID: <Z7wqVXa7q_fACzly@ryzen>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6358:EE_
x-ms-office365-filtering-correlation-id: 081db331-94cf-4491-36c4-08dd54ab3a82
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kViAIzSqi+qrt7yMvWpY4tn1fIJ+LXiLxsRwoGLg3GJ/w8qo2/dObeC79jGf?=
 =?us-ascii?Q?Me1b7Vte4qCwshWr98ohiy7tb3jQoKXTt5cP1hEjdd32f1JU9cf6GeUTFFiM?=
 =?us-ascii?Q?Wm6IXDHxQ+LfxTWo3dW4ORMzPk6OXVsouzssPjnExxsj8kdofpgIEwuC7ojU?=
 =?us-ascii?Q?5AwZeSPaoVHy4qCEhdZmT3loOMrfu+ogE4zRICkERENCWqsiygYXV4+CXJR5?=
 =?us-ascii?Q?HBQqlEoCB0nzC402YwC/B5JgTzFFiaeJKemCXu7RbYe06scD3iNYbxahqGJs?=
 =?us-ascii?Q?BnWT+/0s02RtRkGd4NiRp15EKINWgpiQGyh4sSzOQmP3qWt1if8PkqsuGuPE?=
 =?us-ascii?Q?sxU6Dh3euDObN9yE3Yl9/OlBpPVeba3iP4gUi/WZRwaqHobe70sMpXqerZBC?=
 =?us-ascii?Q?GIkNzIq5Qz0UqNpsNeC7cDv4eTquOL6eHeeIpUg48XKc+UA2GxdDyqdGH+Ys?=
 =?us-ascii?Q?3ohmtucj+9k8xjH3dClIgVM8wJy+WTKjmdDbvW3ro2EjEJTzsF/Fowesb00K?=
 =?us-ascii?Q?NUFS+mXd/QvWjc9yPhQbPNN76niu7TMIMftFbBJbMruCJLUqxGOCc2XkBhXh?=
 =?us-ascii?Q?IHKIzYNlxviQhDxhkGN3G4O2gQi9hrZMd2eALcXoijoaP96wa8mSxa+PrK9M?=
 =?us-ascii?Q?NAhswi8sgNXpA8drVqVsdMlFonnFw+azK7FknPQJWJSaSIKP2EpFLrGyL5IB?=
 =?us-ascii?Q?03w8H5eWBkKDFXtcKOMGtjBA0Vy/voiLH/hienUL3fY43Plq6QcN2Rn0DhWd?=
 =?us-ascii?Q?9CKsqKRtqOdjaM/cb3Z2Xm08L6Pw2X5H9b0B2r1mgyypM3ZllEmL9lAIVRnb?=
 =?us-ascii?Q?EMayd+9v0wLQm5GAZbjoEK9hdGnjq4WWZ5vAcvLCLt1pnpVFQk/79BQY4sy1?=
 =?us-ascii?Q?x3ApceDDnQenhR7xMuV2FGTDCLo2GVhfVWqtcbHdDoZbZ+3eX7keHomBx7eR?=
 =?us-ascii?Q?8o2nuDOQRL/egTAn3EHqs7vAEL8zo62pHnB7jk9eMQnjwcoLaOnb3Y0+aWDG?=
 =?us-ascii?Q?rwQCRTgKLCSRIAOdwilDWTFHte+yH4yzR/beBmnHIhb067X2J8bup6/cytzB?=
 =?us-ascii?Q?xvz22eOE76InZ2jSWqQrPnffhhpmEXb+a/SwDFlsSK/ZbpqFhZvoW5dF2M44?=
 =?us-ascii?Q?X9WDVW2libMh9Eg97aGCiMXng7HjN2XqT1B6u/8kWroxwtH7AejFvwODZ0G/?=
 =?us-ascii?Q?M2s/cd3gdOxFCVIhOBG01O4tnPvsBeaXs4K5JXDbWG19tcZtWoi/0PEbwWAh?=
 =?us-ascii?Q?6/qE/VRNw5Johy3IeAWLgZGTy6AikHXw3US0WiAE6Tx1IzlYEUIdqR15hI+R?=
 =?us-ascii?Q?oPmnxdanFFfLNSycX8xmbImUD6DZaqVQ3/zwu3ghajUqaYdaA2q7jmdq0wPI?=
 =?us-ascii?Q?qfqfs6NokKWJfiRvCogr/B23eim8qr2nVeMN9wq3GE6qrHJe/yB7owyP9Qbj?=
 =?us-ascii?Q?h+p/tgvvl2WYA6UPMHREysuoxQHqogSaN+YwCHcfcs1yxXDAH90Mlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6uL5t3Ks45bn7q90MXd3iwU/MqOrDafg8YlFF+vdSAK0lP3aBBHh/62vIbFt?=
 =?us-ascii?Q?L2S9nUo3Pl8A9atPBhasLuv/TENOkp8x9uPNICFCftfWmFT0nvm897eeKg1q?=
 =?us-ascii?Q?7IcdueXGiY63+XGR//kJOAGnqHTZcpp6c5KmzV6KXWs7rm04ASm5WAgWNER2?=
 =?us-ascii?Q?WvZ03CiZf4u7r7jvVMhvCDXIGvta7j0QsYE2aVZvzYkrf5UOiNoYVmxR3n9T?=
 =?us-ascii?Q?VXzmz6Y6SGHs/8bS/UTfhLrrMA3fqaRE1bTuVWD8LDm3rEl0VvegPOz60xAr?=
 =?us-ascii?Q?ctb5lKbdLSLpSUo4azFj+/hW74m0YUMrYzUDW3m0hkg9U7et6FgY1RpkALJB?=
 =?us-ascii?Q?DmF+Q3J3gRnMECu5ekAL4s/vwVhOWb26yP+kINUT1DpwOtUb0EXWLllw0eMs?=
 =?us-ascii?Q?EkF7lYXuhlcLpYOBtO0P3LMaaCsvaFcd5Jk56EOKoMffOje47lb7/79UxYQM?=
 =?us-ascii?Q?kdjF1IIcyFOXopGadu4JBl/Z2UMs9ptrhdlgJcxRGWEQ5fkGHr8z9MkMTS/E?=
 =?us-ascii?Q?RFqIt++wwdvfkW6EfY7TyE01a8Ij0VpdUCq6W6y/IPQqieORTGssArzYsd0A?=
 =?us-ascii?Q?+EW7YjtKAi+veRwh7LhAGlrDzqUalSVu01lDwpWHDoWc0DWH8PrY5tELTH2x?=
 =?us-ascii?Q?vpET6lFBBeN88jg9a2Pa8VbcLzOMUrM3C9yPW+rTE8rvkN8aa4K+pysXb2kz?=
 =?us-ascii?Q?mnahH3vuaaaE2I5Gc8GpLJh24bwNr0JLH/8dhIuT0D1FNllmn25komq0HDjx?=
 =?us-ascii?Q?nQVd6uGhM1ZvxqqP6dNrlEu9zn9RMs//9PtYjp34XSFyVOc9doX8WZ9K8XqC?=
 =?us-ascii?Q?rIrvy1/zLxh5/GukdZvToq1dDGa6sgUzCi0Ez+aPLCjUkg1T340niVRgLG5D?=
 =?us-ascii?Q?b/STT+KUIJZ2Tp2d/fybv5PjLGHddhonvR3lugrGarzKD6CEkt/TS3BmK6YX?=
 =?us-ascii?Q?ZmNmwN21CZI3zy8EyKHBJgDcbvvVpx8YFjpmoSClYRcJZNlAmwtp+UPjhTCm?=
 =?us-ascii?Q?BuLquB7tN1JKn3p5DStP3vdjHzOMdF0dfeFaywoOeJJtdNq8yZ94B1Myxil7?=
 =?us-ascii?Q?PecJetlW+BuLPcXDozjvrj2cR+fhMT9YNSUlNcOIOis6ev/dP6O5YRqqXY8F?=
 =?us-ascii?Q?5EGPKIXrwi9fBSfZh3q5d3pkHKDyLlH+GKvKcb4jxuyVqwz64XKDHfcNlhZi?=
 =?us-ascii?Q?A3uPLjUHgDfM8cuUm7VkIm96EW+AGxDP0eluJinY5bR1CB8/mRIbGnyvLRpT?=
 =?us-ascii?Q?oD29Ju/Sm9gDmdC1siY7LKFsAMXdrmyDEOjt6jrAFeuRhy34iw6EpSxCFT8H?=
 =?us-ascii?Q?U3pqkRTp4kICJdV25uqNBOZ+Pm5bfD7mNEUXV+61CCK3Ni04xci7APdiqZqR?=
 =?us-ascii?Q?lZXdt4YHVfiX/MOXsN5cIg5fYzkA3KA1PeIYpq4ERK0JLEgATgT73jj49gUg?=
 =?us-ascii?Q?x//ED+KBsTnUq6rbyXeZvf8SOio62+ta2CusmfNRG8aYU6BWgb5e8hwHIKtE?=
 =?us-ascii?Q?G9WNV6+mvoCHngGED0hOu5klFmg19hNtLJOUkIjckw2SRVJkMKzBtbuHo2ek?=
 =?us-ascii?Q?5V685RtAybmswRouw4dLnTRvg4v7bxbPUr9m2gDYXS+6u1drKHCv5UwnLdEz?=
 =?us-ascii?Q?7Q=3D=3D?=
Content-ID: <7E364AD56F43484686CA86341F26978D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 25NH0agkf6+6+O6Nq/TIZsKKUU5RkQ5QwbXsIzx9EsX1Ro6TPAjYTyFbNYr33MPAH7TVwy1iK9T9P1dlLHyA/uL4h3eW2AKlNXRHKXXQMEO9MqG7jmcafEch3qdghOuHOXzX9d/EPT/4LgwB7vyDSQLXyK7EU9PIOZ+MhUNja0PEA7QLtQiU+QOwhpILZKCzm7WL2sypkSjLz7//ftaWQ/qekcKcguXczobs42ks7viWy3Vbm9WdUONfUZgbb3+H6FB5kIjrrbTsIyGD3AjGXciID4Mt3wNoQm7tmsZDCwOaOc3AK580lYrpNhMlEApNfTzzT5XS4Lrqgj7xR20t4eHpk3gKeUEJnDbV9RZGhD6i6olpZjY4+OwIoqCiPkZBI2xZeKU3CHWSqzl1Op9d89b8Top5+sGOK2LLckQLJg8EVoMc34UAmhj3BOzkgaMKpNi1S02eMYWxobgx3rA8GqpvigfgErelOu2yq2S89RQ2LzfzDvLrXY+GM5uzWZMUdd5xXQoYMHbGHISIgna0O00AvLi4uFsc4JirSd8DvWciWAaC/oCaR2kNLR0zFgczRXsOkQevMFW0e2h7G/W0Ewy8HLEhmCBhipwbUK8aIiYNcU8+kDKotMUVbKSDJZ4t
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081db331-94cf-4491-36c4-08dd54ab3a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 08:14:15.4162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmY1D3rjKlVUHrLR/piVINCV9Z4Fk0i8AGT3NkH1Q3K3lEgk3MiCZmawo6ueRtoOrXkV6F9PhXArgfV0bJekOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740384865; x=1771920865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=7ctu8CfInavhTETIEPJqmtbgTfXEGE4AvU3B4cudxss=;
 b=F+v9ul/oF1GOvKfzLSPQEt5UT4Zc5Ppp+dbhKsjKFgE4vyFNAf8704nG
 g+OGLWRljWUluC+0rey/TT5fcPxWh0QfR8VJpP10Pz3LUsluYJ/kgWdhA
 gswEAPHzwe6B/iZ6CVZXKw1uDqdGhU01lqRja71BhlW3iLIrKUzO5c9fK
 cBUIbYpTMrIGAtxqH0gzkyQSbQXQHXU3zZwgzyvDEvgGTFEgJfhqeSJoy
 yMuulDXDKA2AetWu3rLCCbloXNlAz8qF6eJv9Ac9U/i80xtrEfqP6P7Wu
 fRc0/NWX7kcybE0+GbxJ1TohSrDALuK06FrkmXzLrwJQXLvkF6v1etBKC
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ9jCWQJ+gbaY7OXPJaDrDDyODy6j+OffqZN8ZPYMG8=;
 b=S6prMdH88gLMCqmX8nk0WgsHAyPSOZB6Dcvo+Bfx1on3sJmX5xhglq7pg3eKZyNvds0N9OmA2nSrvgbPuTx0mlfPOiRY8c1i4GhNHxA1HmkjYbWsoEQ7i/Hc+ia0suJtpfRuVGSYRuZoFdKs5+FvKVt8C8LTdRBYcZM4vDBAOv8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=F+v9ul/o; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=S6prMdH8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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

Hello Yann,

Any chance to get a review from you on this series?

Kind regards,
Niklas


On Tue, Feb 18, 2025 at 11:48:06AM +0100, Niklas Cassel wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> support/scripts/check-bin-arch has an option -i to exclude a path
> (or many paths by using -i multiple times).
> 
> This was implemented in commit 01d90f0d093f ("spport/check-bin-arch:
> accept arbitrary per-package ignore paths").
> 
> Looking at this feature (which hasn't changed since being added),
> we can see that check-bin-arch automatically adds a trailing slash
> to all entries specified using -i.
> 
> Thus, specifying a path to a file, e.g.
> "/usr/libexec/perf-core/tests/pe-file.exe" will cause check-bin-arch
> to add "/usr/libexec/perf-core/tests/pe-file.exe/" to the IGNORES array.
> 
> When running the main loop, the file
> "/usr/libexec/perf-core/tests/pe-file.exe" will thus not be ignored,
> since it will not trigger a match the pattern that was added to the
> IGNORES array ("/usr/libexec/perf-core/tests/pe-file.exe/").
> 
> This means that the -i option in check-bin-arch only supports directories
> and not files.
> 
> Fix the LINUX_TOOLS_BIN_ARCH_EXCLUDE in
> package/linux-tools/linux-tool-perf.mk.in to specify a directory, as the
> existing LINUX_TOOLS_BIN_ARCH_EXCLUDE can never have actually worked.
> 
> Fixes: a7ad7816262d ("package/linux-tools: Exclude checking PE binaries from perf test")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index df3030439e..d67318571a 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -180,8 +180,7 @@ define PERF_INSTALL_REMOVE_SCRIPTS
>  endef
>  
>  LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
> -	/usr/libexec/perf-core/tests/pe-file.exe \
> -	/usr/libexec/perf-core/tests/pe-file.exe.debug
> +	/usr/libexec/perf-core/tests/
>  endif
>  
>  define PERF_INSTALL_TARGET_CMDS
> -- 
> 2.48.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
