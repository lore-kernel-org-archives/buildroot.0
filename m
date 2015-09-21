From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 21 Sep 2015 15:57:36 -0300
Subject: [Buildroot] [PATCH] pkg-cmake: change sed expression delimiter
Message-ID: <1442861856-31321-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Switch from : to # since CFLAGS can include :'s spilled in from
BR2_TARGET_OPTIMIZATION, for example:

BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
expression to fail thus breaking the build.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pkg-cmake.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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
-- 
2.4.9
