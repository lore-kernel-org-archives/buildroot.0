Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31AAD2E9E6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC8740384;
	Mon, 11 Nov 2024 13:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnAzAXoHHo3b; Mon, 11 Nov 2024 13:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 319784038D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319784038D;
	Mon, 11 Nov 2024 13:16:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 759FAD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F47A405A1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZ1FZPi9cncC for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=03875af56=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 771B140598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771B140598
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 771B140598
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:16:33 +0000 (UTC)
X-CSE-ConnectionGUID: 2BsHmk7MT9+PYOu3+471yQ==
X-CSE-MsgGUID: jd2YKHkrT3GxmkIzlSe8sw==
X-IronPort-AV: E=Sophos;i="6.12,145,1728921600"; d="scan'208";a="32171065"
Received: from mail-westusazlp17013075.outbound.protection.outlook.com (HELO
 SJ2PR03CU002.outbound.protection.outlook.com) ([40.93.1.75])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2024 21:16:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBZcqAqwUviumHVKaMV+PLQThpuh/GmGCt2V3PDRp+Roh4kqM0NTnkDWPSpmIRLqaZOoNVlCmlFVKAOxASDHpMEipuS0Xxs7ujvugM+Q5/iOdOLYChoUO2m0pB7fNG74hn1LTaxzbhHCySoZZePUHebV6TbhMyL+NZnkYZhZlgCO+PHGl2480cdSxvNRKAe/MniF0lzoZOaYz8bTe+sBMYsx3naYVyT4MLouSL/hdcW33prJvV27Ff+nckMwnE13WXBZJe4HE6WXhObK5u2my4SQBiXnsOpmsukRID3A+bl27ooQxu8Vkn/viSVl2jJKVVuXD8SIbuBoSJJHUA1txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqX43QitAeTjzrHza+AFeLswdqjuYO0d8jyarWaxgSk=;
 b=VsAsudu3jQXQ1bPEShfo81BmxCUtUzbEU75o2h+0WJOa9p+MLsrZX+OPjetqf63nc3cDKeE7S6RAmPo11D/P851ei8zI191GMExBMPEqaTFe465XN7nIbggQLJFYkw3ymGvG2dBkVEbVvUxCL83yCFJ6Sz2HGVAmUbOOn3ZwDNXJTeUjiPF26T1/svchPMWKvmv/tvrSH+dThVZnh1yCV4dEegYV5fJkXEKqPrE2ZxEbk1nfAXQppslTogA7KH6BzO+FiwiGo5v1klhQIj2gCiS9uCN6PmAIiQvdOToRBfBcwC2TjGzf8fg9LcMxnrF/RJUqp5EfwS+HenuwAnVDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ2PR04MB9060.namprd04.prod.outlook.com (2603:10b6:a03:542::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:16:30 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:16:30 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH 06/17] support/testing/tests/boot/test_grub:
 use partition-type-uuid "root-x86"
Thread-Index: AQHbMvUZ4WrJRoGrhUC87h5WRziY9bKyEeyA
Date: Mon, 11 Nov 2024 13:16:30 +0000
Message-ID: <ZzIDrUgxa7TSVI0t@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-6-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-6-9f23180c7195@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ2PR04MB9060:EE_
x-ms-office365-filtering-correlation-id: 564a973b-0399-4be0-57db-08dd02530e49
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oaXvs6YHhiV0H/o++QEbO2/mywcfOCiRbKFaeD1Ko+0Hbbh0w6sf1zTE+0ME?=
 =?us-ascii?Q?W3RJoR4AmqBtgI5XB+h9B9DKWrw4dv7OszVYExOiP9un8p+BpD6rUn9m/34T?=
 =?us-ascii?Q?WXvRIdwTQ6GHw7js6JU3cWJfIiReqi9uAbkMuwjHgGMQ/V1cmuzE7XA0HlL7?=
 =?us-ascii?Q?jxj1eQPfOVwMF/ICFbujo/PGGgvlj9Id9vzgeUWzMEAKv0BOoWtZ58uVE0FJ?=
 =?us-ascii?Q?6IKUCWBAWhBXHKJGSxstM7HcE+gFKeyhJRjgR/5RK61q23EdHfEzAMC/1rSy?=
 =?us-ascii?Q?6wSvC9+pRddVU2Uz5nJCbC2NaBmQMRgYisXTNmF13XPwjJOIlWUPL3iWaFp0?=
 =?us-ascii?Q?Xx8hh/0va8RD/9HVI1i4xwVF3Sv0tGXmayLhqLDXX3usrZt1juFm0Ri+nrxz?=
 =?us-ascii?Q?RvmrVpbe4kfYMQLDpWFartxKjR7yXoWIa1u2bXRQhd/Fr3HFV3w2+KayGW3s?=
 =?us-ascii?Q?kZtLVnyShymDGoUNzfxGUziyyoDtZ4EO0lYGBmLPtKV/OFempBD4EGvIFAQu?=
 =?us-ascii?Q?+IETtVcRFNnCIYmG90QtLMP4Lgh7k3u0rQWa/Veb/jS3VB0iMCnPuDypN7x+?=
 =?us-ascii?Q?XyJR6lE7ssZ23nKmtR6MkQanSghNffjyhPPzbysDadOwCfr/XDLFN0JO2fZJ?=
 =?us-ascii?Q?YPO7pyd+8ZxPPuZwqfZX2KHS9UbWF8OEZtL5YZeKTVRcgcqmvMUMkzN6sC2H?=
 =?us-ascii?Q?1EqQmxSok5rREw8hJUaX1QaMNZxaU5srzo8V1Bpj10rMF5Zu86gIfo50fuBL?=
 =?us-ascii?Q?oSRxo1+hdEncC0a17dz410gwnID593mfP0l7MWVU4KXcptZrc67+q7pSTtGO?=
 =?us-ascii?Q?TQs+oNZEsGRO/9P0VVAWA6MYcOTyrRLgdbGKlc8H5srIi2wRgGnvOxD8RhjL?=
 =?us-ascii?Q?Re0RofIsC/SuV/PwsxuCu9ZsBGcSBnPi8va4FtVAvZmnuSnu2y2vIjjGdsRS?=
 =?us-ascii?Q?4BImftkmmEMTHuX3SiN0ZVY+t3Lcp32oIgjYTLi/HSEhWMr40XBgUPq0g5uk?=
 =?us-ascii?Q?g4O8x8qxargOfBUdSTBtdyTmCu2xHNLBp5H3ICWDnWkAE01QQlzyGTq+9XlX?=
 =?us-ascii?Q?voFmU8PSWOjsJqHl+FBgc+oWHczpF+jN2avs/QZ0eU5hqo5AyYMR23YHCxR9?=
 =?us-ascii?Q?Pw3jjwGRKDPE/tHqsVycQKc3gHxVbXFKxiLL/eBLQ9BdPyjC3QmZnTW+GmQi?=
 =?us-ascii?Q?xaIVk1VfsOBXiTKAMzzCexLfdfxFCh6TuVqB+vl/DHlSUCZtIS0BRkmujh1U?=
 =?us-ascii?Q?gmMTJLHNu9x96ee37ESVkUqcAQ4xFkeL7e37zz10v7NjY0qNNjba75D3ZUZX?=
 =?us-ascii?Q?1W+n7LjC3DOgEhFPwv9dmbhmhAQ2wYounrBqp5lOPUtZYlbEtghjd40uenV4?=
 =?us-ascii?Q?vzDH+ZY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cbSBvYCfXu1RUB6kmKb7m5/7ZczOTrgbYAS30capxCjdwnU9ePm1nzOOFqq9?=
 =?us-ascii?Q?8f0d0wYZ0M0w9VAlt/wr0NWKIvT9OAS3uJMgA1Sf7VPBhuw5nd2EugbZyRjv?=
 =?us-ascii?Q?g4Uz/lxnaNFkJ7KxQHofhIn3zf3bj1NbqDO+kY6+w/xjlYRvZwU16UYVatDc?=
 =?us-ascii?Q?DJDeEahvs3BB7YyLI8ipdpqg/73hlKWa1RFFAhwJf6EoOze+fWAri7xV9BYo?=
 =?us-ascii?Q?cjRCEcr3dF9dmhuswSB+YQo3MTVWn7Cgo9Cc5VtlZet2AYS+l2fwiK0Diq8s?=
 =?us-ascii?Q?oeLqsudy09ixnMlF0k1uAz8FIGzvX8OvciLxCyTLjrQw1p8ghFL41x8Vrjnn?=
 =?us-ascii?Q?jRBxSsLIKxAOOBfzqhTayD8dx3F7llqCn2H4fGrcVuWUcT9K92plRkjw9tay?=
 =?us-ascii?Q?0ikhg97dg4Mn4SadI78Pf2X6er1m9igZgktj/Run2vDi8hD0eueetM0viebk?=
 =?us-ascii?Q?YRFhl811FvW757FUZK2lJzYfM67sOp5rE30oBFvFahsRyaISxL6XIewguFSr?=
 =?us-ascii?Q?dYDHeIeal2TqXfZkhZS7tMHuVHD6ejeKMgk9DMDg5pAs6kpSqem5gMx8tD7N?=
 =?us-ascii?Q?jHmPTLYZPcFQ4yg5wwgxzWgLlk20p+alcwBIbYnnYVV/0z+P/6IC+SBq34cz?=
 =?us-ascii?Q?piiWys6Xm+Xzgz4aHWGyQxAPr/a/EDk6tcbmQxONiftGHiJ3WFT5risS5u+f?=
 =?us-ascii?Q?Thgoq3JKUaPcBwRBY+mLUj8Jkzqw6ITyMGZEQRaqdR4HDI5AMdaJaloBsNYB?=
 =?us-ascii?Q?XMv8guOzNIvaXTMsRzOWG6MK/SFJQF7nZkK6UL3O5Jmb/M22OOH9s5t6i1Ju?=
 =?us-ascii?Q?x5qE3NvbuUU30cbBYCfGf+GkWxUyNCDHL/0+alvyEexUE4ABk6p8R2FlDJIi?=
 =?us-ascii?Q?dfbocs5L1LhW/gsbDyc//g6qOrL3MJ1Wbl/WUGXeeel3FM/wJ37mT8iaa22+?=
 =?us-ascii?Q?Li6y/aAQuVsu2X9C6rZ4NtkX1gR9JD6wgWxNjPVLjh0A3KuIzMD3DGHqpHkK?=
 =?us-ascii?Q?slEr0t/19Y93kCru5CrhSlAMvYkr0pIVth6RtdarC4uLwCQ1gdxSdYgHnaZD?=
 =?us-ascii?Q?ifCdbuCEqTsUi31IoCz+1f/Ilj2PjyVzZ/nvWRvjIn42Lcm5cXkdNCmEA59n?=
 =?us-ascii?Q?Il3SjNM76CryjLa0B1unpRI19KcTZm9lazaecQCpE1zQT5YaP/JLCMnTUaT/?=
 =?us-ascii?Q?DddzlN/VGKqZcv/wJzMmc84Tva8VymG3PeWEGfP7RRi8L20VtBrmg1WRD65d?=
 =?us-ascii?Q?gQdS1+s3G+M9Po6+SEDnT2WR+YTDaWl/IzwmAS3OzSOgnOA3ku1bIsGHG0r1?=
 =?us-ascii?Q?Qzr5HS+Y7ex6bB6eDk/WgbzgTYuW36D4mFEOibes5tt2KSkVcAAUoeB1T2ou?=
 =?us-ascii?Q?vHHmiB+o8EY+8OI3sKStnFhw7f9c/SzPV25B9fy4mNySMfGiY/pA93mn6OEj?=
 =?us-ascii?Q?mStgmw7+sdcajKO/LSEJHWzYTiM1T5oLm/qrDsZ5ZhSg0hgLgtiVeH63yn5C?=
 =?us-ascii?Q?EoWIrw4UG92OgOSkG0kBVqPGssVGfqlRBc4llKH0cFVPH0Svg9IKzAiDbnFQ?=
 =?us-ascii?Q?6KrEOXKcOk0PfsS5yS4UwIAY51r3briEz8x5JJSTRct4/wecv9mB6cMayCs7?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-ID: <0294B3FE58680143B5072A4BAF1DB99F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Yxt5jAggI6T3e55ye8Ao62a+7xy2uUwhr9aTXwN3F61bzqxZfuT3hntJDdyJMfl9n4zWg0rUwlD08ym2rg4JCc9RU2hQrgP24zZJNVHtwhjk0QBRRH5tCE22aYcSmOSTo8WzLvmvvoCPvdsNcMqoF0TmD7iIVLgJM5uluBh0l3b4Y/gl1kz0gGJE+N0dv9GEOVOv8583iPAOVz3pZHnDVQGhxrjr9v/nFCP29iyMALTbZDnQ5H3/wEuX7M0L6sYwSp2L4D5PhVD7777RrIkGVUzv4cw8rLWePuRQBYDVWHtSXjsCl4aW7u5ztIlboZGonVPezmfEJwbq8dIU1cq8ocsZEWDXQHQdyUbs3o2oHzDQ4rMmVD4TuZB2Mki7TXhMkumKrpoyAaCbvdQvh3orv2VdlPIBZ/Xo9oCPoIlHxIelLxutP1Gz5k2sRhTBRKiEv5njF9fUifFgfF7FPK7rUZdt1/NjRSi4ju3EFtjo4VrbfXCCry1BxY09SP3WhKWsJQJSLUfvvnwWPWiZWRo8HIo4ABnWfgbzKfFAZz4ckxCBBARKHuijDy3A8j8YysVzZ4zTEmJX6VTAdJmtMt0z8Q8TXAVJ7fX1WB4RQEbIpkvdJBKL0ByoAHAAhUYUlKfG
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564a973b-0399-4be0-57db-08dd02530e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 13:16:30.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bijk5KIUBW17zBtdz+FEmHhxVw6Qz4HypfOWsPRG9fCY+d4CFlmv9qNyrDVoo/+emduB8BZBPg+EcjsvLct0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731330993; x=1762866993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=xU5BHZIjS24HW0muQR/bXeIi1eJ2ODMLd276P3Ye9MU=;
 b=h7R5HSxNFdm6GtXon0LIk9P9P8Q5uW9ZHpueXHSYEsv+aXvBmXmpPTWT
 b3yPiTRDmNUbjNr6+jltxdCR+97p25PHielAiwikcbgEf6Q5SyQGNx8jN
 EM/SiKLNFkN3wQxh9NPWDWawDTA0FOvuNXE1bTQe60knT1iil4pitupsd
 wa87oyyA1ZBCNB+yu4zHEByWRL65kwshPA2o4J1YBqQQSMuUTkplqECPb
 UkNkvcblbOxBi9zvqEQf3zzGBpARRmP2eEoMoY2dGZvtaqDNvnfiu6hPG
 m532iVPKmTlc5F26wRfzYcsAy7Nqz9FaUiYJl6rvApVkUNEjmdzh8+w++
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqX43QitAeTjzrHza+AFeLswdqjuYO0d8jyarWaxgSk=;
 b=J2nGASXtMPFKE4bHAIWhu2vohWcaA82JZ5fQqZJ0pTtpQo7tP4wlAo4RFdd0ieGkjNP6Mhqc0e5OnseRxJatyeDVPFtec+8lWjbnoILdqCcTeScSHVoIhspW1akKbUE1jofl4cTrieK2ztAaeJf47lf2wML40FJAwWq40Y/+8Wo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=h7R5HSxN; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=J2nGASXt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 06/17] support/testing/tests/boot/test_grub:
 use partition-type-uuid "root-x86"
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 09, 2024 at 04:16:20PM -0600, Brandon Maier wrote:
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
> index 11615c885a062d5a86917bb942360a2ab9b3c2de..9717076ca871eb3efb4fea7ca94297d022839de3 100644
> --- a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
> +++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
> @@ -25,7 +25,7 @@ image disk.img {
>  	}
>  
>  	partition root {
> -		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
> +		partition-type-uuid = root-x86

The filename of this file is:
genimage-aarch64-efi.cfg

Yet you specify root-x86.

I understand that you are just converting to the shortcut,
but should this perhaps be root-arm64 instead?

Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
