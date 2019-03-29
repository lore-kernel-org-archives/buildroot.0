From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 29 Mar 2019 22:04:56 +0000
Subject: [Buildroot] [PATCH] toolchain-external: Fix paths in libstdc++ gdb
 python file
Message-ID: <20190329220445.22941-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python file libstdc++.so.6.0.25-gdb.py contains two paths:
pythondir = '/share/gcc-8.2.1/python'
libdir = '/arm-linux-gnueabihf/lib'

The latter is the location of the file in the toolchain and the former
the location of a python module to be used by gdb.  The python code in
the file subtracts libdir from the end of the current
libstdc++.so.6.0.25-gdb.py location and appends pythondir, to find the
current path to the python module.

Buildroot installs this file into the stage, at which point the paths
above are no longer correct.

This patch uses sed to fixup the paths to reflect the installed
location, relative to HOST_DIR, and the location of the python module
relative to HOST_DIR.

and

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 .../toolchain-external-arm-arm.mk                        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 0c21affd7b..040ad3a780 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -9,4 +9,20 @@ TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downlo
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
 
+TOOLCHAIN_EXTERNAL_ARM_ARM_LIBSTDCPP_GDB_PY = libstdc++.so.6.0.25-gdb.py
+TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR = /share/gcc-8.2.1/python
+
+# LIBSTDCPP_GDB_PY contains embedded paths that are used by gdb to find
+# PYTHON_DIR using the location of LIBSTDCPP_GDB_PY.  They need to be adjusted
+# to reflect LIBSTDCPP_GDB_PY's new location in STAGING_DIR.
+define TOOLCHAIN_EXTERNAL_ARM_ARM_FIXUP_LIBSTDCPP_PYTHON
+	@echo Fixing paths in $(TOOLCHAIN_EXTERNAL_ARM_ARM_LIBSTDCPP_GDB_PY)
+	sed -Ei \
+		-e "s:'($(TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR)):$(patsubst $(HOST_DIR)/%,/%,'$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR))\1:" \
+		-e "s:'/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib:'$(patsubst $(HOST_DIR)/%,/%,$(STAGING_DIR)/usr/lib):" \
+		$(STAGING_DIR)/usr/lib/$(TOOLCHAIN_EXTERNAL_ARM_ARM_LIBSTDCPP_GDB_PY)
+endef
+
+TOOLCHAIN_EXTERNAL_ARM_ARM_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_ARM_ARM_FIXUP_LIBSTDCPP_PYTHON
+
 $(eval $(toolchain-external-package))
-- 
2.14.5
