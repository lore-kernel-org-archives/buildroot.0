From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 17:25:06 +0100
Subject: [Buildroot] [git commit branch/next] docs/manual: add
	"python-package CFFI backend" section
Message-ID: <20160223162521.D91248184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e5c9c2b35c71a3d3180c5829975dba5222b30c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: formatting/redaction tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 588dbf8..9bbc9f3 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -160,3 +160,43 @@ possible to customize what is done in any particular step:
   +PYTHON_FOO_BUILD_CMDS+ variable, it will be used instead of the
   default Python one. However, using this method should be restricted
   to very specific cases. Do not use it in the general case.
+
+[[python-package-cffi-backend]]
+
+==== +python-package+ CFFI backend
+
+C Foreign Function Interface for Python (CFFI) provides a convenient
+and reliable way to call compiled C code from Python using interface
+declarations written in C. Python packages relying on this backend can
+be identified by the appearance of a +cffi+ dependency in the
++install_requires+ field of their +setup.py+ file.
+
+Such a package should:
+
+ * add +python-cffi+ as a runtime dependency in order to install the
+compiled C library wrapper on the target. This is achieved by adding
++select BR2_PACKAGE_PYTHON_CFFI+ to the package +Config.in+.
+
+------------------------
+config BR2_PACKAGE_PYTHON_FOO
+        bool "python-foo"
+        select BR2_PACKAGE_PYTHON_CFFI # runtime
+------------------------
+
+ * add +host-python-cffi+ as a build-time dependency in order to
+cross-compile the C wrapper. This is achieved by adding
++host-python-cffi+ to the +PYTHON_FOO_DEPENDENCIES+ variable.
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
