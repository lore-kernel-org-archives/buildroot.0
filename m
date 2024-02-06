Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD399C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD42B822B7;
	Tue,  6 Feb 2024 12:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLhpYrV3qrQ1; Tue,  6 Feb 2024 12:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E716822D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E716822D0;
	Tue,  6 Feb 2024 12:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7B31BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46BAC60AEB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BAC60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKaEazi4gPNy for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 567FB60B32
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 567FB60B32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 440A986FD2; Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 13:31:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ab334817a1b7ccbc139f0d64ac04c6d7b0ba48a
X-Git-Newrev: 4e5a25a1120bd0caa28d5faa48017c96546cfc78
X-Patchwork-Hint: ignore
Message-Id: <20240206124011.440A986FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add fastapi runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e5a25a1120bd0caa28d5faa48017c96546cfc78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a runtime test for fastapi. Use uvicorn as the asgi server
application as does the fastapi hello world example [1].

Fastapi depends on PydanticV2 now which is written in rust so we need to
run the test on armv7.

[1] https://fastapi.tiangolo.com/tutorial/first-steps/

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
[Arnout:
 - fix flake8 errors
support/testing/tests/package/sample_python_fastapi.py:5:1: E302 expected 2 blank lines, found 1
support/testing/tests/package/sample_python_fastapi.py:8:1: W391 blank line at end of file
 - Remove BR2_CCACHE (as requested by Marcus).
 - Add a comment explaining that this also tests uvicorn and pydantic.
 - Re-try wget in a loop instead of a fixed timeout of 30 seconds.
 - Add a DEVELOPERS entry.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  4 ++
 .../testing/tests/package/sample_python_fastapi.py |  8 +++
 .../testing/tests/package/test_python_fastapi.py   | 57 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c18ae46054..7a943d1762 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2064,6 +2064,10 @@ F:	package/selinux-python/
 F:	utils/config
 F:	utils/diffconfig
 
+N:	Marcus Hoffmann <bubu@bubu1.eu>
+F:	support/testing/tests/package/test_python_fastapi.py
+F:	support/testing/tests/package/sample_python_fastapi.py
+
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
 F:	package/polkit/
diff --git a/support/testing/tests/package/sample_python_fastapi.py b/support/testing/tests/package/sample_python_fastapi.py
new file mode 100644
index 0000000000..ee60be1f96
--- /dev/null
+++ b/support/testing/tests/package/sample_python_fastapi.py
@@ -0,0 +1,8 @@
+from fastapi import FastAPI
+
+app = FastAPI()
+
+
+@app.get("/")
+async def root():
+    return {"message": "Hello World"}
diff --git a/support/testing/tests/package/test_python_fastapi.py b/support/testing/tests/package/test_python_fastapi.py
new file mode 100644
index 0000000000..85cdd0b65a
--- /dev/null
+++ b/support/testing/tests/package/test_python_fastapi.py
@@ -0,0 +1,57 @@
+import os
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Fastapi(TestPythonPackageBase):
+    """Test fastapi, uvicorn and pydantic2.
+
+    fastapi needs an asgi server to run. Since we select uvicorn as
+    asgi server here, uvicorn is tested as well.
+
+    pydantic is an major dependency of fastapi so it is implicitly
+    tested here as well.
+    """
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FASTAPI=y
+        BR2_PACKAGE_PYTHON_UVICORN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_fastapi.py"]
+    timeout = 60
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = "uvicorn sample_python_fastapi:app > /dev/null 2>&1 &"
+
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give enough time for the uvicorn server to start up
+        for attempt in range(30):
+            time.sleep(1)
+
+            cmd = "wget -q -O - http://127.0.0.1:8000/"
+            output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            if exit_code == 0:
+                self.assertEqual(output[0], '{"message":"Hello World"}')
+                break
+        else:
+            self.assertTrue(False, "Timeout while waiting for fastapi server")
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
