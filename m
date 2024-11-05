Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05E7D40D08
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 23:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62CA56069E;
	Tue,  5 Nov 2024 23:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIhgMXSErHAk; Tue,  5 Nov 2024 23:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84DC606AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84DC606AF;
	Tue,  5 Nov 2024 23:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC34527F1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBC3E40197
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc6NEhdOBcok for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 23:24:37 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Nov 2024 23:24:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C7C940158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7C940158
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=032b7802c=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C7C940158
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:24:36 +0000 (UTC)
X-CSE-ConnectionGUID: taMPyZzeShaapXVIEntFzQ==
X-CSE-MsgGUID: C9W/Diw0RpulRMvBdV/sJw==
X-IronPort-AV: E=Sophos;i="6.11,261,1725292800"; d="scan'208,217";a="31837151"
Received: from mail-centralusazlp17010000.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.0])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2024 07:17:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq7CPHj8pQ4fdMlF3FRWG4pPos3nsh/5E8wTSQSzvG4OUs4xpCSr2djGiVJgaXoZ253GIKA7N/GTVdlRpyHI7sndP3vwpmFkV6BSwraG00EbbZSU0ycXHZLG3irPUYPSnRbmV0wMN5aXiMbMCqXi7vAs4prPXbAWNG7vXnOcX33dXW2ZmlWFJ/yIXajkUKsx/941Yhsa81zSS2EEtq3+VJCM2GIsCL6+GA122Dme2n0qSvcKM10Idy20jIuhV+s31XldBa+/baXWmtnd06zdF7DgP8jlfYAri2CHj2RSaSmHlsl5+tRXAB2jQqqg52WDUorSdtgvNqlWDdWI4i26tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBCMg6NY11DcPsg6802obhJDq7SP5LCP7rEGFX3tbdE=;
 b=fDkl3mftePzhnloG7Sriimjzf6iCIfJj2qr2CREaK5mTziOo6sKwXvrFHYEl68wzylGJoRhKz+ZL965d7/OcOL/575b0Upzx/7G3uQ7eEH1T+MMOp0zr7ygNaZrhQX5sIIjwizqNLNZDR/Ljxr9FelgU7zj6Rd44C2zL5M0fdkmpzKEo26PtzGG67SVfz5CdNZzsvmEhMMGXYZgFfdaVCReprqw8pez+oG34h636wTRBvX2lULTEu0sjydGxoWWRZzAfNhbe2Cc3XzRvENpjnObNTZcMtW1WMgM7oMNi7B5O2EKoZJeZ9+PR7qAD7Z4j3oeir0QTTOGSwcrSbr5OTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by CH2PR04MB6997.namprd04.prod.outlook.com (2603:10b6:610:9d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 23:17:27 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%2]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 23:17:27 +0000
To: Julien Olivain <ju.o@free.fr>, Alistair Francis <alistair23@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Alistair Francis
 <Alistair.Francis@wdc.com>
Thread-Topic: [Buildroot] [PATCH] package/libspdm: Support spdm_context in the
 HAL
Thread-Index: AQHa+EBXH+/QKLnsEUqfAwc/aS14vrKptoiAgAAKnV8=
Date: Tue, 5 Nov 2024 23:17:26 +0000
Message-ID: <PH0PR04MB8549F28957119B0331229728F7522@PH0PR04MB8549.namprd04.prod.outlook.com>
References: <20240827051631.234377-1-alistair.francis@wdc.com>
 <b64f7f346ce3350571f00223b380d71d@free.fr>
In-Reply-To: <b64f7f346ce3350571f00223b380d71d@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|CH2PR04MB6997:EE_
x-ms-office365-filtering-correlation-id: 9419a769-62e3-48c8-86cf-08dcfdf00355
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|8096899003|41080700001|15866825006;
x-microsoft-antispam-message-info: =?us-ascii?Q?vFu4by51CuLxW1eM+V9x1/o0Xy/Kh9xzg0KBzcGpT9ziuzbV3xl1aHy8x791?=
 =?us-ascii?Q?TWxsQTKQtZk1feNhOCFsrK4drSDmBbspqAYMlu+etDbmXiZsn8vioxDVULnW?=
 =?us-ascii?Q?yF89wDpQNdEYDzsi1UXQjcoo0pL0fXpUS5/HLhEa2ChA71RZS0Y2fgJGZdwY?=
 =?us-ascii?Q?eITuFr1Rsk3PDjYtmldIH8HYY2l+EmiVVQ+8c5AcEzcnlTi7HNDmozR646c5?=
 =?us-ascii?Q?qW8MHf8+RBzHlC/k+okeYp7wpxKesvo/6fSqczSSKzA9IsGyLfUosJQoVLUT?=
 =?us-ascii?Q?zObOVSLZwFnHDF7hww+I4LCZdeSKGWwcqJTngygX53pC9Gk8yn1h7z3Q+5JA?=
 =?us-ascii?Q?2L3X3VJA0RrZRQ0ZDa6QI9KNeo0nr8tlXRmgR/9KnUJxjfdUaGD0jannWjtk?=
 =?us-ascii?Q?HKYhs40PTq49RG1oXYDPSvhYYcAdXt+1FNTgNGfrscAstyJ4eB4307ocwMFv?=
 =?us-ascii?Q?hJYOxjkjLXyG5eyi7D7HwcI2R2y/EaN9h3U1RjO6u9D7zMpU1tRhjnp4QTFs?=
 =?us-ascii?Q?4LsE0QUYcSF6pzbS6Ytb0QH+g8hbOA2eTyYOrCgBV6tpCt3HkqvxlfWYS6qF?=
 =?us-ascii?Q?oCaDQUMq1VvCFg3ZDQCY5HIMngQq54efZdaCfSfvh+mK/W/yqSy9VnKB1CvH?=
 =?us-ascii?Q?pG/qWzyo+kDD+vE372itTFcosc0N88SckxE+jNHIcbasLh5n8vp5vYt/jOHD?=
 =?us-ascii?Q?m6+gbj1/cKvVaXf+2nxNBVgXjI85C4jEGp7jE2SwVCqs8qm+lWuoK55MitNa?=
 =?us-ascii?Q?5e/8ZlvwLJRnqQzUas+agZ39rKZDWG29TRxJM8/t/2Z0KKdmI5eIZKWFH10z?=
 =?us-ascii?Q?mTM5LkAia2mGVf/eKgmbQpae9HDSSh+u0HIEEE1k/p497PhhBjyq3w5EVbFj?=
 =?us-ascii?Q?0A4bEvhvk9gBD+RwZAdl0e4dIQ3otJ4q2O59YmlKZ7AF8fUPRRLMwWmYHw3c?=
 =?us-ascii?Q?bbT0cuPzKUNW55YTAVM6c+18w99ozri+5r9pB4awaW7p0Ry46ccciL8S7G7f?=
 =?us-ascii?Q?yKTsMh+d1AjdpC+pgh/kA5jyIl45mId6XrH0g3tmjmllVSW3rmEDkRQAxvoY?=
 =?us-ascii?Q?KogKdFyE2DcF/vgOUsUtQvyA3nudxLyhMoPPq4Ju6LYIxG83pHHJde9EUv7k?=
 =?us-ascii?Q?v8edHxcDI1RFscZDkcDdp/76wsv0vp9UtiJWBH58JOCQSUsCi2875Qdi1AgU?=
 =?us-ascii?Q?QB+zgdsIr9ocAjOrNiqB2PLjMmBgMCUwu5I/hGt2NRpU1IGNpTw3zcoHZnAO?=
 =?us-ascii?Q?Q+owFylmmCV2FMOsdbCKqTU/O1p3z8yGDWYb16Yugl9ZWvOW10kus2Q/cVI9?=
 =?us-ascii?Q?OLSwQvrBWEZQzL0l36gkoChE7UUEyb9lMLO65JaSTcLXtFpXfjwMQ3+p+imv?=
 =?us-ascii?Q?xOgHZbrjCKb8B5jLxVr3S+3sfuzZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(8096899003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5f3qAVwjWFyBNeHVpGkOHUnN4Qxj4qZ39PVgbBWdwZ/bR6EQvYOLNMX3KJhx?=
 =?us-ascii?Q?dOWd/jMQUrkKX94C04sndlmvXXkkez6tqfoakogltN/1iJSs1O4TLArexmbz?=
 =?us-ascii?Q?mqmt1Vab+98Y3KTzzW7mGQ6S7IKFga7t/jW/vPxUUBWPak3h83+AcSr/a0bc?=
 =?us-ascii?Q?5dErj1a5+m4+6uBLi25tOf+9bNxPrc1NyMDuYiHrVFnpTKLmpDfqshtAHFbC?=
 =?us-ascii?Q?uPc40qTEeobokA3/QRCDTcLzATBz97VADIsLO3EpHF3r3X0GuGJAUeYu+lgb?=
 =?us-ascii?Q?KWAAj4N1eUE79dmBIIYWEqnXjb3iUNpuy7n1eDI3l0xWeyLgv07DB120gTKB?=
 =?us-ascii?Q?7MT9CF/RI31/2oQb4054WYRC0Uzr5p7ZaOw92o581UL8Ph09VFioaL+hy4b9?=
 =?us-ascii?Q?qtQH0B32ePEiwM0HVoygHljmBjuE5HaJs7ENA9PIQOxXuahaZnEvotGhw0HR?=
 =?us-ascii?Q?m1Kp0A7t3fsSHRefPoJQxMroUO16ox+Uh4wGAalXI6BoU0WDxL0GsekHfO30?=
 =?us-ascii?Q?cNTms0n3x5Us4f1Mm4mwpxTRxKA1hROiMA/LOqbU+a0S9Xhknl3XEFJWG4ss?=
 =?us-ascii?Q?+DJYrvzECwGeYqYthoKKrvS5RodbfoAWXSzIZJM7DPx8O8eKHMQMuFKb92mZ?=
 =?us-ascii?Q?XjfWhb9DMbrpTsaFkKadqOC6jousFY0+KphspZLVuggTh6r9AtahlfmVG3Dw?=
 =?us-ascii?Q?cLHWgcPO8JpraOQPF2KxM+dFmRc1iD3v67deqgQR3Vk6UGuY6lhVzF0rwx9b?=
 =?us-ascii?Q?6yT4yc2ZwQ11BYTfaZDNYwF1T6b+PVEItYSbP8pUt6u3EpDDFfCpuvehDOnu?=
 =?us-ascii?Q?r+yGzrp50wYUrRii2gu2oJt/o3hmohh8+r4tM07oYgm4v2YEEauWakYQyza/?=
 =?us-ascii?Q?WQjSRSyKXWO7gHkXhvEBMsFjDMw3HgI9PodhSS1HE6n0iQ2+Ap1+54m4+j/9?=
 =?us-ascii?Q?BYN/Qe4Q+5TjRNk1Z7qjAeKTsA2fHQ4I7fcV5sA8AVZ/gEjaZGmwJufur7lb?=
 =?us-ascii?Q?JgGTqqzAGKcEJ6bNN75b2URsneWQzOJer9ajbZiMLEwDAwQVfZXgg89fUosQ?=
 =?us-ascii?Q?6Ix/bqdvFiOcB6B/EuVtUjUEVbg1aAPcLqfObKnKAz4axgwlrUkmTNEQRkwG?=
 =?us-ascii?Q?aOjh9u33DESVEzrg5zdAbJu+0nqtLZTKwYwomN0JnhOFyKvufaZRj3dgmg4+?=
 =?us-ascii?Q?Vx70GyeSgVAxyyD0CeUn3UoaA7xaoKH1JAm4T/jwIyEG+cyXm1nXnsiZQ4GT?=
 =?us-ascii?Q?DXL8gQCnhoiPjBOSgy7fQfox5IWALsZDZC/dcqwgjRtJUXx3unAjwQEe6iTD?=
 =?us-ascii?Q?Zo08cYvDvf5f4XMHNo4v8x6y9FiMigRNb9gWbERcyzLE4RvrSOPMaO57E/D6?=
 =?us-ascii?Q?YPlNDJtQoZniHlLiM7V/uFzoUr+zmhGcfPCAKcQwQZnz0NEQCifRlDZw0M60?=
 =?us-ascii?Q?7wUzm4UUS16KYvADEmwFy5Z2tEWslu7D1FeVPTlQwtbg8fnyoK/MhE5iCzNG?=
 =?us-ascii?Q?09BJ4ACIwNgctKlkdHLzLb62MaSyecpfSZyzwx2kotKwno0DJVyRtmQLvzGk?=
 =?us-ascii?Q?cPGGj337f1/N5g7YVDMviKUjY8jPMEwVS/2YRJgX?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dXbsb9y9NPyMfJdikImSoNGHdhcuvjoHCRSnDVe3Rh4Wp1/td6Qe/Nn+fZ8cch1G+hBALKyTT88RpKvBeXeofWho7yRQgiR7r9a/4j4WJQLYZ8vHJyxRlYwPLA4Bl8J3Iyi2TpVjnpJFp5B4y7XRALtTqAUUjr1QnzIJNk7T/7ezF9meAIbob8Nk2wNErEb06W+H/pBuxp2F+HXbfJf1AqAmSXXF1JQZFjjSCe+dD8GYY8YgeRjNTQuT5SJ+A6u+c7W9M96Rf8TU64uvZZjpko/2V9v3uSvlbEKVQSSop5LbNq0i2zdhlLCfGIlLm0XZXLrgYZRJVwNKbhLynQaDdPHlFlG6tXBnhNlJhSo2zHbnpvMOMkWZVI65XZ+vttjwiee4TAhbYhoIQLNHvdeRbe0WNLGFkU2naJx67fVxxd7tHx4oEB8Eco/oMZI3At04d+CSbuaskGZKy6nVTqAD0jUfSSS0MsfTdsMRKKZalSt8yX0IobUGqTBV2ZhAqPU+TkPr0i9Wir0hxnW+EBZ9iFRErTuTKfqVWJVTfosDASzU5DCx4NybVB+CWR0ZCyJOw1cBRmcw85RBUof+m7ogoJ3aHzo6HLHbF2qXLgFJczwW6YLB8AT1rvw+Z4KSAuoo
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9419a769-62e3-48c8-86cf-08dcfdf00355
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 23:17:26.9364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmZoMr/LdMoB0wj30nrxI8Mogcu3ZdazYwCk2tI82cQf8svd2R9llQtf0o8PO5g0+U/eQ1RaWyoBN70rLab9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6997
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1730849076; x=1762385076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=uA2+Fnd4HVp02N2O2J/LEu/FWV1x9FNjtGFWpuwY5b4=;
 b=KN4Jnp881oc0RMLEn6/tNrM/oN8bXYhcsT01a3v5K5wgJDlTthkVmacf
 5hgFkkiLuV+BSVJrfcgMFClEtw4tzMZS9fbu/UIAOy1vUFQDV5/YJi7HF
 zrFwefxC2UeNfw+PohnjbYkaj8+LPB0C3xjDQIoO979ZXZX0v7zAmZx3z
 BLmJ4vOKXbMXufQqHjvJTISoqw0+YMWKeq/u8YK5jQNsgMEnX9Q90xQ66
 dzy7R7DSq9RjQGuZQVMDM5pO30r18jAX0uGTtq4Kpsv4jcGx914GP6BFq
 jzZbeWpI94ynVNuzbZ2iNf0i+JVNhDxNEcjs8ww8RSeeG2fzJg2XxZiC/
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBCMg6NY11DcPsg6802obhJDq7SP5LCP7rEGFX3tbdE=;
 b=KrGawpb2hOjGGMy1mFq6wm5B/REDZI5AAIPgo6fnvd/QTDm226p1rPEVJqeeLZe1a5lphlWFpoh5X0dVgRQErPh7K5ig2nmGqYVgviOGT0Qwr+gX8vtMbOLicjzopGl0nSE2ear3fhUscFFKY7l30hLPBblf5/ExoHHXAyITxsY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=KN4Jnp88; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=KrGawpb2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] package/libspdm: Support spdm_context in
 the HAL
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: multipart/mixed; boundary="===============3317923655637034032=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3317923655637034032==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR04MB8549F28957119B0331229728F7522PH0PR04MB8549namp_"

--_000_PH0PR04MB8549F28957119B0331229728F7522PH0PR04MB8549namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ah yeah, my mistake. Thanks for the fix!

Regards,
Wilfred
________________________________
From: Julien Olivain <ju.o@free.fr>
Sent: Wednesday, November 6, 2024 8:39 AM
To: Alistair Francis <alistair23@gmail.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Wilfred Mallawa <wil=
fred.mallawa@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [Buildroot] [PATCH] package/libspdm: Support spdm_context in t=
he HAL

On 27/08/2024 07:16, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This allows us to build libspdm with support for `spdm-context` in the
> HAL functions. This is required by `spdm-utils`, this macro will be
> dissolved in libspdm 4.x, with this feature being defaulted on.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Applied to master. Thanks!

> ---
>  package/libspdm/libspdm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index e86a79ed67..2a76892737 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -20,7 +20,8 @@ LIBSPDM_TARGET_CPU_FAMILY =3D $(call
> qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
>  LIBSPDM_CFLAGS =3D \
>        $(TARGET_CFLAGS) \
>        -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> -     -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0
> +     -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> +     -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1
>
>  LIBSPDM_CONF_OPTS =3D \
>        -DARCH=3D$(LIBSPDM_TARGET_CPU_FAMILY) \
> --
> 2.45.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--_000_PH0PR04MB8549F28957119B0331229728F7522PH0PR04MB8549namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ah yeah, my mistake. Thanks for the fix!<br>
<br>
Regards,<br>
Wilfred</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Olivain &lt;ju=
.o@free.fr&gt;<br>
<b>Sent:</b> Wednesday, November 6, 2024 8:39 AM<br>
<b>To:</b> Alistair Francis &lt;alistair23@gmail.com&gt;<br>
<b>Cc:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Wilfred=
 Mallawa &lt;wilfred.mallawa@wdc.com&gt;; Alistair Francis &lt;Alistair.Fra=
ncis@wdc.com&gt;<br>
<b>Subject:</b> Re: [Buildroot] [PATCH] package/libspdm: Support spdm_conte=
xt in the HAL</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 27/08/2024 07:16, Alistair Francis wrote:<br>
&gt; From: Wilfred Mallawa &lt;wilfred.mallawa@wdc.com&gt;<br>
&gt; <br>
&gt; This allows us to build libspdm with support for `spdm-context` in the=
<br>
&gt; HAL functions. This is required by `spdm-utils`, this macro will be<br=
>
&gt; dissolved in libspdm 4.x, with this feature being defaulted on.<br>
&gt; <br>
&gt; Signed-off-by: Wilfred Mallawa &lt;wilfred.mallawa@wdc.com&gt;<br>
&gt; Signed-off-by: Alistair Francis &lt;alistair.francis@wdc.com&gt;<br>
<br>
Applied to master. Thanks!<br>
<br>
&gt; ---<br>
&gt;&nbsp; package/libspdm/libspdm.mk | 3 ++-<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk<b=
r>
&gt; index e86a79ed67..2a76892737 100644<br>
&gt; --- a/package/libspdm/libspdm.mk<br>
&gt; +++ b/package/libspdm/libspdm.mk<br>
&gt; @@ -20,7 +20,8 @@ LIBSPDM_TARGET_CPU_FAMILY =3D $(call <br>
&gt; qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))<br>
&gt;&nbsp; LIBSPDM_CFLAGS =3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(TARGET_CFLAGS) \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -DLIBSPDM_ENABLE_CAPABILITY_=
EVENT_CAP=3D0 \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1<br>
&gt; <br>
&gt;&nbsp; LIBSPDM_CONF_OPTS =3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -DARCH=3D$(LIBSPDM_TARGET_CP=
U_FAMILY) \<br>
&gt; --<br>
&gt; 2.45.2<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; buildroot@buildroot.org<br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR04MB8549F28957119B0331229728F7522PH0PR04MB8549namp_--

--===============3317923655637034032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3317923655637034032==--
