Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A8CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA8D60ADD;
	Thu, 24 Mar 2022 19:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcJxb_c1Fsrz; Thu, 24 Mar 2022 19:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBBE60A8D;
	Thu, 24 Mar 2022 19:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13FBB1C1162
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF90780B45
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJI5nKP1HCqG for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E218002E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1676385BB9; Thu, 24 Mar 2022 19:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 20:42:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fed11362152e8d302b5895c2a3f5c0cbc187a932
X-Git-Newrev: 7a6448f1aaef2f1da7fa2016b5f473d5e9aeec64
X-Patchwork-Hint: ignore
Message-Id: <20220324193927.1676385BB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-txtorcon:
 drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6448f1aaef2f1da7fa2016b5f473d5e9aeec64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Txtorcon is built on top of twisted, which is python3 only since commit
f1db1922e460d4f (package/python-twisted: Needs python 3), so propagate the
python3 dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/Config.in                     |  1 +
 support/testing/tests/package/test_python_txtorcon.py | 11 -----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index 4f91e7b048..09166a26bb 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
+	depends on BR2_PACKAGE_PYTHON3 # python-twisted
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 1ac2f6919a..8e74190ee1 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Txtorcon(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TXTORCON=y
-        """
-    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
-    timeout = 30
-
-
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
