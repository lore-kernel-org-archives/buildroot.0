From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  6 Dec 2016 14:26:43 +0100
Subject: [Buildroot] [PATCH] package/reactcpp: new package
Message-ID: <20161206132643.27141-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in                                  |  1 +
 ...akefile-Cleanup-compiler-and-linker-flags.patch | 82 ++++++++++++++++++++++
 package/reactcpp/Config.in                         | 14 ++++
 package/reactcpp/reactcpp.hash                     |  2 +
 package/reactcpp/reactcpp.mk                       | 34 +++++++++
 5 files changed, 133 insertions(+)
 create mode 100644 package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch
 create mode 100644 package/reactcpp/Config.in
 create mode 100644 package/reactcpp/reactcpp.hash
 create mode 100644 package/reactcpp/reactcpp.mk

diff --git a/package/Config.in b/package/Config.in
index 664d0d9..27debdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1355,6 +1355,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/reactcpp/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
diff --git a/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch b/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch
new file mode 100644
index 0000000..a0b065a
--- /dev/null
+++ b/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch
@@ -0,0 +1,82 @@
+From 583b934dbd712e661e7c4eb994174bf71d88690c Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Tue, 15 Nov 2016 14:51:47 +0100
+Subject: [PATCH] Makefile: Cleanup compiler and linker flags
+
+Cleanup compiler and linker flags, so the library can be easily
+cross-compiled by overwriting CPPFLAGS, CXXFLAGS and LDFLAGS:
+
+* Rename CPP into CXX, as we use this command for compiling, not
+  preprocessing.
+* Remove separate LD usage, use CXX instead. This is to still launch
+  compiler command when user overrides CXX and LD commands.
+* Define MY_CXXFLAGS and MY_LDFLAGS, which should always take place and
+  not get overridden by user.
+* Define AR command, which can be overidden by user.
+---
+ src/Makefile | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 54e938a..5fb9763 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1,8 +1,8 @@
+-CPP		= g++
++AR		= ar
++CXX		= g++
+ RM		= rm -f
+-CPPFLAGS	= -Wall -MMD -c -I. -std=c++11
+-LD		= g++
+-LD_FLAGS	= -Wall -shared
++MY_CXXFLAGS	= -Wall -MMD -c -I. -std=c++11
++MY_LDFLAGS	= -Wall -shared
+ SHARED_LIB	= lib$(LIBRARY_NAME).so.$(VERSION)
+ STATIC_LIB	= lib$(LIBRARY_NAME).a.$(VERSION)
+ STATIC_FPIC_LIB = lib$(LIBRARY_NAME)_fpic.a
+@@ -11,12 +11,12 @@ DEPENDENCIES    = $(SOURCES:%.cpp=%.d)
+ SHARED_OBJECTS	= $(SOURCES:%.cpp=%.o)
+ STATIC_OBJECTS	= $(SOURCES:%.cpp=%.s.o)
+ 
+-all:	CPPFLAGS += -g
+-all:	LD_FLAGS += -g
++all:	CXXFLAGS = -g
++all:	LDFLAGS = -g
+ all:	shared static
+ 
+-release:	CPPFLAGS += -O2
+-release:	LD_FLAGS += -O2
++release:	CXXFLAGS = -O2
++release:	LDFLAGS = -O2
+ release:	shared static
+ 
+ -include ${DEPENDENCIES}
+@@ -28,20 +28,20 @@ static_fpic: ${SHARED_OBJECTS} ${STATIC_FPIC_LIB}
+ static:	${STATIC_OBJECTS} ${STATIC_LIB}
+ 
+ ${SHARED_LIB}: ${SHARED_OBJECTS}
+-	${LD} ${LD_FLAGS} -Wl,-soname,lib$(LIBRARY_NAME).so.$(SONAME) -o $@ ${SHARED_OBJECTS} -lev -lcares
++	${CXX} ${MY_LDFLAGS} ${LDFLAGS} -Wl,-soname,lib$(LIBRARY_NAME).so.$(SONAME) -o $@ ${SHARED_OBJECTS} -lev -lcares
+ 
+ ${STATIC_LIB}: ${STATIC_OBJECTS}
+-	ar rcs ${STATIC_LIB} ${STATIC_OBJECTS}
++	$(AR) rcs ${STATIC_LIB} ${STATIC_OBJECTS}
+ 
+ ${STATIC_FPIC_LIB}: ${SHARED_OBJECTS}
+-	ar rcs ${STATIC_FPIC_LIB} ${SHARED_OBJECTS}
++	$(AR) rcs ${STATIC_FPIC_LIB} ${SHARED_OBJECTS}
+ 
+ clean:
+ 	${RM} *.obj *~* ${SHARED_OBJECTS} ${STATIC_OBJECTS} ${SHARED_LIB} ${STATIC_LIB}
+ 
+ ${SHARED_OBJECTS}:
+-	${CPP} ${CPPFLAGS} -fpic -o $@ ${@:%.o=%.cpp}
++	${CXX} ${CXXFLAGS} ${CPPFLAGS} ${MY_CXXFLAGS} -fpic -o $@ ${@:%.o=%.cpp}
+ 
+ ${STATIC_OBJECTS}:
+-	${CPP} ${CPPFLAGS} -o $@ ${@:%.s.o=%.cpp}
++	${CXX} ${CXXFLAGS} ${CPPFLAGS} ${MY_CXXFLAGS} -o $@ ${@:%.s.o=%.cpp}
+ 
+-- 
+2.10.2
+
diff --git a/package/reactcpp/Config.in b/package/reactcpp/Config.in
new file mode 100644
index 0000000..f6989e5
--- /dev/null
+++ b/package/reactcpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_REACTCPP
+	bool "reactcpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBEV
+	help
+	  REACT-CPP is an event loop library that utilizes the new
+	  C++11 lambda functions to notify you when there is activity
+	  on a filedescriptor or on a timer. Internally, it is a wrapper
+	  around the libev library, and does therefore also depend on
+	  that library.
+
+	  https://github.com/CopernicaMarketingSoftware/REACT-CPP
diff --git a/package/reactcpp/reactcpp.hash b/package/reactcpp/reactcpp.hash
new file mode 100644
index 0000000..c30dab6
--- /dev/null
+++ b/package/reactcpp/reactcpp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4af5d6a535ff7d8835d05db3490f2b62d6d791a4968ab45f479023868d7acdc8  reactcpp-v1.0.3.tar.gz
diff --git a/package/reactcpp/reactcpp.mk b/package/reactcpp/reactcpp.mk
new file mode 100644
index 0000000..e198c3d
--- /dev/null
+++ b/package/reactcpp/reactcpp.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# reactcpp
+#
+################################################################################
+
+REACTCPP_VERSION_MAJOR = 1.0
+REACTCPP_VERSION_RAW = $(REACTCPP_VERSION_MAJOR).3
+REACTCPP_VERSION = v$(REACTCPP_VERSION_RAW)
+REACTCPP_SITE = $(call github,CopernicaMarketingSoftware,REACT-CPP,$(REACTCPP_VERSION))
+REACTCPP_LICENSE = Apache-2.0
+REACTCPP_LICENSE_FILES = LICENSE
+REACTCPP_DEPENDENCIES = c-ares libev
+REACTCPP_INSTALL_STAGING = YES
+
+define REACTCPP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define REACTCPP_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+endef
+
+REACTCPP_SO = libreactcpp.so.$(REACTCPP_VERSION_RAW)
+
+ifeq ($(BR2_STATIC_LIBS),)
+define REACTCPP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/$(REACTCPP_SO) $(TARGET_DIR)/usr/lib/$(REACTCPP_SO)
+	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so.$(REACTCPP_VERSION_MAJOR)
+	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.10.2
