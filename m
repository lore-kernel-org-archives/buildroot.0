Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1FCC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802764050F;
	Fri,  4 Feb 2022 16:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ8lC97t9RDS; Fri,  4 Feb 2022 16:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9980540598;
	Fri,  4 Feb 2022 16:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BDEC1BF5A8
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 16:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A981813B4
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 16:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xGX3w4pC52A for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 16:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 533D480D69
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 16:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TG4h6Pa4HIQdiwyM7lmiVpGLiPont1xsi5hfxqkP0WhDtcgCllXi2vp63LoeY084OlX8GlI+OCbQEnoz7uTPCGQXVCVM+x5IEoewKOHoU5seZNZ+FKc2v7lIDvRemsvx5UarTRlbKdbSLWyP8yS49Ax09HNUnSVrvciFwPz0ebM37oujvQ6JEOuAfxSIbxFmL6hxw0lAeRqkNxsh84hs5Shxj/Xzpg+GIL6plvHOyujYYvG6uGua08t0h8EFkfsVxH6jxCog9rIpULErc93saNzDa5kq9i2Wzo1z2qtqUaWeJ2V2NeUHe3OqEZxb5O167BJqJBvE4VXcQF8TdLr/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZK+FkC0QinZ6+zBQibS9ybooHuura1J4m7WR2GJQpY=;
 b=QkfD9MH4wOdyGR9VLbXoP57i7g3pyDwxEiSZoCdkbZd3YUVTR+oyD8Nl+2Lx6hLLg4oaFB47R8Uyy2OV8dXLmoH200Xq/8E4VJJJvH8CrXiov1rSHrgeWj6b0aNTAliTu8G8P9/D/ASbNDmCdCnFB4BxCf1EUoMGBKnJhUBdtuGePrVxj/qPc21VDIvkzDpj4Z/q5UPFXE1e8xahpQo1GK8c6S6FFHi8/te+1pPneogdShw2lSwSDLViphpsHtZg2LmVv++mkweH5dI84IANlDukLe86Z8koCT+SFeXu4zUkq4TD0KjhwhBSMIp+0sDIqP9fsQhxVPXzQJNbYhqJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZK+FkC0QinZ6+zBQibS9ybooHuura1J4m7WR2GJQpY=;
 b=bg1MQ6xMcy7+Loo9cXfMQLW3oPvadCUAN8Z52RhLG4TOpOHkSxBpyjUm1BY3wMi6W018N7HNA0mQeCKz4f/5XafQQjj64GPVbGXtzGj373bRERO0BcE0lvhaAKMUVJh4Msfpa3fZkB6xgjLVepQML+N7PaZTE9Vc/hnF3UCjde8=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by PRAPR02MB7883.eurprd02.prod.outlook.com (2603:10a6:102:29f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 4 Feb
 2022 16:55:22 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::f86f:d0b9:5e9e:eb98]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::f86f:d0b9:5e9e:eb98%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 16:55:22 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Getting Buildroot-created binaries to work with the Intel (TI)
 Puma 5 ARM-based CPU?
Thread-Index: AdgZ59CpwoDph7O9RfedaA99hM5qWQ==
Date: Fri, 4 Feb 2022 16:55:21 +0000
Message-ID: <AM6PR02MB4884FDD984AFCD1A4DC6B30CDA299@AM6PR02MB4884.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bffa4a4-f61b-41eb-e1e5-08d9e7ff21f5
x-ms-traffictypediagnostic: PRAPR02MB7883:EE_
x-microsoft-antispam-prvs: <PRAPR02MB7883981C132EF2AE9D27390CDA299@PRAPR02MB7883.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sLMI6KddSJyFy1i9dIiMfd6GCHE1RzyUbhnypl3ERA6yY4+gl/F9aZ1XSQWnafnFdl7mxUTfd/+FXMLe3xsEZErBvFSoC0l0VQJNmxT4qvmU+lnEqc+7B0cfQnEn5JJEMsoHpHp067ZNVRnSs/YXWWCUHiVSnwCPxA7WvbMsqt0BUq2xpyozcyoWBuFxjWbKipa0zSC9Eyle9hrSGVRDk2aRak/WV7dOfkibqTx4WoVs9vI6LnhttxV0xhAw7LwwQA9tBwfDjO5fY20mqJZ9jL7rESaOJjrRRXE41fbqpO+HACzQIrDIC+8vVCLJXumESGKIIJdARjtYIqZHsyNQ1yonBd6oRVNdqZKlyfwBOxUC8CEEGdjRIExsufCO4AmmsoDYelx2cj3Oos8FwjH5FLgPEPGKsMs53t3SS95GAHLnERsRPnITcK1mQBhrwg0Fzyf7PeKIItMTNdO+sIJY7CSILipVJ7/9ANaeNHrxbXp1cnX120I2bY/lL4gFZMOcKzvIH1wLfzwLXeWTuoBvp5Fz1y/64iiwW88mjkZSo6PDBPClITlLRde/YMVpr0sM4KtE7AYBAXQqO0NSOCAxqHQvsFWTzlnKP+lGlshDdM2yTNFDwPA4xwMIQx5su94oIXsE+rDUYSNTjgspS/rf2IZjoNRyWLT29nKkn5h6BardeJHGzyU+3GOJorHrNf9Z61b52PlrSxVSpbS85RrPc0Y8tuHVpUthE5B6LEnel7J2KsTISNF7FddP2kNNx54egJX92XwRAiE/+pLksr+cmFe7lSx94ibkwldogS6ij3Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(346002)(136003)(366004)(376002)(396003)(86362001)(316002)(55016003)(8676002)(9686003)(2906002)(186003)(26005)(66574015)(508600001)(33656002)(966005)(66476007)(66556008)(6916009)(64756008)(8936002)(66446008)(38100700002)(7696005)(66946007)(71200400001)(6506007)(122000001)(76116006)(38070700005)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e6VQxtdzCnRoNu73MIoecWMibua3dw6HDBjxCw0/3Bpfg3TeaT6RI18RyQVk?=
 =?us-ascii?Q?cYPBWAbZqzg1JTnptN4liKlYWtvSKp6Yjtb4zkMFP+mc/abYRChK8zrh8nN9?=
 =?us-ascii?Q?d0wVtD/T1MAUUzNLkyXCwVvo+y7XxWplXjokLH4BGGkyB1z+p91gJVUCAJJ5?=
 =?us-ascii?Q?w2yXPmDmUiiCSDm1u8FrDHHaMWDZjwIgLIHLd8vlSFXMFizYCoXuAXw3I08I?=
 =?us-ascii?Q?Ddgqxy8+HPSXCYYSuF8zXSXlLO+oc/KXlnsttga/49IcJpmPJuaQENqUcT3w?=
 =?us-ascii?Q?jqQNmKWMNmnUfcnUuu1/b9MdHD7l9jrciy/pggjBxbW7Fs3dywZJEgrey3uH?=
 =?us-ascii?Q?5JBS9VwFRR7eX/G6T8s9R6NK4cvbx9cyyCMASGDG1ahu32zUApWLBJAqDjks?=
 =?us-ascii?Q?5beu9FhnC/wo5sY4bcqVa53k8rvmZMnCbBrwMhjo5fYbRQZ7nk7PuXKKsGvQ?=
 =?us-ascii?Q?7pkk2QcXsrgG4iBj5YekQAXtwQ2+w0pRUmYvAtaYyuJre/24NfVWNWK3ibyu?=
 =?us-ascii?Q?ozk9AOEIj/kIsGkZBchZQbvqD49TMK/56bhAg75PK9t5wl1TteSuEPzl61Pe?=
 =?us-ascii?Q?pk2SIcXtbfC5Ig2/lrVuRx+cQBdKaZXsXiovoigWugV2g5r5zquaEzlAAs3m?=
 =?us-ascii?Q?Ce+WDDua66sI2WkK0fPRcVKtEQMCqr1863tE0ohVFK98eomYgCaV150iHc0v?=
 =?us-ascii?Q?D/749pfPRWxYlvg06KE7qpBQZQZIGGnSg081ndGI9LB9F0mvD5iWLDh52eno?=
 =?us-ascii?Q?vMUKEjNyANTezEZ4afWDui3nLqA6JOHEOh7sGMatRXn8uHdbYSV+49JPhjK2?=
 =?us-ascii?Q?Mx/h2iogHaqqouRG4ZncKTbj5QCj5xDP4vUTAI8/f8ItnsXAxkPR0VSDi0Is?=
 =?us-ascii?Q?Rpfds7VajS4ZvW4HU9tsYKrJetDVsxWXEE+HQvN/QEgf6OP8CgUY+dpX5f20?=
 =?us-ascii?Q?dTOmt7VjdAoBINtitKAsxNtp55ynozSbth9DKmt/BWAq2yriq3v1Y967O9mP?=
 =?us-ascii?Q?9yAcU04ucHTPH49dH+D2dACnKzZTwjYbZxz4xdKn2DCjZdDhJAHYrnEexVAO?=
 =?us-ascii?Q?nKUHbcxyDYB9Ub9x2hy3xwai13hRtKHny0FnwAN+gEZWUnj232hVFlHS8kLc?=
 =?us-ascii?Q?CT+8ZmjEgsas02e3jNI/W1jjV88k2nfdaZtZQZqhYwXK9H/c+Bcd/RR1SEJ/?=
 =?us-ascii?Q?XfukmQMp7W5WnyysCZLA2ZORDrB4dgXiJhZuVVHVlHCPdmdP8MSXKtHYkS9A?=
 =?us-ascii?Q?mnEdr8DDfHBqpCq5rWNAhXVXANgj+lXgtjiRjH/UTI3Zw2oVvSKa3tyJb1W6?=
 =?us-ascii?Q?WGoddU/eKCQe3KNjscllzXH09azc/u5oMY5eTEqJEMfvE3IicnVrtdChKcwS?=
 =?us-ascii?Q?sujaPyCdv1lpwCU5ixIHKPTeTNGH0X8bSXy9JJ3aEGgthTGFNaY/ruD3xQnp?=
 =?us-ascii?Q?Wc50yqV9wLV/B33Un8vJyVOqOqqUFACyUvNQh3iENhn7zdzcPoruB7YafLMu?=
 =?us-ascii?Q?cNM2B6O3BNWu56V2A58GXL5Ugzljel4uoO2b2hm413kbYPJCpBf+VnRDXv/p?=
 =?us-ascii?Q?JSUULPA5A7rQHwndGh+S6d4UcTkuxeyywNP7Hb+QuQMz2Q/7lM6Uf6I/6Qtv?=
 =?us-ascii?Q?CQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bffa4a4-f61b-41eb-e1e5-08d9e7ff21f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 16:55:22.0824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s53a+GT6vZMl8YCpXZa80uC5NTsVtLo75Eu8gb8eSuLSM3UdcFAqpSeDylyX0YaSw0ptURlzqeQ4FiKDbQCCCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7883
Subject: [Buildroot] Getting Buildroot-created binaries to work with the
 Intel (TI) Puma 5 ARM-based CPU?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

I am new to Buildroot, so I hope you will forgive me if I make any obvious mistakes or omissions in my email.

I hope this mailing list is the correct place to post my query, normally I would ask on forums or in Github issues, but Buildroot seems not to have a forum and its Github explicitly says not to post queries in the issues there.

I have been experimenting with an old router, which uses an Intel Puma 5 ARM-based CPU (it's my understanding that Intel bought this design from Texas Instruments).

At the moment I am not looking to replace the whole operating system, initially I would just like to build some binaries (such as dropbear for example) to make the exploration process easier.

The original software on the device was built with an ancient version of Buildroot - a config file can be seen in the /etc folder - and many of the options specified no longer exist in current Buildroot versions or relate to proprietary software components for which source code is not available.

There are two other Puma 5 toolchains I have come across on the Internet, and both of these are also based on old Buildroot versions, but also patch these with a number of things, such as compiler command line switches and options file tweaks.

Unfortunately, the older Buildroot versions do not seem to function properly on modern Linux installations.

So, I was wondering what would need to be done to enable creation of Puma 5 compatible binaries using the current stable version of Buildroot?

Links to the two toolchains I mentioned:
https://github.com/bmaia/cross-utils/tree/master/armeb/puma5_toolchain (uses Buildroot 2009.02)
https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/ (uses Buildroot 2013.08.1)

Thanks,
Dan Jackson.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
