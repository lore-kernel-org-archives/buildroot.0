Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7075EC77B7A
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 17:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF51D42EE7;
	Fri, 26 May 2023 17:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF51D42EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TmBMytyZ6le; Fri, 26 May 2023 17:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 772B540B72;
	Fri, 26 May 2023 17:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 772B540B72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE241BF29A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2508B42856
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2508B42856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwhniKnDWbVW for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 17:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951804281B
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 951804281B
 for <buildroot@buildroot.org>; Fri, 26 May 2023 17:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/eL0nBwp5tcCwHNCEdIa5jthg3lyAYYnsWzJBrSJuIZ+4gDp0iXhI0zi/iILVSmzk3nRHxlmblS+2wAMT4IQ+Z4sehB6+ItZKjtcQvwmZ/LE0c2hPqUGgedYAYyrjGyJeNVHmcKpkIJbMSSbko1rC4aFOqz0kEEO3beKbFfzjfVZ2KU+sJ5FLNZ8mUqtQOt4py3G+lIm7HAx+QYkGcCnJFtYj8QWAuzCdhNTP/e6b8n9B7A/egOjkgnwf5R0uiTb4Ln8xF5NK/YfQ6DM4jJXC00WTwyYwG5Y9BK4ekd/K5qRMwgbH/ERtZ3x1h06crYNjq1KBP8Bl1Ei7kwW0h4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gZeBIUnq+xDOAGdQ3Xb2fDY4f+66i5O409T6XbvXrs=;
 b=I4S3gWNkvCGIGB3/QByA9RY6oa6sFsBwr+44xc8/9uR1v3ZZ28X1fn+MvjTGPeNdRqnfBm5dRtS5J5/iRcWJYSI1Krx+fhdxIXZEy6IOWv/YnIqlUVWAFru1YlSnWqWaFRmrAzEgvTlfmRjrlP8WkAjQdaSe55ZmIfh94bjkucmrPp9WqhBobAWrlzYN2rv/PovrOSObnZ7E6flG7S9Wk0EDUKxvrSbhZRIvx9jnb7tlPbLsqw5U38D6IeV3LM9R2/kYCFf8CmGcb8Mns0fkgknIPYD2TnN5+JLZYrybqcup4DoV31mgqvYGrNxxNT43Sx4D3MkVvI+zJvirZ4MJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MN6PR10MB7421.namprd10.prod.outlook.com
 (2603:10b6:208:46e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 17:55:21 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 17:55:21 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 10:55:04 -0700
Message-Id: <20230526175506.1071354-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fe38dc-4aa7-49ab-a034-08db5e125f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6AJ0uczUxzjuGFTm2if1Eo02K4aouH6bSvsam/E5IBHw3kXvLkB860vVtS4CB8mM1vvzqqQei5olA0cI7xH5QG8fJHEwiwCdki8ZL/dJOOx2AOu1Noe340VRVbcHVEOU68FRlMnWwtl4Plj2USecCFZrxMfY1+YCjcR4MOVf5CcIaHAOeGu6JNJTQ+KSRc32t7qmDnQ5ErnaxB+13w/EzHq+CS5OhoXMyP21vT64XJHR9YUX5JthMafifjWug9Z1Wles2Cq1J5aZfuROl+7CXAj6o8B5nt1wNP2rC01X9OZ+Ly6ATkyixFcrH1eucQrzR9ro/IEpMYdJCrif6ksf7V5Ctk6on+5/pdAhFFjebOYGHwKPjbJTMI1T3tk2zDhe1rsyv/kbQ/2kAbWaOl/g6YmveXlMraW86EP1nZnU3P+x3MQaBXSFdUJTykNTIqqm4sN0wxgReazVAJuDRSj7eIjzcaMn7s2SX5/0JYOYD93KJqm/5i5PfAp0j+H7UL4FXrf0oFj6G8tVyGksXKKjaDGGyFFhwoTVvDSa/nbz7VmFTDVesz5Ug+8kYgzZxwyCMuxChubyqCVCGEPBRNQSuQoOWkUH33qKS+lSCAhHY19fF/MqAdWq+l6yUUvf/R6rb3iqGb10cKi+GNXLu4kog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39830400003)(346002)(366004)(451199021)(186003)(6506007)(2616005)(6512007)(41300700001)(8936002)(44832011)(1076003)(26005)(8676002)(86362001)(4326008)(38100700002)(36756003)(2906002)(52116002)(66476007)(66556008)(6916009)(478600001)(5660300002)(66946007)(316002)(54906003)(38350700002)(6666004)(6486002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9kn7dgH14tPR5vfQZbPIRlfjvIBIHe8s5VCEoUhoJ4wouDfkZMe4lZLo/UZL?=
 =?us-ascii?Q?uDhwI28QA2QSmbkfB/M/CE5C6tkEJf4Mm2NM0ePUtkm7OKK8OBniwdzyKtnV?=
 =?us-ascii?Q?fS8Li56dzVo0zV9WwQKF0HPNCAz/aqpMQoM6lBCbt9vQ2tn/Ka11UfvWxO1V?=
 =?us-ascii?Q?uvlhSoYAaBykUs2rxIBnQ38jERCslqCLHiFoHwjuOSB8aklOq3zeoyUJgdNY?=
 =?us-ascii?Q?zjjtiAWk91zxSGKSreXQuhoUOGnFobCb6YtOyu9KlIl+Jc0VqQ9vjmHWAukN?=
 =?us-ascii?Q?Oa9PP4q5PSZp1BhEuvf5WQpcnVvKuhB7iVNp3NGaAFBeMP/L1uTsXKZWo0ap?=
 =?us-ascii?Q?DXp12+X8xjVb/VWZkdp3FOZRrpQA7ylXce8s4zucge0RoBGIjqPHAIP6kama?=
 =?us-ascii?Q?f6e6cwii2Gt7CiuJ/3x+7ebA13cHjDBQf3lITX417uXj4EeSqnzj0GoZYfGD?=
 =?us-ascii?Q?uv8D7lLnqMlEFuOLqe8eShnFMMxkm84YB+IHaDUshS41HFf+E8Aln6XLjFYs?=
 =?us-ascii?Q?DyzbkQqfcV5XorxhnX/QztHMpw1Y3lDnBneqWbbOhdB1v4TdYmJD+vHRwTDt?=
 =?us-ascii?Q?yQd1CXvfE03Mq3K3D60ogPO3I3vmMy3ZFIsoLnmjCtj69gdHj7AuMnNG1vh0?=
 =?us-ascii?Q?Cnk/ukB3OHL1W3iwRMVN5q0VO2hkn8Cy7fvOZguI7YwHNsw1YWcNTXqtuahU?=
 =?us-ascii?Q?yZXbKrdi1PlHKQoyvTd3aJubgP2f5VUqk+BWGW2m9jsate7cbg8HQ57wP/KR?=
 =?us-ascii?Q?yv4EeTkRIpBH0Neo9xBI6uEkYiQmUweFkq9DuVCkKeH2Uv/CNePW1xPVkqCQ?=
 =?us-ascii?Q?BQeg2Xav2yLrhnzcc573nYDDPrGgUgrsuzXC+rZo/I6Bd65x4CT+2G2ByeFL?=
 =?us-ascii?Q?wE0qn9hQujdPSKLsQh5YPK1jdIPx9oquWWswkexufyvVEaSHV0cGEKOn+wKo?=
 =?us-ascii?Q?HnLeznQjUCM2VzQZTfHhVrXoKTlqQYQb3+Ts2T4Y7cJqhVu0Tw+Mypxf4XYl?=
 =?us-ascii?Q?BAq1lHdrT2XzBhu5PHHC0YJiFdhXvk5qmJMcZ8Wvld2Q6/5Bx/OOl7GaHbPq?=
 =?us-ascii?Q?i9urBewinFEMs2pZS4knFURdouuhlYKJ+LGVkVh8I1QBZOV3+MRVNCRpHqbI?=
 =?us-ascii?Q?Vo6UJ7FSGwTC2Hd27ysq1j80QVdGjyxacGMQYYFjjrFQxYREsyX8Txzza6aQ?=
 =?us-ascii?Q?JRVA0ClOvo/hFnvPIzDwGqy2kXyD6EkDws+DufKY3rqjT8nIOIPj1JfoxMtv?=
 =?us-ascii?Q?kDT9wsWAv0kGTORwPi4hRwcnpbwvwcYtelKxV75fNZU+PthW2bGN8iKDRv8k?=
 =?us-ascii?Q?g56vXHJjd8EAEQSiH/wH2Q7P9WXEePyCeKioENP4Oc6Bp3pVTvtlOxsr6UN4?=
 =?us-ascii?Q?+cLFBJphFuVsAEM+CB01uh/yvMu6hDA2ZAGMiLSerhxumOohDFMLEQP9fiW7?=
 =?us-ascii?Q?QJvNLQUGAr5U5LUr6xBzn16FVLcpj5CO3jreEFo8aH6yoGxNj075Or59BLyo?=
 =?us-ascii?Q?lV32MiA/f/ZVjr74ogH9yfhy6w4zaZkXE09ThKGawf+rXYcHI4I/roY0v/vJ?=
 =?us-ascii?Q?6itlT2oY+2qt2xy5JPqa1jN13lbwCkliZB1cgHCyfPkP3C76/WKE7bZjVvHa?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fe38dc-4aa7-49ab-a034-08db5e125f2e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:55:20.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJdmATymNCWeqUDnA6Rflzr6FfXl8MSrudcqBwq2c6Y75/aH+k2QhUHC2vFogfVgDwpPhfCod3oF9jPEUTmxyx57tq0JPr+yQSc9K/6MLXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gZeBIUnq+xDOAGdQ3Xb2fDY4f+66i5O409T6XbvXrs=;
 b=Cb2Zfl1k5HNo/eUKLdFwNalgrP9O84z+rCK9tU8FMYaTDc9peY1wRTqm1taFaoj8DJrMrw8sk7dUETWdV2GubLRf4FoEn6MeR0t+199vqdSWQHIDealAz2gDBfX6bxRLCYyaOVUZQNjmBqXzTqKCA/1tB2KR29Z07+PrUfboEVg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=Cb2Zfl1k
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v2 0/2] package: bootpc: add bootpc and bootp
 interface configuration
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Believe it or not, there are use cases for running BOOTPC instead of
DHCP or static IP addressing.

The /etc/network/interfaces configuration file allows for the
configuration option

```
iface eth0 inet bootp
```

However, this relies on two things. The first is the existence of the
bootpc application, which is added in patch 1.

That doesn't solve all the problems, however. `bootpc` only works with
interfaces that are up, which leads to a chicken-or-egg problem. Patch 2
utilizes an ancient technique to temporarily bring up an interface
before running the actual bootpc application.

The end result is an interface with the above configuration that
successfully gets an IP address and netmask from a BOOTP server.


---

v2:
  * Mostly check-package fixups and formatting.
  * Remove stale reference to buildroot overlay

---

Colin Foster (2):
  package/bootpc: new package
  bootpc: add dhcp-like configuration ability

 .checkpackageignore                           |  1 +
 package/Config.in                             |  1 +
 package/bootpc/0001-main-fix-build.patch      | 49 +++++++++++
 ...Makefile-remove-strip-from-the-build.patch | 33 +++++++
 package/bootpc/Config.in                      | 20 +++++
 package/bootpc/bootpc.hash                    |  3 +
 package/bootpc/bootpc.mk                      | 39 +++++++++
 package/bootpc/bootpc_dhcp_script             | 86 +++++++++++++++++++
 8 files changed, 232 insertions(+)
 create mode 100644 package/bootpc/0001-main-fix-build.patch
 create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
 create mode 100644 package/bootpc/Config.in
 create mode 100644 package/bootpc/bootpc.hash
 create mode 100644 package/bootpc/bootpc.mk
 create mode 100644 package/bootpc/bootpc_dhcp_script

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
