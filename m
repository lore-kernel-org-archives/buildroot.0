From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:50:45 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: add ccache support
	for host packages
Message-ID: <20141221215109.60F87805ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45ed9844bede86c4e452fe249a0f9a50a5c5710a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ccache support for host-cmake-package uses the same logic as the
one done for the target packages in the toolchainfile.cmake file.

[Thomas: fix lots of mistakes.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 231d0ba..1037513 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -20,6 +20,17 @@
 #
 ################################################################################
 
+# Set compiler variables.
+ifeq ($(BR2_CCACHE),y)
+CMAKE_HOST_C_COMPILER="$(HOST_DIR)/usr/bin/ccache"
+CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
+CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC_NOCCACHE)"
+CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX_NOCCACHE)"
+else
+CMAKE_HOST_C_COMPILER="$$(HOSTCC)"
+CMAKE_HOST_CXX_COMPILER="$$(HOSTCXX)"
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -95,6 +106,13 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
+		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
+		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
+		-DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
+		$(if $$(CMAKE_HOST_C_COMPILER_ARG1),\
+			-DCMAKE_C_COMPILER_ARG1="$$(CMAKE_HOST_C_COMPILER_ARG1)" \
+			-DCMAKE_CXX_COMPILER_ARG1="$$(CMAKE_HOST_CXX_COMPILER_ARG1)" \
+		) \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
