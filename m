Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F979C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2CA847C4;
	Thu, 10 Mar 2022 22:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCjG8aRDYNC3; Thu, 10 Mar 2022 22:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0BEB847C1;
	Thu, 10 Mar 2022 22:31:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 028A21BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E476E61287
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKlCNmBWhxCL for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4200761283
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9188883C6F; Thu, 10 Mar 2022 22:22:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 23:29:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6f32a2440eb6fa417ba28c0237cd3e2b37126633
X-Git-Newrev: f1db1922e460d4f5862be16ef2b3f0c84c3201ce
X-Patchwork-Hint: ignore
Message-Id: <20220310222247.9188883C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-twisted:
 Needs python 3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1db1922e460d4f5862be16ef2b3f0c84c3201ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

From the twisted-21.2.0 release notes:

Deprecations and Removals

 - Support for Python 2.7 has been removed.  Twisted now supports only
   Python versions 3.5/3.6/3.7.

https://github.com/twisted/twisted/releases/tag/twisted-21.2.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-twisted/Config.in                     | 1 +
 support/testing/tests/package/test_python_twisted.py | 9 ---------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 8a8717ff9c..5ad936f6c9 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index a458ee45dd..e87312db13 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -21,15 +21,6 @@ class TestPythonTwisted(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Twisted(TestPythonTwisted):
-    __test__ = True
-    config = TestPythonTwisted.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
-
 class TestPythonPy3Twisted(TestPythonTwisted):
     __test__ = True
     config = TestPythonTwisted.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
