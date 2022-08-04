Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F0C00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 06:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D424059D;
	Thu,  4 Aug 2022 06:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D424059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71g-1kQQzARV; Thu,  4 Aug 2022 06:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A9D540383;
	Thu,  4 Aug 2022 06:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A9D540383
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA8A1BF3A7
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 06:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5273981770
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 06:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5273981770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfHSCQDRX7Dx for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 06:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D56C81754
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2054.outbound.protection.outlook.com [40.107.113.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D56C81754
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 06:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAhREwlLkDF9HlTuH1R6FoQbeRVngM1NW/tmCTuKsFIn+rO0OzmK4D6JF0SHFuBDUZIx3oQFWsKqnIf04fAuReAd+k3Sv9MsbO4pi0vNnNuK/yXaeQt59n/5sUAkWf6RsRiwoksMa1tzWDYtza2IPTv7XOkLk02RPawlKeV6vcfPmVmUSy7WhfHwzV0yaFbVJWNwMrRab+gn/ym1/6uRvU1D+jB4j1+ezEgcZ4aJir5mbEQN4LPtDXEFdB2evyGATkYeLA8DwFRSINFVlsI0Rl59TMPIXgGullsc+4izy9qzZevACJH+u0HQz8imW850m03uBkDJMI3WymaokIuRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0YOvxYbxdNjnrydoPDms/Njz66AwCm20G4jR8g/jNs=;
 b=j+rvAQ29OIYyUYDXf3MAADku5zKCVnS06yAEPv1CvPGfckrSJQI16QlzmO+oe3tYmtYcmNlcrt8WQ+SSQ/yMCynJyXmfPQ6Db9LrBxJHQvL13omQkGWWSn2l855sXRF5Zme9lmpPrXlXE2Cd/rfuH4iAS80LFsEiejoQMFeUS28yYR5Yhb2fi8zcSzv3cBSsl1IxCQxVwJcyMXDxYTAbovWbQtwZ/1V5P1LWcShD7z2oVNzbyeZ5duIwSDN0ptCClyIvJg+Ct6gFUm/dSfCklmUrLXdM5EBg9Ywt21uNjcG5oOtfPnnbma6duqbeSZhYsQWc1xWG3AG1PgpmAejwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com (2603:1096:604:13c::13)
 by OSAPR01MB7687.jpnprd01.prod.outlook.com (2603:1096:604:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 4 Aug
 2022 06:05:31 +0000
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238]) by OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 06:05:31 +0000
Date: Thu, 04 Aug 2022 15:05:30 +0900 (JST)
Message-Id: <20220804.150530.297560290822781428.atsushi.nemoto@sord.co.jp>
To: buildroot@buildroot.org
From: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
X-Mailer: Mew version 6.8 on Emacs 27.1
X-ClientProxiedBy: TYAPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::21) To OSZPR01MB7049.jpnprd01.prod.outlook.com
 (2603:1096:604:13c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a54f967-08f9-4f65-8a2b-08da75df5648
X-MS-TrafficTypeDiagnostic: OSAPR01MB7687:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dy/+32tNS8KyQagZtH5WpO6rJEMhh65ixfttB8teds6MFgC6C3TuSzz8JPXK/Jg43Ms+MUgipplMY5yc0pnlabrFrBd5k2KSBtcMFCE8SXxZ7uVFp3G4YguLce9O+84Zq2u6kB4H30xDFiunn8YyvKjY4F0ZUmVMDtVNDTkkIhdh0H/RsAHUw1ws0Qx5eHH5t0RfpzRwQrAt+m4TgA8qWjXC1DZg1ZnUJ6OrDvhuFsSG9HZI+qOGhM3nj96CegL77E/zhDFCvTRBWqRyXVHmfmt80yJR23j6rX5MNDN9YJxiWzh0Omhelr9c0gXBPQcv9ftSpT9kUCm8tLpgIvfILrwVCig6QdPvJh8ueXpnCx4sEh44VN6HkZQquDPuBfJvu326R48rkHnoyuu3iuPunKUWynsRSpUGyL5yrE+zUun44TzCfhTflDYTL9Jy/d22wCwsjuglw0nQmAMsL+haVGfS5uZY3nFOshiHfv5DNb6DwuG6oDefladx775LxyMskJC3zXuxEHJaRMa3uq00S0wIT7TiLDpPDZxLcBGV22ib4TUxZG1iVO4BQLS1VXDkEmLFlNdhFqrWDL8HBxNGfotfuB649VUXYzn6EIgYpkTeWfq6TgpWfMZgL9auDDkJvhIP6BxrjDh/HTSVJBMZO/HvyblRKQh0jyGMCBRqDnnrU4C4ErVHoVndcoo5hYr7mhWpBx8z8lJBmIWy6aWvCKBnHX372cZYe8wnFPNAUnzGj8lMdVZwB4G5a8ADx+LTjAWzSJWPdva1hSfpg3QwOKuiP1wZe46oY/4/WW32IVjj3XCojCZoDg3YqSdgqUjF/pZ+0a/kAyoew8aDbW8uNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7049.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(366004)(136003)(376002)(346002)(396003)(8676002)(66476007)(66556008)(4326008)(103116003)(186003)(8936002)(66946007)(2616005)(36756003)(5660300002)(2906002)(44832011)(54906003)(478600001)(6486002)(41300700001)(6916009)(26005)(52116002)(6512007)(86362001)(6506007)(38100700002)(38350700002)(316002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHEvAsakUkOHEHXqaNrDkPuQkfOKxQQQl6D1jjYfprLhYPpz5KUt7dGGg0qw?=
 =?us-ascii?Q?4LV410xTRyonSmhoTakQn9uEhMZNADsbBH6X1NUbgrzozNIleN994xiG8R4A?=
 =?us-ascii?Q?rq6MQhoUR9JiJRVufZbPmURry6kpjzXvyg+6nXOHUK9cuvtgOtdl/lzA/m1+?=
 =?us-ascii?Q?LAAvMNMEPRPeuIexYyvexLVUNnXLQDgnrrvOXjbrxWnU5DYkcQJD6/A2GkO8?=
 =?us-ascii?Q?QA0cfeHAy7TttZ2w0sVTK7/Rl1Or4uOS+ai5hssDEhOSic9rjcD7ISq8X8cu?=
 =?us-ascii?Q?VkFpSA3FLrZEt6Nw16D5NmIunMO/Htok+h6oT3weNEavltEG0r395zVFAEtr?=
 =?us-ascii?Q?svyv12QwFHbB3upeIpL/RllTCZGAo0jN5NJUl57O/ua19KE1bVQr2nYl5+5h?=
 =?us-ascii?Q?WH8Bg9NP60dEtBxV2pGh+ai5YyulWNdh3Ugwr1h70LAA0aLSig9pCg8tuVYl?=
 =?us-ascii?Q?7yPMSs5Xe+ad9vp5H42eQfwMCslStynfTuxQ7FEmOMCKGraRhIin3kyrbFRU?=
 =?us-ascii?Q?mqwsr7YB1YLLv+eR3tLJVhcg+r6trW9QBafDuE8L/Tz6ZBQ4r+c4Y9JNO/Zv?=
 =?us-ascii?Q?nY5nOFBc+kwCzbs2KVdX8A9WhwGRCkh6QIxgPnoTyYXWe2A6tnDYKjYPekwg?=
 =?us-ascii?Q?KnLc9S+xBlXqufRlp0UGsEv+e0oZNsW/U9Cyj92HZH0+Fqc35fxCZW+6ua9y?=
 =?us-ascii?Q?w5uJSc7l3I8oUF6dp0TDE4qN7r8EEOylEda/+tYemvo/pvBfRx0AQxn21AbA?=
 =?us-ascii?Q?TsQaRnx8WtMy2+lar10fP2LJgeIvVak3pA4KowrmvINt7A3P2zVCONVfA19N?=
 =?us-ascii?Q?YvEly3PZRlIQx6IOuIWUwMFI6n0MvyJb7QRKwIA5tF7PEPGWaNnhUHR2k+pN?=
 =?us-ascii?Q?0VpAzXvzWdqT3gqhcK3jA4E/UWYY3319nEa/uZHNy/+MRK694G2KtDnSf1s3?=
 =?us-ascii?Q?2RA2bWQOfb8k7gASc2M3avS/+7kVbHSdZDab0NXNMif4zbsW0UVvNJGiqZ9k?=
 =?us-ascii?Q?H4WI9I1Ju0PZILFRE+B9Y8pJlXcRl27vUaOdzW0vuWXVTR8P++z86gYZug9s?=
 =?us-ascii?Q?Ur74C9G8w9hJkqZIJ++Y4gZx2wX/Bd83rua5cQsLty7rhjEqMrlVW0nXBEAe?=
 =?us-ascii?Q?U6iH5CdobVSsQrcdw5Z/v3m6qWSPbh8tu4uc2GyHWcROSVQcGDyod4VXrS9n?=
 =?us-ascii?Q?O38MQ+oDl8q448q260Au9nPyicxgfbmHVBwdsu0OLDAMBmRwNUp7Zl9eiSM6?=
 =?us-ascii?Q?P4A1HGhjbkt6MW+WGcASIjcf8ogJzx4lmm8mxhZICRPNwXfqAxgN+vcJEO9N?=
 =?us-ascii?Q?vnC363VYlG3F6W00jl7X17RLZYN1stDI7IiSqxtkpnRW228/fUC7TR8h7ytB?=
 =?us-ascii?Q?sl6Ln3g2aacURvN0UXyodzP5OHCV8iVza0UnURXkk3lOv1+X7utwFOH4I2kW?=
 =?us-ascii?Q?z0PHNj1ajZZVp/uB4VqX1oSLuMSu4ZkhindcsX7AOa6zKJrBVnIDYAKyAojM?=
 =?us-ascii?Q?LV9I+iHRm3A5p6OvkKe4Smauevd0EfbFbTMWBr7E5xVDrxSswTn5yTzWcqzh?=
 =?us-ascii?Q?vva/fiq4xxeERAagvdEOK5w8C6Bqmvv6PxeYEKZ0Pl6fd7RCkLMBBuO1RPru?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a54f967-08f9-4f65-8a2b-08da75df5648
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7049.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 06:05:31.3660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWzh59LrzvGQwOOmcNVN/Gp2227dSm9RhqpxaZYnLMyK7FdfMF4dnIWYSQINSYq6PF369bF4ID4/4Rz0+OV4am/o0/XMxQHWdcJui/c7qqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0YOvxYbxdNjnrydoPDms/Njz66AwCm20G4jR8g/jNs=;
 b=DoK85J2Ai3M+g+1SA/vxOF1NehtZpUMC/iWDdTuXAs5newtfJy0QhsCES2b1AXv6SQLMgacU8/O1u7DeT6KFxTinqUSmKntXAQP8OnmI1B0aV8OMl59LrCM5dZ1aNBSeKJXjPkOEmDzmIcQJdyqvoUQ/GloqfHL1ZUpNBY66Uvs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=sordcorp.onmicrosoft.com
 header.i=@sordcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sordcorp-onmicrosoft-com header.b=DoK85J2A
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sord.co.jp;
Subject: [Buildroot] [PATCH] package/uboot-tools: fix dumpimage for FIT image
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream commit 7a01882eb37e7504e2450f474d0cc8db60ed26c2
("common: Kconfig.boot: Add FIT_PRINT config option") introduce
CONFIG_FIT_PRINT and make fit_print_contents() empty if it was
not enabled.

Add "#define CONFIG_FIT_PRINT 1" to autoconf.h if FIT_SUPPORT enabled.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
---
Backport to: 2022.02.x, 2022.05.x
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 7cd527ad12..d884a010fb 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -22,6 +22,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -111,6 +112,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
