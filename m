From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:10 -0800
Subject: [Buildroot] [RFC 4/6] core/pkg-toolchain-external: copy external
 32-bit libraries to staging
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-5-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use rsync to copy the 32-bit libraries from the 32-bit sysroot into
staging.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index d7cf97d170ca..0c5cd4b9f6d7 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -445,7 +445,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}); \
+	if [ "$(BR2_ROOTFS_RUNTIME32)" = "y" ]; then \
+		$(call MESSAGE,"Copying external toolchain 32-bit libraries to staging...") ; \
+		mkdir -p "$${STAGING_DIR}/$(BR2_ROOTFS_LIB32_DIR)"; \
+		rsync -a --exclude '*.a' "$(BR2_ROOTFS_RUNTIME32_PATH)/$(BR2_ROOTFS_LIB32_DIR)" "$${STAGING_DIR}"; \
+	fi
 endef
 
 ifeq ($(BR2_ROOTFS_RUNTIME32),)
-- 
2.7.4
