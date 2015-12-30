From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 30 Dec 2015 15:33:35 +0800
Subject: [Buildroot] [PATCH] toolchain: copy the libc for current FLAT
	format to the default lib folder in the sysroot
Message-ID: <1451460815-26081-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

The libc for the shared flat and share flat with sep data formats are put into
different subfolders in the Blackfin toolchain lib path. In order to link the
application with proper libc, copy the libc for current FLAT format to the
default lib folder in the sysroot.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8a9ea88..97f0919 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -599,6 +599,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	fi
 endef
 
+
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
@@ -616,7 +617,16 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
+	echo "PATH=" $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} ; \
+	if test "$(BR2_BINFMT_FLAT_SHARED)" = "y"; then \
+		$(call MESSAGE,"Move the Blackfin share flat lib into the sysroot...") ; \
+		cp -af $(STAGING_DIR)/usr/$${ARCH_LIB_DIR}/mid-shared-library/* $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} ; \
+	fi ; \
+	if test "$(BR2_BINFMT_FLAT_SEP_DATA)" = "y"; then \
+		$(call MESSAGE,"Move the Blackfin share flat lib with separate data in the sysroot...") ; \
+		cp -af $(STAGING_DIR)/usr/$${ARCH_LIB_DIR}/msep-data/* $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} ; \
+	fi
 endef
 
 # Special installation target used on the Blackfin architecture when
-- 
1.7.9.5
