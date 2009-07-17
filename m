From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:05:27 +0200
Subject: [Buildroot] [PATCH 1/1] external toolchain: add $(HOST_DIR)/bin to
	TARGET_PATH
In-Reply-To: <cover.1247846723.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846723.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b5d6f341c5196e9fdc86e29571c5cdae060b47a9.1247846723.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the move of many host binaries to $(HOST_DIR), the TARGET_PATH
for internal toolchain had been changed to include $(HOST_DIR)/bin and
$(HOST_DIR)/usr/bin, but this change was not reflected to the
TARGET_PATH used in external toolchain configuration. This patches
fixes this.

We also remove $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin from the
TARGET_PATH in external toolchain configuration, since the STAGING_DIR
is not supposed to contain host binaries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7daa3b4..dfe4347 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -130,7 +130,7 @@ TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 #"))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-TARGET_PATH="$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
-- 
1.6.0.4
