From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:49 +0200
Subject: [Buildroot] [PATCH v2 04/23] toolchain-external:
	TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER: use arguments
	instead of global variables
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new external toolchain package infrastructure will be introduced in a
followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
will no longer exist. Instead, each external-toolchain packages will
provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.

So additional arguments are needed to provide CC, CFLAG and INSTALL_DIR
when calling TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: rework commit log/title (Arnout)
---
 toolchain/toolchain-external/toolchain-external.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 84b6a03..6ae4bf5 100644
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
@@ -811,7 +814,7 @@ endef
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
