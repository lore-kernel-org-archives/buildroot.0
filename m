From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 12:04:35 +0200
Subject: [Buildroot] [PATCHv4 3/4] gdb: install gdbserver into the SDK
In-Reply-To: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365329076-19853-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for a Buildroot toolchain to be usable as an external
toolchain, we should copy the target gdbserver somewhere into
$(HOST_DIR). In order to match what Crosstool-NG does (and therefore
to match something the external toolchain logic already understands),
we install gdbserver in
$(HOST_DIR)/usr/<tuple>/debug-root/usr/bin/gdbserver.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This replaces http://patchwork.ozlabs.org/patch/229438/
---
 package/gdb/gdb.mk |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 24ce9bf..cec64d5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -78,6 +78,20 @@ endef
 
 GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
 
+# This installs the gdbserver somewhere into the $(HOST_DIR) so that
+# it becomes an integral part of the SDK, if the toolchain generated
+# by Buildroot is later used as an external toolchain. We install it
+# in debug-root/usr/bin/gdbserver so that it matches what Crosstool-NG
+# does.
+define GDB_SDK_INSTALL_GDBSERVER
+	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
+		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
+endef
+
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+GDB_POST_INSTALL_TARGET_HOOKS += GDB_SDK_INSTALL_GDBSERVER
+endif
+
 # A few notes:
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
-- 
1.7.9.5
