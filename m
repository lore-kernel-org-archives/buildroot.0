Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D7C4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 03:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C1E60FB5;
	Fri, 15 Dec 2023 03:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C1E60FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XR1d2a5R16fw; Fri, 15 Dec 2023 03:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D4560C02;
	Fri, 15 Dec 2023 03:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D4560C02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82C4B1BF977
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67CA9402C3
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67CA9402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KadPl8grP9Ri for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 03:10:41 +0000 (UTC)
X-Greylist: delayed 312 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Dec 2023 03:10:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D310A401F3
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D310A401F3
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 03:10:40 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BF2weFk007875; Fri, 15 Dec 2023 03:10:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fh77b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 03:10:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im6cAABMrbCcyZwXAGVYxszixuA/pkJNh3DfWUyzZdmhPjPxcwOD6YX0oEdCZiR7ZQgONBRBYsKfG2yTVacSvF7qe8Yjos2FH8CUhOgakmAo5atLuNZcbzcNNmaUOmz6X8H3MLQNGQrbJyV0GuHMJE8UwkYpvXZ7F50ofl07eJi0rkP/Vr5NRr2Db9/ZmxhRM6OP2G4F7ihAQw0A1uRwub+W0kUA9SHeFfox9AQ9koz8OOlk2ojB+3dn7PCgaXw92V+/hF0Qc0GJTXrF1CYkE2PwvW2CUp1BnBW2PPm4+VX29YPBHJAwUc5B2kW6BvgqZx8UOLcezpd/xgjnkZ6i1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC/5Jl1gbi/teRaUwr55wo/qCZ7QQ3lAxFxlYc2QGiM=;
 b=Sd1p4/wXY6XbKAM2+bkNbtgEHj/JS1HyK6Y6T/5anRd+SbmkZVrwEJg3ryWTKnUKwECYy/kIoYMM/UY6nadCmowBu52ScY3mRa/cJ7IyqC0rLAjRW1NSfzyfHvvTtiH/cDrXWHT9xg1UnhfPVfTBbZh9x+kBkNluoUQH/jEJ4KAwYnjuNFt6vKkpdR0pF3BZ9zQqAWR12o8uh4EThFAqHyLZe1k/qcijkZdaiyD8Iz7ZIjccNJvttpfHLRwo1azIQzqlLfXsUugnx2ETuNeqhJwGcUkqTfd+6mpOM07nAi4bs0UiW1Rui9npepu2AB9VJfyPjUkF633mTQmLQ8aaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.29; Fri, 15 Dec
 2023 03:10:34 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 03:10:34 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 15 Dec 2023 11:10:19 +0800
Message-Id: <20231215031019.3481048-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bad9ca-0abe-4892-2d5e-08dbfd1b66ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOsmHS40syKD2aWaB0ST/8eS+Hhg/M63Zb+jBDPXU06CDSFYJDSkPcolI1wAuVhj53ddts8pc1Qm1Ws8dkoByVIqhErbDy1GuZ5uxN9CDtqvuMreUAH4vZ185Q17Ye6DwpSjeG1NemBk/Eciyki0X/5TIY6xweM1UnwoV1SCCSSu65pvug4A2bZCvPfcXBDGbL5PQeTyV4NL4GaIt12FnhjrmtwW6DpoWByBcFRuNjLd5dQ108AwGXf5P8s5FDMrPbT++o04d8odN7e1snevXBo0JdGbUJTOIrnjCxnndVxqnYhnpKBkU4VMKPdFUOkOINQFOn7OkyEpkH0oowdfGLiWl0EjPmCooFdSCdL/fgEerI607xDRRJH9XwE62+Hrtc5ek3S4RQRptnLbtTfuUVCqvorTZYyC9I3wyGcMxSF9op+3xdTm23DNhGYKP8Vh85gHhg6pHS5zfabY3+XT2D3jdlz5ShfB2+OHfWjPcK6b3rmGzCIKzkB2EWWejOt5P7lAKxGqQT+BCVa7MqDeZiubK4AlYOhRxpIyeUOaLmDrlnoyaxDyOIwTCx39Ap/7toFWKRkRtT593tQgqa9P1okB0xYdH3G5g6GBgvWAvCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39850400004)(346002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(44832011)(6486002)(6916009)(66476007)(66556008)(8676002)(66946007)(316002)(4326008)(8936002)(478600001)(83380400001)(6506007)(966005)(6512007)(6666004)(1076003)(52116002)(2616005)(2906002)(5660300002)(41300700001)(26005)(38350700005)(83170400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8UtyRtOHHxuscMtQx/NtDhhc6kwBxa8BrCwC0/A3IeDvqWIO87t7HO2YkebG?=
 =?us-ascii?Q?AiReYGgxHvt+WqQiS4EK/fNqYNi16vErparspivqe14EeE9tEsi4T/Ey03CS?=
 =?us-ascii?Q?g5FTXfcgcHnDatb9M3FNIf95EyLmluIgTw0P3fnEmNwkW15bED9occhIPODQ?=
 =?us-ascii?Q?gM3jZnR9pQ5dM+q2imZ/DO6iQNn1TEEOV5nUU6nGzfpI7RTajJFug+INk+VL?=
 =?us-ascii?Q?RxxQxfC4HglAN2t8gWxjvSFbwBfCkO7sisGPBCixmHQizLrbZLHn2tEH/IgD?=
 =?us-ascii?Q?5PAFbIxSnWszewADV93g3rLJ5CHg83pCQq6C1zVewTaslh7Y4KlkjC2KS/uA?=
 =?us-ascii?Q?nYtiTHVSxIm7MovMX4D7eoBTCxuPkXMnrg20ZicEyGNgDuEeUlKN+ER9Ba7u?=
 =?us-ascii?Q?AgJYIpD3YaOZh+DAX13qfNHQWh/FV+L9MWkHfHTjPR/zA39usVG9VMDcTPJo?=
 =?us-ascii?Q?8Mv/xasjg/svSTH3kmMdo6h+fIo+v0rHpC6rKGLLYrHMOj2ynd2BEUZACDPr?=
 =?us-ascii?Q?NJ5R4h4IuVnrBLgA3+eqdv1tPaz716eISvaHHVvnqtLFX+vORfIrDll63DwK?=
 =?us-ascii?Q?Q4pxg7DNsytyB6ulaHXwxAOad4sTN5CPgtsp95t9jJ+Cx+QDmpTaeIZMZ2co?=
 =?us-ascii?Q?h8EZiDNf3HmfghSlev3pQLKXfMgZfBrlPuNzCnxl0sjKq6vFqF9EomJLjBfN?=
 =?us-ascii?Q?uruXzf/F9oY6mWkwZ8horjS6IijhkerWVJsuaULdJKy/p+Cr4wUPZD/c5/uF?=
 =?us-ascii?Q?h6rG2ICIHbcDwg/AF/HPxw9k0RAnOMxCNKSQHV2E0bdKZNF7WDB894XxLKm0?=
 =?us-ascii?Q?14NQXjoPCixBGXLJnE+doq3erwAfCrsGr9FiydgTBb38cGA5MGdnXz10rnEX?=
 =?us-ascii?Q?nyld2BQEwJXMIriVVTLH/OAz21zVQmojmoHh7p8FnoDbCWe2JpK5OjEUbXPB?=
 =?us-ascii?Q?lwF0Qo2bsb34qLxRjysMJCjujWrcnSLqEA30UgSDTs8XSS8GZzFp+HEC/qKc?=
 =?us-ascii?Q?+v6Ba2aQN60mXKc9xAyE35aUhnvgIF99sFfoU6Zxhi8oOmGEy975NMjcO/hG?=
 =?us-ascii?Q?u8rMt0HCXyT5eqJBkORkCySq2iKelS345KXjSKzNQUwfTP8/43ret1w82RCf?=
 =?us-ascii?Q?+hzEZ5Uq2W8mpzNbpv6YmO/V12eiPMk4SU4epon9CyNrH+4y1IpRgWkdnvEQ?=
 =?us-ascii?Q?Ny6+DyKHd1gpULASNEARAX4XI4aBTPPGS4ePPpO9vOLb5P1dE8uha4HsnNds?=
 =?us-ascii?Q?Y06yyZD26u8jI9j19YbRJpLb1JOVoKpQLp9qgnsy0mOId7axFGUYZBlM6vjB?=
 =?us-ascii?Q?vwBmZ+8mVAADI8pIa9CPAxBzwgfVO0KOZpd3uQrscBF10sIkoiqSBvsKqmVn?=
 =?us-ascii?Q?a4kvLE7Nq2ZtIitYlfcOdnwSqKlIKM5p2N0oUDkgbuVXfQcfX54LzXKDeS3E?=
 =?us-ascii?Q?0h0DR/uX4hcVQN7K892G6iQFU4dc8ZmxTazhmwNRskeED3KJ/0jhZNtd/21L?=
 =?us-ascii?Q?Ja4qhUpWYxz4KGaLxmhu6dOGEZlpDK7TMWJ6pyZnWk4H9UJMjFfScveCP2OY?=
 =?us-ascii?Q?wGoIKNFP5r+FiLgPKU+T6f+MkIjGDElT0b5RoX+n23TiCkG2kDHnzLIZHO8l?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bad9ca-0abe-4892-2d5e-08dbfd1b66ff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 03:10:33.9773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYWjJa0+nF1/iRM7S6Ig0ze0KMK9X+5OmCj7x+37+boZZTTteHQScmYvH8AmLBejQgd0BZJn2X0YfYXCjw9ebEhWUgbBju7YVzWqc/5xuos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
X-Proofpoint-ORIG-GUID: y2Qbj0ftuSYIBGCsEYLJnF1rtYLCkbkY
X-Proofpoint-GUID: y2Qbj0ftuSYIBGCsEYLJnF1rtYLCkbkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150022
Subject: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.12
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
Cc: christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
https://github.com/containers/crun/releases/tag/1.12

Also add a patch to fix crun compile without libseccomp libcap issue

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ile-error-without-libseccomp-and-lib.patch | 59 +++++++++++++++++++
 package/crun/crun.hash                        |  2 +-
 package/crun/crun.mk                          |  2 +-
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch

diff --git a/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
new file mode 100644
index 0000000000..81b08d34b7
--- /dev/null
+++ b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
@@ -0,0 +1,59 @@
+From ea27b1363ef709ce4b169138017b67ef624b127b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 12 Dec 2023 10:47:42 +0800
+Subject: [PATCH] libcrun: fix compile error without libseccomp and libcap
+
+Fixed compile error without libseccomp and libcap, running
+clang-format to format the code style.
+
+Upstream: https://github.com/containers/crun/commit/ea27b1363ef709ce4b169138017b67ef624b127b
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/libcrun/container.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrun/container.c b/src/libcrun/container.c
+index 34649f8..ffcdb24 100644
+--- a/src/libcrun/container.c
++++ b/src/libcrun/container.c
+@@ -23,7 +23,9 @@
+ #include "container.h"
+ #include "utils.h"
+ #include "seccomp.h"
+-#include <seccomp.h>
++#ifdef HAVE_SECCOMP
++#  include <seccomp.h>
++#endif
+ #include "scheduler.h"
+ #include "seccomp_notify.h"
+ #include "custom-handler.h"
+@@ -47,7 +49,9 @@
+ #include <sys/signalfd.h>
+ #include <sys/epoll.h>
+ #include <sys/socket.h>
+-#include <sys/capability.h>
++#ifdef HAVE_CAP
++#  include <sys/capability.h>
++#endif
+ #include <sys/ioctl.h>
+ #include <termios.h>
+ #include <grp.h>
+@@ -3829,6 +3833,7 @@ populate_array_field (char ***field, char *array[], size_t num_elements)
+   (*field)[i] = NULL;
+ }
+ 
++#ifdef HAVE_CAP
+ static void
+ populate_capabilities (struct features_info_s *info, char ***capabilities, size_t *num_capabilities)
+ {
+@@ -3876,6 +3881,7 @@ populate_capabilities (struct features_info_s *info, char ***capabilities, size_
+   (*capabilities)[index] = NULL; // Terminate the array with NULL
+   populate_array_field (&(info->linux.capabilities), *capabilities, *num_capabilities);
+ }
++#endif
+ 
+ static void
+ retrieve_mount_options (struct features_info_s **info)
+-- 
+2.34.1
+
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index bdffb0c6aa..c461d78d97 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5b8b5adb1dff7af768b69d2b0b4f2cd785ec931e7aa10138aa29812c46ee09ff  crun-1.8.4.tar.gz
+sha256  a76982ac076a5c9bf9f85bd8d25b1dc6344e252399a7e9231504357fc019f7cc  crun-1.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 15438a44b3..a6088c13a0 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.8.4
+CRUN_VERSION = 1.12
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
