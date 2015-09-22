From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 16:23:23 +0200
Subject: [Buildroot] [git commit] pkg-cmake: change sed expression delimiter
Message-ID: <20150922142700.168328193B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d90b1d74cb78f5668d49fe8262290eaff1d61a1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from : to # since CFLAGS can include :'s spilled in from
BR2_TARGET_OPTIMIZATION, for example:

BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
expression to fail thus breaking the build.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 574eccc..6bc13d4 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -241,12 +241,12 @@ endif
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	sed \
-		-e 's:@@STAGING_SUBDIR@@:$(call qstrip,$(STAGING_SUBDIR)):' \
-		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
-		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
-		-e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
-		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
-		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
-		-e 's:@@CMAKE_SYSTEM_PROCESSOR@@:$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR)):' \
+		-e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
+		-e 's#@@TARGET_CFLAGS@@#$(call qstrip,$(TARGET_CFLAGS))#' \
+		-e 's#@@TARGET_CXXFLAGS@@#$(call qstrip,$(TARGET_CXXFLAGS))#' \
+		-e 's#@@TARGET_LDFLAGS@@#$(call qstrip,$(TARGET_LDFLAGS))#' \
+		-e 's#@@TARGET_CC_NOCCACHE@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE)))#' \
+		-e 's#@@TARGET_CXX_NOCCACHE@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE)))#' \
+		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
