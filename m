Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4482C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710A860F42
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 710A860F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3422180BF7;
	Mon, 30 Aug 2021 21:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJ6TP5j9afBX; Mon, 30 Aug 2021 21:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A4380C3B;
	Mon, 30 Aug 2021 21:49:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 046B41BF86C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3887403A6
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="PbzsLXKn";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="HXM2KrPq"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyxlTPWkiqRj for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:49:09 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB7AD40198
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630360149; x=1661896149;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=cEQkQ8lfOQSLfqEavppT5stJZI4LWYEfetU+X2MV8iM=;
 b=PbzsLXKnB9npN3FTa6uJP60CNg2TRA+JNuloirhYz1xxQqoNhhFUXVL9
 6Wd15+sgtCIsJqPzjSVNwJs06Pnu9uXUmQKr0KY38KZL+dEGEGYVVDr2k
 DQjylmsGuIOFccSxR4zI/Ca5VZPeDiisns+1vofUd1l9ua2WHb71U7szr
 X4TTRHTANNg3I1jLmKoJzEes9bog4fvGYZSBG0Q5b4WfD30hN/efv/YB0
 Lb368+4e9rFulPN6EWDCFY7Qcy8jbGt/A9b5LcW9uSxeVrpX1cvGE2z41
 97pXirUERon1nbqfSuU3gApP2lT35qLqsEaFI1OTmtJ34TzqZdeXVTjKC A==;
X-IronPort-AV: E=Sophos;i="5.84,364,1620662400"; d="scan'208";a="290397259"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 05:42:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmKWkXZ/ayr6eCiozZ6SxkPn3+mP0u0NxkIm39Q6MyPf9JGjFQoREWm/FzFyaKgtw1u0pnPnepeqcEm8KvYnuo9Wlxm/dH9LGjlLG4u/a7tXAKkAa5UgrWgTMng7z1pMNkforEvZ1VG1S/tCh2yqKhXzCRy7ZVwl8niRMr4luwy59jWUZr0pkgndvzZFmqcRNTp2fF2U2c/CZKozdi2vq8loyhTk5H2eitrF+VHs8Ac8VL/AiOlXIbrTqux08UbYiZ81Aq4HITucC/sP82MI+/0c/UgDzdiscTRbpau2JsmTTd5Lb2tBbCcBt2T2/ruhUVz+v1ksspG4W9bu4zvH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afg8nKSpZ6PPFxMoYi3lPmpLzbBVNt+8hVbTxmajzSI=;
 b=h/MwdiY6bZ9BzTT6Zj4LOn3UBFBy3Dwtspm7L8moin7E3DIa2Of7ls0bf+oKMQJjDgic5febtK5pIC6nD9yAJn7xtworh46fQgBtRCL6ptZHCg5jpwG40RYQQ7UZ9Civsn8o4SiQkHaDullnZEpW9QCJXHUzRE1iWffd3TSsUkLa1OJxg3/sTGxVJkKMSHF5f6+ab74C6Hrjcs8/7DoyM4vuhcp9aADFISSqrC6n3AbUnwAVvwJcd7ql5VP/ZfducPq6j/Znj91wSEsdHZbkAZx/+M/PbPBQLC268/1uXZHHAfkkvGnFekr9K3B5FPv94iLKxDErDLHNtTr2tq9CXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afg8nKSpZ6PPFxMoYi3lPmpLzbBVNt+8hVbTxmajzSI=;
 b=HXM2KrPqaegXQrqX6E01eft4w94HmNjHFAYfLuaFYRzi1CUQNyLIAsoTmC4Cwaw8XKdvpN5+UaE0DOWu/wLb2MnF7ZDixQX5F23CWWZjnMOfkEy9+46jpZtGtIj4/Vbfh/Vk4QychWlUcJIK0TEsK2j9fBBqQk99swk4+MJhEZk=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5881.namprd04.prod.outlook.com (2603:10b6:5:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 30 Aug
 2021 21:42:02 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 21:42:02 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
Thread-Index: AQHXnVk/rzYzuQTHY06293XzqLXqqw==
Date: Mon, 30 Aug 2021 21:42:02 +0000
Message-ID: <DM6PR04MB70813B0A7EC96D8CE9D4B79FE7CB9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
 <20210830233204.2d8dcfad@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5291e4ef-2956-49a9-2eba-08d96bff00ee
x-ms-traffictypediagnostic: DM6PR04MB5881:
x-microsoft-antispam-prvs: <DM6PR04MB588151A61752BA60E34A6ABEE7CB9@DM6PR04MB5881.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 098QgNhfsG0HgreHB41ibrOM5RdhA22N+nfY3FFZg3v5vA56Sxd1rqfeaLmGzkqdHuJvRQQFX9RtrVnA5fUqbD7iQACgO0prgqJoqIfE1EmwkTk/SvKVok/BrPWxOg4m4tUoS4OhmhQNdBX6OP3znz7JF0xn2am/L/RcbbXGq1Rj+LjAcZOdI794RSsduiin4uwi5Z3gOnl3LdwMWh8JboonLa88oF6FZRaaVHV0mTkFW2ddnW8NXaul4qlAG9svcAwq5Vglxr7qzaRq1WbQfGurvcgGFvpt2lqyCdD0NIRuFqPmGGy30watg4BUo2bJj8CnuxQjS9IzfB4bN82yqiXGorDAes4ZwXquVnqgOq6KJ6ba118lP2c+nRln8spTpeDp7V3vPmjGKkaFUlr2YN3GpXx9zLYsLjum/wrRtHv3hUwowU545kKcrKU125jr7aaRE8rB7hC/b/ZJMg1xaajOQGCtGDwbxDJPZ7x0yNlHB6mh3nhjuNgW3o/QmoBLGmw8/8opTv85QjoW/Zg4UcReGii4IiKzrm5yFy9iQd5XfO8q4f8W2kFLNZgaThRrdNqGSZfdmG8DogC8OCjTRi/Js4u99ilcidKo8RuH5S+LVwBFxXtS73wrwEfBc5M8cyKKKjnHlVB/Th/PA37RsdflyScsOKiTr8MCaw4RY1ZwtVvu7nkKDOobglnVgiXn7R0HVlflodVEWb+4P80ySw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(71200400001)(5660300002)(4326008)(38100700002)(55016002)(9686003)(6916009)(66476007)(186003)(66556008)(38070700005)(76116006)(478600001)(122000001)(52536014)(66446008)(53546011)(33656002)(6506007)(8936002)(66946007)(7696005)(316002)(8676002)(86362001)(2906002)(54906003)(91956017)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6OfCI+u+B9WrnqlKWTPMyXpzIpV5N+pex5SA+SjqXlLDay7PkBSkwuP6jMGk?=
 =?us-ascii?Q?eQY47J23gKvKDBujGLEOIDp6kpnlUGIsNhdUZD2ybnvCoigj6lEk7ep55xR9?=
 =?us-ascii?Q?jzCM3kKi3H1dZoPLHVR/yKvnng0brR7ZaILmBP+WECxxJ5bY2GQR157QVk++?=
 =?us-ascii?Q?i1LJ68KUZbMn8lfOuiVrbheuJeP4rS3b4Ut0+T9SGwke9pmRj++CFFO5C7L2?=
 =?us-ascii?Q?b1HhN0897OyY6WBhbocPjr4hGlEsXks12GUBa/SAwVHEgV7eyejSYnEE9Xff?=
 =?us-ascii?Q?BzXilIsuNVaQehvOafaP4/RwwgJti/0SpQyl2uAgvwjC3BH/9ZtYeoPsRfWo?=
 =?us-ascii?Q?YlBx258h7lK2hV/w5mi9Nqv6KJXHWM7KtALgPFTX/R3IAg9+jg8fNWvopt6+?=
 =?us-ascii?Q?JfmXzVpN5dR91PPuOPilvmeZADZbSz6AOKh0j+95JInl/3O0aBX+7pw8WxsY?=
 =?us-ascii?Q?yxImLb0XPkDByUm4RKjEu563TfI4tqSD8brVcbaFUnbaBZQE2HSAJXUjy+Hm?=
 =?us-ascii?Q?VfzP8fnpzUX+gho2zN+wBpSOGT1FWotSYo2pNjn+yW+OM2LOXzKST8RKt+LL?=
 =?us-ascii?Q?xUjitAbdMeP8WGe8NiuRWiZsXWkx/RUvbws0envy9EC4rhIys7mvH/11rM7I?=
 =?us-ascii?Q?NKF33rU/xAcFxhtKZCuNyqGYTwYCMawcnz6FRdvfMVy/IrAEevA9aELdQzNy?=
 =?us-ascii?Q?lh9JWZJ2mvdQpA4NLc82MznfKg6Dbho6w3aTDiNtf473OoJgJ9O0Q4uYOv/S?=
 =?us-ascii?Q?XKy5Ew5cdpnND36laHWYg8XcQcvoKgpCDBb2GGxGWP+Pzq60+LsBmm5mWLWY?=
 =?us-ascii?Q?RoWZpXxqf7hp/7O5fS4gdBmWoVM2ZL8lr4Ue3uQOkV5gQnOOks5fXF0gHKEh?=
 =?us-ascii?Q?6TfBZAJY/+k4IQ3A4SgUeTs6eY6s2wVTSiv9nJezVvfnt2QP1rb9naWvIwIY?=
 =?us-ascii?Q?Uo7JssYkMqkRpyYzwWvrajkpfcCkly8/VAKWDLD4N3G4bjyzliivBlHsh142?=
 =?us-ascii?Q?LTiMAxYyDA1xN6nXcO82H/J9mp1qMvKFUdlmCoXfAfTaQZ/rOejaj5EALDDM?=
 =?us-ascii?Q?L8uYqxIBHd1DnVgIRnV4tzkMmXpG3bUIczbreT3wH2z7Hzs/VJo9k//jxXu0?=
 =?us-ascii?Q?lOXo7NLDTT7cHeJma+S5ZHIo1Xcd4wZ2lbW+9QZ3b41mLEzS5ab6kPwc0giR?=
 =?us-ascii?Q?bH3D4gSirr7FryXaBuvaWdjE00/Z8MhTFIVBOjweCdoEneFyZ2ia/x7O/kPV?=
 =?us-ascii?Q?FooSyU+UyeM7W9NsxoyWe+rFPxCUXZg9HdWYB1nG5ks3KZ75NPiK3MFsSIlp?=
 =?us-ascii?Q?VK5ywG5vMDXnuPd8oYqT+wOPnKdc6eF2fRoCpeV4+9hgkgd7ex3lQ9mV9SHo?=
 =?us-ascii?Q?zW6jSJxtv/g6E7SJtS6ccA2i30QlwlFt+dp/SXpjM7gs75/+EQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5291e4ef-2956-49a9-2eba-08d96bff00ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 21:42:02.5151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bb0czOaabuHnHVB3713XW7axqL/9d9alUmwx3ILE1iMwD4qkeObKyBRVbYm2gdWuw6A3Rt+65BtErVizAJW+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5881
Subject: Re: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/08/31 6:32, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Mon, 30 Aug 2021 13:40:51 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> Christoph Hellwig (2):
>>   package/elf2flt: add RISC-V 64-bits support
>>   package/Makefile.in: Fix NOMMU RISC-V 64-bits toolchain base name
>>
>> Damien Le Moal (7):
>>   arch/config: Make RISC-V 64-bits MMU optional
> 
> Just tested with the first 3 patches applied the following defconfig:
> 
> BR2_riscv=y
> # BR2_USE_MMU is not set
> 
> It fails to build with:
> 
> /home/thomas/buildroot/buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt: Loading to RAM ('-r' option) 
> is required

Yes, this option is mandatory for rv64. The elf2flt patch checks for it, but
only for rv64. Other architectures should not be affected.
The following patch that adds the Sipeed MAIX bit board support adds that option
to busybox build. So I guess that build option should be moved to this patch ?

To be frank, I did not test generic nommu rv64 builds. I should have...

> 
> This is using the default Busybox configuration, i.e
> package/busybox/busybox.config. I haven't tested if other noMMU
> architectures exhibit the same issue.
> 
> The package/busybox/busybox-minimal.config causes the same issue.
> 
> I'm gonna try on ARM noMMU and see.
> 
> Best regards,
> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
