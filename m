Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D01F8A142
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 08:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F2880778;
	Thu, 16 Apr 2026 08:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXkizyocK4tw; Thu, 16 Apr 2026 08:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E640E80780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776326955;
	bh=+Niglh8KVjDX9RnJ+WQfm0jsxtYjCB93iAaUvNYSlTU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LWkLhbfPEId6g/2BmxpVbp9XUDTX91XA70SNDcY7YIG7QRJMrwtEiSHR8HRDfZGlq
	 a3HspgtcrmtuQP7JJ/Krkj/T4dVDeSL9nAasVNzCVpHsOrG2+USfPolM7W5rCQU9bC
	 OGANYABvDaOsL0ETh4Arm19shO2ka2EHZSdAyrKFMl3IvZIM50rVpL1sOqglVdRSdr
	 P7wZYA5pOAmU6te0+TaLpJZgnHyXRxC4fmaMf53FwILNtLnyjHpuwU4+W2dl6AbvSG
	 5cf4SJR5rpVB4hyABvKCNzTaLnxj3tZCZXFOgtzqpt5A8OO3vJ60HYvjZEcobdsJQE
	 KNsTdURHUPfzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E640E80780;
	Thu, 16 Apr 2026 08:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8C42CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11505606D7
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 08:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmnNF4AGkINA for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 08:09:11 +0000 (UTC)
X-Greylist: delayed 154993 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 16 Apr 2026 08:09:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8235E606CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8235E606CF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.32.238;
 helo=smtpout4.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
Received: from smtpout4.mo533.mail-out.ovh.net
 (smtpout4.mo533.mail-out.ovh.net [46.105.32.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8235E606CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 08:09:10 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fx9db1Q1yz5vxf;
 Thu, 16 Apr 2026 08:09:07 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Thu, 16 Apr 2026 08:09:07 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.58.3])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fx9dZ6slrz5vRy;
 Thu, 16 Apr 2026 08:09:06 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.6])
 (Authenticated sender: mooz@blockos.org)
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 43D0D9415E5; 
 Thu, 16 Apr 2026 08:09:06 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 10:06:38 +0200
Message-ID: <20260416080903.8480-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 11034663514172541858
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEBiqSgx/SnZcjjkZfsPX3InDYky+U+j6nB1muNdItFqsWGO4ON2sf/8uCvYp8l1leKJ/lvm8Tbi6pEmLXQyXpneAESud1xgYbD5cZ1I+igaDleiEHJObpMAzYLBTczaVDY1oFUhc8do+hk3V1xQkHsFzmaMBvCRQGA7BGdWPktpnZiClZ94NsSY277DSff6PHLsEq9oNeCMjyoR7dilI2J81sEHIyuelHSSSQs6OgPCW7MaCj/bqyIanssRobuW2xQJZNbTJ1coIAnOHjBM0NywrTY0CZGkkmeBE/A19uxUjgwwMxIxuOPmN86v2VINWOT1JxQwfRX1K/vVl6lStUBp/L0IsA92sjTUdQNoTxEU62FnAq/Tx2l9J1iHup43XLz3t/+4wE0Y/D1Ug1B75gi60eMH3Sv+aFlVn98Q71Dog2E/4GyBkRhRgtKY8nI3kpGtgYxFt672BBY2s6umxCpi/2O6YIK+7Qj9BnILW3xrXj2xv9MoGqdcJrJJNgmoRnotOnvzl0Vi6Ic+voBjltti7TAlkdWymulLJv/7N5zB2O4JOf8M6LiW1iCWVSnOtKI8b+SaEgqy0kAWR3KAlHg9o/pYHs76186VyPJKrrDAzVut047IEKtOwoQTo1WhXhh7x84aHcjXbutFdElyxejtH2e97m9IQC4UftGgjzd6g
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006520f5289-9614-4cde-8a79-6af902991db0,
 0D8B65AFD1E29AA9D52F941CF36BEFE6B8CD1347) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v2 1/1] package/python-sysv-ipc: new package
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
Cc: Vincent Jardin <vjardin@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Cruz <mooz@blockos.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Jardin <vjardin@free.fr>

python-sysv-ipc provides Python bindings for System V IPC primitives
(semaphores, shared memory and message queues).

https://github.com/osvenskan/sysv_ipc

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>

---
Changes v1 -> v2:
  - Bump version to 1.2.0
  - Add test

Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2455626637

---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/python-sysv-ipc/Config.in             |  7 ++++
 package/python-sysv-ipc/python-sysv-ipc.hash  |  4 ++
 package/python-sysv-ipc/python-sysv-ipc.mk    | 16 ++++++++
 .../tests/package/sample_python_sysv_ipc.py   | 26 +++++++++++++
 .../tests/package/test_python_sysv_ipc.py     | 39 +++++++++++++++++++
 .../rootfs-overlay/root/ping.py               | 17 ++++++++
 .../rootfs-overlay/root/pong.py               | 17 ++++++++
 9 files changed, 129 insertions(+)
 create mode 100644 package/python-sysv-ipc/Config.in
 create mode 100644 package/python-sysv-ipc/python-sysv-ipc.hash
 create mode 100644 package/python-sysv-ipc/python-sysv-ipc.mk
 create mode 100644 support/testing/tests/package/sample_python_sysv_ipc.py
 create mode 100644 support/testing/tests/package/test_python_sysv_ipc.py
 create mode 100644 support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/ping.py
 create mode 100644 support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/pong.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b20cf7d93c..fb4731168b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3372,6 +3372,8 @@ F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libnss-ato/
 F:	package/libyang-cpp/
+F:	package/python-sysv-ipc/
+F:	package/rpmsg-echo-test/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d0f148699b..30c8a77bde 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1439,6 +1439,7 @@ menu "External python modules"
 	source "package/python-starlette/Config.in"
 	source "package/python-sympy/Config.in"
 	source "package/python-systemd/Config.in"
+	source "package/python-sysv-ipc/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
 	source "package/python-telnetlib3/Config.in"
diff --git a/package/python-sysv-ipc/Config.in b/package/python-sysv-ipc/Config.in
new file mode 100644
index 0000000000..487935b680
--- /dev/null
+++ b/package/python-sysv-ipc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SYSV_IPC
+	bool "python-sysv-ipc"
+	help
+	  System V IPC primitives (semaphores, shared memory and
+	  message queues) for Python.
+
+	  https://github.com/osvenskan/sysv_ipc
diff --git a/package/python-sysv-ipc/python-sysv-ipc.hash b/package/python-sysv-ipc/python-sysv-ipc.hash
new file mode 100644
index 0000000000..ecdd154035
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/sysv-ipc/1.2.0/json
+sha256  ef96ab33bb62e4d14142f0be0524dcc0c3c70c96442df2fc773c67b7c7514199  sysv_ipc-1.2.0.tar.gz
+# Locally computed
+sha256  ca1c736814f4b73052ba877eaa9e09b40c7e22f1b5d025236246227cc1d87fdc  LICENSE
diff --git a/package/python-sysv-ipc/python-sysv-ipc.mk b/package/python-sysv-ipc/python-sysv-ipc.mk
new file mode 100644
index 0000000000..82efc21168
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-sysv-ipc
+#
+################################################################################
+
+PYTHON_SYSV_IPC_VERSION = 1.2.0
+PYTHON_SYSV_IPC_SOURCE = sysv_ipc-$(PYTHON_SYSV_IPC_VERSION).tar.gz
+PYTHON_SYSV_IPC_SITE = https://files.pythonhosted.org/packages/f2/5e/59208c6dd05ebc6f46ce2023c4fc01ffe814a1967d21b35d312c7e6ffeae
+
+PYTHON_SYSV_IPC_LICENSE = BSD-3-Clause
+PYTHON_SYSV_IPC_LICENSE_FILES = PKG-INFO LICENSE
+
+PYTHON_SYSV_IPC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sysv_ipc.py b/support/testing/tests/package/sample_python_sysv_ipc.py
new file mode 100644
index 0000000000..1b5941329c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sysv_ipc.py
@@ -0,0 +1,26 @@
+import subprocess
+import sys
+import sysv_ipc
+
+key = [303, 808]
+iterations = 6
+
+queue = [
+    sysv_ipc.MessageQueue(key[0], sysv_ipc.IPC_CREX),
+    sysv_ipc.MessageQueue(key[1], sysv_ipc.IPC_CREX)
+]
+
+procs = [None] * 2
+
+procs[0] = subprocess.Popen([sys.executable, "/root/ping.py", str(key[0]), str(key[1]), str(iterations)])
+procs[1] = subprocess.Popen([sys.executable, "/root/pong.py", str(key[1]), str(key[0]), str(iterations)])
+
+for p in procs:
+    try:
+        errs = p.wait(timeout=15)
+    except subprocess.TimeoutExpired:
+        p.kill()
+        errs = p.wait()
+
+for q in queue:
+    q.remove()
diff --git a/support/testing/tests/package/test_python_sysv_ipc.py b/support/testing/tests/package/test_python_sysv_ipc.py
new file mode 100644
index 0000000000..e6a697dfcf
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc.py
@@ -0,0 +1,39 @@
+import os
+import infra
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonSysVIPC(TestPythonPackageBase):
+    rootfs_overlay = infra.filepath("tests/package/test_python_sysv_ipc/rootfs-overlay")
+
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        f"""
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SYSV_IPC=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        """
+    sample_scripts = ["tests/package/sample_python_sysv_ipc.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        output, ret = self.emulator.run(cmd, timeout=self.timeout)
+
+        self.assertEqual(ret, 0)
+        self.assertEqual(output, [
+            'ping 0',
+            'pong 0',
+            'ping 1',
+            'pong 1',
+            'ping 2',
+            'pong 2',
+            'ping 3',
+            'pong 3',
+            'ping 4',
+            'pong 4',
+            'ping 5',
+            'pong 5',
+        ])
diff --git a/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/ping.py b/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/ping.py
new file mode 100644
index 0000000000..d5c1df3879
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/ping.py
@@ -0,0 +1,17 @@
+import argparse
+import sysv_ipc
+
+parser = argparse.ArgumentParser()
+parser.add_argument("input", help="input message queue key", type=int)
+parser.add_argument("output", help="output message queue key", type=int)
+parser.add_argument("count", help="iterations count", type=int)
+args = parser.parse_args()
+
+incoming = sysv_ipc.MessageQueue(args.input)
+outgoing = sysv_ipc.MessageQueue(args.output)
+
+for i in range(0, args.count):
+    outgoing.send(f"ping {i}")
+
+    s, _ = incoming.receive()
+    print(s.decode())
diff --git a/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/pong.py b/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/pong.py
new file mode 100644
index 0000000000..9fe672a6e4
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc/rootfs-overlay/root/pong.py
@@ -0,0 +1,17 @@
+import argparse
+import sysv_ipc
+
+parser = argparse.ArgumentParser()
+parser.add_argument("input", help="input message queue key", type=int)
+parser.add_argument("output", help="output message queue key", type=int)
+parser.add_argument("count", help="iterations count", type=int)
+args = parser.parse_args()
+
+incoming = sysv_ipc.MessageQueue(args.input)
+outgoing = sysv_ipc.MessageQueue(args.output)
+
+for i in range(0, args.count):
+    s, _ = incoming.receive()
+    print(s.decode())
+    
+    outgoing.send(f"pong {i}")
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
