From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Mar 2014 22:41:24 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: generate a gdbinit file
Message-ID: <1393969285-13984-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit slightly improves the external toolchain backend, and the
gdb build logic to create a file named
$(STAGING_DIR)/usr/share/buildroot/gdbinit which can be used as a
gdbinit file using gdb -x option. This allows gdb to automatically use
the proper sysroot to find libraries.

The initial insight for this patch comes from the report of Oded
Hanson <OHanson@xsightsys.com>, who found an issue with the Eclipse
Buildroot plugin, which was setting a solib-path in gdb, but not a
sysroot. Setting a solib-path was enough to find shared libraries, but
not the dynamic linker. And since Eclipse doesn't allow to set the
sysroot in any other way that giving a gdbinit file, it makes sense to
have Buildroot generate a gdbinit file (which was be used in other
situations than Eclipse).

To achieve this, this commit introduces a gen_gdbinit_file helper in
toolchain/helpers.mk, and uses it for the internal toolchain and
external toolchain backends.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk                                 | 2 ++
 toolchain/helpers.mk                               | 7 +++++++
 toolchain/toolchain-external/toolchain-external.mk | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 69fb3ba..678c17c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -126,5 +126,7 @@ endef
 
 HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
 
+HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 64d5095..668a737 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -356,3 +356,10 @@ check_unusable_toolchain = \
 		echo "such as Buildroot." ; \
 		exit 1 ; \
 	fi
+
+#
+# Generate gdbinit file for use with Buildroot
+#
+gen_gdbinit_file = \
+	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
+	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 378e7b2..b45504b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -617,6 +617,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 endef
 
+define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+	if test -f $(TARGET_CROSS)gdb ; then \
+		$(call gen_gdbinit_file) ; \
+	fi
+endef
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
@@ -625,6 +631,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
 $(eval $(generic-package))
-- 
1.8.3.2
