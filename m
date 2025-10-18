Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49698CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 108A660E92;
	Sat, 18 Oct 2025 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvyuwtHbENOd; Sat, 18 Oct 2025 19:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320ED60EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320ED60EAB;
	Sat, 18 Oct 2025 19:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32097D8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2392D40FD3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14IX6bbM-SCH for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2172740FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2172740FC2
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2172740FC2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 49334C09A1F;
 Sat, 18 Oct 2025 19:43:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEF9C6069D;
 Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 779CF102F238D; 
 Sat, 18 Oct 2025 21:44:03 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:07 +0200
Message-ID: <20251018194314.114284-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816644; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=tKcqaYWbmzF773tFFoexMJr1MQJjtR0uRdPPl8ElGz0=;
 b=UkhN4egtaXi4OdLbGOsGxNj8XLYoFCCbvSF18honYo/bn1wba1Bfzp5+Um8Y2AAINRy05u
 XVjxMGhblAPpGJezQoz5kv0Vdhd5m7zKbTqkHydevwDaHfG/u4AcHYQmRPJrtfj+1DrbNR
 /g6qcQc4Ef6fwFfvh4sqUIRhnGJYW3LR4l0hjcJQ3WLaMhjJAqpY+zdLMTMTovbGXgNbPo
 3IrD/lSthigYzSwJq2zK2PuAG7+MG7ApTuyTksM2POEA1XsI+nDcqg2xlVVYbAjUCa5u+3
 Kv2JbtuSE78VcCZtHhKnY7658yU5/Cl8mxW09yP4+CVJ72qSrvQFGs11sexPeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=UkhN4egt
Subject: [Buildroot] [PATCH 09/11] package/python-fs: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a host package for the Python 'fs' module, needed as
a dependency of pyfatfs, itself needed by Snagboot.

Homepage: https://pypi.org/project/fs/

In addition, a very simple test case is adding to check that
host-python-fs is minimally working.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                      |  2 ++
 package/python-fs/python-fs.hash                |  5 +++++
 package/python-fs/python-fs.mk                  | 15 +++++++++++++++
 support/testing/tests/package/test_python_fs.py |  9 +++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-fs/python-fs.hash
 create mode 100644 package/python-fs/python-fs.mk
 create mode 100644 support/testing/tests/package/test_python_fs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 63c8d5673c..a774c30341 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3253,6 +3253,7 @@ F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
+F:	package/python-fs/
 F:	package/python-git/
 F:	package/python-qrcode/
 F:	package/python-serial/
@@ -3284,6 +3285,7 @@ F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
+F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
new file mode 100644
index 0000000000..5ebb49128d
--- /dev/null
+++ b/package/python-fs/python-fs.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
+sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
+
+# Locally calculated
+sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
diff --git a/package/python-fs/python-fs.mk b/package/python-fs/python-fs.mk
new file mode 100644
index 0000000000..8d684e6ebd
--- /dev/null
+++ b/package/python-fs/python-fs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fs
+#
+################################################################################
+
+PYTHON_FS_VERSION = 2.4.16
+PYTHON_FS_SOURCE = fs-$(PYTHON_FS_VERSION).tar.gz
+PYTHON_FS_SITE = https://files.pythonhosted.org/packages/5d/a9/af5bfd5a92592c16cdae5c04f68187a309be8a146b528eac3c6e30edbad2
+PYTHON_FS_SETUP_TYPE = setuptools
+PYTHON_FS_LICENSE = MIT
+PYTHON_FS_LICENSE_FILES = LICENSE
+HOST_PYTHON_FS_DEPENDENCIES = host-python-six host-python-appdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_fs.py b/support/testing/tests/package/test_python_fs.py
new file mode 100644
index 0000000000..a53d8a64c8
--- /dev/null
+++ b/support/testing/tests/package/test_python_fs.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonFs(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-fs"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import fs; fs.open_fs('mem://'); fs.open_fs('temp://')"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
