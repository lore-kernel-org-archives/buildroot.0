Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B693C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 14:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A55CA60F3D;
	Tue,  1 Feb 2022 14:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-6O4CCuk2uc; Tue,  1 Feb 2022 14:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04AA60F97;
	Tue,  1 Feb 2022 14:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35BA31BF34B
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 14:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3178980A57
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 14:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="O/Z1Tu9d";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="gkC04zsq"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muedCEg680Am for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 14:23:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EB6C80A4C
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 14:23:50 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB55AC08B8;
 Tue,  1 Feb 2022 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643725429; bh=mZKi5alUTWGHeAdHY+U8+CQxPZhvtCjNOw7ZfW9wck8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O/Z1Tu9depnlSkcxCza6NG42QSq5NEs8NVNq65R8SeaIV03wC9vjV9/y6279dO8Lu
 CjwQtAzqhX7LRI1pi68UhGqqLHUCcllHHHKQvdKrsFOUA4dmAxm0OQNn1BFb5xWnH/
 9z24Sj8+mFuoUXMO1paTMQJK2tf8Om3jWA2MeSWvEKJ6SBfA2PIQ2wzpsmjjJqFPQP
 X+S49VwVgGRhI6LOUUvqbYCK0ITXRUXkanPzPTS7c2IUY5EgCtdGvtvW+JDc+RgQH3
 KWpkvVNTA68hIEM0dlO26mlijEeFWeUKIw211FE1nkKEzuRTR2StrvCbbGhqfTO8gA
 WXbelah5imLiw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 10DF3A0084;
 Tue,  1 Feb 2022 14:23:48 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id BEB1C800EA;
 Tue,  1 Feb 2022 14:23:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gkC04zsq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlpOPgZZK2KPK/x+jJnoWaSM8st5K0ROCK4gh1jgXSbMOiarHoPidlgC/P7XpH5yfaWBxj7dW1oXrCWqpnWi68VXFrQjqdzt7MLD/a+s04MSehWf4wFNSKt0nqN+91pcBO8X/vtz7mP2m2JT6oPnDK1tDcIhwiofQ5KRD98GwzR0B9ybTOzUKucYi4AxSZ/kK4xCvX7ihfywqNeAs/fpzv5a9vIBH2YWUFANmTAuQt8qUNODlMfW5kyudAozMA4DQjlAJRwpzRBXhJfRIkjwSSWzmepqQpM1HOA7usKzYD1xEkY1WPGBYn6YSwPRYSDaaXxp30PPOE5HncSXJifFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZl5IaCHkKBFuQ8No7Ck8Tl943KTxpbqV7FYD2rCtow=;
 b=ByeBEr1h/0m+B/AoSRXwERR9wMZUrjZgFS5P8wDXxnB+iNZHuM7FaJMBkAUNMr13INqzLLxakLwke9sDZ5riOmHlKY72GEhakqJ/wW/Jo799ZeTqbB6hvoql5Wtz4Cr+BusTyi5XaDNefchFklPTewTvy812VN+HpQCbBW8rzFLEM0C+3ChXG1zy1smpUnVeDQTQl3lBo+ShtDw/TCuvuctFHM+k6+HlXrCQV0W+fiLKZTWlPAzZdX3bj6iIpqKYg+0SzFpzHpxLWJuZOX7fiBCc8KrUJKFUa3P7AnYMvBLG16+eQkpNm1Ukxl6EZPvAcja8k9/IDzuNWFHek6ojvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZl5IaCHkKBFuQ8No7Ck8Tl943KTxpbqV7FYD2rCtow=;
 b=gkC04zsq5ztxqj4msYte0eE7FEcN6uC6o5jCEljsORbxac/gQFSyVXIp/ZHvDDa7kwyUAvpefIJhgDjEephneJINbN94oiOwXqQbySkTP25qno4l31aWw3PPDQd5j8ILcps+DdTPhUEHxf0sNbHAkxKHok9M7YGtEVpw//0zFR0=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by BYAPR12MB3272.namprd12.prod.outlook.com
 (2603:10b6:a03:131::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 14:23:45 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:23:44 +0000
X-SNPS-Relay: synopsys.com
To: "yann.morin@orange.com" <yann.morin@orange.com>
Thread-Topic: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
Thread-Index: AQHYF3QgLpSNOp8be0i0UG/0NFjv+6x+u6QM
Date: Tue, 1 Feb 2022 14:23:44 +0000
Message-ID: <MWHPR1201MB0239B756E843D8604AD86625A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
In-Reply-To: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52f0d6ec-60da-4f3c-0995-08d9e58e7427
x-ms-traffictypediagnostic: BYAPR12MB3272:EE_
x-microsoft-antispam-prvs: <BYAPR12MB3272A9D15F59CAE00B8BC150A1269@BYAPR12MB3272.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qraB9iHX+8sMvCGRuUa1wGkhHL5snGSVdPc3tWNZeEsYKctJRiQMXmvLCfzXrtHDsSBelssrtwG1sti2Qbff6qbTwkfa3Hx9LOU2scY9TlOdHoiuZaZkAnzwShTm5jrjVL0oUdrVnHaeDzMXPWD1VgNOhq01B822jr0mmI6Dj7sWUz1vAxUpgF/d+GkY+JqK4omCt5H4ygh6n/MaY3oVuY6nRejJww/mTIV7MF4S8+Yl71DgQu6nP+HJgcn39rE1PhJ4RFTaFt4UCRqEhDhH4tg0KTz7zSgF1sx3qWli7ey4aj5h1KGjpnZCuY74vfXUa1LNIHhqZlhe/EoulhB0eLcFAKWXCH1NcoY22GeLns2qkqMGcKfNtlGRvYftzSQW6Fe4x9Q3daGkPC/Aj+S8d6oVftAwuIExZhVd+9ozShKi0EdsqiuoW4xqW9zE7lX0zolOi0062XYCYm5yK5tlPPlvRC2+xdWLQPGGlngq47bUnSZEvwossnv61DuNv9qdI8TxvtNRu7282eMyr8AAX2QkdSGhFJhvx+osES57y7ig5DhppUaEDWfxXphLX79VkmlXm4hrwa3mub5R89TUswNi8YZWmJR8dV5ncsGCBee7+ruveKMfcMbTRZQ+wMQNiWny27mwUvlRLiF1mKqMNclTXlLAs5WvQhPTAtCpa2u6aogjv9wOPWZQkYNm6yVD7GsAmmtmyGIMwfuVgSPCMsCqS5ptpdXAhHJTdasGMMR01eWCfo9xadVf1kRJVuk+ThsBUojWz/cF5VmtDWgIpWiZAIIbLw6TAniebk2+6Lw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8936002)(8676002)(66476007)(66446008)(64756008)(316002)(66556008)(6916009)(54906003)(38070700005)(91956017)(76116006)(122000001)(52536014)(66946007)(86362001)(5660300002)(38100700002)(508600001)(71200400001)(55016003)(9686003)(26005)(6506007)(7696005)(33656002)(186003)(2906002)(966005)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lW8Cj08wdUdEAf9k8QcON8e/MnMOt+ebkrZE4Ag4i7kZD9daFk2VCPJelv?=
 =?iso-8859-1?Q?7XuU2cXeXZ7sf/2aQfk+UDtF8KuDZYnXHKdektzLmVDJK9SN1luGMzhQ9i?=
 =?iso-8859-1?Q?C4EOisZI00wUAb4Oed0ZffcB6FpBFHeyAZ0GtotIFZfEO9U2vzP+Q1WocU?=
 =?iso-8859-1?Q?4UNLdseBmqp0LmENm51bB9ku+GMe902n6nvMUthZz3KJZ9JwJiR0AczR8O?=
 =?iso-8859-1?Q?PhkpDZw7UJ8A3+dXum/vHq4HMdK+wOPZKKOmHGusmCgPBIJJKjwgU34sGX?=
 =?iso-8859-1?Q?/gp76gGOr+r9SYUH6r+6yfLzz3fwrr78CYHyzT/zwNIIQWRblfWoV69LLb?=
 =?iso-8859-1?Q?NA8eB5J+gCsiNqfpCRAYabv9sSymHCW9w8GQ7a4lXnPXiAXKhTw68LBHtn?=
 =?iso-8859-1?Q?3qw3myAZcktso5T56selBWnhP/m4TSMNXgFGgITbOOHqswDa7a3mA3GMpa?=
 =?iso-8859-1?Q?UJ0Sn1jdl0J65dJap9fX+CfhVcmVwAR6cupcUFU0fyLkckonk0o+nYfBkK?=
 =?iso-8859-1?Q?NaIvcfIb+W1pQsrj+xRojcsVDqApZfVeenWfv2htjp5aTdyNrOgf2h9Jdf?=
 =?iso-8859-1?Q?vKMDTngqLpebM2O+2OR97FikI8tK0rUoyvwdoFte0+inm7lUIzyohMsLjX?=
 =?iso-8859-1?Q?GaVwqiAsqfDoxiqbfV4HjlJdP9HUg70kjZ9vOPWVFia3y57I/3yNfzqJKL?=
 =?iso-8859-1?Q?pvoacjfm16GnLoEiAc04Xn5Xz1mVZIdWZcxDCGYAfDAwd1Fr22+HlnE2dR?=
 =?iso-8859-1?Q?xiYH4Bs4OkL1IyPkXxbmev99bp6G3m8NmV+7ikwCrCCM+X1H6gZj1mQAMw?=
 =?iso-8859-1?Q?vIyzDGHkYrkCYDQFLxnFalsJW63RbsMSgXmXlgTanaFxDeIs7kDAtDmHKx?=
 =?iso-8859-1?Q?LAz+SjY5EdH9LK6QFz5LWfIP0ZQ5ZVBc2RwivewnRAxMQDMflDcSqShMJL?=
 =?iso-8859-1?Q?2tNi/iep7JXEnwJTQoV2OiIB7Wce+5gLzH2mloie1GlPWLF6VOtfOBc1Lq?=
 =?iso-8859-1?Q?dMx52DQ/DQ2UQyXdKzANyxbIfDfGUEwteZRbASrRZdtK7my7oLPk3yGSJM?=
 =?iso-8859-1?Q?iZmpPy7Q18xY/4tWFG9izzDLmkfjDXVzzAVkyEaf53EVVu9IWNm9V6okHh?=
 =?iso-8859-1?Q?akV7xbIVwa0zny+xvarAi6t8SoUbsIrcu6NFzeesG7n7Re7jEJ7AlfnIYk?=
 =?iso-8859-1?Q?uRLfZmvtshe/91ZqYO1z6hTXWsAQoDOErY0dj4SDr7jCGiPddAN1jNhNKu?=
 =?iso-8859-1?Q?XeZyTBwXhWnXdhfkbVuCSidSqxj8554BnWhMhO8QJyTYcT0hBw1cEytPrK?=
 =?iso-8859-1?Q?WBVQEEr3QCHJd8z+87LTxktk2muhtxDCIYaPv9sivrHuu84YF+I65F/wQQ?=
 =?iso-8859-1?Q?uI6RFYrWSOzsQPknf82Le3e5zL0oj323fYGzv1CFKdLKz6A5Ij51+yARWm?=
 =?iso-8859-1?Q?NbmdzE1jQMiHyUq7cLkMZv+Ftxpv0fuTyVZaPeeNbACfKzhu5qinZAAq1w?=
 =?iso-8859-1?Q?keqMcMF+6g1rlpXezAIta5m3bQM7k5g7ad1b/GI74HoEFlygobg1sRBgkl?=
 =?iso-8859-1?Q?EuDMTDZ0zdemAdjGe1DwqUG+cW05k1Lxqmiy2kRZ5DRQI7TNjcnQDWXuVN?=
 =?iso-8859-1?Q?ggkAz4Z0oUdHn6TVfBtq+/rUCKnVyBMdMeRs5t8SUQ8p7/AgRQDpywo647?=
 =?iso-8859-1?Q?bpdgIH9oF6JRu0avxn0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f0d6ec-60da-4f3c-0995-08d9e58e7427
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 14:23:44.2249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDAWeQwtZ5Yjh84G7sxEE+7sxT/Uv04+qgRByMrOcqODulaqMiO57c67+lEqoaXrE0y1BsSYH9OCtppU9vqpiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3272
Subject: Re: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Frederic GARDES <frederic.gardes@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Currently, we configure glibc to not add compatibility support for
> kernel older than the one used for the headers. This is on the
> expectation that the system will never run on a kernel that is older
> than the one used for the headers and, when Buildroot builds the kernel,
> on another, older kernel.
> 
> However, in some situations, it is possible to build for a generic
> system, where the kernel may be a different version. This can be the
> case, for example, when Building an image that is to be used in a
> container that can run on a range of machines each with different kernel
> versions. In such a case, it is interesting to build glibc in a way as
> to take better advantage of the newer kernels, and thus using newer
> kernel headers, while still allowing running onn older kernels, and thus
> carrying more compatibility code.
> 
> We add an option to glibc to be allow the user to provide the oldest
> kernel version they expect to use, and use that if specified; if not
> specified (the default), use the version of the kernel headers as was
> done previously.

That's a very welcome one as it bites us all the time we try to run
more recent rootfs with some older kernels.

> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Frederic GARDES <frederic.gardes@orange.com>

> +config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
> +       string "Oldest kernel version supported"
> +       help
> +         If you plan on running on various kernel versions, enter the
> +         oldest version you expect to run on here.
> +
> +         Note that the older the version, the more backward compatibility
> +         code is added, and the slower the code may get.
> +
> +         Leave it empty (the default) to use the same version as used for
> +         the kernel headers.

I'd say there's the third option and frankly I like this one the most - default
oldest version assumed by the glibc itself. The beauty of it is it's really the
oldest version of the kernel which is supported by a given glibc version for
a particular architecture.

>  config BR2_PACKAGE_GLIBC_UTILS
>          bool "Install glibc utilities"
>          help
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 5c26b0e6df..43015417c2 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -98,6 +98,9 @@ endif
>  GLIBC_MAKE = $(BR2_MAKE)
>  GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
>  
> +GLIBC_KERNEL_VERSION = $(or $(call qstrip,$(BR2_PACKAGE_GLIBC_KERNEL_COMPAT)), \
> +                           $(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
> +
>  # Even though we use the autotools-package infrastructure, we have to
>  # override the default configure commands for several reasons:
>  #
> @@ -128,7 +131,7 @@ define GLIBC_CONFIGURE_CMDS
>                  --disable-profile \
>                  --disable-werror \
>                  --without-gd \
> -               --enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
> +               --enable-kernel=$(GLIBC_KERNEL_VERSION) \

See [1] and how "arch_minimum_kernel" is used in [2].
I.e. for that third option to work we need to skip setup of
"--enable-kernel" completely.

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=configure;h=8e5bee775a651fcbaaa96ede8039ae1f049e296e;hb=HEAD#l3529
[2] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/configure.ac;h=197b7e66c8fe6eb0a1136c992478b9a2272713e7;hb=HEAD#l30

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
