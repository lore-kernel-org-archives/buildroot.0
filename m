From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Oct 2009 02:04:44 +0200
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external toolchain
Message-ID: <1256342684.28475.5.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Some time ago, an external toolchain improvement patch added
$(HOST_DIR)/bin and $(HOST_DIR)/usr/bin to the TARGET_PATH variable.
This patch also removed $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin
to TARGET_PATH which breaks the build of the WebKit package for
example.

WebKit depends on the icu package, and when configuring the package,
there is a need to run icu-config which is installed inside the
staging directory.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ccd7480..57bd6f5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -119,7 +119,7 @@ else
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ROOTFS_SUFFIX)
 
-- 
1.6.4.3
