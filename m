Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E54C46CD2
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 23:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A3B41EB1;
	Fri, 22 Dec 2023 23:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A3B41EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lg1tHDywf6E; Fri, 22 Dec 2023 23:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CBB417A1;
	Fri, 22 Dec 2023 23:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CBB417A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 406461BF42C
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2612E408EF
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2612E408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbcR3uyysgwv for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 23:23:07 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::706])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41C8540902
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 23:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C8540902
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5ig49GjSz6R83zMs0QvoBVeEr1wTywYbB0KGMYjFCTiFfl0DvYXTBkeWT1hN+SQbRT30KgSUpx3dh8aTjPlDxu3hRvfW3zm4QaPpH29EPcj3OtqEPiciKRjM9UFeiTP6xr6TzJJykfaZDhiPrL+ICVbWJAprAhDy1QXkTSc68vzcxDjesIrLkGGcbqK/DnX6K/5OJsYwUC/y0srUyOUgyEOKQ+wpzYvFHQeZD2xB44NSdzbYUe9D2+Q76ZmpaX4DTxrnWWMpcEvHjHN8cZQkBGJ+HJeFsHwVyNOSXS+aBfJwYz/sbErbtTBXT+Bvnocm6/MdCYvUYLazPDceYmpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8brqJOWAJidTT/K4r6D+0boh2P233WTUNjunWAO3+M=;
 b=I5pGO62SlEybOsi+G779iU0NGGbbG0/Krf5mHDTF/9vA7EbBwSEnBAZKmOpgbWKXvKIXKxx6E+kiPbP0eGXc3P71uYG2FAhtOo7G4Ut6KcD/moJPgmgjNtgBtqzVRVQpePcahdEDtqS21wDnyNf2mqc6x3Xql9uux/qQQLuJejhZLZlfnLnaeWMhKz5CfPoDfnJWJnTlV1TziJs1559t6eOs+EweCKiTCIIGsp85DiXPrlEnkVvvY+q7QjSbZYmzmciWwkyKFkxzttZr90/u6RgHwEYDfeGfssJGObi4LHd4QOXsaEhGRFpOfD7VDvKo415i0q1Mb6osg8Aair9shw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 23:23:03 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 23:23:03 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 17:22:51 -0600
Message-Id: <20231222232251.12786-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222232251.12786-1-colin.foster@in-advantage.com>
References: <20231222232251.12786-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: CH0PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:610:77::28) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|BN0PR10MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a02fc24-1a98-4078-37bb-08dc0344f10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7p1TGLZ2+pLnqGD26JYGAi/EvfOEov6i0Po3v29UaljA+DedtixjUE9GCF5C7Bm5/ptfV7HPGy6E2U9xBoWhzlTyNWYfnI4yNX1nQ6ShUL9jRwruyyml50ZupXOVB3jxm3Xf8Nq+a3uUHzx9FIF+80SGss/e3j50QPPXnPQeV0PtgFQboC3wdMTXvlSaKfULouIGgNpDJwDg/sd+XEu1vVquv+4IsYBRhoz6MMVt/LjFUv9KR/BX5fgeXsEBY9+tsDKTVSbfVUh4mEuv9taEzZv9SyxKP5cYZxvFTU39mLsxp9PEYMSvSwiGAFigXC59LZ6OOsydIt4V2Uyq9hAezHfFSB24FgUAMbS9jRNygPMrj5SVBJM4tURURWm7TcWELQYox7rhsZJpCQ6tYK0vs+pQBLG9/NmECsfl48bBeriDYtSP9aV+A6PrHktQt9h28xXhcIK4A9xTPfNP1wjFkq94jcwQZbq3M1xQ6rT9cdehG5cVbZkCZziXqnz5Wcdq7Lbfu9xViyz01m0jitr2sKxgW+rrgeVP2Dj9hBzN1NnMU6tAU9hBtYXdNejoe68NICp8onl/YX41//M8+sss+zs7kZhf5xAEEh1H9PuEHc3hIv/xclSqrUaCsazbed32k9xA4iNnklAL4ixgz9OVXoCVWZU/KZ2GsmhXATwke6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39830400003)(376002)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8936002)(8676002)(6916009)(66476007)(316002)(66946007)(36756003)(2906002)(86362001)(38350700005)(41300700001)(66556008)(38100700002)(44832011)(5660300002)(478600001)(52116002)(6512007)(6506007)(6666004)(26005)(2616005)(83380400001)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DVoeR/mziKHZjZSFklLp3+dKHzjsqOunCTsTrVlE1eK3fZ3ue5nfnCbFyLC+?=
 =?us-ascii?Q?SFp0bhd/zoljOVoqQkm0LFvHVAr4cyeQS/lCi+O45mEXWOdl1jE3JbzrXVPA?=
 =?us-ascii?Q?wvi69cqc3jsyzZRzHXmh15LJjk5syMj39IiDEelh79dQtCahJmA143HdQsNY?=
 =?us-ascii?Q?DNU6TwWNgWH5+68NwrLXzTmHYTQZm2LmBeY0bz9fgBfAJIlf7PRqVhodDAZi?=
 =?us-ascii?Q?7pzTACWkmZGg4q3L3nGK8sx6qssLlW2D5Kub6NmpFR2N29yMujnyg5aWUKrC?=
 =?us-ascii?Q?Y6PRt/c4PjtYPk76U6W3ywf3erCbjkzmZRnJwNe4NsYUp5pH6MHedNjro98t?=
 =?us-ascii?Q?4PbhsXuwjxWH7FTQiesRp26Off4RYWaNnjTsR15p2oYeINWK03PHSXGH3rh8?=
 =?us-ascii?Q?DDrY+8RGqbmJ4va4M0FVm3PfKHOS5z2mKL+4TKWC+F7oqD7DZyUuvzW54QdN?=
 =?us-ascii?Q?FFfbuLxmEnXjeVViqg9xlsG4DGMvZnJGqDAc0RuQOZYrs5AH650hvRsOkPEV?=
 =?us-ascii?Q?ZOcZH1WEFjE/k4CFS0SpkVsJMMOG9klkhjKB1gsiXl0oMK+r8UyOy+Hfu/pt?=
 =?us-ascii?Q?pbzWtN8YhE0GZXMU6G2qYwZeorPYqH+iXCDHyXGh2oG3x2Ry1ix8nI06ZAo0?=
 =?us-ascii?Q?lCPTS6vXhK9Hx1U/shFXPDYhW27gqH75g0w1Uadr2vs3xLq+MWgIi9ee8Noz?=
 =?us-ascii?Q?KOBAo3oWI7htorIkxEeU+a5phXZrraEh4VoXhwAYWz5MNwLSX7dSuF1eqoyc?=
 =?us-ascii?Q?0GfM3D8dl+94HJUaCgQSnihlrkPpsJw8NY8fevnbxQTIQSDcThgsaD/1tgWU?=
 =?us-ascii?Q?eYIkmpY/NBMh7mCeMc8QqLDvDBLpPQVG3ENMBQB97ethpphTY2wMy3uqxmaw?=
 =?us-ascii?Q?6oSNvgH+vJTggJczg+gwjEdpnaBHoCTvrGHco7zKIEFTKLgfalg4dCPlq/p3?=
 =?us-ascii?Q?TUKLkkoAE/G7UYgtYfQzSYNuOk/dAZeiPB3Rbp/4P7h5cbp8pbOsygmwT1bS?=
 =?us-ascii?Q?GgrtnUxeu4ZT5KJtBiPywT4v/aNi+d0ye1qtX3nyCtHAB9Au+ah0YEmK+x9n?=
 =?us-ascii?Q?sWcJg8MqaySTAkktErv4VOcEcYHkbIdbPAe3lxu9oeGxrRldBa199xOJ2az3?=
 =?us-ascii?Q?hc2UccjxnoCRBQm1ugoHwX0fd8VFVfVQelQh3d57HGEwyuVrX9Cu0+qolO7a?=
 =?us-ascii?Q?JrQ3Mlsh9C1UHNB13O84vh1Fk95VLGvfJVY/2GHp3mhjhO81Wi/vCd0eBhaI?=
 =?us-ascii?Q?4I+b6+M2jnN8tdc/XLrMbkczMx4aW42JYMwaZA4TKSt964arIoG6zNk1F66C?=
 =?us-ascii?Q?enFqCh5JvZ1wZG7B8XaKLD3xuPPqms/UCzOGKX5JYofY6up4g+X0ld6Jbo6e?=
 =?us-ascii?Q?pzUeot3nX/J/zZFAE6jokneDjkM2iJyUyPJluzuG4i2tyDhWEdCs87xSlVsi?=
 =?us-ascii?Q?jJN3nuST5bV0K5oXw6CvZOuOjxDyxEaMQKdgGHbFYwYEfVdGorC+L+rrui6i?=
 =?us-ascii?Q?tixXOQzrAhEgGxbNZGBfQHemr7MZ5CfnU8OVZuQ/44C2pZtsdf7hbT3jgM5L?=
 =?us-ascii?Q?6AYTZYPqHbrgASGbAh86ZdYIWab5r1+nqq3M1gztavm8ob8c+Z9ZktMh+ZWL?=
 =?us-ascii?Q?QLF2/lJpgmZ7robN14bMSiA=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a02fc24-1a98-4078-37bb-08dc0344f10c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 23:23:01.7581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd3WryD4eL7ySlkZoDuNpEg/voXn7qpzcAt4o3gSEnF53TQIAs8GaV7NZ/2oGe3yK8X+PJT4QeZ62sOxcGYZ/HrLJFYl+hHtS4fFfpWW7YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4901
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8brqJOWAJidTT/K4r6D+0boh2P233WTUNjunWAO3+M=;
 b=zcmTYhnQStVAzyT94Apqi5OjP0xhsL7buA26A1w0cHBv8u+70QQyHs7zEU14XkO2MiK7W2gCkspMrWrudBIoBtEz+DFu19+mNsZKORamOwtiRh7nXqP4xfZqeONbsXb57H1156D7B+0yVdQy4ehOXYUYjPueO0SXaWqrgeNUeZA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=zcmTYhnQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v1 1/1] support/testing/run-tests: add ability to
 run tests from external
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_EXTERNAL variable can be used to keep customizations outside of
Buildroot. There was no support for writing tests in those external
environments.

When the BR2_EXTERNAL environment variable is used for running tests,
include the tests found in ${BR2_EXTERNAL}/support/testing.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 support/testing/run-tests | 163 +++++++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 72 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 485811b746..9ed689e177 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -3,6 +3,8 @@ import argparse
 import multiprocessing
 import os
 import sys
+import tempfile
+import shutil
 
 import nose2
 
@@ -40,95 +42,112 @@ def main():
     args = parser.parse_args()
 
     script_path = os.path.realpath(__file__)
-    test_dir = os.path.dirname(script_path)
-
-    if args.stdout:
-        BRConfigTest.logtofile = False
-
-    if args.list:
-        print("List of tests")
-        nose2.discover(argv=[script_path,
-                             "-s", test_dir,
-                             "-v",
-                             "--collect-only"],
-                       plugins=["nose2.plugins.collect"])
-        return 0
-
-    if args.download is None:
-        args.download = os.getenv("BR2_DL_DIR")
+    script_dir = os.path.dirname(script_path)
+
+    overlay_path = os.getenv("BR2_EXTERNAL")
+    if overlay_path:
+        temp_dir = tempfile.TemporaryDirectory()
+        shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
+        shutil.copytree(overlay_path + "/support/testing",
+                        temp_dir.name,
+                        dirs_exist_ok=True)
+        test_dir = temp_dir.name
+    else:
+        test_dir = script_dir
+
+    try:
+        if args.stdout:
+            BRConfigTest.logtofile = False
+
+        if args.list:
+            print("List of tests")
+            nose2.discover(argv=[script_path,
+                                 "-s", test_dir,
+                                 "-v",
+                                 "--collect-only"],
+                        plugins=["nose2.plugins.collect"])
+            return 0
+
         if args.download is None:
-            print("Missing download directory, please use -d/--download")
+            args.download = os.getenv("BR2_DL_DIR")
+            if args.download is None:
+                print("Missing download directory, please use -d/--download")
+                print("")
+                parser.print_help()
+                return 1
+
+        BRConfigTest.downloaddir = os.path.abspath(args.download)
+
+        if args.prepare_only:
+            emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
+                                         "vexpress-v2p-ca9-5.10.202.dtb",
+                                         "kernel-versatile-5.10.202",
+                                         "versatile-pb-5.10.202.dtb"]
+            print("Downloading emulator builtin binaries")
+            for binary in emulator_builtin_binaries:
+                infra.download(BRConfigTest.downloaddir, binary)
+            return 0
+
+        if args.output is None:
+            print("Missing output directory, please use -o/--output")
             print("")
             parser.print_help()
             return 1
 
-    BRConfigTest.downloaddir = os.path.abspath(args.download)
-
-    if args.prepare_only:
-        emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
-                                     "vexpress-v2p-ca9-5.10.202.dtb",
-                                     "kernel-versatile-5.10.202",
-                                     "versatile-pb-5.10.202.dtb"]
-        print("Downloading emulator builtin binaries")
-        for binary in emulator_builtin_binaries:
-            infra.download(BRConfigTest.downloaddir, binary)
-        return 0
-
-    if args.output is None:
-        print("Missing output directory, please use -o/--output")
-        print("")
-        parser.print_help()
-        return 1
-
-    if not os.path.exists(args.output):
-        os.mkdir(args.output)
+        if not os.path.exists(args.output):
+            os.mkdir(args.output)
 
-    BRConfigTest.outputdir = os.path.abspath(args.output)
+        BRConfigTest.outputdir = os.path.abspath(args.output)
 
-    if args.all is False and not args.testname:
-        print("No test selected")
-        print("")
-        parser.print_help()
-        return 1
-
-    BRConfigTest.keepbuilds = args.keep
-
-    if args.testcases != 1:
-        if args.testcases < 1:
-            print("Invalid number of testcases to run simultaneously")
+        if args.all is False and not args.testname:
+            print("No test selected")
             print("")
             parser.print_help()
             return 1
-        # same default BR2_JLEVEL as package/Makefile.in
-        br2_jlevel = 1 + multiprocessing.cpu_count()
-        each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
-        BRConfigTest.jlevel = each_testcase
-
-    if args.jlevel:
-        if args.jlevel < 0:
-            print("Invalid BR2_JLEVEL to use for each testcase")
+
+        BRConfigTest.keepbuilds = args.keep
+
+        if args.testcases != 1:
+            if args.testcases < 1:
+                print("Invalid number of testcases to run simultaneously")
+                print("")
+                parser.print_help()
+                return 1
+            # same default BR2_JLEVEL as package/Makefile.in
+            br2_jlevel = 1 + multiprocessing.cpu_count()
+            each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
+            BRConfigTest.jlevel = each_testcase
+
+        if args.jlevel:
+            if args.jlevel < 0:
+                print("Invalid BR2_JLEVEL to use for each testcase")
+                print("")
+                parser.print_help()
+                return 1
+            # the user can override the auto calculated value
+            BRConfigTest.jlevel = args.jlevel
+
+        if args.timeout_multiplier < 1:
+            print("Invalid multiplier for timeout values")
             print("")
             parser.print_help()
             return 1
-        # the user can override the auto calculated value
-        BRConfigTest.jlevel = args.jlevel
+        BRConfigTest.timeout_multiplier = args.timeout_multiplier
+
+        nose2_args = ["-v",
+                      "-N", str(args.testcases),
+                      "-s", test_dir,
+                      "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
-    if args.timeout_multiplier < 1:
-        print("Invalid multiplier for timeout values")
-        print("")
-        parser.print_help()
-        return 1
-    BRConfigTest.timeout_multiplier = args.timeout_multiplier
+        if args.testname:
+            nose2_args += args.testname
 
-    nose2_args = ["-v",
-                  "-N", str(args.testcases),
-                  "-s", test_dir,
-                  "-c", os.path.join(test_dir, "conf/unittest.cfg")]
+        nose2.discover(argv=nose2_args)
 
-    if args.testname:
-        nose2_args += args.testname
+    finally:
+        if temp_dir:
+            shutil.rmtree(temp_dir.name)
 
-    nose2.discover(argv=nose2_args)
 
 
 if __name__ == "__main__":
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
