From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Apr 2016 20:03:07 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add gdb wrapper that
	automatically passes the gdbinit file
Message-ID: <1461952987-20954-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Buildroot already provided a gdbinit file to set the right sysroot, but
required users to pass this file explicitly when invoking gdb.

Make the process a bit more user-friendly by creating a gdb wrapper that
passes the gdbinit file to the real gdb program.

The code needs to take into account several cases (internal toolchain,
external toolchain, ...) because the name and type of the real gdb program
differs.

The documentation is updated to reflect this change.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
v2:
- use "$@" instead of $@ in shell wrapper
- update release in manual to match 2016.05

 docs/manual/using-buildroot-debugger.txt           |  7 +++--
 package/gdb/gdb.mk                                 |  2 +-
 toolchain/helpers.mk                               | 36 +++++++++++++++++++---
 toolchain/toolchain-external/toolchain-external.mk | 10 +++---
 4 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index b5063ca..c3a1215 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -35,7 +35,7 @@ Then, on the host, you should start the cross gdb using the following
 command line:
 
 ----------------------------
-<buildroot>/output/host/usr/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+<buildroot>/output/host/usr/bin/<tuple>-gdb foo
 ----------------------------
 
 Of course, +foo+ must be available in the current directory, built
@@ -43,8 +43,9 @@ with debugging symbols. Typically you start this command from the
 directory where +foo+ is built (and not from +output/target/+ as the
 binaries in that directory are stripped).
 
-The +<buildroot>/output/staging/usr/share/buildroot/gdbinit+ file will tell the
-cross gdb where to find the libraries of the target.
+Since Buildroot 2016.05, the above gdb program is actually a wrapper script
+that passes a gdbinit file. The gdbinit file tells the cross gdb where to find
+the libraries of the target.
 
 Finally, to connect to the target from the cross gdb:
 
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 0a7af1e..5edb1aa 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -187,7 +187,7 @@ endef
 
 HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
 
-HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
+HOST_GDB_POST_INSTALL_HOOKS += setup_gdb_wrapper
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d28a2ca..be649f3 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -387,8 +387,36 @@ check_unusable_toolchain = \
 	fi
 
 #
-# Generate gdbinit file for use with Buildroot
-#
-gen_gdbinit_file = \
+# Create a gdb wrapper that sources a minimal gdbinit file. We don't need to
+# create a gdbtui wrapper because that one actually calls gdb.
+# For internal toolchains:
+# - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
+#   $(TARGET_CROSS)gdb ( == $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb )
+# For external toolchains:
+# - if BR2_PACKAGE_HOST_GDB is not set, gdb is provided by the external
+#   toolchain and $(TARGET_CROSS)gdb is a symlink.
+# - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
+#   $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
+#
+define setup_gdb_wrapper
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
+	if [ -f $(TARGET_CROSS)gdb -a ! -e $(TARGET_CROSS)gdb.real ]; then \
+		gdb_wrapper=$(TARGET_CROSS)gdb ; \
+		real_gdb=$${gdb_wrapper}.real ; \
+		mv $${gdb_wrapper} $${real_gdb} ; \
+	elif [ -L $(TARGET_CROSS)gdb ]; then \
+		gdb_wrapper=$(TARGET_CROSS)gdb ; \
+		real_gdb=`readlink -f $(TARGET_CROSS)gdb`; \
+		rm $(TARGET_CROSS)gdb ; \
+	elif [ -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb ]; then \
+		gdb_wrapper=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb ; \
+		real_gdb=$${gdb_wrapper}.real ; \
+		mv $${gdb_wrapper} $${real_gdb} ; \
+	fi ; \
+	if [ -n "$${gdb_wrapper}" ]; then \
+		echo "#!/bin/sh" > $${gdb_wrapper} ; \
+		echo "$${real_gdb} -x $(STAGING_DIR)/usr/share/buildroot/gdbinit \"\$$@\"" >> $${gdb_wrapper} ; \
+		chmod +x $${gdb_wrapper} ; \
+	fi
+endef
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2422b6d..b964d73 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -741,12 +741,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 endef
 
 #
-# Generate gdbinit file for use with Buildroot
+# Generate gdb wrapper and gdbinit file for use with Buildroot
 #
-define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+define TOOLCHAIN_EXTERNAL_INSTALL_GDB_WRAPPER
 	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
-		$(call MESSAGE,"Installing gdbinit"); \
-		$(gen_gdbinit_file); \
+		$(call MESSAGE,"Creating gdb wrapper and gdbinit file"); \
+		$(setup_gdb_wrapper); \
 	fi
 endef
 
@@ -771,7 +771,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_GDB_WRAPPER)
 endef
 
 # Even though we're installing things in both the staging, the host
-- 
2.7.3
