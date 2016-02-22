From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 22 Feb 2016 10:20:59 +0100
Subject: [Buildroot] [PATCH] docs/manual: add "python-package CFFI backend"
	section
Message-ID: <1456132859-8459-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 docs/manual/adding-packages-python.txt | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 588dbf8..3278998 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -160,3 +160,39 @@ possible to customize what is done in any particular step:
   +PYTHON_FOO_BUILD_CMDS+ variable, it will be used instead of the
   default Python one. However, using this method should be restricted
   to very specific cases. Do not use it in the general case.
+
+[[python-package-cffi-backend]]
+
+==== +python-package+ CFFI backend
+
+C Foreign Function Interface for Python (CFFI) provides a convenient and
+reliable way to call compiled C code from Python using interface declarations
+written in C. Python packages relying on this backend can be identified by
+appearance of +cffi+ dependency in an +install_requires+ field of their
++setup.py+ file.
+
+Such a package needs +python-cffi+ as a runtime dependency in order to import
+compiled C library wrapper on a target and +host-python-cffi+ as a build-time
+dependency in order to cross-compile the C wrapper. You'll need to add following
+code to you package's +Config.in+ and +*.mk+ files respectively:
+
+
+------------------------
+config BR2_PACKAGE_PYTHON_FOO
+        bool "python-foo"
+        select BR2_PACKAGE_PYTHON_CFFI # runtime
+------------------------
+
+------------------------
+################################################################################
+#
+# python-foo
+#
+################################################################################
+
+...
+
+PYTHON_FOO_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
+------------------------
-- 
2.7.0
