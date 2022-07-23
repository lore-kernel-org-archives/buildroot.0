Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C3C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C27184BE1;
	Sat, 23 Jul 2022 15:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C27184BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClX1fqwH1sT0; Sat, 23 Jul 2022 15:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B84784BDD;
	Sat, 23 Jul 2022 15:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B84784BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28B011BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED67942421
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED67942421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84CAooQkEyye for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2ED741908
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2ED741908
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C33DA84656; Sat, 23 Jul 2022 15:17:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:23:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caaa56c99f829ec209e04247560413c7e05c0258
X-Git-Newrev: 32fb25423b15cf9fd44d008862d0a6fe1e1d1aa4
X-Patchwork-Hint: ignore
Message-Id: <20220723151746.C33DA84656@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: introduce py-only and
 py-pyc tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=32fb25423b15cf9fd44d008862d0a6fe1e1d1aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our current python3 builds only tests the pyc-only case, so add two new
tests, one for py-only and one for py+pyc. For orthogonality, rename the
current test.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python.py | 32 +++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c4f5d66d59..d6f69a83c7 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -39,7 +39,7 @@ class TestPythonBase(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestPython3(TestPythonBase):
+class TestPython3Pyc(TestPythonBase):
     config = TestPythonBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
@@ -53,6 +53,36 @@ class TestPython3(TestPythonBase):
         self.zlib_test()
 
 
+class TestPython3Py(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PY_ONLY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test("Python 3")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()
+
+
+class TestPython3PyPyc(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PY_PYC=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test("Python 3")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()
+
+
 class TestPythonPackageBase(TestPythonBase):
     """Common class to test a python package.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
