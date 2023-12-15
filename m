Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 03:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A190660F8D;
	Fri, 15 Dec 2023 03:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A190660F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIUmYkvj3FQy; Fri, 15 Dec 2023 03:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF16460FB9;
	Fri, 15 Dec 2023 03:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF16460FB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDB451BF37B
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A593B822CE
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A593B822CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc1Opp52xG-V for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 03:41:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72CC2822C1
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 03:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CC2822C1
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BF20PlF007724; Fri, 15 Dec 2023 03:05:26 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fh74p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 03:05:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQKxhqS8D1qRw1hWfp5dBhwcM9MrqtCOXmzgoftkQ+3iH+M5t3yh8SqRA/We6MZAe21k29bkTBMs2yoJptkx+hUnPX+dan7mNzyZZiXJlJzwJz24ThQIWS6eSNqI3T8Py+A1XTxdcJ2tGe8YGWV8m2xlcGYB/WswnGpNEngXeu1myYrEP3Z6MbVWFze7wo1HMCKl/z9rJ5gStJfAJAZkH3wwQPb7qGJYsFwxQrCcBOeRoHDUQ1hy2zUnWMdoIddSG4pSVjPhYXOjcbcwfdcA1mc0wGyd23lOvDfBb3f3IbHRPYcfDRgqz0s2pwvFD56G4U143Y0W/uO6OxYeGc0DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC/5Jl1gbi/teRaUwr55wo/qCZ7QQ3lAxFxlYc2QGiM=;
 b=NVM13xGq3wwEZdzSU0xjay268L4GQHGysGVgtMbt0ibzosAHU7BqUsNGYSHaq3pjPKa30LHBVRZZLofjqwFf5iy0C9c+gxYeCXK7cX0n+ax7C7kSHIDUT7cPwAHLzEGVSlJ9NOvrZWzgPEffJuAm/CDb7RaR8gryA7kvGQVJz6vBTeDC9L/C9/XrLufgBPpCtB+K//CRkrqT+V3YQC7JOkFA3HLkCk1JhW2IguqRvi/Rv1uGx0tXoElUwvn3Fci8QvOeQwNOdOfidHb5pVAXtH9C/MyM7WthRNvct4AtPjh58AfXLPa9i9+/CKRDX5RTCkj+EcM1zV1WihWnmYbXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 03:05:23 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 03:05:23 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 15 Dec 2023 11:05:09 +0800
Message-Id: <20231215030509.3472309-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TY2PR0101CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: b638b3fd-c0b8-4313-dd05-08dbfd1aae2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSvanjofVYOEuGUs6zPq1/pFKWLeJkWp5xn/zMvqLldCHvF5Y09yRrVC59wbs2ys1VKw4t2yPwBUrNZxIAGs2d5Q3PgrvJUbs2AB2g3Z0o0PqwAVbXe4nt0yXBaPI3ykoIZZs5BnSH8XKBzzth5wXMEymToOxlXcX3R353ECShY0ybNVVHwI3o0CXFQWNccyVMwA9c87NZitcv6XlTMQrndlFFVuu2HNO802Ub/P7gO9yITOkApEFLkJDbQ+4CYhbi1lc0LYx0O/NPpevc5KFZFSxiJAAQi4P+CCXp8BxGGGgdtBYuCGls6l31Qw3SpTdy2eW1m1ObiwmatzpVQkqHcdxFjO+F5r2uKlNl3SbeRhLAwYlQV4Onmcj+8oB5EdhI2PskbRuX5NEr9vjRGmW6CWnMXiAmAelHxodOhJigSAYg0ZRnynn7CibvYr85LbsKPzipRZrI0k7WshzYgcvc76FEibRc86p57ZlbPM1wUrLVDITk9swsWCc0cHAh8a5j5KLOQcRAqEMqUvJUpxOYUnHYgPNxKhXOt5933Kr9l9BDb6gWl6LTz03E2QQaDJgLrDwygsn1zjs15tqm+v36E+Bank1jkfRfOZSVrp65g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39850400004)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(1076003)(26005)(83380400001)(2616005)(38350700005)(83170400001)(52116002)(6486002)(966005)(6666004)(478600001)(6512007)(6506007)(66476007)(6916009)(316002)(66556008)(8676002)(66946007)(4326008)(44832011)(8936002)(2906002)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0YG94iQncKDd5Gau/P+J9uHSQJK1mjMVJHaK3ETDc/sC9kGBDilprVSIWqVp?=
 =?us-ascii?Q?Yuv2Mo9esKfE2Kyzv4LpdUTiKJ34FuSiIoTJlOp7h50FkvIoMU0yYk70tJ+v?=
 =?us-ascii?Q?GXx3g8uxjYCHf6iGPmadnCZ6hWzJf3V8PxRaukLo/KGvNqAhPvYTql0vRfw3?=
 =?us-ascii?Q?1JK5doKVqFrYtmQd3vUVTOXId9h0Ca7JHy4UNqzwvnV/3/78nExZcXm3Eyc2?=
 =?us-ascii?Q?NmZYzpiQh07MT+vLokop1O3neaX/YIO+nmZzl6XrvrZvDO8cfmrcOfSjC2LU?=
 =?us-ascii?Q?G8wiWtrtLVo1PvuH/yoO3sRfeiUlLYMEVQUSVJ0bYNgYqil9bcjVMMD1nj6x?=
 =?us-ascii?Q?UIzBA93FPS9SomdwTWvts/Sd0okpceT+fLA3rDzTyAXe3NSfgT3/4njjNZGO?=
 =?us-ascii?Q?nMsNBKbz8BkHcmjr2gP0b+522dEL+q27Hqp0l6RV2OfPsmTID8aBZ5GNgx6q?=
 =?us-ascii?Q?CP/AF8htc8CC/elLHkHRp8ED6yIGaryovLEESgVoO7Z8QwnS1yrbP4Z10Z9n?=
 =?us-ascii?Q?Z8YH4+FigyE9Y2dDvK2ruO7OYWNpy6dqG0ldfRytxJG/FXqHSyie0zTJZjl8?=
 =?us-ascii?Q?RO+eu18PfytE79SMquzKUufoh4i8D0s4WJ7/2pYecH2qJ/uQQy8Gzvg4M3wc?=
 =?us-ascii?Q?FHmbz4uLM6R/DafH4HtyBsuNz71oSO0ZxIUOpaX8FwaqEFbNcVur1bNePeS3?=
 =?us-ascii?Q?Z0kFJnOPRFE5lyZhKhPOiFBsmA5Q5n8ttXfeezYUKlkB3UynQpxj69x2SN0o?=
 =?us-ascii?Q?nioU5URv1nhFYzJCWOPKsflR4mt9nbWfk+RwZbamOUZ/I8ZbxuLqV7lrAgTQ?=
 =?us-ascii?Q?+rayXwMJPDg7CW1eRkHXuT1k0eHT0kZcpFduc8pj43Z2zX5VE+YaVPRWRSyY?=
 =?us-ascii?Q?R2arSIYV9JvwujUCcvEcWNW4/FU8ZSQtAA/ysWR/RNVs8zU/s8/r+xUGf1v2?=
 =?us-ascii?Q?hWapJqtbhnEox6xX41C3XAFmdNMn17N8GqbJW8Y4wKOcXOneJIfOuT9m5scm?=
 =?us-ascii?Q?AKAgOn0Nf30ejYy2zJmJbE9gosZSsqsj99YYtqbNkhMj+ao0CPITtFKxpKjb?=
 =?us-ascii?Q?ZzmVLNkiqTM7AFRlSexwI8kgOAhs5PkUq4bLvVzKNqUiP4/o0dCDqwYeZKsI?=
 =?us-ascii?Q?fIITMxN4hyGyr1ZMN+gi/H5fKlT6LlBzZbFIV6Y1ZAQ94F/HJRXQollooCnp?=
 =?us-ascii?Q?KbfBwvV0QySo2SOHC58jd7qQ+rPe9K1d8aZojk9Fh409ECE4Bcf/TRris4rx?=
 =?us-ascii?Q?CTnM7LuoyqTQipdeLK2fo3h0jFDNt8WR+y2dxw+Q9xWmC1nXfPVlopDUzPvZ?=
 =?us-ascii?Q?Kb8IzELhNA75KEp3HJqt9nbbCcDSeli2SNk/PjpPIBvNt0O3aaKsRws3mJpO?=
 =?us-ascii?Q?s1GQXDZmnbQ9dqRxNbB08DUkaIyiWUwKulpuNS0RQRmrc7ISSGwydEklRMvM?=
 =?us-ascii?Q?rtMVCqeiyTnO0yD66xOUPx5z/wYxOjeV13G9ZpX753wLZpfRwvq0XK1AUroU?=
 =?us-ascii?Q?n/PPIykNYkKA70ZNxcQtY1K0G3LbFLLl16uI9gOTWALlp+3ryd0++H7R92u0?=
 =?us-ascii?Q?DoDX8gxhuHCA8Wv6KzLmip4xBpoFscNY2F7pa4In8R5ZMTTDYNZ6gZ1lVkyh?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b638b3fd-c0b8-4313-dd05-08dbfd1aae2c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 03:05:23.8270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fuNdveoql+lALyUPdpiM0HvNT4AhIgyIxNF67N1BdGIN87N4sPEweB8zMEAgBx8mmkVRNWtLP1RPkjN2v9WAfPXTbajxtoff89+eh4ggVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-Proofpoint-ORIG-GUID: lfeqGpcwnd81zmLOkpXpGX5QVLMntI1x
X-Proofpoint-GUID: lfeqGpcwnd81zmLOkpXpGX5QVLMntI1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150022
Subject: [Buildroot] [PATCH] package/crun: bump to version 1.12
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
