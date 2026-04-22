Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66052F9EDEB
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13291605DC;
	Wed, 22 Apr 2026 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NktunY6T_WDb; Wed, 22 Apr 2026 14:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352BE60C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776868377;
	bh=VsunE+ipsLZEowGZNBOmV9TbZ6nzcdY0h6LOQKcI5sk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=r07nETnOu08UmROnclroghoQcHmfklJImLd8z/+YQZC7h8B6hfFiY/O2Bpx6HI9Zw
	 egKP05cH5d2FHYb4vMyMtId77+CdbkGz3ebgZTSUEL1TJDgf5JAze9KGo9C2LPfMaV
	 Cno7NuI59QDjV86VXHsBEBb4/DDuSR4GyQeTvijZyk1mxFmrVO1+fzQJETDGYxmahm
	 MKB+PHNe+YQKHcNLZLuBC+SKCjxIBqtCv7VGcl90DSiKwH+dJk7BUOvFVHpBFmzx/G
	 lwEjN5tN9QvSv2lfwdCTzSlQk0fES6Q5zCv2xDBS+IstgiKocJ6mAVz5PuNJ+iTF88
	 ZwBrtE+FYWHSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352BE60C2B;
	Wed, 22 Apr 2026 14:32:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E4024D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB596426E5
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 14:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf1AF11UHElY for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 14:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.141;
 helo=smtpout2.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD6BB42676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD6BB42676
Received: from smtpout2.mo534.mail-out.ovh.net
 (smtpout2.mo534.mail-out.ovh.net [51.210.94.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD6BB42676
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 14:32:49 +0000 (UTC)
Received: from director6.derp.mail-out.ovh.net
 (director6.derp.mail-out.ovh.net [51.255.22.22])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4g11sV715Tz5xMj;
 Wed, 22 Apr 2026 14:32:46 +0000 (UTC)
Received: from director6.derp.mail-out.ovh.net
 (director6.derp.mail-out.ovh.net. [127.0.0.1])
 by director6.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Wed, 22 Apr 2026 14:32:46 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.231.30])
 by director6.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4g11sV5PkMz7tpL; Wed, 22 Apr 2026 14:32:46 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.7])
 (Authenticated sender: mooz@blockos.org)
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 33B0E941627; 
 Wed, 22 Apr 2026 14:32:46 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 16:32:17 +0200
Message-ID: <20260422143243.214664-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 15856611340027808674
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFrjFaw/IBtjd1rL8hkx5YJpPWlQhBsL7tuqhExoyWNTIYsxQcMyfVnOe8bY1VppSCHnJrz3V2e6wQEKnUTA8Xkwh/+WOL/RoFDnarQjlm7TZQ27eimESUKfS3UlYLvqJvbo8+qYvrkodlS6mO11W57+cknnXlIvYdzJqAqjAgh/AfdsOF1SvaV0MhMHcZ0L7q6dYoXN5Lk5yyuWqYuhSD1p0Ql91RATrSGQMRIdIyNoC/aBzYK9d4MjxEvKsOXG92eiNGl5ohRjmnnUApTb6Y/InmOEsk++QrEeXLI63WnXa1arZDB5eMEMAAbbcJb5iszwWS2wymFNytGKoTHxNVxDzomzZZOlAc08nBs0OVa7shjL3BGb1tSViihm962yWNOLAQ3DHuPFg8CCP8Kwr0GyPGvECQRiXlH81oYECq9uEMiYir3GQ/d50K0R/O1KKO14dzJWePqBfzofupcgW2ZTQCCgbWst3P1nTnkiTxHX9zrWRKWkQM8ULTUiid5ACgKkDx9YLJeFg+kFK4x2M5rrCh2RwOQWVXFuDQH1+gPLBpOEDX3gs6LTenanzjIGOmK/Xu+WGtPPkf3UxIzmZPKwxf027C3nMjwEQBAvfnIDSfGJRbUzvDoOkXMYjeri5n+7Ki/AwZP8fXhcR3yDytgzi1pr1nU7b2sv8WMC8Fjtg
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00520313f65-a730-40a6-aac9-ace412c85d99,
 9CEE4CE7D23EE3C4032A23CBFEEA5276D7BBA8CC) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH 1/1] package/python-portalocker: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Cruz <mooz@blockos.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cross-platform file locking library.

https://github.com/wolph/portalocker

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2471767381

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-portalocker/Config.in          |  6 +++
 .../python-portalocker.hash                   |  5 ++
 .../python-portalocker/python-portalocker.mk  | 15 ++++++
 .../package/sample_python_portalocker.py      | 51 +++++++++++++++++++
 .../tests/package/test_python_portalocker.py  | 24 +++++++++
 7 files changed, 103 insertions(+)
 create mode 100644 package/python-portalocker/Config.in
 create mode 100644 package/python-portalocker/python-portalocker.hash
 create mode 100644 package/python-portalocker/python-portalocker.mk
 create mode 100644 support/testing/tests/package/sample_python_portalocker.py
 create mode 100644 support/testing/tests/package/test_python_portalocker.py

diff --git a/DEVELOPERS b/DEVELOPERS
index eba91f10a6..2534140617 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3363,6 +3363,7 @@ N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
 N:	Vincent Cruz <mooz@blockos.org>
+F:	package/python-portalocker/
 F:	package/python-transitions/
 
 N:	Vincent Jardin <vjardin@free.fr>
diff --git a/package/Config.in b/package/Config.in
index d0f148699b..504c84eb43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1281,6 +1281,7 @@ menu "External python modules"
 	source "package/python-platformdirs/Config.in"
 	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
+	source "package/python-portalocker/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
diff --git a/package/python-portalocker/Config.in b/package/python-portalocker/Config.in
new file mode 100644
index 0000000000..6225a659d2
--- /dev/null
+++ b/package/python-portalocker/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PORTALOCKER
+	bool "python-portalocker"
+	help
+	  Cross-platform file locking library.
+
+	  https://github.com/wolph/portalocker
diff --git a/package/python-portalocker/python-portalocker.hash b/package/python-portalocker/python-portalocker.hash
new file mode 100644
index 0000000000..c6be94b8e3
--- /dev/null
+++ b/package/python-portalocker/python-portalocker.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/portalocker/3.2.0/json
+sha256  1f3002956a54a8c3730586c5c77bf18fae4149e07eaf1c29fc3faf4d5a3f89ac  portalocker-3.2.0.tar.gz
+# Locally computed
+sha256  a50570fa3b3102a42d7babb0569238b0b3c0aedce0063c8e4d65060dfd3f7293  portalocker-3.2.0/LICENSE
+sha256  1a6cc9434cfd4a373630949c8807ab6c30f4783ad2024151eea755f0766ecc03  portalocker-3.2.0/PKG-INFO
diff --git a/package/python-portalocker/python-portalocker.mk b/package/python-portalocker/python-portalocker.mk
new file mode 100644
index 0000000000..6e1076334b
--- /dev/null
+++ b/package/python-portalocker/python-portalocker.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-portalocker
+#
+################################################################################
+
+PYTHON_PORTALOCKER_VERSION = 3.2.0
+PYTHON_PORTALOCKER_SOURCE = portalocker-$(PYTHON_PORTALOCKER_VERSION).tar.gz
+PYTHON_PORTALOCKER_SITE = https://files.pythonhosted.org/packages/source/p/portalocker
+PYTHON_PORTALOCKER_SETUP_TYPE = setuptools
+PYTHON_PORTALOCKER_LICENSE = BSD-3-Clause
+PYTHON_PORTALOCKER_LICENSE_FILES = LICENSE
+PYTHON_PORTALOCKER_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_portalocker.py b/support/testing/tests/package/sample_python_portalocker.py
new file mode 100644
index 0000000000..f5268a8fe0
--- /dev/null
+++ b/support/testing/tests/package/sample_python_portalocker.py
@@ -0,0 +1,51 @@
+import os
+import multiprocessing
+import time
+from pathlib import Path
+from portalocker import utils, LockFlags
+
+flags = LockFlags.EXCLUSIVE | LockFlags.NON_BLOCKING
+
+def worker(filename, result):
+    try:
+        lock = utils.Lock(filename, fail_when_locked=True, flags=flags)
+        lock.acquire()
+        result.put((True, 'ok'))
+        lock.release()
+    except Exception as e:
+        result.put((False, str(e)))
+
+
+def run(filename):
+    queue: multiprocessing.Queue[tuple[bool, str]] = (
+        multiprocessing.Queue()
+    )
+
+    proc = multiprocessing.Process(
+        target=worker, args=(str(lock.filename), queue)
+    )
+
+    proc.start()
+    try:
+        result, msg = queue.get(timeout=1)
+        print(f"{result} {msg}")
+    finally:
+        proc.join(timeout=1)
+    
+    if  proc.is_alive():
+        proc.terminate()
+
+
+if __name__ == '__main__':
+    filename = Path('/tmp/foo')
+
+    lock = utils.Lock(filename, fail_when_locked=True, flags=flags)
+    assert(lock.filename == str(filename))
+
+    lock.acquire()
+    time.sleep(0.1)
+    run(filename)       # should fail
+    lock.release()
+
+    time.sleep(0.1)
+    run(filename)       # success
diff --git a/support/testing/tests/package/test_python_portalocker.py b/support/testing/tests/package/test_python_portalocker.py
new file mode 100644
index 0000000000..58f27c0f79
--- /dev/null
+++ b/support/testing/tests/package/test_python_portalocker.py
@@ -0,0 +1,24 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPortalocker(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PORTALOCKER=y
+        """
+    sample_scripts = ["tests/package/sample_python_portalocker.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, [
+            'False [Errno 11] Resource temporarily unavailable',
+            'True ok',
+        ])
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
