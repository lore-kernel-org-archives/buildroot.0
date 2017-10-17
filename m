From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Oct 2017 15:10:50 -0500
Subject: [Buildroot] [PATCH v2] uboot-tools: disable pylibfdt
Message-ID: <20171017201050.20888-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1) Removed the host system swig check which is proposed
for being fixed upstream in 2017.11 by making pylibfdt
selectable via KCONFIG.

http://u-boot.10912.n7.nabble.com/PATCH-v2-0-4-pylibfdt-compile-pylibfdt-in-scripts-dtc-pylibfdt-only-when-necessary-td309940.html

2) Removing the swig/python setup.py prevents the Python.h
error also causing build failures.  That bug was resolved in
2017.9.

http://git.denx.de/?p=u-boot.git;a=commitdiff;h=3809e30273e03d762595dbc2a62f3a8398281ec8

Fixes (one of many):
http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../0004-uboot-tools-disable-pylibfdt.patch        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch

diff --git a/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
new file mode 100644
index 0000000..1ac9bfb
--- /dev/null
+++ b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
@@ -0,0 +1,63 @@
+From d8b1755bafb678ea28d7c9115dfc6a894d18e74a Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Tue, 17 Oct 2017 14:55:09 -0500
+Subject: [PATCH] uboot-tools: disable pylibfdt
+
+1) Removed the host system swig check which is proposed
+for being fixed upstream in 2017.11 by making pylibfdt
+selectable via KCONFIG.
+
+2) Removing the swig/python setup.py prevents the Python.h
+error also causing build failures.  That bug was resolved in
+2017.9.
+
+Fixes (one of many):
+http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ tools/Makefile | 21 ---------------------
+ 1 file changed, 21 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 77706a9..00a5d36 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -122,23 +122,6 @@ mkimage-objs   := $(dumpimage-mkimage-objs) mkimage.o
+ fit_info-objs   := $(dumpimage-mkimage-objs) fit_info.o
+ fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
+ 
+-# Unfortunately setup.py (or actually the Python distutil implementation)
+-# puts files into the same directory as the .i file. We cannot touch the source
+-# directory, so we copy the .i file into the tools/ build subdirectory before
+-# calling setup. This directory is safe to write to. This ensures that we get
+-# all three files in $(obj)/tools: _libfdt.so, libfdt.py and libfdt_wrap.c
+-# The latter is a temporary file which we could actually remove.
+-tools/_libfdt.so: $(LIBFDT_SRCS) $(LIBFDT_SWIG)
+-	cp $(LIBFDT_SWIG) tools/.
+-	unset CC; \
+-	unset CROSS_COMPILE; \
+-	LDFLAGS="$(HOSTLDFLAGS)" CFLAGS= VERSION="u-boot-$(UBOOTVERSION)" \
+-		CPPFLAGS="$(_hostc_flags)" OBJDIR=tools \
+-		SOURCES="$(LIBFDT_SRCS) tools/libfdt.i" \
+-		SWIG_OPTS="-I$(srctree)/lib/libfdt -I$(srctree)/lib" \
+-		$(libfdt_tree)/pylibfdt/setup.py --quiet build_ext \
+-			--build-lib tools
+-
+ ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
+ # Add CONFIG_MXS into host CFLAGS, so we can check whether or not register
+ # the mxsimage support within tools/mxsimage.c .
+@@ -226,10 +209,6 @@ clean-dirs := lib common
+ 
+ always := $(hostprogs-y)
+ 
+-# Build a libfdt Python module if swig is available
+-# Use 'sudo apt-get install swig libpython-dev' to enable this
+-always += $(if $(shell which swig 2> /dev/null),_libfdt.so)
+-
+ # Generated LCD/video logo
+ LOGO_H = $(objtree)/include/bmp_logo.h
+ LOGO_DATA_H = $(objtree)/include/bmp_logo_data.h
+-- 
+1.8.3.1
+
-- 
1.8.3.1
