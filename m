Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B497C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 09:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17BDC8195C;
	Thu,  8 Aug 2024 09:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwL7W4xJaO_h; Thu,  8 Aug 2024 09:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6138196A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6138196A;
	Thu,  8 Aug 2024 09:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 351D51BF369
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 238518196A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzBePiEnL6sw for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 09:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62f;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 160AE8195C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 160AE8195C
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 160AE8195C
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 09:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmSk9Oc3+qV+jaMJ6qQRJbGY0VnQ29SA2x/MP1+KT1/IVhayyfb/XYxJ+q0/RekRWROnnKlXF8VLjsqmB/xyrQuMsZW+by3huQKfSM1FYJRbOGarpQmoJP2+cAFwVcmfeEAcrQXun+cerZ6YxtP0lcht5mgtmjUiEUXM70edntLP+3TN6V/W0C3MpJhANn9RxgEgoqlEuGj3Awih0MyWBmDyko0R0bg3FHl8PFlzUmHcu5R6iv4mjt+x2++S5r0ZQQ63Wb9KlrK/TfvTfqWlJdB9pX4ZDkzPPSotKRi54q+YBn8eOEudhJ+lxEIQiFZQdNdz32XBFj0rfC/2SH7oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB3YxZmM1uENm4iaeQXYTYO/DMFiaRoXtZmLfIgry7U=;
 b=IwqiGrDqT1gyz/HsfPzgQzuQPyrrbFCN+eSQ0Q1xH6NG3Iek2HADFx0CdgX3pEYPQ/vuIiI0ZfhQyOiMwpcCGxlHToiDqAt1aQzwpp+/E/mw25KkLPiJUFZpZhfnp54lo0CHw/DQA4eTBDprLcnuqao32/dMYm2nVKDl7BT5uLm70/yXxDr5O4NyKqZY1GktMTaoGH2f0PIAkTbWULMELa0qFFT8Fx2hobe9rGei2eqNXrNL5BNxy0cNziulOfmlbwoled9ZbuncaCAXwo04UMC3Zw0i8HlHlIJAA973MNN8Ob1laArh+h7/E8n/iUJzx2ytc2P0OdrwY6b4x/+ssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 09:46:29 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Thu, 8 Aug 2024
 09:46:28 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
Thread-Index: AQHa6Li55XsRTBDAbUymX+ME1mR6K7IbuDoAgAAhcgCAAAEVgIABOOAAgAAHiwCAAALMoA==
Date: Thu, 8 Aug 2024 09:46:28 +0000
Message-ID: <CH2PR12MB5004A33CADDA0430ADD71D14F0B92@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240807162841.52d0481d@windsurf>
 <CH2PR12MB5004FF40F90027519556EDA6F0B92@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240808113530.5b33a347@windsurf>
In-Reply-To: <20240808113530.5b33a347@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB7440:EE_
x-ms-office365-filtering-correlation-id: 9ade871f-10b0-48ef-6f7b-08dcb78efa13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Jeef9ynYNQI3/eu+wZlOgf8kyeNHb0CfhOfDJd+cyk8RXrp35ah4k2kvuzjE?=
 =?us-ascii?Q?Vpmmv8kZJZ2yUk/RroemNUv5e7O2vblgUFOnODuwQrmV9sb3YQGNh9dUXXIn?=
 =?us-ascii?Q?Ht/ARxPemW5V1E4vPSCLBN2zROHIqQLuTOq1SMNXsDBb3tdmdBnU6nWtxZgl?=
 =?us-ascii?Q?f9sK/+8Pi98jikF3wurMWc/6AjKGyGYaCIxYLSDN93gW/Vm6kwghnmmddcxT?=
 =?us-ascii?Q?132zpYjkb0JC//IhmeDWWHCtiG/ZXOD0UpYcKW5U2oRm+mJlLYPuMwegsBpb?=
 =?us-ascii?Q?l1kqSO527FVZQTp+87TzmrF6CAMcN6qxhPZCP5mP5sv6jbg64t6y85gEl7mv?=
 =?us-ascii?Q?ukRYTQm/I3+HKz5r0Yet7RNiF2TeqpzBHKQAsi3NkoMuNgEJPQKkq9jzYfpz?=
 =?us-ascii?Q?A9dfPseXT5DgiXeszJ40MpKwhamHQcJxqjbzEEte18Q7VNvckKhCgIeYaLGU?=
 =?us-ascii?Q?Zm9ZNe3Dz5JlPiZd+oZGzAiFy/qrt2WOFs6IDDaapZNKqfUnaIkfcjit0bTH?=
 =?us-ascii?Q?CMR1ss8DNcQ4bdDldpzhwMFUe9PFi+6mT2kGVkr6H+rMBwYTEYfeZQdfEapR?=
 =?us-ascii?Q?hjCpz8Gv98S/RrHE4Vju/2H3PxkE56em7GjpOzMHQsjDtaw6+b7dAXkpFL8l?=
 =?us-ascii?Q?X8HsPRyhywjTKYWAcdk+aOmZEq3MUkSm4Y4hxB6YONhjaa3du7OPBlalUw52?=
 =?us-ascii?Q?QIF+fV1q12aHhBLaP36qVRj7cIa/ZDrvRyHvuKB3fft7W8jYYYhBzhB+T6dH?=
 =?us-ascii?Q?8zMHJMzggiZOBjFNL53z9eDzVIRHw1KRHEfyreLYaG/BZCiEX3GllJLAURW2?=
 =?us-ascii?Q?wMFQdFNoC3HfZ8KF5Sp+PHiNTnLDm2XHE6MiE7h2Y8W0puM2gUPYdMA6+/uR?=
 =?us-ascii?Q?EouxB74C/q0JP5PkpfQZLs4OgTuMhBtNNCYmDNAINV0aO9KF80PtFB/n7VoM?=
 =?us-ascii?Q?iH/5Qj6REnlDGKgi3/dp4k0rlIM+W/OdrUKG855Ho6xXW1yBH2dkSosDuANw?=
 =?us-ascii?Q?SFdG7dt4o+FvwoljZiGA53seu2WRk0FA8H/QsaTVGG5tgZOWafYAAnyup68P?=
 =?us-ascii?Q?xrn4uk8jvti7e23NNIfQXemcYrnwZq/7QR3UTaKu8iX4NHp1w9wpW8VngmdT?=
 =?us-ascii?Q?1Ix7azZIlgyOgUkYNTodytlwtXw+6uzCbPQZ06PK294UzvZ5K81WOyFOem4X?=
 =?us-ascii?Q?pgVkgPnBpTh/OyNtqdMYrCqoIgaB/1fqXu+NWRLULMMLaUerPDq+DgqRIDTN?=
 =?us-ascii?Q?lCAtmD1bstyZb39kNen+LsYkVTJQ8IXAaYr4EPMjpeXSQ5G9YhlEIUcF1lQn?=
 =?us-ascii?Q?CzoB1QTH49E0wONA0wqzZ+0ZYj3K+avFxn8qU5hvEJ8qbWGYmfnJs06T85FD?=
 =?us-ascii?Q?01gJ5A11tjJT/PRy6qrbcQbp03KVySdSsUvNPZZeVTieH98bvhMkoWS75Pby?=
 =?us-ascii?Q?9sdMMsLJuTX/0rbNpGRGlddLIj7VELm1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CMmydR6LFODmqIcV7ifbEP67Q1NNSVtwbITVtxAkEk29NZgXJF37MfwOeqCm?=
 =?us-ascii?Q?Bfm/RflX7xfAFHZE7qh53yJXAzLUBbophoSiFVw0yopsilb0alRC1SuhIuhk?=
 =?us-ascii?Q?d5fcLTk0vMFe3OAamgDTfN4PsEtulYvDuZpUA7hS3Oxax4I48vu/LjFS3t70?=
 =?us-ascii?Q?8Eu9TbV4VFnMb/IdZISeQvEfIsSAAwatIzZVOSf35brfZQH3aV27zcPsvo7l?=
 =?us-ascii?Q?IJfnu3y1L9BmLZA9aepB3p8QnonCmO4N6pRvoEX8472LzFJrs+48fmzyGute?=
 =?us-ascii?Q?r4R7EUR7yNNyo5UQvw1cgFlC2URzNLYSaWjLuDORNNFwU6EooAMv5smfOoyr?=
 =?us-ascii?Q?eCNf6L/66BTKHBKow5aAeZttf+xLz9A0pAaSZqeoY0S7A519whvCUBiVvF2J?=
 =?us-ascii?Q?Qk3tixCIooxAp83IaUsR4REA6dzYmtrPvnO4jJ1QTprvNJS32vLXQvkjsry1?=
 =?us-ascii?Q?/ERvHK3D/UKMdef/mhjgwI8ZlWMZJDGJw5zCrGr9XGPB1jKnHZ+lzdyFL+Ro?=
 =?us-ascii?Q?BemYXufrCUC4nUv5k/YgaCqJvqVBsRElzM5LvcRvR9c7SJCYP442fGr9hGpe?=
 =?us-ascii?Q?z4ZkrUF1kWmlcUCrKTIzmLvXbtnCzXLy6IniVEYU9rREzRfMK9ebhNOw2353?=
 =?us-ascii?Q?/m10vkx1gVWwFkegQUM9xy+mxcbrOL7sNde+8xFR7HaFBIG5FhxyZBfZcrge?=
 =?us-ascii?Q?84wge8PufpfvnbjFTbHW8/t5xLeJmD7fFunRGccmU9b3TSRA5qp2p7gUHHwx?=
 =?us-ascii?Q?/omKW1siVVoO+x7/qRRueFHoA8WJuPixONlG29LVckts36QwM3f0Ogyqs8z5?=
 =?us-ascii?Q?8Rj18OSmd6ComXdfPm/ipGSAMUde9plgetoYZUy5LXGoJlXLmjF+Jhn1LebT?=
 =?us-ascii?Q?DK8etOO81198BmYswk+9Wp2MQJQkHCze83YVxWG7y1K+MaWg0adXSS12Uv02?=
 =?us-ascii?Q?l3/AGuAhGk4EL99fuZcDqFhOybdgGJ5wNZnqhBs3/b+k+23wwh7xCNtr1j/W?=
 =?us-ascii?Q?oSJc26lifA5vLqgv9GsOyNY5AvEBq3UYUG98057R35ukxFnoeBmJqmqgn6WM?=
 =?us-ascii?Q?Yoy7vbxU6ikfF4gL98nWV/8kw6g9cx+IBNhkvNfvga9qbLA8gSWKVPL8eZ5x?=
 =?us-ascii?Q?gVTATwISIn8cZ7cxWY5OgAlLi1BNMmv8GQGT7cNBvV+oQoE/gdtnscMpjSSa?=
 =?us-ascii?Q?YulfV1VJp8cpCx0LvEElE+kzdArkNLcEAJsk3Iu0TcFb36yNw8zl3wfb6Zkl?=
 =?us-ascii?Q?gQJPV1UiuU/fykwOVsjh/XGtoYNaCn/sjQMaMztKJQbZl5suyPSD/V30AnyP?=
 =?us-ascii?Q?ax8X7nUTLhoJ/XXu6JLflm3yXn0X6waLzPs6G5mfeXZvzrR7eXGtg1WOAZwJ?=
 =?us-ascii?Q?MLWKZGnTw8H5DSfqhNkapsABZ10aqNwqSAaiYilRgtY1xnqFpVpe1acfBSCf?=
 =?us-ascii?Q?90wQdlPf7zWIa7/ddHRhgd3dYWqHxIZ313rSMu/Oh6+AKwGJKzG5pe77LNUg?=
 =?us-ascii?Q?ezGE2kN771/yOgwIy1hlr0eNCFB7hGpmIwuu9oJx44WDHUOVGWfYRQUDzDOF?=
 =?us-ascii?Q?xan0k9wc+wzq1NwKEH4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ade871f-10b0-48ef-6f7b-08dcb78efa13
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 09:46:28.7968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwOFrjcT8bWmgQrBVANOE+9nHiG7PnJN3SVI33kOfy9P3tztTQaXojgZRxVqIVnA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB3YxZmM1uENm4iaeQXYTYO/DMFiaRoXtZmLfIgry7U=;
 b=gXtz1LtL4mko4VWwyGM4AfSBaI3fOe68uS5Po86o98nHsf1pdSNK1RWIleaPNf9eIg5sZoSzc4cO18PU4uOfpg+mfORkxvMxiGaTN1o9IjyYhtzq7GhlpfsXp8jiCbD87aAtfYAdj6UsmH2+Cibz1BnmwGMFi63qlmcoPshRebA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gXtz1LtL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> We have a better solution now.  I got our team to re-do the release tag for
> Linux 6.6.40, so that all the needed patches are included now.

> Re-do a tag that has been published, arg. You want to break build
> systems like Buildroot? :-/

The tag was only published yesterday at my request.  As far as I know, no one
was using this tag yet, so changing it should not have broken anything.

In any case, now that we use hashes for everything, we should be protected from
tag changes.  If a tag gets changed, the hash check will fail.

But in general, I fully agree with you that changing a published tag is bad
practice.  I only requested it this time, so we could avoid needing to add a
patch in buildroot which should not have been necessary.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
