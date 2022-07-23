Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4740AC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E687C616BB;
	Sat, 23 Jul 2022 14:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E687C616BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u468p6PmXlnW; Sat, 23 Jul 2022 14:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D10606DC;
	Sat, 23 Jul 2022 14:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D10606DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 436FE1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DE7340991
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE7340991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MGgykTvRxHx for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B728409FA
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B728409FA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 047E9844C7; Sat, 23 Jul 2022 14:19:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ed7bca6a05a7878fdb73a973d098a6b64586848
X-Git-Newrev: 7082b0585d5a231a062087d3e44007742b9165d4
X-Patchwork-Hint: ignore
Message-Id: <20220723141950.047E9844C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/get-developers: add -d option for
 custom DEVELOPERS file
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7082b0585d5a231a062087d3e44007742b9165d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the introduction of test cases for the
get-developers script, make it possible to pass a custom DEVELOPERS
file. A normal user of get-developers will most likely never use this,
but the test suite will use it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Thomas: extracted from a larger patch from Ricardo, initially posted
at https://patchwork.ozlabs.org/project/buildroot/patch/20220528014832.289907-1-ricardo.martincoski@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/get-developers     | 4 +++-
 utils/getdeveloperlib.py | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 158867ce3f..9ab5c4503f 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -21,6 +21,8 @@ def parse_args():
                         const=True, help='only list affected developer email addresses')
     parser.add_argument('-v', dest='validate', action='store_const',
                         const=True, help='validate syntax of DEVELOPERS file')
+    parser.add_argument('-d', dest='filename', action='store', default=None,
+                        help='override the default DEVELOPERS file (for debug)')
     return parser.parse_args()
 
 
@@ -48,7 +50,7 @@ def __main__():
         print("No action specified")
         return
 
-    devs = getdeveloperlib.parse_developers()
+    devs = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
         sys.exit(1)
 
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index c05e1f888b..2a8d5c213c 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -225,13 +225,13 @@ def parse_developer_runtime_tests(fnames):
     return runtimes
 
 
-def parse_developers():
+def parse_developers(filename=None):
     """Parse the DEVELOPERS file and return a list of Developer objects."""
     developers = []
     linen = 0
     global unittests
     unittests = list_unittests()
-    developers_fname = os.path.join(brpath, 'DEVELOPERS')
+    developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
     with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
