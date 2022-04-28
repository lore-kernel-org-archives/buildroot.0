Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E4CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E502B41BF0;
	Thu, 28 Apr 2022 21:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FZAhbvktqJr; Thu, 28 Apr 2022 21:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8347641C01;
	Thu, 28 Apr 2022 21:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27BF91BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1550883F2B
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtJ4EgkurDSE for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:19:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::71c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DFC583F11
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3Wj+so2S8y7yR74nUVfedkqNBHvQ/CYgqnJcgnwIVSaryXbzP7LF8hzeoEW8fWLEnKW2lFLKQIQkPxEyQKOEGrjM2iqMdiyLfcYkFTyO0yMuuqLMoW9sWaaWXsU0xRECNuTbxxdUerYcp3I1pVN86SvQNYbsYeHDyEzjXU+GwAQzFQ3shBTQdOXmxbZB0FDrLz4+KEETWRAgeq8khE2dcAPrVRkXSAirZAgiWhmuUFC/7Zt/A+z3TYtEWAlyOQNPHoAnfpf88bRSMkxoMeFkvKlvOXkROtHDIpz+084c77HPTICZcCcLNUipkd5n1fX+rRyT75Si+yBSCcN4dlb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjd29Zq0BNmEv8U8kXUdW3Nut76aI1WVB6sGBBxfRAY=;
 b=LuGPKsvTglc9vqW546wPE6JqjeyJJPOmflsEWC5Os6cCVjmWgDK2cr5YQbW36Y5PCEHcod/mGl10LKD2vCyqfiW2G+4NwTiJJBfBUaYyqBfZDJsoU0/0eXK4alvd0joxa5xf5P8tYaLnILuqTmo7AKiWUkWvveeLg9p/A2fbGbV1qAhYOHnbggT7dmL97gbNmc6A+b+FnPf8lI2wI2wdHVbv9isWDW/9kRf2MJXB+zX/2n5Ck/YP0/EDeO/Q1kGdwQpnhyc3cGvAZEfAyoWVXvt1jM9afXan7VEelLFlaDJiX7dmdpvuzGGzh/TOdd/RD85vRU7MogvRAh2eCs2+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjd29Zq0BNmEv8U8kXUdW3Nut76aI1WVB6sGBBxfRAY=;
 b=r5iEsJ9bPOrW5g9XzT+DXAG5s2Zy8vnnUv+6P/nFkKK5wl1wKP1BeAhyh7UPeE4DJmyzTZu3aRggW3I5dWbQxDiubpRfDqFaTs4B9XNmkKhDLUsNMUckrL0iyDs7dBJYgp+jTlM1PxhlYTbAG2DXr5DDZ4kYs7nA6zaCWExySzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by PH0PR17MB4453.namprd17.prod.outlook.com (2603:10b6:510:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 21:18:57 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::d5d6:5b18:a221:14df]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::d5d6:5b18:a221:14df%6]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 21:18:56 +0000
Message-ID: <ccf280d8-9a86-84ad-9efb-20038c3f8418@phobosdpl.com>
Date: Thu, 28 Apr 2022 16:18:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Sen Hastings <sen@phobosdpl.com>
Content-Language: en-US
To: buildroot@buildroot.org
X-ClientProxiedBy: SN6PR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:805:66::15) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac73be7-d5a1-4a58-8f6d-08da295cb471
X-MS-TrafficTypeDiagnostic: PH0PR17MB4453:EE_
X-Microsoft-Antispam-PRVS: <PH0PR17MB4453D50F457CE293BA83FF9BBCFD9@PH0PR17MB4453.namprd17.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VK5FJKnPv2u8qnxQVCTQKJiguNJyvzzC2I+3IDkOJyMld361QZYpv/e22wRXop6Ra8TRgiU7MdCQMZz1v5USp82VceLbexiO1B7LvrdnH7ZNoXDebNnCiV5x/BPTcmpkIhqs66w6GlcUfePSOAZ/AsfMrqqw5oQF/f+EM1ofWk4DIPvHu7WkDhf7Fb91ChpguNt7qEuIoSe9mI+AlYynQzyvep+gkL5q5dQNUtrS47w+CwNQOq9IYCr5sBU/zaFBOvntPnnehxk1wsMLuF/OwZ8EMJPkj/6guks0AhC+z8BqvJDOaDAnUuK7/YV6E/vwwM0nE6KFTkSEz4OCIMjIZgeFZ46bLX7OS677IB19J+1HRL5XCHMTyBpMyNj/2oUq44+Jnl9p0NrxiTTdnHiYhTFuTRIU64ylviXesRXzHazraK8vfz2x0VCHhYLXAspvEyUbac9OOOUxXxU/Qw2BWCe5GA4Nq+TT541ooo4GXRs8GbW2Bt1MPV+QTE3HrcpclmCv39D+l/f7cdMSoScq1J8RQLVugnpSHAnCcoMVymdmatQjF/7AaMfdv65GIA4F4JJ5g3/HSguQo7jEjrIP+F0SkTSPP0lgdObWyVfTUPqDhAM6T3Ju06qGWGFcfHsCCc5c7IfRM2CSZjriR+5OHV/HeJFJo/5tqQ/ihQrKDrKjcyeFpMY4LBbi8PMBxo5r+wgvptHiAGcPgsDPqrrIpQ/4La+OFxqg1nogPzk5aqJjM47jaK+GhGczSFC7Ba5uhwiYQQ0BH1puIzJ87oQO3noxrunbsIlUfYY4eMP0ZG5Gxl3bXJbESV45e5dBVJJZTRynySbKKJ3SNWL/6SapTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(376002)(396003)(136003)(39830400003)(366004)(966005)(16799955002)(31686004)(38350700002)(38100700002)(2616005)(6916009)(6486002)(508600001)(52116002)(6512007)(316002)(31696002)(5660300002)(26005)(2906002)(6506007)(86362001)(83380400001)(36756003)(186003)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTB6b3BKTm1zc3BxNFpBTlhYMStHWEdGVDF3Um1WaTVLcFUzZDFxc21ES29N?=
 =?utf-8?B?TW1Sb25OMjNZZHJtbFpVaE9mQndwOHhzdGNoeEdrQVlHaTFUa0Y5YldsdEh5?=
 =?utf-8?B?bmdGNjZGZGZnV0hkNXJsNk9sUis0OXFqMnV5ODk4V0ovVW40SEo0Nkd6TU5P?=
 =?utf-8?B?ZGdhYkgxZDVGYjRjMDN3NUErMGZUMWw1RmUrQklpSlZhS1pqQ2hSS3lUYURT?=
 =?utf-8?B?WkZyVnRLR3B3cXNCRkxiVnN1cmF4ajVLVkVsRjRlNVQwdHFNVnIweldNZ2Uv?=
 =?utf-8?B?ci9DYWxlZjVFQjFSbGdWTFZyVXZ6RUFkZmYvYzdmc1JyYkRWZ1hETVZEdzNv?=
 =?utf-8?B?NDMxZVVub1lRZVNQREpEZ2ZzOXh4NStwbnlrSGFVYlpVY0Y2OSt6dlRrMita?=
 =?utf-8?B?UGU0UkliSUVrWXBUcnU3UUJCTkdscGsxQTFyZDVvK0pkNlAvMlk0bUhuOFlH?=
 =?utf-8?B?ODNuRnpYN0dmL21UNjYvTnd3UHhrWG4wV2dMNFpwVzU2S29ad2tjWGxiZFVB?=
 =?utf-8?B?M1g5a3U4NWlWL3BCWXB6c3V5SUJGT0l5alpITXl0N1RYVHAxNkFhTzlYNGo0?=
 =?utf-8?B?djFLS1U2Qy95Tm1UemtoMFFMNWpINVRsYjJnYktzTG1icUtmSEJJUkpXL2lX?=
 =?utf-8?B?TGVSMlJ5OHNubXo2aUNpcWdaaWcrc3BoL1luM3UreFV6UDJOMXNvM1Z5RUw1?=
 =?utf-8?B?RDRabG5XbElRZEFhYmQxeitDSFBpR2k5SnRtS2NLL244cUNJRFk3dG9DZ2xP?=
 =?utf-8?B?VisrQTllZGtXTHZSbDVjVUVhTXg1L0kwQWg3RlJrN1E3dlVpcmNFdE92UXpy?=
 =?utf-8?B?YUUrc3BsbjdMYU1VcGhkV2UwYmh6eXdEaFk4NEVZRDlXeEhqc3VyL3lXZXJX?=
 =?utf-8?B?TENHQjhzdlhjTEYwVnNFUnBkdTdVaVNrNFFNSEMzQXZjRjVMcjlLVkxqVHp4?=
 =?utf-8?B?K3VBOUxMcytwMHU0QXYvTVRUOGJkNkVxYU5uVmc1aXBTRkphTmdGUkVCZUVt?=
 =?utf-8?B?VEUrUVM4Vy9oczNQa0orNWZkSjdKVElHZ3JSNEZSY3pCVWo4bDJaRmFVK0k5?=
 =?utf-8?B?U2tjcE1oaWh2VXZkTkFERFJRcnJ0L1NJaFFwYXBsazduaVpkYmxuWHJLbWZY?=
 =?utf-8?B?YmZwUTBFWkNIZkY4NFZob0RoeUtEUGMyeTlQRFlNNTQ3a0MxQ25xTXZFZnZU?=
 =?utf-8?B?d3EyZ1d2cDNuWFhSQWQwS1czV281dHpWRHF0ektqSUpqckNzcUpWQmZyaDZS?=
 =?utf-8?B?WGRvRWlzWFdKL1ZQOFVleUR3ODlYQUZiOGovQWIzWUxSc1p4dFpWalg5WXp4?=
 =?utf-8?B?Rngva3liWjZIYUhRcWw3bFhHSTluN0JSL1NVWnFKOS90VWhpMndGd2ZZNU9v?=
 =?utf-8?B?MHlFQWsvcTZhTDNscnN2YTYzcXNsVXdIVnQ2czJLVzBSYXpjemxsQk1CVFIz?=
 =?utf-8?B?bDgwdUl2WVZHdis1bkZwVDIwaEwrRnN6bjZ2MWVFT0s2R0t0YW41U215L2FL?=
 =?utf-8?B?QXM3cmY3cWxEQlgwak12R05Ib0VKeHN4c1RDVHNicWh4WnA4QXlhZE90VHRR?=
 =?utf-8?B?b2ZzOGRaMVBtNUU3Zy8vdy9LNU5IYVRmMFBMYUJYVnB2K3dkTGF5VE9DTiti?=
 =?utf-8?B?cHJMS3k1V1Z5djBSY3lsYWZ0UFlhRlpZZktVbjByTHBJNnZ0S2V2aGhLSkFR?=
 =?utf-8?B?SXRnV2NXSzRTZERkWDN6OVlJN1pKclBrRnMva3dNZTJXVU83RTIwSXFvdTZx?=
 =?utf-8?B?NFViZ2QvaDRzRUtUSExyWUxxTk95K1dzN1NPT1RTQ1JOaVEzK0JiMEQvNGZz?=
 =?utf-8?B?N1lpRFFYTERSUVdWQW1UaG1UeGp1dWEwQURGU2NPOWJjeWFKNlJqZENGbzBU?=
 =?utf-8?B?U2RHVG9PQmdMR011blB2eDBzeHdMQzc0VWFvRXFMdE5NV2tyLzI1TDlYUDNy?=
 =?utf-8?B?MnorQkdwVG1UQnhUTm9seDhDMDNOMDZCdUd0Z29TRlVjTTg2YWF5blNmRzh5?=
 =?utf-8?B?OEZqWVFKZ0lLZEtERFVyNUhYZWdVVmZaaVZsZlhuMkhJZElVSk5QaW82RXZO?=
 =?utf-8?B?YWRYM2dmUXRrS014cVJGZnZGK09mVFN5ZjhNcE82cFRBTFlYKzJESHlTYzNs?=
 =?utf-8?B?WjY3TWx3ZkljT0tRUmNnZ3F6bS83R1dUWWxXUyswV1A3YUpDOWpieUo4SXZ1?=
 =?utf-8?B?N29jcUxTM3l0S01SU0cwQjMrb2N6cGxieFFDNXFKd3VWVFZFZDZYNS9rRFBw?=
 =?utf-8?B?NVExUmN6RlB4UjEzSS9MWW9KZys1NkFEVFZ1NW5lNEVsQUxGQjVnTCt6UjR1?=
 =?utf-8?B?MmdEdXYzbUI2THJ1cFl6NE5zWHJjVDliWFVHQjBPSVNGQWJ0b0VMdz09?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac73be7-d5a1-4a58-8f6d-08da295cb471
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 21:18:56.8511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np1+svqX8foofv3GJVt+BzL95ZPEhRT9hTvKEoxzb87+o+7/5NKdjLiqRGCGY0XyiADSiqkiWKh4b6GKDQ3MfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4453
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add kmsro driver
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
Cc: bernd.kuhls@t-online.de, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Howdy,

After Mesa DRI swrast support was removed on 2021.05 I realized that
GPU acceleration on my RPi 4 (Raspberry pi 4)
had stopped/never actually worked. After transitioning from
the deprecated Broadcom EGL library, the RPi 4 (at least) uses
the VideoCore IV 3D (v3d) driver for rendering, and the
VideoCore IV (vc4) driver for display output.
These are "hooked" together with the kmsro driver,
which was renamed/extended from the pl111 driver to be more generic
in accomplishing this task.

https://forums.raspberrypi.com/viewtopic.php?f=67&p=1901014

http://lists.freedesktop.org/archives/mesa-dev/2019-January/214067.html

I use the RPi 4 as a specific example, but the kmsro driver is required
for the task of attaching "render only" GPUs to any sort of
external display controller/manager type deal.
This is pretty common AFAIK on lots of SOCs.

Mesa supports this in combination with a few drivers, including:

Lima:
https://docs.mesa3d.org/drivers/lima.html

Panfrost:
https://docs.mesa3d.org/drivers/panfrost.html#building

v3d:
https://docs.mesa3d.org/drivers/v3d.html

The current patch adds BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
and selects it (along with BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)
when BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D is enabled.

Perhaps it should also be selected in conjunction with
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA,
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST and others?

Again, technically this is not necessary if you don't want
display output from your GPU.

Seeing that
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
selects
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4

I assume the primary goal is to auto-select mesa driver options that
yield functioning display output?

tldr: The kmsro driver is required to get actual display output
from some "render only" GPU drivers.
If a "render only" GPU driver is selected, should the
kmsro driver be selected by default?

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 package/mesa3d/Config.in | 14 +++++++++++++-
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e41da562dc..29e6b0d571 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -151,6 +151,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	help
 	  Mesa driver for iris-based Intel GPUs.
 +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
+	bool "Gallium kmsro driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	help
+	  "kernel mode setting render-only" driver
+	  "bridge" driver that hooks up render only GPUs to
+	  external display controllers/engines.
+	  Required for actual display output on some systems.
+	  Must be used in conjunction with a GPU driver.
+	  Supports: Etnaviv,freedreno,lima,panfrost,v3d
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
 	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) ||
!BR2_PACKAGE_XORG7 # libxshmfence
@@ -263,9 +274,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
+	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4 and kmsro).
  	  It requires a kernel 4.18+ with DRM V3D support enabled:
 diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9f375edc1f..8b9787aa54 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -102,6 +102,7 @@
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  +=
etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)
+= freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     +=
i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     +=
iris
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    +=
kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     +=
lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  +=
nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) +=
panfrost
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
