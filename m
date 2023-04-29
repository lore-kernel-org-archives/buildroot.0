Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DB4C77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3CF484234;
	Sat, 29 Apr 2023 18:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CF484234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRd6lbC9ESpk; Sat, 29 Apr 2023 18:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E2B8422B;
	Sat, 29 Apr 2023 18:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E2B8422B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9431BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13CAF426FE
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CAF426FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKXSQwbbMwpI for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:51:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3EB42707
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12acsn20807.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::807])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD3EB42707
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnb1NwQ97Rn10Z5BaEXKvaGDP9EEZ8bdvaX62U6JfPvxvF/qrprbjMkw8xWh+eOHq6RYuGpSrh3mg8tRfC+16vNAlREmow4gflPCG4jR6MxyNKDBoBqcBrus0Uafftieks6Br63Oxjw5AxHZBV1rf/cdiU16wmYl/NiWnVw1W6jiFwIdZGB19sViEBwitGNgb+O8rZorrzCEEjLHA16y5WOMMEXgCzbJO37g3ADH3bW5vL9WfZatZqNHwipyFS8GW5HQxcYpSvuLNulJnaNINsai2MSTRWD5d81LDr6prmmo9VlqwyRJUx3PN4dRoMAIdyMkWkVLBlzoTjj+UFZ70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyCdrg81useVBqy1gQgSmbfIVdz8F/NSGm+WGGhoYtw=;
 b=Vr/XPRANKKkQNMC6nOKrxjZVvbL4hx7rviKRchGODe+tTabI1Hhqzw4cAhQGoiaJBpk+J0DPvf4sV2ODvMPKYpYkWHXBRFmApux+SZfb2qf/LMANpScaUetEnTn9gdBwhE3UuicDX64CrI+0LyCuDo1Dv/IGnW7bXLIcefhMDSulwZCnY1TKeYrJjq5gSRRgKoXYUgWfqWzWMcdrbHElVLSrqbU8mJnLxYv+eg5j41wpyO+sbHy9Uvrq1IM3h6J2sfHA79xXjQVEFKxEqdUAK8aBsE7q3uOUBnB4WfU1yVXpqzfmqqsJ3dkEg7jMfVSQXeCMD41I0vLqO+tmtAPs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SA1P221MB1067.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Sat, 29 Apr
 2023 18:51:34 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:51:34 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:51:04 -0400
Message-ID: <SN4P221MB068289AD66243971AC49547BA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [Mr6xE3EO1UXp+MS8Xtupfc41Hx+Kikft]
X-ClientProxiedBy: QB1P288CA0029.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::42) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429185104.3666-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SA1P221MB1067:EE_
X-MS-Office365-Filtering-Correlation-Id: 778908c5-e077-4535-d709-08db48e2c0e7
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3kAFe1sr4bV8w/wrs4asbv9nBFsKaKdlYlDKAgpBDN+JS5JItOBdewMwYpF8J88W6q3+0P4o+r4IUONGGCmHdHgdqstGa4IoaDEcoUTaqrlDILz4UunCU1WLjMy6X/2spUG5xNtyeNYzZ/T/NLsxvyQWL/CreGu3BMvtQfRGHb3jwDGTYbpNY3zYHXyvvrBmEdeHHgQ9k5psBxwYpoUv3fIcLxbBhMAnxAfK0omv2+YRTXkZudSO3E0MQ2z/RpZAfvnO8cCWqNYTbe3SNiKLNor4GrEoi/UipG1ZU0dIAC3jlmpwH/Z/qNUjVIxzM5j9eegTBexyoavJwN3v4Tg3R0LkxFjFILGtJlQH7alIvq84xZj2fBS5x0lkQQAUVRSe/cFruiLqtwvv8xrt0WLSaPshIzV0O3wmDtkDPq0OfWo6BBTA+lUjeUE1GKnmWRwxVfLYC866BTdUHXFkD1edjwMfwrjHQg+b7lblXfjk6iGKG+5nTTwFANtuMQ2Cjjzq5jyyt2FwMw1hyeLYzB8Mgj28ITOXa7eu72xIP8qrtSuYlbFDmDqsf6RUZtVEpJs3B7jyv0Tull4qaOMYSwAszIqjzYVMKetWyizVht2uZpg4yVd+/0HkT5QEFP3tPR/g0F10Nx5kTqyCcyWwbz2jbOcE46y5y95ON4FPjqGATLgxdKJwqb6KuXDzPCHjQdW7eBlTabZ5LoucGGK0AAtHNGtB2whv+rhHxCgzz4n9OBurWsnZoMJoauNHobsxdOzzwlu/xNYxkXC5RJLdpg7LVl2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UBv4nxCe2cnI/L2oCHoSoiBzd3D0pkHo5B766K00DFSmv0qdvdJiOGeBcS+RGY1Zp6YGQvuAe46wlM99AcnCj5OeQa7bkx/qm5ICpJD/95sUDkkFqDLMh3n7bW4+lZU3+VvuNiGjxbXTupFVpGiSN3zo5ePcbKRhE3W+KpkLoC59SQCnak5NEcZ10ZU9rBtsrxOD6m9cJW/w5kDQzAZ3aoMQPG0pUJAIU/0Vvl3PrnWsfg9g5V1Mh80fr7+pLZAgv2WdFJOp1R1SfGQnpy1ETwJgF06eR+cit92HACEzxK0Rv6sf+ou8urdObbjHg8d8+OXqEzUZiVp6GyVwrEba6U+mXWeeDbWQKb6xUwl1fYzo2OT7aYTqJr6a+P7Xm1t1nuVPBbMVI3S4YQAWssN0TuF6+GyPtVyS/ET1LUdcCXwoD+/Y8fhZtgn4qpOUSv65E0q4DOwNBF9WeZ9i14fXF7EcTjf7qgWwNU264ne1xrpnWXFCrCG6b7YC2FnLL48OypX+/ihvHbSec7CYtUh8fckqJ9mWhHLFU5D/rkCvSupQ8hYa0qG+b79XIZWTCDEwZIJ2ltsijRLwkhaEwOB6MpxJHoiO5NZLe1LdTVS9fw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqF+KZkkejLBGoxUKSsJZ5KcnQU42l2xt5RErv9NH2IsLWM49M29vCFvPrsx?=
 =?us-ascii?Q?JNSbxtzoWhO+fPjqxVI/qNnjo1V+4GgtjT9E2nvqxu8Tpbzh8Qpx3Db8CXjJ?=
 =?us-ascii?Q?/ToIsMMbZMD3VY2G9I1cHQriH0y3pbo05xsmHLdaiPaJ649hPhq7S/tltZFb?=
 =?us-ascii?Q?SdYNMonya37g2dIIRXAnMvaus53/LiDCb2cqYPdAgCjNdpkSQcOlHiCJgd+p?=
 =?us-ascii?Q?2iACAD8QJ0EyPo2I1P9XNeLcmrvpBPIGbOyPnWr7Vln+SgktzMW64/MU1aDU?=
 =?us-ascii?Q?z5lxVRqg3RQsagXChReyBJ6PMhYCuKF3pXl7mmEwXTz6XJZqan5dja7LL29X?=
 =?us-ascii?Q?WkIZ28mOKdAflB99kUV4KjHDhehWH1n8FqOvt8tfXCJSfV8zG24ArOTgKaPc?=
 =?us-ascii?Q?hoRDTG8psXcQzm9Gs+urD57a7fvqz67bjjbCRE5Eyl0bcPU1A0/XRSU8vIBE?=
 =?us-ascii?Q?3/9KEu1Uy7UEsgdQ3oF6FmRG640qNkGMT++qmu5EI2krkdyFQltPJ8KdZIQ/?=
 =?us-ascii?Q?XFmv+9UZ5k8n/phfIKB9sKP6HeyknbnX4qslUCDBW8ZRLmD+AYN4wV6sdBqu?=
 =?us-ascii?Q?6xswlCFXrh6OzIcG9KV8jDdviKRzuCqIvMWKMcAl8fR+t0XT4697sLzXdgaB?=
 =?us-ascii?Q?zfCH8PYCHtfo/nBSm6l3THbGWksc9TEIrdP9jzcA8HS+HmM/k84dBWq+5GOX?=
 =?us-ascii?Q?v/YLdrs7QqZpm/06TGZw4LfQTbQbp4a/aWVV/IZeHxxKtMByXAY8AtEtUKxV?=
 =?us-ascii?Q?aezHraaa1Dj9cM+XRIBKlCEKJSCOpanX58scb5xob5GHEUxrkx2ri8ci+e/S?=
 =?us-ascii?Q?V9ROw7j2dczAVT+9y4Kc3luzVPV35s5aZT5epKumx9sfSyT4UQFdbws/SKOT?=
 =?us-ascii?Q?7rCEbmDgAvwAO16lSQRnqQ1DfqAjY9XElW/g6EqbyWt3A4xnVrb/F/Fc4ybP?=
 =?us-ascii?Q?y7ATUZ6bAHKwftw+NHTDRKHRADdvU534E4hyNTPxOY57rZkU+bZ9vc0TCtsW?=
 =?us-ascii?Q?5xw/4r4tJ9jx3XnmT8vCw+tFrrPVIr0/9OKf5O+TgBxs3TvVyOxsegGCQP8H?=
 =?us-ascii?Q?AlUBdlFHKpm+qZtBMLYr98j6YXHieXjUWMLZ5gDM1Mo54qq801O4dtkpmdUb?=
 =?us-ascii?Q?k0qcHvQRE0dHmi1JhaXjn8YDpcfUgcb7uDtpVQZYQwHU2Nc6JB7Kdtetj18W?=
 =?us-ascii?Q?iJQCJCCwQjjvfagXyO/mztcVPuCmspLWkLw2O7Yx4abTp+7ugw6WaUZQnDU?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 778908c5-e077-4535-d709-08db48e2c0e7
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:51:34.7912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P221MB1067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyCdrg81useVBqy1gQgSmbfIVdz8F/NSGm+WGGhoYtw=;
 b=pZ0w5ZBrXDVBlK85/P0ItdLHXJt0+p32qWX4eQokvvrS20a5++XKGneiIsTlrEq7KydZBFZoYXfbveenH2/k1w32li1KBXK/Ipm88BesurHMX6kVdZCu+bZV+z+skBBSiCvpawt+yzv/s07SgSX1t8btDgqZGIyb2mV26exQh0KLHN2AgCHbC4YmkHdInkYxAQ7VMvefmqtuOiblV5xIsNrwTy/qHM/AsnCr7hntZVLavYukWZC62yEEFYhSoUe8g8RcrXIJAdxDEa4a0s3X33BoumGCAeKcvpO6K9nHKTyHjqtdLT/xOx8qNvGtPWzSULye+nkXb3iNjCpTo2ntYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=pZ0w5ZBr
Subject: [Buildroot] [PATCH] utils/check-package: improve windows support
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
Cc: James Knight <james.d.knight@live.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following includes a series of tweaks to the check-package script to
provide flexibility when sanity checking files when sources are checked
out in a Windows environment. This includes:

- When populating a list of files to check, ensure POSIX paths are used;
   otherwise, the internal list of files to check will be improperly
   formed and no checks will occur.
- When interpreting an ignore list (which provides POSIX paths of files
   to ignore), resolve the absolute file path for these entries to
   ensure files can be ignored when cycling through a provided file
   list.
- Ignore execute bit checks on Windows since X_OK is only an existence
   check on Windows.
- When running ShellCheck, always ignore SC1017 [1] to avoid line
   ending warnings since Windows environments will typically utilize
   `git config core.autocrlf`.

[1]: https://www.shellcheck.net/wiki/SC1017

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/check-package           | 9 +++++++--
 utils/checkpackagelib/tool.py | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 83b9750f5a9c181dc96dcba508682776a600aac5..817dcb0b7203d28b7d2133ac1d8c27ac8093b3c4 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -5,6 +5,7 @@ import argparse
 import inspect
 import magic
 import os
+import posixpath
 import re
 import sys
 
@@ -50,7 +51,8 @@ def get_ignored_parsers_per_file(intree_only, ignore_filename):
         for line in f.readlines():
             filename, warnings_str = line.split(' ', 1)
             warnings = warnings_str.split()
-            ignored[os.path.join(entry_base_dir, filename)] = warnings
+            entry = os.path.abspath(os.path.join(entry_base_dir, filename))
+            ignored[entry] = warnings
     return ignored
 
 
@@ -275,7 +277,10 @@ def __main__():
     if flags.intree_only:
         # change all paths received to be relative to the base dir
         base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
+        files_to_check = []
+        for f in flags.files:
+            relpath = os.path.relpath(os.path.abspath(f), base_dir)
+            files_to_check.append(relpath.replace(os.sep, posixpath.sep))
         # move current dir so the script find the files
         os.chdir(base_dir)
     else:
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index 907ada704fe4beaa57b1c18e7ce2f17977272257..8b2af64d3899a2e7958f79d61722b1b359351747 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -12,7 +12,7 @@ class NotExecutable(_Tool):
     def run(self):
         if self.ignore():
             return
-        if os.access(self.filename, os.X_OK):
+        if os.access(self.filename, os.X_OK) and os.name != "nt":
             return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
 
 
@@ -32,6 +32,8 @@ class Flake8(_Tool):
 class Shellcheck(_Tool):
     def run(self):
         cmd = ['shellcheck', self.filename]
+        if os.name == "nt":
+            cmd.append("--exclude=SC1017")
         try:
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             stdout = p.communicate()[0]
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
