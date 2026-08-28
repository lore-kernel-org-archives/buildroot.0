Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A856C61DC6
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 09:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A08B60648;
	Fri, 28 Aug 2026 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAOwhxUGFVCG; Fri, 28 Aug 2026 09:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787908106;
	bh=CYxAzwd801clNcfZ6nRaHTX5SgbotdrFW7m/Js8+yjY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B+VrAMEUMjSn51QvaKz+sXyrRG15qre4QVhjPiSeC0dNXiUVgZZG9isR6wVkt16IU
	 0Z9Wh7e2+CSu7NgYNQc71o6gxAEV4YNpepodx2itu5t0c7Q3NtKPFLG4qjFtVZLbEk
	 fSTxyhUX9NQTczjHPwbAOEy3MjvFClDDKIiAJGBrBxezRkp3qzBPbmnNU+cuCE/VtQ
	 ZuvL6Syw4zy82fG/sT5yb0f/eJL7hrKzKsz75wIIi6BeSX6h7NvH6faqkbtIDoaBR9
	 lSyCtOrLaH6pVtm7guv6/VIjF9myn1Ifi5vWZXgsduLSRMyjlBZgKx3A0AXw6Ycaq9
	 JmdOWtdKHGYvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 171B9606CB;
	Fri, 28 Aug 2026 09:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC99386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B131D407BB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVVMlb2vfi2j for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 09:08:23 +0000 (UTC)
X-Greylist: delayed 172116 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Aug 2026 09:08:23 UTC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=M2KnpWkE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::110; helo=mout-b-110.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E0984077E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:23 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4hWXc30dttzNlHJ;
 Fri, 28 Aug 2026 11:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1787908099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kW0TX0Y1d2qQ8rry+FaRiIP0irkVHds6Sy2YawIGLlk=;
 b=M2KnpWkEy1kqCj19eIHdmr5kKNI4iaseL6YxzJdH/tQ3Qg4YKKyys1XqUIW3NcDya1UtyU
 eU2KWNF7sWGRLVFBhsE7XeN+3V3hKw6kfJqRUyP2uLB4l5AbUM0NUU0GglTxCY49X4cN3o
 4UnNQfC74hH7hiCqzrzgIedLWy4wHqujPhJ9oFeJx4Um/3j2yjxUllbBJtIbILcVSgDQQK
 4p8R9OOn2zZdgYElT13cB1ml/5y0Gc1HH/EdD9LAtVJPWWESkfbwz00WXO4MQBFyGewkH6
 yn9jVPFuRvSDb9Dl63gF/FbSKorfO7jxQhrPy80SprAbMHBuJWDZlx70RoZBiw==
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 11:07:56 +0200
Message-ID: <20260828090757.1862504-1-manuel.diener@oss.othermo.de>
In-Reply-To: <20260828090241.1849085-1-manuel.diener@oss.othermo.de>
References: <20260828090241.1849085-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/python-questionary: new package
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
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 DEVELOPERS                                    |  2 ++
 package/Config.in                             |  1 +
 package/python-questionary/Config.in          |  8 ++++++++
 .../python-questionary.hash                   |  5 +++++
 .../python-questionary/python-questionary.mk  | 14 +++++++++++++
 .../package/sample_python_questionary.py      | 16 +++++++++++++++
 .../tests/package/test_python_questionary.py  | 20 +++++++++++++++++++
 7 files changed, 66 insertions(+)
 create mode 100644 package/python-questionary/Config.in
 create mode 100644 package/python-questionary/python-questionary.hash
 create mode 100644 package/python-questionary/python-questionary.mk
 create mode 100644 support/testing/tests/package/sample_python_questionary.py
 create mode 100644 support/testing/tests/package/test_python_questionary.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 49a72bb69a..edd2e46117 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2252,6 +2252,7 @@ F:	package/python-log-rate-limit/
 F:	package/python-pydantic/
 F:	package/python-pydantic-core/
 F:	package/python-pydantic-settings/
+F:	package/python-questionary/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
@@ -2259,6 +2260,7 @@ F:	package/python-sdbus-systemd/
 F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
+F:	support/testing/tests/package/test_python_questionary.py
 
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
diff --git a/package/Config.in b/package/Config.in
index 6058800682..f363e16069 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1377,6 +1377,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-qrcode/Config.in"
+	source "package/python-questionary/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
 	source "package/python-reedsolo/Config.in"
diff --git a/package/python-questionary/Config.in b/package/python-questionary/Config.in
new file mode 100644
index 0000000000..06bc269b4a
--- /dev/null
+++ b/package/python-questionary/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_QUESTIONARY
+	bool "python-questionary"
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
+	help
+	  Python library for effortlessly building pretty
+	  command line interfaces.
+
+	  https://github.com/tmbo/questionary
diff --git a/package/python-questionary/python-questionary.hash b/package/python-questionary/python-questionary.hash
new file mode 100644
index 0000000000..c350e024ff
--- /dev/null
+++ b/package/python-questionary/python-questionary.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/questionary/json
+md5  0c7b9d9ba6c6b4ba94f5e705850cd0c3  questionary-2.1.1.tar.gz
+sha256  3d7e980292bb0107abaa79c68dd3eee3c561b83a0f89ae482860b181c8bd412d  questionary-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3a492ab6d436c5e75f54a9a556de91c4322c8ad408fe849c7da1f7352721c63a  LICENSE
diff --git a/package/python-questionary/python-questionary.mk b/package/python-questionary/python-questionary.mk
new file mode 100644
index 0000000000..803735d5e5
--- /dev/null
+++ b/package/python-questionary/python-questionary.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-questionary
+#
+################################################################################
+
+PYTHON_QUESTIONARY_VERSION = 2.1.1
+PYTHON_QUESTIONARY_SOURCE = questionary-$(PYTHON_QUESTIONARY_VERSION).tar.gz
+PYTHON_QUESTIONARY_SITE = https://files.pythonhosted.org/packages/f6/45/eafb0bba0f9988f6a2520f9ca2df2c82ddfa8d67c95d6625452e97b204a5
+PYTHON_QUESTIONARY_SETUP_TYPE = poetry
+PYTHON_QUESTIONARY_LICENSE = MIT
+PYTHON_QUESTIONARY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_questionary.py b/support/testing/tests/package/sample_python_questionary.py
new file mode 100644
index 0000000000..de707f1ec3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_questionary.py
@@ -0,0 +1,16 @@
+# questionary is tricky to test as there seems to be no option to pass in stdin.
+# Therefore the ask is going to time out on purpose so the test can check if the ask
+# was successfully written to stdout.
+
+import questionary
+import asyncio
+
+async def main():
+    try:
+        async with asyncio.timeout(5):
+            await questionary.press_any_key_to_continue().ask_async()
+    except:
+        raise
+
+if __name__ == '__main__':
+    asyncio.run(main())
diff --git a/support/testing/tests/package/test_python_questionary.py b/support/testing/tests/package/test_python_questionary.py
new file mode 100644
index 0000000000..3050259296
--- /dev/null
+++ b/support/testing/tests/package/test_python_questionary.py
@@ -0,0 +1,20 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonQuestionary(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_questionary.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_questionary.py"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("Press any key to continue...", output[0])
+        self.assertEqual(exit_code, 1)
+
+
+class TestPythonPy3Questionary(TestPythonQuestionary):
+    __test__ = True
+    config = TestPythonQuestionary.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_QUESTIONARY=y
+        """
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
