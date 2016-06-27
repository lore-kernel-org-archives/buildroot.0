From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:07:29 +0100
Subject: [Buildroot] [PATCH 03/13] pkg-cmake.mk: export the fortran compiler
	path in the CMake toolchain file
In-Reply-To: <1467040059-38085-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040059-38085-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040059-38085-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Since the fortran support is conditional, only enable it when needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pkg-cmake.mk                | 2 ++
 support/misc/toolchainfile.cmake.in | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..d30b66b 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -246,6 +246,8 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's#@@TARGET_LDFLAGS@@#$(call qstrip,$(TARGET_LDFLAGS))#' \
 		-e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
 		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
+		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
 		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
+		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 5cf381e..ac81e9a 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -29,3 +29,6 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 # This toolchain file can be used both inside and outside Buildroot.
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+if(@@TOOLCHAIN_HAS_FORTRAN@@)
+  set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+endif()
-- 
2.7.3
