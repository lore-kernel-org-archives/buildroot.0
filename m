Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D58C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 08:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E689C40A20;
	Mon,  9 May 2022 08:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrAebo7d1FgV; Mon,  9 May 2022 08:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0AB740A14;
	Mon,  9 May 2022 08:14:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0DEE1BF3BC
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E6A6403CA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 08:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZH3ya7afEun3 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 08:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::619])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2910D408A0
 for <buildroot@buildroot.org>; Mon,  9 May 2022 08:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBSjPI0SDY6caVSTGTm9gu49QUYidwiNdvYMgoQ18SeSzay/bpnK9emooLF42DmxvydMMG+57dwKo7EPP1XetK39+bQElJYBFUhKWFCh7JtZ1PZ5Kop7T9IzC2qz5M5Cvvd9r3fnnijUSzeu99dffy7HDYPGU32BR8e8ZH1v5IBfhb/v9h9vPUHf+qQv61z94V5/nosFIAysCHaLmu0FTBd8fsK51TXpBSptQMYG0Id96auE1OmbV4WeIMaZ4MP5ODYITz67mXLYhE9inpLqCzqYPSia0sR0VFtosB6g56KE1PpppHpBzb+8y6JNEFnVbcxKmmY1KlaBe1UvLXzVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chfciXaUEeR+EA9a79unPn035y9j/ct77fUyetvcqCU=;
 b=lRP91VYtYS4L6eLrujIzBivnNX9F3L2RPezR5nA7EMMlthydu+VAqThGwW6jQB7qqEx8eUDvVcQcTSjUpyhWptZyfKnISntkcmSSmckTfWD7p6Mq6xH9cH1ibdxGBMiHtBRk8ZunfjwB1cw0xLwRjveF8+iBXUbyo3yS42Lx2i2sPRJH2cd8dxe/Q5gJnlbETXnQP0/ohU1r+cXNIQceIIUaocJK3LJ8JYt3daveHeRoEtqF8zFgUUrrQY+m2xuVjoZGtYAFow1TslkasohYP9nZ+VL8bWqmYCMz9KiAow2+5/EkZifyNkNHW/on7iEyrI+Qd7mfpn624Tkkm0zPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chfciXaUEeR+EA9a79unPn035y9j/ct77fUyetvcqCU=;
 b=D8rIgejr0algdp8rgPVoo0fPj5cWrcBp/jKWs+gRLFIqyhju+AoTQTZRYjhDeDPngHnFbI9vhqxDjWSplzzB2lnMiZKMtYVhTrkolHbAKjFzKSQgzPsoFF0KNKbNohh4BhpG4T2/o3u0tjgqwTVF5jNooBbAsDtHUK7t7GH+ce8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SJ0PR02MB7775.namprd02.prod.outlook.com (2603:10b6:a03:326::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 08:14:19 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:14:19 +0000
From: Neal Frager <nealf@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>, 
 Neal Frager <neal.frager@amd.com>
Thread-Topic: [PATCH v1 1/2] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0SPCfngAPwyoCAAAiI8A==
Date: Mon, 9 May 2022 08:14:19 +0000
Message-ID: <SJ0PR02MB7758F9F8E824B6B02459AD60D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <87pmkqzcsf.fsf@dell.be.48ers.dk>
 <32c2dc3c-10c1-cda7-219f-f3753940f294@xilinx.com>
In-Reply-To: <32c2dc3c-10c1-cda7-219f-f3753940f294@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4343c447-3114-41c5-62a3-08da3193eaa3
x-ms-traffictypediagnostic: SJ0PR02MB7775:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB7775764FBBF8AE316DB37719D7C69@SJ0PR02MB7775.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q/Ir6P86eKG8civSNywo6XRvzRJM4qBaySmwFP76O6/1KzCsbStPITqmQObOdwk9Qh54JGyXeVqmJ8PzpO9IpVjZXxsVTdmWLHFe3ihiuty6bskKiq9olLzH94vNqigFAqtJEP8p9HvrTAAinxZeofHHjO8vM+E4ajYp1ToQ8ZEANuPw2g8/peAhyVK+JChuVXbbiUr7mg0655f3qRfH9B3c9V8Zanazu2gr9XVg9BpNjx1Ge4WAxpBx2kPDW2SoTQIOj6junJru3XwB9x9W+wkrJPLcD1PB8RpxSI3iganPH3OZAcZvJA95sCPqJUPRkyxiGW7MnxSFHM/Vtj4ew+oYSfWWmU6XVRYdvqcrrN+dDKM0LlpHxiKOEotNw9tane8yC3tCfoVxPddeSO+9+wsrc6fESbLZVK4uSDfTyqpldkCFqg8jBMoWZ2JfCmnrb+zH0LV3cKPoV7ZlWlWFM8bySTsKaIXDR/L3uPzN5kFq66b6Ez8igMzSh/hvW63Bi0JV/ER7jQ8+LmwP0ctxGNIBF1pgnX+TBa2Q0VtjFA/t6TkhLWHhujXj7MmHfARei8LP7wpL6HSzU9ZwHVZSUxp8/j86FHBtUef1d1pk9zdthsUh0/W2KZ4ZtN0PAhE+mXqy74SuBOs6IaomnQwKdwnVPdwlRXMO7u6vjQHAUt+U9ZzuWLfiGagh/X0TsEqecChDgFXz6Z7nFg1kHp1aLHG5ji3yjP41ENdFOg4cyJXkMXz/ufK1O+qtlG8axkF8goD0qlmEhfvX1WtXQ8TkLpHUTTbWjO8Xo3AkCfNthHBHrblpoI+5TrOrF1udtj/UzYJ49eNdilOB6BDijDvcPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(2906002)(8936002)(55016003)(122000001)(38070700005)(38100700002)(5660300002)(110136005)(508600001)(4326008)(186003)(83380400001)(33656002)(66946007)(66446008)(66476007)(76116006)(8676002)(66556008)(64756008)(54906003)(316002)(6506007)(7696005)(9686003)(966005)(86362001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1N1Y0FQc2FvQ1NINFpEZnFJUVZReFplTXBVTVNGM3VpZzE1RXp0SGNuNWkw?=
 =?utf-8?B?M2RMNWJ2VVlDbGIyd3hCZTdJbE5SMTR6SHJ1MFlyUEN2d3RxRUdYeTlkSHdT?=
 =?utf-8?B?ekRaMnRDOVNRLzQzenptV1JyK2dnd0F6blBJMnMrYlRVNlg1UXFyVk9ScVRk?=
 =?utf-8?B?eVJEQThhRmUxd2V2b0dJemFtd3pMMm5KaWFGQW1zMFc3THNhalpQZEdpenBP?=
 =?utf-8?B?ajYvZEl0MS94MnJOV3RXWVVEVVllMGJMQ1RWaDFrM0tuYVh6NWJyMkxJeUVF?=
 =?utf-8?B?L1VNc2lCaS9qRDlER3VRemdPcm5jdlFnVGN5WkZkVlR5T1dzQTd5R2JaV0Ji?=
 =?utf-8?B?T0djRUtiZ0l3RGU3bzhoM0xybHpUSzRXRHNNSEFkQUs3TGM3L3hiZ29leXAx?=
 =?utf-8?B?ZWRQSG9JcnRuZ2hteHFXeHgwbWJ3a0dBNG9ZT0doY0V1eGN6NUlIOWtpaWFD?=
 =?utf-8?B?YldWZzhhVDRiYjhNM1JmYUhZL0crazRJcFcvOUJzaTBEbEl1ZnNDRU5vWGN4?=
 =?utf-8?B?eWdtZ1B0NmlwZHlNa2xwQU5xa3pqbmlOVExkZFd4VVNMQVVFUTdqdFI1ZWFN?=
 =?utf-8?B?RlVhNSsreWFKd3ZYMFR1L3F0VmZBdTBJemVPTENKdmhJV1RYVFNLMWEvWjJ5?=
 =?utf-8?B?ZEY5eTk5aUxYZUt4eVZad2I5RWxZMXpkTmlvbmVibVlkVG1kK0VSdk1lbHkz?=
 =?utf-8?B?eWs1Wll3aTlyMisrVkIyYnhaZE5LbFVubjBOeDEzWFV1d2p5ZXB2RWRIZWow?=
 =?utf-8?B?YW42a21CY2VDMzdCVk5SK0RNdVFpTkVZcjJSdGZNOCtIZzNJUEdXSmh3M0hF?=
 =?utf-8?B?ajlpekFmUmRFMXlnOUZETzdRckFvbVYvTFErKyt0V0lsblNKa1RxRW9lWWoz?=
 =?utf-8?B?Tkp1U2dYV2RodzR1bTBaN0ZjTVZIdldrK0xsc1dhSmJRczJjSDhIbW5qK0NC?=
 =?utf-8?B?YzhDdUZ0K1lUR2tMM1NpWlRmTGx5TFU0aEVuTGdPNFpYc1NPbDJ2NzJyQ0k1?=
 =?utf-8?B?eHIzbWJmYnY1WkM3a3pFMEtkSEZtaG03NDMvVEUwekQzZ2c4MTdaRytQTFU4?=
 =?utf-8?B?WHRhLzBrOWxFZkpwKzhVaGp4Q1k0ajlTdkI5VEx6cXl5ZE5iUnVkc0pNeHll?=
 =?utf-8?B?TjVIcmpEK2tJcEhzbGpMZmsrMDVSUlFrNWIxbWVXSDRydzh4QmtHN3JSUWVK?=
 =?utf-8?B?WTBuSVJDYjR5cEdJdkFpRk00ODlBUUx3UDg0bVB0cjVBbVQySkRiaWxYQ2dz?=
 =?utf-8?B?anJmTWtKMlU3RExQdTZMaEdDdytNdGRDbXhJdE01Q3ZrWEd4Z3FBMUFHVUhh?=
 =?utf-8?B?TUVHbU8yak11dS90YWx1YU9rbjF2Yll1WTBGM0JhMHJMOUVVQzV0b3p4d3Rr?=
 =?utf-8?B?d0g5N3czS3M1SE9sdFdrZ2N5Q2tKd0czYjJBYkQyaUtVbjkzdHB6eFI0aWVh?=
 =?utf-8?B?RjNpVkttcVNHUUlrY2tFYXFPK0tuR1p4SjNPUUlHcmJEY3ZEaW1IQmtmRUM1?=
 =?utf-8?B?SnNacW4veUtFUkpSM3RMbVdvdFc5V3NYdkZUUW1WZ3M4eW9Ed2RFeEJkalZR?=
 =?utf-8?B?L0RrTkl1MlFtaDB3R1N0SE5IMUZReitUTVplMytlZWdmMTl1dnZpRVpkZmdO?=
 =?utf-8?B?TjU2ZVI1NlcvejNIbGh3NktHeDJWSHMzOHptTis3NFRkTEw3TmFBR09wdFRE?=
 =?utf-8?B?MXQ0b2VlakxTOE9NMnNoVXpYaVJWTVcxeUp6enh6LzEvbWx4NjZYR0lHMlI0?=
 =?utf-8?B?OWpjWWIyOStTcis3dTYzNFVKeUtMMzBzMWxpV2pEaEVQNmIxZkJFSVJNSEww?=
 =?utf-8?B?cGZ6LzZEdGNzUXFkOFU0ZXVjczBrVG40UFNvb0Yrb1F5c0hLeUZpTElHT1A1?=
 =?utf-8?B?WlpNNVNiNXA2M1JTK1VkQVBZdndMM2cycWhJeUtpLzRPdnBURkg1dmtRdklR?=
 =?utf-8?B?cEFNdU9WMldlQzRYNndyV3lJWWhwbVhhZTdBTU5tRS8vNnFacGJuUngrcFlJ?=
 =?utf-8?B?cDN0aFJ2NG5vU204TkllNGNKM3R0Qk1yWnM2L0JQQU5TYXlqL0krZ1VNeDlP?=
 =?utf-8?B?RFZsbXRSbjRlbHgyNU90VzlsUWEyc05COU5YZEo0YTdub2JuaDA3dVdDNE1N?=
 =?utf-8?B?eElYSThtM25PVklPak9udlJxUVNvSWd3RExTMGxKaGsrT0w4aEQvSDI1MHpF?=
 =?utf-8?B?WlowMURUbmk4T0UyOU1DdXdmelh2TmtZQm5sZHRzYlR1eVJOalJOYWp3VVJ1?=
 =?utf-8?B?UkRSZzBuUFVDRnh5NTNsTGlHWnRHczhDMUg4T1pJSklacVBZMWZpNVFoVWhS?=
 =?utf-8?B?aXVWbUlCMGNIYzJDd2RBSHNZZW8ySWNqY29qZ25XbUxaNDIwZ3VYQkpTcEdX?=
 =?utf-8?Q?b+3XoREDYb1bqY+S8X9GJABGsXsgv6k5DSlaS?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4343c447-3114-41c5-62a3-08da3193eaa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:14:19.2407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSeCup2lcrNQvnn3hDBzztrpg7GVkrEKnTrDI9jMzLOLmuQXpei2odlYjB3RoawIK1r4gQrDnNGDItSESqYMCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7775
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> 
>>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:
> 
>   > This patch adds support for Xilinx Kria KV260 starter kit.
>   > KV260 features can be found here:
>   > https://www.xilinx.com/products/boards-and-kits/kv260.html
> 
>   > While the Kria SOM is based on a ZynqMP SoC, there are some key
>   > boot config differences from the other ZynqMP evaluation boards.
> 
>   > 1. There are no boot switches on Kria SOMs. The boot mode is thus
>   > hard configured for QSPI flash. A pre-programmed boot.bin comes
>   > with every Starter Kit. U-Boot can then find the Linux kernel and
>   > file system on the SD card.
> 
>   > Optional instructions for updating the boot.bin in the QSPI flash
>   > can be found in the readme.txt file and the link below.
> 
>   > 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM
> 
>   > 2. Kria SOMs use UART1 for the console instead of UART0. For this
>   > reason, Kria Starter Kits will use a separate extlinux.conf file
>   > from other ZynqMP evaluation boards.
> 
>   > Signed-off-by: Neal Frager <neal.frager@amd.com>
>   > ---
>   >  board/zynqmp/kria/extlinux.conf        |   4 +
>   >  board/zynqmp/kria/kv260/pm_cfg_obj.c   | 556 +++++++++++++++++++++++++
>   >  board/zynqmp/kria/kv260/uboot.fragment |   1 +
> 
> Are you planning to also support other kria boards given the kria/ 
> subdir?

> you should think about structure in a way that it is kria SOM program. kv260 is xilinx designed carrier card for k26 som. It means any user can take k26 som and create own carrier card and maybe push this to buildroot to support this product.
> And also k26 itself has multiple variants. K26 on starter kit doesn't have EMMC on it. k26 production has emmc on it. There are also C and I variants also with encryption enabled/disabled.
> I don't think you should cover C/I or ED variants but definitely you should think how to handle different SOM types especially in connection to populated EMMC.

> It means
> board/zynqmp/kria/k26/...
> board/zynqmp/kria/k26/kv260/..
> board/zynqmp/kria/k26/custom/..

> and
> board/zynqmp/kria/k26-prod/...
> board/zynqmp/kria/k26-prod/...
> board/zynqmp/kria/k26-prod/kv260/..
> board/zynqmp/kria/k26-prod/custom/..

My objective with the buildroot defconfigs is just to give the community examples for how to build and run buildroot on our evaluation boards.
Developers will then need to modify these configurations when developing for their own hardware.

So looking at your proposed directory structure, I was not planning to cover the production SOMs.
My focus is thus only on supporting the starter kit configurations to give the community working examples.

However, you do raise a good point about the possibility of new Kria SOMs in the future.
Not all starter kits will necessarily be based on a K26 SOM.

With this feedback in mind, I am thinking of the following example structure:
board/zynqmp/k26/kv260
board/zynqmp/k26/<future starter kit based on k26 som>
board/zynqmp/<future som>/<future starter kit based on future som>

In other words, I am going to replace the kria directory with k26 including files for the k26 som that work for the various k26 som based starter kits.

What does everyone think of this proposal?

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
