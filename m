Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B479C25B06
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 01:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F50241575;
	Mon, 15 Aug 2022 01:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F50241575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XM2pMAXWO1UL; Mon, 15 Aug 2022 01:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F35541559;
	Mon, 15 Aug 2022 01:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F35541559
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3991BF97E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 01:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22A2A404BF
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 01:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A2A404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDh5aVcFBCv0 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 01:02:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9CF040490
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2087.outbound.protection.outlook.com [40.107.114.87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9CF040490
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 01:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guHfL2fzZj2G+EHRQLeZOihk8RsVPXZ+t2Yk3EpRpI3gJ+VtsfOH51pGXYjKLHkkViB6yyFvqnLcrn75/g/IvUHdccsXKEpwnJZj9K/hKmnyKuN7kMyizGpYZhWQ4OdATplj/VX8qTvCPqCyBOgGQyynLIuPdMwcwXR5OYYcVy13cNjqiwt8NjZrDyNkAEnokshhtwU/V+KF/XF3OvRPV8jCB9rGVPSG798cZmxGWjiSTbcFI2Z+VypQethYYKOBl2nY+EwMdtp/7u0iuJbJX68IxqoPMBDuAnx98Tu+MiOEoDBReKY0bOkqbJO2rj9f+nu6KXuRBo0jVm0XE2Uhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa/BluRkji/sLAI2iWat5FQk3DXtWjjDaQwgeIaO2Ck=;
 b=FFI5GtgsMU18H72f/CelsC1AmknB1wlmdFhQdQoQEokcbheQBcx13s+wbSrGaJXqz7SI1bi5g74OwXgoifeVZ+FdWzVVXcpTTcCXEcMfMGQ2/UKH3qR3uz7Mc8qtE1rAB/rFfqEkKsVZaV+hRcrkj/lj+evUXb1kFSFatITQTY0p8gPkjEtcJitQcq1OfIZxX3+lD/YQkdG92C/eUSvBPDq+qtlHwrrNRRSbmjCTgEnwQXzyNe9W27DBKZrbxhIR1AjOGHlNPBnxBDhPAz5mBDre8BYS37D9fYJdm0ILyOyD+fML7Jpvq+zqsmelr/jjK56MXc8fg2Y9Hh/nKwziNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com (2603:1096:604:13c::13)
 by TYAPR01MB3853.jpnprd01.prod.outlook.com (2603:1096:404:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 01:02:54 +0000
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238]) by OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238%8]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 01:02:54 +0000
Date: Mon, 15 Aug 2022 10:02:52 +0900 (JST)
Message-Id: <20220815.100252.228788492467122600.atsushi.nemoto@sord.co.jp>
To: buildroot@buildroot.org
From: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
X-Mailer: Mew version 6.8 on Emacs 27.1
X-ClientProxiedBy: TYAPR01CA0229.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::25) To OSZPR01MB7049.jpnprd01.prod.outlook.com
 (2603:1096:604:13c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac8f0fd-48fb-4e14-5248-08da7e59e22d
X-MS-TrafficTypeDiagnostic: TYAPR01MB3853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWj4n4tJ2p879srDFGbWWijsHi8vp7PZ4FQZVCVsSqboeNY0GbooUYPXYZtotaGkwMzV5EB2i+SzhaTAtRVUeCmnV84BEmwzt6/ZRoUQodn1gsJAIFbfay7sMeWb6ILdT1uMUzqYZIpyCcjSJgOFZ5ssgWtoRnqByP2gDG+6tviUqoHaMWzbrx/SCML+3o6Vw7YWnh7oil9f0I02cJfk9M1JmgfLnpmoDpviVlUYDPt8fI1zW3pXC8nK3RUfO+EiJcK6/otYaTJ9f3P9CJoWlQkHe/3luPjjHNCb9S24/O8BfexQ06TC4JTzSX4cJfqFERiyhi26U2kHzRQgTEOcY2Cw9TKEHUfQnGM3oTjmM3URvFdkGrV0eMst/70uIUNUZEO2EW5wVgG0I4usl9i2O2LakonjSbZiDCGAuwwhm/L2KV9yTEmXcOqr/K5TG5oJm+9TyrjHpjoSWyDWqwxmEP9YSwXz5QL5BAcfhso8Av4wShEZWZqlKy1UFMk+GIn2SoOjHCCUQvKAY500KEOdBRoI/uvrpkp+cbzRbJLcXBXI+dxPi90Ezd6tULcpmWFsLu5NuWPr1kk0239VSIkQgf3HSolWGKFurreTXNJM1c/K80BGrG06C6HMGkqCR7FM1DQaxTEbwEBgRrjH50eZY9MUVGp08tT/07sGrygcb5jWump+bSXQotNqmdraScIG1A61XvI4XvW7cTGAWIAsiz9wCEHXEt5/UCgWEy9aQKBJ0ond8Z0NlyMWnr9EEl9QTHxb6rfsKV2tFaXRAxZiCiBWIh/GFeaINo5b8VrRiILLFDPHZCj7q6a6sT9rmt0XUD1USa1cDxguaPuI98pWJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7049.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(136003)(376002)(396003)(346002)(66556008)(66476007)(8676002)(2616005)(186003)(4326008)(478600001)(66946007)(6486002)(103116003)(36756003)(86362001)(5660300002)(8936002)(44832011)(41300700001)(54906003)(6916009)(6512007)(316002)(6506007)(26005)(52116002)(38100700002)(38350700002)(2906002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIPMU5U147XYrh+m/yk+jg+t/teBwatwecPryYXNTBr5tnyny2Nd8gmZmXeF?=
 =?us-ascii?Q?Sg5iPts/eLGBmIz+5OHuZv33o+ywOx4Am4byNiws0tNyQewOCrAeo8FLdN8H?=
 =?us-ascii?Q?XDbQbEB56wbj3HQrtGfbCzAYSHXPMrddoDWPHPAHTdmUHdAXs6djAyxs2ZcE?=
 =?us-ascii?Q?krEf9g0GNi0raa6G3oqrc0hEsgqKXgB9XR78TF18d4hrk4ucFcaqt1J+i0gk?=
 =?us-ascii?Q?25dkyYJZ2hiVnwvUWu3mACtt0tJUMV7KkmN8t0JBunZQf+O7lHh5jm2d5FLJ?=
 =?us-ascii?Q?YDsNpCzNTUxz/9PCglGL6IeDxLWv0SGaR67V62OdCY3ZhkAWsb3vb0lu3P1O?=
 =?us-ascii?Q?7WJ1iBYrdMvpDFRIGCIQlLcLjh4D8tRXHOARvqR/5wBohG0JiqODHqOqmP7N?=
 =?us-ascii?Q?/nczK83M623WNnvhpnlS6lYvFiGos4K23cacJH1Lg0nfZ/wIX/dev4FMKcw3?=
 =?us-ascii?Q?xgljexP4UwfMAprpW9OzahO9219q+1t+A7HqrIf9bZ0sXgKCSAxDNYHLFhgj?=
 =?us-ascii?Q?Xfp/EvpL/HBoKgxyoft4E+JUznYA5HBJTn/r9O7aSY/rJWoeRrDxjfAOxiXw?=
 =?us-ascii?Q?kC/G1dF3ZLgGf4RMHMZGhXMRzOsYc1ZawO+cg/vFj4R+qRwklvPX0liymwGU?=
 =?us-ascii?Q?A8pAxkBUfokPIdcOPihe2N2m4p2zxu6QuxQzzxX4OWNaIKPRnifjYqCumJkp?=
 =?us-ascii?Q?Msfn2m3ll3B7LnfqR+bsapAoyW81BkxaUS0hMozh5xFAdvz3TwIGYsUSS0Rd?=
 =?us-ascii?Q?ccoyVmVm0iZEhrEMVkZXHhkjIgMlOm9FMQF3+uXHsT3FNg7O3wp1BtSFOCC9?=
 =?us-ascii?Q?8hkJZtMas0tMmBHbWVUrerCFGPNdt2gq527veRy6akVd7RFwC4OdxOvbokgQ?=
 =?us-ascii?Q?9GNaeXmp2kS4m9lQU5qr/CDjI/2YODt88F3/aOR+0Z0SgP2wwK/X4DKsXCA1?=
 =?us-ascii?Q?ewK4ADYplampz9ghcBdxBVhvBg+forEeF0S1QmGc1sg3nQoSOlgVDKff0M/l?=
 =?us-ascii?Q?3vXzw6LaLMPckQseAEBvFbgm4mSoGi7bY71zxMyDgthRHTgqPPVZCaZvv0Eo?=
 =?us-ascii?Q?0gHR+vjyiHjwsnBpTWB6GP2jOv7B9txzXWkY/EPmrGkhFF92G0rUgz+UNVD+?=
 =?us-ascii?Q?JPMiGxwtpn5+TYqSNqhdwbs9BFfdUQBcLjSEG4lkB33zC62tLEs2WJhVAjmh?=
 =?us-ascii?Q?O7yhQ5eQojur5TjMojmN9qcHaUjybFWMaWyyD3EoG6SABPE3FUPaRS8iuRkn?=
 =?us-ascii?Q?kH2gnmDUMEvYjHdHTv1jZi/hl758PD6m4D2xIPA4y6m9TRBPx1rRCwekcUZo?=
 =?us-ascii?Q?xiiNoN9lloPf0cL4uaJBxs5GWk6mtcqQHx+dEp9kCHEmkvDgIvzDh9xRj4pW?=
 =?us-ascii?Q?4lSuhkeDJlNcrCW0gqplBVMc872FeCxCuJ+afrOfvcdnpYVka/bDW2+DXxli?=
 =?us-ascii?Q?Cx3twyfKRAL3pqI099RrcWKxQXKCr4zGSEHBsH5s6N0N0G6Nqfib8cSevAgx?=
 =?us-ascii?Q?Bt4o3+sN77ap/tJ/MO79jevY3nPQjeK87YMvVBPEggqS/CsV3msHWizVYEFk?=
 =?us-ascii?Q?/gTYO2jUjRMuTI/TYOowqvvglzq62kEbEe/4mohyKxuc1R+oE4LTIxS588Ma?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac8f0fd-48fb-4e14-5248-08da7e59e22d
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7049.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:02:53.9419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebfiu9hAqsr+uNt+k0ZuQXzGiMj1pAi2YMmbX86wEXjoU2YkYvTOMCh/1EWZU7y/3U762gKM3CM82ub57Ipb/UeVCfDy9j/tZ82HgRE0Smg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa/BluRkji/sLAI2iWat5FQk3DXtWjjDaQwgeIaO2Ck=;
 b=h9jxQ8yYbDrlL0JM0OoyJzZKdkqpK5zWvJKGoC9gtxTDh/HT77gEdCyT984WtYrHfu/LIzmPLqNe6vgRzJzjx1FeirpiXpfgUxzvK1N/Ra4ub868KP/LhYU13cZTbqM8tTZ3Rr+0OVtLzCht6z4GNmtQHINLEA3k0muiWbARLH8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=sordcorp.onmicrosoft.com
 header.i=@sordcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sordcorp-onmicrosoft-com header.b=h9jxQ8yY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sord.co.jp;
Subject: [Buildroot] [PATCH v2] package/uboot-tools: fix dumpimage for FIT
 image
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream commit 7a01882eb37e7504e2450f474d0cc8db60ed26c2
("common: Kconfig.boot: Add FIT_PRINT config option") introduce
CONFIG_FIT_PRINT and make fit_print_contents() empty if it was
not enabled.

Adding CONFIG_FIT_PRINT=y to UBOOT_TOOLS_MAKE_OPTS does not help
while CONFIG_FIT_PRINT=y affects Makefiles only, not C sources.

Add "#define CONFIG_FIT_PRINT 1" to autoconf.h if FIT_SUPPORT enabled.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
---
Backport to: 2022.02.x, 2022.05.x
Change from v1: Describe why not add CONFIG_FIT_PRINT=y
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
