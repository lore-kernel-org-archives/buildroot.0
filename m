Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A9C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1ED6FB88;
	Tue, 21 Feb 2023 01:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1ED6FB88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOJgn8YgvLFp; Tue, 21 Feb 2023 01:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A1B6FB0C;
	Tue, 21 Feb 2023 01:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24A1B6FB0C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD721BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A3D16FC20
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3D16FC20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZctAtoikbnP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F3EF6FC1E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3EF6FC1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B38381979; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 09:24:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ee1dd85a34b6228c634a66450deefadbb2c9b50
X-Git-Newrev: de03312db0190adc5b7dfa5b7658b2275801c933
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.2B38381979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/get-developers: print
 error for correct line
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

commit: https://git.buildroot.net/buildroot/commit/?id=de03312db0190adc5b7dfa5b7658b2275801c933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Start counting the line numbers in 1 instead of 0, in case an error
must be printed.

Both the error about a developer entry with no file entry and the error
about a file entry with no developer entry actually belong to the
non-empty line previous the one being analysed, so in these cases print
the line number from the line before.

Also count empty and comment lines, so a developer fixing the file can
jump to the correct line (or the nearest one).

At same time standardize the messages, printing the line number
also in the case of a warning for a file that is not in the tree
anymore.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/utils/test_get_developers.py | 16 ++++++++--------
 utils/getdeveloperlib.py                           |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 0b313c7c59..ffc01f6ce7 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -48,7 +48,7 @@ class TestGetDevelopers(unittest.TestCase):
         # -v generating error, called from the main dir
         developers = b'text1\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-v"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text1'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -56,7 +56,7 @@ class TestGetDevelopers(unittest.TestCase):
         # -v generating error, called from path
         developers = b'text2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text2'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -69,7 +69,7 @@ class TestGetDevelopers(unittest.TestCase):
                      b'N:\tAuthor2 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 4", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -83,7 +83,7 @@ class TestGetDevelopers(unittest.TestCase):
                      b'N:\tAuthor3 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 4", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -108,8 +108,8 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file, line 2", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file, line 3", err)
         self.assertEqual(rc, 0)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
@@ -119,8 +119,8 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file, line 2", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file, line 3", err)
         self.assertEqual(rc, 0)
         self.assertGreater(len(out), 1000)
         self.assertEqual(len(err), 2)
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index dbd21af443..e7d0d23e49 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -236,12 +236,13 @@ def parse_developers(filename=None):
         files = []
         name = None
         for line in f:
+            linen += 1
             line = line.strip()
             if line.startswith("#"):
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
-                    print("Syntax error in DEVELOPERS file, line %d" % linen,
+                    print("Syntax error in DEVELOPERS file, line %d" % (linen - 1),
                           file=sys.stderr)
                     return None
                 name = line[2:].strip()
@@ -249,7 +250,7 @@ def parse_developers(filename=None):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
-                    print("WARNING: '%s' doesn't match any file" % fname,
+                    print("WARNING: '%s' doesn't match any file, line %d" % (fname, linen),
                           file=sys.stderr)
                 for f in dev_files:
                     dev_file = os.path.relpath(f, brpath)
@@ -267,7 +268,6 @@ def parse_developers(filename=None):
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
                       file=sys.stderr)
                 return None
-            linen += 1
     # handle last developer
     if name is not None:
         developers.append(Developer(name, files))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
