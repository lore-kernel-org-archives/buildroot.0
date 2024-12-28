Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2FE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73225808AF;
	Sat, 28 Dec 2024 14:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmbWivHl5X7v; Sat, 28 Dec 2024 14:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5C180A46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C5C180A46;
	Sat, 28 Dec 2024 14:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E0EF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0F9808AF
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdIk7pINF6t2 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::616;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6E4D80A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E4D80A46
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E4D80A46
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORcV52qjjT4Qs/C6aVPO++GMZv3mTnO9m+2llu9CwhAD6aUne+Tl5jFEdrCnduvr4uZ0ig31wy6On1mZ3rr3KivDBFv3wdgScFDC6ReXcbQfbhuFcDBCi99eBuACT5/yHooT3Y94b6uUREOaZzJRYittlrL5a9iZ6GaJnIE0nOhTdvDQDs7FYtK6rNWobg8o2JgPUnbxJwuMerS2J3OVkyV6eVumOCSBpYwLo1zZWxvA4D53S6At0CT/vPWaaibr3RrAcK/jnzy4sZbXGtT/emYo2kwE2RMSIWoiJOiVMQLqzIoFSyAYtS9HZv0O0lNtv7FEr51xt/7VDTGU3TePWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=797O0hKEXcWHa6ivPb+JauA56r7LP9/2gwm4RzxKuts=;
 b=o7EsE6sUA6FWPMe/HhEqeh/YYVRaXCmUrDUHUfjWGUdFlwVArjw0zSYtScbZV3g5ntf38J9RCG7Tgu8asKvIpWfS47p3kqASRk9JTS4QDG7T5ZmKQ+sjBfTebMxbLvtMCcdzZykiGN2K3Z6gu1tSsDKGDCnAQna5beQNCZwMg4uIP24dAnMj8WzDBv3QTKg4ht9uJRSy28VeBvEthL2VJtM6NaI7AqhJt3cBhK8uTDMuIh19tX0jKUkgnGwOcNP325NhvPTZUvE0R9F5FcE+RJLzx723B/KL7pFMs7BjsqNfjEO/m3/n27TOosD/m2nGViEwoTtbKW1M53wpO3vNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 14:08:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 14:08:08 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 5/7] board/zynqmp/kria: remove post-build fixup scripts
Thread-Index: AQHbUsrvXzDE2Detr0CqN/iphJVvUrL1dPAAgAZJNMA=
Date: Sat, 28 Dec 2024 14:08:08 +0000
Message-ID: <CH2PR12MB5004B9C2ACC77D05E227A5F3F00F2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
 <20241220103523.2301721-5-neal.frager@amd.com>
 <20241224150810.6c618204@booty>
In-Reply-To: <20241224150810.6c618204@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|LV3PR12MB9329:EE_
x-ms-office365-filtering-correlation-id: 93d4e063-6aab-404a-b76e-08dd27490e9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oJuUauQ/TwsyOyT/cCsXqjnuLwROTWK+G9hiLBqBwt1jYPUxThuzT57gxPvM?=
 =?us-ascii?Q?vppncRPj9ubBE7OTpbTvApzP2DnQIEDUwGbbvRD6VUTGobkJQ4Xt9e7v9Dq4?=
 =?us-ascii?Q?rVv1q0EF9+nth/sLbL18GpY9IFqZgLOaE25zjJafnD3vwMcjreh5+FyimWyP?=
 =?us-ascii?Q?tltaZIRZZqmzGFlxTNDnAURER40Es+IuRB9VPYNHsx7UMs5Gcg1U91N/ilw4?=
 =?us-ascii?Q?Oz9Ae6V65z4jATyuz0WYfsxIlTXrfvOc355UXufKkIDYcIdMvH84B/RNxe9p?=
 =?us-ascii?Q?IC5XAwEjUOc30g1r6XlQ/ORhWKxPj6JncJjdnoOXVN1J77DAAo8N6iNJ7JA1?=
 =?us-ascii?Q?r3tCQPfBmfj/c50Wgnquzr8zIJSi5CwRhYcxkjfPwf/9pdGb3ymsYoR+s1WS?=
 =?us-ascii?Q?+UCi0kJBgS+UaajZ7zMEDuq+os3PEOFA8sQnk9TlBrPGvtVKujyJzdvy+Ezu?=
 =?us-ascii?Q?ya/wUdpLBUtik8MOjkDochqmBIPb3rohF6UYRyzuoG4OHjTXZ4kRFVTsRUTk?=
 =?us-ascii?Q?aBiZB7lDFJzf7o/fgKNovSoLiEs3PgwlVYwg3KlnCSdVUBlO7tOyuznWkRRV?=
 =?us-ascii?Q?nq1j7/++Uf9FDpblITYXk0dQVg5khbefPHMTLvde9y7Wh2fD6JXItGW4BIjn?=
 =?us-ascii?Q?JaO4O4mM+lu7VGHe2I2T/7N50wXsgNmFqsWT+PQxOxVYxHLU6BT1janSar4+?=
 =?us-ascii?Q?uD1VvaLGZ2xNpcJHuA2H1S4gQTwhCdvlDUfZS0PqP9LHnjUNYgz04OnNkc6b?=
 =?us-ascii?Q?TfP6SjGK4jncN0xRe8WgI9ki+mHHkYvM864hvN8xZSG5n32WteGQuCRKdC3e?=
 =?us-ascii?Q?D0XzN/00/RkaJAWzMWPE97Stx8X6iWO6RGm+HcUSn4dKCjuajhsWPju/LSj+?=
 =?us-ascii?Q?7gJ6aJMpp9NtlENMLjF3sqQyIvQsuet46GCnmRiD6ci7pHkXVyK/olhlErfR?=
 =?us-ascii?Q?qhnbpainjSH17zLNgerS3bhYzqWfBu5bgFr8Tso4MOMwVCLJRzIue4lrzQD6?=
 =?us-ascii?Q?guhG3dt2rKUg++YGfapgzfiaub7YBkPXo7V64y4fdeA6x6az4HNsa9K6yJQX?=
 =?us-ascii?Q?f4DfFFmm1CWGbENmQ3aj0BAcB/FYghf0yS95r3WFFGdv1ADJLYMVX9GuF3fo?=
 =?us-ascii?Q?LRq2HTedM8+W2giV7oeGErLyZMbAIWqOgMYIjxh+QIjEl8OrWIJ44P4Yf5UO?=
 =?us-ascii?Q?xMEbCOckQnp30Y7YsxboZapPKTYwO4an7M6VccSszICHk3A5wk1nOSF5PQN3?=
 =?us-ascii?Q?pT825UHEQwH5mEyrY9Mg3rydR5mvU3HHYo5JYYTeNh0hYZnC+gdL+nz65JSp?=
 =?us-ascii?Q?ONSeddC4UJP1yyNKXXkx8A0K4XXtPC/O4JUMLpoQix3+vVZZjC7A/MlhybKP?=
 =?us-ascii?Q?hsZRSHzsLh0FpVUEskxOk9GYmG5CZtHfcTbygyyZWc682NBPAqkGmMVZWeaF?=
 =?us-ascii?Q?CjZ35h43v7A6Nuy6tsKxYIAdFqDk0O4SPiWDvKq2kBZy459S2wn8NQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rsxvQ4hzm84Wk6X/PGNIWnHvFAxBaAIPvLEHmxv38m8uk7qXF9b3vKJNpSYY?=
 =?us-ascii?Q?Cv5Q9mHiZ/LOiR6lDeYH011VZYS9iQKKBY7VtXoDhaSjeEp0pEvKBORiDpaS?=
 =?us-ascii?Q?eoPDjZQopPVTn/EEe06AAM/3aO42NKjfRU7IIiq8m/s1J+L0X0tqSzNDzwtz?=
 =?us-ascii?Q?IBKgFZF7lZodIilAfjNtEu2gnhSP+Yn+0y3Lb9LijqRj9odwtBbwWtX57ho3?=
 =?us-ascii?Q?Sg4yCiYKqosbwoVIEhXbVhFkxkBGjNa0x2X7GTtmDcSXLQlk+qtIq+ktTL64?=
 =?us-ascii?Q?/yCkt5HNcpwEsInP3B7mUkVXWqJCn3pgzX0igDB9xZkxvzbUn5bUw1NKOPYR?=
 =?us-ascii?Q?BMM3RHJ02OhhyNetwZArcVSF2EYXxOK2IArm4YJTvzw9r5y8QjPAieUTDVHP?=
 =?us-ascii?Q?/9OBfousN0C84Sazf/XpZOe/ccGFVe113+raVQVpjyyDG6F/JDA6siX1QHkl?=
 =?us-ascii?Q?nan95onJj8cxvn6UMfGGHqvl3ot3T0iA5EMu/nTIy8FUPTRQ5ZfURNAkAsBu?=
 =?us-ascii?Q?hrWrl9aiF1aXwcaQ2oDqHQLP2k+FYVe+iHExwseANQiaHoDJ6CaHK0sgXX8i?=
 =?us-ascii?Q?rsEHwxMtMyQxWWp9z8eMl7ur0yVYQLD2pRhRX4rWwH5zdAivH4TMa+QwDIBi?=
 =?us-ascii?Q?w+hTSm4E4SuGJB6QjR2KENkEjzZA4MSk0xc3QSxLIml3sTlWHZ/7DsRYxN4l?=
 =?us-ascii?Q?PHWVpAYghlg+MkU8tO/nINPAUxNrEFE0FP9tQK1STVI2ivHb08PhaJxKIuki?=
 =?us-ascii?Q?M852WJHRGxYG6R2+yQo5SUyCDuReASAiV2YRCfsAiINykQeRFo1GNLQ+FLoB?=
 =?us-ascii?Q?LQgMxmPH0JYLEH+JjSVY6czx6TG12a1y41IU2JC59cenfD5oSWnGxZoViUhr?=
 =?us-ascii?Q?Px5ZCCdMVkCvKxpY8xpZdRdW2oB4zrcT9WYCWhpV3Vd/zt6U8YW+3BjitkBI?=
 =?us-ascii?Q?zm6GQzGC1MISWJ+j73tk74VB05sjZoUItd7HiCMCXgSPZCrU2ZHgssYsuB6e?=
 =?us-ascii?Q?n6Fwuqav8djRcr7heP0AH+F/J+EEBt2+ISkkgyp6U4iekLY8lH/h2sX7A780?=
 =?us-ascii?Q?tg2/3Zut7+1cr5fQLskmzYrRp1GmmDxKR7+sVodYhkl+cArpcbYoActnWe3u?=
 =?us-ascii?Q?ci7Gwcol8BJUlqepumV2dBAQpFUHU7waWhTYIMxu6k+aFwpdcrD9WnQeG2NI?=
 =?us-ascii?Q?28kf86Tk7GzqP/xtj5BIuxAUtqhKNdZ89OrCspkDorDkIjByhE465ZR7U/K0?=
 =?us-ascii?Q?G5xkU1W+rlqt3XJta1DEfEVx4VwKkBSp7W5AWnSltHwDqo/1/hUMqcEL2Nly?=
 =?us-ascii?Q?ISmztms7ySIuPOySF7QdZ/InASCgyrGGopWP0pox0HojbNpNE/9UU+y+8Doj?=
 =?us-ascii?Q?UhpBqZOuxHwmA9DVam5umo3uQ8Z7mezJrjCDEQNZ9+qm3UKQEjVDHGT0ruHO?=
 =?us-ascii?Q?YUiugBl1sc8aax9PyGXek1jR9xJzLrhQBpNwEuzb2C3xlnTvp5wqNgtRdCwZ?=
 =?us-ascii?Q?0CeI9fz5Gg+5XW4EZ2bLHQ9X934x1B1G7uVLC1/pohPsnQ7HkVjYtn8rxaNb?=
 =?us-ascii?Q?r7C06mMDO5QrvedFmbg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d4e063-6aab-404a-b76e-08dd27490e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 14:08:08.7544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZLZ9bkYNejN7OhB75bph1EqjZ8mC/dZC62xr8VFzlQIzxFiAStVcxXc6dm5WnJU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=797O0hKEXcWHa6ivPb+JauA56r7LP9/2gwm4RzxKuts=;
 b=ju02tgh112uiyXm4pMzKANJS9XSNWutbtvs2jXd2zU8YDkgLmy1BMk8ZA+cp3U9SyglEIBBcXs8K5ibUceNv8fjpbyoNph/mK7+wYKj6Mmjlw1GBmgkeShjF0L3vMtom+44YtDRAF/BciX9y0crpQZKMOQw9jQoMRuhSrj+fe1M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ju02tgh1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 5/7] board/zynqmp/kria: remove post-build
 fixup scripts
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> With binman, u-boot can now build the correct u-boot.itb files for kria
> natively.  So the post-build fixup scripts are no longer needed and can
> be removed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - new to patch series
> ---
>  board/zynqmp/kria/kd240/kd240.sh | 16 ----------------
>  board/zynqmp/kria/kr260/kr260.sh | 16 ----------------
>  board/zynqmp/kria/kv260/kv260.sh | 16 ----------------

> IMO this should be squashed with the previous patch.

Ok for me.  I will squash patches 4 and 5 together.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
