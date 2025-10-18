Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE82CCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A1760EF8;
	Sat, 18 Oct 2025 19:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-DgV5wBdsTR; Sat, 18 Oct 2025 19:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5089E60EDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5089E60EDD;
	Sat, 18 Oct 2025 19:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 411FF71A
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2495640FC2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTMQEGrWFDnr for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25AD540FDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25AD540FDD
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25AD540FDD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3F2DCC09A20
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A530F6069D;
 Sat, 18 Oct 2025 19:44:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3786102F238F; 
 Sat, 18 Oct 2025 21:44:08 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:08 +0200
Message-ID: <20251018194314.114284-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816649; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Wyc0ZIdGZ9vkDzJAQ+kD35G2mzVpW1Z2ZK8OLyWq28I=;
 b=h2xvg/idpGkRyd0pmefrv39Sgm+M7M/+FEwfkfHI8XGAZg33+m/vh8QgCBaGXpcDLp4tjU
 uKddIrHq1FuqbbAS3yxuh4qde2EfDgULlQ6cM46Iekv/r6mQnSGpiNp8IGXBe3i/ihd8II
 VSUwK4lQohVJ7UHxFl0AbwB5bLltiGDDmguA4aLxGGrGTK4UMFsuJ7ozsRfsGA8OfGjyET
 mGGXFIz76kvxp5z9tLyY4qfh+k21lLNy5ySt9KO+g0LajKDtkZl95zT9ra4zmuE2R6EcVJ
 q63u5bk/25XKp0is+/ytfQEHPiQiBgN83SSuXqE0ZBAkuTJKuAOf953sZ6EihQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=h2xvg/id
Subject: [Buildroot] [PATCH 10/11] package/python-pyfatfs: new package
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

This commit adds a new host package for python-pyfatfs, which is
needed by Snagboot.

Homepage: https://pypi.org/project/pyfatfs/

A small test doing some minimal verification that pyfatfs works is
also added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  2 +
 ...oject.toml-relax-version-constraints.patch | 45 ++++++++++++++++
 package/python-pyfatfs/python-pyfatfs.hash    |  4 ++
 package/python-pyfatfs/python-pyfatfs.mk      | 17 ++++++
 .../tests/package/test_python_pyfatfs.py      | 53 +++++++++++++++++++
 5 files changed, 121 insertions(+)
 create mode 100644 package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
 create mode 100644 package/python-pyfatfs/python-pyfatfs.hash
 create mode 100644 package/python-pyfatfs/python-pyfatfs.mk
 create mode 100644 support/testing/tests/package/test_python_pyfatfs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a774c30341..7d48975896 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3255,6 +3255,7 @@ F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
 F:	package/python-fs/
 F:	package/python-git/
+F:	package/python-pyfatfs/
 F:	package/python-qrcode/
 F:	package/python-serial/
 F:	package/python-unittest-xml-reporting/
@@ -3287,6 +3288,7 @@ F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_pyfatfs.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
diff --git a/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch b/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
new file mode 100644
index 0000000000..791401f876
--- /dev/null
+++ b/package/python-pyfatfs/0001-pyproject.toml-relax-version-constraints.patch
@@ -0,0 +1,45 @@
+From 9d40ef086d25c8434adcf6552de1d8bb5022a277 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 22 Sep 2025 23:27:47 +0200
+Subject: [PATCH] pyproject.toml: relax version constraints
+
+The version constraints defined with ~= in pyproject.toml are too
+strict, and don't allow using pyfatfs with newer versions.
+
+We have successfully tested with:
+
+- setuptools 80.9.0
+- setuptools-scm 8.3.1
+- python 3.13
+- fs 2.4.16
+
+Upstream: https://github.com/nathanhi/pyfatfs/pull/47
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ pyproject.toml | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 9649c10..a6eb198 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,13 +1,13 @@
+ [build-system]
+-requires = ["setuptools ~= 67.8", "setuptools_scm[toml] ~= 7.1"]
++requires = ["setuptools >= 67.8", "setuptools_scm[toml] >= 7.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+ name = "pyfatfs"
+ description = "FAT12/FAT16/FAT32 implementation with VFAT support"
+ readme = "README.rst"
+-requires-python = "~=3.8"
+-dependencies = ["fs~=2.4"]
++requires-python = ">=3.8"
++dependencies = ["fs>=2.4"]
+ keywords = ["filesystem", "PyFilesystem2", "FAT12", "FAT16", "FAT32", "VFAT", "LFN"]
+ license = {file = "LICENSE"}
+ classifiers = [
+-- 
+2.51.0
+
diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
new file mode 100644
index 0000000000..05e940779e
--- /dev/null
+++ b/package/python-pyfatfs/python-pyfatfs.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
+sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
+# Locally calculated
+sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
diff --git a/package/python-pyfatfs/python-pyfatfs.mk b/package/python-pyfatfs/python-pyfatfs.mk
new file mode 100644
index 0000000000..a61fb1afb2
--- /dev/null
+++ b/package/python-pyfatfs/python-pyfatfs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pyfatfs
+#
+################################################################################
+
+PYTHON_PYFATFS_VERSION = 1.1.0
+PYTHON_PYFATFS_SOURCE = pyfatfs-$(PYTHON_PYFATFS_VERSION).tar.gz
+PYTHON_PYFATFS_SITE = https://files.pythonhosted.org/packages/44/3f/d08f1dbc44a7eef9c7fb355b83423fbd15bb3e487c250479a2c179cb39bf
+PYTHON_PYFATFS_LICENSE = MIT
+PYTHON_PYFATFS_LICENSE_FILES = LICENSE
+PYTHON_PYFATFS_SETUP_TYPE = setuptools
+# host-python-fs is not a build time dependency, but is needed at
+# runtime for host-python-pyfatfs to work
+HOST_PYTHON_PYFATFS_DEPENDENCIES = host-python-setuptools-scm host-python-fs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pyfatfs.py b/support/testing/tests/package/test_python_pyfatfs.py
new file mode 100644
index 0000000000..ceb4e924a1
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyfatfs.py
@@ -0,0 +1,53 @@
+import infra.basetest
+import os
+
+
+class TestHostPythonPyfatfs(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pyfatfs",
+                "host-genimage",
+                "host-dosfstools",
+                "host-mtools"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    genimage_cfg = """
+image test.vfat {
+    vfat {
+        files = {
+            "test.txt"
+        }
+    }
+
+    size = 8M
+}"""
+
+    def test_run(self):
+        os.makedirs(os.path.join(self.builddir, "genimage-input"),
+                    exist_ok=True)
+        with open(os.path.join(self.builddir, "genimage-input", "test.txt"), "w") as f:
+            f.write("Hello World!")
+        with open(os.path.join(self.builddir, "genimage.cfg"), "w") as f:
+            f.write(self.genimage_cfg)
+        os.makedirs(os.path.join(self.builddir, "genimage-tmp"),
+                    exist_ok=True)
+        os.makedirs(os.path.join(self.builddir, "genimage-root"),
+                    exist_ok=True)
+
+        cmd = ["host/bin/genimage",
+               "--config", os.path.join(self.builddir, "genimage.cfg"),
+               "--outputpath", self.builddir,
+               "--inputpath", os.path.join(self.builddir, "genimage-input"),
+               "--tmppath", os.path.join(self.builddir, "genimage-tmp"),
+               "--rootpath", os.path.join(self.builddir, "genimage-root"),
+               "--mkdosfs", os.path.join(self.builddir, "host", "sbin", "mkdosfs"),
+               "--mcopy", os.path.join(self.builddir, "host", "bin", "mcopy")
+               ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/python3", "-c",
+               "import fs; fatfs = fs.open_fs('fat://test.vfat'); assert(fatfs.listdir('/') == ['TEST.TXT'])"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
