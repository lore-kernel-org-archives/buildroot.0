Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251C4C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D072941A46;
	Mon,  5 Feb 2024 15:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D072941A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEdsHp9MLAFV; Mon,  5 Feb 2024 15:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315D341A5F;
	Mon,  5 Feb 2024 15:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315D341A5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4F01BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8413940AA4
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8413940AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5nZcq4gv-k9 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:06:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A80E40A49
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A80E40A49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657C086CFF; Mon,  5 Feb 2024 15:06:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:06:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8366622fc8eba8187240a0141147326e99a4f932
X-Git-Newrev: 8f7e112ab20265e9005b9b97c6a129d6bec66f12
X-Patchwork-Hint: ignore
Message-Id: <20240205150659.657C086CFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add minimalmodbus runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f7e112ab20265e9005b9b97c6a129d6bec66f12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
[yann.morin.1998@free.fr: add the comment to explain failure is success]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_python_minimalmodbus.py | 11 +++++++++++
 support/testing/tests/package/test_python_minimalmodbus.py   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/support/testing/tests/package/sample_python_minimalmodbus.py b/support/testing/tests/package/sample_python_minimalmodbus.py
new file mode 100644
index 0000000000..dc5db8d9e2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_minimalmodbus.py
@@ -0,0 +1,11 @@
+import minimalmodbus
+from serial.serialutil import SerialException
+
+# We can't test proper behaviour in emulation, because there is
+# actually no emulated modbus hardware, so we rely on the module
+# to fail in an expected way to consider it is working correctly.
+# Failure (of the script) is success (of the test)!
+try:
+    instrument = minimalmodbus.Instrument('/dev/ttyUSB99', 1)
+except SerialException:
+    pass
diff --git a/support/testing/tests/package/test_python_minimalmodbus.py b/support/testing/tests/package/test_python_minimalmodbus.py
new file mode 100644
index 0000000000..53813406de
--- /dev/null
+++ b/support/testing/tests/package/test_python_minimalmodbus.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Minimalmodbus(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MINIMALMODBUS=y
+        """
+    sample_scripts = ["tests/package/sample_python_minimalmodbus.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
