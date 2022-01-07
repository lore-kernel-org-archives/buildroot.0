Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072AFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE21060B09;
	Fri,  7 Jan 2022 21:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paYGxxKnT9KJ; Fri,  7 Jan 2022 21:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F5060806;
	Fri,  7 Jan 2022 21:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBEE1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AAE740010
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8k0F220VRKl for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB5E424B7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 68E388177F; Fri,  7 Jan 2022 21:20:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:26:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a19b822239c36cb40a632899bb5c3e848a5fc81e
X-Git-Newrev: 87f2b7004e6d40454d4b07bbe9b0058342c7767f
X-Patchwork-Hint: ignore
Message-Id: <20220107212044.68E388177F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for python-pybind
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

commit: https://git.buildroot.net/buildroot/commit/?id=87f2b7004e6d40454d4b07bbe9b0058342c7767f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The way that python-pybind can be used is fairly complicated, so a
runtime test for it is convenient. In addition, this test validates that
the headers actually work at runtime.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Arnout:
 - Retain python3 only.
 - python-pybind is a target package, not host.
 - Select python-pybind instead of depend.
 - Simplify python-pybind-example package.
 - Check in python-pybind-example build if pybind11.get_include()
   produces output.
 - Don't use python3 -m pybind11 --includes: it includes the main python
   includes, which are for the host, not for the target.
 - Use TestPythonPackageBase instead of open-coding something imported
   with host python.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  3 ++
 .../package/br2-external/python-pybind/Config.in   |  1 +
 .../br2-external/python-pybind/external.desc       |  1 +
 .../package/br2-external/python-pybind/external.mk |  1 +
 .../package/python-pybind-example/Config.in        |  6 ++++
 .../package/python-pybind-example/example.cpp      | 16 +++++++++
 .../python-pybind-example/python-pybind-example.mk | 41 ++++++++++++++++++++++
 .../testing/tests/package/sample_python_pybind.py  |  4 +++
 .../testing/tests/package/test_python_pybind.py    | 15 ++++++++
 9 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d049b99b91..7874677f7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1124,6 +1124,9 @@ F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
 F:	package/reaver/
+F:	support/testing/tests/package/br2-external/python-pybind
+F:	support/testing/tests/package/sample_python_pybind.py
+F:	support/testing/tests/package/test_python_pybind.py
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
diff --git a/support/testing/tests/package/br2-external/python-pybind/Config.in b/support/testing/tests/package/br2-external/python-pybind/Config.in
new file mode 100644
index 0000000000..70c77157b3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-example/Config.in"
diff --git a/support/testing/tests/package/br2-external/python-pybind/external.desc b/support/testing/tests/package/br2-external/python-pybind/external.desc
new file mode 100644
index 0000000000..eef5e0f5a0
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/external.desc
@@ -0,0 +1 @@
+name: PYTHON_PYBIND
diff --git a/support/testing/tests/package/br2-external/python-pybind/external.mk b/support/testing/tests/package/br2-external/python-pybind/external.mk
new file mode 100644
index 0000000000..3501f3135e
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
new file mode 100644
index 0000000000..1b4d1e0d2c
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE
+	bool "python-pybind-example"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  This test creates a cpp macro later used on target in python
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
new file mode 100644
index 0000000000..f2eea8e48d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
@@ -0,0 +1,16 @@
+#include <pybind11/pybind11.h>
+namespace py = pybind11;
+
+int add (int i, int j) {
+    return i + j;
+}
+
+PYBIND11_MODULE (example, m) {
+    // optional module description
+    m.doc() = "pybind11 example plugin";
+    // test a module method
+    m.def("add", &add, "example::add adds two integer numbers");
+    // test a module attribute
+    py::object hello = py::cast("Hello World");
+    m.attr("says") = hello;
+}
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
new file mode 100644
index 0000000000..a6d7e0daaf
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# python-pybind-example
+#
+################################################################################
+
+# this builds a C++ macro "add(a,b)"
+# that we expose to host-python with a custom install
+# and that the python test script will later use
+PYTHON_PYBIND_EXAMPLE_DEPENDENCIES = python-pybind
+
+PYTHON_PYBIND_EXAMPLE_PYBIND_INCLUDE = \
+	$(shell $(HOST_DIR)/usr/bin/python3 -c 'import pybind11; print(pybind11.get_include())')
+
+PYTHON_PYBIND_EXAMPLE_CXX_FLAGS = \
+	$(TARGET_CXXFLAGS) \
+	-Wall -shared -std=c++11 -fPIC \
+	-I$(PYTHON_PYBIND_EXAMPLE_PYBIND_INCLUDE) \
+	$(shell $(STAGING_DIR)/usr/bin/python3-config --includes --libs --ldflags)
+
+# .so to be installed must have exact suffix
+# otherwise import() in python will not work
+HOST_LIB_BINARY_SUFFIX = \
+	$(shell $(STAGING_DIR)/usr/bin/python3-config --extension-suffix)
+
+define PYTHON_PYBIND_EXAMPLE_BUILD_CMDS
+	if [ -z "$(PYTHON_PYBIND_EXAMPLE_PYBIND_INCLUDE)" ]; then \
+		echo "pybind11.get_include() returned empty"; \
+		exit 1; \
+	fi
+	$(TARGET_CXX) $(PYTHON_PYBIND_EXAMPLE_CXX_FLAGS) \
+		$(PYTHON_PYBIND_EXAMPLE_PKGDIR)/example.cpp \
+		-o $(@D)/example$(HOST_LIB_BINARY_SUFFIX)
+endef
+
+define PYTHON_PYBIND_EXAMPLE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/example$(HOST_LIB_BINARY_SUFFIX) \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/example$(HOST_LIB_BINARY_SUFFIX)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/sample_python_pybind.py b/support/testing/tests/package/sample_python_pybind.py
new file mode 100644
index 0000000000..605c0bab15
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pybind.py
@@ -0,0 +1,4 @@
+#!/usr/bin/env python
+import example
+print(example.add(1, 2))
+print(example.says)
diff --git a/support/testing/tests/package/test_python_pybind.py b/support/testing/tests/package/test_python_pybind.py
new file mode 100644
index 0000000000..5e3c3b9cc5
--- /dev/null
+++ b/support/testing/tests/package/test_python_pybind.py
@@ -0,0 +1,15 @@
+import os
+import infra
+import subprocess
+from tests.package.test_python import TestPythonPackageBase
+
+class TestPythonPybind (TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=y
+        """
+    sample_scripts = ["tests/package/sample_python_pybind.py"]
+    # ship examples macro & installs it to host
+    br2_external = [infra.filepath("tests/package/br2-external/python-pybind")]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
