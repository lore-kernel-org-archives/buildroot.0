Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5390C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755E541743;
	Tue,  3 May 2022 14:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xu7e1CPRB0Zi; Tue,  3 May 2022 14:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0B84170F;
	Tue,  3 May 2022 14:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0942E1BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04DCA81415
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LovPgr7Zr4Ba for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:38:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D0A6801EC
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJHgXPze5VPoek4Hs9z53SV0H7SnHFBJ3ZtlNmS2GJeEqV1hVlB0eFdsjzOnchijD856nqHgLhxl/Vc5Pc0jIR2huj3bNLbQcUkJNcNaQ24Pe9IDVo/J4OyvY1Km8ovl14mE5uqHk/tTZ4IiUA+nqiuyX4kRUwojd8FdYHz4oZbpwjwOjJYaYYxUfIDn4UE6Dz1miiE7HG1WJJ0r4jTrlXd5aqRSiR2PoA+ZimA6gqVreS0T13h0SDed7l9e09+K3sZmQij4W8akrzeBjZ7q2sQm0GZU8hfisGcgG+h2Lo9we34Z5vonKLmhvFx4Dx66LxjcaW04jzv8hMN0fSl1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzLU6/Q7TYvJuEPxDpGBbfxZnxbmsKMgGBFkIeg1p6Y=;
 b=QHPHgw/+MxgNLbksFlT2cPUKfVgWYiYd1vPLVpFRQEH94j2Fl4fA2xxwimwRmE1rkenGHGvy63IC+2KZsvop8X0rn46dCq5n7FphHdgyaOLmIPFvK3saPIgAPMFu/A4JgozbsgkcXlPgW+2vLBTZWTcHTnVh2pJtGYhl3tUo0MXw9dbDcrJtRbtYpO8Ahc/i1HkjFdzBp+Cqlb5BhLGtoOa7qu5LxseiEo9QavNYdksfXMWVhSaiVfL0+oZdvWwNhcfuBrZz0LHwa6ssCHQebQXYEjcbNctDomH+QO0vfII07Bgc0hVPNalebWbHvml2EzdNd2jTY9zWa0LaTm/rCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzLU6/Q7TYvJuEPxDpGBbfxZnxbmsKMgGBFkIeg1p6Y=;
 b=oMer87EkNhDrWGD36Yr/BYA0BsGOpr/2dhy4ZXzf0J2ZVFR7+mbLgCF43zkw/hWvzLiyS4CXDwWDVjpxFywB+c+tqg9iaIStMc+vpulYFpe0a2SnQ3U8OM3E2zLiOJ21+bFKwKBD8AiLmXlcHR9AtOQCyX6SqlYIZ9fuF06/cC4=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5788.namprd02.prod.outlook.com (2603:10b6:5:17b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:38:12 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 14:38:11 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>, Neal Frager <neal.frager@amd.com>
Thread-Topic: [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: bump to Xilinx
 2022.1
Thread-Index: AQHYXfkm53+RQSrDOUeb9TrdtAt0Ea0NNSeTgAAEAHA=
Date: Tue, 3 May 2022 14:38:11 +0000
Message-ID: <SJ0PR02MB7758E081BE889432D144B4B6D7C09@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220502074907.3941472-1-neal.frager@amd.com>
 <87a6by4s5g.fsf@dell.be.48ers.dk>
In-Reply-To: <87a6by4s5g.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c400e28-f1a3-4acc-846a-08da2d128cb2
x-ms-traffictypediagnostic: DM6PR02MB5788:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5788E15BC4CDA830874B8766D7C09@DM6PR02MB5788.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X38wJNkNpzY9DjzrXEPUVuG4Yd25pID3tn9QqSgICt7npIk8VVEJB0rUH57dpuwc7bIUdVY0mBfZXoDGhEF6es1pSIF1tgY1cYOUbhd72tMdr/Gs3TrOC0ayccaD7TjJljDrLd2IOn7yQNv1ast1uGkdBrOB25HO3qIv5rt14kIxG7tZXFTgoQeh5sLGE8nP5YTUYygriTfsyUy58eQqOx630kbhTJonVwErCCpha+zXm7DDGjAsovjwGkrsnwfZl35C00wm8sDYg+GMCct5bofAwPbmVUYnxfOHLOBbBHqy/KDDmVF/DsBM1CUQMqGf6TgozvwFFt5xn/8ImO94CKIS9cb09TsgUGzBzcRM8wndiv38tvOBQR+jP8+ljfvT7splsSpQMcHBF3W0QWNwZRgbXx2/xpXrEyUkSczBTuO9oVwcuWb+khNtiux6sbAhCMMYLZghV0XQjGwL2PghIg2bATIhoLAPjavhVyIRgnG1S6HQAWrMW30JWG+JBgKhfTpjZvFEBElgOIs4aQUiT/JAhPE7XAZpdt+XustYTIMdiUqy2mIbD6qDACpb+af5+bf19pXLqfn//m3rklDRNVenvXz2s8xSAFkT+KdJWqrEMl+VAv2MtNoDbpfPrmeYZO+td5q7m0/dybsAbkLKLARvSLvFQ6WOLSfjkfQMrcmHDxqvP3gVjYzhS4+UpPb5zIqVsgHWmasID/PLrICFgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(76116006)(38070700005)(66556008)(2906002)(64756008)(66446008)(66476007)(66946007)(38100700002)(122000001)(52536014)(83380400001)(86362001)(4744005)(8936002)(5660300002)(54906003)(6506007)(110136005)(316002)(7696005)(26005)(9686003)(55016003)(33656002)(71200400001)(508600001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8XFz/aRGPyFLYjDoGC+jrlDbCF57HAkvxqzHG6gUMbasQNysGeRSK4lGQFdu?=
 =?us-ascii?Q?0hsheVUwyCDcpagJRMe/XlniQ4bJNWYsI8accTYpP5JmQuX5Sdh86DpZc8/h?=
 =?us-ascii?Q?/b35S5I+K/Ykyo6CTwzS+V9HECz5C4hGXmdWRJ/+3xPnVH5iUOv+U30s1938?=
 =?us-ascii?Q?92RvrKT43SZTerM6s/2LSHPN1HWGjqx0CGLK3nS2SfCpad1UkbVwPATy2VnR?=
 =?us-ascii?Q?2eNojBtKlfkeFMEmQzRlptlUNIFaSz36kWnD0A91yspKfn3gPKALbMendRcC?=
 =?us-ascii?Q?YSKf2mLt7RxLlFZQtigS8XDVrySKV3jDurkl+NasyVJoJETyt0EYFtlQjX1K?=
 =?us-ascii?Q?tQ537hsSCMJNftGNZsGvxX3Vvm3sIxMxPhzOhY4vtkU48ZRKFXzujvrtsKhj?=
 =?us-ascii?Q?5Vw5FbVDpLvx8u8yQjE+virekl8HChm6lV27v7dGHqaPOm/9MaHoyv/J20Dt?=
 =?us-ascii?Q?8s1JFTMU40thrqeHW91Vm0g48w86HVGzFxXhnYb5KKvjFwLkh7kQeQkfxdet?=
 =?us-ascii?Q?bZXGLkTHbM2S/u5ItJHdya7nbpyO9UQKi+9w9X0Iy4jM1LpATkgA13SwUX5o?=
 =?us-ascii?Q?kzGuqmqGhmPA2cJodo+GMcw2uXyizCxXFqg4NoIWfSBBFgwkJnLm4dKpVTjf?=
 =?us-ascii?Q?kh7WTJVEUYITF2JHpv7bhyiizL1pfvMp3iw/PsDb3xKtZY9oRCaEB7SEvOpK?=
 =?us-ascii?Q?WIqEbUhjpbrdyh9FI0QCoWwTtTXArxIvAQQQuIJjlzIviBMbIuIkYFplU7Gn?=
 =?us-ascii?Q?W3Oj6/PtzwGlJxnkRUlCs7uaDbE6ryhZRg1RfK6fydVEHzw7BLQJub9Y0eLF?=
 =?us-ascii?Q?4ud1zyGy9/cgpbOfrSsezMPSZ5HR/MUfeI9HTFwINGMV8HlrF9L+BfWqvam8?=
 =?us-ascii?Q?gROO5kakGk0pj8cQqeOgaKXE9TsiHxZWsE2tiRVgcpwJztXXuOFgsCRnArGy?=
 =?us-ascii?Q?rJeQMvpaxTmKlStUvVJUBxHuQMDLhvQatv+e85NWOg19OFkdjuwMnM7RaxH3?=
 =?us-ascii?Q?uAuirMAskQxIg9pgakjgwXytja6GSl2NlnaGYTIensB56HiJYSNv5pqRwfOH?=
 =?us-ascii?Q?2p/xqvEQOojxKspQH5p7gexph82ysvh60B+NCYexa3bFvd4DZaB9TMPSHuyZ?=
 =?us-ascii?Q?TZ3LajlUYFG5V1kI1TZHAqK1c2MgtzXfWiYQWgJ9ApQDeaZchLvh4dKX0xCm?=
 =?us-ascii?Q?ApidMlgplryAacbdk23ZpabmWj747DL5ufjEeoYLId5tFzEO1XdyXM0Q7Mxp?=
 =?us-ascii?Q?AAD4FhbYUpmpZiQRR54M2xXvHC/EjEMe3rVvJnkiOObcKcxmU0MoFDsCvBXG?=
 =?us-ascii?Q?ycMlRNQcdd6CgmfNUFr0pTUB1Jf8hMh6i2GlfUC8MavjiNSoK77jj3mfKMrM?=
 =?us-ascii?Q?o11K/IVHODGgGljkhtwE0a46d4iJZyxRjVvZZP5NBmOW6jtBG2m0Q3luxTGl?=
 =?us-ascii?Q?bjvmXz7HuZNy9wQt7RgQ+zX71qgpGptzon13TyaybOXGD9rN7RQuJXtLBWN3?=
 =?us-ascii?Q?uUH1bbz1c5+pXgECON1NNdenY4vrEXAM9Z2Bpz2MEVM28xxHRMDBq6nNJiGX?=
 =?us-ascii?Q?98gNQ5rxrDmAnCOa4gR8TaXVnP71CYWKJXGJ/LfwIS/w3/n2bs9TQCVFRVJg?=
 =?us-ascii?Q?AxxYp03U1RtLHDHSzCBwFWhhnSH+4aAXFS9guxb6lBS+77iquJMnrtGo4iA8?=
 =?us-ascii?Q?ixlqViATldOOK8SMGhRHiaNoyV2EiY0VaWv19t81764Sge4/NagXVUv0zQE8?=
 =?us-ascii?Q?YLTklExBtw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c400e28-f1a3-4acc-846a-08da2d128cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 14:38:11.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lJGZzS3j0dRQfQhc86dnN6XOjUZ5yQjd2HM6C2/Na2ojd6sCeG6Bn+Phhyo2lmGZeAKHxdxgKJIfTo/MBe9iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5788
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig:
 bump to Xilinx 2022.1
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Committed, thanks.

Thank you!

> Out of interest, why is there two tags (based on 5.15 and 5.15.19)? Is the plan to rebase the _LTS_ one on future stable releases?

> git tag | grep 'xlnx.*5.15'
> xlnx_rebase_v5.15_2022.1
> xlnx_rebase_v5.15_LTS_2022.1

The xlnx_rebase_v5.15_2022.1 tag is continuing our older release strategy of staying with a 5.15.0 kernel for the entire year.
Developers would then be fully responsible for rebasing the kernel.org security patches.

The xlnx_rebase_v5.15_LTS_2022.1 is our new release strategy and the one I am promoting for everyone to use.
This tag is using Linux kernel 5.15.19 for 2022.1 and will update to 5.15.x for 2022.2.
Essentially, developers get two updates of security patches per year by using these tags.
Petalinux and Yocto are also using the xlnx_rebase_v5.15_LTS_2022.1 release tag.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
