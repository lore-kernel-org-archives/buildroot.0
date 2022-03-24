Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57497C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC906405AD;
	Thu, 24 Mar 2022 19:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQl1gEgVJs6v; Thu, 24 Mar 2022 19:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C025D40165;
	Thu, 24 Mar 2022 19:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC55D1C115D
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E83D240502
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyhh6pHawGc3 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0000340165
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:48:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 03F2A85BA2; Thu, 24 Mar 2022 19:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 20:36:24 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f9f936b16763c9074434249960337be4c25b501d
X-Git-Newrev: 294b6e050d2aaf164770d05ececc270da845088f
X-Patchwork-Hint: ignore
Message-Id: <20220324193927.03F2A85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-treq: drop
 python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=294b6e050d2aaf164770d05ececc270da845088f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
http://autobuild.buildroot.net/results/94e/94e009e322787bbcaac3704b64218cefe77b0f56/

Treq is built on top of twisted, which is python3 only since commit
f1db1922e460d4f (package/python-twisted: Needs python 3), so propagate the
python3 dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-treq/Config.in                     | 1 +
 support/testing/tests/package/test_python_treq.py | 9 ---------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 23056e72d2..6ca8be8ab7 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	depends on BR2_PACKAGE_PYTHON3 # python-twisted
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index e24ae845be..d7a23829ea 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -12,15 +12,6 @@ class TestPythonTreq(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Treq(TestPythonTreq):
-    __test__ = True
-    config = TestPythonTreq.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TREQ=y
-        """
-
-
 class TestPythonPy3Treq(TestPythonTreq):
     __test__ = True
     config = TestPythonTreq.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
