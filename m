Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B8DCE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7E3402BD;
	Sun, 24 Sep 2023 21:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7E3402BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDHGomZzHnP5; Sun, 24 Sep 2023 21:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2964F40017;
	Sun, 24 Sep 2023 21:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2964F40017
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 503A81BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A6C360E5D
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6C360E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtE_E4UJ7Ywq for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67FA560E1D
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67FA560E1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57F6787644; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 22:19:37 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 934e95457d1126d5f8486f0d6089410923835d98
X-Git-Newrev: 2e9bc6e8fb63587e7cc25dfcefe0978b7a82a945
X-Patchwork-Hint: ignore
Message-Id: <20230924212150.57F6787644@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/python-pytest:
 fix dependency on zlib
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
Content-Type: multipart/mixed; boundary="===============3036801517012138473=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3036801517012138473==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e9bc6e8fb63587e7cc25dfcefe0978b7a82a945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

tests.package.test_python_pytest.TestPythonPy3Pytest runtime tests fails
now with following error:

  ======================================================================
  FAIL: test_run (tests.package.test_python_pytest.TestPythonPy3Pytest.test_run)
  ----------------------------------------------------------------------
  Traceback (most recent call last):
    File "/buildroot/support/testing/tests/package/test_python.py", line 137, in test_run
      self.run_sample_scripts()
    File "/buildroot/support/testing/tests/package/test_python_pytest.py", line 18, in run_sample_scripts
      self.assertRunOk(cmd, timeout=self.timeout)
    File "/buildroot/support/testing/infra/basetest.py", line 89, in assertRunOk
      self.assertEqual(
  AssertionError: 1 != 0 :
  Failed to run: python -m pytest sample_python_pytest.py
  output was:
    Traceback (most recent call last):
      File "<frozen runpy>", line 189, in _run_module_as_main
      File "<frozen runpy>", line 148, in _get_module_details
      File "<frozen runpy>", line 112, in _get_module_details
      File "/usr/lib/python3.11/site-packages/pytest/__init__.py", line 5, in <module>
      File "/usr/lib/python3.11/site-packages/_pytest/_code/__init__.py", line 2, in <module>
      File "/usr/lib/python3.11/site-packages/_pytest/_code/code.py", line 36, in <module>
      File "/usr/lib/python3.11/site-packages/pluggy/__init__.py", line 16, in <module>
      File "/usr/lib/python3.11/site-packages/pluggy/_manager.py", line 10, in <module>
      File "/usr/lib/python3.11/importlib/metadata/__init__.py", line 8, in <module>
      File "/usr/lib/python3.11/zipfile.py", line 6, in <module>
    ImportError: libz.so.1: cannot open shared object file: No such file or directory

Fix that by adding BR2_PACKAGE_PYTHON3_ZLIB dependency.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0dc1213565e76d9c68986489ada3c06b928089d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pytest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index 9bbc9ea2d2..c8f9a6eb5b 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
 	select BR2_PACKAGE_PYTHON_PY # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  pytest is a framework that makes building simple and scalable
 	  tests easy. Tests are expressive and readable—no boilerplate

--===============3036801517012138473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3036801517012138473==--
