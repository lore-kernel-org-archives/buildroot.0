Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3901C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 14:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8344408AD;
	Thu, 10 Feb 2022 14:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLe18izrepGz; Thu, 10 Feb 2022 14:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0AD54051B;
	Thu, 10 Feb 2022 14:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65A11BF2AA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 14:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 929E060AF2
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 14:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFkSoc3V46eB for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 14:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 629FE60BCD
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 14:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ei/c/qI4OtFVUFuSs6f1/WwFNDgT/wrOcr8wD/Iy1o6jNO7iCo+3jYla6L0nBm+lRnCndSre+D8Ni1t2g8z55NfeaaVjSt1uV0pdomA69E4eXhuMMU4GKEdRH2lSWDgNdCLI92xZcKrCALhBJ4Ix2T7xTHtW/w/7PpUFSFrHmnnWyIAXmNrIHUL6EMb0ANXED25rPFpEJkKx2CV3gU5PdbnXdN+ZxWWl9aLM0medf1hssV1KA6yYypjGhcYQ2CB6byqkC/eoSgO9PhEhrIBcyHLPnqKg9fNUwKXOYYPADG56/CST1enjfBd2XKOFYfiiUoqGXEOFfHT3uFMvStcIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMC3I+lbtjPvA7/cIGUyThvP43AFCqJopYJuFiwxC58=;
 b=U6UAJjvYdjkNzz7FzC28nEtqtvhC1m81bhjtqac+GtgBvOrQpsyLu+XPhuRgNlBGFQpyWUkIBPPz4r1fMjukAVlL7CSFvbeCd8GxnGj5fBq6X2glJymJhqcprUUlNNxECCSgCG9jQ/C7OY/FZcNHy1K1rm2hQsMYKVLMKpjNdtltMSpJcmuhNt6e+a0tC08l1VDy4TLug84AGdKvA42b6/WC8VxtzT7Ch8yKtFqU9gk/Cg9dnio6nVAqiJ1N9TsdDgYvQmJUxtxDtObXqV0lvdGe/wAqjVz6847FAC/r1lgxHMJ+R4oZpD2CbfT4dSdm/WHDkFXqmZWJinw8TT0E/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMC3I+lbtjPvA7/cIGUyThvP43AFCqJopYJuFiwxC58=;
 b=EBbt5KWVWjpZi1rAyeYaupB8PPC190IyiLkJUq5og7fxrDjRXzwOan75AY0B3S0nhSbG3d1kg1J5RcMZPm7IOGxM9PpVb+ZgeOOUcdAVKdkvRC/w5mZMHKN1mtxmaPq6YrzMC9pu5l7aYjzLgvwTce+VYSMS1X0zaFzP4AWeekY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CO1PR02MB8347.namprd02.prod.outlook.com (2603:10b6:303:162::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 14:19:03 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:19:03 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] [PATCH v3 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHd9VHIpyl+j9DE6dyYM9V88dZKyLsIoAgADCpLCAAFqkAIAACEeQ
Date: Thu, 10 Feb 2022 14:19:02 +0000
Message-ID: <SJ0PR02MB7758B9CB742E063B547278E3D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220209180306.2629180-1-neal.frager@xilinx.com>
 <C2A6170C-3951-42C0-A6B0-FEFD74238480@benettiengineering.com>
 <SJ0PR02MB7758493F336639F00D599770D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <eec4fc17-e588-64a7-f700-ebcc3eae5f0c@benettiengineering.com>
In-Reply-To: <eec4fc17-e588-64a7-f700-ebcc3eae5f0c@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88ae558b-21a0-4e74-e1af-08d9eca04a04
x-ms-traffictypediagnostic: CO1PR02MB8347:EE_
x-microsoft-antispam-prvs: <CO1PR02MB8347F4126CD7634764C28FBCD72F9@CO1PR02MB8347.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gQ0jmWdqb+at69QtfgEJ1KMvOAeXicdSs/S3B4jilf1PuN8ted6DJicZUD2zbb9UNPVNehBj65yUxH/wG2tbGxlVksl6KAXlAxSCY+rCOaQw1MIzk+D8LO037i40Ue/U83VJhxgM+w9AxodTrWl/lGqWM06YwZTsj6SKlNot+nfp/xov73JjLrtvkFcwwJaYHMkcWWmQ8eykOnaM4tmN7X6F/71r9PnSbcfMF5sJnQDx3tJPd9EtifPGM0JUewOX4KjTBfAOEDhcZDDUIxHBFOsWiC7s4jJfd26PaJmJ9SpKR9DHjObKFgO7rOd1FL8aA6RLLjqFvBtfc98CwTP66jLnEdQn49VusFTgthgmJWjB8wxGug4MTLO6L6CT1hr1kzzovi26F7XMHeXthilfuSmIk3N3MiO1fJOwJyP1lyJPs/VBJrOmjOSo4D692KizzSbPt6SQFTotOHBZ9Fyytdpf2ibf1WS4nnwrEVnQKH6MJxmXkJ8jHlOOoWjV7sVDkDeXR10kX8glYkrbnJLYexJhg5jEG98IiY60TjS72uvJaVLnaZX/ZPU9HBwh3tHtNS4yGEBZDuoj8V5WQG5skUumZYLiLu4WAEvGZbmoxXWaM/PnKlQJrtLeGlGZROxIMLve3BO231mSp2RRGGVqNbGA3AXc3Ipicr8Vs0f8bY/TDhMqg4FazgmZxJfA385Zcgc+LQBnP8FgAu3AqpGjdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(54906003)(8936002)(26005)(186003)(6916009)(66946007)(316002)(66556008)(66476007)(66446008)(76116006)(86362001)(8676002)(4326008)(52536014)(38100700002)(6506007)(7696005)(9686003)(122000001)(38070700005)(71200400001)(508600001)(33656002)(2906002)(55016003)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2MvZ2NvQ1QzVHFCMzJzOE5yazFTalA5ZXZJQVAxU0tpc3FhcXZ1eVd2WHBr?=
 =?utf-8?B?N2t3elp0dW9MSUlralViR2M1TXlxelhNT0tIc2FsZXI5ZW9QUzRMa1ZRd2dF?=
 =?utf-8?B?clRxbFJvdTFkMGc3TGlPSHNwbmJDUTdBZXJ0Z0pMKytJODNmZ2U4YW9vWlRW?=
 =?utf-8?B?SU9aV1lKM0FzZ0g2Y3RYK0ZnSGtTOVVlc29mZ1ZFYmVpUCtPdENFK21ZTUhU?=
 =?utf-8?B?dFp2cEpaRWVxUVozWVVWalpTZnVWQlRRYVlqemJTSVdMMjB4bG9SZkg4SjBj?=
 =?utf-8?B?bUhiVVNqZFdMbGNhNEI2TlNVTHZhVnlRc2xValg1b3lQSks0NHV2S3B6RTg2?=
 =?utf-8?B?d1orNTh6RDN1TVA0cndsQUZ0Nk1QK1dtSnBpb25PYlJGVUxkVzdZR2VkVW1v?=
 =?utf-8?B?Y25EYlJjZVZ3MnBwaGVyOFlaZk9JekJDQjdFYmdVeWdkU1h3a3JXSU5VbUp1?=
 =?utf-8?B?OFk3eW5WNkZwTFBGdUJYSHFkaldpMnZHL2pGTlkvMmd2czBOTjRMSXcxOFND?=
 =?utf-8?B?ektkT2h2ZU9hQmhRT2JXY2Iwa1cwT0RxWEt6ZWZucmQyYmdhRFRzbmVIZUI1?=
 =?utf-8?B?dUF6dUdDL2hHZFRMbks5aGtjOWQ5aFJTOXB2eFUxaXdKekhYc011WU1QQlBI?=
 =?utf-8?B?Wi9UZ1hHME9Rc1VwWWlIZkdGZzBCNEhqanh3OUV6Unk2eTMzZnRJWkQ0RTlw?=
 =?utf-8?B?aUVndkZ1ZlRaM0RMdThvVktOdVk1bndPdkhVSDRLOUIwWGh5Q3JHbENhR05v?=
 =?utf-8?B?alU0djUzM003a2x6Umt1cng0V3EzVGo5VVBnejU1NGVuYmtQQUFKVWMwNmdZ?=
 =?utf-8?B?K3cySURjcnc5eHpYU2RocHhDc01aaVpTdzdMcGZ5RHhDUlMzVXA2Sy9UUTEv?=
 =?utf-8?B?MFIyU0t2dlFzczdycC9aa1BxSFF6WGRnSmJielFEWVphVkIyZzZYZVN0bnNm?=
 =?utf-8?B?SXJua1BMUDVsc2JnblNYTSsxVlR5WDNwK0ladGx4ellZbStSbkQ1NC9tNEow?=
 =?utf-8?B?U2RHa0dSb1hzRmdwV3VPZWcyWi9HVEdUVmJjcnN1Wk52RThGM1l2My9ySXdM?=
 =?utf-8?B?c2EwaUc3QUtMc1g4eUN4UmdjbHVRazFLTU1tSDh3ZVZzcjM0MVo4VnBWWm1V?=
 =?utf-8?B?MlRieGhSOXFzZU1JS2VvMnUxanBzNDhTTjcxRDdTSFF2anNTd0p0VHZRblh0?=
 =?utf-8?B?SmVEbVFiUk5iRTFmV2FjQUZiZmttaGphNVpESklYUFY5c2dkSHA4WEt5dElp?=
 =?utf-8?B?WElmSVJnRjVKcmZtdWFjYlpzMEdIYXpRcTZ1V0lQNjVIcExkUU9wWlZvbENI?=
 =?utf-8?B?RlU2R1ZEaHNsVTBRV0FDcVRRK2VXR3RKT29TTzdNOW1oVnhnM3NJOFh3a3Vw?=
 =?utf-8?B?WHMyUWNXbmpZSWJGN3NHOVd3Q0RCdzZ4SlRNbkI0RzNCUVE2c3hjRHUxbWtG?=
 =?utf-8?B?SnNzVUgvVW9FSzlqTTgrTWo3Y3J6THN2UWpSSytmV2pmWHE5MGRFQUw4dWEr?=
 =?utf-8?B?TXlrd1FkOVVYWUpCUmc5cEN1U1FJdDkrbS9RbWdaNy9EbEs5VUtlSEFKMWQv?=
 =?utf-8?B?bW1MVU9Zb2xEZUVyVnNEZi9NR1hPOGVFNUpyRUtZaHBsamRqbUNTRmhRTTN6?=
 =?utf-8?B?YVduTjVrak1ob0RtMnhaNEhpSDVtbUsrSFRnOHpvL29OTEZTMGJOY1o4bVVB?=
 =?utf-8?B?T044RjVnN1ZNSjFkb3k1dVI1K25vZHVkeW8rcHFhMkZmK2NIcGxnelNTYWxF?=
 =?utf-8?B?SzExc1ZhM1JFWXYzd2tLSzhYZ0hjUHdFeDQ1bzBvRkN4eHNKaFVzRWdLZS8y?=
 =?utf-8?B?YWVFTSsxSmFUVnNxMCtLaHdUdWw4U2I5a1JLU25oTE5nUURBY3F5NTFqMlQ2?=
 =?utf-8?B?c3hOOXVYRTltN2FCTzZZNmpnUHh2djFmQ0o1QXlkRE44aTYxWFgreXhLcndD?=
 =?utf-8?B?ZHlTb0E3SC9xRUdwbDNkZGRSM2pHVThBZk85c2VPRVVhcS9EUll1UXNYcmdo?=
 =?utf-8?B?MzF4Y21TQzZQbG50ZUJwdEM0akJKd2ROZnZpZDZieFBZNW9KTHRENjRlYTBM?=
 =?utf-8?B?Z0U4cDhpVUh6MUhQbHZ2ZUNrMmR6WGlYM1pjYk1SNXM2d2NhOC9yYkZ3OUFx?=
 =?utf-8?B?N2RPVWp1SzdKQjdoeDZkZUxsNWRmMmtDVndxRGZlRXFQOXordHZXVUtHSzkx?=
 =?utf-8?B?TEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ae558b-21a0-4e74-e1af-08d9eca04a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 14:19:02.9298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8dRZnMe72z5Vl4+ukGWyOPBezUEDabfW5TJFDk1A+e2RWbA9mZ5zaV1YPxN/OZpfhXkYR6VFCGCmtP98whcBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8347
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/zynqmp_zcu106: bump
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
 Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> I've rebuilt both of them and now they have my tags so they are ready to be committed!

Fantastic!  Thank you so much for your reactivity and support.  Now that we have done this once, future version bumps will be much easier.  Please let me know when the patches are committed, so that I can clone the new tree.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
