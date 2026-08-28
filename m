Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2055C61DC6
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 09:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A15060708;
	Fri, 28 Aug 2026 09:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOcNBwYHdEa1; Fri, 28 Aug 2026 09:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787907819;
	bh=CG4iHHFkH9CIq6dbRMhlXHcXSK1bcO/DBgDpM3U557Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QoBdAyMBVeebOWhRvgFa0i4HrGnx5TJxCLBLtJcNrEHGUusXOVprNW3OLzairL51b
	 ItGIuuCGiMrOG/Nzxn+X0FTcCXFviLs3mGKOiGknvkf4IL2Py3a/mYSp7iOmIc34uO
	 324OdqaMOP2EY77F93JQaGW1Dh5jk+W8L2NN9Bq/0SK5oazL1nRUAAw8PMWMhjBFIU
	 uAyW2wVknbMnUbkPeYNn7AZsyyejF6M+1f9oQssHYB+mjjzjgjgYcTgK0xv1+wVBG+
	 a7bVQny7lyeERHBPVWMopLsGbBh2NsZOLNK3Ehr5Pze3+xeKh7PaoKiZhz44yjvwli
	 4bnRqVidp8o4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 596D1606CB;
	Fri, 28 Aug 2026 09:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A7C23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBDAA606CB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1_SaMhopwP9 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 09:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.61;
 helo=mout-b-201.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=09jRlvw1
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B05A60644
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:03:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4hWXVV4wBGzLlqV;
 Fri, 28 Aug 2026 11:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1787907810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzMc0/+8ew4kumw0/KErZthkQmSMKUmh0bQgzD6Kmrg=;
 b=09jRlvw1woACssXtNTm4lGo+6sb+KgLE50lgXsBzS7kJHG1C2/kHdffHxfOITOh5ZbFEdz
 L6s+XZYNmilBv5PPNs8bkIWTLz6TFXpyfjdk60XVP4Ln6X36uxJTzur0wwWSd3Iwfdhflz
 ezi8gombSjkFRNCI4xkS+TG7oYVb54Sy8O9Lp1/2lmx2ujvGzuFkIGHBCo80KD/PSUDuPc
 d41t21/1oxKfsAcn33ITP2K67STPLff4TkIILjBOqHbvyByUNjzYNnfg+o29ctt/Hu8ogl
 J7TmJRrgkTsswDEyKZ7AFsgq9Pxoe47mp1uu/OdUfoyaqyTSWhR3SGDc22d/9Q==
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 11:02:40 +0200
Message-ID: <20260828090241.1849085-1-manuel.diener@oss.othermo.de>
In-Reply-To: <20260826091851.467182-1-manuel.diener@oss.othermo.de>
References: <20260826091851.467182-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-questionary: new package
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
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-questionary/Config.in          |  8 ++++++++
 .../python-questionary.hash                   |  5 +++++
 .../python-questionary/python-questionary.mk  | 14 +++++++++++++
 .../package/sample_python_questionary.py      | 16 +++++++++++++++
 .../tests/package/test_python_questionary.py  | 20 +++++++++++++++++++
 7 files changed, 65 insertions(+)
 create mode 100644 package/python-questionary/Config.in
 create mode 100644 package/python-questionary/python-questionary.hash
 create mode 100644 package/python-questionary/python-questionary.mk
 create mode 100644 support/testing/tests/package/sample_python_questionary.py
 create mode 100644 support/testing/tests/package/test_python_questionary.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 49a72bb69a..d0f4d7d582 100644
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
