Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC2E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD59060761;
	Sat, 28 Dec 2024 14:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NZ4859b2SnJ; Sat, 28 Dec 2024 14:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD5C6073A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD5C6073A;
	Sat, 28 Dec 2024 14:06:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88C9EE0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E25808AE
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WZC0oe92PoC for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::60e;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BE7580A91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE7580A91
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::60e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BE7580A91
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDst6BRUStaOKlbq7uUrwURJ7YzOd3FNc2519ToET47b87gnWkhWUOjxZwp49DjhWbTX2EinI/kxGZQa/qi8M7R7N21ACrGZySW0kzFakVaajN49tM1XLnxU++e+0VXocY8wWdwpLT1P6PKfimZ9EUWoYnVOjJZyU+cNhPPjiU3MFxUr5L+Jo1FAzvHfsMMrbJWKJ7IFuH5Ae2WDkJYyX9caUhcEmKFk5akadKVp3fQdck5DpFJBoOOng8j5zmN8SBqT9eZSA9swuqCXwBO2l/q4Kat9vmt6GJ79v4nef06iT+HKFmivOfcZ61xtqbXf4D2Gt2Ryex3T7sQUzBmdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HVRXAJKWVAaUQjs1/DvukX8e29iXxkMsFIBuPUNn/w=;
 b=LxtZxMa9e/XXxIIZcvBwiH20VvxyXXmD6tW0VQ7hocY7RJGxTeVhE7893JfJgmoj9KFYnCrFcBeAj0sgx5DG2vvOqwJoEucKNto+OokvDL88uuligF8Hjhh9UROlskuEk4JzcLBdiL5j89rtft85pLLESjHry/hapc3uqBcVCsHBM7XDiw2NtdfmotIML/obvJxDzsh99r8iUt+jKS5r3YvE4w9jpWLRsAvtgTys0O6utuWtd11K2z8xpr/o2HXfCWlFuhtnkp992aDLc0YFTQQJv5x/9ayaLh6uy/7POKaZGW8IQEaCS8/b7Orpdn8V4+ISdBfpmnFYZ47daU36Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 14:06:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 14:06:35 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 3/7] board/zynqmp/binman_patches: add zynqmp binman
 patches
Thread-Index: AQHbUsrzFHm28HM2AU6eLWTePC4EdrL1dOQAgAZIibA=
Date: Sat, 28 Dec 2024 14:06:34 +0000
Message-ID: <CH2PR12MB5004A588A07259CE652A7E35F00F2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
 <20241220103523.2301721-3-neal.frager@amd.com>
 <20241224150800.4bef4993@booty>
In-Reply-To: <20241224150800.4bef4993@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|LV3PR12MB9329:EE_
x-ms-office365-filtering-correlation-id: 976745bf-6215-49b9-12f2-08dd2748d6a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BOKTohguv/25vbJe1lFOHAipPsuSxOLsj8L64f3bJ0l0NgyOPCUQA25Eqcyl?=
 =?us-ascii?Q?EaM1uzY4hNV/mJkFOoPajH95dN/cNCcfChCEVw3oeCj4ZWkRQI+LZO370IAS?=
 =?us-ascii?Q?HLiWODu8ahWYP9rQvDc9b4KSTaLngdPvBFRHihr0ZtDexFuETkNkmrQI5kib?=
 =?us-ascii?Q?kyE+MKJPxVIhGiNo0fgnIz3Z8JmWzhNp+1FjukPjQWaAmWOvg+15pJ6O49Ws?=
 =?us-ascii?Q?Fu6EA6hhuk5qUNG7piQBl9OwhkzB70G0xtxRsO+JHo56j9ezJ3YfxmRHrbeu?=
 =?us-ascii?Q?ogAmbw/pAhtcCPqeX1EnLd+gku2DlYnoJlKh78j4ykTDrH0tDigFpUZXuAAn?=
 =?us-ascii?Q?uEQGxpo+4I9pKzFMdpzlzdhovdrUrQgfXD5dQsHoNAm+UGP+Gpgg9D5sYyUO?=
 =?us-ascii?Q?s1BcsqYjV+a+rpD9XBJwDZ1mEK1IeMTaWEBYbJzaknTEYoPeBRFsc/A+fv6e?=
 =?us-ascii?Q?CY4nuB9aCvStuSlesrXFhUsh38ys6eVWy8CMARYqIW1w5LjQtI+7CneyTpy/?=
 =?us-ascii?Q?b/WUxKrhh2zKptauaIAus+TZGpTYu+ZBY+XRnQhd08QamGHuDqn4BuT4nReH?=
 =?us-ascii?Q?HcK+1Aex9AqBIfJGF8GN8VtxqQuN5xh3rt2OU9Rpjpw+YzniBUUt2fGqImMJ?=
 =?us-ascii?Q?QGv7WA+bV7oUSamLEjxEaAjGqOwP2GBWQz2660gA7Ek93fMZTgbLr9M7CC+U?=
 =?us-ascii?Q?z2tIBRX/QjT8SM2l+PKd3HWROl3M1vQRhz4nZjwiRV5OXV4rqEUwiqVF1NYX?=
 =?us-ascii?Q?kimCrzUlxm0Td4OODK9ISw51V8HF1IvLAHIUtRiTgMvcZTyuOexU5LPY0a8f?=
 =?us-ascii?Q?/+fQDUh+J7DEYdcH7h/3i8Ze506P1wU//gJEOoKjJiNpEdwdMI3EG2EMd9CO?=
 =?us-ascii?Q?b3puASehhnrG2pFVIWkKho2jRfu26w4Pf1a5UFc1StRR9xkpcaUA6NeQcxnL?=
 =?us-ascii?Q?eJ6+WcD/SH3GyfaS71bBFxKlaMuKOSTQ8HJZ+I8E37bR/7hUjc31MzdaPCml?=
 =?us-ascii?Q?iAkugFNs3V+krrvmAdil1CPGnwB3H95Qr9bPnVYTwFwi/NKrsQoMbbFqeQMZ?=
 =?us-ascii?Q?ykxCZF0RXKJSZJ/Fk9Cr2I2ZfDaz23G8BpzqiGlrWqIZwdrvnEdn+ErZmon9?=
 =?us-ascii?Q?l/4qzCYRZBFzm4wlMJwugn9Qce29Ez2ok7DeTADcC8QHgMitbtWqv+wyVgof?=
 =?us-ascii?Q?2ftUjRxqf9R/YZJJbZotzbTQ47SeY56INJ2TuY5gA83KOV873aweb3XHsAeg?=
 =?us-ascii?Q?JWYyswy40l9VQSZafv7ZgLwms2/fiWWs/3nopDiI715zzQJ0GUk+Dq1xQtT1?=
 =?us-ascii?Q?2YjJWpTlYph+Nd9e9JSNVNRyGQPvPk2zf21PJ6hVZ4DBGZmRmotN+wgalquR?=
 =?us-ascii?Q?mxojAaqwL16L8pDUSVaMFXIQQkuNHz12t90TaS3xD36r/s+md9PG/GUgXUWG?=
 =?us-ascii?Q?L3VsXW/dA/W2i5Oj19rw/UZxZOvQbjF5G8M1RoWQlajVZV7CbzASPD0BBgfx?=
 =?us-ascii?Q?fUx1NS/65eKuY+E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JqIUBZRQgAlAeslBqPN+4Dwoaau/5wNDqiu/q7Ci85PjhzJrby5LcQk+Rgit?=
 =?us-ascii?Q?6RfqA0N+gEbA5HKUyTNEzWoGd9fPFmb0e4esPepL+su/DavKDcPi8LvcyOu9?=
 =?us-ascii?Q?1e4TzQ15KNootDxY6HJC0+DR/hQbuMti+OtnQOjvsR8Rp3EP9VNgspp1ypos?=
 =?us-ascii?Q?OCKdrQ2hF+w00PaVlNGFJQcogd7/9mTA7S8RCqvjlDFF8rQYNx1eNfe4KkZz?=
 =?us-ascii?Q?gpZIyZqaOrNTS9RLJUmGAmGUxh2/EI93lzabzu6UiHfZGveKV7JyH3LM+DOn?=
 =?us-ascii?Q?jsPKBfwQf+GRsVwe6MBxDL048uFk9+be/BJe4xq0/bt0SKw9qnhd4XSKd4tM?=
 =?us-ascii?Q?A8/BUKmKW0ViwR9DUkON4cnKQN7+XMBbfW4ZXn4nXx+gUvlrRMXYd0fLGX+K?=
 =?us-ascii?Q?gmpyjN4DYdaFFqY25TbcOqCMcXD1SVmPQxvaQcfdnmsJphA9bPm3cPq0z7hS?=
 =?us-ascii?Q?Nk1sfBorL0reRAEAXA0+TD9DcepeUPpxKYEMHUpJ7pNNcjqeX5i+L0PwGrhP?=
 =?us-ascii?Q?AC3qi5goW5F8eJIEfXZSM1tUJUmrRcRudeukuIk7z0vFPVYZHrC3TSKZwQvZ?=
 =?us-ascii?Q?2JMmsZFAF7oatynwrXPE6/F2xG1kMA1iS/A63M7LvxMsk/8X6hw4V2seVe1R?=
 =?us-ascii?Q?Wc1RO60zgHlB/tZH2tBnzEB3pkL1M5i+Cp7lGxWXKiex1pdXm3IBxqGulyL2?=
 =?us-ascii?Q?IF8jab6nia4C4tkamz4FmJF7/CSmmSCMMs3n3PVamF489BGiQhlXc/+xNgL+?=
 =?us-ascii?Q?JeqrR7OLkle5Q+jIwrxxZ8+TYhdIJDspvB3QTz0aKrMMXH3mzfuUrZG/jPmU?=
 =?us-ascii?Q?50jqBPynPNRJ1BOBKuuuZfOYll73RtzlVLmagpqDL6E+9wVVaaqI+P1hz8Qx?=
 =?us-ascii?Q?av+EB3edTmnUCu3nRxMRjlDgVmUiIAhePsjJU+L87nSEZulMktmprj7t7Lta?=
 =?us-ascii?Q?LAmRIg6YQ4+WK1klcraV40uQy7/Vb1slxKWgrA8v+v0a8qFRVcwFkaeoExTa?=
 =?us-ascii?Q?BLjcuPVjkWJdTMiGO0q5GO5/YVl8qm9zXKV2s1B/Y3WJfyzvRqrGzm6vbm2o?=
 =?us-ascii?Q?1ehy8vOInvp8wtZmRuFcO6C0pPQUKEJYcirVWMEovbDcE2U2ZQPR9q5EawNc?=
 =?us-ascii?Q?cpseCYsMO/rHABkCwZXMOGZl9X7pN/6MT6vbO8sosor53ITH/lvn3XdzyZXu?=
 =?us-ascii?Q?pc78ZGl87FfaC4GfT68sYhSrqUBtHPJpMO7s32dyZxdGqMT9oVVMU1TZrPAh?=
 =?us-ascii?Q?ZXvZV/RqAncpcHAB0tsXXcKUmQHGWC2SzlfjzjF4xsElNtrRBf8VrW31Brya?=
 =?us-ascii?Q?RSfRSvKJLy6qgKbYe1+eE2uWC4HE99B99SYRZwYp7WBK0L0Iu0XVE7T8zZOa?=
 =?us-ascii?Q?nyqeHbHCYSrBHbKQ/M7G3SwJJfClEMtGT1fhlDiS1NHk+frpK/YxBnlCWes3?=
 =?us-ascii?Q?IHPlRqWmcr5c3JssRKy6CII8YJvHqgxkElIL/hSG99GVoLygvTdnDB/RCAw5?=
 =?us-ascii?Q?Q8rXECGzvdZUkEni8Qh4JkRFGYiCn0eZrwjXgawprsQUl1X8+vGmT1er3lbJ?=
 =?us-ascii?Q?1MXpuULqX7GGVMRUZ48=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976745bf-6215-49b9-12f2-08dd2748d6a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 14:06:34.8531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlEISARfpz67Ek2DEvhpT29E+TA3kZs5z8cN3oL07+l5aJzBF5sLTMK1ey0454YE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HVRXAJKWVAaUQjs1/DvukX8e29iXxkMsFIBuPUNn/w=;
 b=N8KJtPuIxuy8PmF9Qo8A3zLevTUqrB/Gv7GdQJIq9g5uWgJh3jl7OTo/P9xDfIqkwK/UnOejFyIBzk83crRhRpb/b84zz2DEShqQNGK+pc7McDTaTYQphgjo2VhnqD+EaTvZQ5wrv9jKIlYdd5x++M8XOJH2kHbxlvC5SyBsayc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=N8KJtPuI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 3/7] board/zynqmp/binman_patches: add
 zynqmp binman patches
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

> This patch adds the zynqmp binman patches that are already committed to the
> u-boot next branch.
> 
> https://github.com/u-boot/u-boot/commit/10de9b5a6a5b53a37600894115685f00d3bbfc2d
> https://github.com/u-boot/u-boot/commit/290385f374fba69f9c4f473c8bd25d64935a4c82
> https://github.com/u-boot/u-boot/commit/d92fdb60677b3990919a4216d3452418db215224
> https://github.com/u-boot/u-boot/commit/afbc1fa5f18a2eebf1cf06f62574016edc093f50
> https://github.com/u-boot/u-boot/commit/2eb8cd5bd4936a5eb2e77729855d946f6720921c
> https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - new to patch series
> ---
>  ...kbuild-fdtoverlay-changes-from-linux.patch | 198 ++++++++++
>  ...s-and-add-new-dtb-entries-for-zynqmp.patch |  91 +++++
>  ...for-pointing-to-separate-description.patch |  65 ++++
>  ...64-zynqmp-describe-empty-binman-node.patch |  63 ++++
>  ...ynqmp-add-binman-description-for-som.patch | 344 ++++++++++++++++++
>  ...u-boot.itb-and-qspi-image-via-binman.patch | 158 ++++++++
>  6 files changed, 919 insertions(+)
>  create mode 100644 board/zynqmp/binman_patches/uboot/0001-kbuild-cherry-pick-kbuild-fdtoverlay-changes-from-linux.patch
>  create mode 100644 board/zynqmp/binman_patches/uboot/0002-arm64-zynqmp-remove-overlays-and-add-new-dtb-entries-for-zynqmp.patch
>  create mode 100644 board/zynqmp/binman_patches/uboot/0003-binman-add-option-for-pointing-to-separate-description.patch
>  create mode 100644 board/zynqmp/binman_patches/uboot/0004-arm64-zynqmp-describe-empty-binman-node.patch
>  create mode 100644 board/zynqmp/binman_patches/uboot/0005-arm64-zynqmp-add-binman-description-for-som.patch
>  create mode 100644 board/zynqmp/binman_patches/uboot/0006-arm64-zynqmp-generate-u-boot.itb-and-qspi-image-via-binman.patch

> IIUC these patches apply to all the zynqmp boards (and none of the
> Zynq-7000 boards). Why not adding them to board/zynqmp/patches/uboot
> instead?

> Also, I wonder whether this patch should be merged with the following,
> where these files are used. But given the large size of this patch,
> I'll be OK if you prefer to keep it separate.

> Other than that, LGTM.

Yes, we are currently only migrating the zynqmp platform to binman.  While we
could migrate zynq7000 as well at some point, this is not currently planned.

You are correct that we could put the patches in the board/zynqmp/patches/uboot
directory.  I only created a special directory for them, since they are really
a new feature patch set and not a typical bug fix patch set.  My thought was
that the directory path would make this obvious to the users.  However, users
could also learn this from the commit message as well.  In any case, I am ok
with changing the directory path to board/zynqmp/patches/uboot.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
