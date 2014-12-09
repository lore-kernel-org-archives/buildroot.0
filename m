From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 23:00:12 +0100
Subject: [Buildroot] [git commit] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
Message-ID: <20141209220148.29DFD80168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1e41153e662c7d49d7e0d1bf5e7a953d784f849
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is rarely needed by packages, but convenient to have when it is.

[Thomas:
  - don't define ARM_VARIANT as this name is too global, use
    CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT instead.
  - don't use ifndef, but a more traditional else clause, for the
    non-ARM cases.]

Signed-off-by: Volker Krause <volker.krause@kdab.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk                |   20 ++++++++++++++++++++
 support/misc/toolchainfile.cmake.in |    1 +
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c8735ef..2088f15 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -180,6 +180,25 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 # Generation of the CMake toolchain file
 ################################################################################
 
+# CMAKE_SYSTEM_PROCESSOR should match uname -m
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
+CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv4
+else ifeq ($(BR2_ARM_CPU_ARMV5),y)
+CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv5
+else ifeq ($(BR2_ARM_CPU_ARMV6),y)
+CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv6
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv7
+endif
+
+ifeq ($(BR2_arm),y)
+CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)l
+else ifeq ($(BR2_armeb),y)
+CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSORARM_VARIANT)b
+else
+CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
+endif
+
 # In order to allow the toolchain to be relocated, we calculate the HOST_DIR
 # based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
 # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
@@ -193,5 +212,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
 		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
 		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
+		-e 's:@@CMAKE_SYSTEM_PROCESSOR@@:$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR)):' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 4ca3d35..816af13 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -11,6 +11,7 @@
 string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
 
 set(CMAKE_SYSTEM_NAME Linux)
+set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
