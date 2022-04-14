Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A82FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 08:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA6861153;
	Thu, 14 Apr 2022 08:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gi4-C_Wy3TVZ; Thu, 14 Apr 2022 08:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B336461142;
	Thu, 14 Apr 2022 08:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF0871BF5E6
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCE3B827D2
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 08:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNPYAfMg_ZYj for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 08:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::628])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35AE282771
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 08:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdUYgrxzjbJrx76btquhLMyOZ1Ke94TQzu3BweyPDo6bjZY8jAvrJN3YfLIsbdzf1ZIaMDPMoEvGB6crLLPg2tBx98ocF6l6hYEET6sVgLuDTemOScSJr7BjWaaJsERk52E3w/8eKsdEW5qpUpqzDxdRTdJ35wwpcTG44NQdw//PuAmPRMPNXbGipJpgMa2VJCzR0WTyVqwGGxM46pgGSe7JBR3IvXCzFhgBqnM/pP54GkYq1BrAuoL2vm0lgLHvnyGys8cO6jzV7alnTV+EpFbGF1Yz9MaaYjqNjsbobT8YyThfILT4xd3PQairuVxdakW0ylK+qB+KfjQd7rJ9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZhRDWfMmlhm9RrbkIhtmdWPTk12l67QEyokMZjJIx0=;
 b=jJz027qN7n/zoe89RmWhE33YZfmdECslS2LKg4MlzeYd3waWD26EJ/8p9d0GbW62wB+Haz+axOPzHuqMS8LvS+qaiwsJ/roVKjkd+WHOzGpGfE6TtJGev9Tro9OmfyKDjeqwJ8d1LL+T9NLD9oEnurSxDisbgJkjEZwKvstG/84ASUuHkSPPeceXyOuYMEicnRMXo9985vDzuMIS0IoNSBeyHPn36BLQbpl/1811G9HQ8ulQGuD/jRvLfb0aRg1n/B4Bs9bv44TDwpkidZ/V0vQIYU9nXY6+9UNt7HZtMOcl/RN0ukINIX2ijbnVY8rqE42IdzEfdV4xZdQgW2vldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZhRDWfMmlhm9RrbkIhtmdWPTk12l67QEyokMZjJIx0=;
 b=JdgibO9FyJrTyRGu7ozPl/cqvszXmUB1kdERNDqn1cvOfZ5hZuCUTTuC9cVQJijiO/TREFXf1IYzjD3MUayFDtwSqoxJe0DP8bJKUx01WmNLRCMWmDGwGitRM/W4ltU43SPWxOJ1iXXelmOfCOVt1EGgWQblXRehhz+jWSfkfhk=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4107.namprd02.prod.outlook.com (2603:10b6:5:a1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 08:55:29 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 08:55:29 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to Xilinx
 2021.2
Thread-Index: AQHYS1jCIBhUrJ2T10y2XXcoR/MRfqzvI4ug
Date: Thu, 14 Apr 2022 08:55:29 +0000
Message-ID: <SJ0PR02MB77588ED9602D7B0407FA2912D7EF9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70feb2b5-8667-456b-0e82-08da1df4869b
x-ms-traffictypediagnostic: DM6PR02MB4107:EE_
x-microsoft-antispam-prvs: <DM6PR02MB4107B29D792DA507E3C5E790D7EF9@DM6PR02MB4107.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o9E/FLLSrW55kJPo5rcjRbgGSzE01fjVGJIWLzhh+8nVrX54qkPKzH1r9DeKH5HqZ4lQZhG2fRcVzL3+q6SBgqfM7oolaxlhK/KNTL3WojoXNDebbx3+lo/v8zW0+6byPAvJ4xHGAqdj/7UR1Xecg/3a2Ps+SjdSX35GxlkMMv0LVSZXQJ1WvJqso2+dq5ZSQFQUZuXP374ccn/URkOtuuB1yWchwTsLecw10bHYaq3THYESbgr3XdproHveneNnzBaE6jGEilZV+C/CocOspTHq63fbsT3dRkeJBdR4WrZ81xKC4dM17lDJPwp2VUwYlS3bLDLTeDY+7LWr+7TRt/aTBL++jLs/TSmc4+M4bPdi7GdSLAEQmZ81f+oIkRSgnY6EHkirW+PGVG7Mhd6OkedMooW/5HmJYlnwOJOgEK0n8z0MWKwgLZgA2pvAluC7jYHhao5txCs59azLLgPjwbt2p8cTyOpZ5Zt3VbQfmPLdrwFIih8sIyQrqD4EiCOndmsV3NxR3k3hKZ1qmBc/l4V61GHRTu/SlBAW4WXIQAO9JIDyZYCHQNeLmYPEUB5AJsennEvMn6O3w49e34p6B24hnhIQgi5bxV7ATV8Kh0/O1gcxd4jMj9tV9fX7bxnyNWhDS/b7RIEgIgEjQpEXy82BHpVfOYc77gts97PBSraGcLT+JHABo+SBjyGobpoc5xbVa1m9ZYetVnrd9wnyx2zJs2FQmNCuoSOwNrZ1ZWyPkUkrUG2fovByMdv/7aZW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(86362001)(2906002)(316002)(4744005)(122000001)(66476007)(4326008)(8676002)(76116006)(66556008)(66946007)(54906003)(64756008)(38100700002)(5660300002)(66446008)(38070700005)(71200400001)(508600001)(6506007)(7696005)(9686003)(33656002)(83380400001)(110136005)(186003)(52536014)(8936002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nd7g94A/wA0b/uLAMJGqtS1/a7sih7RwPdTK15GOR2uW86pLG2PdXySJtwwg?=
 =?us-ascii?Q?rTR5f4d40LR64h/CACMPuCkeSJb8Fb20kDnIkYj3+faKaWFm6+LEYIrwCBKE?=
 =?us-ascii?Q?toV36QVxLbL732vHWAZVgKtx+VjIx+KKixAHznaYLmq5LG4/QEeN3ZcSGtVn?=
 =?us-ascii?Q?9nBZXWoH80VztbtVYBX0tn2WwnAsteCb0RQRsGAZtYliQ8+W57yLQFvVzDcQ?=
 =?us-ascii?Q?VweyQmCJy1Jcdxr2BmbfoXY8/mdClZuHfVsh7mc1CvhsSLDub17Lg3lp/pfr?=
 =?us-ascii?Q?qd0rtTbDJtMr0RDUmWYd6CpzrbEtvt9cceruQXAlJVsx+/wkAG/SE7SCvlXa?=
 =?us-ascii?Q?EXQZvYIggNqf5qaUrrLZW98ZLlCcRFxwSO3QusZuwh3Kwv9l707pS2Ch8qhz?=
 =?us-ascii?Q?iB9efyj0AD2BTKW21ZoxOoAkNweJZPxZp23Mqspou20WA2mkSM9A1xJanPd8?=
 =?us-ascii?Q?WGxdkCYVo8J/rlKVoq+i8yZxGk0x1mdj1Pxkr0dNA90weGCII2GzANRjBCve?=
 =?us-ascii?Q?2MoK8NWebXVbKaZelHpqEKiATw7iY5ZUSABkTWUiTCwYSOL7zqSwqttZb1mT?=
 =?us-ascii?Q?VlNFVM3NnA4Q5lygo0SdeHJoqu/L2kCAUr7nAnLLJXMB38r0paFUdkk7zKZe?=
 =?us-ascii?Q?S4IY0nk3bXTED/DulHhRa+4UQ7d2U+sjQDOC8uH0IS3+/saIJFWU6hZDJvEk?=
 =?us-ascii?Q?WBOej9DJjAgO9UYEf527tt7p4PL8HnMCrp8EDNXcKaPmv+oULWjQBIkAElma?=
 =?us-ascii?Q?0xctLK7P9jk+RDoYNp4GST4sxNNRkAkNcHB42ke+3mXSqsGXwAawnjL/+IiZ?=
 =?us-ascii?Q?7umQ/t3vcLVX7W10wMlcB1Q5sLBteRfuUWDqy8DPwqrIUqwFI0Z2Stu/QCdb?=
 =?us-ascii?Q?kYlbW2ZzPOcjoI3ZESOH4TZV1TefZ9VihocmsPh86tOG9322W+EJCBceS4D+?=
 =?us-ascii?Q?nbyGPpNxLydWLlTHeJ3oFIOEnf4fQhH2OQ+Pk0V885SgY3FZy0ArmYixBcw5?=
 =?us-ascii?Q?wTPDHc9EWB2GK7fYuVWGZAHwnt5AZgV8KgHSA54YKjbytO3+7KQ2E+4KNhv0?=
 =?us-ascii?Q?p07oDrRy3/7x5wqVQAGs3IbVdSlgp1MMlm5x0eZC0D24ykQeHM5Dryv84H/u?=
 =?us-ascii?Q?igonHJLB3Me8JmLGEzI3VtXus7dBERbNur3vkrxCLOsBc3/6h8BFkgded9H6?=
 =?us-ascii?Q?NUTUPFhn4OqRDqfGMTTVhorQcPnMNwqusP7uhSlRcAfD4mNcV6GduJ3izsTi?=
 =?us-ascii?Q?s+Rm7co+bNSy73rmkZPtC28FC/TdqgGcGZlSU+j4IBc7VxncYLWrj9UnJ1d/?=
 =?us-ascii?Q?37Lm5icLKRHWsfOp4f/meLJqC8O//yn+KtcvCaffGI4UY3NwDBF1N0b95z+5?=
 =?us-ascii?Q?bE/fZCKh8H0KgUf1wBdJgJEnIfUdbwOPrPV7dIg68AVtgDcvoQbz4N3GQBwT?=
 =?us-ascii?Q?gEGgnWAsbZGSGwaXplC7NoDLO/SL2adTu2m7XKuTt88YOMbKz8U+zp5JHkes?=
 =?us-ascii?Q?ug5RxC+XCWVchcbUbA3v2Wp+1SXmpg91Ff0JCSP7jNG2glWESKPOsjeo6baO?=
 =?us-ascii?Q?NAHhpqnSCs3MKzBzml/an2XVTHUwIJFdON8KMhfUDVQlq9HDcKFGxjx/06sN?=
 =?us-ascii?Q?MmeCR9BuwvxpSYyVryXXqSYfj8q4krZ23HeGQa0Q4TWCvRtQA1T/84SeprTI?=
 =?us-ascii?Q?w9jQH7xhrrn6ZgeC4kOI15uqYQ4AGxuFuSKHwu8MJoXbUM+5JmR3G/DxMRmy?=
 =?us-ascii?Q?/LM66Mx7BDSmkURE4DHrIbYZf0zmQZzisQ6XGe9SRaeOQcEMcoAF?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70feb2b5-8667-456b-0e82-08da1df4869b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 08:55:29.3099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axSLerBc6SdFJy70nX7WbQ9kdbwsmtpKn+lA+SLdh9IIBYQYYrFxphibTZ8c2Xao9gNSrQ0IYfEWjrB6Vt0pCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4107
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder regarding the zynq defconfigs update.  Any feedback?

> This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2021.2 which includes the following updates:
>  - U-Boot bumped to 2021.01
>  - Linux bumped to 5.10
>  - rootfs changed from CPIO to EXT4
>  - extlinux.conf for distro boot support

> This patch has been build and run tested on a ZC706 evaluation board.

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thank you for your support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
