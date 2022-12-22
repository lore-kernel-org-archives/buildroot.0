Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E02EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BB940022;
	Thu, 22 Dec 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BB940022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NTEf4raumSM; Thu, 22 Dec 2022 13:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D76B740136;
	Thu, 22 Dec 2022 13:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D76B740136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72EFB1BF577
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40CEA80BAD
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CEA80BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Vai7TkH6CcX for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 13:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410A280B12
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 410A280B12
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3PUnsBUqcYHgJRu83KPgSKOhBplqqQTTHbO1kvtGo1W/ZDJiP1fNdJkX/K9ibkWBhDlh4AK+YLm90es81taPYKx6LY8taPPVF+8hUzdhD6ZqXH2PeZxrY9gmtFVBmG/0WpJbd9fOX6SJgpS70hZ3VSPfSOuGW/V4ngK1PBhy/4/WHkzIm2XOHKggJMT1TAc0I6xLnOmd7DcwJFj+TEOLkgHEyskxLqkdjArNzLfVfkkcGSfSRn2bWqxKh6kTLakP/sd6mVJh3Q0eTj5V/9vlKCl4/CpRpCNzdGp7s5weqSztlIenxY+rEo0Nzn02uCJfP6CF3WyTINSR9902XKRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+uCZTVFNtnu/r2GKtz/PsLX/urZLtAAaay6q7BqQbU=;
 b=F9RDZv7Djdb/WSl+JiVQTib1idwyFgKe9+syE6iLIs88g+9lPCn5Lf4auRrSBsmHErVph6NRkABMxIrk5TcbAARHE5NrooJuB3SNgVR2lOPLWCOvHTFI/79dfub8JVvqJ/w3WuNatwu2DrkArIiKDvCXCUhctJduuX+ZDZPArBFSONNoeHBEqnaVHPa3uLLP3n43KeNuH3BDmLkQO6NzJQ+VOkEeZ49wSJ0wRmjmeQniuWr2M4qleFTQWUNjEO0KUFB3+M/tNQ8iFDT7giZDIqtiskARBrH9Hkt4NXdapMIqff8hR8xik8cI2nlDIgzSBX15Or3GFlqAQwJUa+7fMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 13:36:38 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 13:36:38 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig: new defconfig
Thread-Index: AQHZFgoMZwhdvNQ7zk+o5o4BXtj+ga556BIQ
Date: Thu, 22 Dec 2022 13:36:38 +0000
Message-ID: <CH2PR12MB50049D0EC048C43418BD6655F0E89@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221222133350.13402-1-neal.frager@amd.com>
In-Reply-To: <20221222133350.13402-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB8571:EE_
x-ms-office365-filtering-correlation-id: c97394df-918a-406a-deb3-08dae4218d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CownjNdfWGNyEbtJX4ctXvE8Z8xGeiLWBh0P3LzAm7HQI3aWUa4dvQ/txhSbU+mnLW2B/Y3OoQ8Adsbo3LTiJLOPF9JlyMOSD+KC7ewat5I8i53qOQ98XlOcNhUMwDrBfERLxvGjMN0oL99rdRznRbzWxeZl4nFLR0w7eJTp50mlF1g3WHMe8NMnj8KLQ0Gpvw6pqI9y8LRuXxdLj7I82TsgIU2pyRTO5HxQuB0b3fEgDpFI4uP2wYi3WXFbGp0G1d+CINpDWkTeJY+J3y6PWOjg7EdL34ZwMpNuZeomhL8DgcDBXjBbNJvQ0x8rOCS8cFM2gHst5yR50cikWm8sHx5mkhrtChl7UlZkixamKnM+hE7yS0v9rB0fYAIWNTOIdrGpdAm97Q2qGWINyDGAQ/fzswh5yr9DJA32mSVG5rWzVWGhus7QI3XGJqcf8b/OjcpacGeRL94ruQzgdO9NEVZE7Zn39ziA1PeobMzEKMeEspsEYUjeR3WkTfB6DeDk/sfE1/P9i0W282JVz3C/kpK5+yrX0eZng87eBzQVnWMHVTGHy7f67bDHjrrFdbPwKka7AhrH64NbSuUWRvu5vYG8OGZ71UgFRuP0W60a4zHzX3zNK7UVknt/DBx/YFm0WUfYCv1UsqiPGxjJZ9NULrnnwv5jNfODkMXmSAKBjjGySnJjYOBbvsMEPkNOPMtQ1ufRtx2ZoJT2nf4ytmwq3jW6tIO6hslag72kibVF7AeILl2G9zInI5y5kN8aANLK2fmZu/tviuOeaMl07vjl1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(33656002)(38070700005)(55016003)(54906003)(6916009)(316002)(41300700001)(52536014)(76116006)(4326008)(66476007)(66946007)(66446008)(8676002)(66556008)(64756008)(122000001)(38100700002)(86362001)(478600001)(9686003)(2906002)(8936002)(5660300002)(71200400001)(966005)(186003)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0tXaZybemml9FfaZj7c6jR7bkmwP7I83I47+pM88x66EpDrke3Jr5+GrpLC1?=
 =?us-ascii?Q?X1RogiDa+kCbSk9L91htMghtR7X6WyNTwghvTbr53hOS7AbMPxJaY9OMJznB?=
 =?us-ascii?Q?z9kmx/+VrgQqEdQnRc+IAbzhaSnFwTMTzn3XqKxSZ5Y8pXwD0VsQ8UvxclHU?=
 =?us-ascii?Q?JxSFGJ7bzB32tZZecTNE23qOjYRY8SjstgbSBV+pNZr88RSi1aK/1V8ZdiYJ?=
 =?us-ascii?Q?GJXMUw7VunhMRrI/3b+VA51ceFe6GKlBFYRe9wSLGu3P7Vmer90SAx5Qw5t8?=
 =?us-ascii?Q?2ITf6iwG8rJxkJE6+sqyKMiQZxIDDF66u+UFErKBkVj+goqyiqs9UiB+Umy/?=
 =?us-ascii?Q?xLH8/ICPbNvAdt60JHci1N2RrJEAsqox0O14C0ctiHWdfGzKZYJ+WqasdBky?=
 =?us-ascii?Q?ZoLyv67ahrl21nhidpp8/WEUgtxzaWmgwOSwjIBjWMW7ze3N8gxtp9xaMaRr?=
 =?us-ascii?Q?OZTSYmm7835XmfEyQLkWS0T5324btmwinjX6ZhtpOjrX5ox2wCkCNJWA9UBE?=
 =?us-ascii?Q?5Ch5UchqPOiRxqMwtEC4tSier3uaHWl119H004IxhJAdvKt3hkqA3qK9pD6Z?=
 =?us-ascii?Q?54xNjTuKqAj8y70QB84X/UOmsxuePLPzFmrWe1IK7fco/gBnXljlNQj6nKtP?=
 =?us-ascii?Q?taOUI5rReYaMv4cjvn5DxgKLJvVid9FnAnVCium3o+2NcF19whS2UDIyaGci?=
 =?us-ascii?Q?jpJyM5h7jqZK00yWSYDTqqheb8OZ3jcxqcwhB1Q8AAUdY2VylljbUttzA2Wb?=
 =?us-ascii?Q?NM3kUvrBKc4/WJzBbRUnUMq0dhuifdtrheOExoxzQI9y15+DtBBYiBf2L72m?=
 =?us-ascii?Q?FWAw5P+8/pk92AWGhZE9ZegzdkuJ2GEDOpTJElFuqjX9cqPoSJ2ZmkjOx5I2?=
 =?us-ascii?Q?cNQFB+/WyKIVNt+j/F1NdCkNAf26QMHASl1w+vE/tF3kIL/QD24TXXv904ll?=
 =?us-ascii?Q?q0MJ9LWk3nlsdBut/Dt04ggtvyzJxEwS8tU0WB/8qdQDoQS7ZXt3BwSKVDPg?=
 =?us-ascii?Q?HJGiqVuRswDmzvpcI8AG9eIM5RT1nXyb2gMy8Olu8oQuBH+zaGCqgadEm/s9?=
 =?us-ascii?Q?JgHklcORDhgZbQBkLVMMHWmJP/+H81xVntONb2g/8+EVA8cn4kMqcp7kxCdL?=
 =?us-ascii?Q?OIDGTkY3BV77LK7SjzGurDXPvoc+wTstxQnaLOCDEvqSzWUZiHynZ8toybjN?=
 =?us-ascii?Q?hVP4ZBe8OvuM3OT985WhWE/7b/0a8Fh2XXNbI064Pb4tWSlkiJmFha5r0kll?=
 =?us-ascii?Q?9rq+USDi1p8hDTznVV4665GtiJ23w/UcsQosIvivE8CsOm96yHft8B14IsmT?=
 =?us-ascii?Q?zIhI3QWZFq7fl1yBplpQdJ8PFAc0PXp0SzuBu1sxLFU28opy89FjsnY4j8sE?=
 =?us-ascii?Q?btboThnPm9IIN6F30c1si+5S3mCzz4IBnpkxh/zKFWKP1Qly3uFU6ZgHVGhf?=
 =?us-ascii?Q?OtOh5nfnrgeyxUMT9AABCCjMtJLh604PZ88VFLwCH0kzJiSMnQOX5+vogQEH?=
 =?us-ascii?Q?3CLGrqxmYJKBiSC8/uxCj/ThOg/ecf1x021+vfQ7Ig2ZoAWGbNVKx/dx9w2t?=
 =?us-ascii?Q?ft7evd9SYk/utWLkY2F6r9SB7Dd75KqEcbOPlLQudG+zTGg+ACgDkrspN1+h?=
 =?us-ascii?Q?f7OmE+HmRUQb/4423SoL9G0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97394df-918a-406a-deb3-08dae4218d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2022 13:36:38.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+WYw1EWlT8cTf5NugFkIkLJYVjFZm/1u43x3BMRm59hVQ2YrRjpqc08ABEUyJcU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+uCZTVFNtnu/r2GKtz/PsLX/urZLtAAaay6q7BqQbU=;
 b=euwhG7dVmeobzo23+t1ciaU7dwaZUjmfp4BCblT2HIA8OgSAyAAvRSWZJb5bfe8EjtjIkbE+LnhQsW074jFOfT0mKtXTeP+xHB0462NgRcHLORvJHWrNmz5b0jXI1EbxTNcEAVDApRsyS437QBippQ1ldLqXCQOGD35BsCeswPU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=euwhG7dV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

This patch is dependent on the following patch being committed first:
https://patchwork.ozlabs.org/project/buildroot/patch/20221222063710.4324-1-neal.frager@amd.com/

> This patch adds support for Xilinx Kria KR260 starter kit.

> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html

> While the Kria SOM is based on a ZynqMP SoC, there are some key boot config differences from the other ZynqMP evaluation boards.

> 1. There are no boot switches on Kria SOMs. The boot mode is thus hard configured for QSPI flash. A pre-programmed boot.bin comes with every Starter Kit. U-Boot can then find the Linux kernel and file system on the SD card.

> Optional instructions for updating the boot.bin in the QSPI flash can be found in the readme.txt file and the link below.

> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

> 2. Kria SOMs use UART1 for the console instead of UART0. For this reason, Kria Starter Kits will use a separate extlinux.conf file from other ZynqMP evaluation boards.

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
