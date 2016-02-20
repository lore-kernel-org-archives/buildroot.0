From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:33:02 +0100
Subject: [Buildroot] [git commit branch/next] python-pynacl: new package
Message-ID: <20160220133349.BAD7E8075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3258b7535db3d6da8d6067e996982d3a7f98217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - remove python-six from the build dependencies, it is only a runtime
   dependency
 - add host-python-cffi in the build dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-pynacl/Config.in          |  9 +++++++++
 package/python-pynacl/python-pynacl.hash |  3 +++
 package/python-pynacl/python-pynacl.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 11569d3..d979da2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -691,6 +691,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
new file mode 100644
index 0000000..5a53648
--- /dev/null
+++ b/package/python-pynacl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYNACL
+	bool "python-pynacl"
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Python binding to the Networking and Cryptography (NaCl) library.
+
+	  https://pypi.python.org/pypi/PyNaCl
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
new file mode 100644
index 0000000..7035ac7
--- /dev/null
+++ b/package/python-pynacl/python-pynacl.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=12fd03d8ce64e0318cb1c69272f17704, sha256 locally computed.
+md5	12fd03d8ce64e0318cb1c69272f17704  PyNaCl-1.0.1.tar.gz
+sha256	d21d7a7358a85fb9b9ddadfbd1176c40fe199334fe2202881255e77f6d3773f4  PyNaCl-1.0.1.tar.gz
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
new file mode 100644
index 0000000..e1769b8
--- /dev/null
+++ b/package/python-pynacl/python-pynacl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pynacl
+#
+################################################################################
+
+PYTHON_PYNACL_VERSION = 1.0.1
+PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
+PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
+PYTHON_PYNACL_LICENSE = Apache-2.0
+PYTHON_PYNACL_LICENSE_FILES = LICENSE
+PYTHON_PYNACL_SETUP_TYPE = setuptools
+PYTHON_PYNACL_DEPENDENCIES = libsodium host-python-cffi
+PYTHON_PYNACL_ENV = SODIUM_INSTALL=system
+
+$(eval $(python-package))
