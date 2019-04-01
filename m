From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 1 Apr 2019 20:48:22 +0000
Subject: [Buildroot] [PATCH v2] toolchain-external: Fix paths in libstdc++
 gdb python file
Message-ID: <20190401204813.31424-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the ARM ARM 2018.11 toolchain, the python file
libstdc++.so.6.0.25-gdb.py contains two paths:
pythondir = '/share/gcc-8.2.1/python'
libdir = '/arm-linux-gnueabihf/lib'

The latter is the location of the file in the toolchain and the former
the location of a python module to be used by gdb.  The python code in
the file subtracts libdir from the end of the current
libstdc++.so.6.0.25-gdb.py location and appends pythondir, to find the
current path to the python module.

Buildroot installs this file into the stage, at which point the paths
above are no longer correct.

In the Linaro ARM 2018.05 toolchain, these paths absolute paths on the
toolchain's build host and not even current before buildroot moves the
py file.

This patch uses sed to fixup the paths to reflect the installed
location, relative to HOST_DIR, and the location of the python module
relative to HOST_DIR.

External toolchains can have this fixup invoked by setting
$(PKG)_LIBSTDCPP_GDB_PY and $(PKG)_PYTHON_DIR.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk        | 11 +++++++++++
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk  |  4 ++++
 .../toolchain-external-linaro-arm.mk                          |  4 ++++
 3 files changed, 19 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d96f..e900507ddc 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -486,6 +486,16 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	fi
 endef
 
+define TOOLCHAIN_EXTERNAL_FIXUP_LIBSTDCPP_PYTHON
+	$(Q)if [ -n "$($(PKG)_LIBSTDCPP_GDB_PY)" ]; then \
+		echo Fixing paths in $($(PKG)_LIBSTDCPP_GDB_PY); \
+		sed -Ei \
+			-e "s:^(pythondir = ').*':\1$(patsubst $(HOST_DIR)/%,/%,$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR))$($(PKG)_PYTHON_DIR)':" \
+			-e "s:^(libdir = ').*':\1$(patsubst $(HOST_DIR)/%,/%,$(STAGING_DIR)/usr/lib)':" \
+			$(STAGING_DIR)/usr/lib/$($(PKG)_LIBSTDCPP_GDB_PY); \
+	fi
+endef
+
 
 ################################################################################
 # inner-toolchain-external-package -- defines the generic installation rules
@@ -562,6 +572,7 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$$(TOOLCHAIN_EXTERNAL_FIXUP_LIBSTDCPP_PYTHON)
 endef
 
 # Even though we're installing things in both the staging, the host
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 0c21affd7b..4d9e27e7e1 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -9,4 +9,8 @@ TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downlo
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
 
+# Fix up paths in python file so they points at the PYTHON_DIR
+TOOLCHAIN_EXTERNAL_ARM_ARM_LIBSTDCPP_GDB_PY = libstdc++.so.6.0.25-gdb.py
+TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR = /share/gcc-8.2.1/python
+
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index fda356bcea..77afc6d30f 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -13,4 +13,8 @@ else
 TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 
+# Fix up paths in python file so they points at the PYTHON_DIR
+TOOLCHAIN_EXTERNAL_LINARO_ARM_LIBSTDCPP_GDB_PY = libstdc++.so.6.0.24-gdb.py
+TOOLCHAIN_EXTERNAL_LINARO_ARM_PYTHON_DIR = /share/gcc-7.3.1/python
+
 $(eval $(toolchain-external-package))
-- 
2.14.5
