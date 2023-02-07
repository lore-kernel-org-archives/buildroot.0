Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA90C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683DA6FC29;
	Tue, 21 Feb 2023 01:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683DA6FC29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpjLFZMtLwi6; Tue, 21 Feb 2023 01:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EEEF7009E;
	Tue, 21 Feb 2023 01:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EEEF7009E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99A8F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B096FE5E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B096FE5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEe_0BPjE3-P for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2232A6FC2A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2232A6FC2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20CF4828C8; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 09:24:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce3d349384f4d80ed8fc50a82ff864bd5bcf6375
X-Git-Newrev: 5ee1dd85a34b6228c634a66450deefadbb2c9b50
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.20CF4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/get-developers: bail out
 on parsing errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ee1dd85a34b6228c634a66450deefadbb2c9b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently 4 types of parsing errors/warnings can be found:
- entry for a file that is not in the tree anymore (warning)
- developer entry with no file entry (error)
- file entry with no developer (error)
- entry that is not a developer, a file or a comment (hard error)

Currently only the last one ends the script with -v with error code.

Make all 3 error types into hard errors and bail out at the first error
found, because the rest of the state machine is not designed to handle
malformed input.
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/utils/test_get_developers.py | 9 ++++-----
 utils/getdeveloperlib.py                           | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 12710fe8d3..0b313c7c59 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -70,11 +70,11 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
 
-        # -v generating error for developer entry with no file entries
+        # -v generating error for developer entry with no file entries, stopping on first error
         developers = b'# comment\n' \
                      b'# comment\n' \
                      b'\n' \
@@ -84,10 +84,9 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
-        self.assertEqual(len(err), 2)
+        self.assertEqual(len(err), 1)
 
         # -v not generating error for developer entry with empty list of file entries
         developers = b'# comment\n' \
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2a8d5c213c..dbd21af443 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -243,6 +243,7 @@ def parse_developers(filename=None):
                 if name is not None or len(files) != 0:
                     print("Syntax error in DEVELOPERS file, line %d" % linen,
                           file=sys.stderr)
+                    return None
                 name = line[2:].strip()
             elif line.startswith("F:"):
                 fname = line[2:].strip()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
