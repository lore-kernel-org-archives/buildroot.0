Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB50C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA346FACF;
	Fri, 28 Feb 2025 16:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LewpS57NkFT; Fri, 28 Feb 2025 16:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A767C6FBD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A767C6FBD4;
	Fri, 28 Feb 2025 16:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06AB91DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E5D4263D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqoygmtOt3Jg for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E04D419E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E04D419E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16BD086612; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 14:09:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cdcb3f56e8d5b5f51cd12721feaf8679953547b1
X-Git-Newrev: 35f381b93e52895179569876b23a509c9a7e0225
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.16BD086612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/get-developers: use
 parser.error() rather than canned print+return
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35f381b93e52895179569876b23a509c9a7e0225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

parser.error() reports a nice error message, that also displays a short
reminder of the available options.

Adapt the test-suite accordingly: previously, the error string was an
exact string in the stdout list, while it now is a substring in one of
the strings in stderr. The exit code changes, too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/utils/test_get_developers.py | 12 ++++++------
 utils/get-developers                               |  6 ++----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index ffc01f6ce7..3ec4edeadd 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -41,9 +41,9 @@ class TestGetDevelopers(unittest.TestCase):
         # no args, with syntax error in the file
         developers = b'text3\n'
         out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("No action specified", out)
-        self.assertEqual(rc, 0)
-        self.assertEqual(len(err), 0)
+        self.assertIn("No action specified", "\n".join(err))
+        self.assertEqual(rc, 2)
+        self.assertEqual(len(out), 0)
 
         # -v generating error, called from the main dir
         developers = b'text1\n'
@@ -150,9 +150,9 @@ class TestGetDevelopers(unittest.TestCase):
         # no args, with syntax error in the file
         developers = b'text3\n'
         out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("No action specified", out)
-        self.assertEqual(rc, 0)
-        self.assertEqual(len(err), 0)
+        self.assertIn("No action specified", "\n".join(err))
+        self.assertEqual(rc, 2)
+        self.assertEqual(len(out), 0)
 
         # patchfile from topdir and from elsewhere
         abs_path = infra.filepath("tests/utils/test_get_developers/")
diff --git a/utils/get-developers b/utils/get-developers
index 33980366d6..8e5796beaf 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -40,11 +40,9 @@ def __main__():
     if len(args.patches) != 0:
         action += 1
     if action > 1:
-        print("Cannot do more than one action")
-        return
+        parser.error("Cannot do more than one action")
     if action == 0:
-        print("No action specified")
-        return
+        parser.error("No action specified")
 
     devs = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
