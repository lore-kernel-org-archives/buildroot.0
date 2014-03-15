From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Sat, 15 Mar 2014 17:00:30 -0500
Subject: [Buildroot] [PATCH v3] pyrex: new package
Message-ID: <1394920830-12708-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <mlweber1@rockwellcollins.com>

Pyrex is a language that allows you to mix python and C code in a
single .pyx description file.  This file is then rendered into C
code by the pyrexc host tool.  That C file then can be used within
an application build or as part of the normal distutils build
process used to build a Python extension module.  In my use case,
I was using buildroot to build a python extension module.

I will be submitting the pypcap package as the application that uses
this tool to generate an extension module for the libpcap library.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v2 -> v3:
   - Moved menu entry under host utilities menu (Suggested by Yann)
   - Updated description and included a description above (Suggested by Yann)

Changes v1 -> v2:
   - Converted to a host only pkg as this pkg provides generated
     C code that an application would use from a sysroot
     (not on target).  (Suggested by Thomas)
---
 package/Config.in.host               |    1 +
 package/python-pyrex/Config.in.host  |   10 ++++++++++
 package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/python-pyrex/Config.in.host
 create mode 100644 package/python-pyrex/python-pyrex.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index ac6091f..b8706cd 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
+source "package/python-pyrex/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/squashfs/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
diff --git a/package/python-pyrex/Config.in.host b/package/python-pyrex/Config.in.host
new file mode 100644
index 0000000..4edeb38
--- /dev/null
+++ b/package/python-pyrex/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_PYTHON_PYREX
+	bool "python-pyrex"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Pyrex is a language for writing mixed Python and C
+	  extension modules.  This tool is invoked as part of
+	  the build process to generate C code from a .pyx
+	  description file.
+
+	  http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
new file mode 100644
index 0000000..73cb163
--- /dev/null
+++ b/package/python-pyrex/python-pyrex.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyrex
+#
+################################################################################
+
+PYTHON_PYREX_VERSION = 0.9.9
+PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
+PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
+PYTHON_PYREX_DEPENDENCIES = host-python
+PYTHON_PYREX_LICENSE = Apache-v2
+PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
+PYTHON_PYREX_SETUP_TYPE = distutils
+
+$(eval $(host-python-package))
-- 
1.7.9.5
