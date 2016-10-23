From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:05 +0200
Subject: [Buildroot] [PATCH 04/30] toolchain-external: pass arguments CC,
	CFLAGS, INSTALL_DIR while installing gdbserver
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As soon as the external toolchain infrastructure gets introduced in a
future commit, the TOOLCHAIN_EXTERNAL_CC and TOOLCHAIN_EXTERNAL_CFLAGS
will be provided by the external toolchain package using
<external-toolchain-name>_CC and <external-toolchain-name>_CFLAGS.

This commit prepares the transition to the external toolchain
infrastructure by passing CC and CFLAGS as function arguments.

The gdbserver install function needs a third argument to provide INSTALL_DIR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 6e4a961..46134f2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -640,16 +640,19 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 endef
 endif
 
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+# $3: toolchain INSTALL_DIR
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
 	$(Q)$(call MESSAGE,"Copying gdbserver")
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
 	gdbserver_found=0 ; \
 	for d in $${ARCH_SYSROOT_DIR}/usr \
 		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
 		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
-		 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
+		 $(3); do \
 		if test -f $${d}/bin/gdbserver ; then \
 			install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
 			gdbserver_found=1 ; \
@@ -803,7 +806,7 @@ endef
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$(TOOLCHAIN_EXTERNAL_LIBS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS),$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
-- 
2.5.5
