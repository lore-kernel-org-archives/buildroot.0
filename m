Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A7BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 00:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD32D610C7
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 00:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD32D610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1E2405B4;
	Thu, 28 Oct 2021 00:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94OOrTpu-o_M; Thu, 28 Oct 2021 00:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF68405B1;
	Thu, 28 Oct 2021 00:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8079D1BF9CB
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 00:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8FC405B1
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 00:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BalU0Tv4OVqh for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 00:35:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34B69405A5
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 00:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635381303; x=1666917303;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=33pwxbQUi46n/gYkl89gsXtRiwRylhEU3bnSxxnNIVQ=;
 b=o3atAcwUJEEh/aBmkXQnCjLprPlEL3ESnlvuZ9QYkmG/LDfffLAG0Aqz
 Wa6ty/PE2tFrw/JniBTZSU0W7Q+xkyaVmtSRyg8OnM2Oqn0KU+5QNV8ym
 R5I2WAFDoSrAuJzWcNE5ZsYE9lxDuEnhwPns1cjJsokQN14b9CNe7k5ch
 lPv5mpXs+2Bbp1dCdauRPT623RhWYaOkNo5Y6zdF6ingTT+My7OIlnK92
 B+zMzOay9+z908TZJ5NYdhMufaM1h6mw7YM3NCusrxRmz8l0AGx2XWorR
 /szuvLQPtxdnVvY/mcjnhfLm3PwKs7QhOpcjH5uqzhS9Xy0RZuCKIfcBm A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="188798327"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 08:35:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2CIoz4DtLRsYNhjZMPi8iZ6YS+cQpI9HUldW0hjCNHWgDbPq/2FRE/6trQS45pNbXgEQBtYaShj3AitX5cgsfQOsOBdm4PU5S8VLKJB6LYLqffI1uo9qhHOLoAV7ds0wppI8kzFxCtMqEE2PMoYQzNWLMd7AbaeRwOqsR1gZfFPfgUmdt90fETj4RwrSN3fD/fh1Wh/1qh6YGeys05wcmnBkQkiQMAPvfoUneeru1vL5LzOat6mp2CcnF7qdqZZFJsz7gpIAWMzbY1cxoqHi0CgLdgumIwAt3jCHJHhOuV8/p5C7C3JDke2pzXZ1mxrbEOBbwcm560Ai5s2zp/rYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN0ByGIfa5mkxIIeIEPIqr9qB4dNQky6tRU+mylnkoQ=;
 b=gr/VxVgr7qjbN/UVcjMQNNbJhjA/uj+higpvQYSEozyS7Eq40Oigs54RcRDFjfU70sEOHAYk2CY6QbC/MKIKi1GNzRR/qw6G+gvWwtVj+tuX58aIRz7OMhV8RJCYKAgiyJniLkhEaMcZ519Z5AMJtgtuQfAOU6H8nOcOzhkmhRDIl6lKNORs2+h+FOnhyGdxjYioywPDvkRQC0UtS2tCEt8cb0yl78CL0hvKwjabe5Rmwd4N+vYILyHmiIhEohxVv3i4slQPNCzrIKWuoNYyXyjypNCeduxa4JZqzBcgzUqkejoRtB0Zl1WvgIgWgBvx/8MH1Tt4xttkKiVxwNmdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN0ByGIfa5mkxIIeIEPIqr9qB4dNQky6tRU+mylnkoQ=;
 b=uTs/MjLqMxF7J136QItR49QSF/Y3UGVdcMdN2nbjru6ZYLhMEH/ENl2OvBkQiW7cM7x8nNCZB9m5B2eDbouBqy2szPD06ju3BE4bXQ2DqB/A6tn02/b/l+zoSe/EZ4t5zDekV5Vg7ivX4ACPj+s2YteIzEOoBkH92I1uHrbZY6k=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6763.namprd04.prod.outlook.com (2603:10b6:5:22b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 00:35:03 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af%8]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 00:35:03 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v5 02/10] package/elf2flt: add RISC-V 64-bits support
Thread-Index: AQHXyjmOk1J5V5hhEUqV+KJ4uVndfQ==
Date: Thu, 28 Oct 2021 00:35:03 +0000
Message-ID: <DM6PR04MB70817379327091C5013D0517E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-3-damien.lemoal@wdc.com>
 <87pmrqpozj.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: korsgaard.com; dkim=none (message not signed)
 header.d=none;korsgaard.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b6b1b38-2acc-4d14-c8de-08d999aac83d
x-ms-traffictypediagnostic: DM6PR04MB6763:
x-microsoft-antispam-prvs: <DM6PR04MB676379CF6324F1607EB07F69E7869@DM6PR04MB6763.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Cy466q6i5hBrmHrZ/YK2syaTBvm5zSFSHmczdaQ45O3VAXCMjVzfeyl96c6cr7RVKVmt5zW3bG3L5L03ji+44T6Y354MWCFcQUGPOgV3EeQVHBY3qpgCA5Am6wwpEUXhTvf4VD5qU9RzHZEjzfB8l3OxEtMz3sVrc61BnPQJNKCIUo/XeAetly8m4wM9hM2AoCWR9vcIaCYos3cCbuWMgB5crdHzkCG0pbQdhn0TmsiAwit9c28uKK/Gf292ET88+/RYkinp1xht7GZ+3VvXqX5ZOW2xRK2h/I12qefvatMWlVdM9lqHBs9crigOs4da078WbNTVG+tVAGLvE1G8kxxg4/ryDYxhGlOr0kIeulq0N7f2Y1rnJ3gFrPgmSlJxh8XJIMUw1hW2ql6lcVn0noQP7pelrWsGMQNiQXqStUtH1GNjA8/UlS/WXlboFEHxtmEGif4ssM5wMOBojYBspFkqSRqm9Kzx2/00G2ccY8n/C+38u8bm04bhhHTG0YEfpGRp+2YFoIZdQrJnbe3QHpVUvgxnZnLXgHX6NnpfDSqm3c6053widC0LmbNjWY4bohmPRjtTV1HlVXY5T5NSNT2+TMXF9gD06JDNlstxAvKEv4vtr4cEZOxd5q7KRJfQxfvWt8+7JnuCs/CitHD6gcSXO+9DB3ziX2+edqc0BeWJJd5wZJLIreoWqehD6wUqI5MA+buInIdixzfXHFilc+/qIJDIyKBwxH/kroz04ssTymbdoAbAOpHGb0dlZap4aXSg8KQGnQS8EFxkbfkqDXFZhKal6Rsmk0sOPpjuBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(6506007)(5660300002)(8676002)(53546011)(6916009)(91956017)(71200400001)(4326008)(508600001)(83380400001)(52536014)(2906002)(33656002)(54906003)(55016002)(76116006)(82960400001)(64756008)(316002)(186003)(66476007)(66446008)(8936002)(66556008)(4744005)(38070700005)(66946007)(9686003)(7696005)(966005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P49aavdkt9QYifR/QZju8PpTt0Xc/Q1psw60LtSFcLEu/WnfZwy6LM1GZJgD?=
 =?us-ascii?Q?2xqKSxrYdZRkjQ+G2wNexuGlVa2uO3luGx9JVIfpoXwxgShmPdAve4w8joRS?=
 =?us-ascii?Q?p/iJXlDMmHDzmDF+D0w3WHgj0NoAWBDZXYTdffDUy5Lqf6Tkn+t82Rojq9vM?=
 =?us-ascii?Q?wn0+M7jva8ycCuML3WUQ1mOCEyKy2JhfiakfEMX3Ui+HljaJpw5nYrYt3+Fu?=
 =?us-ascii?Q?dL+GS2XYAUN1mR+dqD4pXV7JqCnDQ7qEBQWnygnCMygH68o0tpTJXRA+AZgR?=
 =?us-ascii?Q?HFnVRGtNgqqywEmPNCRJusA/2uZAxfLCcwOpLdU5NtU7LNGN7avc/RxcyRSZ?=
 =?us-ascii?Q?deop3tmZpUKBW7CuvtvoePjxTxH0vyWMic/K/+weqmHJ4vGbaU6iMKh2pTC8?=
 =?us-ascii?Q?fJ6FT8iCkc1RvUa4ZJyyDNfy/ZwaeWm+dDPvsGYI74gUE+ARU0CeLs+NGnl3?=
 =?us-ascii?Q?lJ6eakzoc7MeMhv9TgtnEst/hnDn5pNk/drGhiQmPJbNvdXhYyL56CdrqlDQ?=
 =?us-ascii?Q?tU0d+gAMYknoS2/gIUSAPvPQzmsvGOcb71tjYVkHF1xK99+jL9AIVq2eiNVZ?=
 =?us-ascii?Q?E9/lkZsxMoPQW3Yimk72H4LERp4jgkZryqZXqHVcAkyHU6QYrRYlJsrwO0lC?=
 =?us-ascii?Q?ELedKHYtGAW3TnPwetU15SxeAzvU8mSmTLwD09BtpRcm1BfyuQ/S78pNTsI4?=
 =?us-ascii?Q?9se5bMEgRyEuMl+AR5PkdZ074oQVE7dU2BLkWWbpZCYOwsfEoL1MF+bV2u7B?=
 =?us-ascii?Q?3eQkJ2yavy24i7PK3IjWoiWjvfkbO3W+92xp05ZbapXhf6Xj9HccV81oIGsc?=
 =?us-ascii?Q?uvgAG1sp19pqDYB79efgaq+mIHHPv0bwE0nHA1Y4HP5H7AJDxJPHi4yzUreB?=
 =?us-ascii?Q?i4gZ8HhsBWPL6FUrwny05jqkVh6PqMxKcsGhr9lvyahlk7Li9dtDEVmLp32i?=
 =?us-ascii?Q?mIgYb3u38vNiSji6dfHsscRLw/Pk1e6ANP36pGl2K6Xrve5Lgfpq51dgbgsn?=
 =?us-ascii?Q?OXK+u0lZjrQHjbkD8PG7UtaD2+4aTHDm+c0LwwMLRu8kS8v6qITnSHoG/TIh?=
 =?us-ascii?Q?rupn9wjncHrEFnXqA8gaNgzwwkwM/u7UOtUBYsmJ6qZqSqD86xMeaL4qEv7T?=
 =?us-ascii?Q?b5sdLTgUHBDuNRhssYsNhtaAhla0kU0AkLZGFxqapv6u80fh+8lSOwO75k0E?=
 =?us-ascii?Q?cojwBdU+FGb/4e7VvdL+Lm/qMC57rl4RE4XMMf1W2OaUKXoqHbG1SX68swZk?=
 =?us-ascii?Q?/z7ntAaWSG23+KqkV6MnjMYYq/gHw3d9d5Gxzwrzlj/h9rjVYU8kPNx6fcYX?=
 =?us-ascii?Q?oPmKVN65SCCaU2lRiUhiw0/5gqu9apTVqZpNYGReoaY3LcKUzpXZKR/CjJXV?=
 =?us-ascii?Q?r2PZFXGvXWznxzW53PjghL4PYu2J49j2p1Y/ZGVZrUnV48j5xaai2xK6h1uy?=
 =?us-ascii?Q?wxwnAc7s2UiO5Wwh3xabySIIkobmMhazp9eboCksr1XDANvelGVQEie+oelB?=
 =?us-ascii?Q?TXlvBwpfu3+NgH2MfiRe9aiga6vWhMTaEp/kIURrrxFSBzS1YHi0kz0znUJJ?=
 =?us-ascii?Q?Ska+FB5K+1XEZcjfNSrIJmMFNtxP9uWlu63+k9gVxHWN1X3BjtbxpIWBUM9Y?=
 =?us-ascii?Q?jMTn/AOGmEK+jCEPefkpspQu1Utmp0tQ+QZbt6OrqALxmEow+reQvuwJY9fz?=
 =?us-ascii?Q?9FSUrylZRSk6NStJ9l8MvGVLo8Y0dZo9CRp+oeWTN1wQFtxB?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6b1b38-2acc-4d14-c8de-08d999aac83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 00:35:03.1383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXQuAIyvgfoa9hwjhBDdDCyiwxEJjEC8BdO5HQyUPtDW9XvQNC0VXGHQUScJFu9UmaPMOst8sC5R1QzvFIoibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6763
Subject: Re: [Buildroot] [PATCH v5 02/10] package/elf2flt: add RISC-V
 64-bits support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021/10/27 22:38, Peter Korsgaard wrote:
>>>>>> "Damien" == Damien Le Moal <damien.lemoal@wdc.com> writes:
> 
>  > Enable selecting elf2flt for RISC-V 64-bits no MMU builds and add
>  > support for it in the form of an additional patch (upstream pull request
>  > https://github.com/uclinux-dev/elf2flt/pull/22).
> 
>  > Also modify the package Makefile.in file to add the -fPIC option to
>  > the target CFLAGS for RISC-V 64-bits no MMU builds.
> 
>  > This patch is based on initial work by Christoph Hellwig <hch@lst.de>.
> 
>  > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Committed, thanks.

Thanks. However, I may have sent this prematurely: I received additional
comments on the elf2flt pull request that I need to address. I can send an
incremental fix or you can revert this patch and the following and send an
updated series ?

See also related reply to your comments on patch 5.


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
