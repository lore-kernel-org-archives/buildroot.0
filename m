Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67307C43219
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F325B41517;
	Wed, 23 Feb 2022 11:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQwKEofWDxLN; Wed, 23 Feb 2022 11:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33AF54150F;
	Wed, 23 Feb 2022 11:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9701BF868
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3688882591
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kd1VaaF8HiMc for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:27:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F87082572
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as2n1cP96jLbjlQD6XP51Ny5/shMOEV1WoJyrt8XSfJi5Vq755ew7jFvCr9lVHQndoF/7vCa4M/Mxl61nl5T8RUJ/+gQHBKbByjLPDC90CHwMO2t9ZbGTkejbT7XpoO4J41aehgaq5QnVLa0hfZvUX99GfLODY/ovNsSyqKq4wjI8uJ9JkNMow6wcxZOgmbIHEsVmylrz7xwclXiLtPXlYlA8t6oxn1TFnJ6tUJ5hjkth9Xno8QJrmAp4PiprEBFLmiHTnZlMT6pugt2QmM5B8hLa+6U19OwXt1paRh7HvkKG/R175Q4UwFBxCkbm4SF3Vyl37Gri92nMNrKZbZDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+e47lhgu2//yg7I9AztEU06F4jW2jbaQ5WlpnOUGak=;
 b=VHGCXPP0F82eiRNlJ4Yith2GQFyWl16cwakxjwzhzIqlSYKgps9IBMl7H9MbYVFxQpBVmx2TTZ1NTvc31/3nJUTJPvS1HdDi6XImdvNb2m2YuDg7wE/Uv+2py6e//7jwz7UARCaQNTS7YJIF0BU2t3oTRT/VisE1birAE5evHUXIAWoh3pkp9J7h171gik1FvovNEbYecD8DzWw5FJQjTeuTFVKDvpccp0f/kY+Jv6k2IoeKg6FItjgLJv1UR0s/p8lzp90x8ZembeupECZs8WOuK4qovoe2tf3VtJhKlAhzTm9kbllK5ADqKkdr1voaYoh7/mU6KGFhFQeCGfCQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+e47lhgu2//yg7I9AztEU06F4jW2jbaQ5WlpnOUGak=;
 b=qCwRzxIZP+niHR2blz/bxvbzbctzuezMvC8KZRDWAH/a/nB6OiX07Uq7NXaDz+vHKj68xh9wWJTtP/tlEStjMQUU8IGn+YhFu8Hgq85NdiLSeq+65UF0aEir+AB0dQ0P7g7H6/kVunsWUnoQK3KN5lmHpU38YDsXnZkwnjY+Kf0=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MWHPR02MB3295.namprd02.prod.outlook.com (2603:10b6:301:61::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 11:27:29 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 11:27:29 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP7iL0gBEM1XGAAA54UIAABgnRgAACVkA=
Date: Wed, 23 Feb 2022 11:27:29 +0000
Message-ID: <SJ0PR02MB7758FFADB10D5A112240BAC9D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <87pmnsnquv.fsf@dell.be.48ers.dk> <87sfs96gqj.fsf@dell.be.48ers.dk>
 <PH0PR02MB775035975B305CECD5D842F3D73C9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <87fso96dc6.fsf@dell.be.48ers.dk>
In-Reply-To: <87fso96dc6.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95001cd4-358a-45d1-5bac-08d9f6bf79ea
x-ms-traffictypediagnostic: MWHPR02MB3295:EE_
x-microsoft-antispam-prvs: <MWHPR02MB3295C9DDD51C225150789AD7D73C9@MWHPR02MB3295.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JrAgi6wD53R1dzY/CHRG7RpnSME4ekRg4u6Xw7AeFrkwpgdO4gfDvJyNik2JTklZGIW3Ha0ZqAm3HK+xC1oGWRQyqdlISLM3e3m75zLPzF4phZH8KstMP6RDEDXZVK56HHxA2sznTy1sttKj9LXyxGdRXoO/3eQweH7mQ6Njn7/tJlRuUi7YUGM9pQmAhGrCDHa9O0G1KVZC6EXkwJJVQttKVfV6EULM6fMiwEj7GMxazAaRBgTOkVGL85GZubAKz4M/x5Nk6+wUbYj6UO/p1QXCOAyCIkvr++K8+lhuYfEPbY3eibR6AoXKCKtnYYKfc42YPJMxegsO5v1QBjBf7LPJ9orBCXCge7qVFB2T5kctPO+CROZvpPZbJ4BndzSiKHPuUq3ADiqDTy89mYSC+RWn1HnSpt35exWSbPB2njo+Ibze6j+LiXHZFrRgLTOhdbtuIjgXNpeQurqacUO4LA9qBX2kf5cmc6F3AmcMRT1scB/EVMxjVJCFNWB4cYrf1VtKQ6h2KCWrM6qhJ8u57kgmgi1ae69PraCZ4EmFcSqnE2qw0z4A7RKbF1rIC6tUm9B2Z8MsJrJnZzYCe+zVyDPN3y+gFyIEOV5zYnakUuXwYr8siGniwQIKRjzLRBXgF5OPet9A0Ta3uOTD8x/8Y3td53mbz+Vsdg3ytZwQGj8nkYdNtKZMXWgVFytAjfKM8cKDfaY1cG9P21OXMxyNEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(52536014)(4744005)(8936002)(33656002)(122000001)(71200400001)(86362001)(26005)(9686003)(186003)(4326008)(8676002)(76116006)(55016003)(6916009)(66946007)(38100700002)(54906003)(38070700005)(6506007)(316002)(66476007)(66446008)(7696005)(2906002)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oekjN2aeORkl03TIcW6q4UoEGHt22Qtwkd1duzhHi3RXp64E7deheUiAKXhm?=
 =?us-ascii?Q?5ZROZEx5Q3qJ0KAmZnSPA367WvuW12SVnsxWB5tH7ajUBth6k9Mpi1xD9DQg?=
 =?us-ascii?Q?ImCh5XqtO7QV19zTTeIBeFqV7jeY5OvsBAn6zDzICXvjk3xHIB9evjitbqSI?=
 =?us-ascii?Q?Z68ITO77sKnFLgMnYGmEnIcQXxUZujLcDma+cg4CH+4s1asMyAbAO3n56oAv?=
 =?us-ascii?Q?+/TS+EEtMlffjdz9DPYGVYo0WNR57V3RKfp4h66+tf5acNsuN+0rpvlzYmch?=
 =?us-ascii?Q?548qNiTYyhh9lvRlzHYQqD4dV8uEyErtwKlocGJ5o0xmc+4OaluPZKUXKOoX?=
 =?us-ascii?Q?zaL4tjqE3cvkPVZC4/vdz2d1C046wKUBNVGSplGnVKb5TI44oimJIM0b+rdq?=
 =?us-ascii?Q?97NZGxcG5JK+ZRc4oNaQ63iIBVIODxe1ZxuLfvGqHPbsGto13eKXzM1aoMKd?=
 =?us-ascii?Q?Dc9x09IIGZQnvZeNqmDXqdZtNJSOZKV8H+HlBTwt4V+QHu9uYMY/ERw45vU+?=
 =?us-ascii?Q?T5dh38LQ2wc4VvoLS7nyoATX/7gN4H0ry8beyBWDNVNz9XnIL8GkruhIAkT6?=
 =?us-ascii?Q?ZrBmpxmQxZ3mfvCExrCn7lyfoKd2QT6ChR+SsBGYO6b7LVxz3ioJZgmHt1cF?=
 =?us-ascii?Q?2h4x6dKFe0lj4gVh4gxjcGjK/Xlah3pmpGLpG6AXhTku6TwryvH/pux3dmZ/?=
 =?us-ascii?Q?YP/qRUPmPF/MfloclMZ4N1+HSlyEnZNU+0xPX4bohMbBumx4tX0S2P5vooHB?=
 =?us-ascii?Q?tUWmSNmQJLg3kvNWSywUYXRSbRz4ffqWe7iXmCQ4+A+5dUJt2y+Nb6eEexYC?=
 =?us-ascii?Q?oUC0wgbQEhnDkzdN9C4YFjtTlyIelK3AsAu3nZpBnoZsEjWBpgri5vbgV0gI?=
 =?us-ascii?Q?t8m3MAnU1hA46K2IXhnCL5/kf2nodxqp07QNl42D7PLNJ/rUeAF/VXDA44ay?=
 =?us-ascii?Q?vZT1+6EhXIBZtIKDamk9wBAeH3w+A9QMhSmKMckZqluENsVgy+OCWGlwpIbl?=
 =?us-ascii?Q?pg2IzCtVNBhKuf5cjPtS6Mnr8X8eOdQMVXJ8xylePSwcCKVGZnhXQKw2nMcs?=
 =?us-ascii?Q?frIqVG7kR8Wd6Ty17GlY8GQgOMX3R1PXFhLCqb84HJa2BoRmYQthny2W2Eqp?=
 =?us-ascii?Q?XsE0cTLH8U5xa4S0aWu9/Y6anCzq22y2bEVKLkDZODWbNihmMyZZ9lsqmbZM?=
 =?us-ascii?Q?D3lgwe2ybE6mqfqqlLYpRmOf5G062UTKxG3KEqya11oXDl3B+x0qfn/kexM8?=
 =?us-ascii?Q?iajNRMXR5t0YYZBZFwOW2SMy4baIUz6DOWMD4dKNGn7kLEpkOTsU5/6JoCYe?=
 =?us-ascii?Q?/2TSZFbcRyjQP0G7BMq0weaGiyPGOX62N+pyUpYssjLmtyCdwfn3jqtFnlrl?=
 =?us-ascii?Q?aReW+PLCAQ1JW91ZMPTo7GK4/GZolRG/VTfDeZyvBJo6mlYYzTvy0IL5Bn1G?=
 =?us-ascii?Q?S304+ZF3MsujxOx8zcNwL0/xAtCNQ9Te7wfEgOcoigv74M4UqjmswOeGSp6d?=
 =?us-ascii?Q?ZJx5LJpzKHOt9iO2RB+FDHw4LPz2bnaSatS0ixG03YKp5jrltgjq5xH3iuD1?=
 =?us-ascii?Q?mquTk/9JO6FdhkdodmrwZoC0ha7767F6WYjr+YRVGjgkNhk2F1aFVilku1/q?=
 =?us-ascii?Q?sg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95001cd4-358a-45d1-5bac-08d9f6bf79ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 11:27:29.3286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgG4QpGODWh4KBTwmDs0dD7YYjI8AWNx910qYMYJuBau2mCH6A0kREK1pmmBifoYjxss6lVUfNDpuV47pNNasg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3295
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> I wasn't aware that U-Boot uses the value of this environment variable over what is speficied in the configuration file. I think we should clear this environment variable in Buildroot similar to how we do for E.G. CROSS_COMPILE in the top level ? Makefile. I'll send a patch for that.

Great, thanks!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
