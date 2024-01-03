Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51379C47074
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0336140192;
	Wed,  3 Jan 2024 00:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0336140192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd3n8OGrz1E2; Wed,  3 Jan 2024 00:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C108C40ABE;
	Wed,  3 Jan 2024 00:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C108C40ABE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C97A1BF977
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7908640192
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7908640192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y78QsCbb6ve6 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:28:32 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::703])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F36E40A5F
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F36E40A5F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2sCmH173HgJYSJ2H4Hpr12oeL4dl8I7o0pbaBHLCtPv6+59O6amgUKriwpUp4Iaz+RvdnBg8hkVP5g2521lG/3nPl+W9OsM0DZuIa5uwVOH6ikQaxmBKuwEloYfoUNQe7Ypyd9HCgQFQTjrv5QJiLziyAA/jj26oSosGKXvkyb/nWBRSroW3W6RcXYDmuT5EUcqznk0MXNc/mpYao/64kroIYucnhhjz+qesd78sHQWgm5WFWxbkGWKgKBCx5sQLlPrCNWNREDjNzteunfhHypF9ybkSc2m1uNQSa5FuGy/1xvIgkESrqgsOM0WGVvarrawWMvTe3BpRKsTwav7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGusdwREcp1bt2jxvKr1yNTenEmU/MBZm2EwDBjQAdU=;
 b=S6SHQTMnt4HYH2Qz6opLLOa2Jk+ui1esoutgY2WIueI9BZIM1X5OsDNMPFeRY1RDy2UKjbKxh+NWXLaTNini0SKjbRn/9w5dAtmUL2pYFmNE9YAOCOLnzo190TYCnFyA8hAFODIQhJS8QxOzwQ2zRTZunwVG4/Dnvq2Amewck7WSDgGI0mrLPQ5LJgzzV6+Pb16KKJRhBoZDNT8kIe8VJRZ9zTro0HAnJuVQEJhs2DfO7d8c8EJvLr6jZMbdSz4RmjYwxObwZ3c2js0pHUU8iIAPAPacpdqyogmIojj7KEhUD5vzMyQT51GoJ19XGKDCmXS4pUVyo+UKGjoSB7sP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6346.namprd10.prod.outlook.com (2603:10b6:303:1ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 00:28:25 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3%6]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 00:28:25 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:28:08 -0600
Message-Id: <20240103002810.1055951-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103002810.1055951-1-colin.foster@in-advantage.com>
References: <20240103002810.1055951-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: CH0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:610:e5::8) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ef9727-770e-44a5-3c17-08dc0bf2e614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJ3wd8ivDyHFbKBVH3nzRJ8Zd2MrasyI1PwshUWcrmWi06anI51HxbWvLTmjji+KwU50LVF45AzZ5i+mbb5vJwXeBpqbnhru5V54JLm9dkfH0QpibGsfzLZoextxqXY0H22Sa30EHdV8av6l564jMgFOHT+c/UvO4aynnZZ3cPspBH27l0movm2k1IOjEQHHa0/7qeTYmuZetyXc4PhwQACIIf4LSUV9pVil2IIEn4odl/PbOIYvsbWfOk1cekiH2+g/if3XTU3HlMiLtmeCDwMUau5BkO6+AcuKZNKyxv2ecHQbj9jle8ehZIqqyIvFYwTiJm6CQ89+wkm5H+ZTesfwmj6eQBuXiL9bE/viMENlb4sNAl/4XwAgh4QK2UoZElmdW/7FLZbCKF+Ru9MnCHKmmvs8ieVtZurUmU2/b+mKIWk9uzrDobj4szXNAraKeEkPiffKRmGraQSBQsJPo6v/RGAXyXxj8VJS6D7q8EQW8fQzIo6vXK97UgcwFz/ZM5dwgqOqHqCS7DM00PF//N1Lom1TUby4sPt6C94EtWxXeUHTNUhjTEocinxwUHiuZ13CLjngDNPj1njqx8/5/zHsciUaIGOJxNNJ2v1iEdPSTj9l9O92gjlDSloeFpGjguaq833/hLb1CQqMbyvoVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(346002)(136003)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(4326008)(2906002)(8676002)(8936002)(316002)(6916009)(66476007)(66556008)(66946007)(52116002)(54906003)(2616005)(44832011)(6512007)(26005)(1076003)(83380400001)(41300700001)(38100700002)(36756003)(86362001)(6506007)(6666004)(478600001)(6486002)(38350700005)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9hJCPJnalmTQLHZCBGFR2G3Rxd62mRUb/P3k+9GhwzEAsNBj4Z1g8GbcafWY?=
 =?us-ascii?Q?hhIhuaGGKhN5net7nnbp7EHP6dqg+Nki7OlKeLGUlhdJDlGlLoOL4Ba1mjy2?=
 =?us-ascii?Q?PVbEvMJ0eNfUQM4HwsgllmdkbFABiqz1wa+QNg4k5lxpVhTtovN9t9YDOkO5?=
 =?us-ascii?Q?hXso/rxuh5WR+TAH+Db2Fi5/ORaHoJvG09LOAkZGltSYsXKMUWCeRDaGI7Y/?=
 =?us-ascii?Q?kgGZpVNlZVA4wZzxpS8pCXE/WU9iSWlCXoWquV3kySv9Rmo58/CidyMRtgRD?=
 =?us-ascii?Q?ZBSkyrRVt5cuwNndQ6ov0jVN78m2CMiDgDr9H45dM93KT7jyJukGHvjRPifn?=
 =?us-ascii?Q?wfYbi08v7tMYmXRIyb6Xd0M16yZiN6K+euj3UmpKF4CCsN98XTcM35uuc9H/?=
 =?us-ascii?Q?osvpCQCfIsEUgjQ9mhN9eE5p2Ll7nrisMwgTmJsZSjrsxn/Ixw++5GO76vY/?=
 =?us-ascii?Q?zq8+9lEOpYwfSqi/HaqurlH97n91Z1UDNuSnrATYlkMqUbbeQKAnHToJd6g9?=
 =?us-ascii?Q?PumY0kzGd9RgB/PtK4C/zzyCygbifpT8SnWeVh8TCvf2voQRkEP9rsoy/HDT?=
 =?us-ascii?Q?8nrUykAjDy2bJ8On1rsDVaTisAz8YrPhg6eO2pLuIrzaG2c0A4DhnxUermlI?=
 =?us-ascii?Q?MD0I52LZBas1bQ/VxLQDCz327uGZ9IPjVCp7lRwdVACaAE+/x37Xescmif4L?=
 =?us-ascii?Q?PSWrJ4FaxK+d7uTng77qjUIekh7kkAp0LRoLPQrPh8/L/2tNhTtLgFK6eqh/?=
 =?us-ascii?Q?Nc1a9Q9Rd8DTy8t7zulQhGj1L9TtEu/mo5iT929S2/vfwPMmzWG5c32Hbcz3?=
 =?us-ascii?Q?7U3xZVs3THvRcEht9DNxriE917mZw5WOpEOgz96Bi+zXXW1U5cpk2OYuN1GL?=
 =?us-ascii?Q?a8k3BX6sgXPu2qxmFZi7+PG7h7aDzxUUD2nZ0P9bZWVhD/rnnWB/oYinNbG+?=
 =?us-ascii?Q?c3vbfYP06sAA3RGMobggBgXGClSnQLXYcOoQWQ6jRo84z771wClg2uWwPUxm?=
 =?us-ascii?Q?xwGBDb0tOSK/d8XpZ2IJp4ESyfan0PqPIQ7kCDRU0DPPF3d0GozZsOuRTzJi?=
 =?us-ascii?Q?bepoV1ZsUJ09cFhXbcux9ziB9+Js4KSEpPHk6EZIQA05nhgVCAt+fxW9zEUH?=
 =?us-ascii?Q?26slEA8IOi8gzbNkj2+swfvPn8r4bczGsZf+D41y1OoorEbK3VRPiqwKM1HL?=
 =?us-ascii?Q?VgP6KptQRy7HqWQte0apa5PzwJ042rjfUUNPGpOcr4IEv9TUyY1NvlSjzbJC?=
 =?us-ascii?Q?CgoRIz1y63jaiNSIAeb5fGmrNcs/jlkFspVKFwSB92/SbLseZOARcIg8A9MJ?=
 =?us-ascii?Q?/8WBHb84Olne4MWsADwuPhEf3hXvUdJs2YKNjp/c6x2OxqfY7DVnJdKVJFYD?=
 =?us-ascii?Q?hDebD/ChufrRYnAb4g5HBq9WuxixnkevJ9bA1WZ8pjtzn7d3JKpJ5QlnUvQZ?=
 =?us-ascii?Q?ZHJ0dMOHbhaPAgzHMAQ3Q7XM2YPEi6rYjYqnD7txiJwVQLTp9DKw5lrdjNG+?=
 =?us-ascii?Q?ysbLKAeMO9YVc31eepDaYFSsox6Ndqz0Gn6+HohbsKZdycOzDGiNt3xclRNd?=
 =?us-ascii?Q?HlkzqBpO83I/y+Q1qnT6aql4eYg5zecWEoLKgiTLMT2uxy7PM96IjkUTmFUf?=
 =?us-ascii?Q?yV7iA0LODRZ51fs7Eiy46GM=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ef9727-770e-44a5-3c17-08dc0bf2e614
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 00:28:25.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1f661olnGZsypjtwu/Vap/FR96imA7FZL0yv1/T6FEq/rqn5pV7oRWMtMGCLxmm7Ug1Zs3RJ2XiRyybO3sq75UgDPASYikWU3r6nCM6bLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGusdwREcp1bt2jxvKr1yNTenEmU/MBZm2EwDBjQAdU=;
 b=bWUC4Rbga7TSz86GI/qEAbdD4/5THGagXeCGJvuKihB6ufI9BCjmbeCInkdMOacm1SDBJZOtXwDPTVzNu/YpXb8hV7JJj4kbWsdt/zT+huKcW4670dSi6EUZDjKTATL2Fll7qjO3CZ6ILO3sq4iTpUeM1/xtQ1gG9z6JG+4B2iI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=bWUC4Rbg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v2 1/3] support/testing/run-tests: add try block
 for indentation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cleanup code for try/finally is necessary for a separate patch. Utilize
a separate patch to add a try block so that the other patches that
actually will change the behavior are much more reviewable.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---

v2: New patch, broken out for reviewability

---
 support/testing/run-tests | 146 ++++++++++++++++++++------------------
 1 file changed, 75 insertions(+), 71 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 485811b746..9d1174cb3b 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -42,94 +42,98 @@ def main():
     script_path = os.path.realpath(__file__)
     test_dir = os.path.dirname(script_path)
 
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
-
-    if args.timeout_multiplier < 1:
-        print("Invalid multiplier for timeout values")
-        print("")
-        parser.print_help()
-        return 1
-    BRConfigTest.timeout_multiplier = args.timeout_multiplier
+        BRConfigTest.timeout_multiplier = args.timeout_multiplier
 
-    nose2_args = ["-v",
-                  "-N", str(args.testcases),
-                  "-s", test_dir,
-                  "-c", os.path.join(test_dir, "conf/unittest.cfg")]
+        nose2_args = ["-v",
+                      "-N", str(args.testcases),
+                      "-s", test_dir,
+                      "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
-    if args.testname:
-        nose2_args += args.testname
+        if args.testname:
+            nose2_args += args.testname
 
-    nose2.discover(argv=nose2_args)
+        nose2.discover(argv=nose2_args)
 
+    finally:
+        # Placeholder for try, to be undone shortly
+        pass
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
