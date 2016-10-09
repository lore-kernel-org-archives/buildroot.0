From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 14:46:24 +0200
Subject: [Buildroot] [PATCH v4 09/10] package/python-slob: new package
In-Reply-To: <20161009124625.23303-1-bernd.kuhls@t-online.de>
References: <20161009124625.23303-1-bernd.kuhls@t-online.de>
Message-ID: <20161009124625.23303-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for the upcoming python-mwscrape2slob package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: no changes
v3: initial version

 package/Config.in                    |  1 +
 package/python-slob/Config.in        | 17 +++++++++++++++++
 package/python-slob/python-slob.hash |  2 ++
 package/python-slob/python-slob.mk   | 13 +++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-slob/Config.in
 create mode 100644 package/python-slob/python-slob.hash
 create mode 100644 package/python-slob/python-slob.mk

diff --git a/package/Config.in b/package/Config.in
index 731c040..74f506c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -782,6 +782,7 @@ menu "External python modules"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-spidev/Config.in"
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
new file mode 100644
index 0000000..2c8ddb0
--- /dev/null
+++ b/package/python-slob/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_SLOB
+	bool "python-slob"
+	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYICU # runtime
+	# although optional, it is used as default compression
+	select BR2_PACKAGE_PYTHON3_XZ # runtime
+	help
+	  slob.py is a reference implementation of slob format reader
+	  and writer.
+
+	  https://github.com/itkach/slob
+
+comment "python-slob needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-slob/python-slob.hash b/package/python-slob/python-slob.hash
new file mode 100644
index 0000000..39d5d81
--- /dev/null
+++ b/package/python-slob/python-slob.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 18eb4f45d09d49b1f776cac52ea70ab951566c60cd30bbec39e88f10908fd8ff  python-slob-31ad0e769360a5b10a4893f686587bb8e48c3895.tar.gz
diff --git a/package/python-slob/python-slob.mk b/package/python-slob/python-slob.mk
new file mode 100644
index 0000000..474c0c9
--- /dev/null
+++ b/package/python-slob/python-slob.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-slob
+#
+################################################################################
+
+PYTHON_SLOB_VERSION = 31ad0e769360a5b10a4893f686587bb8e48c3895
+PYTHON_SLOB_SITE = $(call github,itkach,slob,$(PYTHON_SLOB_VERSION))
+PYTHON_SLOB_LICENSE = GPLv3
+PYTHON_SLOB_LICENSE_FILES = LICENSE
+PYTHON_SLOB_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.3
