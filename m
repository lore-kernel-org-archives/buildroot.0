From: Jonas Zaddach <jzaddach@sourcefire.com>
Date: Tue, 10 Apr 2018 12:37:22 -0700
Subject: [Buildroot] [PATCH 1/1] package/gdb: don't remove support files if
 python chosen
Message-ID: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If one wants to use GDB with python support on the target, you need the support
files installed by GDB. These get usually deleted to save some space, so I just
wrapped the Makefile code deleting them in a conditional block depending on if
python support is active or not.

Signed-off-by: Jonas Zaddach <jzaddach@cisco.com>
---
 package/gdb/gdb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e86ba0..5c915da 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -164,11 +164,13 @@ endif
 
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
+ifneq ($(BR2_PACKAGE_GDB_PYTHON),y)
 define GDB_REMOVE_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
 endef
 
 GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
+endif
 
 # This installs the gdbserver somewhere into the $(HOST_DIR) so that
 # it becomes an integral part of the SDK, if the toolchain generated
-- 
2.7.4
