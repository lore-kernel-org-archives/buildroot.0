Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFD8F9D0D2
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AB384A6E;
	Tue, 14 Apr 2026 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGGE8BOFre00; Tue, 14 Apr 2026 14:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB8F84A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776176158;
	bh=X6xxT6dFF3xeoaf+pQokkw2J0DNGm0vq9vpKdzHp2cY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AnE6XkTD+iepIhFCpFZm47K5Ks3pKnn+VnmjG1G0tw5fY7UEx+nXnd9u/TwhsVF/u
	 FspIlkpzQe4hfkqeXmFJEwJk0/ZrF669PLcNafSz3ZCED8vygnwIHJMz4+kf/R+dBe
	 XtC4A6qnN9GVGhQxDI29J6RmVZn1inZjIDj4U87YRcOHGap/NfJG/NwfN77T26Vm16
	 C5rrdr0YsODZZySLX62eXOKKmUE4cu5407U8m0Ep+PaAvaMn3ld/vD4yG8lYokUFVq
	 gtf1QK2i18+j0CEen+oIF4hbKddNEDvN8XEpP+TdEARw6eS38iMXeRXqL7F/oheTbK
	 EOuhQcLlNcJig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB8F84A8E;
	Tue, 14 Apr 2026 14:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A2B8283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 14:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 402A842771
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 14:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbtDT6pDdwqp for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 14:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.177;
 helo=smtpout6.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 776684021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776684021A
Received: from smtpout6.mo534.mail-out.ovh.net
 (smtpout6.mo534.mail-out.ovh.net [54.36.140.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 776684021A
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 14:15:53 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net [51.68.94.138])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fw5sf4rGyz6MpX;
 Tue, 14 Apr 2026 14:15:50 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net. [127.0.0.1])
 by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Tue, 14 Apr 2026 14:15:50 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.54.159])
 by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fw5sf2wnTz7tnn; Tue, 14 Apr 2026 14:15:50 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.5])
 (Authenticated sender: mooz@blockos.org)
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 9C00C9415D3; 
 Tue, 14 Apr 2026 14:15:49 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 16:14:54 +0200
Message-ID: <20260414141542.975966-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 5482569597051063202
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEpAR4jkgW9wailg971qANVaew2qfIw0Im1sCvGxh8IXdaeWNvPZzAOePYvVr/S9UcewmWnCpnEAbVN5IdOFttw8D3JF09PWVchlvSuaTZYbfMk+jSPOUFulTsws2TAcw/82ox1hDRdjUBZq/bzAczK+FSE5BZwYr/HA8C6AFUYDTvNCqrkSK8UJwr66OE+7sJ9+BlIcGGWVs4oQ9mWsgM6dYf39Iz00vzu4pofGc/TdWQjUP5ciBcxm9A8kG8G5PClrbnyMDe7+FjNjXmNGn6R8KEQftZJQc2AAdrn56AriqRBMOL+vNgn8VssJcRwBxDHJ8hAsMMdghj4EoulYAOsC+nJ5QWyM7nYI05XwYK+v2XeY/QcVnSnYuOYurkt9FYVwHQ3nHf9hviqKfmMaC9fRoOc8NU3nD1b3ltRfkzVlTNSF030GJ44nCm9G/rk16xXSrIPKD3F07flWn/Q+Hzsr1XZlsEDF75Wi7ry8XB+9RShc6alQ6Gk6eF7T1IEliqKxQCa65Q6am0nF9ro5PsCi2601ovNlXoXZLnmoaQiSDjiQ86e5XxfS4BdM1oMPEDL8mSyv3+QbGwGc805vqttH7dyb7aQlQYWm8KA3PfaBdkwwjDUn2j/Lx8xyGAzqPxofVl9Kufo3oSh2NTcMNGG3uYGkXd2K6FSJRExwFwsxA
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001307d88dc-9973-4e35-8b65-c1bda3b569db,
 57EC06D2F55947E19987155D42FF0DD2D92A6C82) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH] package/python-transitions: new package
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

Lightweight finite state machine implementation in Python.

https://github.com/pytransitions/transitions

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2452239577

 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/python-transitions/Config.in          |  7 ++++
 .../python-transitions.hash                   |  5 +++
 .../python-transitions/python-transitions.mk  | 15 ++++++++
 .../package/sample_python_transitions.py      | 34 +++++++++++++++++++
 .../tests/package/test_python_transitions.py  | 28 +++++++++++++++
 7 files changed, 93 insertions(+)
 create mode 100644 package/python-transitions/Config.in
 create mode 100644 package/python-transitions/python-transitions.hash
 create mode 100644 package/python-transitions/python-transitions.mk
 create mode 100644 support/testing/tests/package/sample_python_transitions.py
 create mode 100644 support/testing/tests/package/test_python_transitions.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ad64e876e..b20cf7d93c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3361,6 +3361,9 @@ F:	package/rtl8822cs/
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
+N:	Vincent Cruz <mooz@blockos.org>
+F:	package/python-transitions/
+
 N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
diff --git a/package/Config.in b/package/Config.in
index 71501cea53..3aa13ec75d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1463,6 +1463,7 @@ menu "External python modules"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
+	source "package/python-transitions/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
 	source "package/python-trio-websocket/Config.in"
diff --git a/package/python-transitions/Config.in b/package/python-transitions/Config.in
new file mode 100644
index 0000000000..4289b446f5
--- /dev/null
+++ b/package/python-transitions/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TRANSITIONS
+	bool "python-transitions"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Lightweight finite state machine implementation in Python.
+
+	  https://github.com/pytransitions/transitions
diff --git a/package/python-transitions/python-transitions.hash b/package/python-transitions/python-transitions.hash
new file mode 100644
index 0000000000..a37cc44928
--- /dev/null
+++ b/package/python-transitions/python-transitions.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/transitions/0.9.3/json
+sha256  881fb75bb1654ed55d86060bb067f2c716f8e155f57bb73fd444e53713aafec8  transitions-0.9.3.tar.gz
+# Locally computed
+sha256  fd7115fc5517d1d2d042a80a33d92033532236830a9c25866112299fe33c036b  transitions-0.9.3/LICENSE
+sha256  4802901f4f7cf09d7df279c021ace21ffe4513d782eaa3fce96a7375380c9cf8  transitions-0.9.3/PKG-INFO
diff --git a/package/python-transitions/python-transitions.mk b/package/python-transitions/python-transitions.mk
new file mode 100644
index 0000000000..8189cebcbd
--- /dev/null
+++ b/package/python-transitions/python-transitions.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-transitions
+#
+################################################################################
+
+PYTHON_TRANSITIONS_VERSION = 0.9.3
+PYTHON_TRANSITIONS_SOURCE = transitions-$(PYTHON_TRANSITIONS_VERSION).tar.gz
+PYTHON_TRANSITIONS_SITE = https://files.pythonhosted.org/packages/source/t/transitions
+PYTHON_TRANSITIONS_SETUP_TYPE = setuptools
+
+PYTHON_TRANSITIONS_LICENSE = MIT
+PYTHON_TRANSITIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_transitions.py b/support/testing/tests/package/sample_python_transitions.py
new file mode 100644
index 0000000000..ca33309998
--- /dev/null
+++ b/support/testing/tests/package/sample_python_transitions.py
@@ -0,0 +1,34 @@
+# test from https://github.com/pytransitions/transitions/blob/master/tests/test_nesting.py
+
+from transitions.extensions import HierarchicalMachine as Machine
+
+states = ['standing', 'walking', {'name': 'caffeinated', 'children': ['dithering', 'running']}]
+transitions = [
+  ['walk', 'standing', 'walking'],
+  ['stop', 'walking', 'standing'],
+  ['drink', 'caffeinated_dithering', '='],
+  ['drink', 'caffeinated', 'caffeinated_dithering'],
+  ['drink', '*', 'caffeinated'],
+  ['walk', 'caffeinated', 'caffeinated_running'],
+  ['relax', 'caffeinated', 'standing']
+]
+
+machine = Machine(states=states, transitions=transitions, initial='standing', ignore_invalid_triggers=True)
+
+machine.walk()   # Walking now
+machine.stop()   # let's stop for a moment
+machine.drink()  # coffee time
+machine.state
+print(machine.state)
+machine.drink()  # again!
+print(machine.state)
+machine.drink()  # and again!
+print(machine.state)
+machine.walk()   # we have to go faster
+print(machine.state)
+machine.stop()   # can't stop moving!
+machine.state
+print(machine.state)
+machine.relax()  # leave nested state
+machine.state    # phew, what a ride
+print(machine.state)
diff --git a/support/testing/tests/package/test_python_transitions.py b/support/testing/tests/package/test_python_transitions.py
new file mode 100644
index 0000000000..a22ceb4afd
--- /dev/null
+++ b/support/testing/tests/package/test_python_transitions.py
@@ -0,0 +1,28 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonTransitions(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TRANSITIONS=y
+        """
+    sample_scripts = ["tests/package/sample_python_transitions.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, [
+            'caffeinated',
+            'caffeinated_dithering',
+            'caffeinated_dithering',
+            'caffeinated_running',
+            'caffeinated_running',
+            'standing'
+        ])
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
