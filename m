Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1219FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8DF60F7C;
	Wed, 23 Feb 2022 14:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzFR1tSoa0rA; Wed, 23 Feb 2022 14:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB2360F76;
	Wed, 23 Feb 2022 14:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2026F1BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A4E24039D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZIfLzmlq16L for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:31:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF79400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOCxygOPg4/oW1EUeMlXkgQOukJFXY39qmnS6fOHHSgLepgWqTaVlfjJ44qjVRshF/4npLmgqy9O+Kqz0AWCdV7EM+dCWUA77moytI//7WWn6YOLC7js5qFdZZukOo8WwiXWgve80cyrYR6Uo0lVWLU8ZPy39zO4NmAQyFVW5qTwjPI4vqbTceVgVi4FmlkbMCqyJS9yyLZa7Rg8Eo+dM0WDLWGONvGaqhicGyT9q9o+b6L6MUKP5lPIYPMH6KhnVBeSObZ3DWnRm6lkeenr556a/ulRikakeqb3RLBJlLztUOsyNgOqu8kHdIqBUcori4NOHvbuiY4QoV2/cPXNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNhjnTpmRI+7YanLhkM7qy4bHbg8u1A4QKv2LjaogF8=;
 b=I0G7IY52fv0vbOtuuH0bKivDFaE6j1vOGFyCDhntg96WgJIgHQe7ydoKNFVx6AuRB0BDjg72vcdSAQMIQhcn285pcg+zr4CW3Fnr6dEnKp/reNCIPStyi5seZmReL9tDU7Ogi3O+9usqur6drO4U6TZ/9s2M3/nu2rnZ8nFAqJx4LwVz2hxzXJgR6LPZHtzTTMQGcpNlTa4XvZ0mlZaKOtiF7bkntwezqjz7c3pPS0BS3HnmjSa9aLKsNjxeb9If+NGjgD7TZwZqk+qVrVg8s3SBQ86mzrgfK55KEGLKpHu0VZ6nfIBc8cTeEQeatZ//QsoZiEasBvCh8U53Kjb2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNhjnTpmRI+7YanLhkM7qy4bHbg8u1A4QKv2LjaogF8=;
 b=MYTobzVsnxqrGmPejfVPPqVIGUUnBNMKX+sLTnp/3rBVuK6m6mcg6s087vSBRGfPbfWI+66OGO703ej633wxYon0O1ruwyNItoquN3KbHNjfcoSqmJ/O9GBCfX+eN7ZPfxio3Dg1f97fNK70v+skd+k+/DWoHeZdEHRiyzfaQNU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SA2PR02MB7612.namprd02.prod.outlook.com (2603:10b6:806:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 14:30:59 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 14:30:58 +0000
From: Neal Frager <nealf@xilinx.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKLQagJosdMgR7E+1YH+HJPodRayhMSOQ
Date: Wed, 23 Feb 2022 14:30:58 +0000
Message-ID: <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
In-Reply-To: <20220223125118.2325363-1-neal.frager@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345ef811-d33a-462e-d702-08d9f6d91bd2
x-ms-traffictypediagnostic: SA2PR02MB7612:EE_
x-microsoft-antispam-prvs: <SA2PR02MB7612FCCEB677B9B6406E23B5D73C9@SA2PR02MB7612.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tli+WUjkLo9dYQSmOL2YnVfJ2CpZ/vq3gqgK8T9m6wEkrnGdVtSjivieqfrj82zr6L6uCdK92f0YtnH3ODQ1nFAJMUNbHtKkI/90305+HTszgVeoZCZfjN5BFx4LRXrC6lGcZA7XkRSRv+lGqxtFZ+WYmGPnd5dhXnrJAa2tC21UtWqP6bLI+B31ooqz7r6feov6sjDWFuUdqthe0joHmacudzNDSPGy9e0wEHQDRdWywo7Lkb+zgl5mBN8/BvrHekY4qKaE47RORHMZrlMHBLW1pYBWr9oQse57xJ0YKEtFqok+aLht+8gzN7hISDLOTgSJcWCajYW4p784cuOgafCpYYdiTYyhEeTprjk4VGqlxHgMEBlvi3joRU5HSFQXmK2Bfg3+OQ+Tx/ozFzPDDVuOyd6WYJxKENmUgv86S0XdDEbxE/0NSAGt+IgfwozjvXFw7B3bZaEkGw5DX1qO8gBZQfuBoxysJPt9vX3ZUAdsIzr2NJJNYHxm2Eyb1e5OCgslVbDy65osoML99EaSEbfhVb3Sw0pqkY7PF8lSj0NaJCk1tv48yS7Djhro1VcCQPgU0Egu68QU5NvTBYvw5W8a2GjUmC8fv8sBzrFi5KATIMP5CeDXcw8goWy883bQ66rLZP4Gfm9V4U8Zxnww3OV/BeqcYMl/d+0zuIiESewVIo98DAijrBwQYlLXj3C4rKfTTPues8q74W9HoGdqCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(8936002)(4326008)(52536014)(38070700005)(5660300002)(33656002)(86362001)(55016003)(2906002)(38100700002)(66946007)(9686003)(122000001)(110136005)(54906003)(8676002)(76116006)(64756008)(66446008)(66476007)(66556008)(316002)(71200400001)(107886003)(186003)(26005)(508600001)(7696005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?efUwvzcxwWzmIHo+0x5Ihq5fdLTyK1viomsb2vk2G48viy45XbALQsOrIDxT?=
 =?us-ascii?Q?iLkRhh3ifyO84jbzzz5qpRATrnvoBJdEyIMghtUzCY72DfzYBILxJsC5gQtB?=
 =?us-ascii?Q?7Ve9y843EtKwEm+WO804d5xGihsqeJj4olcf9sQ7vOtf9K/zoWwvUJpTolfT?=
 =?us-ascii?Q?+R9kimZDddzb0GT3+RNdiFl6FrZikBh8ipQaOAcbSBS8UXGSJ0sZYF1E9T4s?=
 =?us-ascii?Q?LkwOiurLmHJCp0pdrl7fjG1kq73yRocWirDpbLfuueEEUXRUSuMbmcdQuk8W?=
 =?us-ascii?Q?NeTzOO6ic+5mXalTtC3IfhU1BSBO0qdqCvWkXmYMuK0U0U6kcKfykzvBeUxf?=
 =?us-ascii?Q?4o/IwNqVVd6Lf+q0dzmhGWJ0BcwhjZvedOdM9HXLuAcW1Zd7WV5u735rQCzg?=
 =?us-ascii?Q?yanQGoydIy/Rq+dNAYfEwR7Mxo+ngAdqGVcFcP8Ls6aTsg9UufkRqiimkN1D?=
 =?us-ascii?Q?nPnXRKJ1MLpxGlXl5/o1U+doPSEMNIyvrtXUAOTzpv2zG42FZpxqjjATy6yD?=
 =?us-ascii?Q?9xsfyw1sXShzmDpU2k+OF9tOjaHD6zdPVh6zUeheOKKSOvhXOtd1XhDJJkU9?=
 =?us-ascii?Q?g2B70CUh3H0xZquDAiu4f6Ck5MOWH2YM2hdpfB1LY19KyXTxiiZDqf8VJBT6?=
 =?us-ascii?Q?E0/gqxR/8pEwLAuwWGsKdtORXKQjzj+JYCPmNFxAWJlLA1ILQMJXWCGnQK8l?=
 =?us-ascii?Q?xMMggGq29uX9FA7d3umf9MtjcYGgNU5dQ6NtrjxAFlzJYr2Flf4JYdmzi8Gk?=
 =?us-ascii?Q?OOLiDCAfYlVpisWRUmujqBRADXh3V892fiyQWbUdl6hdm9pyOnvItNS2TtGm?=
 =?us-ascii?Q?3CgIA7qQZiW1pcUGLPxlgAL0lYR7e2BO1clWEeaEQ3Q0dTgeBl3EvPemt8k9?=
 =?us-ascii?Q?Lv4/jBQzDiHYPmya0KUxzmcSqwm3gyqB8aFl2ojG+6sGZMPWLpmANd5BoPVf?=
 =?us-ascii?Q?c4aCkAtliQqNWm2OO0XKyqCz95WMm5Mkv2depaGncjgoi4QSZ7/rrubWKwWN?=
 =?us-ascii?Q?zdr+bmEUifOeljzrR3Oos8Y3SWNSaX3t+0WU3shcYTv7jpjPGy7NfW1BRLmZ?=
 =?us-ascii?Q?biz2SSlXa0XRKWB87g0i30k2QxbxIu2o4pVl+sJnzm41Mafx/2yfJuOcK08y?=
 =?us-ascii?Q?XkvSJpN6qZfHvBYrT+7Q4rRq0yEySCErywlf9lu+ll7DBJRuDVH7ei/JqAfL?=
 =?us-ascii?Q?oXFpeywB4A2T0YP3ggBxo6RviO7vtXh4MBIRyVjyiNzpSaMMkwZ7YdRsTK2H?=
 =?us-ascii?Q?LJNkmEAXR6AsvsiklkEBEj5vvi6ZW9ItyxQ5Wa7SQ+J/ABBd3JVJe7WNS/Dy?=
 =?us-ascii?Q?IuNj5leXtzKHWoJcm7w9nnRfotiR7JHsk9b+zODUWFZjJTUvTQe+8zRs4rTo?=
 =?us-ascii?Q?qn243qIU4ulXgpOZTOn2UHjR7VEjqtJ1XlJDW5mh+KStAy5uw//fIpS1WVkB?=
 =?us-ascii?Q?DbtrLt3ITZPPwr9bERM9kC0eXxPrr2XrUUKjuM3ZOPiCxevGTIxbThKqbG2Y?=
 =?us-ascii?Q?V1GX/2j06xw5kzjVIf9+zdwWbx8QaSKX2p7LMtwKN2JYj/9FR4BKtcsPMpIC?=
 =?us-ascii?Q?MuG+NYb38G1UEZWayjUmOVf9//NQpsN7ppRbY22ttu88tUgYWOmm5HADDtHj?=
 =?us-ascii?Q?Og=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345ef811-d33a-462e-d702-08d9f6d91bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 14:30:58.3524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bT6M19Q/EvehXTmdJLSNYrYxOru92YF71PxFkmsaThx4MefWDeam5WgxD8YSgClNBEjwGHc12PG9UPhnlWORAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7612
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

+++ b/board/zynqmp/zcu106/uboot-fragment.config
@@ -0,0 +1,2 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
+

I tried your method of creating a uboot fragment config that just modifies the CONFIG_DEFAULT_DEVICE_TREE.

However, when I build, I get the following error:

Device Tree Source (arch/arm/dts/unset.dtb) is not correctly specified.
Please define 'CONFIG_DEFAULT_DEVICE_TREE'
or build with 'DEVICE_TREE=<device_tree>' argument

I can see that the U-Boot .config is correctly modified with
CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

But it does not build.  How did you get this to build on your side?

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
