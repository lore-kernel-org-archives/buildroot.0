From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  6 Oct 2011 11:15:46 +0200
Subject: [Buildroot] [PATCHv2] package: add the duma memory debugging library
Message-ID: <0531bbe91bfb489fd29c9fe994fb11d7b802eeb6.1317891858.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Changes from v1:
	When no C++ support disable it in the library itself
	Add '/usr' to the install prefix
	Use the standard TARGET_CONFIGURE_OPTS instead of open coding
	Adapt the cross compile patch to use CC_FOR_BUILD

 package/Config.in                            |    1 +
 package/duma/Config.in                       |   15 ++++++++++
 package/duma/duma-2_5_15-cross-compile.patch |   36 +++++++++++++++++++++++++
 package/duma/duma-2_5_15-separate-cpp.patch  |   23 ++++++++++++++++
 package/duma/duma.mk                         |   37 ++++++++++++++++++++++++++
 5 files changed, 112 insertions(+), 0 deletions(-)
 create mode 100644 package/duma/Config.in
 create mode 100644 package/duma/duma-2_5_15-cross-compile.patch
 create mode 100644 package/duma/duma-2_5_15-separate-cpp.patch
 create mode 100644 package/duma/duma.mk

diff --git a/package/Config.in b/package/Config.in
index 173e19d..de7d353 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -20,6 +20,7 @@ menu "Debugging, profiling and benchmark"
 source "package/bonnie/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dmalloc/Config.in"
+source "package/duma/Config.in"
 source "package/kexec/Config.in"
 source "package/lmbench/Config.in"
 source "package/lsof/Config.in"
diff --git a/package/duma/Config.in b/package/duma/Config.in
new file mode 100644
index 0000000..7f7a765
--- /dev/null
+++ b/package/duma/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DUMA
+	bool "duma"
+	help
+	  D.U.M.A. - Detect Unintended Memory Access. A fork of the Electric
+	  Fence library. Detects buffer overflow and underflow, and also memory
+	  leaks.
+
+	  http://duma.sourceforge.net
+
+if BR2_PACKAGE_DUMA
+
+config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
+	bool "disable memory leak detection"
+
+endif # BR2_PACKAGE_DUMA
diff --git a/package/duma/duma-2_5_15-cross-compile.patch b/package/duma/duma-2_5_15-cross-compile.patch
new file mode 100644
index 0000000..9c44c7f
--- /dev/null
+++ b/package/duma/duma-2_5_15-cross-compile.patch
@@ -0,0 +1,36 @@
+Allow cross compilation. Adapted from crosstool-ng.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -durN duma_2_5_15.orig/GNUmakefile duma_2_5_15/GNUmakefile
+--- duma_2_5_15.orig/GNUmakefile	2008-08-03 21:22:38.000000000 +0200
++++ duma_2_5_15/GNUmakefile	2009-06-19 15:32:23.000000000 +0200
+@@ -93,10 +93,6 @@
+ # also define 'WIN32'
+ 
+ # some defaults:
+-CC=gcc
+-CXX=g++
+-AR=ar
+-RANLIB=ranlib
+ INSTALL=install
+ RM=rm
+ RMFORCE=rm -f
+@@ -471,7 +467,7 @@
+ 
+ createconf$(EXEPOSTFIX): createconf.o
+ 	- $(RMFORCE) createconf$(EXEPOSTFIX)
+-	$(CC) $(CFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
++	$(CC_FOR_BUILD) $(HOSTCFLAGS) $(DUMA_OPTIONS) createconf.o -o createconf$(EXEPOSTFIX)
+ 
+ tstheap$(EXEPOSTFIX): libduma.a tstheap.o
+ 	- $(RMFORCE) tstheap$(EXEPOSTFIX)
+@@ -532,7 +528,7 @@
+ # define rules how to build objects for createconf
+ #
+ createconf.o:
+-	$(CC) $(CFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
++	$(CC_FOR_BUILD) $(HOSTCFLAGS) $(DUMA_OPTIONS) -c createconf.c -o $@
+ 
+ 
+ #
diff --git a/package/duma/duma-2_5_15-separate-cpp.patch b/package/duma/duma-2_5_15-separate-cpp.patch
new file mode 100644
index 0000000..ad10882
--- /dev/null
+++ b/package/duma/duma-2_5_15-separate-cpp.patch
@@ -0,0 +1,23 @@
+Allow build without C++ support. Taken from crosstool-ng.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -durN duma_2_5_15.orig/GNUmakefile duma_2_5_15/GNUmakefile
+--- duma_2_5_15.orig/GNUmakefile	2009-06-19 16:41:53.000000000 +0200
++++ duma_2_5_15/GNUmakefile	2009-06-19 16:43:53.000000000 +0200
+@@ -289,9 +289,13 @@
+ 	dumatest.c tstheap.c thread-test.c testmt.c dumatestpp.cpp testoperators.cpp \
+ 	createconf.c
+ 
+-OBJECTS=dumapp.o duma.o sem_inc.o print.o
++OBJECTS = duma.o sem_inc.o print.o
++SO_OBJECTS = duma_so.o sem_inc_so.o print_so.o
+ 
+-SO_OBJECTS=dumapp_so.o duma_so.o sem_inc_so.o print_so.o
++ifeq ($(DUMA_CPP),1)
++OBJECTS += dumapp.o
++SO_OBJECTS += dumapp_so.o
++endif
+ 
+ # Make all the top-level targets the makefile knows about.
+ all:	libduma.a tstheap$(EXEPOSTFIX) dumatest$(EXEPOSTFIX) thread-test$(EXEPOSTFIX) testmt$(EXEPOSTFIX) dumatestpp$(EXEPOSTFIX) testoperators$(EXEPOSTFIX) $(DUMA_DYN_DEPS)
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
new file mode 100644
index 0000000..1748e60
--- /dev/null
+++ b/package/duma/duma.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# duma
+#
+#############################################################
+DUMA_VERSION = 2_5_15
+DUMA_SOURCE = duma_$(DUMA_VERSION).tar.gz
+DUMA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/duma
+DUMA_INSTALL_STAGING = YES
+
+DUMA_OPTIONS = $(if $(BR2_PACKAGE_DUMA_NO_LEAKDETECTION), \
+			-DDUMA_LIB_NO_LEAKDETECTION)
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+DUMA_CPP = DUMA_CPP=1
+else
+DUMA_CPP =
+DUMA_OPTIONS += -DDUMA_SO_NO_CPP_SUPPORT -DDUMA_LIB_NO_CPP_SUPPORT
+endif
+
+# The dependency of some source files in duma_config.h, which is generated at 
+# build time, is not specified in the Makefile. Force non-parallel build.
+define DUMA_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS)		\
+		DUMA_OPTIONS=$(strip $(DUMA_OPTIONS))	\
+		$(DUMA_CPP) -C $(@D)
+endef
+
+define DUMA_INSTALL_STAGING_CMDS
+	$(MAKE) prefix=$(STAGING_DIR)/usr install -C $(@D)
+endef
+
+define DUMA_INSTALL_TARGET_CMDS
+	$(MAKE) prefix=$(TARGET_DIR)/usr install -C $(@D)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.6.3
