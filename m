From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:43 +0200
Subject: [Buildroot] [PATCH v3 07/14] pkg-cmake.mk: export the fortran
	compiler path in the CMake toolchain file
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-8-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the fortran support is conditional, only enable it when needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Benjamin Kamath <bkamath@spaceflight.com>

---
changes v1->v2:
- set CMAKE_Fortran_FLAGS in the toolchainfile.cmake (Benjamin K.)

changes v2->v3:
- none
---
 package/pkg-cmake.mk                | 3 +++
 support/misc/toolchainfile.cmake.in | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6f0ecf9..9291523 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -236,9 +236,12 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
 		-e 's#@@TARGET_CFLAGS@@#$(call qstrip,$(TARGET_CFLAGS))#' \
 		-e 's#@@TARGET_CXXFLAGS@@#$(call qstrip,$(TARGET_CXXFLAGS))#' \
+		-e 's#@@TARGET_FCFLAGS@@#$(call qstrip,$(TARGET_FCFLAGS))#' \
 		-e 's#@@TARGET_LDFLAGS@@#$(call qstrip,$(TARGET_LDFLAGS))#' \
 		-e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
 		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
+		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
 		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
+		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 5cf381e..e550b8f 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -29,3 +29,7 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 # This toolchain file can be used both inside and outside Buildroot.
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+if(@@TOOLCHAIN_HAS_FORTRAN@@)
+  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
+  set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+endif()
-- 
2.9.0
