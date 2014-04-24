From: Martin Bark <martin@barkynet.com>
Date: Thu, 24 Apr 2014 22:19:42 +0100
Subject: [Buildroot] [PATCH 1/3] ladspa-sdk: new package
Message-ID: <1398374384-8814-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LADSPA is a standard that allows software audio processors and
effects to be plugged into a wide range of audio synthesis and
recording packages.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/Config.in                                  |    1 +
 package/ladspa-sdk/Config.in                       |    8 +++++
 .../ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch    |   18 ++++++++++
 .../ladspa-sdk-02-default-ladspa-path.patch        |   30 ++++++++++++++++
 .../ladspa-sdk-04-fix-linkage-C-plugins.diff       |   23 ++++++++++++
 .../ladspa-sdk/ladspa-sdk-05-linking-order.patch   |   37 ++++++++++++++++++++
 .../ladspa-sdk-06-cross-compile-fix.patch          |   35 ++++++++++++++++++
 package/ladspa-sdk/ladspa-sdk.mk                   |   27 ++++++++++++++
 8 files changed, 179 insertions(+)
 create mode 100644 package/ladspa-sdk/Config.in
 create mode 100644 package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch
 create mode 100644 package/ladspa-sdk/ladspa-sdk-02-default-ladspa-path.patch
 create mode 100644 package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff
 create mode 100644 package/ladspa-sdk/ladspa-sdk-05-linking-order.patch
 create mode 100644 package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch
 create mode 100644 package/ladspa-sdk/ladspa-sdk.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..5956154 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,6 +493,7 @@ source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
 source "package/fdk-aac/Config.in"
+source "package/ladspa-sdk/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcdio/Config.in"
diff --git a/package/ladspa-sdk/Config.in b/package/ladspa-sdk/Config.in
new file mode 100644
index 0000000..ec3d568
--- /dev/null
+++ b/package/ladspa-sdk/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LADSPA_SDK
+	bool "ladspa-sdk"
+	help
+	  LADSPA is a standard that allows software audio processors and
+	  effects to be plugged into a wide range of audio synthesis and
+	  recording packages.
+
+	  http://www.ladspa.org/
diff --git a/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch b/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch
new file mode 100644
index 0000000..d424594
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch
@@ -0,0 +1,18 @@
+Use mkdir -p instead of mkdirhier to avoid build-dep on xutils-dev
+Index: ladspa-sdk/src/makefile
+===================================================================
+--- ladspa-sdk.orig/src/makefile	2009-06-05 14:49:37.000000000 +1000
++++ ladspa-sdk/src/makefile	2009-06-05 14:50:07.000000000 +1000
+@@ -59,9 +59,9 @@
+ 	@echo Test complete.
+ 
+ install:	targets
+-	-mkdirhier $(INSTALL_PLUGINS_DIR)
+-	-mkdirhier $(INSTALL_INCLUDE_DIR)
+-	-mkdirhier $(INSTALL_BINARY_DIR)
++	-mkdir -p $(INSTALL_PLUGINS_DIR)
++	-mkdir -p $(INSTALL_INCLUDE_DIR)
++	-mkdir -p $(INSTALL_BINARY_DIR)
+ 	cp ../plugins/* $(INSTALL_PLUGINS_DIR)
+ 	cp ladspa.h $(INSTALL_INCLUDE_DIR)
+ 	cp ../bin/* $(INSTALL_BINARY_DIR)
diff --git a/package/ladspa-sdk/ladspa-sdk-02-default-ladspa-path.patch b/package/ladspa-sdk/ladspa-sdk-02-default-ladspa-path.patch
new file mode 100644
index 0000000..05f5122
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk-02-default-ladspa-path.patch
@@ -0,0 +1,30 @@
+Use a default ladspa path instead of failing when LADSPA_PATH is undefined
+Index: ladspa-sdk/src/load.c
+===================================================================
+--- ladspa-sdk.orig/src/load.c	2009-06-05 14:52:05.000000000 +1000
++++ ladspa-sdk/src/load.c	2009-06-05 14:54:04.000000000 +1000
+@@ -54,6 +54,8 @@
+        to search. */
+ 
+     pcLADSPAPath = getenv("LADSPA_PATH");
++    if (!pcLADSPAPath)
++      pcLADSPAPath = "/usr/lib/ladspa";
+     
+     if (pcLADSPAPath) {
+ 
+Index: ladspa-sdk/src/search.c
+===================================================================
+--- ladspa-sdk.orig/src/search.c	2009-06-05 14:52:05.000000000 +1000
++++ ladspa-sdk/src/search.c	2009-06-05 14:52:57.000000000 +1000
+@@ -99,10 +99,10 @@
+ 
+   pcLADSPAPath = getenv("LADSPA_PATH");
+   if (!pcLADSPAPath) {
++    pcLADSPAPath = "/usr/lib/ladspa/";
+     fprintf(stderr,
+ 	    "Warning: You do not have a LADSPA_PATH "
+ 	    "environment variable set.\n");
+-    return;
+   }
+   
+   pcStart = pcLADSPAPath;
diff --git a/package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff b/package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff
new file mode 100644
index 0000000..5934f75
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff
@@ -0,0 +1,23 @@
+LD does not automatically insert needed libraries, we must specify them
+Index: ladspa-sdk/src/makefile
+===================================================================
+--- ladspa-sdk.orig/src/makefile	2009-11-03 20:36:21.000000000 -0300
++++ ladspa-sdk/src/makefile	2009-11-03 20:37:25.000000000 -0300
+@@ -14,7 +14,7 @@
+ #
+ 
+ INCLUDES	=	-I.
+-LIBRARIES	=	-ldl -lm
++LIBRARIES	=	-ldl -lm -lc
+ CFLAGS		=	$(INCLUDES) -Wall -Werror -O2 -fPIC
+ CXXFLAGS	=	$(CFLAGS)
+ PLUGINS		=	../plugins/amp.so				\
+@@ -35,7 +35,7 @@
+ 
+ ../plugins/%.so:	plugins/%.c ladspa.h
+ 	$(CC) $(CFLAGS) -o plugins/$*.o -c plugins/$*.c
+-	$(LD) -o ../plugins/$*.so plugins/$*.o -shared
++	$(LD) -o ../plugins/$*.so plugins/$*.o -shared $(LIBRARIES)
+ 
+ ../plugins/%.so:	plugins/%.cpp ladspa.h
+ 	$(CPP) $(CXXFLAGS) -o plugins/$*.o -c plugins/$*.cpp
diff --git a/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch b/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch
new file mode 100644
index 0000000..a66def7
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch
@@ -0,0 +1,37 @@
+Description: Correct linking order to prevent FTBFS with GCC4.5 + binutils-gold.
+Author: Alessio Treglia <quadrispro@ubuntu.com>
+---
+ src/makefile |   15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+--- ladspa-sdk-1.13.orig/src/makefile
++++ ladspa-sdk-1.13/src/makefile
+@@ -90,19 +90,22 @@ targets:	$(PLUGINS) $(PROGRAMS)
+ #
+ 
+ ../bin/applyplugin:	applyplugin.o load.o default.o
+-	$(CC) $(CFLAGS) $(LIBRARIES)					\
++	$(CC) $(CFLAGS)					\
+ 		-o ../bin/applyplugin					\
+-		applyplugin.o load.o default.o
++		applyplugin.o load.o default.o \
++		$(LIBRARIES)
+ 
+ ../bin/analyseplugin:	analyseplugin.o load.o default.o
+-	$(CC) $(CFLAGS) $(LIBRARIES)					\
++	$(CC) $(CFLAGS)					\
+ 		-o ../bin/analyseplugin 				\
+-		analyseplugin.o load.o default.o
++		analyseplugin.o load.o default.o \
++		$(LIBRARIES)
+ 
+ ../bin/listplugins:	listplugins.o search.o
+-	$(CC) $(CFLAGS) $(LIBRARIES)					\
++	$(CC) $(CFLAGS)					\
+ 		-o ../bin/listplugins	 				\
+-		listplugins.o search.o
++		listplugins.o search.o \
++		$(LIBRARIES)
+ 
+ ###############################################################################
+ #
diff --git a/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch b/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch
new file mode 100644
index 0000000..549b6eb
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch
@@ -0,0 +1,35 @@
+--- ladspa-sdk-1.13.original/src/makefile	2014-04-24 19:59:18.151359520 +0100
++++ ladspa-sdk-1.13/src/makefile	2014-04-24 20:01:42.820770007 +0100
+@@ -15,8 +15,8 @@
+ 
+ INCLUDES	=	-I.
+ LIBRARIES	=	-ldl -lm
+-CFLAGS		=	$(INCLUDES) -Wall -Werror -O3 -fPIC
+-CXXFLAGS	=	$(CFLAGS)
++CFLAGS		+=	$(INCLUDES) -Wall -fPIC
++CXXFLAGS	+=	$(CFLAGS)
+ PLUGINS		=	../plugins/amp.so				\
+ 			../plugins/delay.so				\
+ 			../plugins/filter.so				\
+@@ -25,8 +25,8 @@
+ PROGRAMS	=	../bin/analyseplugin				\
+ 			../bin/applyplugin 				\
+ 			../bin/listplugins
+-CC		=	cc
+-CPP		=	c++
++CC		?=	cc
++CXX		?=	c++
+ 
+ ###############################################################################
+ #
+@@ -38,8 +38,8 @@
+ 	$(LD) -o ../plugins/$*.so plugins/$*.o -shared
+ 
+ ../plugins/%.so:	plugins/%.cpp ladspa.h
+-	$(CPP) $(CXXFLAGS) -o plugins/$*.o -c plugins/$*.cpp
+-	$(CPP) -o ../plugins/$*.so plugins/$*.o -shared
++	$(CXX) $(CXXFLAGS) -o plugins/$*.o -c plugins/$*.cpp
++	$(CXX) -o ../plugins/$*.so plugins/$*.o -shared
+ 
+ ###############################################################################
+ #
diff --git a/package/ladspa-sdk/ladspa-sdk.mk b/package/ladspa-sdk/ladspa-sdk.mk
new file mode 100644
index 0000000..f6f4cf0
--- /dev/null
+++ b/package/ladspa-sdk/ladspa-sdk.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# ladspa-sdk
+#
+################################################################################
+
+LADSPA_SDK_VERSION = 1.13
+LADSPA_SDK_SOURCE = ladspa_sdk_$(LADSPA_SDK_VERSION).tgz
+LADSPA_SDK_SITE = http://www.ladspa.org/download/
+LADSPA_SDK_LICENSE = LGPLv2.1+
+LADSPA_SDK_LICENSE_FILES = doc/COPYING
+LADSPA_SDK_INSTALL_STAGING = YES
+
+define LADSPA_SDK_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src targets
+endef
+
+define LADSPA_SDK_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/plugins/*.so $(TARGET_DIR)/usr/lib/ladspa/.
+	$(INSTALL) -D -m 0755 $(@D)/bin/* $(TARGET_DIR)/usr/bin/.
+endef
+
+define LADSPA_SDK_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/src/ladspa.h $(STAGING_DIR)/usr/include/.
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
