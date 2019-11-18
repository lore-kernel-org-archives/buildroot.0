From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 18 Nov 2019 11:00:47 +0300
Subject: [Buildroot] [PATCH] toolchain-external: Introduce gdb_copy option
Message-ID: <20191118080047.22036-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some prebuilt toolchains provide full gdb debugger for a target as
well as gdbserver. Lets add separate option for gdb the same way as
it was done for gdbserver. With this change there will be no need
to build gdb package, this will reduce build time.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 toolchain/toolchain-external/Config.in             |  7 ++++++
 .../toolchain-external/pkg-toolchain-external.mk   | 25 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 128bea257e..b20ce93100 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -162,4 +162,11 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
 
+config BR2_TOOLCHAIN_EXTERNAL_GDB_COPY
+	bool "Copy gdb to the Target"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+	help
+	  Copy the gdb debugger provided by the external toolchain 
+	  to the target.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 1c43409514..c400b46590 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -430,6 +430,30 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
 endef
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_COPY),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDB
+
+	$(Q)$(call MESSAGE,"Copying gdb")
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	gdb_found=0 ; \
+	for d in $${ARCH_SYSROOT_DIR}/usr \
+		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
+		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+		 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
+		if test -f $${d}/bin/gdb ; then \
+			install -m 0755 -D $${d}/bin/gdb $(TARGET_DIR)/usr/bin/gdb ; \
+			gdb_found=1 ; \
+			break ; \
+		fi ; \
+	done ; \
+	if [ $${gdb_found} -eq 0 ] ; then \
+		echo "Could not find gdb in external toolchain" ; \
+		exit 1 ; \
+	fi
+endef
+endif
+
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
@@ -591,6 +615,7 @@ define $(2)_INSTALL_TARGET_CMDS
 	$$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
+        $$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDB)
 	$$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
-- 
2.16.2
