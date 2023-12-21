Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6088AC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 19:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3DB340164;
	Thu, 21 Dec 2023 19:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DB340164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6SYxBCugqt3; Thu, 21 Dec 2023 19:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE3C4381F;
	Thu, 21 Dec 2023 19:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE3C4381F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B91251BF83C
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 19:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9114083CF9
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 19:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9114083CF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GySqsepevj_z for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 19:08:14 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::700])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3115E83CEE
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 19:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3115E83CEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN57spoP6RJyDLNoiJfLcEoCkUHzbyDGYNASko7kkLzlw1YRmxyaZmSgcL6u8e9JSoiW7l7CxEkpiqfvjxYGsqXcCM4Ad+uZttbpLxRKKMB7GyxY6iPXi8+gayc/ss0PYUBkyZtZlH2+d+BKiZN7fDTqXhR2m3Mc5su2VAO7bCx2ZM0l0TkLXnUEPPnnBCBDsHQA7dSshwQQvXcmdfikNo7dAGwNKqX/VMjENiqVz4+AktxD9mxxK2Q7DmgWWtQLLLn7S7/7FzL9emZ3ba/D2llt7bjOd9/mbMF0vsfYCtlWlxDc9yho3pFm9o1VwcCQ34Pk8KtE2jg+uNmkMQ2LoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAew1ugFIYPFUqfl6J5SpBMJBAlfABhdd+fFk5aV95U=;
 b=gbiiU6+dmPeOP0HWEV8BA70FQWhDLfL+sYOf4nIf67BAkBLdWpQ+o1qV6J5XWH9sBgRs3Duz0EDqeCGm2iZtkqk4ZxvbJxQcCUTReHpZ0WOubBPaZoJe8sJ0JbL7Ggx+bWRDeWPIAFKWMlmBmtAEyR/K1gbKv7T25c5kAkl8xuDEgw/FjDNA0/+pnUVnHn58I1LbrFna9cY+QbgN58Tr6kJVU7pwDsL5qiCS/YbUcvVwLZ5Vms+WzDMJz1anQ4jpMeHbF9825+5fWZ/EBy8dlvbuGcCB2B7ey1J07GlXi/EmWVSpxy18sX3IZJeMPuXo/8FCsbwVjL0BIvrNkBefNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by SA1PR10MB7682.namprd10.prod.outlook.com (2603:10b6:806:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 19:08:09 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.7091.034; Thu, 21 Dec 2023
 19:08:09 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 13:08:00 -0600
Message-Id: <20231221190800.2669237-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::24) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|SA1PR10MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 05045337-a125-43f1-f865-08dc02582b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cr7IuhQELwMFQ6oeyVlSm1D3+qhvgqbzbDoB5QVLcYWMqocRhwjL7f76d8fF1qm1ty8T+ukdFAivV47D5NSsKNCICQm55EZk5SujgwFuxQ0FucJkK+HiJlsFI2CcLJDi2vSzIJDsVtdBpUK8VrKSmt3PyTX7h+zuH9QYesMuG39RQPaMCPZJcuualNMTIsb+ZT3Gi1oblp4tUG23lhyBbq8KZYamORYbZj5J6qN8zAPWZXvYU+/kKBo5byyAP6d7P+jQpVVjdRZ/w+J+ZmjsmI4hXK62SToBDxgdpFHMyyeMhDooxg5V3aLektjFmvppXdgw7k0RYcVpO3maxCroIR2vM6nK5H6rfNstzvcZtTw1u3No8d9Tda27nns6folIaAAL7FRcFuVQ1du0mc+04NQzgYGDWpzvPRD4HFI464XDjmTBhb6mJFZY3njTV7YzbBnhCnZuqvytiFAVYOwFcyXWUZ3AXldWWuu+I2rnjMP3MKx4BF2aD1mbWQCZHOOEhr3ogHuaVxGETqem43e1ZkBt6NGM5x7b4/QEh7wMaWbGU0m/C6bWvr+fwM1rvY+SiESI8diuGRZn1wxVlBDvaCdxNswJtv32drjwqJ66A+/sb05AB1u2XJXbH2aks2K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39830400003)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(316002)(38350700005)(66476007)(36756003)(66946007)(66556008)(6916009)(8676002)(6512007)(8936002)(38100700002)(6666004)(478600001)(44832011)(2906002)(41300700001)(6486002)(2616005)(52116002)(6506007)(86362001)(26005)(1076003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fqtHODbZyoIDx74QxlOYZtGVpp0+2IcPzeiINimf5J1MK2zZfLDW+EmvLWNd?=
 =?us-ascii?Q?6wL6U2XxBtDOlCVCx6P0z6Du4wzROKjKXL5k2Cs4THIp0FngWahZDLz7+hC7?=
 =?us-ascii?Q?I4qhHG3kjN1nHrF4gQhkhWjRbNyvJeeOJGOUUBW42ijfGqLs3n5Jaz0B7Urp?=
 =?us-ascii?Q?6vZdTUFF1gBrlJrJdnuIDCVmfXPIHRlUz37xQgYp4SHRWA5H2DC9NY7DzHox?=
 =?us-ascii?Q?7NOLGYpC55kTsH/Jyfav9/XZXMvzraKOryTC0cFTAOB2RW23Z/eV17y3rkUP?=
 =?us-ascii?Q?nspsZyrAM3N4u+Z7vhbLr3s064K0jLqEfpL393QCiGovNlROsr+/pMXUOE4W?=
 =?us-ascii?Q?UwuTetig6cBq2Q0XIu3ezCbpTZRCHTxXbd18sdiKcgY4QFseM3gF7R9ZEhZG?=
 =?us-ascii?Q?hnDCIgzvuQFoIkD2HrROvxpI9slxxtVZb2xwpV719L2TVBWH4hEPRtSheFxk?=
 =?us-ascii?Q?MxCPV41RkzhJahUuf2SQdhxAD+dDHF0r44kU2snWzCHbJPZh2czoUK0QX0Iq?=
 =?us-ascii?Q?xJu18kYUWiLStm/brA2Fhspm9chvyEjMrfNjBoMLLo7hBDOL7NvwlxZanp17?=
 =?us-ascii?Q?PnDCoKrETgCYePa2JWrjj5xIL3UkGPxNsEnXd2fA7RxboIjBvnAPmVxDMpcN?=
 =?us-ascii?Q?LKTnrm3uHxLHFUgErs3GbySZqvTY4TyLOYI8cS3c2UIW7xTtxgX9Q+cyU7aB?=
 =?us-ascii?Q?8zEHj183RxTW8AE2gc5f4F4oSzjdWemRucJU+bIcNfIBrVHKWggfOtApwyjM?=
 =?us-ascii?Q?J8FNwANw2M4wdUhteHvHS9UqJPdYF4jPwVKNgsfpYLQ5iKFWD1Tg9Dee7fTR?=
 =?us-ascii?Q?Cfo/u5Sq094hJrcU+FqipNSwSNuqSCA2AyU6s2Ymp4KHZQHt+eej/kWW70MP?=
 =?us-ascii?Q?XbKn/5i/QZvQynbp5egsZ9TD25JaCBErazIxodAqGO29yzEX5OypSt9Z8oc+?=
 =?us-ascii?Q?pHvfZMWiz8+HxW6E070S/QGUYQuQolYP61pw4rFZOjphgjPlTkludKQvyy21?=
 =?us-ascii?Q?sBZgxJWqZV46dRMSOvOoh5DNkL37Xs1HRhQoMnJmcbxhp1kMWb0hpyG63JYV?=
 =?us-ascii?Q?APViAG80rH5VRA7IXwXbKC/ICjHDGbXGnlZAe+AGuYP9Pn3/6sy57m9vQNF4?=
 =?us-ascii?Q?wp6pnUcRZzwygVUW1QlcKBSXnG+/ucRkI5daYBvAsxBdGz5N3h2xN/Habyqw?=
 =?us-ascii?Q?FXJ8RA1YoPOGAZnE6Qr2xqvtlKEHvm8nwAZrgmrLmhJcuLFF9Vs9rWWPnDnR?=
 =?us-ascii?Q?9oTYvI6wD9I1hVZaDCxi9cGqoJj31Vt5xLxrU+sHq8J/HAZezrNIqccalT9W?=
 =?us-ascii?Q?2TA5/PtPBGxGDRUdrgUmBefgU2ieK40eAJuv5HD0ycJho9BvdFzXr9Y/aR+J?=
 =?us-ascii?Q?d/BORjF737zNu+kpS1kSdFyTcuaeS82OqM8kl5sbOFx2fVxcpB2SSjT/t4hq?=
 =?us-ascii?Q?0ssSE/aisscweDBJU6c+7OzSNNPNqkSDG85jTTuVBm0VhSSj71tJy2DH7CmU?=
 =?us-ascii?Q?f2lpuyVD+dHNJBy+L5NYlqqQMBHzZabjFdTnEyhRYiONlDHdbs+oOebZJJN/?=
 =?us-ascii?Q?tGUDQwmrD2cHX36LIRAiR1QTZAnAdf0NqAjJhmP9hAo0yE2lxFGB4AvgzWHU?=
 =?us-ascii?Q?sNG/45zWJACT5NqAhcJoXrE=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05045337-a125-43f1-f865-08dc02582b93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 19:08:09.3362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XupwMSt3UwwUfPfumwpWO9urjg77tFZB+FdqsJJ0RWY/p372G50SDwIs5bP7lsdhLTU2EFhyG1shVQC2V5F+FRmRCixHY9WeLY57rpXxd98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7682
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAew1ugFIYPFUqfl6J5SpBMJBAlfABhdd+fFk5aV95U=;
 b=IaL19CJAL8qzWG6wH+GPn7bZY9IkXs3fYMfpUrdduf92t/pdtc3OAxDvIVkVpO+1GHe8wBdGDOlpgopQxxWbgD25BUcv3rezpI6YhVWaFcQ9WJmXLIce5jXllODISw05Hrt8KCHhuEEg25BXlfK+PGmhdznlzwETpLdoyjvQpAA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=IaL19CJA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH] support/testing: add python-tftpy runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This runtime test verifies the existence of the tftpy module when
selected.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 support/testing/tests/package/sample_python_tftpy.py |  1 +
 support/testing/tests/package/test_python_tftpy.py   | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_tftpy.py
 create mode 100644 support/testing/tests/package/test_python_tftpy.py

diff --git a/support/testing/tests/package/sample_python_tftpy.py b/support/testing/tests/package/sample_python_tftpy.py
new file mode 100644
index 0000000000..ea4d20c9a2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_tftpy.py
@@ -0,0 +1 @@
+import tftpy
diff --git a/support/testing/tests/package/test_python_tftpy.py b/support/testing/tests/package/test_python_tftpy.py
new file mode 100644
index 0000000000..d64f2c29d7
--- /dev/null
+++ b/support/testing/tests/package/test_python_tftpy.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonTftpy(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TFTPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_tftpy.py"]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
