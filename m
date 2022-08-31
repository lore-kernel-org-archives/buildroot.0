Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8CECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E952416F4;
	Wed, 31 Aug 2022 19:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E952416F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJO7CbdGKJ6E; Wed, 31 Aug 2022 19:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F5E4151E;
	Wed, 31 Aug 2022 19:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F5E4151E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0DE31BF2BC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C93D761132
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C93D761132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5mYqE8rBzi1 for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:38:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB72060E91
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB72060E91
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 94EAA88158; Wed, 31 Aug 2022 19:23:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 21:37:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2526a2f51fce00084a645aec0bdae5471c5ab626
X-Git-Newrev: 54e5a6420072415f80bad272183b45b61f159675
X-Patchwork-Hint: ignore
Message-Id: <20220831192321.94EAA88158@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_paho_mqtt: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=54e5a6420072415f80bad272183b45b61f159675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tests valdates that we can publish a message and read it back.

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - don't manually start mosquitto, there's a startup script for that
  - don't pass custom timeout
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/package/sample_python_paho_mqtt.py       | 12 +++++++++++
 .../testing/tests/package/test_python_paho_mqtt.py | 23 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/support/testing/tests/package/sample_python_paho_mqtt.py b/support/testing/tests/package/sample_python_paho_mqtt.py
new file mode 100644
index 0000000000..769ad6250f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_paho_mqtt.py
@@ -0,0 +1,12 @@
+from paho.mqtt import publish, subscribe
+
+publish.single(
+        'buildroot/test',
+        payload="Hello, World!",
+        qos=2,
+        retain=True,
+        hostname="localhost",
+        port=1883)
+
+message = subscribe.simple('buildroot/test')
+print(message.payload.decode())
diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
new file mode 100644
index 0000000000..0fe7fa5904
--- /dev/null
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+
+
+class TestPythonPahoMQTT(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_MOSQUITTO=y
+        BR2_PACKAGE_MOSQUITTO_BROKER=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PAHO_MQTT=y
+        """
+    sample_scripts = ["tests/package/sample_python_paho_mqtt.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello, World!")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
