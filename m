Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9DDC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F298D60596;
	Mon,  1 Aug 2022 21:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F298D60596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecvSv3p5PB-T; Mon,  1 Aug 2022 21:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 029A5605C9;
	Mon,  1 Aug 2022 21:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 029A5605C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2203C1BF319
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09CD402F8
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09CD402F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6r8xbvs5rJP for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:04:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C953E402ED
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C953E402ED
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7034186C50; Mon,  1 Aug 2022 20:50:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:57:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bbf5cb7cf0769e4ffb83de29d406a37623edee2
X-Git-Newrev: 32e9f1813c4bd90783dd3f36e5a1ebd35daf5f45
X-Patchwork-Hint: ignore
Message-Id: <20220801205048.7034186C50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests: improve
 get-developers test
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

commit: https://git.buildroot.net/buildroot/commit/?id=32e9f1813c4bd90783dd3f36e5a1ebd35daf5f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the test into a characterization test for all warnings and errors
get-developers can return when parsing the DEVELOPERS files.

It will be helpful when changing the behavior of get-developers to bail
out on all syntax checking warnings.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/utils/test_get_developers.py | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index e4420bc6dc..12710fe8d3 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -51,6 +51,7 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
 
         # -v generating error, called from path
         developers = b'text2\n'
@@ -58,6 +59,61 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
+
+        # -v generating error for file entry with no developer entry
+        developers = b'# comment\n' \
+                     b'\n' \
+                     b'F:\tutils/get-developers\n' \
+                     b'\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
+
+        # -v generating error for developer entry with no file entries
+        developers = b'# comment\n' \
+                     b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor1 <email>\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'N:\tAuthor3 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 2)
+
+        # -v not generating error for developer entry with empty list of file entries
+        developers = b'# comment\n' \
+                     b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor1 <email>\n' \
+                     b'\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'\n' \
+                     b'N:\tAuthor3 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 0)
+
+        # -v generating warning for old file entry
+        developers = b'N:\tAuthor <email>\n' \
+                     b'F:\tpath/that/does/not/exists/1\n' \
+                     b'F:\tpath/that/does/not/exists/2\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 2)
 
         # -c generating warning and printing lots of files with no developer
         developers = b'N:\tAuthor <email>\n' \
@@ -68,6 +124,17 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
         self.assertEqual(rc, 0)
         self.assertGreater(len(out), 1000)
+        self.assertEqual(len(err), 2)
+
+        # -c printing lots of files with no developer
+        developers = b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertEqual(rc, 0)
+        self.assertGreater(len(out), 1000)
+        self.assertEqual(len(err), 0)
 
         # -p lists more than one developer
         developers = b'N:\tdev1\n' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
