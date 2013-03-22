From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 22 Mar 2013 23:55:47 +0100
Subject: [Buildroot] [PATCH v2] Enable ccache for cmake packages
In-Reply-To: <514CDE1E.8040107@lucaceresoli.net>
References: <514CDE1E.8040107@lucaceresoli.net>
Message-ID: <1363992947-21417-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the *_ARG1 CMake variables to let CMake use ccache without failing
in detecting the compiler.

Implementation based on an idea suggested by Samuel Martin.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

NOTE! This patch is not yet well tested and may be largely non-optimal.
Commit with care!

It was a bit tricky to implement, because the CMake-generated Makefiles
do call cmake without supplying the same commandline arguments that we
passed to the top-level cmake invocation.
The solution that I implemented for this issue is to use a tristate
variable, named USE_CCACHE, that Buildroot passes to cmake:
 - if set to ON, it triggers the configuration for ccache to be saved
   in the CMake cache;
 - if set to OFF, it triggers the no-ccache configuration to be saved
   in the CMake cache;
 - if it is not set, this means cmake is not being called directly by
   Buildroot; in this case it does not set any of the compiler CMake
   variables, thus using those previously cached.

Changed in v2:
 - totally reimplemented based on Samuel's suggestion;
 - added dependency on host-ccache for cmake packages if ccache is
   enabled.

 package/pkg-cmake.mk |   26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index b2fcd67..3d37502 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -20,6 +20,13 @@
 #
 ################################################################################
 
+# Options to CMake that are equal for all packages
+ifeq ($(BR2_CCACHE),y)
+CMAKE_EXTRA_OPT += -DUSE_CCACHE=ON
+else
+CMAKE_EXTRA_OPT += -DUSE_CCACHE=OFF
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -65,6 +72,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		$(CMAKE_EXTRA_OPT) \
 		-DCMAKE_VERBOSE_MAKEFILE=ON \
 		$$($$(PKG)_CONF_OPT) \
 	)
@@ -82,6 +90,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		$(CMAKE_EXTRA_OPT) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
@@ -94,6 +103,10 @@ $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix
 
 $(2)_DEPENDENCIES += host-cmake
 
+ifeq ($(BR2_CCACHE),y)
+$(2)_DEPENDENCIES += host-ccache
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -191,8 +204,17 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	@echo -en "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	if(DEFINED USE_CCACHE AND USE_CCACHE)\n\
+		set(CMAKE_ASM_COMPILER $(TARGET_CC_NOCCACHE))\n\
+		set(CMAKE_C_COMPILER $(CCACHE))\n\
+		set(CMAKE_CXX_COMPILER $(CCACHE))\n\
+		set(CMAKE_C_COMPILER_ARG1 $(TARGET_CC_NOCCACHE) CACHE STRING \"\" FORCE)\n\
+		set(CMAKE_CXX_COMPILER_ARG1 $(TARGET_CXX_NOCCACHE) CACHE STRING \"\" FORCE)\n\
+	endif(DEFINED USE_CCACHE AND USE_CCACHE)\n\
+	if(DEFINED USE_CCACHE AND NOT USE_CCACHE)\n\
+		set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
+		set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	endif(DEFINED USE_CCACHE AND NOT USE_CCACHE)\n\
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-- 
1.7.10.4
