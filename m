Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB73C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 15:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDF49400F9;
	Sat, 27 Apr 2024 15:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilx43iK4Typ2; Sat, 27 Apr 2024 15:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 752CA40518
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 752CA40518;
	Sat, 27 Apr 2024 15:31:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C53B1BF42D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 15:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93CBB8338B
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rkJm1o1-r1u for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 15:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02D3382F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D3382F51
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02D3382F51
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 15:31:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 97B31B0053E;
 Sat, 27 Apr 2024 17:31:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 17:30:45 +0200
Message-ID: <20240427153045.2907889-2-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427153045.2907889-1-ju.o@free.fr>
References: <20240427153045.2907889-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714231872;
 bh=L9j3aEcisiUY7Vxh1drRB54VeDXJlPU9r2moFq52u+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MBcQnkxIOzys3ZkKMGWd31CwM1i4R9Y7mw8brkuZY4cprhpggvm1aWFJR4CA3dHLS
 yGp5JIcdoE8rYCZYS4xS5i2xNMjUFglYRXZhVb0//VRMQyY9rdKyEgj1mK3o9S9yyu
 qq5/6D9qFcx0widIfBqJBOu4mlC/VUozYP2AOpoD2s6EIbejrAbPgXUfJc+LhuCMAA
 2HRzrCpk73BWJQJ6k+/EH4OXKeaVZtNbb0v8rwyzggpdaF8AAsFGCGqnXHO7Xq90C4
 UxfAJ7GaM6Nko7zQk5FXgPS93Wzm8emu5Y9SDIPxol4TTFzldXh3k8MExfu/2ela3K
 2m1eghfp+EKUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MBcQnkxI
Subject: [Buildroot] [PATCH 2/2] package/python-sympy: new package
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SymPy is a Python library for symbolic mathematics. It aims
to become a full-featured computer algebra system (CAS)
while keeping the code as simple as possible in order to be
comprehensible and easily extensible. SymPy is written
entirely in Python.

https://www.sympy.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested on branch master at commit db37b0e with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_mpmath
    ...
    OK

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_sympy
    ...
    OK

    cat > python-sympy.config <<EOF
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_SYMPY=y
    EOF
    utils/test-pkg -a -c python-sympy.config -p python-sympy
    ...
    42 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 DEVELOPERS                                        |  2 ++
 package/Config.in                                 |  1 +
 package/python-sympy/Config.in                    | 11 +++++++++++
 package/python-sympy/python-sympy.hash            |  7 +++++++
 package/python-sympy/python-sympy.mk              | 14 ++++++++++++++
 .../testing/tests/package/sample_python_sympy.py  | 15 +++++++++++++++
 .../testing/tests/package/test_python_sympy.py    | 13 +++++++++++++
 7 files changed, 63 insertions(+)
 create mode 100644 package/python-sympy/Config.in
 create mode 100644 package/python-sympy/python-sympy.hash
 create mode 100644 package/python-sympy/python-sympy.mk
 create mode 100644 support/testing/tests/package/sample_python_sympy.py
 create mode 100644 support/testing/tests/package/test_python_sympy.py

diff --git a/DEVELOPERS b/DEVELOPERS
index e44a7298822..5ad71778d6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,6 +1769,7 @@ F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
@@ -1855,6 +1856,7 @@ F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
+F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
diff --git a/package/Config.in b/package/Config.in
index 09e8b47a3c7..7b90a7080e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1370,6 +1370,7 @@ menu "External python modules"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-stack-data/Config.in"
 	source "package/python-starlette/Config.in"
+	source "package/python-sympy/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
diff --git a/package/python-sympy/Config.in b/package/python-sympy/Config.in
new file mode 100644
index 00000000000..1ee26222dcf
--- /dev/null
+++ b/package/python-sympy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SYMPY
+	bool "python-sympy"
+	select BR2_PACKAGE_PYTHON_MPMATH # runtime
+	help
+	  SymPy is a Python library for symbolic mathematics. It aims
+	  to become a full-featured computer algebra system (CAS)
+	  while keeping the code as simple as possible in order to be
+	  comprehensible and easily extensible. SymPy is written
+	  entirely in Python.
+
+	  https://www.sympy.org/
diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
new file mode 100644
index 00000000000..947edfd4e08
--- /dev/null
+++ b/package/python-sympy/python-sympy.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/sympy/json
+md5  3e0033109352d7303ea97b9216e16645  sympy-1.12.tar.gz
+sha256  ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8  sympy-1.12.tar.gz
+# Locally computed sha256 checksums
+sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
+sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
+sha256  007bc30a58fa40a996e772047120de4eaf31f5110e4f9c3b5f93fcdfbe2eaca1  sympy/parsing/latex/LICENSE.txt
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
new file mode 100644
index 00000000000..0f160649ad4
--- /dev/null
+++ b/package/python-sympy/python-sympy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sympy
+#
+################################################################################
+
+PYTHON_SYMPY_VERSION = 1.12
+PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
+PYTHON_SYMPY_SITE = https://github.com/sympy/sympy/releases/download/sympy-$(PYTHON_SYMPY_VERSION)
+PYTHON_SYMPY_SETUP_TYPE = setuptools
+PYTHON_SYMPY_LICENSE = BSD-3-Clause
+PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sympy.py b/support/testing/tests/package/sample_python_sympy.py
new file mode 100644
index 00000000000..2734e9b4feb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sympy.py
@@ -0,0 +1,15 @@
+#! /usr/bin/env python3
+
+from sympy import symbols, expand, factor
+
+x, y = symbols('x y')
+
+expr = x + 2*y
+
+expanded_expr = expand(x*expr)
+print(expanded_expr)
+assert str(expanded_expr) == "x**2 + 2*x*y"
+
+factored_expr = factor(expanded_expr)
+print(factored_expr)
+assert str(factored_expr) == "x*(x + 2*y)"
diff --git a/support/testing/tests/package/test_python_sympy.py b/support/testing/tests/package/test_python_sympy.py
new file mode 100644
index 00000000000..e2106eb49ab
--- /dev/null
+++ b/support/testing/tests/package/test_python_sympy.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SymPy(TestPythonPackageBase):
+    __test__ = True
+
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SYMPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_sympy.py"]
+    timeout = 20
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
