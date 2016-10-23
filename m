From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:04 +0200
Subject: [Buildroot] [PATCH 03/30] toolchain-external: pass arguments CROSS
	to install wrapper
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As soon as the external toolchain infrastructure gets introduced in a
future commit, the TOOLCHAIN_EXTERNAL_CROSS will be provided by the
external toolchain package using <external-toolchain-name>_CROSS.

This commit prepares the transition to the external toolchain
infrastructure by passing CROSS as function arguments.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4dde91e..6e4a961 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -739,9 +739,10 @@ endif
 # used. However, we should not add the toolchain wrapper for them, and they
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
+# $1 toolchain CROSS
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)cd $(HOST_DIR)/usr/bin; \
-	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
+	for i in $(1)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
 		*-ar|*-ranlib|*-nm) \
@@ -792,7 +793,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
-- 
2.5.5
