Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9E4C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D35440517;
	Tue, 23 Aug 2022 19:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D35440517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1PjgO4SyeBB; Tue, 23 Aug 2022 19:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4846A40323;
	Tue, 23 Aug 2022 19:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4846A40323
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B135D1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7E881A50
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C7E881A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-6EUy88zs27 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:47:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9BF81951
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB9BF81951
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:47:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4MC0BF5bZ8z9sqG;
 Tue, 23 Aug 2022 21:47:33 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:47:32 +0200
Message-Id: <20220823194732.701895-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661284053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjJpMxzNpFImL4s7fK4+YEIVuZ0LJqC3rtv+lmYVjWY=;
 b=j+PfdXquba9iNwhD89RAN21y9fOStSlJ14CVXBzLLbpZcjspBeb3gWuU3t3CNHlZSxYNMw
 4x4mx8yAQwNmY7wXzZ7Qm/3d84jUyKQLs5ebaMSyb/EteC3YsCzWkR9/+wNQVMCltJ+GUC
 1WNfN/pKpUGY8ngd9QHyW3P6rBaj8dKGHghcY5YdoJM25Lcyj9HuYESBop7k2iCzJKdp5t
 PCANPCXNpEYhpFw9f/oipUaFGmRF+L2RYChHfR5wTDzmnLIuNdN2pZ9VnZu8VLBgQNxsRk
 R6XbBoDuIguNMSYR70wBJwknvPeEQunG0mtuLlsNfGUYY+EhII+4KwKUZJp2Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=j+PfdXqu
Subject: [Buildroot] [PATCH 2/2]
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 .../tests/package/sample_python_paho_mqtt.py  | 12 ++++++++
 .../tests/package/test_python_paho_mqtt.py    | 29 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_paho_mqtt.py
 create mode 100644 support/testing/tests/package/test_python_paho_mqtt.py

diff --git a/support/testing/tests/package/sample_python_paho_mqtt.py b/support/testing/tests/package/sample_python_paho_mqtt.py
new file mode 100644
index 00000000000..769ad6250fa
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
index 00000000000..b1e2b8fb422
--- /dev/null
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -0,0 +1,29 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+import time
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
+        cmd = "mosquitto > /dev/null 2>&1 &"
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give some time for mosquitto broker to start up
+        time.sleep(1)
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello, World!")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
