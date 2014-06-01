From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:11:38 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: refactor the
	toolchainfile.cmake generation
Message-ID: <20140601202128.271949CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85fea5d9538e8ea1d1f83c7aa517ffebff7a4f1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces a toolchainfile.cmake.in template which is filled
by Buildroot.

Using a toolchainfile.cmake.in template file allows to avoid overloading
quoting and/or escaping and it becomes much more similar to the
resulting file.

This patch also cleans up the quoting style.

[Peter: drop stdin redirect as suggested by Thomas]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk                |   23 +++++++++--------------
 support/misc/toolchainfile.cmake.in |   20 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index edda14a..ca56b48 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -160,17 +160,12 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
-	@printf "\
-	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
-	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
-	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
-	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
-	" > $@
+	sed \
+		-e 's:@@HOST_DIR@@:$(call qstrip,$(HOST_DIR)):' \
+		-e 's:@@STAGING_DIR@@:$(call qstrip,$(STAGING_DIR)):' \
+		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
+		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
+		-e 's:@@TARGET_CC_NOCCACHE@@:$(call qstrip,$(TARGET_CC_NOCCACHE)):' \
+		-e 's:@@TARGET_CXX_NOCCACHE@@:$(call qstrip,$(TARGET_CXX_NOCCACHE)):' \
+		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
+		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
new file mode 100644
index 0000000..e8cc378
--- /dev/null
+++ b/support/misc/toolchainfile.cmake.in
@@ -0,0 +1,20 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# CMake toolchain file for Buildroot
+#
+
+set(CMAKE_SYSTEM_NAME Linux)
+
+set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS" FORCE)
+set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS" FORCE)
+set(CMAKE_INSTALL_SO_NO_EXE 0)
+
+set(CMAKE_PROGRAM_PATH "@@HOST_DIR@@/usr/bin")
+set(CMAKE_FIND_ROOT_PATH "@@STAGING_DIR@@")
+set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
+set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+set(ENV{PKG_CONFIG_SYSROOT_DIR} "@@STAGING_DIR@@")
+
+set(CMAKE_C_COMPILER "@@TARGET_CC_NOCCACHE@@")
+set(CMAKE_CXX_COMPILER "@@TARGET_CXX_NOCCACHE@@")
