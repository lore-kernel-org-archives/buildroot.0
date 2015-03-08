From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  8 Mar 2015 10:47:23 +0100
Subject: [Buildroot] [PATCH 4/4] toolchainfile.cmake: set CXX variables wrt
	BR2_INSTALL_LIBSTDCPP value
In-Reply-To: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1425808043-32292-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk                |  1 +
 support/misc/toolchainfile.cmake.in | 33 +++++++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2404c40..c6b9eff 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -231,6 +231,7 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	sed \
 		-e 's:@@STAGING_SUBDIR@@:$(call qstrip,$(STAGING_SUBDIR)):' \
+		-e 's:@@TARGET_HAS_LIBSTDCXX@@:$(if $(BR2_INSTALL_LIBSTDCPP),TRUE,FALSE):' \
 		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
 		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
 		-e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index cd41254..395cf3f 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -17,6 +17,7 @@ set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot C
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
 set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
 set(CMAKE_INSTALL_SO_NO_EXE 0)
+set(TARGET_HAS_LIBSTDCXX @@TARGET_HAS_LIBSTDCXX@@)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
 set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
@@ -35,25 +36,45 @@ if(DEFINED USE_CCACHE)
 	if(USE_CCACHE)
 		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
 		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
 		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		if(TARGET_HAS_LIBSTDCXX)
+			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/usr/bin/ccache")
+			set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		else()
+			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
+			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
+		endif()
 	else()
 		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		if(TARGET_HAS_LIBSTDCXX)
+			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		else()
+			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
+			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
+		endif()
 	endif()
 else()
 	find_program(CCACHE ccache HINTS "${RELOCATED_HOST_DIR}/usr/bin")
 	if(CCACHE)
 		set(CMAKE_ASM_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
 		set(CMAKE_C_COMPILER "${CCACHE}")
-		set(CMAKE_CXX_COMPILER "${CCACHE}")
 		set(CMAKE_C_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		if(TARGET_HAS_LIBSTDCXX)
+			set(CMAKE_CXX_COMPILER "${CCACHE}")
+			set(CMAKE_CXX_COMPILER_ARG1 "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		else()
+			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
+			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
+		endif()
 		message(STATUS "ccache program has been found and will be used for the build.")
 		message(STATUS "  To disable ccache, add -DUSE_CCACHE=OFF on the cmake command line.")
 	else()
 		set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
-		set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		if(TARGET_HAS_LIBSTDCXX)
+			set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
+		else()
+			message(STATUS "Disabling C++ compiler because libstdc++ is not installed in the target filsystem")
+			set(CMAKE_CXX_COMPILER "CMAKE_CXX_COMPILER-NOTFOUND")
+		endif()
 	endif()
 endif()
-- 
2.3.2
