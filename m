From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 24 Feb 2016 15:36:10 +0100
Subject: [Buildroot] [PATCH v2] docs/manual: add "python-package CFFI
	backend" section
Message-ID: <1456324570-1463-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: resolve grammatical issues suggested by Arnout Vandecappelle

 docs/manual/adding-packages-python.txt | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 588dbf8..656b289 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -160,3 +160,40 @@ possible to customize what is done in any particular step:
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
+appearance of the +cffi+ dependency in an +install_requires+ field of their
++setup.py+ file.
+
+Such a package needs +python-cffi+ as a runtime dependency in order to import
+the compiled C library wrapper on the target and +host-python-cffi+ as a
+build-time dependency in order to cross-compile the C wrapper. You'll need to
+add the following code to the package's +Config.in+ and +*.mk+ files,
+respectively.
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
