Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D13C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 07:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E9F611BA;
	Fri, 28 Apr 2023 07:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E9F611BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WI1wsorTrTbQ; Fri, 28 Apr 2023 07:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E5560F49;
	Fri, 28 Apr 2023 07:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E5560F49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9FF91BF589
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901EB40125
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901EB40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2xg4fTd0jkX for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 07:16:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43409400FE
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43409400FE
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 07:16:50 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33S6h7H1025824; Fri, 28 Apr 2023 00:16:48 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mp071-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 00:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVVfhmZ3+FcEUnhhgVu3ZeBjR9ldD7yHveumXVLSD/468kXBZCMftqrT+LNAzD25F6lOJVQb2VyvdiwXbo/dqSrOiYBuqWu64KkmPZZxhx7jWQRGeZHZ35k8VI+WhBw9kIRh7oRHXht83MfMdehUu5Pqwlhdz/6230oK4QdmG6ZQnIKegr+PyFpChW4ImH/7pkI3lhEdrd77jKPJLiA5Uqs25RqC0KbyA+2Qjfls0W8/fEeZxgiTR94+SK8DbxZd0CBRz3gDB6kMQt4anpVjwh2ug1mDCp6AZ6V0+qh7N7sXxDUj6unfTZpeWA6Ib5T757kjbZuTWE9/EtjVx/yFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVV0hTr02l5MU+BJBk4YJuO7P9wiOt4KTTstXR9F3ok=;
 b=mooJZxYSxF10m/xLrRKJRgD9i0I5ImOYJsi2VYv4kdhVY9EvGi3QLm8VnKqlu1CsKqCjyhbQfMuIOvY1wZbLLG64N4Y4b6VHeHH8q5WmlS0fU6pv5RNqtWcoF9a4BfCsFpHu1Kb+cI0q8xoUicc2R2Sm8AvrdjJCO3hgTqF/TiAL6exK/ljzMkc2B8Wet8L8Uct6ScFg2RZ2aKCwzI6flwvUpqWTVJfqPsXgCcQ2ReH9MyE+iSMXYKI+g/jty5nE/7NaHPSalx2U97BAWhhjy9VMMkh/M3+RmdAWIf6VJC5LDW4IsUqfJpkWvkTv2v+PcxT3B3YGubm6SSLeZhlk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 07:16:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 07:16:37 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 15:16:18 +0800
Message-Id: <20230428071618.805982-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: b2829c0b-628f-4677-9714-08db47b88147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NzrGryeNf4OY8Pbcr1X1wnVN1Z4ADyPhoVNwVgZVwoV3n+uQER6sDPEVEFyKBUYPkaWN+VKbhh0gmEEBQMZ47x2EPfZE1KGC1x8bejTeduYHYjkZdyshaxoWBDOeizHw714+Kqb/Eq36OyKxj/UwIbOdEY+/GsZgB3CfEPlfVgmB3CZAF9p1PssY+UaDphDFwyjP+0kZJmuB3CZ0862d3fLWty9Fgo0wtV9ahb1sfohMygV8qAZIRvvhK5gcz375RRzAkfgNN2d6ayHlWuWAXrGOlEzI79HI+mgi1a+0XtRziQz2AjAi0vN45IiFsL5HeImc4hKJOnHXspAyLNw+QS66m7ou6YRIWpOhvuN/x75o6JEu5Ept0i81vKrxDSLczNV0GkhpaFVO7YOUtozTqBestLO469ffshtC+Yr69dDv6cEsivkkEbDa+M+htcLbkJNhZCpkeVvCao5qD222XbeWgUvNtnvtplRKROge8XELfLZpSlJTvQhE9479y4uc9P6YXK4mKkHP1G3/0NVEdIwgxVAQLkO88Mg3JhAxv/5JkdPtuphGpD9iKOwYpmw1ivBSwmYAKgpRjkXLUwbCJbc1yh7XipP5SndqGGgvLdysPEkPPG5M+fWoVlzwsw5SJu6RZWRpDKan/1QS7ov6uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(451199021)(38100700002)(5660300002)(38350700002)(44832011)(2906002)(8936002)(8676002)(316002)(66556008)(66946007)(83170400001)(4326008)(66476007)(6916009)(41300700001)(966005)(83380400001)(186003)(6512007)(6506007)(1076003)(26005)(478600001)(6666004)(52116002)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NWL8P14/q7/H46sHSg3v9y7vtZ41mAlRKOD5T5h0RZZGKXVCFBtGGGaxpw7Y?=
 =?us-ascii?Q?Bnb22H4GOj+rcYgfuFANRzi0AGLJzEHpipT0cdvO1K7PTL+WZfXMzqyNwHOH?=
 =?us-ascii?Q?T1saTfObX4URfe0lCqBq8WSkqueAdsr4y7fflKE7PUsV79QSUFDiC45vjBYy?=
 =?us-ascii?Q?qcb1oQ77O37E0aR60HOgIsGxFZ2x1gRWYYT3fNaWZdBXyoVPPDtkLKCr5Dwy?=
 =?us-ascii?Q?xFRRA+JRq4mzxRjqeDjjHKqxCoLvWf/CRYgkKIcrihmZxshNYh/mNurivfB2?=
 =?us-ascii?Q?uSM+/XxC5gX7mr+AxZ61jrvH8hZTHoYwztaZFj3IndyQfJoKAqi1fiH1cxxE?=
 =?us-ascii?Q?4Ed99pPiDwoo8ra6PA40sxIK4NDwncynnBYXMOPyStSMOiEvN6epwm3YONgv?=
 =?us-ascii?Q?OM2W2oQjJ0KvpofBRWPFN8o68Ql64S8m9rf6BV44HsE+n4Rimqqkza+BIcv8?=
 =?us-ascii?Q?iWdjmHa+TafCJhmi4hE51ST4AGd8/8TsAXOODZeZESlnz7JW3nqRq3C3FyQg?=
 =?us-ascii?Q?V5Gt1S6vLRFNdNoyVp5qQXbcdz+QdsnzzfZicE2bZ3omJc/OVy6Xi/I4J7e5?=
 =?us-ascii?Q?S63NVYLecko6R5soDpUeOSDJ84P65LZO6EYLSm8j6JDG9X7cfTuIiv9dV+TZ?=
 =?us-ascii?Q?l0Y+0if/HRIiEpFV1Vq74E8Y5WaxMraWXYurJt+njX5HNid1/47ZoFodtQup?=
 =?us-ascii?Q?aIHY9sqMgh6DgK8OG9/tKVZpo+wBP9FfOmn70+10x1V0WD7uOmR27DEeJMkv?=
 =?us-ascii?Q?P9SdzKzv4QM6ibEx5J4dWWRMB95lCk1bcp/4pSFugEZ25a3nhBMxCgmoPdxe?=
 =?us-ascii?Q?AFS1Z+UuacQ7WIAtIIORdDb2lQR3XxBBIQs8wuhtlAplcVMHFerEFhwWidxa?=
 =?us-ascii?Q?knRucxU6MwgjpJ1v9ItFsa0AmFZvp43cCMxrTKMr4Qhz8IgBUVlvZselIG/X?=
 =?us-ascii?Q?rh6CweKGYZpHuH/SoxIvUxFoWrrgue2JhygcIDX5nvQTKunREIqAjx6wnPgV?=
 =?us-ascii?Q?6/s/PxQN9malm/XFP73fR7DCwbhkrQOO8eFVqYnJm3sm+DNlGPoznjhJ+Puz?=
 =?us-ascii?Q?sUeCEn5yAs1XlY0dje9f6qt/tN+QuxgJX0K/s0JVTG+NbjHgU9bXFJHctmBC?=
 =?us-ascii?Q?OAGHiR6wkJL/ISeqg7Q5nHUZ7944KgsbtTdI3PRYNOUbsgNKlIfyCfCzjUO9?=
 =?us-ascii?Q?lacj2VyLbRTv09RlksyHsnXNqA7WBsMZ43pywtn2njQeEWVpV6bWzO4H9TG+?=
 =?us-ascii?Q?MCRvW9Z/YEKEDwKKcVot7lLaF60egPcA1stA58oUdPvyQXK0wV6vbU3QCOd1?=
 =?us-ascii?Q?ts3AFwfCn45XZj0qMua/GxmGrlxKhU9ixEC0YbENrJv2sbSc/ifGEUnCo9eR?=
 =?us-ascii?Q?vS+tWIKyy3nKkdQs6Xzwi1ox2t0Wwv1QVkimgTDpb6tf7gFYsXsdgdjiOfVB?=
 =?us-ascii?Q?EANCD9asIEO8/W/AW6JUfM+lefkcHAjEuHailWgQEmrCX7yvbQdl5Cq/3dTz?=
 =?us-ascii?Q?aTxyuPcI0lPZMenIDaIgiyV+9381mLWsaXQq+b1xiZULRK6iDg8pu7PzuK7R?=
 =?us-ascii?Q?7TClGNshNNgJkocWhHJEpRA7oqa9rl9paDzkidCGi+Oed9/DjoZis+EuoT0m?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2829c0b-628f-4677-9714-08db47b88147
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 07:16:37.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp2vlGAahHQWbrH6i/EJXllfBLhCDc9LT/pjP24j+xCLrppAM6IlFqoob9Pac0zyJ2EtNmYS4z4tyqHFxWM+Oeerel1vvYBHDtLORaEYDwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Proofpoint-ORIG-GUID: S-rbfrcU9mZAXbZ1HloPcqNwgSOkbZBK
X-Proofpoint-GUID: S-rbfrcU9mZAXbZ1HloPcqNwgSOkbZBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280058
Subject: [Buildroot] [PATCH] package/crun: bump to version 1.8.4
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
https://github.com/containers/crun/releases/tag/1.8.4

Also emoved 0001-src-crun.c-fix-build-without-dlfcn.h.patch, this
commit has already existed in the latest version release.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...src-crun.c-fix-build-without-dlfcn.h.patch | 39 -------------------
 package/crun/crun.hash                        |  2 +-
 package/crun/crun.mk                          |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch

diff --git a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
deleted file mode 100644
index 104c19a40f..0000000000
--- a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 278b9b447bec3fb81bf252eb2fe2c856892ec802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 30 Dec 2022 18:40:15 +0100
-Subject: [PATCH] src/crun.c: fix build without dlfcn.h
-
-Fix the following build failure without dlfcn.h raised since version 1.7
-and
-https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
-
-src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
-   26 | #include <dlfcn.h>
-      |          ^~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
-
-[fontaine.fabrice@gmail.com: backport upstream commit]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/crun.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/crun.c b/src/crun.c
-index cbfe900..af0cc97 100644
---- a/src/crun.c
-+++ b/src/crun.c
-@@ -23,7 +23,9 @@
- #include <string.h>
- #include <libgen.h>
- 
-+#ifdef HAVE_DLOPEN
- #include <dlfcn.h>
-+#endif
- 
- #include "crun.h"
- #include "libcrun/utils.h"
--- 
-2.25.1
-
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index 2b21800f02..bdffb0c6aa 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f669ecd3d1895dcaa8425eabb707c06eb3bdb5ae5201a50a423c3cace36c4a05  crun-1.7.2.tar.gz
+sha256  5b8b5adb1dff7af768b69d2b0b4f2cd785ec931e7aa10138aa29812c46ee09ff  crun-1.8.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index ddb96a0b33..15438a44b3 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.7.2
+CRUN_VERSION = 1.8.4
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
